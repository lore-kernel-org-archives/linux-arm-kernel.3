Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F183ACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCaH1a9wldvO9Pw9Dx3Q0BTdvJ48nMmHGiHHjar/Pus=; b=RRDFjQavc/DMvpk0w2J12GgDjS
	03v4Xp7HkMgvZLepw6ZUO/S167LdtUPGOPhlLYx/jbwsLVKaW+gOUZqfCQASM9iFTaQtiZR1AlByu
	kczbKfuCaO1kvDPRbnOSKDSdQmLTKx5RduCJi0m86OsW1PIbeauKo+cwyz1iPrnYvagqWNzaT/xw1
	zxujD0nT/t94gGL1ECUFugqli2ao06+/3SY9BK1v/9lcBFYjwy5PUbZY8GYZ9iNVWuCEIcVlBy6hW
	0zsO0qDds+OOVvqGP6GhXH0ppTSXzBgGhJet844uJk/nzT3xxEIWXp4ErG3J0Ja4puotpZMPp0pfv
	LBu4Z9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Kz-00000007Ppi-3slg;
	Thu, 23 Oct 2025 19:51:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Kq-00000007Pfy-2Y8E;
	Thu, 23 Oct 2025 19:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pCaH1a9wldvO9Pw9Dx3Q0BTdvJ48nMmHGiHHjar/Pus=; b=O1ZtLB9ed5AUANFGPDPWSeHXa4
	EIZgrLwkNqxkQW87J+MeE9bJNQVrbq2JqqdPPA716h/9KeiaE/jqEwPWYRx2RnId6RNnaKKiGeaW4
	LvHtBUicVCoK8TxmKJj5zptM+c8N1C8NIidJHUVunuHX7jScuG045Py3zXiTywV3RfyQRLg7GT9qq
	R0M6WjVdt+XSfd6vLpl+dKyexrHPKsoQl16hr5vXb1uteG0nUAlaflU66SPkmRc2KuGDXUOm8up06
	e9PNmD2JC98VNuhKiEy92DCTlnSkArYRfatq6stRJ70X8vr/KWov5Bpd+6fHTlI2pVNHQDKdEFGcf
	ekoKkucw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0T8-00000001g7d-2Q9z;
	Thu, 23 Oct 2025 18:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UwWp46qbqiqDB8MgMLs378EEZ5FfiV2NzxHZDXTzAr/OWgurnjRkodt9Sca27SMIBEnzZw+4Ti+N6m99G5L2kuuGWJWOJVBzPIR8spsGIDBUnnrE9X9bU5ASTuEll6gpjY5bdQK9iLNUPPhML2YTO9rn5ULKogm73JH0wVqcG+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pCaH1a9wldvO9Pw9Dx3Q0BTdvJ48nMmHGiHHjar/Pus=; 
	b=HIrksnmpKgiZeKfYSXOSajl6VaXsXd4fDNBcACYwhAnODFwNbGaH4ADVkCuMhZ4iAQDQmgpjR8bVDQ9xlyDbz4+jGO7QfXnL+HHbfW4pR6+D+smVe+mPOvLB0nZLD40XiEXdt9pS4ZaSuY55eE/kHLPC4Vz3SnqbQOupwbZVIeg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249040;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pCaH1a9wldvO9Pw9Dx3Q0BTdvJ48nMmHGiHHjar/Pus=;
	b=Rg1/iCTcBCs4+t/UbXUSX4ifgFWdnl++S6j4lrXaHo0NdEnPpbOeSUwWOoBobFU6
	FkHqhQuzZh2fEZhxwABoBxmjJU9rNORq3u2lF391u14mZ0DcxLuI7CJc58OcxzEjh97
	tmcFB+uTu34uADoJei6cLBgFiXqd369ElmrbBCYE=
Received: by mx.zohomail.com with SMTPS id 1761249038272520.1118303217484;
	Thu, 23 Oct 2025 12:50:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:22 +0200
Subject: [PATCH v3 04/24] scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to
 mtk_sip_svc.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-4-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195527_152813_3B9D35D4 
X-CRM114-Status: GOOD (  12.34  )
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

SMC commands used by multiple drivers need to live in a shared header
file somewhere to avoid code duplication. In order to rework the MPHY
reset control to be in the phy-mtk-ufs.c driver, both ufs-mediatek and
the phy driver need access to this command.

Move it to mtk_sip_svc.h, where other such command definitions already
live.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h      | 1 -
 include/linux/soc/mediatek/mtk_sip_svc.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index 7d17aedf6fb8..d627dfb4a766 100644
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -11,7 +11,6 @@
 /*
  * SiP (Slicon Partner) commands
  */
-#define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
 #define UFS_MTK_SIP_VA09_PWR_CTRL         BIT(0)
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
 #define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index abe24a73ee19..7265ff2a6e2a 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,6 +22,9 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* UFS related SMC call */
+#define MTK_SIP_UFS_CONTROL		MTK_SIP_SMC_CMD(0x276)
+
 /* DVFSRC SMC calls */
 #define MTK_SIP_DVFSRC_VCOREFS_CONTROL	MTK_SIP_SMC_CMD(0x506)
 

-- 
2.51.1.dirty


