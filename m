Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C3CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esJo28OzCIzqIDTpZgHYS7B/i93tmxeKXgnc/pRi6CE=; b=ay4anHaX3P7Kd8PPa7yHjplgPT
	sjPxUcLyIoSVL1J6K9L5d+mYIbChrGKi5Qtp5Em54iWKNMSx1rC94L1Xhz9ymVxHBMABx9K9rwFUt
	AjzgAi9mQnaLTxyJ0nMUaYlro2uemYNTjW4LqIZoxsyRs4akdJCPmDNtzbViGi3TmeoIlVkll5Ydw
	w+LUIA3V/852D5MZPAYXR342SkwTJLwwp4/G8c0CZXSCt8IHJU3B/LBM/Q7+p7rvLA5Vc1++ZIpxD
	5QMkYn+WP5ASd9FDF2MbmcRxKnYo/G/471lQ20tyyro7VpC2S8UHamLy0oM1IQOW8Ub94hKM3XaQ/
	m8vwg5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCRw-0000000Fi8s-3B1U;
	Tue, 05 May 2026 09:52:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCRu-0000000Fi70-2DVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3136244597
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CADC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974738;
	bh=cpIFIXhpqMMG5+sMrNERuIyu7U4UcLZK/Q47PKcgdqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fNRi7nTupnxh5eSmRIio74kd+u5Vi2OF5cS7v9YWXVI+NRSd+RWC3uNy5BSPWBKv/
	 105hKSvTQf+T+t6rdNCbl+rFx7Y+wzmdmYyzThe4DjSW12WGRSGCJbWS4L7CXTX14m
	 IU5WL2Pb8lzVuInCq2azdC77srFCZLlqlDzFQgDUuiV4cs2oGADWARj2V7JQ0b19Ut
	 Ha3K7JWCbfDa7nYL5hL3tj4VlQ09B+jhQEv8VqbJdQCDxPho8ymzkz5i0dWEgPFvgW
	 DTl2uHiUMoKq/H31oePPEYOBUnn3pTQbTX1nUfHm2FXUK6hocVlleKmRVRz1bjjKOb
	 J/cJfwnoc1CxA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso4283347e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xOo1VmlYTW6ikeRIQb1h6f/oVTFj0AnCWXGWCOy+zA+j1qIXRJSEeD0RCC4ui402W1Vj4zNK3rXjG2dPn7qHX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Ifkm6sRy2pwu90zLtWLpQm6TjK4SHbTiq0ljnjW8l9ZJBuSp
	fQcFSQceLE0uE7HsJ8ewAynLR0QhbBqscHFdqRuw4wRGgmiVd9qOpGAMlr0a02EtHt7xKTwfBjr
	CmZizv6/d1BeCDHQ26Sz48alutwKieFY=
X-Received: by 2002:a05:6512:33c1:b0:5a8:63e1:af06 with SMTP id
 2adb3069b0e04-5a87f1dae3emr1048945e87.23.1777974736749; Tue, 05 May 2026
 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com> <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:52:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjOzfP5MLB0wuOUouM3keE1osBEJ+PWC84dwtd6h4SOg@mail.gmail.com>
X-Gm-Features: AVHnY4IFYFYkhZ8oq3rAOzmlf9lv-MvlXK4ZwfeKAdZXsIKlgyz53yxEXQ0V6No
Message-ID: <CAD++jLkjOzfP5MLB0wuOUouM3keE1osBEJ+PWC84dwtd6h4SOg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: Switch Ethernet drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_025218_603608_2376BB0F 
X-CRM114-Status: GOOD (  21.44  )
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

On Wed, Apr 29, 2026 at 8:50=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Development of Linux kernel progressed over last 10 years and it is easy
> to generate now initramfs for building own kernel, e.g. with Yocto or
> mkosi.  Therefore for a few years of reviews on mailing lists, all new
> options enabled in arm64 defconfig were with assumption of having
> initramfs which can load bare minimum of modules to mount filesystem
> from network or disk.  Basically network driver as built-in is not
> anymore essential to boot the system, so switch almost all Ethernet
> drivers to modules to save on kernel image size.
>
> Similarly 9P network filesystem for QEMU, especially that testing kernel
> unuder QEMU does not have any size or build process constraints and can
> use initramfs with -initrd argument.  Note that having network drivers
> does not break NFS root, because whatever loading method, e.g. TFTP,
> which brought the kernel image can bring also the initramfs with network
> adapters (and I have been using such method for years for my Samsung
> boards).
>
> Notable exceptions / diff explanations:
>
> 1. Mark I2C as built-in, used by CONFIG_IGB as a module.
>
> 2. CONFIG_BCM4908_ENET and CONFIG_BCMASP appear in the diff, because
>    they were default=3Dy (via ARCH_BCMBCA or ARCH_BCM_IPROC).
>
> 3. CONFIG_HNS3_HCLGE and CONFIG_HNS3_ENET are removed, because they are
>    default=3Dm.
>
> Moving code to modules has positive impact on kernel image size, thus
> boot time of all users not using above drivers and ability to flash
> fixed-size boot partitions.
>
> Old Image size: 41.2 MiB (Image.gz: 14.8 MiB)
> New Image size: 39.1 MiB (Image.gz: 13.8 MiB)
>
> bloat-o-meter of vmlinux:
> add/remove: 3/6972 grow/shrink: 6/45 up/down: 66659/-2333659 (-2267000)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

OK it's probably the right thing to do, no reaction from the netdev
people so let's go.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

