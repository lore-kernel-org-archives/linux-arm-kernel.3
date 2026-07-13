Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC9AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3WRQgH3u5bb1sg/UIkuyiCQpHZzLzXfUoy8toBIe7A=; b=fJtYyfdfJ+xZyJmR9jryu5ckDn
	t9OJf20GaifZsHDEZ9952ld6AzWc0kdpjfo827FVi0meTA8gMK59iXrgC3XTOFEdEA2G9IYsBYa0Z
	kEiniAUxZgAJJmU5IAStEt8zrKrDHb4sKV/4I6Imoqeg3xWflMLZBgrVpnH2WlRjvXySRpn+izz+f
	nX2m+Njkpa1Ys5/vUve9U0YOORXYqXh9WhLU4/VZF6m/qITy+mVQ8JA39laDnVNJb3PycO1RxR2Jy
	624tFxf/otAS6Oi+3vD+aX5JT4M33Uy0ym/eKU4u5fBw2M9aQK+zjwm5YeAWJPXEHScQMqx9vhPIo
	mZhuCqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI47-00000009fUe-2vcy;
	Mon, 13 Jul 2026 14:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI43-00000009fQD-1WwA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z3WRQgH3u5bb1sg/UIkuyiCQpHZzLzXfUoy8toBIe7A=; b=jYTinH3UR8n6p47Rt3xXDXMFZA
	e2W8cqKzwc5+mP8X4pbCypCbJh4thPi8Vo5t9142a7akqaRPfhp57VoygahNJagKv+qcKdalnkcyu
	ZtoJdRFLuKWwlYWlRLySSEFMBeqR1lkqi1SqrKHK4awG5oHE33f7uQOu0D29um6phKHk1HkSsmeWu
	iZgxUDVydwv8SCf3mUUopGSlGjC3dVttNmHbQ8O08Ux4e9GYkrUMJcOgQ/+vJBPEO32rZCeQo8Bm1
	BRUtXxtBbZOpkH8ZP1t5jY+dx7Uq3nk3dlWSZGs04Z3JjMtZXulXeaANFQOPwLZ11Eyma8P8bQPC/
	dpXTorkQ==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI3z-0000000Bjt7-1PKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:22 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3WRQgH3u5bb1sg/UIkuyiCQpHZzLzXfUoy8toBIe7A=;
	b=q/sqPrGE22EwiScsb94tifwGXslrOiY09SzqQ+/yTlNlvHB7Y/7sxpxgzeuYRBMAd7GKFb
	jjykGZetSHE80D7azgr+BNR+Q+Jy0d3K7qUeEVv3luDEFpU7BbBvkg9T6Wrts4U3Kwf3/7
	ocXBlpKvShIbEwgVifflaYGp7LiEP7iDbUCH7KxZVKoZ99skQLt2A2NoH5aNgXTQ6oEhd2
	JhQabnGoE7O+pa8dX30Qq26Bg9t7+eV4nZmpJqKWsqYh+tzGTdo1e8Qt1N7khhJ6ORKBRi
	Ng5eePFw9cP+Nn8RnA3oYfysdCHV7gNpxN/rBg5rHijU4+riWuIDsU8BAmmoRg==
Date: Mon, 13 Jul 2026 16:53:38 +0200
Subject: [PATCH v2 02/10] firmware: imx: ele: Fix indentation in
 ele_base_msg.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-2-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=64Z8RnfUiT82ClmtKrj06sc+zV8FVPoGFC47Pu8B+Ek=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT2DjPaXQXRdvHrCKFHi4OkKR111mx98EqVPdAiJHp
 JqDKiQ6SlkYxLgYZMUUWaT4LV7bmsX6yB+rjoKZw8oEMoSBi1MAJhLdy/DfW2Bt+KuMIH5dbTGn
 KVce5f7zvVxunV388XbA1HOrxM/9Z/hfcHHH8+MHGffGvnspHi4Yv1/8iZfY7duMR9+HCU7Z/86
 dHwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155519_590895_C9D64D8D 
X-CRM114-Status: UNSURE (   7.64  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The file uses mixed indentation characters. Use tabs everywhere.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/firmware/imx/ele_base_msg.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 75e65e279193..1c5d6791b323 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -27,19 +27,19 @@
 #define ELE_GEN_KEY_BLOB_REQ		0xaf
 #define ELE_GET_FW_STATUS_REQ		0xc5
 #define ELE_XIP_DECRYPT_REQ		0xc6
-#define ELE_WRITE_FUSE                  0xd6
-#define ELE_DEV_ATTEST_REQ              0xdb
-#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
-#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+#define ELE_WRITE_FUSE			0xd6
+#define ELE_DEV_ATTEST_REQ		0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ	0xf2
+#define ELE_READ_SHADOW_FUSE_REQ	0xf3
 
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
 
-#define MAX_UID_SIZE                     (16)
-#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
-#define DEV_GETINFO_FW_SHA_SZ            (32)
-#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define MAX_UID_SIZE			(16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ	(32)
+#define DEV_GETINFO_FW_SHA_SZ		(32)
+#define DEV_GETINFO_OEM_SRKH_SZ		(64)
 #define DEV_GETINFO_MIN_VER_MASK	0xff
 #define DEV_GETINFO_MAJ_VER_MASK	0xff00
 #define ELE_DEV_INFO_EXTRA_SZ		0x60

-- 
2.55.0


