Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349B606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MftSExS1;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KCPucJyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cNlWNUoqUDDPQ6xXQ6ALQf3E5zOR4LUyb7Im43c3BQ=; b=MftSExS18+r4weiUcdRI2BysRU
	D05d7frFNJ3IoWSIG8IYeyaj0RCysfdPB4KyGMLRHbmF/ZExPr+Gu74dNxpcWATS1Giw9JTPE1v2e
	B8P0xvAsteHxYCP+WRm0LQ+lL4hjg2GuqFRILcpk/GvKwKK4rNkRKBY1mfqJNPzg/F1wzfys/TlH1
	4fy0b/o9F1HDkohmTH+VV2FrwV+bjbkzV3OPuhYPw1zD7xw9pbfNSnsvKxacRgk6cKJjEQfXhDQDt
	J9rIqPHZDjXMuj+AZI3IlsHW+Ji6A+33qxBDIIxVm8/E3OgxCxzy1LUQo5kCvhJFnaRyPHhBRT7Zo
	xHgNBnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6HB-00000009IMF-3Och;
	Tue, 20 Oct 2026 09:36:57 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6H9-00000009IIu-0gCn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=2c
	NlWNUoqUDDPQ6xXQ6ALQf3E5zOR4LUyb7Im43c3BQ=; b=KCPucJyTQYq480p8S5
	YUxPK+cRgY1cqP/CoxWv6U1KHJASMP5qs65wEj68wZTIXGaCQ/GG5G5/bY6wAxWG
	WwmJntGoH67r5427dHSBlc5yZ6v24EMMaFlQnHdyvovwhEcBmmfMSt7Z4yxRYPmF
	dUEbYMIQS1WUwktj6lbZ5AKpc=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S5;
	Tue, 20 Oct 2026 17:36:44 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 3/3] bus: stm32-rifsc: reject debugfs setup without match data
Date: Tue, 20 Oct 2026 17:36:35 +0800
Message-Id: <20261020093637.1654161-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020093637.1654161-1-yaojiale02@163.com>
References: <20261020093637.1654161-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3_4ImNtdqupV5Aw--.29320S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr13Ar1fKr43Xr15Gw43Awb_yoWkCrgEka
	92qa4xJrsrKrykGw1xZrnxZ3ya9w4UX34rXF4aqr93G39rXrn5XrZxXrZ7Aw47uws8u398
	CFykAr13Zw1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnpHq3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgwpY2rXNiymTQAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_023655_609664_7EA24533 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Platform driver_override can bind a device to this driver without a
matching OF entry. With debugfs enabled, of_device_get_match_data()
then returns NULL and the configuration dump dereferences the resource
name table.

Reject debugfs registration without match data before exposing the
configuration file.

Fixes: 3bae4748c1cdd ("bus: rifsc: add debugfs entry to dump the firewall configuration")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/bus/stm32_rifsc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index 19d10379dcef..dd008103b9c1 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -617,6 +617,8 @@ static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_
 	rifsc_priv->nb_rimu = nb_rimu;
 	rifsc_priv->nb_risal = nb_risal;
 	rifsc_priv->res_names = of_device_get_match_data(rifsc_controller->dev);
+	if (!rifsc_priv->res_names)
+		return -ENODATA;
 
 	root = debugfs_lookup("stm32_firewall", NULL);
 	if (!root)
-- 
2.34.1


