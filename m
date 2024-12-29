Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BDE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6inF7f44On/YZUVFYeOmYHex6qxOXPpddZ32JxTI6g=; b=olAd9+WWZzVuOXo4CvWNmZ5aXu
	JlwYJC7zYtfD7up8qstrWWJLoDVhVc2bksrGgkddX4NL+Z/PyxdG2fUlpgTcn3IjC4w9fqAVxUs2+
	kDuexGWlCwF7vfZgl6862/dAA9Hl69dibOD3QNAxWZLflCmBu4tZf8MseXg5poscEAgBJL3Ss+9AT
	R6+1KjRJ5/eVNWQHLaM9MmvZ0cO5FA395MV+5qrHhH2vxMAhNVRi/79Bd1oya7Z0eT2pkZkLgHGaw
	JHUsu+uO20gAOPJ7VchNa2nrL0M3kXICxF2Bo/5b9KNva3NpV06NVJfh7Rki8vkSNZx51XxdrrkD8
	omCHqS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRye8-00000003nAq-2Ljp;
	Sun, 29 Dec 2024 19:08:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRycx-00000003n6M-2ylu;
	Sun, 29 Dec 2024 19:07:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436202dd730so61886155e9.2;
        Sun, 29 Dec 2024 11:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735499222; x=1736104022; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g6inF7f44On/YZUVFYeOmYHex6qxOXPpddZ32JxTI6g=;
        b=IGNnQEj717Yj+kKi2gyqnx/xX9GrUwfXNUL/PwtKy1GqDFdcj2t4Fy027ANdwCXG5w
         LMGc1fGYlHfp62bLIqqJSCtRCuzl/hW1td+WTsJ7qBG5adCJw5rzXobzFno1OvCcfWhB
         6zXwRazT8uhk4sSWgfOzAM6U2Ae4ivjd/iluoIkf8lR5/2xyXUh5EUl5aPYX8J1IV5nL
         ZGSJb3eQ6NPH/p3CGNKUr9bMHIFCC40yx7Gqr/k8UYSjW+UwZigtwENSfKpYRnTwEEBf
         OmuU8ZI0dzUykzQ7T8qjh5RnkTx4Fds5ee1rp0kMXaB/ILy6gK1cfUXLYm0/DNuJI8bL
         jUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735499222; x=1736104022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6inF7f44On/YZUVFYeOmYHex6qxOXPpddZ32JxTI6g=;
        b=CU15SYvXVvXbG3+iI3h/jOYOwj7FcUuUEF0ZxaWQ2vEs7LF6aV+7/5Tk6OJ14H3GXd
         nKeWb+0LTZMOkTkxXIktWJl2iFidzx6rOiBfnwMR/QA8CjAGvUgB0J5TbEY68I9+C68c
         aOxDkB/XcJk9u4+1R42cv43leTp/O59ChdSKaWI1D5xAuZ2DVtSD/MG7oCJf48j+l+r8
         ZHqRipCcbLqrYoO5Pjuc40cYMZv1Y1YCPDks1mjPb8W6+3GCFSkCB66FgXaupnV+spfW
         cyJZQmo493TSgYiKa/t7UCqd/Fh9mScGcgrKqbR7uEEGqcEes8zZP5bM17hB50rRpwHE
         XOKw==
X-Forwarded-Encrypted: i=1; AJvYcCVukjOwsB190V2Q3KuA5nClrkzbHXhySgUV0FQkh9dE/12y0b1B9lR34w1KMrXEgwegHXS8OlMMAM8By6OS6Bg=@lists.infradead.org, AJvYcCX9UMuf4fIrInDqdd97DpCGZA/DVBw9tNQN8Hy0GnvnXUvWAaCYd+7IuDrDlLpmn65sg9Xz9YA6nEhZWn3cjS/P@lists.infradead.org
X-Gm-Message-State: AOJu0YxnEOJWDNZB2sDjdr+zhV1SHIUxKKT+lRRY3r0n0uhDLwwA8uMn
	a37kunsz8jm89lyAGjdGrTwcNoKItMhpngfANe6ydejHWY0fwUZM2FSOgv3Z1XP9xqCAvDWtPD1
	h1BhllPyPGYmJGTtVuXybytiPpqc=
X-Gm-Gg: ASbGncv20IbJMuj9FerKFb2Zv9lUZ1aicFPv/QGgbUSbXfkuWZ1cCjGrUZCwQQ5z3J2
	LYWxVIepoNjhK3ZAJuq8fWb09DmHN/G/vH/eDUlj9lTUjZgK923d8q8kNTwA+KBQZwbPCbw==
X-Google-Smtp-Source: AGHT+IFoaSVE4xOPuKcw8tvGDALo/AfZU6mL7LQ8VG4tPxNBzjVjMKo4B3pHiiIS8Yv9lpRKvu4j2gPDjF3ecFYmaDI=
X-Received: by 2002:a05:600c:3b24:b0:436:5165:f206 with SMTP id
 5b1f17b1804b1-43668b78debmr303253755e9.31.1735499221513; Sun, 29 Dec 2024
 11:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20241229184256.1870-2-honyuenkwun@gmail.com> <20241229184256.1870-10-honyuenkwun@gmail.com>
In-Reply-To: <20241229184256.1870-10-honyuenkwun@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sun, 29 Dec 2024 13:06:50 -0600
Message-ID: <CALWfF7K0x18sTdQ+Lvyo1-=FiZvRy4jyGgcO-FoJeFWCxKh3HA@mail.gmail.com>
Subject: Re: [RFC 5/7] arm64: dts: rockchip: Add Orange Pi 5 Ultra board
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_110703_749230_75ECC528 
X-CRM114-Status: UNSURE (   5.87  )
X-CRM114-Notice: Please train this message.
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

The 5 Ultra is an RFC because the board schematics have not been
published yet [1].
So I'm basing the differences so far from the marketing image [2] and
the vendor kernel DTS [3]

This will at least give an example of how the DTS hierarchy is structured.

[1] http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-5-Ultra.html
[2] http://www.orangepi.org/img/pi5-ultra/11vs12.png
[3] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-rk35xx/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts

