Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A7ECD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDsMAqiDey72kv51bqnl/z6qjCUvcOw5P+Pu54iYqD8=; b=y2L+YtZ52xyv/jckHItZqGGwRY
	Rx4lRKJQnmWSeVyg4NuW39ZHw7wIjM4shUiqxkOkmfg/6e5PyX9haTEsrD5HjQSfrlSuv7+D6pDGa
	HZLQ30KtVJt/m/jY6kAZ76SMgAKr3Lt9lCgw04VMNnDuMsQUA0L47el/NJm/+usnURDwdHrVv8hvq
	2Txl8VhYIRSgJ2Vl77qfp1alukSIcek3QLAvry0ooqqZKGEQi/JbKgRj9gc6oE0VFc+0+n2jEMnSF
	Bm0JW4fZc1j3xYcjTtbgLFuEpyiwX8PudrLMFdToejC7CAMMtjWRScNIzNNoOv3nVOfyf5RCcKwXC
	6s8BtuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd8N-00000008aW2-2XIm;
	Sat, 09 May 2026 08:34:03 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd8K-00000008aS2-3u67;
	Sat, 09 May 2026 08:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=QDsMAqiDey72kv51bqnl/z6qjCUvcOw5P+Pu54iYqD8=;
	b=TkTGr1fZRiAvq7qXNr6eU57F6n/UKru6bVON/FkD3GauRb9vSpch7k5mZhtV5n
	9rlw5zgxl3JS574SBgCVxRgHxlTJKp1JveD6YrQzbWo5skJO5ev6KCCnjRRprHph
	AvytLTB4ZwJr2XaFfMyrnIQzXXAr2c4OsWaoUhbCiMvBI=
Received: from [127.0.1.1] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHNvZq8f5p9I7gCw--.795S2;
	Sat, 09 May 2026 16:33:47 +0800 (CST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] drm/rockchip: Fix vop2_create_crtcs() error path cleanup in vop2_bind()
Message-ID: <177831562588.322716.15278219029796776135@163.com>
Date: Sat, 09 May 2026 16:33:45 +0800
In-Reply-To: <177831560568.322716.7926332149561323511@163.com>
References: <177831560568.322716.7926332149561323511@163.com>
X-CM-TRANSID: PCgvCgDHNvZq8f5p9I7gCw--.795S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1kAF18ur1rCryxKry8Xwb_yoW8GF4kpw
	4kJrWUZr4DKr40qF1kAF1kuF4F9w4SyayfJFn2k343uFnrKr1qyr1Y9a4Fyr43XF4xCFyj
	vFZrJ3y5XF1j9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUl19UUUUU=
X-Originating-IP: [42.63.126.112]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzQuwBGn+8WsmAAAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_013401_314836_052D80A3 
X-CRM114-Status: GOOD (  11.68  )
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

In vop2_bind(), when vop2_create_crtcs() fails, the function returns
immediately without calling vop2_destroy_crtcs(). This means any
of_node references stored in vp->crtc.port by vop2_create_crtcs() are
leaked, as they are only released in vop2_destroy_crtcs().

Fix by ensuring vop2_create_crtcs() failures go through the err_crtcs
label, which calls vop2_destroy_crtcs() to properly release all
resources including of_node references.

Note: the IRQ registered via devm_request_irq() earlier in vop2_bind()
is managed by devres and must NOT be manually freed in the error path.
Devres will automatically release it when the device is unbound or
released by the component framework.

Signed-off-by: Jiaqi <shijiaqi_develop@163.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8afabe2118a9..1234567890ab 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2735,7 +2735,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vop2_create_crtcs(vop2);
 	if (ret)
-		return ret;
+		goto err_crtcs;
 
 	ret = vop2_find_rgb_encoder(vop2);
 	if (ret >= 0) {
--
2.40.0


