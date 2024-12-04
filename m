Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350ACE7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQIKYI+jEybPC2DKygLR4XESx9RKvOgIqxS9RvUgEy0=; b=A/tyPG5n0vXffUbIUgF9K3K9dG
	b75SOc/gWZwl1Or6gEI5/dJnjYEhLDe/WNHyIFOdCFcfUT3NRx6C9qIZx7/K9MbeASyId29TxI6qK
	l2XAi1KLOyPsmg8k/wj2WasfY80ecxzN26ECxJE/4BVSNc62ZTWV+lQ0/QxiHQAK7nBnhPFFyBSgO
	GmSB1gIHnMR8a40aBBLExcZPvHQNdhuZN+52PgxHhYM870MrSumTs9PvkeDejfOli6JDNPOg/oTbD
	eaW10IXg0oMx7PsmgyUbPGszJnRUzYKqc08mR9Sygp2BouswEPCT+Dv2S7oe2PVtYg3lwNQIjU6wX
	VkoDrzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyyh-0000000ECic-3epu;
	Wed, 04 Dec 2024 23:40:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIynX-0000000E9Wq-1s2R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19D4B5C70F3;
	Wed,  4 Dec 2024 23:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A96EC4CECD;
	Wed,  4 Dec 2024 23:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354926;
	bh=TGuyA9UR05R0EA//8oCib2q+/iAF7KW5tp/fKrg23IQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jtSBvPEEQmYvHVQDnZaqb2/YY0N9ZmPseVNRJHHctbWOrjFwScEHT8Xyv8UC5aOP2
	 87WBaQvVkCn4oIleujX1HB/OOjkv1heYmb7AR0O3iXh4O5AhMu/WqzNhnDDBj3QelI
	 P60eOWcWkOZM3uQVmbUh3yxUl5DkbzKtGCC3tPaiPfSQ1n4jwbF9Vfr6XxzHxZE/VL
	 OixR2Y4g8qVV8FP/RoPnBaNCAudisdwdOipeo+tacnmht2hWuKn+Q+ygSsT3nFHeGF
	 2cprZsSzycsIU8k9v6PhgpxNRVuyZY02gHGGVxka0O3vypPCXPEQINm5RsQeBASI3f
	 5jgjW24Sg/mGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xu Yang <xu.yang_2@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 01/15] usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT flag
Date: Wed,  4 Dec 2024 17:16:55 -0500
Message-ID: <20241204221726.2247988-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152847_566272_EE3E078D 
X-CRM114-Status: GOOD (  15.56  )
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

From: Xu Yang <xu.yang_2@nxp.com>

[ Upstream commit ec841b8d73cff37f8960e209017efe1eb2fb21f2 ]

Currently, the imx deivice controller has below limitations:

1. can't generate short packet interrupt if IOC not set in dTD. So if one
   request span more than one dTDs and only the last dTD set IOC, the usb
   request will pending there if no more data comes.
2. the controller can't accurately deliver data to differtent usb requests
   in some cases due to short packet. For example: one usb request span 3
   dTDs, then if the controller received a short packet the next packet
   will go to 2nd dTD of current request rather than the first dTD of next
   request.
3. can't build a bus packet use multiple dTDs. For example: controller
   needs to send one packet of 512 bytes use dTD1 (200 bytes) + dTD2
   (312 bytes), actually the host side will see 200 bytes short packet.

Based on these limits, add CI_HDRC_HAS_SHORT_PKT_LIMIT flag and use it on
imx platforms.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Link: https://lore.kernel.org/r/20240923081203.2851768-1-xu.yang_2@nxp.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/chipidea/ci.h          | 1 +
 drivers/usb/chipidea/ci_hdrc_imx.c | 1 +
 drivers/usb/chipidea/core.c        | 2 ++
 include/linux/usb/chipidea.h       | 1 +
 4 files changed, 5 insertions(+)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 2a38e1eb65466..e4b003d060c26 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -260,6 +260,7 @@ struct ci_hdrc {
 	bool				b_sess_valid_event;
 	bool				imx28_write_fix;
 	bool				has_portsc_pec_bug;
+	bool				has_short_pkt_limit;
 	bool				supports_runtime_pm;
 	bool				in_lpm;
 	bool				wakeup_int;
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index bdc04ce919f7a..b76e7c3fa2c6e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -342,6 +342,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data pdata = {
 		.name		= dev_name(&pdev->dev),
 		.capoffset	= DEF_CAPOFFSET,
+		.flags		= CI_HDRC_HAS_SHORT_PKT_LIMIT,
 		.notify_event	= ci_hdrc_imx_notify_event,
 	};
 	int ret;
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6e..5aa16dbfc289c 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1076,6 +1076,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		CI_HDRC_SUPPORTS_RUNTIME_PM);
 	ci->has_portsc_pec_bug = !!(ci->platdata->flags &
 		CI_HDRC_HAS_PORTSC_PEC_MISSED);
+	ci->has_short_pkt_limit = !!(ci->platdata->flags &
+		CI_HDRC_HAS_SHORT_PKT_LIMIT);
 	platform_set_drvdata(pdev, ci);
 
 	ret = hw_device_init(ci, base);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 5a7f96684ea22..ebdfef124b2bc 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -65,6 +65,7 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
 #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
 #define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
+#define	CI_HDRC_HAS_SHORT_PKT_LIMIT	BIT(19)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.43.0


