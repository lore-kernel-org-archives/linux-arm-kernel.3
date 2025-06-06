Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4476C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=; b=b9kAk09K/qSZ/aX8NtWQTM0vHh
	LiQnFvmvneP8N3BIu3v5dWxS5cUMu51adKxhZgC89KIyHfIFzef7GBayzp5sqQLEsRnxuJbjR81lc
	tVSCqj7IuGTuVtUIunWzx+6BJGnSzSztZp0DqPGIAUqO/tAzDO3i2DKz4G1Vnvi94NHYOXRTtishk
	e+9OB3ISV5WcaR9iV7l15hYjYKjKiOekgDfHsGMlG5iUjbqoGJ5PnJZAXl0ZCOni7eqFev6z4TcfC
	LFUh4s4RHupish2NbC9ctK8rZ4YQBoy+MvND/+yTTfgL05ZNXBp6BDEnW3jENaGDZajB81VzUIXoM
	IzBqH0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZn4-00000000cWq-3wPt;
	Fri, 06 Jun 2025 16:19:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZkx-00000000cMW-2FEU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 16:17:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d3f72391so29619925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749226642; x=1749831442; darn=lists.infradead.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=RxX2+Nv++ASYjKdwVxVpee5MaatXm5fXusQqjDoEXX/llKr+HnGP2QIRFz0FahyRYv
         yTy9slPTFCFYVclUJku1NfRl2eOdDG69/V+rDcWRRXp/VZRF8qq67tx4+nrB+UaU5pHb
         YFuPHt9bdZQ2QwXS/O+Tmr2syzg7lLvny33hgN0htOlaXsuyavKSG2Eou8+n9nNQir97
         QTkDodPg9xRggateshJu/aSxroUdMkSCUkTv0v1C77WVvM2SqYctEhIokHSlcJNZh1Eb
         liUd9hbNlXCOh2Vr/W69u1vCLOYaFFSsqXvR/XUDVCLbLdNRtkZRl6HKhqeBjnWjMOK6
         6/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226642; x=1749831442;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=JZTVlllr1sEznfmU1o4SqcqYxQ3DowZujL009fk1JbAeTpTohFvWzw+10T8qgtRott
         g96N4RAMT2h+4Wrq/SfN4KF5OIXLytOumdSXTw8xrThTNC9QRytGKSU6JZaNmbooENdG
         jCe2VkFyMEh6cZcWjOoyrgaPXCwgm23bmls89TpX0Bgm2SKeQZhKon27hki72T4GGyDy
         FDQFRfTw+GZ19QJ25BL8KvpyA/hlxvU7Scq+4Im+s0FX3DM2OKj8xwVIlKCCuQSO6GAS
         PWy9naDUC2fT73TwDto7eTeoNfkcSx9wkfUpdal3T8bGbMOW/yi6IvwwwXS8ybatY5Yh
         FQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUc05n3iteHeX63FD4QnV8dfBn1Pf3Nxx+V88TD8uO1lprI3zOFIpu9XlnL/zqftfdAVmInFRw5rvjTp/06fQrF@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYGlbgysI2sKWf78+g+UhW1U6IUwe5v4ctZXw6l1dZwGRLUBM
	ZEBXtT8siuxXsIUUZLYTkqCF6z8TcrRS6efkL62MeEodk1ft2amOKCzx
X-Gm-Gg: ASbGncs/Haews+b4bKuq7q7tgr7CsyQefLYC4UlPXoQmAzqZ33JNmV5M9g51MMGNGCH
	+pug8Y/ohI8378+3d+BJ6h3HeledTPENCb1dvUXsbZIy+kb58RTxE0+8xSxTgSyHf3zwGP9bB6u
	IOWO9vSWRSPCtenMiUzGzpp8juEoP2T67IHjS4X+3c1n5cnLPsADcIFZEYZRNeAopSzvS12nf/N
	/sThCPzM5IlGj0c+vXheS1MHCbooAxnKrFhasN8PhUBQN6sApjeOQmoBGTxNkddORE9IS5EU/nX
	pTda/cjJYloStmycKwnmnrsDHdAU8Suxe6Nozf851iJgHAD2RK5PHB0XN/j3FH+WGNKiYm5Db8u
	Oa8OhOwQwKYfrMg==
X-Google-Smtp-Source: AGHT+IFEPwne2ttMNKIa+n0ICE8jkRX3AQsfZ+fAiNXrpYKRs5y4Ypd8txsA2x6HPfCUIi/0m2BD+g==
X-Received: by 2002:a05:6000:25c7:b0:3a4:ee36:ee4b with SMTP id ffacd0b85a97d-3a53188238cmr3679704f8f.11.1749226641555;
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5322ae43fsm2281609f8f.25.2025.06.06.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 17:17:20 +0100
Message-Id: <DAFL3CTS8R5D.1FIGCAM5SXJPL@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] media: Add line end IRQ to imx-mipi-csis driver
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_091723_572590_A532EE03 
X-CRM114-Status: GOOD (  19.54  )
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

Hi Isaac,
Many thanks for the patches.

On Fri Jun 6, 2025 at 4:44 PM WEST, Isaac Scott wrote:

> Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
> registers. This series refactors interrupt status register debug handling=
 to make
> it more intuitive to add other registers such as LINE_END, which has an
> entire register containing only one interrupt. Previously, the
> mipi_csi_events[] list contained a debug enable field, and this replaces
> that with a status_index, which indicates which status register contains
> the mask for the interrupt.
>
> The second patch adds the user line interrupt, which is useful for
> debugging, as it allows a user to trigger an interrupt after the MIPI
> CSI receiver has counted a configurable number of lines. This can make
> it possible to discern the true resolution of the image stream reaching
> the CSI receiver. It adds an entry to debugfs which lets users choose
> how many lines are needed to trigger the interrupt, and can be disabled
> both within and outside streaming by setting the value to 0.

LGTM.
for the all series:

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>
> ---
>
> Changes since v1:
> - Moved from magic number to enum in status_index
> - Clear INT_MSK_1 in enable_interrupts() when on =3D=3D false
> - use local variable in set_params() as in the interrupt handler
> - move interrupt handling code outside of spinlock
>
> Isaac Scott (2):
>   media: platform: Refactor interrupt status registers
>   media: platform: Add user line interrupt to imx-mipi-csis driver
>
>  drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
>  1 file changed, 74 insertions(+), 33 deletions(-)
>
> --=20
> 2.43.0




