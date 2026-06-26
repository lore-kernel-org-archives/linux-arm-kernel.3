Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAEBC43211
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/AAXKdqJliLeefHA90pVwq8a+f2zTI2aj5fon+91r4=; b=pG1o+dU4Y0uo0R3Nk11fylvZ+b
	o8lWdjQbpyxfe3vyXt6fR77bvXoKhzjN0yHftJtNlXZ8g0Tdk1tUE/goZHids8ND8DVi+33abU/CN
	ziWQDf9R+uaYqtbF7fzVYYgFZRp8Bl47Nc0eWK9XUlbI9024EZeZ+BURGwhjTWjsh1yp4wFPw22Oi
	dpoCfdywm8/3ve55NBKLj2AruRDQDXRpzN7NPpyzFbTE9ddpQBpBKNbwdAfc0HnCoyB2hh6C2qW5G
	OfrIuTYQ9PK49ejHyewz8SbBG4xC/0JNvBKlbFd95P1igY/ck82BbF9Kt8rEEpAlPeIOSnjPRMBob
	aJe4jf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbO-0000000BrFz-2efw;
	Fri, 26 Jun 2026 20:56:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDa0-0000000Bpgl-0waL;
	Fri, 26 Jun 2026 20:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=GEM2lIbnRIm7Nvs/sTuHq+ytCoYrU2B/k7spbg9gs0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bExwaVsZH7/SYzAg0DVj9jUvhFzptcJWPq7gW9o9MHWsqknE+wnEyQ3njNksgy+Jq
	 E6C7CKZe04T90qxuZXQzh18XejHD5VT79hcVbREi9Fq6Fz9hEJEXQdLzSgvCw11JNz
	 gDfPs6ygvwtofAOrEAwio2AB32Lj1RfM4gAvzQqV09hn65Fcr+IvlDGQIrkKnaSHNb
	 HKWI8ejLadHH0rfPjuIjEQSwgjj94EvOPq2iCsQwtwr2cWRq2Q7vynU1eslvW2gdlv
	 cq9vlqvqhLGu4Esfizzmf28UMky1zhswEPRHspJ/9sosBRu7i1OY6FuLTe1VtRoL2O
	 doaHIHTdghzEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 590B617E35C8;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 31C5D48006B; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:19 +0200
Subject: [PATCH v8 26/29] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-26-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GEM2lIbnRIm7Nvs/sTuHq+ytCoYrU2B/k7spbg9gs0U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVAHi3Zev+f9xGFi8LfTlZhI9cxCmipJ
 UkSCqRABUR1hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qatPEQAJHA9o1JD5EyfeJPJ/JLHTR0CEkEW8S93dMQdof+5mzrp0XOtlvIoO520CmB9POcxTX
 fHyz31o5yTyFulcUcYr+NE4p/bQPJs5rCqdofn6siiVQicOuWD40/uT/DT1+0vo5DwRgraT8bPA
 4K4IOfaLrMCa3cSNN2eDxdBtol+prqZ6YC1vPNpa6w3NLlDPx8hUhmNPScC+vX0JBbfe27kDk/n
 wmYfl3Phwndm0Kn6YRe2XBdkg+1YgOZB4WqgZCOrSQNq9wLtGrGHQ/ObzGflPRwDM3sYj1X3FTH
 8895lqukWm70s/HCESu7BQrGVdE/rAuon71OW2hveZjFk+MO3jfcGr10ILl7E2PhDDDz8A3iUZu
 Q2ls6jaBSOoJIJqw4tBFbuYMYLv01rMzKys5Hp1I99NdMh+D3gZPcj96RrZ2bSxxlo2k0MwVHdv
 KSFQ81sAIOk9K+7u6IW+c5qv4MLHQYZ/NZVRzzdWT3bd8Kb718CuHsQ5QxrZeP/SDfs9lgTP1Um
 pwhB0GHxUF29Phc/NTNKBXsTf/TUvFQ+AxPeqSfnqx6cdGz8A6olDGhw7DFm+OCtLZW4Tl3QEeO
 qgI/5XuY15NIy4FGS6ZTfIwJPNeAJdh3BJ8G+xWna/Yt/59ek/jDByvmb99Ol7MGrkLO1Zn/Srs
 9AW5Bs4Z4IbjoqpqI+K40jA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135516_504398_323F232A 
X-CRM114-Status: GOOD (  10.30  )
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

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 15c18c6e3093..2681610d10d5 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1193,6 +1193,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


