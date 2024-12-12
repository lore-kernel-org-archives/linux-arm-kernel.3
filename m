Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59859E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmDmfjALJdwCEQjH8AW9kCnmFJr/bchQ5BJsBbZoylg=; b=Fdgu1Yf/vMOsp8wqv7yp58LMDv
	VtBQKePM9aw0kuVAdp0XsjxUvlsWHjRF6VjnKdJ7FGMOrHmO7pjdA12k3vTiduP57UazM1s9JHKcZ
	uV77z/J0J88E6US6u0opdTkV4zeqIqqZogtTmusU+8slQdk2pNi1ffKw9L+c/dQqtTSW+YqoPUlWX
	PS/Z0SHJOSQtDV3SCwp8ZVVQzmpcLaxiYN1KQXpIFm4pD0w95YDZIl/Su6WJ7CwhyntSpGcbRc1fD
	BDvThoS7N7aebn6ByWAAHEStGXH0l9wxukenrrtk6UKXCFEITIMKRTCwveQlg7OXCi/61DkzoT9Z2
	COW+dpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpTv-00000001kdy-3fDQ;
	Thu, 12 Dec 2024 20:08:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPi-00000001jhz-3cDS;
	Thu, 12 Dec 2024 20:04:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033836;
	bh=c+MpG+anKYTp08zkr7m18UAM/ICmNVHs0fwN4TQT7ug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iPQ6wBLRBNVjySpnmdW3TSqAf2TxkCxgPunouVnQaEz4uhD5LKlqGO3Gwy4PGt2w2
	 BM0WJKbIRgSvRIU2o2dyee8whIRm0k3w4FK7kSjn1qELFLcXXUdIGGJ9oxmnN2Vaq7
	 DPxWYPe0wM3Xvfb3tNJ6NsEIiNP2NPiJV3SWs4t89z/9rY60cJw/G93Ly5s+NSScXv
	 XPMK7DomzsQnUwRvcDhZtWT/F8YocGK1zIq2LsnN8UEWyk5gWSLgJVnnK/ydhSAXsP
	 rF/3ss6hNbPdsVpbpoK85rMOz+Em6ZeBs9Kmt6JXiF+vD1upvoNqYdwc5jITric0LD
	 2PH5H1PJhl7xw==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1773C17E37FC;
	Thu, 12 Dec 2024 21:03:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:33 +0200
Subject: [PATCH v2 2/8] phy: hdmi: Add color depth configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-2-57e672c7c7c4@collabora.com>
References: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
In-Reply-To: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_120359_050697_CDA99142 
X-CRM114-Status: UNSURE (   9.53  )
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

Extend the HDMI configuration options to allow managing bits per color
channel.  This is required by some PHY drivers such as
rockchip-samsung-hdptx.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index 6a696922bc7f29af63d88646701b2c0fcee5c885..f0ec963c6e84f1b7728acafc824dff191c6b873d 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -9,11 +9,13 @@
 /**
  * struct phy_configure_opts_hdmi - HDMI configuration set
  * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
+ * @bpc: Bits per color channel.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
 struct phy_configure_opts_hdmi {
 	unsigned long long tmds_char_rate;
+	unsigned int bpc;
 };
 
 #endif /* __PHY_HDMI_H_ */

-- 
2.47.0


