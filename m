Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C94CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7WX7SXxIEP1qHfOu855HmkBDTioBvilCK8b6319vKo=; b=w5CjS6+ivzf636fKAblWPiX9+j
	OPc8I9UT5n55OVPc0MzJrJDN0vDqHl6ojUv/9fodhgmWavgNjc7d14K+rFujwJsPDucImeg5FxbyR
	nVVNkEXShzcxcwQJ8f9mvFK2gU6K2KAsFOKLfacXPyc17pl2eP9VmHjEFiCZq1nmyt+Vxrw2fH1LU
	yKt7Gb/yMHihp8xlJQKqe+NEGaWSdNoZBRbY5bedSCM49p2SCmKLcJGyr5HSkZNeG1YsYjTVl5Rrd
	opUsmcAdgKsnOVrXTDCuGwOqLRUMZsnsufkjtNfG6LLnaUazJ4HnMgkw6u2NDFVOW1F0vZ2X41JBZ
	hLjz9YZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAK-00000002elg-1myD;
	Fri, 19 Jun 2026 15:29:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9a-00000002dcK-0Hey;
	Fri, 19 Jun 2026 15:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=7DI+RHmwmwOKQNaB2HylLylJp2KES9vdbb2FVIqpRQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Assn3H5RNmWsDVeDWZhDxjkL/b7okZO6ORPt1hkZ6fBlTeGGSti4sc7qesE0uCaav
	 d9bYnraJS9wRRj/6d01R9m5Hcw7VPo1NDo4RzSjguOKWmP/Qwcags86H6c60W6nBmG
	 J9YYDeCxWvml8xFDaa/gtOcJi3qZtXwr8ZPlCuh2AcGRO8nmGzxEmwcmbEzjUnllcf
	 xBNwIevZNDFT9U0bDOh5DzhqCkEDmWEUARyzhgFd/gD8hjFL96PSTbN1EWh/53hq6W
	 r9P/+XjH66Gk5jX0GenJhz+p7x3l1qNjnXNXqCYAlKw3uEElVapiCdvPDDWOEd/mji
	 C62QRNlBp44FA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE29F17E15CF;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A8B40480067; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:29:13 +0200
Subject: [PATCH v6 22/23] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-22-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 bh=7DI+RHmwmwOKQNaB2HylLylJp2KES9vdbb2FVIqpRQA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDkcnB5awIvA+Y4xIbbpdL4bx76UX4zdy
 Fvv8TtYcJEd2IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA5AAoJENju1/PI
 O/qavrUP/Ref6911SkrhHGixV4ezS+koaxNitDebclE+VibzFGQJa53zLiDH31PRdWEeBbcs1GL
 7TSpzXjagmKoqocRVzdQ6BUjDJJlnOEH8JgWT4M0JWksJXogkYYvMAfLqVldBO5misbX77YA1bh
 3iKJyQPqBcrTXNWd/rW8HTmeS0rSu8/YivLxV4THDBMPal5DXBV3bUCnOLsbvzw5KeLFwnmgzQb
 3+4GtlI00CdojicTsllYwGBiTp39v/1/GyXUqbSkzGK/guetjOOvOXbBj6P8RoqeKWHB4DIi/iR
 UoxignbPvKbNmoE0YWoExrXuhp4gYsvRvPEEcaGRsyDr4t8B915kaE3cuARE0zIuDY9cI8IrTfp
 kCJ15ka6DL/zBRiwvEQMqQqMFmZk8aGuUvMd3Z0dEOPrlsv8/ij/AwI7rB32hEJZ593u04uslq5
 0rZRR+ETL5cnMileaUQg8+LSck01ODC1SuMI+IZF5YguxU52o4caoTqz8guqA1DvQJWnMMFK3OV
 47u63pRvrkdMs6fd8VpxsblqANVAXqxWNLpTSvyYOXRp63yYdaoq+prFKJG3lbDOuqotXm6bp9r
 3/hMq0QZxd8nKet5r5XwhDi/2gceiT0lvOiV/KxRFeMsypc80iQ+HC6bpFa22dwchXh7JcWwCYD
 yPhTUzkuLvDsPJOFsKXgvfQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082910_289924_BCDDF17B 
X-CRM114-Status: GOOD (  10.86  )
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
index 7f26b74cb515..8c59c50f207e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1183,6 +1183,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


