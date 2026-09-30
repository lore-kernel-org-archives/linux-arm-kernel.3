Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF839CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfaOqUAKpuFYnsIVHOrJ/0TiRDwiEAdiDk5roFX7nBE=; b=vVXn0JVmXe+SlQWTY9psK1LNjM
	MFBbAosyljQ492MBtkb9mvtjaAGLibU6jKuWwCaJojj6Q1bAchl+WwSMGe7mZKUA5/OiXSt5+IGlA
	X33bCCv9k9Lw+4oaXOwpSw1qmO8FBsIKRqBWmrurekKnNn/SUjnm41BxMd3L8Zg/CMByQqQWmbpam
	rMIRj+919jBVFt7O9ZQeOxvK6muYL8H0E0+VQJsRpxxotORxpo9IEi6ktYSTqJTgSpgYVgfo7GpyP
	slzh1M02nnoWNXgfliGB4JoMRk637f2zWg6YEnaWUlFyddSre1D2B0lntmM/6vxvgHAbHZlMAiQhs
	QjSaHnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr6f-00000005dpy-1F0p;
	Wed, 30 Sep 2026 10:00:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBr6b-00000005dod-0wKB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01F9443FC1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6E01F00893
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762404;
	bh=EfaOqUAKpuFYnsIVHOrJ/0TiRDwiEAdiDk5roFX7nBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=muIFYUABjvVKsuiM3VBK55HhCAl+mC0Uikqx4GPkxeWHxqibglMVZjsEthv2ZS+3e
	 AUhs7Dsb5LGjbHoWTADLFwi6PS2TUpgK3/78Xe8eMbUdKN539B2sJYH9aPU5Iz4Qy7
	 dOy8ABR4lDoPUjf2w4lq29/TV+Jabnsvm4baPAWqFCZHtGs1oSdU9ApeiXO6wwIKiq
	 d/eiE3Q0EFMLgqKhfEzFze6+2VxEFdqGVAVx8bPa+CdzAv+j59rjCpEUcp9T+ExYO2
	 K3mbINZW+Is+H0dic4Yv0CZbYYeAlCZEAkEOeWBD8H6PaVXghSyTHFPuf/eGSy4H+W
	 FvGcKLHCaVphA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a779b23f05so3047201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMbuVdpI1pJEa1LMexhWF8/qyVGXTumfKVUDuwyiKWBNDMxRqhKgntSJg8UrcUbcLBl9ZE0i+ifVX9OgqQwxMz@lists.infradead.org
X-Gm-Message-State: AFq9FYLUtxtR7jJR9EvR49Dlz1sllGgwZl+Tuqwa1R/8cs0Wm64f5ycw
	BuShLbvzRARzAdiBTlFSlmY84HXZwWfqS9nxT0MRX4a9gvQDI80Z2Pak2KgjE/6YRZ08SMyo3J6
	r4e2APidYd6mKK7tMvUs9pSfnlyvM1mI=
X-Received: by 2002:a2e:bc1c:0:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a77919076dmr3451661fa.6.1790762403440; Wed, 30 Sep 2026
 03:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-3-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-3-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:59:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmqvjJUgFBtERvtkO_+=m60ag1UC-ZOAdo8_7X3cERKYA@mail.gmail.com>
X-Gm-Features: AclHuK_48zLXL0KDLF2JWFOLuk9UnViCs077-v6ZyB7fHZb2R7O5ZT3ShI4k8r8
Message-ID: <CAD++jLmqvjJUgFBtERvtkO_+=m60ag1UC-ZOAdo8_7X3cERKYA@mail.gmail.com>
Subject: Re: [PATCH RFC 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> On the CS7542 the bootloader parks the secondary Cortex-A9 core in a loop
> that waits for an event and then jumps to the address found in a global
> software register. Add the "cortina,cs7542-smp" enable method for it and,
> as with the other release-address based methods, require cpu-release-addr
> to point at that register.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

