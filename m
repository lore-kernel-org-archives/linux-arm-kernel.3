Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970B5D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=; b=471oKXAyUIRLlMBE4S4qBCHjGA
	ukvjHVbuAyUq7Qrsge+n5RZUkUb1HMUPYhDyvmt0IFwVBIcwSWfY0+3l9FP2VdXcAXL6HCULqtm83
	rkj/2dCxZASfkpE50RuklnYbR/KjzOpebCqu2/H9KxA/G5yPSNcVCAvY3eICLgyP5i9gzW0wnTK43
	gbOEFmGzIPHplGzi8Re4pjsuHAJfxH2N5d9z62towmSx7W0T6DDeEbfSSLnoLLkK4OxeVZ5wt8aty
	kkXuLrACocuarrIlxn0yMOkAtxQW0VMzFE6HEBPNzuaTzlpc5bn9/A2IS38nQdcD0KSLniH83ugcI
	Ja1woU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KsP-00000009ssZ-0QCg;
	Fri, 08 Nov 2024 09:01:57 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KhQ-00000009qM5-0oxr;
	Fri, 08 Nov 2024 08:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1731055773;
	bh=rGntS9xOFiEeM/CMGDTBCcX5N9b7TzQhEkYEMSmKp44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kovUYlF4xp78RmN+5+6TUjZ9t/uAa4cVBOpU4UdNYIkTSs11+QYCqGBbJ8yEH48T6
	 diiA4BarUFgLH7TdoFQjAI5StMYyguPzEuduDvXvPwlW4BChQ0heM0G/UB8tEQIzmg
	 qF7U8WJ3khfJQK8y8T3xvuBp9ZhWxfT0HSeKIjBM=
X-QQ-mid: bizesmtpsz7t1731055731tg3r48f
X-QQ-Originating-IP: HMuPYdKxHaX+3uAFUvJr/WnEj9U/cZBw6s5Od/w6wdk=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Nov 2024 16:48:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9163737178640773369
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	cug_yangyuancong@hotmail.com,
	lorenzo.bianconi@redhat.com,
	kvalo@codeaurora.org,
	sidhayn@gmail.com,
	lorenzo.bianconi83@gmail.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND. PATCH] mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Fri,  8 Nov 2024 16:48:44 +0800
Message-ID: <76949420D67A0377+20241108084844.216593-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MmpliBmRb3iCna4Loymznh2bTSoUZflSjadsWYUfXWQH3rRrT0BhzM0o
	g0qrioCwjxh6Zp7xOd36xm7C+lwEOdDXsmRtq10FVCPvemQlVp8VlPKRdMsoNKTZ77+7L6B
	W5myss3rGcmNDitpCTRKzCqmpPZ4u+Gsr6jo9l/7Q+258spibPkk2HdyikHGXcVEZw4QNEC
	9nIEbnvEOt0RhuDm5fMjaslBvJHNWBItLue+Jgfm7A9lvfXWcwagfziFDOoT+PZO3DYZMnz
	mhpr82ceoKs4CW69wAcI7EtBsJNgVrN7Z3HkSwvqT8Q8B8lmyOuAvDUHI7tsJ9YgO3NXc6g
	Y/pcl9q2GDp8S7HQBollSHYrj+E8q4vxih7HprvKFH1jUmCvxv9GcGpIxPN8QP1jfkISePD
	6QgGhZklVBv4WuypWpUTY+yKjCnOiD268nvS5jE+tYQ/k/8LR4E6iwYZFY6/UiRxz9SnjwP
	twN4DZvva00VsAomvvvXyBJ0eAph1H9pZSIQyH0yjCqC3jGpNYJiltdzCaUOIVOsOODCBbA
	0Ssq1RevUm9KVGcrgXBlqAIwBbQln8udTiTpH7/NuparkNDrtUubzzIDgUW+n+c+zG8VXE3
	ERB9yKA6kW243joGaDb8TJsBnSLe0xEGkXHlal6SpyS3tTnw/STgxTilMKDWMaiS8ykrMlZ
	qK67jBWTP65dEREpDaieOijD1cVgrpIvl3YGypvo45N4SSdJDGNh5KGFsg5YT3k+Tn85YTf
	bIbSfjqu1JIYv/UAL8ofur3KSIZvXnrkAQEYuEqCXtRT6n1RcwNscs8D7eNuskyyMtr+NxI
	MXN0fUkYad0zUGIDnOYYwfSXMDetyFJhXJL6SgQEY6isiivDCyKmttVc7rkneN0ReI0XhmB
	iQgX+J+N6hK7usUMQ9clP+Wg99Bsf67NH8nF8862wkDDGV6ZdLGdiOXA1zQUkfOmkHQRuq+
	5oSdBdtlyKNonyt9yzcPj6JwfznLMMavje7WJydY6n6kjE4+It2rn6kZkXZLRQWmA03mDzj
	Z0JoC/5D07qf2t+lYoDDfPH0jJAhk=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_005036_958452_78BAB05D 
X-CRM114-Status: UNSURE (   8.38  )
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

When initializing the network card, unplugging the device will
trigger an -EPROTO error, resulting in a flood of error messages
being printed frantically.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 58ff06823389..f9e67b8c3b3c 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -33,9 +33,9 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 
 		ret = usb_control_msg(udev, pipe, req, req_type, val,
 				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
-		if (ret == -ENODEV)
+		if (ret == -ENODEV || ret == -EPROTO)
 			set_bit(MT76_REMOVED, &dev->phy.state);
-		if (ret >= 0 || ret == -ENODEV)
+		if (ret >= 0 || ret == -ENODEV || ret == -EPROTO)
 			return ret;
 		usleep_range(5000, 10000);
 	}
-- 
2.45.2


