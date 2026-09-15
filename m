Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B06C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=; b=WoVYvUwZ7XQfSOMyeH4eHEc+d9
	9kHZC67DpIU4ZGs+XPTQYXZBWrCCjTBok9psCdh4CRhYZ8RW4cY/cFPF0BXvynE7vjZdYWQJDF0Ah
	xZv3TmqBeSGzpeyLdcCQk48PRTUENsFfCElN3I3NrEyZtMvSHp5jmMzsxxxWpnxfTT4Lm+1V0l4jT
	1SoMng+2+79rNngp5xyNcgJD2dfqgHW7bZINtSgTyNHBx6IqBo+gk7VtzRGnvrXCIVyOFdAQPhXjF
	trV1lwK/AQzk/0u9JyTBJw/MgsVjayYOdYx61vXPNpGToV2GcxJQrmpH5mcnUFaqG1peFx4YL5HNN
	tFC6/kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6c3e-000000082lM-3ZeK;
	Tue, 15 Sep 2026 22:55:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6c3c-000000082kN-3Tz5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 22:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=; b=CoT+JtrMijic3/aamEubT0JUc2
	oB2lvvxkGUnVMXsRVXGDHsDUiENUD1EcDI568nlpNZtqIRLJIp3rqeNnLf+1NyRP7CLhZHvX5dw0G
	IPfOwUwJuJuRFK5VzK3JGxU+g/FoGNespBtVPdmf6iCMZbglf3/G9HT/S4SP8IMHiFsicRNLZH1Vn
	HvxEgr9y4j3jTJfwfg5/Y3tz8yXiGR1xH8hiCNFqezjn1FAVlng/H0aWZPeXR+E8Q8aefFePuSr9f
	9n6q6CUT3Gqgb60UstmHghrvIpkLVyAAgFOKasy+/5DbHVcKu6UYRTvCn/WfvBxrs4NokiTZ5S3lK
	yuB6Sckw==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6c3Y-00000007J4p-1rdN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:55:19 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457294a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512915; x=1790117715; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=EvKwLc1ETbxdmzW8bW1hOgwiOI463QhnV+dKrji08mgFWR/79d641iBfgsKaHgiwsz
         8lUw0hCU3dSkuLJKjLbzVnrYB69ycuyjWKvpKIr4cdHolHHB/+xIg47hdnF4RzL83Lsg
         tQpa58VOzTCGyjQQXibnrdQUrQ0+1MaB0iiLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512915; x=1790117715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=XSsl0kHeqcU/u2OIEy+S9en8ev8CoBq8/YLEmZnEeDTJtzSwSLiwKtUVDTJivirTtQ
         7oV0WcsslCgjEo7lFHTzZ58HRMfBkxZTLCy53ejBUUzA7uwXCUuwwEjaGBKFLj7TgLBG
         E4/6d6gB7eob2RYlu7LnudsgUCuoWLO2bnDOI6FZRYnOJKUIs5XYyz52F7LhWZHtMA5a
         YYUGMA/7DMkfzjfBreaqdG1IoEkI/m8jkBc58zFqkFVv8L6Ix6LQS3w0aaDyGal2lG54
         ts9tSNI3G/W7ypOeIdn7oVT/BQWkmrroH6RfTcGvd3yp9tbdAyGK9rHAwdLqAuCShJwN
         e9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgChrUCWGGE2lTfnfZqFgGoYpgOmeF00HU9EmnWuMwHSew35VFqBxxGudPTz65qdjfEj52FwhWzrZC6g5pa2Fr@lists.infradead.org
X-Gm-Message-State: AFuF++nVAxxBv9ssKbOrepV3MfLq6tEaTOCTrPm7/Mbp1FI3rY0fJCpM
	arAyn+emzCgfxT3RRmRoww55+69uXV+uikYJaYBAnaf/mS+W6ZvottTotbJnL3pGSZ5tAMV9dJl
	zS9tvcU4A7g==
X-Gm-Gg: AYBFou0m3RGm6ziRnT8QfaNNIaB6KChO9PAaCH5pyfJHwvG9YnxYGx9aIdtcl2oj8Eh
	UlS78IW1gOmVEuXERZ0Ab+mJtCEE0oA2PrQ68AYVn7gE9QFLY/eE7tLgHd0WOjcXLJuPDIEsRD8
	UD67LM4f5rnCr0oKLdaULlKmSsN6Eb/ke+ubfYXmxU+4R66NEHMFsoefEUQYMQv3Q3x4GWXNu5z
	97rmeqFBMmMfbCkWc37iZVsAhrayTesoh1uQFyu2CP7s+MMr/oNK8r5Xzfr963+FfNAgiQSob8v
	cOY1AH7IKCY2qth/T75EnEWLquYtmInGDVVfQSOpP1ViaTUNCK/JnyeZyOcGGyfShaFpngYYk7m
	KOCsKDmy63SbMJDYWvdyTIj+QbSl4V995/E/xReum8Vu7V2RY7Nfi3apZjUiVTkPzrhHqKc4KYt
	QT8H/UalR6uW3mIzYj0t7uIo6wTxXPzM5SJqulpU7tajae24bdLOE60tfU1wrb6KHU2jAh8YBiD
	TK8yn36Ye0ya/NmjAqCiOCdAwLfrjqZq/DyZnWlJp052nmc
X-Received: by 2002:a17:907:1c91:b0:c29:62d8:68b8 with SMTP id a640c23a62f3a-c29e532b637mr7702866b.48.1789512915118;
        Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de652313sm32261666b.55.2026.09.15.15.55.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605844571so457269a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzc57ZJeBDSLIscDpl+B+dUY+UyFCnYXULV0/RUbbTeLPAiVgEkNPYUcqa/+wXnnp2fVZjgcuhnMIczJ1tigCMJ@lists.infradead.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_235516_645104_7D0BCB92 
X-CRM114-Status: GOOD (  11.16  )
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

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus

