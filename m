Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1887CC369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jI8FHAZftC+1HYuaKmnC6H3JrV3Q+6JExWXE5djLOc=; b=QvYJopPAj2eZ80qOoIa9pS9pEN
	hUDpP/5UUUEo7f2GgIBXHObOCOphKjWXetDai7vFZKox+OQofmW5VUeNHHIxsXkAnQp5z1S4wpWMS
	Bcx5MBE1FsWqNU4K5afyIEG1/v1PLuuYbRHt4I34tHywqLMUJQzRC6lRXO9uXlxubYzgzi/Rof7yu
	9+38rCco5T2m49p7Cdn58Tg6jF9pddRqvOGqUSUauWuUveo/iRaMR1TUMf7OK26BEbUzBldGLCgKY
	H1JtdGTKPyXRC85ZXf5FlRghEJPu4Sld4RfJmHMjIgsp0GDxOX7ZJMYtCQ8uxPCAqgFW+HYpS6q9p
	GakSFrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK4-00000001Ajy-1XPN;
	Mon, 07 Apr 2025 16:27:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lwM-00000000MSP-0Xmj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 12:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0jI8FHAZftC+1HYuaKmnC6H3JrV3Q+6JExWXE5djLOc=; b=flCysHDjgLzamYSpEbfKS5lCG8
	ojDgESztozhy7DkwQpiTUyX3QANMX8G3EatCqWb5+evp7I2HuXUQgTbnKvJ47IUYGDzfGAfBkwT6k
	8dqU3HS8KJcnD5UFXgeupHs3VcAztga46syXEo4DG7J4OFNOWT6d9WsHOaEjVOL4i7jUxiRn47aww
	ObjeYAQN9+KkSL/Ff8/Orq5m6Q7w1VGZghDWGUeMEFXCbhameaZabFm2qfdf5qzh3z9vZim+JZSE+
	N73kOevuooZZok3niT5OHVD5mom1UwE6s+Mdm/hPip3fU4vUc+41jZoUxl18lBE51N9fhLsVTpRV+
	9pSAv2rw==;
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lwI-00000007x48-2mMw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0jI8FHAZftC+1HYuaKmnC6H3JrV3Q+6JExWXE5djLOc=; b=faCd5m9cmhFYJp/bLFO7GWTFdY
	PudWcKn0DjZtnaKjY3Ou6FM1+aKim3M57NrVTrv0lq0bhLb38uZ9HJJFS/sVYjbEGWQAW4PknmQab
	Y58Vy3qI+R/JYHuaKWHEqvonotC9ZDSRheRj792LYYAvFw6BcVm4/HTP+1VkuDg1tgmnjdPZ83Y+a
	rKCu0efFxoU74YcXlQzdsmIhNLVJO6kaRhPj4PVdfYwhGVtEXdeNPLbgjR6utsfHZnrCka/fUVSyM
	BGjTASB7KDR6yAFEX/NbxcgAE05Ugg8iWeQ07rTzw4Wpr9ZxzF+Qfkw1o7bU6AcyY8BRKWvFQ32OT
	sW2dz7AA==;
Received: from [122.175.9.182] (port=42615 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u1lvT-0000000047R-1Et9;
	Mon, 07 Apr 2025 18:20:07 +0530
From: Parvathi Pudi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	tony@atomide.com,
	richardcochran@gmail.com,
	glaroque@baylibre.com,
	schnelle@linux.ibm.com,
	m-karicheri2@ti.com,
	rdunlap@infradead.org,
	diogo.ivo@siemens.com,
	basharath@couthit.com,
	parvathi@couthit.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v4 09/11] net: ti: prueth: Adds power management support for PRU-ICSS
Date: Mon,  7 Apr 2025 18:19:02 +0530
Message-Id: <20250407124904.1051462-10-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407102528.1048589-1-parvathi@couthit.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_135058_963002_FCEABEEC 
X-CRM114-Status: GOOD (  12.19  )
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

From: Roger Quadros <rogerq@ti.com>

Changes for supporting the sleep/resume feature for PRU-ICSS.

PRU-ICSS will be kept in IDLE mode for optimal power consumption by Linux
power management subsystem and will be resumed when it is required.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 8c6270c5cb87..90b5876b93ed 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -2308,6 +2308,63 @@ static void icssm_prueth_remove(struct platform_device *pdev)
 		pru_rproc_put(prueth->pru1);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int icssm_prueth_suspend(struct device *dev)
+{
+	struct prueth *prueth = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	int i, ret;
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		ndev = prueth->registered_netdevs[i];
+
+		if (!ndev)
+			continue;
+
+		if (netif_running(ndev)) {
+			netif_device_detach(ndev);
+			ret = icssm_emac_ndo_stop(ndev);
+			if (ret < 0) {
+				netdev_err(ndev, "failed to stop: %d", ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int icssm_prueth_resume(struct device *dev)
+{
+	struct prueth *prueth = dev_get_drvdata(dev);
+	struct net_device *ndev;
+	int i, ret;
+
+	for (i = 0; i < PRUETH_NUM_MACS; i++) {
+		ndev = prueth->registered_netdevs[i];
+
+		if (!ndev)
+			continue;
+
+		if (netif_running(ndev)) {
+			ret = icssm_emac_ndo_open(ndev);
+			if (ret < 0) {
+				netdev_err(ndev, "failed to start: %d", ret);
+				return ret;
+			}
+			netif_device_attach(ndev);
+		}
+	}
+
+	return 0;
+}
+
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops prueth_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(icssm_prueth_suspend, icssm_prueth_resume)
+};
+
 /* AM57xx SoC-specific firmware data */
 static struct prueth_private_data am57xx_prueth_pdata = {
 	.driver_data = PRUSS_AM57XX,
@@ -2333,6 +2390,7 @@ static struct platform_driver prueth_driver = {
 	.driver = {
 		.name = "prueth",
 		.of_match_table = prueth_dt_match,
+		.pm = &prueth_dev_pm_ops,
 	},
 };
 module_platform_driver(prueth_driver);
-- 
2.34.1


