Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB81CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqh8i/elFvAb7pieKkMXZjCnLslrNZI7sqbGtv3hqdU=; b=pK3bSxKbBDM+54UVUhEWet1hvn
	3BNFuy4jvabdIL+SJbYgskK70Yfsl9zIt36oZXMpk8a599xIJjFvvXoeXxvBQpRBlx4FOXIh5lx1u
	5SE5UaaUpgwbF5DEEyxSFz4gvozdqAzZt2u1jdHVdVEt/Svwjp8L1eBhGv8ezctU45/Pg1XJBQHhV
	J66LrU69TqfA/kfpFJ87yvtUT/gWexNJ0JyL9+aSEVZVl0bSm+PStNhL4weTc2AJbjRyau/XP9x8J
	i/KFrmNkkEesKe7iiernvHtMTw8kS1zFJ5lK+c6XhCTAoxW659v9+kXnNcta93XB8MSfPh5lrXZgP
	xQNF0mfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUR7-00000005kDK-3M7P;
	Thu, 30 Apr 2026 16:40:25 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIUQy-00000005k6n-2nS2;
	Thu, 30 Apr 2026 16:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Oq
	h8i/elFvAb7pieKkMXZjCnLslrNZI7sqbGtv3hqdU=; b=O+xAUzPs/HDqUs+ikB
	G7hjOUUaYIL9PKznoKTNCYL5WTzIrgt5QOApfGz4JuT8sC3sSOQ2qXcuRZf9z1kG
	wq8gV3ShKjLYMoXRxAYb6wQqSHAgqXbMoozitRj+0Bd4DfaN1qjczAsKe4UJ+CkO
	G5Q5TraabNFT57OsF9RwU7nro=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S6;
	Fri, 01 May 2026 00:39:30 +0800 (CST)
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
Subject: [PATCH 4/6] usb: xhci: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:39:17 +0800
Message-Id: <20260430163919.47372-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430163919.47372-1-18255117159@163.com>
References: <20260430163919.47372-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnUmm+hfNptZrZCg--.19910S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4rtFyftFy7Xr1fWFg_yoWDGrXEyF
	y5uw4fJ34kKr1YkF18ur97tr9Ykr95Xws5ZF1qgr1fWr18JFyxXwn7Xrn0qa45CFs7JrZ3
	A3ykWry8ZF4vyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMfQRPUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wLojGnzhcLQVwAA3X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_094017_032111_0BDA8EFF 
X-CRM114-Status: UNSURE (   8.29  )
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
 drivers/usb/host/xhci-hub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index bacd0ddd0d09..3830d4123961 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -226,9 +226,8 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 					   USB_SSP_SUBLINK_SPEED_ST_SYM_RX);
 			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
 
-			attr &= ~USB_SSP_SUBLINK_SPEED_ST;
-			attr |= FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
-					   USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
+			FIELD_MODIFY(USB_SSP_SUBLINK_SPEED_ST, &attr,
+				     USB_SSP_SUBLINK_SPEED_ST_SYM_TX);
 			ssp_cap->bmSublinkSpeedAttr[offset++] = cpu_to_le32(attr);
 			break;
 		case PLT_ASYM_RX:
-- 
2.34.1


