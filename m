Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA06CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPe34vRyIa6dML1EQo1KfXSPOK1WXOU9iwUTkrF5Ta0=; b=x86tjAmNK2xtca
	jgqJ0JGv7BMxy66QXpkjNKUjoxPf85QLADEM6eA4+g90X9KHIS1nkBvHL7d23i9ZKxWLECDzPO6aP
	5meMwnhquU3Yjg8GnwEvI+2pxHbkx5XulO8gv2w+SfxCriR2OV/P+K21RF4GdK8cEK7eWjQGjhPtg
	ymlXRQ63vS1hzPtfsPIeg+AS1dbC2llv7++3eLQUu7ptuYEA9vktWLCnTap3wstPi1RINtJlIbsZ0
	RkBLhlFgJCqmJ9GM716zmHq6GaJn4A5hGpD+RsC4uBjM50mxI/EbxkRvtvUwA7DAOH4AX0BVbZBjM
	6aL+Tt36bXSBh+P+0yKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqe7-00000005ZNL-2Ucf;
	Wed, 30 Sep 2026 09:30:39 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqe5-00000005ZM4-04vj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:30:38 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso7698387a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760634; x=1791365434; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LPe34vRyIa6dML1EQo1KfXSPOK1WXOU9iwUTkrF5Ta0=;
        b=mzGsQ39l63jhW3yixd5HmiLxLLcprKK/FZxPdOD6e/YD30DjzPeSfdLE+F8LGNrIVS
         G6qB8/q/KIPslQtiMGVHLUM5T1k52Nv5fG+7tvGue2b6dMhkAl/jMapLyJA71K2YpWSM
         sjH040y5tS1t5ktDxAtt7m+UTI/GD3UzZ7RrjtKIG7WWbVLoSILgcmq0ws0n5TneioPn
         zBgyA9vA4fMbLA68O56DGcvJJ/EZ7yAVko0DxW3VczOR5KzgnYOn2q63RRQMRR3odFyZ
         nF97x0uqb3fVUmZS925sbKNj4VMa0Xof04PcEDsWWbMfrX6JQcT2+NpHRcENeNw4T+s+
         APDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760634; x=1791365434;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LPe34vRyIa6dML1EQo1KfXSPOK1WXOU9iwUTkrF5Ta0=;
        b=jeMPufHn6kYw2yDB9s60Ltc46TvxCu1qwI7sEaDW4FwKIWiVu46NarHd4Mqw37nQ9A
         NFJQIVH2CH9EShVXJVuPjVVCDJYjh/33J3I8sKVDq6BSgehKdlXhgDjDfo42mITeNmCU
         CHTzi4p4BPxkeCwqWVegaU3LZ3Kt+M+tPqmhARXza7V/jlNMaXzUtDHf3d+twS167VJB
         6C/qmOwregXLGXX9cDaz38eXdUQpuj0jwn//7D2pT3pc8SfsPHwV+We33oNG5Bv+/bPE
         seNbo4Cze9MrlJGNq7ybA+CHtUoeogWMbzFebUYXLM5KtUgRHMFWHqf2tQKlAdjNTEPY
         o8mA==
X-Forwarded-Encrypted: i=1; AKwUvBwXkfSOYa1TvgQNPKEkWQZIFisSwYGlFf0GNoCChLX8i7ouSELPx7ZsZyYy50q+S9+Rr59SWQDqgikeDn20DSFh@lists.infradead.org
X-Gm-Message-State: AFq9FYLX1kII9lHRu5wVPPCbPPen5TabtVCS42/Rs0xUHs9VbeRQbytS
	wKadlgbPi8NtnrBbHQg8eszz6MkbeM3LXa5PzNfLWbsUNf86jlYebS9H
X-Gm-Gg: AYBFou2ftnHUCTgS5/7r1sgMLTUa4TkdbsOgZxkPzGaNBdhniNh6C0eN5Qnjrv7QZrt
	V2qhsvq41MREsLJGH3uFLZrjgHcY8f9X24Dpp2ykq3jhBZAq/IbdIMDcMECi3muQuiTNnwzqKYy
	Am8J8wYntktgIe/dXwe4LPj/i40w5DER8+ll+F5e4OF+tn6CfUmnjBjcKRONKGaXK2zebKy7Hcg
	SR/HdVDLmigau+etfrlfjtde/nPvlrHrBoTzhGWf8AZhss7EGWysszHYGoEWvu/ZyLxDeme3s3J
	AclYA30CVu4MqJL3Y8bnBgc/Cajak6NQR2v2tu0c70XRt4rQL7qgfPSDM0U+6eVdzyz1eUsv1rB
	6VIBiaGON4UtFDBLNt9+/nLSkbQ6V+DbhH5ifAoaiBVRXmkS6xrpzetHiY8XJTTdvQNKLvXoJP/
	B6bI/ABc3wtKVmHLB5FfBSvGmgxfkW7DwdhI9AwDeHTDnLJi8g9chrz/IijFqdMC9TTNnJfyjUo
	XTLSMPTLmFj
X-Received: by 2002:a05:6402:52d3:b0:6ac:c851:a0d7 with SMTP id 4fb4d7f45d1cf-6ae1990e181mr453683a12.23.1790760634236;
        Wed, 30 Sep 2026 02:30:34 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:33 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Wed, 30 Sep 2026 14:29:03 +0500
Message-Id: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDWvGoC/yXMXQtAMBTG8a+ic221l7bMV5EL5uBQaENq+e6Gy
 1/9nydCQE8YoMwieDwp0LokiDwDNzbLgIy6ZJBcGm4VZ+ustCmYY45bbaVuBUoDKd889nR9V1X
 9OxzthG5/93DfDyu5dl9sAAAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=1327;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=g1Q/SRrVTtz6AMBI1bvGBzBewZqe2gXa75U3T+sIgKM=;
 b=0nGmsba4SEGFbfPrANmHlsF/U0MMw4A4GIhmRhgAN5sBwJg/zkO2KE0q8f+UPO2nAyb/oCkNk
 R5Rjiq0j7B1CG3MTMVTYUy3TWgiQpmMnhm6Sngvey6AjwmXmZZFcwcJ
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023037_110721_5E3371DB 
X-CRM114-Status: GOOD (  10.46  )
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

This series add support for Forlinx OK3568-C board based on FET3568-C SoM
(rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Dmitry Yashin (4):
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 331 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 574 +++++++++++++++++++++
 5 files changed, 934 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>


