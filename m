Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08200C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImgTLdqMQ1HWln0/pjTdJ4Wv5Wf+bnJovoBh7j+FUq8=; b=SX1GVjwD0Kdxwgptl6uykF4LgQ
	pcSnLYXRtAWqS9xuKBKUyPoplcqQlBD3Qm1K7Zp422l8gyv9dUDn7KRtNzuyxrXLeVAjtCtzM7mqE
	PU53/gyrQ7df+37Cfu9CBYJXGXFdHpZ1fARuTFIPtn9fuRzt/zINXzEv7c8UfT2use0zz4zy6e1dk
	aBl6RNunDgrM/GtLvs24XsclsUqrLe4tYo3oMxx1o2zIcgNTNCx9PGQ0LTKpWcCTcEAw/qCnmd7sO
	Zt5f0R9c+Wx9qd+SnSp85l3cqmWJTCz8gkYD75L1kFeDUFj1dsjIF7G/CjTnp/IKs/8yiB+XEIwDK
	lxbwdgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4TS-000000063O8-2D3c;
	Tue, 25 Mar 2025 13:37:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4MK-000000062GX-1Drc;
	Tue, 25 Mar 2025 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ImgTLdqMQ1HWln0/pjTdJ4Wv5Wf+bnJovoBh7j+FUq8=; b=Y4JEIfCXe3dl3QLHrKHt96tFUo
	+GIa/+A48iu/gaMs06qgtMByCroT43z++Hka8IUT5TA2mj034vOZdJafIK7t0+JYaPbNPjC82JngE
	QP153oWgzWRqk9l+mixxU+SFN091WiexZXnDbF/G3F8Ve9TQZx8haYqyat67y5vyDosCPdBkUDH1c
	+7lnPnq88eW9QAtWz5Prkl2+PV/FjR8H7mtT/ZiYc/Xiz6dA9y7JUZwlmNLTHqWdCpjSWC/N8P/gU
	MetgWere2G8qqTlu9yAh9BVc7pbN1QUU6N8BRKHp1xnq+KC+6R5ABDYKixeCerfWA/E0F6Qjuvd0d
	61lgsH8w==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4MH-00000005Snm-0HAo;
	Tue, 25 Mar 2025 13:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=ImgTL
	dqMQ1HWln0/pjTdJ4Wv5Wf+bnJovoBh7j+FUq8=; b=kIhzMVOCLBFylit8p4PG3
	RQuG14+3qmmuGUjVkkouivWS3loXJ5QTbei0vILd9ta98s4X5nmKmPK6TYcAJovC
	A+q2frQ7jwaTDy5ovPPy8pINeVKq7Ip8PihXnUas8AX/kB296qxcIOZJbpRMwKAs
	6l8VMdbtxS3GHEMNV5RtFM=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S5;
	Tue, 25 Mar 2025 21:29:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 3/6] drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
Date: Tue, 25 Mar 2025 21:29:37 +0800
Message-ID: <20250325132944.171111-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryfXr47XFy5uw1kCr17Jrb_yoW8AFWUpr
	ZxJFyjva48XF18W347ua15Ar1Sya1Uta18CrZrGwn5Zw17Zr4Dtry3ZFWFqrWFyF95Za1a
	y393Xa4UZ3W7WaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jZfHUUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hMbXmfirF9ioAAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133021_686713_0C7FE1D9 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Use dev_err_probe simplify the error handle.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- First included in this series

 drivers/gpu/drm/rockchip/inno_hdmi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 483ecfeaebb08..e891d42dd08a4 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -885,29 +885,22 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(hdmi->regs);
 
 	hdmi->pclk = devm_clk_get(hdmi->dev, "pclk");
-	if (IS_ERR(hdmi->pclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI pclk clk\n");
-		return PTR_ERR(hdmi->pclk);
-	}
+	if (IS_ERR(hdmi->pclk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
 
 	ret = clk_prepare_enable(hdmi->pclk);
-	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI pclk clock: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot enable HDMI pclk: %d\n", ret);
 
 	hdmi->refclk = devm_clk_get_optional(hdmi->dev, "ref");
 	if (IS_ERR(hdmi->refclk)) {
-		DRM_DEV_ERROR(hdmi->dev, "Unable to get HDMI reference clock\n");
-		ret = PTR_ERR(hdmi->refclk);
+		ret = dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
 		goto err_disable_pclk;
 	}
 
 	ret = clk_prepare_enable(hdmi->refclk);
 	if (ret) {
-		DRM_DEV_ERROR(hdmi->dev,
-			      "Cannot enable HDMI reference clock: %d\n", ret);
+		ret = dev_err_probe(dev, ret, "Cannot enable HDMI refclk: %d\n", ret);
 		goto err_disable_pclk;
 	}
 
-- 
2.43.0


