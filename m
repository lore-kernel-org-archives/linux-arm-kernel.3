Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3690C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tIy0ICFI32mZuNmMcVPEQ43qstDY+Oaao9BkD0xJVQ=; b=CNgwbIFiwL8H6d5GPa4R1/r1hI
	ZPVeEkXziPqsF3gpsNqk/ZHYo93Jd6iGU5s0ty2ziGm4f1rZ6NC7BNPRFjVPzilrBcO9he5jz5bo0
	DTuJkWkti3m88XiYuv1hvfaxwThwD9UkpxlMBf53MdpNnQMwtdO+UM0Hq6NsTppWjnw9lVBToUbg4
	cBRQMtrbPwxgY5K7jBxVnIlqD7yPGzJkOxALVy6bb+p2ge+irAf42srnw3fuYWhrm/HVuKrQsNJck
	OHb+R6F/yx4Xe2WvckR1K+/6oGOA9Djw/kiq7iOJfSxqk329Z+kTcrlXbTecwNyXCRi6+jCRNfBLf
	/cFlUhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfl7-0000000C4tE-2EjS;
	Mon, 06 Jul 2026 09:37:01 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfl4-0000000C4r3-32wE;
	Mon, 06 Jul 2026 09:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783330576;
	bh=9tIy0ICFI32mZuNmMcVPEQ43qstDY+Oaao9BkD0xJVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Fy4QgNpwpJYAjbCaQMQQLlYhgSiNB5utT8w+awwJFJt9wtfdbMQUOljiJ/2ztsXkn
	 fdie5Cr0Zmg+tJr54o4le96ekNTKGDvatDl0QcEYQJsgcqDjv3oDNQzRYCkzz8/ex6
	 FwmzLiXlXL4F9OXwTvUcX9IDS2DmFEY4kyinAQFU=
X-QQ-mid: esmtpgz13t1783330553tb007279a
X-QQ-Originating-IP: pFwwsK+bFgjr+sBuJ3tvvVI0IHeKzOu5y//TagiDwvs=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Jul 2026 17:35:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17558151343560022495
EX-QQ-RecipientCnt: 12
From: raoxu <raoxu@uniontech.com>
To: vkoul@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	neil.armstrong@linaro.org,
	andre.przywara@arm.com,
	raoxu@uniontech.com,
	marco.crivellari@suse.com,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup
Date: Mon,  6 Jul 2026 17:35:49 +0800
Message-ID: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Nb41GHfx0X4XTL3TPXxkavFYJKt5wzl/hNPTEllmLgYKBmlRcdqjiCnQ
	upfmTN9JiW9gplgKuq13SbpzVTX9Xf0lgo7QsUGdS1efsEqzT1cEaE5/W9o+8sGyqBcfluM
	ESaZ3hOwcD5UW2zCC9HoKc8ZmPRiDJBtYhOv2rJkh28G4qi8DZT27F8blfrkhtjC/dDfdWV
	a8mH5jD3Z2+KtrLzVpBSGLml6dDytyapcZ2v7gsqXoqHOc8B3JT4TwmBiTGuulFZdTtikt7
	5n0GExWOObYUiMli5h3zUi2Ym/YhxZI4ElSSeYBXts2fxlspOEqGwLnjVR0eyrEgxKRO5+d
	T56GlpHLmVJZwGvyV3vx8cD3Gig9jr5KBQ7rI8tWB/j/gqx1M8zaZUZqOPW4qZwQIRJmD3y
	YiP2P7hLLLhtU9qFPZPTLi4DuXl2X6H0Ol2ZuZJHmCUoOVB/0sn0jZV08zBFlGBmIm8zOzO
	8cwgJV4ZFLCg0Si06PYMlsLjo6BInvMTTbr9ZWxHMdgfwd2Vbw0dexvew8q67RHQoPXR9+1
	JOEAeTyOH6+NJsnrfX3iMcO/HaQC/3+ml1SP88ZQPynsJ6UioS3jPsSTmYXpwErm1e/KU0t
	7dBw/WYhSZMZkHIOx5Ue/ggdU6kFO1ehtijpsweDkDH7i55sgV072NhNBaSEUzEXaN/eg81
	sIClMCX6DT9vpRBKz5RU9nP8fjcIopL2qYAmPmd8vWK2QR0C1kf2P7TteI8f+5Jyw3ZOryo
	kpeL7Giz5vlHWDvNncrWmCsRpzaUwEluFq7pR70UFAcf5MjAS0+PCxwiyDSIIBQq2pBiOYU
	7eFmp5FYySfHx2CXsgmWhvetzjqhJPRwzhYDhuAfTgh6yPEi8kZaD7vXCEE5cau6jGRzpbk
	OugVx/vaMxleBMzqs6iaOnazWG9YxRZrYzpcBqB+eehhJwOsbdPtWdyNBh0Yn3wWGq5ddYQ
	fDXDa8PiUThG+luanYwJq9eBJ1drP3HtHx8ZDdisP+pOWgUBzWN/PtgzhqRdvm7tMMRb/Md
	Qk19aK5Y094ztLIrmL9cGPUFjkmrEhM3doxbmN6zrgShNBgfOnGfLD1rifijcHk2pQSdTuT
	YSz7fXvJA0N
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023659_140664_A1DB0183 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Xu Rao <raoxu@uniontech.com>

sun4i_usb_phy_init() temporarily enables PHY2's clk2 when a SoC needs
PHY2 SIDDQ setup while initializing another PHY. However, after updating
PHY2's PMU register it disables the clk2 pointer from the PHY currently
being initialized.

This leaves PHY2's clk2 enabled and also drops an extra reference from
the current PHY's clk2, causing the prepare/enable accounting to become
unbalanced.

Disable the same PHY2 clk2 that was enabled for the auxiliary PMU access.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index e2fbf8ccf99e..839856c09e30 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}

-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}

 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
--
2.50.1


