Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80F1E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NqfFf4fv96alvmAhC70OVRBAMo6UG+0b5So5mFEFih0=; b=4RAlZmZno77Rcgzi5qVDHxluFx
	h+b0zXQ7OsRqBejlaztqtNbnCoApEHTaxeNSjmFF//udMplYqJZLamqe1zmrLnRP5KJ+S2MotcE2K
	U7bImxwB3f/nGYxgIvH+ht+6HtPXVbufcjm3Aj1kSowsPUwVVIGmiBUowP5hWbBUYeQD4u8+eNgJt
	mY7AsJGS5fQvWliN9fS3/1KsmHULT7KfsLIM6o9y7vn2gcp0CYJZ52YeVLDRR/+NP3X+U9qC1i+5n
	VKsdtqgUozzhjPy/lkN+s7b3pwjf3uY56Xfp/Wi1ll4wb9IqEUUok6tBjbXXwttEzd028gc4UsmH1
	5IISLRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXEVO-00000004Bup-2xRQ;
	Mon, 13 Jan 2025 07:04:58 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXETy-00000004Bd1-2cTr;
	Mon, 13 Jan 2025 07:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736751781;
	bh=NqfFf4fv96alvmAhC70OVRBAMo6UG+0b5So5mFEFih0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=h9oYIPNr8VTOIaZg0lQ6jY/J0s5u2uloGOtLNe2Sks6gJPYa/yZwP5ELxhx4/VffW
	 t8uq+T8+DiERceRd0ZEL7mxe5VUk9Oa/gAHVzyLKAKFYecADuuhO99lPCAT5amG6L3
	 S6zLVw8XpTRNjZ33jX5tZE1lSz8W6lm/4qtSCVOE=
X-QQ-mid: bizesmtpip3t1736751767tk1inzv
X-QQ-Originating-IP: LJtxmZbB0DRaJHg91pmdGdfDROe6I8rMwyDT1D/Zhos=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jan 2025 15:02:44 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12665532747322616285
From: WangYuli <wangyuli@uniontech.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	chui-hao.chiu@mediatek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	raoxu@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	zhanjun@uniontech.com,
	cug_yangyuancong@hotmail.com,
	lorenzo.bianconi@redhat.com,
	kvalo@codeaurora.org,
	aleksander.lobakin@intel.com,
	michal.pecio@gmail.com,
	dzm91@hust.edu.cn,
	jiefeng_li@hust.edu.cn,
	wangyuli@uniontech.com
Subject: [PATCH v3] wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Mon, 13 Jan 2025 15:02:41 +0800
Message-ID: <9DD7DE7AAB497CB7+20250113070241.63590-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NyhJqhc7wbHljMlVxsI5kTQy1AWnzg6d+ypniyrx3/rRK8MyM9Imnp1M
	s5J+Lj/XlwwYkT+e9/xK2IvEpAYHHDTBW2cr6/EUx4HUiz5sbp/SjHMipMsDowHN4lKpF0s
	8Tkm6GPfDyrg3G1jBJin+cU2bvis0WJxZhksYLjdGVn2Catbw62w2NBAnzLmUv+jQPNzI4W
	VUZmPsZ6me7DlgMLDc+cI59cIxGG6swBj2eUdcOyX8al/UP98FzjPq0TUhEXs40ohQQhjDj
	twqrurUR1xnamNaK8Dr3c0OqNGr9jQWYNwslvOYApJfE/sp9e3NtzbsPinSAzV9LTO+oGZO
	RS1eizC5NUbscmtaQEMnyjtSbUd9rm+XFD3Tltg+xgWgucF+dPYd/wH9laQFjgVJo2TQhV+
	D0PRM57A1c5K38+oLe+UXsJ5LWD20bB2ZMavAstpkep8Z/8W+1KS4MhQZTF5JVn8TIIWtNm
	E/tbAaY9dl7P0vgHjLESstJ6HR/H2oKKttETF6WME8oy7Xtzhj7lWa5gkbhMnTnADJs3YNI
	bmp4G7wPblgCaHWAO5zhAZimUC21tyvhq5M3GWCAm/gD9msPG36xSzOx/Pgq8boAmkViUVt
	QSDhHHwok4+PvEOx+c1AJ9Vm66f8qxxcOEihOuo7QtJuIDRtKuRrflRWJhWlEGOiuxFWpWV
	vK/ABwx3MHCGSX61NEXAeamVtonI5wTPE6t7q0dZ5TcPP45nezeTGjVdWxcAH8KiZUFQndg
	CgXMv33JR3YhLc0LC52GoRVbKIsDBJzKCOXGH6Ki7VXXxUxlLV2mPt6zvrc/bDfjbBotJhd
	fPx7bP90gtwDH/vxehZ0pvGVkG0bXhYNbvhx1hXCubT1FfMzh7V1Gv335TkBW1CXna/VdG8
	/kXaP6mPSVXZMmsGLQofWGWqjgtSbUpY3YQqlGZHVqmnlpU6u8zVuiG1QtUp/jh4E6DmNVe
	TV/jTvH9LV3GEEMSWYMYpguOJ6alkV7W7k1wE6nNpal0KdjdGXaVomvkXYutHqileO6HUVm
	V4eCqROk/JxiWFiMnF
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_230331_544481_F045EC6E 
X-CRM114-Status: GOOD (  14.18  )
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

The exception is printed as follows：

         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         mt76x2u 2-2.4:1.0: vendor request req:47 off:9018 failed:-71
         ...

It will continue to print more than 2000 times for about 5 minutes,
causing the usb device to be unable to be disconnected. During this
period, the usb port cannot recognize the new device because the old
device has not disconnected.

There may be other operating methods that cause -EPROTO, but -EPROTO is
a low-level hardware error. It is unwise to repeat vendor requests
expecting to read correct data. It is a better choice to treat -EPROTO
and -ENODEV the same way.

Similar to commit 9b0f100c1970 ("mt76: usb: process URBs with status
EPROTO properly") do no schedule rx_worker for urb marked with status
set  -EPROTO. I also reproduced this situation when plugging and
unplugging the device, and this patch is effective.

Just do not vendor request again for urb marked with status set -EPROTO.

Link: https://lore.kernel.org/all/531681bd-30f5-4a70-a156-bf8754b8e072@intel.com/
Link: https://lore.kernel.org/all/D4B9CC1FFC0CBAC3+20250105040607.154706-1-wangyuli@uniontech.com/
Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
Co-developed-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changlog:
 *v1 -> v2: Modify the commit title and message to provide a more
comprehensive description of the changes made. Additionally, append
a "Fixes" tag to accurately categorize the commit as a bug fix.
  v2 -> v3: Add the changelog and fix a typo in the commit message.
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
2.47.1


