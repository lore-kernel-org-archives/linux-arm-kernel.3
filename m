Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8336C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=; b=Pv0ERakRz2RBMDESPZU9m7YRjf
	W/7u6ESn+vdIQG8XIJ8n8bOKX0DLz2ajBQeXxh8L6hg3p3x6lLgMuN0IIteBaMdhDqTJ8LSwB3WLq
	zjoku9Mxt4ZhvE7/wPawIiYoiF60D0GsejJUX6bzw0ydpNNX3Unaj3sDJCl2e0u8kRoKNDq7Ir/br
	7o3l87wnn4AitLuppfYfZEV0O/Y5Lh7mJdsENvEid4Qu2bQXV8FDm+qlWSghV3IyZ52gqHCZBkT/l
	KXob64d6DHlaqqseOMdfWYVlR64zyHOTj6DVcFyGZf1wJIt4hLyabAwe1aC3G4B8MW4Vs9FGKTrXo
	t9jXjVHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIYE-0000000CAp6-1fEZ;
	Tue, 06 May 2025 13:41:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGEK-0000000BgtY-0x5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:12:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36753825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746529972; x=1747134772; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=;
        b=lMtAtBvvsNJkcg0mZEDNrV2P+gcyBsd1fHPf1I4WlWpJLbJho0Jl2clCOhPN7H1Y/s
         /IqBZZqHR+uXIWB9HTM5SfWxJ8Fb0X1msrrqkZN/pg6sgZRN4B6UjEkNmJeegTSJS/8e
         Xg4Yf+kWzulplFr8dySzQaB6zt0cGkGs6r1ccqrIvJKyabZEu40MTwIU0F4+v4X+F+6Q
         RhAjhejUfYz2Q7vRUNMpSU6LDXwyYON16crQ/MXaIsI0VER7pN0vIjBJ1kCdZuKxGjkb
         XbDjYwBJS1gm+3Z6nt1VORuCJahgpLDORZJA6cNyP4XSP8v7HoLCoJqnH0LgjQ0CiORv
         HzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746529972; x=1747134772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2rqsS+7CIPhwzmnA7i4FOO8hEThqmeuLPa/ESAe03U=;
        b=U0/ek1w4JsMyxVtd5LNk25uampt8hXAmDhgvI+l0OVChsCt5vef1qM5FA7az0W6b2+
         VXYHbxp55nEAnMHuKjEW46WRXXT1I6xsojOxGHiPOWsXBbW9xRipwoJc/LRmukXjeBvH
         uoyvOVWxhv6j1dUBcS/Kwg1fkosVYUVY3omJMIqM4AGw/kg1CUFy2ILrpR5vz/pzqvMo
         yHZ/rSfaWdS5clsasfzFf5uEPjwO5i61YYlCnRLeCkWUpb1QGm+aacGwh6PHys9jA6sJ
         HmVnsquRlpJGB5/jQ8049XCYn5VJFTn6MRRuWs0aHA9ABYh0jU1UDgDbPM1ZVpjlJ8Ce
         hVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnFZGMGRgZnTL2htH+L8kbm0iCngTm7h0sHRJmE0z4fnnf6rLHhrBREw7fHkiXL2Xxg2NDes58m1hbI+stNe5I@lists.infradead.org
X-Gm-Message-State: AOJu0YwKDZUbinEhsjXM0MRfeMH5ddBNpN1ZkbCxp9fcJ8bJxKAWgsV3
	tgJKTRiWCpOn1894sWN7Y18ThjP9LMCIrLebhQkmOs3icC3n5WkNC54qbtcopBa+LSmAhTE1+4N
	JXwTmafi6pxGGKJZR5yqf6KYBFvI=
X-Gm-Gg: ASbGncsi9q6/K82QxPXtB6YUR4Z4Ro/jjXnZP6mmfu59k92iDfnDU023cMkikmBekP9
	y7ljx9eYgL7Y0mIbnJh2H7Tx9nM6cJFnVCgPGp+8/GiASvPxoFUHqqS33SQph8J6mUAR/l5eBmJ
	Z7eF8S+tG+PsY3YNgm+TwB06waqVh8SXeOGA==
X-Google-Smtp-Source: AGHT+IEl8WOsOctZB6vC/J5QfmXY3sgD9nIFkIDBu4WcUX+Px3DXCBoXBfXgsmay8+RXay1gXsI3eMHzNv+p6FEZHbU=
X-Received: by 2002:a05:600c:37ce:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-441bbea0e40mr140979485e9.6.1746529971892; Tue, 06 May 2025
 04:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
In-Reply-To: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 May 2025 12:12:26 +0100
X-Gm-Features: ATxdqUEJZorzolIgvsTdLshEsTPYYiqnZz4o7Z9Dl-6jDsMyiFJ-9tbycLt3cAM
Message-ID: <CA+V-a8s_98eGfBe353Tp6TxZMtkc8JyP2KtxW55c_uN9ZB=NxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_041256_261967_671BE087 
X-CRM114-Status: GOOD (  21.84  )
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

Hi Krzysztof,

On Tue, May 6, 2025 at 11:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/05/2025 12:47, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) =
to
> > ensure the Ethernet driver is available early in the boot process. This
> > is necessary for platforms mounting the root filesystem via NFS, as the
> > driver must be available before the root filesystem is accessed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Same comments as for previous patches like this (even the same?): you
> are supposed to use initramfs for your arm74 boards. Even armv7 boards
> use initramfs, so network driver does not have to be built in.
>
> For example all of our setups use it thus we do not have to populate all
> other vendors with our own drivers.
>
> Sorry, but I am strongly against such change. Kernel is already way too
> big and with KASAN it does not fit to boot partitions in some of the
> devices (and I cannot change the boot partition size, at least not
> without big effort).
>
Thanks for the feedback. I understand your concerns, and I agree with
your comments regarding the use of initramfs and the impact on kernel
size. I'll drop this change and avoid adding the driver as built-in.

Cheers,
Prabhakar

