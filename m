Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347BACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=; b=UiGJ54T5oZvm/JaXg9+znWseqC
	/Zo/rde15m7iKDrDigEUm+ALLtGFbVr2u0bckWR6NIqr6jNaH9OkRZGGGqyey0V3VStBPEyYfMv4f
	YmjI8eDSs6DUsNMkLegujKMTCMDHo8f0P+UfcDuWe3cnCyv2mlLZFTdwA0qydrkIvkDZhl/5/z4zR
	68i7CgkFNsCXVE+8Jg7WqKljsu2EP6B7/nx1UKmaRtJMQ6U4RFBotibRYFzRHDpOPaumH4Ybqvg6h
	OJLZ68N4k6+cq5c4efAg7/pbAwz72JdUlX+IK3qMsRm47fIOSZ0lyuDohaL93eN1UeTZqjWKYKmBl
	GawM/Feg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCvd-0000000HEaq-3sa8;
	Thu, 18 Sep 2025 11:35:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCvb-0000000HEaT-1cbq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:35:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4c3d8bd21eso562617a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758195354; x=1758800154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=;
        b=lbJXu/ebu1+vukonn+N8k1Leh99pdbsso7Mt/lkPnselsF3Ly+LUmunCH/4wrqywfF
         a2u3opnhY4/KizH65rqqhlNTMBXO8idDE5v+0J9EANxl9XTglckeyqZUc8aUYMB71EVG
         BaCDokQYaGVeAahTkv/4ptUP7BjOyXeMyez4MNTLDYygIhLForzw29LZMzkxXfYNkSb7
         lAW92KOxLE2C5lmap2Nwl5N2BofQGi0Ap4myWg+Cr3OMGZ1i9e6zwd2ByC2V9zm1z1CN
         BKKNvRlNu4z99nXlgm2exOFHYkNAxJWMMO5atYT2OcsK40rNs0o4bO2vH7tFPziGg7Xy
         xZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195354; x=1758800154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH1PrPamLBcIL2akQUYxoj1jI5NyoHazD5PXsVbHZK0=;
        b=KuFVhwc/wCnQKhPSlxH42HG2taIdGHNrB+nfFTdiVzG5rn1WuPyZs5GIt1dypHwfhT
         9dZ1l55kgv+aHc0c68FHX2jwt/Z30EHh3HljTmZS6qIpwsIgy78e19tehsHC9dzFn7Bs
         om4ftrtKp7a58hbiuE2CbU9ilBWeDcd9FarhrMb1rFc0gaPvWhxjBW0gRqhVLHVFCkKl
         wJCzbw6qTEzo80XYp1zH02rCHlangkaZf5rWXuVV5h+KhU9kLXy9+Mhp871ZK22ThxO0
         dYmF1wApcfHXgvbHa0sbn++N/un4cAJ7WlpoDooMxb6jiSB+lctSPveo/07DT7d5i9yT
         /Uqg==
X-Forwarded-Encrypted: i=1; AJvYcCVk0VoFiAxQa5zxy4OqDHmqy7my4nnWAP0E3MbtQEe4/XxZ5yD+TgBYe89MB9G2JNrUnNBpJRaRnEX/gY4KgSes@lists.infradead.org
X-Gm-Message-State: AOJu0YzuFQI0ebkhljrGlqnLYJgikufZOMEPBBU8HsZLB/8EswdDdNny
	yRkuikzMLH0DYMDR0Y6BwZ9TGIZslgKInnrVdrsVFOmPXaxW8HJFD2NVHdbJ1zeGXkOPgR8Yn31
	nMnJrwIs2D55a7cqpxet2PJfHQsI1YOgCCSxh6Hr8AQ==
X-Gm-Gg: ASbGncvzQeCkqZmUqK9d4oRRqE48T/SAcwgyW/DlEiopXRiMYVl9y2eAOXRGGw7F+fA
	kdzPs+88s6zZuvzRlPwYZmfwGW/tDMtD44ngGMEYsQRb9IwbaFcr0H67z2WrcN57K9xxUHjC+WR
	sW1aSvqnSWfAUK9z6Z4T8EhxQX/TylqNwz353gqnlWWdayOE4DiLRVvmtMd2oGkimSI7ea39HDY
	0dydZp87wDDTptDtQ1sCx1H40AINqGuFnUwxeKEmHjRnejqdcr0dkE=
X-Google-Smtp-Source: AGHT+IGj6a4sc19wyzd63Dixg/UySiquRPpGXq2m5G0nsVQ6YbTUTB+pMgEHhGrVA5tqjbsOrjjh+YB6F+lqKoiYvWE=
X-Received: by 2002:a17:903:1b25:b0:266:d648:bf53 with SMTP id
 d9443c01a7336-268119b832bmr72456925ad.7.1758195354344; Thu, 18 Sep 2025
 04:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250918014053.696710-1-rpimentel.silva@gmail.com> <20250918014053.696710-2-rpimentel.silva@gmail.com>
In-Reply-To: <20250918014053.696710-2-rpimentel.silva@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 14:38:12 +0300
X-Gm-Features: AS18NWCUGtPgOgXzmXtowvoHWKNQHRraFSnJDD8RcxIe00cDqMMkAGlPM7jIMlk
Message-ID: <CAEnQRZBb+FOah-owK2u4CM_ngLm675_tbrn5tdyUTnTSu-Mmbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aisheng Dong <aisheng.dong@nxp.com>, xiaofeng.wei@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_043555_426575_5927AC49 
X-CRM114-Status: GOOD (  11.13  )
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

On Thu, Sep 18, 2025 at 4:44=E2=80=AFAM Rogerio Pimentel
<rpimentel.silva@gmail.com> wrote:
>
> The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
> SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
> 32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
> display interfaces, camera connectors, and standard expansion headers.
>
> Based on the device tree found in the NXP repository at github
> https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
> board kernel mainline device tree.

Hi Rogerio,

Please keep the original Signed-off-by from NXP (DCO [1]) and also please k=
eep
the Copyright line from NXP.

Also, adding Xiaofeng for comments.

