Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10298C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gM3E8wL48kzHTXams/opmso2IlDSTnS5qXs+qEXHASg=; b=OQRErIMfgoRMWypwEjMpG4oBOZ
	7EL4dBm9o09DppmWISlm6upxvxtzkPK6WL03nehgfzuuhYko20FM17jQjVFhr5T5MC4pvcY2yXfkJ
	3u1DxIpu2GuWAL3OuwlMKHgPYMkBBfw/FBOMBDYjhylRWv8Ap2Un97AlK6EVdvaXUoW7VDNX1/TFd
	B1g9pIe1hS3O853FDFZdD3pYye6rlkn39+RPiUqvUXmg/+Y0+5IT6bCArL85qVWuxxFdEyRy92EVQ
	LfRhrCfrtLYTTCqsl+V5vfegz4LLpap4iewdN0D2H3tZQt+33dG1S8keS9+ymAHcQhDFC0ycNViPy
	ceWYZndQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm2W-00000007kvT-3UJy;
	Sat, 22 Feb 2025 09:43:16 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm13-00000007kno-13Bl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1740217290; x=1740822090; i=wahrenst@gmx.net;
	bh=gM3E8wL48kzHTXams/opmso2IlDSTnS5qXs+qEXHASg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Rfnh11hORUbownCML//yRo5SxL0Q5Xrjew7iyCVq1rSo1w3YQSma0XniDXS0dLyK
	 FuiqX0IXdV24aZ/7IF3Qx9fY/PDEfjztTa2rvoEo0EqmGrQZsZHdP0EPgPWUQI7UZ
	 d7XB5H2YWRYQ5Xv332MULU1nwVhd+zt7mXBpwU10UQFGV4hkQy1lJ8QmRtEf/0CrZ
	 ZV2wpM/DK8BuMe6/78Cd+UZzREwn0rlH4szzN9KlCPBvPq5AiGGukkBooFStfWJpt
	 VSB3DS5SGe6gknvZwcurC/QcAkalkjj2quNVpaq/ybfVcWzQ0q4oQ7LqKJC2q9n98
	 9HHlXv2IhTSJi/iCZg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1tZy3R240t-004jbr; Sat, 22
 Feb 2025 10:41:30 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] ARM: dts: bcm2711: Don't mark timer regs unconfigured
Date: Sat, 22 Feb 2025 10:41:13 +0100
Message-Id: <20250222094113.48198-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yl8DiExbWEIcj95RzzG/xsAWGlRqnATIH77/9VAMOCnBw1pGPAk
 qJPZTpASiO+VfupILVoaBhMNC094kMkuYlmMxhEDPInbvGGO+GGz6fTXZpYuwZ7GnogPTpJ
 G41Sb/5hTLIs90ZIuwmy3h534x8lzuGLyEzaZbQCYjEy6dO9ogFgYGyCfUfQG5801RAWdlu
 RuJxh93HMP1fPL5UL/SEg==
UI-OutboundReport: notjunk:1;M01:P0:9tCxkSOtl6s=;PDF3WxvJY3q36EOPsubzm7avelS
 8JVOMNudtCauYHT4Oswghm7zQeVnjlAft1ipRN2EL15GKAlK0CHUgFsIaS6vzpDPgoCl3e8c3
 HRYPuHkaSlVP8NvcC6GNPblnpDh5IE8ZC/ixv6tjwfpteqDIlU3Ss68oEX8ULKTC3ZHayn6aP
 WkXCdasSMODVX8YrxdqQPwP+OKSm0kU9saL866jpraErbjy2VGvFqSIasAHqsK+eqTzEjo3Ic
 npYamNBHZ6ZF27eyrpNaxrRcr/aps8DrBLjl7UK/KLTMHyLP3TWoLjQkQmoJR0WlSKcvxT0FS
 K3z6EgF/GudVBS6ayTdsE+g2cRFxAnGp8JZaL3vYuPWgUj70a7XUJ8DKg/yuig7Lm71Id/ry4
 aYDmDWM42ol5ur0slJTXRsx15ZILy2zZFvAXTlvtkb8dpSbBFFuRPOlwc7LjgfTjEoENLUBVF
 cc+krW7aBCVVN4MhwpO/R9mKZXhl5c5eXM7sbtdAcirYa/E3HO9JiPRxfWS3GYdOdiel2RQgS
 3hvfqjAFQdFY5YhnDJjSEgAsy8VeCnI8TSVbo3WjsEWZ5y3kn57uRwkFvAQLaB7Wio13/OtvM
 Ytfpn7hd+fjAjKAt8QE5zF56rdU9MUssk9E4czHOYtijqCL7aKfaaXLcRC/fl+UZh1C+efbRI
 Y0rFu/Ae5BWrhn00e9o/hjOGmUZAGuB7Gb023ow2k/uVsPWoKyc1Pr/UGD1LZsJ2sX9xA/2TJ
 sMxtVwUJ/hlA526joN2sr+3Q+xP4CevRDhTiuKIC/D26MLUH6R2/YBebN3dLYdYSvncytqGCR
 hxSH+RicocAqXM843DslsE+FLeYXF162YId5UZRpmYTj9czhDgfJcjrj2ELAJ0L3l4RPo2aNc
 7iAFzzbbC3vKqEvQFnF7UffWeCZRZl93LxcZQrdTzkC+7tTn1wZ+MWv3f9D7wrT2DjovIS6Nl
 fdSGnbQ2Ed9xMTruyHNYyN5KPR6LtdBU9j26Kg03pmU3U6y+CrnmG3LvsCVGX5+5ZC8GyfB2v
 hci4I24cvpXF3FHoU+7lBqN5OAyT7Da3lXeuzC5VX78zuK4JCmwIchYFkTuniCCceMYC5Jn42
 DgTMq72of4WAi3WiGIG6RcEl8ulpa+vW1PfNoYfzgGstlYSpmnjwPeO7tYn05qev9DWV0NVZ5
 nNna9Hc8ZE8TO5PXM7x0vR/igEwx9P/07hMyjrDhDZatpxgp0V/c60xPSvgCIS8QXJCJATNeb
 jQByksCxcT4lD4xzvCr5O+LfbFwHPNHFDkkslAzo8VdJM98zGWfD1vWuCfNwkdqwx5iODZL+y
 7m+H0Q+gcbEJnkRf+CpBLAL/y1lux8o2xf4zf+9vlckrmVsg4dltwrq8mTyk4yrRb4RRu0owB
 hL41NR+vf6HHpwd9n18j0tp33CFoqGnlwCxRnP4fTk2RlCxQTwYoS5lsrH/aUR2oCOJFRl1qp
 6B6FyfkgBhX+I18EXvML+ZDPkB+TQWqMRH7pC6LAHTJvRfU3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_014145_586177_BE936D2F 
X-CRM114-Status: UNSURE (   8.58  )
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

From: Phil Elwell <phil@raspberrypi.com>

During upstream process of Raspberry Pi 4 back in 2019 the ARMv7 stubs
didn't configured the ARM architectural timer. This firmware issue has
been fixed in 2020, which gave users enough time to update their system.

So drop this property to allow the use of the vDSO version of
clock_gettime.

Link: https://github.com/raspberrypi/tools/pull/113
Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/b=
roadcom/bcm2711.dtsi
index e4e42af21ef3..7cf93fdc676c 100644
=2D-- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -451,8 +451,6 @@ IRQ_TYPE_LEVEL_LOW)>,
 					  IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
 					  IRQ_TYPE_LEVEL_LOW)>;
-		/* This only applies to the ARMv7 stub */
-		arm,cpu-registers-not-fw-configured;
 	};

 	cpus: cpus {
=2D-
2.34.1


