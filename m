Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52798C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b36WFNYgCnf2wZ3ZE31CeZaXfFAr68TP9LxpTPxnTN8=; b=MaFLbYAtKg4tAh/lY3e37/1YO/
	/pvsretTGIdQmKMPjmUxAox/3CANWJGULSDsqF+n5sFF+f3ITgTdjsuz9hxRiJbyK7WzNu0o7mn2s
	zbD2NhhFRONgrhEEHYX9Rj67auGdAB2EAC9cRnECvWZHVSAyZ26h9AGDiBOgbAWZaXWedACL1VS15
	d6CfRYhgSfBR2Cop5XPMRjGyz0xvKDtIa64GrUM3OuVkt0fn+jWV9cmABkPpCLIj6aeh1yCqLFL5h
	RoLBuYduXO/R8cvos/WCLz4067/dR1JzhYgKNJ1gvVFddKLGwdJvrmpdqosoDq6p4iLj5Z5IqqgYA
	MwyVhsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqSg-00000003HeA-0GwX;
	Mon, 07 Jul 2025 18:21:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYp8R-000000035dP-3l8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:56:10 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 567Gu44A908297;
	Mon, 7 Jul 2025 11:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751907364;
	bh=b36WFNYgCnf2wZ3ZE31CeZaXfFAr68TP9LxpTPxnTN8=;
	h=From:Date:Subject:To:CC;
	b=AWuU6+aZDmyZEWFiNoNHmuH+UerIrQMyF4PqYVqsLnbIx/t2boirOZGOTxUlQzuP8
	 2COK1J3yEfREu/Ew6DTdUBmcJx2sMJdVJAqTl4IryyRmHfEHSmZ/rpkuM7hba55lK+
	 sSj5NYzxYMGZ1HZ6c7GvSzBOd+Zovawb1abc2uh0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 567Gu42U2402220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 7 Jul 2025 11:56:04 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 7
 Jul 2025 11:56:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 7 Jul 2025 11:56:04 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 567Gu4gR547055;
	Mon, 7 Jul 2025 11:56:04 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Mon, 7 Jul 2025 11:55:13 -0500
Subject: [PATCH] arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250707-uart-fixes-v1-1-8164147218b0@ti.com>
X-B4-Tracking: v=1; b=H4sIAPD7a2gC/x2LQQqAIBQFrxJ/naBSCV0lWkg9628stCIQ796n5
 TAzhTISI9PYFEp4OPMRBUzb0LL7uEHxKkxW21477dTt06UCv8hqQIB13viAjmQ4E34h/TTX+gG
 xEitPXAAAAA==
X-Change-ID: 20250707-uart-fixes-6efe27a1afe4
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hong Guan <hguan@ti.com>,
        <stable@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=bb@ti.com;
 h=from:subject:message-id; bh=ky+qAaXdZ2TyedNW6YBu3RSJ2GrAWRzNmuzuYfCVs1E=;
 b=owNCWmg5MUFZJlNZgbBUjAAAaH////dv/z93P/vY72H6OOtvO7l/3d+93eejRbuK/Vjx+fewA
 RsYGKAHqAAA0DRoDTQD1AAaD1AAAA0HqAAA0aAAepoaA09T1PJBppgyjeiiBkaDQAPSMg00BiZG
 QBkBpo0aNAwRhHpBo00aNAyNGQMQ0ANAMnpNMTRmUCAeiD0QNAxMjEwhoyGBNGgaaZGmQ0ZGmRh
 NDIDEMQAAaaBiBiaMgAAYAANBtwQuRiJwsyXl5sOWRahGUMvwa6siTQE+IvJCDAjtX5kWq9Op4y
 OmXiR/M9WvLEjDaWQEsdM+KA4QXx408bJBhCFaIUGJRq3bU5D48/wV1V1pYGcp+CtgdVSHCl/es
 XNA+vYqyVzpx57PLN448CMX2uI5r0L7BByG3THPGCH3k4PkxCufmoIMQwUFbGntA+1H9FuTvaSI
 7c0BcC9E+8zk2rjDdEj40i7fizPc5CfuNWDS75NIhe5hqYlaoBzQh5aZITGc6c54VwYukx8lzkM
 Ur+1Oott3cdr7+lUoWTedMVIiUZeR9bYaVFDCbLZIEsovWsLxSCjGhlwwiNCSNkxDO1rgOw7Mdk
 iTsHU0Oarl4f4UKBcBnvZbQZUEEjh9+li/4mRbCnex3FIHkPiAJQ+OLVB3SPB5bxkpCAaxPikMO
 P/xdyRThQkIGwVIwA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_095608_029907_29E23F85 
X-CRM114-Status: GOOD (  11.22  )
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

From: Hong Guan <hguan@ti.com>

The &main_uart1, which is reserved for TIFS firmware traces, is routed
to the onboard FT4232 via a FET swich which is connected to pin A21 and
B21 of the SoC and not E17 and C17. Fix it.

Fixes: cf39ff15cc01a ("arm64: dts: ti: k3-am62a7-sk: Describe main_uart1 and wkup_uart")
Cc: stable@vger.kernel.org
Signed-off-by: Hong Guan <hguan@ti.com>
[bb@ti.com: expanded commit message]
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 3a8b45272526037b364e6e39886fcc9199114105..f11284b3fe8e23b4c48d8d2f3a7202e80dc57370 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -301,8 +301,8 @@ AM62AX_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
 
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
-			AM62AX_IOPAD(0x01e8, PIN_INPUT, 1) /* (C17) I2C1_SCL.UART1_RXD */
-			AM62AX_IOPAD(0x01ec, PIN_OUTPUT, 1) /* (E17) I2C1_SDA.UART1_TXD */
+			AM62AX_IOPAD(0x01ac, PIN_INPUT, 2) /* (B21) MCASP0_AFSR.UART1_RXD */
+			AM62AX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (A21) MCASP0_ACLKR.UART1_TXD */
 			AM62AX_IOPAD(0x0194, PIN_INPUT, 2) /* (C19) MCASP0_AXR3.UART1_CTSn */
 			AM62AX_IOPAD(0x0198, PIN_OUTPUT, 2) /* (B19) MCASP0_AXR2.UART1_RTSn */
 		>;

---
base-commit: 036cc33070b35754f45da50d81f8c3c85191c8b7
change-id: 20250707-uart-fixes-6efe27a1afe4

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


