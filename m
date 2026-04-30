Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B781ACD3423
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+y6l1pdaoPallINfZ97mYoBt0a1nOeHpavNgPm3SNZU=; b=W9mbt0a+aOJV+3PdkpdSJySREo
	I0mGKOFlJZva1CZ1I80DWCP9sJ57bU0rB0t8DY5VU98TrznVlkmiQ9E6plLhYMyXEp8+GDiay5ycj
	Wd4tZ3tdgUyhRr5vt1lON+o6dhOIpF+757Jq0EyWBVq+nE31U1yv1NTuLhUgdAjIFvCpR7FkKcnma
	mm2ekHe5hFVYAauX6fgKueyxHFdqn90/dadRGmJKqXcoLQDiJOhvwY/HOzPnUcPhI4RFvnwfUA2Lm
	8D0Nt71RgOhckyEk/i+jDLFC//mrVGHAWLkLokAeaZtapv3s6UfsiLRfMnLuyP+1E4V4eF3s8ZxwV
	YXK8kXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUR6-00000005kBc-1Tiq;
	Thu, 30 Apr 2026 16:40:24 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQv-00000005k5S-22wi;
	Thu, 30 Apr 2026 16:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+y
	6l1pdaoPallINfZ97mYoBt0a1nOeHpavNgPm3SNZU=; b=A4+Y8GswvRq4Q6OR/R
	XJ0wL77xFznNKE3+KXDYF9hgEPKh70hDL/7zq8/Q7lvBhA+yIn0vKXROtKF+X4NA
	vMcA5moJRaLcM+punh/dQAWSAOvfyOejRIxvI3Lu6F0dkRr2vtIOMpRV8IYMKAxm
	SlwlnxwrUw96sYfqXXbMQOFjE=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S4;
	Fri, 01 May 2026 00:39:28 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/6] usb: dwc3: google: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:15 +0800
Message-Id: <20260430163919.47372-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4fCFy3CF4DCw17Wrg_yoWDWwc_W3
	45Ar1Svr1Dua9xtF1qk34fZryqqw10q34xuF1jqay3Gr1UKFW8WrWvvryktryrZry7Zrn2
	kr4DuryY93srtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRu89K3UUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wDojGnzhcDQDgAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094013_834520_0DF67463 
X-CRM114-Status: UNSURE (   7.99  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/usb/dwc3/dwc3-google.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-google.c
index 4ca567ec01d0..60ee4cc99b28 100644
--- a/drivers/usb/dwc3/dwc3-google.c
+++ b/drivers/usb/dwc3/dwc3-google.c
@@ -104,9 +104,8 @@ static int dwc3_google_set_pmu_state(struct dwc3_google *google, int state)
 	regmap_read(google->usb_cfg_regmap,
 		    google->host_cfg_offset + HOST_CFG1_OFFSET, &reg);
 
-	reg &= ~HOST_CFG1_PM_POWER_STATE_REQUEST;
-	reg |= (FIELD_PREP(HOST_CFG1_PM_POWER_STATE_REQUEST, state) |
-		HOST_CFG1_PME_EN);
+	FIELD_MODIFY(HOST_CFG1_PM_POWER_STATE_REQUEST, &reg, state);
+	reg |= HOST_CFG1_PME_EN;
 	regmap_write(google->usb_cfg_regmap,
 		     google->host_cfg_offset + HOST_CFG1_OFFSET, reg);
 
-- 
2.34.1


