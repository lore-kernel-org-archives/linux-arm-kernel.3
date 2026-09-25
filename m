Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC56C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZ4tp2eoIotFzdh0KT5kqPmQquJ1TlPLTl8eKwffrqI=; b=jprXhpsqEjFDZPEcrEqkwRv1SK
	J0pj6GjfSEszuc5N3lBNHIGJJnungUNCXho9Y+56TujOySm9SE0MO1XnAV1fsQpYBvlbKYzUkaC/3
	c7X45seo9RJuxHAbbnsqP4NlwTm3zQIhIEl0L9jTB0v0Vy/AxCwN2iGJLUGRAORzcHJNxBtymUxvb
	APAlZITiRIU6CcQdlg2jg3j3eU2ufz/KJx6VReDXkwT6JqlJQ15MNWUNoI3JeZ8QVCoul1OZRzWIv
	U4GOxZ2HB3/QBUOC5lM1Df/RSEUIcowFI4pjLWNQJYGbNnNtJ5PQSBDv3XrSZb4FLetZNZuB5WShy
	hEWyjmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA61M-0000000DR0T-00Ae;
	Fri, 25 Sep 2026 13:31:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA61E-0000000DQx2-149V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:31:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE1846022F;
	Fri, 25 Sep 2026 13:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84D01F00899;
	Fri, 25 Sep 2026 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343075;
	bh=VZ4tp2eoIotFzdh0KT5kqPmQquJ1TlPLTl8eKwffrqI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=lRUrwpGcqS1kuxeDagQfJeuE/MLm7JBNkzmNXz4q/V9qZuJsfE56cE4WXHuYv79Q0
	 BX+ew66MF/P8nFqG1f8hmm9cWegfMqJ5rk43bW+6bTPmfKN+J69FQQkDYOKiOs8r3C
	 9giQhjy7hF201aEYxi5gOVMEK1HPCc3W6PBbJGBaZep7j8/qK7g3i1i8sFiOrUT7c2
	 shfEn3D95+tik8rcMJRLFOxUeLgIBR0ds8rDCCZBQiisbJmp1b3LwmdPevk4tKxbsL
	 b3qaltRurA4tc32zaNmKNZY960FTwqguB/5o0BWXJhr3lPYXFw4JRT0zOddjvYdEkJ
	 gTTSALYMAU58A==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0FBC3198003A;
	Fri, 25 Sep 2026 09:31:11 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 09:31:11 -0400
X-ME-Sender: <xms:mXe2auaDmvXz_ZbNQ5IUJUvYulOdkwXsiDPPm9R48nIri4QEnP-RXQ>
    <xme:mXe2asOg4Uw2Voj5roTOu2w_3W42g94Ku9M-KmHxhBE3eG4CeOWlhUOj3UPC7XS4M
    9AedKEJpZ2v7g91WPnKPBRLHfpSmkbITrWurBoh578CH7n78bedTURj>
X-ME-Proxy-Cause: dmFkZTEMF3/5tb6mz+ib9V0nff9NPmGPtWKkpNVahF43RJATx7iiAV9mOQ1UX28wOiLXG6
    jf7rcb1V5l5VxL6pbRzDh96fda46eQgCweXFg/XRm3wMx1Gd8rI5l0Wpz0HzoF3Sg3N81s
    R4dklUgOcIrqDzQzHPK3FWNsqerTynZIDmUQlFBSG1fhgmFPWVd88BfpDvD2ONNOlL6PD9
    RcHqYFkv7x72ewz577x/8VfmX9Ufo1EBw8Z+mbiQl4pkbAnujHjV6DVJFwda6p4IF/G2s3
    l55ZGhXkHxZH5BOeGYioJ+Rj4P+N1ARQs3Wu1hFMJzXC8LIqRkqnq10fB/tdxU48g6eNtV
    e9i6AdN9NTKtwRMswwiyiGxRi/JrcPEvipCWJjq/jROH81UrjeleKirf4Gx2sFYKpFpfr1
    +zCPn+1f1n8WyT1uCJPh12A9tlq1/+ig4PkNjvRrU1v/bq1jzksE3Q4YSfMmI3+N1sHjxO
    +I14IciFlV8OotFodD/QjTFbodk/ydtL2awqThW45gMwuMWu3qsonxCbATLJOLkpFh47tz
    DI0doApvsSc6lUU4nZx6rQVDX0cuFg9MLivKCF9qAPsbPFj3UqWsniE2xBiFBCmGops4wb
    FCBJRZT8VeLHluNTUQYK0XUhIRAzAmRkje4/l6jZQeuN1L3mP3bFdUMlg3Bw
X-ME-Proxy: <xmx:n3e2avHuUEcObNIoXGXVULzB97Xau8XE8vbJcgFkzf51IoPHIRupTQ>
    <xmx:n3e2amAl2zXKBFcjb666kOEFcfSb9IpKzDE3DruVAa_Ce6q74zpaWQ>
    <xmx:n3e2agdrxIVQyzKCNUhwZmr8flkKS885KQsk50KkuswdLVkPVPChcg>
    <xmx:n3e2alL6PjnwBM2Bm0Hu7ue0PGlyLpdDhyRJNNYTtkaynBlirqyLAQ>
    <xmx:n3e2apuVFjFjdTqRYxaqTId9GBDBlwAuBz3cn8VWRF4pO6kRWeP01-bN>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 36A15F80080; Fri, 25 Sep 2026 09:31:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 15:30:44 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "David Sterba" <dsterba@suse.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Mark Rutland" <mark.rutland@arm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Simon Glass" <sjg@chromium.org>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Nick Terrell" <terrelln@fb.com>, "Will Deacon" <will@kernel.org>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 linux-integrity@vger.kernel.org, "Palmer Dabbelt" <palmer@rivosinc.com>,
 patches@lists.linux.dev, "Ross Philipson" <ross.philipson@gmail.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Song Shuai" <songshuaishuai@tinylab.org>
Message-Id: <74197f6b-2ac3-43f3-804a-91e4041da20f@app.fastmail.com>
In-Reply-To: <20260924235031.GE9354@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
 <4-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
 <20260924155307.00007dfc@oss.qualcomm.com> <20260924235031.GE9354@nvidia.com>
Subject: Re: [PATCH 04/16] vmlinux.lds: Move DATA_LE32() from arm64 to the common
 linker script
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On Fri, 25 Sep 2026, at 01:50, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 03:53:07PM -0700, Jonathan Cameron wrote:
>> On Thu, 24 Sep 2026 10:53:07 -0300
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>> 
>> > Other arches may want to use this to get consistent fixed endian output.
>> 
>> You will have to grab it quickly!
>> https://lore.kernel.org/all/20260918145217.1669-10-will@kernel.org/#Z31arch:arm64:kernel:image.h
>> drops that definition as part of ripping out arm64 big endian support.
>
> Ah, well easy conflict resolution then :)
>
> When I was doing this I was really doubting why it had to be endian
> specific, this is mostly a cargo cult from the other stuff that was
> already working that way..
>
> I'm personally skeptical any arch could have either EFI stub a
> different endianess than the vmlinux, it seems like nonsense on alot
> of levels.
>
> So, I will remove the fixed endian pieces from here? Does anyone think
> otherwise?
>

Booting a BE kernel from EFI has never worked so no need to start caring
about it now.


