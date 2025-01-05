Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C15E77198
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 04:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlFS13odVb55GccO5hmoQYgmewqIs0Q10x0eG5VUCq8=; b=Xxg9rj04a137ETydA2sHrkiFC3
	Hu+q94E0aJOoxso1v6Pft1i11oWy6bYGcVtGiw1rOvjc8QzA28EtJLkkdyhp3fS/T8CKBmAqx1crz
	V/PECN78QraQ05Ek46F6N+vN1lUC/uqW/KuzB/8DaVdCVKfXzFJP5CJmMLSHjqL3KyRahJCkT5rbC
	Xumdiklrz5ymTycZ2OFFFrfgLcutxXPIzAB+w61XrRVjp6fjUoy2xnBkqeVqxf50QQ8OqcYbjRirs
	a24MMpP2gPWV6W1URCEmUI2vGE3li2NRMG01BJjK1y4U6pmkcBHukSP9nW2o91qvoTYM4Wj8rzNnw
	2Hof5iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUHxI-0000000GEiI-3vQy;
	Sun, 05 Jan 2025 04:09:36 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUHvN-0000000GEOR-1Arl;
	Sun, 05 Jan 2025 04:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1736050018;
	bh=hlFS13odVb55GccO5hmoQYgmewqIs0Q10x0eG5VUCq8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AQ8ANtKEqa3pbiT8fHaQRTZZU5VBKrfid3etjdIAGBGcdHjoe1btsG9EFYknncKkn
	 Y4LqfeyRgVjO9RMrqKV2TeEzrq8UDp8Wc5f60ljZrspCpbZ45jynOJprofbUk0rTt6
	 1hKKbrVSxAL/Ty3zywqQp3KcsaSwtDB33TVHfI/4=
X-QQ-mid: bizesmtpip3t1736049974t9n3jgf
X-QQ-Originating-IP: r3BhvYPkQ0Z7fN4+I8N2dlayxH2rSIzco4OOtcliAm8=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 05 Jan 2025 12:06:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12459793524915979078
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
	zhanjun@uniontech.com,
	cug_yangyuancong@hotmail.com,
	lorenzo.bianconi@redhat.com,
	kvalo@codeaurora.org,
	aleksander.lobakin@intel.com,
	michal.pecio@gmail.com,
	dzm91@hust.edu.cn,
	jiefeng_li@hust.edu.cn,
	WangYuli <wangyuli@uniontech.com>
Subject: [RESEND PATCH] wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
Date: Sun,  5 Jan 2025 12:06:07 +0800
Message-ID: <D4B9CC1FFC0CBAC3+20250105040607.154706-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OYpbVsTx4C813yBXpUNDiFeg0S8h8eLemVtdvmfcNDEtHvwmggmUz5su
	idbETQjVCbj4Vvm5wNINsFSP8xKcA1noW01TSjswM0EyhcniVvyY0yFqZ2IVxk54NgWaq6P
	9+EElzJheS+8SwHMwgH/9FFcBzxrbmNcZ6O1zgC5dEGnCm2bHtshhhAdVVzxKEg3o76wNz9
	uqNjyiVOWgCotJ/NJpwcaQe3FOeKNIUMBdwCNQpDenYtbHoGa6r1vWZNy944Kk10jVSGKKW
	6YT/5OflyHjER1eiHERJukWJwNWZ0zeak0/3in6lg9+7OCz58nPINFP7KeYApPNLBIzBHof
	JcYdWNfFijOI3nt0WFB4t00W9vMJq6jjSCwpy6MjzxegMUpHT79c5nlOv3QKts3JXOHJr0h
	dfoawRxOyWd5mreUsb/DPAehyM4L1Sdx1134M40M0BXJmsgisyLlVh74gC8F2JXLjnyyJTr
	wczE0DtLSlpVtfMJ4+c4tz/JWdvJ27/494+sp9kSsWFRjxGk/gPQzVInv1j3X/8xxMdmFSQ
	rFsXOLBvo6fqEujmg2LlvbXyoXtvkKL/m+zrlFQlczgWud9HXR5aaRUGHfMYVjzNM/wXIQ+
	C699PqFIFMZ8oFsPSuNTdtKPTpT+0or9A/9xPs9VHg3O9rEVTe0OC0qXzxNtRbVmcPQqdny
	fF3WQivFLNIhVPstk3TJOH1A212OHR/UkSKvClRoJD5i/jN3wB92+s+/p+iOoYoRixyfLYl
	XDVZtlJQ8SL9gt+UKQEy9HBCGb9V/w4KcJtzoAj9+nRciNjR4+PpuW3eVKQrg0AGW9/VV0z
	epJpzldwvvQ6hS28zxQ0r0MEch1uC8AX96iYmz4hcwqTo+yFNjnDt9Ilr+DbKYmR1zDfS4a
	Crd2qwMSbnWTCde7fO2OidmVGZZ7traar9qRmpVmLlaUj9CIsmyhrtfK8R2/bAamg1BSEnh
	ESVf/0XQUdfdWJv5qL/HOFCmbUqGaCiAlK5Pk3leHKFCukDYwFvqs3KcuHPsS73N3+pO3W/
	R9lFnKzh10fSdeSO5DPYQrMRAaOZs=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_200737_964992_8DD876C8 
X-CRM114-Status: GOOD (  11.64  )
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
and -ENODEV the same way。

Similar to commit 9b0f100c1970 ("mt76: usb: process URBs with status
EPROTO properly") do no schedule rx_worker for urb marked with status
set  -EPROTO. I also reproduced this situation when plugging and
unplugging the device, and this patch is effective.

Just do not vendor request again for urb marked with status set -EPROTO.

Link: https://lore.kernel.org/all/531681bd-30f5-4a70-a156-bf8754b8e072@intel.com/
Fixes: b40b15e1521f ("mt76: add usb support to mt76 layer")
Co-developed-by: Xu Rao <raoxu@uniontech.com>
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


