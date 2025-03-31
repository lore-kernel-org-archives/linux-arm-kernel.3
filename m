Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EBCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iL+CVdfL8Afw85HRQfP4vuDu9KQwd7yFTXpR+xQAW8s=; b=KPXWZxdbHcreh+XZpWVR9uphP4
	USMDKUI3Efrl79cIe3DJi3sBDcc4YIInjHS0KP+OYEE8OZytxt5/oKjA1/HuGB6ZLBQQgSQZRwVxH
	0rjU88gWL/1sn1xj/BI2v9MEifBL8r5yEgnLz1e5Xn+nEq2MhTay3z6AxgTwEnQVS0cUEpYECcQuA
	jyL9Sd8kUEYSXcyjMV60Ln7EU5gwtUgabKqYsD9BNPW8gyyIXWFGEkKOi+o7P7vA2PAnAUXo2ftMI
	gort6Qo08EEWBXa7jjsF7NPwfpZ0OzAajYUJHyv/5VD4+YLJdZT9qU/yLmzg+Wa/1OPy4wrYhkRGu
	i+BsYiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGu5-00000000kAg-1gMN;
	Mon, 31 Mar 2025 15:18:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGNs-00000000cHJ-3Vjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=iL+CVdfL8Afw85HRQfP4vuDu9KQwd7yFTXpR+xQAW8s=; b=8FmvORjOMjHdHCznVGwfqsi4af
	xnmXRzdYYwkyWsjiB7DUbcQLh4JprvuVtfYq/toqsNUQGYaTICQJoNnvC8+GVshryeBFFEsGsDIUy
	S0cjFktfQUnin2WswLFdVIk5019BV6bVMj4sop00x/0Mikn7kydLgeY1ljAMt1UMjVfcI7VAuVcCU
	6701R3StJdsev1ywyFhrvAcN3ITrfCBNagtm2MqJ8Cex1CjbR4wOFEuRwdm0BuIls/5ov2BkTIXJ/
	89v1UB68yrc8O5iGpUz+6rA11ALRGU5F6Iz7zrQSs3F7r1Hvw9DhMLs+v/MtniJESJ/zJNDgQr6un
	Tf91RIEw==;
From: Andreas Kemnade <andreas@kemnade.info>
To: khilman@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sre@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
Date: Mon, 31 Mar 2025 16:44:39 +0200
Message-Id: <20250331144439.769697-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_074504_873745_296E5301 
X-CRM114-Status: GOOD (  10.95  )
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

The late init call just writes to omap4 registers as soon as
CONFIG_MFD_CPCAP is enabled without checking whether the
cpcap driver is actually there or the SoC is indeed an
OMAP4.
Rather do these things only with the right device combination.

Fixes booting the BT200 with said configuration enabled and non-factory
X-Loader and probably also some surprising behavior on other devices.

Fixes: c145649bf262 ("ARM: OMAP2+: Configure voltage controller for cpcap to low-speed")
CC: <stable@vger.kernel.org>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/pmic-cpcap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pmic-cpcap.c b/arch/arm/mach-omap2/pmic-cpcap.c
index 4f31e61c0c90..9f9a20274db8 100644
--- a/arch/arm/mach-omap2/pmic-cpcap.c
+++ b/arch/arm/mach-omap2/pmic-cpcap.c
@@ -264,7 +264,11 @@ int __init omap4_cpcap_init(void)
 
 static int __init cpcap_late_init(void)
 {
-	omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);
+	if (!of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+		return 0;
+
+	if (soc_is_omap443x() || soc_is_omap446x() || soc_is_omap447x())
+		omap4_vc_set_pmic_signaling(PWRDM_POWER_RET);
 
 	return 0;
 }
-- 
2.39.5


