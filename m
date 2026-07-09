Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7xrsZhtkxRKVle0WQR2/5hlAiXVX34rhtHg5f9pLUc=; b=q7+1WhbpYorR7RgDhRxccL1ete
	nLhcYRdW1kb3wAmJjMxhFHzK7a5KT93DFCv0kSJTmHON9T4U0GxWF14lXUZ0V73mLxTmBGGoMr6pc
	5TWY2HSkg941/hUn/C8hfAz11okiaYO/ewXi2r9C6n7/Gqhixbn5u7NA+OosPQcSSmnjyNCt3R2C0
	0suDUE+5SNizj79e7agLYM8cs9eYx5JWbzFWJaTTKW2Q3XnSW/Yp8MtUFYUddwrLbdZCjZi587o+Z
	b+rgeJ4mI2ZMMiGI+6BbSvI9XiglMwWDzfpxYDk+G3oYffeLbeYoJm4C3v4OBa+M1FVldKg6iLcY2
	T0xmDIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu34-00000003OXN-0ZBd;
	Thu, 09 Jul 2026 19:04:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu32-00000003OUM-1aXi;
	Thu, 09 Jul 2026 19:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LRlK7PDWDFr0CK0wJ5X0K5qNxpSE9LQpuM1vk+bvfJl8aF9s+gkHBktkn3C8zSatO
	 9Bg7ZcYox0jtOxibcgkIJ+m6XvTrj/vixNB4AuXEXtaEaqydAC2QYgz58QRpvAVf+2
	 2dwxJotXrUk0saWcasNP3WByPTfhC5L1qLYSE8E2ZHNR7jfQ+fK0HnpZ/bVtoy5VJi
	 92XH68KAvfo6Ee1A+nBaOuy9sLMSajVtz1BbsRCTyJXFMOF+C4dty/OfjiEXNbevX/
	 qOhyYv8d9sOsBjbzbdy6n+z2tShfn5e2dmKJCHXhx1lbrm5/SDl41rthDbYkPcsC3M
	 h58mdC9Xnue8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FB8117E0886;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D29A2480076; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:55 +0200
Subject: [PATCH v11 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-32-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUwylVYmiHshjS3rqR18XuKYaeZZMQQr
 FxKVYHML17PfIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qa7D8P/jz/LFwSXFSVQL2zT8yIcejSNQWNhv82ByFWvDZwflBkyBZpOQVUMbJOUyKTtD35fJD
 VBNAaTvnFeKT8HEOwuTn6N1UG/HNZxRilmuUpZY/Jwece0OvXyfQJRgYS/ZPMvN/YhyJOcUmsZ8
 gHyRi5PzD+BTUMUcKwuEFCnFaYyeySeycVMcHC4DZQvp4XyMbb/bM5fBctOl1xe+SxuNaYfJwqJ
 w1np+AW26GTWybNIhGk6u7fHqIDNTnA1m9+9fWejTZ+qN7sNyCKqx2JZsK/ZMC4OAH6+GdebRd1
 nHljKEHhI194cx6RVKuZ615DFJkaUyQ1mBUkWMEEjAPo6OSBaLwZmqo1G9jNszavyxWEDX1O44T
 FAET37U/faXjNxqQGXg5pc2ppOFxn6yp6ntZPhbjazm5MpAWgrN2Xjm50O6hWpsZrS0Hr2ql/uc
 OGMfPZvmYRU+gbabdQ9+q11wSU4Z4zUV9yYznMClJxssViF0C5jAtN6kzdGxa4vOcaHZComaQTj
 X6L+NyxEyFB1HZSzYZ4I/ISnw39x/vW1bAR3ea4IJXJBE6y/MkGy4cKIfeoLjWHbDcsPnUYd45K
 912LnLfuUTINp3AxUCsig5aPBlhhTrlmsJYrmNLFOJ1BK8hMddTNYwoMhlOA2B8jYiLfsPhxVOO
 1/ssEOhDAiu7BL/pv+UUsHQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120436_575941_A0AC2FED 
X-CRM114-Status: GOOD (  14.55  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its probe routine
marking everything as off and later on does a re-init, which avoids
the problem.

Apart from that rk_udphy_status_check() is called after the probe,
so it should not return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5d151fff9eeb..3fb6eea2979b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0


