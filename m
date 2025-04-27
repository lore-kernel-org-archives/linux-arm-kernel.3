Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A60C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=; b=R8i3L66uXdOLyWKPliSVAvqk45
	1lghyFFU/yWzSP3E7IPXVy3mmbDQvbBkz8v5iUVbFjLIfe+Svfd6EbhDLLRpxPfntG/g/jFe/J+QR
	wrqUqrfdhrmoI+R7SwN/LXXvUlIcQ/EFk+DIBUPwfZhuJC4F2c7jvrJDOrLzGPmPC1qWhgML4OUIr
	x++c9nyVRq42th3rNmxMxvkSmjnqZTdPlf5etLYLBSSsFiUjVKfx5sPKE9m01ZHzAsVrecRaTPj1G
	Vs80AHpWWnMgMQQLjJ9We991N78mFxQX9DvsAJmO3yctEZ3uISLBCApe19/OBNiSxLTNHbgzGLuhs
	viHMbPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90fb-00000003Rjc-2U3E;
	Sun, 27 Apr 2025 11:59:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u90de-00000003RYJ-3bfg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:57:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22435603572so43310645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745755058; x=1746359858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=RY6mLbfQv6bttW565LjIDrr0KxgyX6HfHqCrIkrz5svqyPnMdD3iVzAPQ2jO2TfqKI
         yrHuA2Y+O6scLsDRYH30X8vrpkk5WiCkREyjWT9tUxPkdfUdPUp7Jeu91Tg7+CHpFDcZ
         N9PYdwH/0PKtezHCgf/Qpmkx1ICAQaW+JjBQrIICQ9CWyyD6BqW2cXxsTamqwW7ikbF4
         kRPWHPo5XR0DTKVzaOffWf/qM4qIEk4V3fvWTILH71a1RKmVw0qem623pRT7E7BD/Drx
         S4aGjxUq0upmDatz9mIQ7vOAYwanrd1S8ni/hqdXh8dvVTmH4fsMM2W4b7EwOyfqSBWS
         +Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745755058; x=1746359858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=fV5HBh0zHdiEmwYU5FA/zEObLs29UVkwTXB93Dsx4xNVLAMuGDqIzsmOO41FlHNxHF
         Qdm+34we3SxgMuc586/DLg3JK0QdrKTmnr7Ar3n0lXI3UIQ2ThPklWGLjqoldbn88vjg
         8jiBbLRrPNR2jIgSK9xkMT3LNW4s23Z8/ZGKW5P72bN3N9ihC0+6zssqE/JXX4u+FshN
         xfm5khfKnExWpWCD7VvNaQdx/1jhh80V+hl1CIVB7xxsdVDx+u1gMntBUM6RgmQwD37K
         PQ5SVcV41iSwn7do2Y3b+nheY4TLUl6ZxM99NA/AIxnK5ZzXyieEKhIfpLn1P2qPQHjP
         zbGg==
X-Forwarded-Encrypted: i=1; AJvYcCX0wl/QJFF2qvGXh9eKRWxMuCMbHP5ZVzslkiaeYhPtFhXmkJgBPEk9phz+HGf6Bj6GjizX3VHz+Zc0421YeBPe@lists.infradead.org
X-Gm-Message-State: AOJu0YxKmsuQZYUVZe5mOUQYCP5AJJ4a3WwmBvhb11BcrTifzctklml6
	KuNthSvX8+ba/kQbE0bn/y6MWy4lZINMEzIHBOa6+OP7CUjutg10l+SmrQIqRA==
X-Gm-Gg: ASbGncs33tdyYK800EHdpOJ8ndqblOGwQXpyPclG0dT0PlIbO9NNiu8PM1Sx+21fS9x
	Ie4A4l2V8Q6wdsHE3q5AIqx+W0gV32pVs8IYi3foVL3Bbxi8SIp1mwsjjxRSVYY5KFiMbyccFj/
	V05GSQLKMI/QzTtz1p2QKI/r4daoeomSnHVH0HcLBFvg1hdYTk4D+TFPoAv0i/Ni/2NpNDzuPjX
	2CsVNhQUGYahic5WP1PVDTb2FpMcYPkJo/5j05wmlJvWW+cocQcnQnFORt7r98yXBAwxT8Z3uVf
	jpjlgN7u56JrlUW4qTMgr31kKbsugRLHe5E9GaABl0hQYKEJS5iAhSg=
X-Google-Smtp-Source: AGHT+IF5v/6Ko/fvCwFf4ZE0KXGbwqh1gFSaF2rE1KE1z2Bwiq95JPxzfmr1/BPwNIqto7+dgvX58A==
X-Received: by 2002:a17:902:da8e:b0:225:b718:4dff with SMTP id d9443c01a7336-22dbf7487ffmr128283355ad.53.1745755057990;
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
Received: from thinkpad.. ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5103259sm62956035ad.185.2025.04.27.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/7] Add some enhancements for i.MX95 PCIe
Date: Sun, 27 Apr 2025 17:27:28 +0530
Message-ID: <174575498081.15979.12453799870165824890.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_045738_917040_A16ECB20 
X-CRM114-Status: UNSURE (   9.05  )
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


On Wed, 16 Apr 2025 16:13:07 +0800, Richard Zhu wrote:
> Add some enhancements for i.MX95 PCIe.
> - Refine the link procedure to speed up link training.
> - Add two ERRATA SW workarounds.
> - To align PHY's power on sequency, add COLD reset.
> - Add PLL clock lock check.
> - Save/retore the LUT table in supend/resume callbacks.
> - 3/7 relies on "arm64: dts: imx95: Correct the range of PCIe app-reg region"
>   https://lore.kernel.org/imx/20250314060104.390065-1-hongxing.zhu@nxp.com/
> 
> [...]

Applied, thanks!

[1/7] PCI: imx6: Start link directly when workaround is not required
      commit: 9c03e30e3ade32136fed5a4ab7872dcb205687d3
[2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in workaround link training
      commit: 4a4be0c088e3029a482ef8ac98bb2acb94af960e
[3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
      commit: 47f54a902dcd3b756e8e761f2c4c742af57dfff0
[4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit L23 ready
      commit: ce0c43e855c7f652b6351110aaaabf9b521debd7
[5/7] PCI: imx6: Let i.MX95 PCIe compliance with 8GT/s Receiver Impedance ECN
      commit: 744a1c20ce933dcaca0f161fe7da115902a2f343
[6/7] PCI: imx6: Add PLL clock lock check for i.MX95 PCIe
      commit: 047e8b6b3bc3e6b25bfa12896a39d9fb82b591be
[7/7] PCI: imx6: Save and restore the LUT setting for i.MX95 PCIe
      commit: e4d66131caaf18d7c3c69914513f4be0519ddaaf

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

