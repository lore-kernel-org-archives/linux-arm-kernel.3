Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E90CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 10:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nS8Ts8KSRG2vQuHvekO6rd7X3fmpzHzrbSQkhP+dsY=; b=xp7tCO/VihgVYRF5TkHpCgycg6
	/L8O5cvnwR9smd7mA003n8fq8oBvpNy1YLRll4PdFtTIdb2TONDchbcXXsSXslPC92l04pO8U7OJ6
	4qNxCm4hWCFldqXg0LvT9XvWASDjyzzR6AjrBg0qWCt7zo3SAn2fyySjJo9bXIZOyJVnQBm1YdXCS
	Znmcxta1qFAHxf9pCmGNvG5DjNg+WCf4zBrAdlSEx7hmJXEyq6vq1046rEZEXCtn51zsk24rcQoBs
	jCG5YGFj0mqc3WyHM72DrfcS0Z47yve6uwuWe2hvQHutBW623k+WXAHGpwoA3hEM6NNJkXyWh5J5m
	cVFKYYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPe0b-00000004J71-1bt1;
	Wed, 20 May 2026 10:18:39 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPe0Y-00000004J6M-1wOO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 10:18:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 02122EC0080;
	Wed, 20 May 2026 06:18:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 20 May 2026 06:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779272310;
	 x=1779358710; bh=3nS8Ts8KSRG2vQuHvekO6rd7X3fmpzHzrbSQkhP+dsY=; b=
	pyC+i/15ROtnyX3LHnpGI5mufGfEYCiFWenPwNyz2OMDYmklKtUKzyJHjAZoxYm/
	UccuN1xO6w7WQQCX/oYQRTThc2coYO778xlkgIz3tf5OL1yapDF4w0Mp3V+eLiVi
	Ja4TRF2Tfu4o8RY7a+A38wZucAj+I5IEK21ecuhvppj8pJFI9lx/kevm/l3U2jv2
	oV5+RhA7Y11y19b09j6v2gjGNjCupnoZ392g7HUT1033OJsb6NJuY7c8q4lQnpMQ
	XUIZKZ9lX1uhZaZQDbnOo4z9+Z5VFgaB9ikIyo8PrhltASwAmw7ibpAhEZINwkyI
	KTsXynAzeZZLgWtdOZFrew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779272310; x=
	1779358710; bh=3nS8Ts8KSRG2vQuHvekO6rd7X3fmpzHzrbSQkhP+dsY=; b=c
	QQ1cMIxRHm0gQY6CVHzAqtfpT5MRebghLz4m3ABJCdzYuby05X+JT8rt7QeDKyNb
	LthQ65L6CvOlgrwVXmEt/2k/nJ05krl+8x3QV7D1SuvarbXfhF4ItRT3o+U8612d
	I2vgXz2LZTkVgHHS4Y51ffd1eVUt6yOHqmNcfxWkVV1KQLrJ7aLM5fIAgr4B9kqR
	SW6sbqsYzwZQyg84ZVhC2z8lyinruXFsqFOhVHndyiypxuMpp7GGXt14fgrvQkQx
	blAJYaB6hRGO8PRMMheVrM7wbStDWwkCcQwtpVMicBEhZYiqciECCRRxt2vGYEEa
	SNrTO5n6ViPqzGtVxm+cQ==
X-ME-Sender: <xms:dooNalUo16K4g3GN-KBVokYqPnSYW6biHFTVvPMww1NOFByqRo6qbw>
    <xme:dooNagZew2MXjjgACKmjsiTSzvwBrfzfQ_QMKOqD2Pe4dxCp0w6pZFfT45jwZL9wH
    uysU7oYqXdKgaOtd-If2Jf2RRB_KxrzKRCKhIdeEUL1GPdQHPFq6Bo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesoh
    hsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:dooNar4Vq2fje93P698E0-H3KRHxofHx0LhrSUh1nFyJIrattN1b_g>
    <xmx:dooNav_w8TY0VZE70m18eRSscG82OizNrFi6-Cdu6Opb8qp1WBxBgg>
    <xmx:dooNaop0KaQstEGUmTXoEDhm_YrxT54JnT8NB2_KwyeCMDwvCPJvsA>
    <xmx:dooNaoq4e7TBXjp-AmDUgdJEbznkgPAmm7AJfqhzpZGN9Lzop81eOA>
    <xmx:dooNam3MTP1bENd4Bqg_XbYHlrwe1-sA_Y5OtZ20ChxGlR0v5bngJErj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B9F09182007E; Wed, 20 May 2026 06:18:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AsEOlqlCkKK-
Date: Wed, 20 May 2026 12:18:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <b1abd44e-d4eb-4b74-8a8e-ea08bb2db86e@app.fastmail.com>
In-Reply-To: <CAMRc=Md5wDV+w7awoiiBoFVG24VEfH8hKvH2VP7dtcRX3m-Wnw@mail.gmail.com>
References: <20260430143221.108382-1-bartosz.golaszewski@oss.qualcomm.com>
 <CAD++jLnm2sPEQQ7cN9Ci+jhNfB=WC2g=36d_N4upyxYUsmN6dg@mail.gmail.com>
 <CAMRc=Md5wDV+w7awoiiBoFVG24VEfH8hKvH2VP7dtcRX3m-Wnw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: Kconfig: drop unneeded dependency on OF_GPIO for
 ARCH_MVEBU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_031835_022099_B4823165 
X-CRM114-Status: GOOD (  12.16  )
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

On Wed, May 20, 2026, at 10:32, Bartosz Golaszewski wrote:
> On Tue, May 5, 2026 at 12:42=E2=80=AFPM Linus Walleij <linusw@kernel.o=
rg> wrote:
>>
>> On Thu, Apr 30, 2026 at 4:32=E2=80=AFPM Bartosz Golaszewski
>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>
>> > OF_GPIO is selected automatically on all OF systems. Any symbols it
>> > controls also provide stubs so there's really no reason to select it
>> > explicitly. ARCH_MVEBU already selects GPIOLIB, drop the redundant
>> > OF_GPIO dependency.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
>>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>>
>
> Arnd, can you please queue this directly for v7.2?

Done, thanks for the patch!

    Arnd

