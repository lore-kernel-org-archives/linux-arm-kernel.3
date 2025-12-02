Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF7CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QFSXfKI/g+Y0zmED3MhMMetDM6rW4DNMKUwINwXOAYc=; b=McpWf/MDgufJedd75iCg2p0CYF
	XxI5volldLkR+Ba/5sPW0HB9BtLrpXLmwTrf1QmUPP3wOrT4ZLlqacMPzx+StYY3+jrGvfJY396Bp
	eD9JglE/QNgvPtyZK2IQ+gt6ThoymTUydHnqsY1KG6qFWc3rlXKapEL5ey9g4zq51IEPbXQ48+jjx
	hY/58WeQkx64OaIvE+Xnsfa9LoPGuP+Ey6hfR1qUBi3TWo5bjZnqKmksG2kPjyaWrwjNApOI6fg6t
	XV+JwM+zIVzlSAM1i0hgT/UFhKhRM4CX0a+KhGroQ0e5MJoZKQL4eFB27dWfEZhLDdt6ft7Toc0JZ
	SrYgitQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN4l-00000005CkG-3hAQ;
	Tue, 02 Dec 2025 09:53:39 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN4i-00000005Chw-0pFQ;
	Tue, 02 Dec 2025 09:53:38 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABXXW4Yty5pMOv0Ag--.51176S2;
	Tue, 02 Dec 2025 17:53:30 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] staging: vc04_services: vchiq_bus: Check return value of of_dma_configure()
Date: Tue,  2 Dec 2025 17:52:52 +0800
Message-ID: <20251202095253.1640-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXXW4Yty5pMOv0Ag--.51176S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1UCFyxGFy3Ar1DAF15twb_yoW8Gw1fpF
	4UWas5G34YgF45uws8XFZxWa4Yga92ka1rur97Gwn5Kr18Zryaqr9rKFy3Wrs5tr48Aay3
	XFWjgw18uw4UGF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUejjgDU
	UUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkEA2kupaZFZQAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_015336_419758_46FF321C 
X-CRM114-Status: UNSURE (   8.88  )
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

vchiq_device_register() ignores the return value of of_dma_configure(),
which may return -EPROBE_DEFER when the IOMMU is not ready or other error
codes. This allows device registration to proceed with incomplete DMA
configuration.

Check of_dma_configure() return value and fail device registration
on error.

Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_bus.c  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
index 41ece91ab88a..8d920a7a3777 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
@@ -80,7 +80,12 @@ vchiq_device_register(struct device *parent, const char *name)
 
 	device->drv_mgmt = dev_get_drvdata(parent);
 
-	of_dma_configure(&device->dev, parent->of_node, true);
+	ret = of_dma_configure(&device->dev, parent->of_node, true);
+	if (ret) {
+		dev_err(parent, "DMA configuration failed for %s: %d\n", name, ret);
+		kfree(device);
+		return NULL;
+	}
 
 	ret = device_register(&device->dev);
 	if (ret) {
-- 
2.50.1.windows.1


