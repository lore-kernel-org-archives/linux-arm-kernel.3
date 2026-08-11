Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E6DC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJlEafp6iccF9h9o6L+laBWKHv5r162wbzlbDYkDTLA=; b=LbxoYT016Ci7uBIqFJAVWxv3jY
	nPUn7qUwFVCG535Z5Jq9QK37pI/7Gq6cznhGv48NNk1XB20JKdsyluvb61vsENb9lH4DN7usJ9unS
	lRbGY3tbXQrDufulEhmUc+PAUjgXW/UzXL+aI6U4kTK+7NROXrRBNpLWcsxGPeniATs6Ndb5MDes2
	UdnG5wL6pA4Dh0/uiuqNu1Bs58Z6rXF3iRGQDH7PORyH28uJPrrtm1EIOZ7h8Myh0yNOr9USGV38Q
	7LmN0sy5JpUTmZkJeNmvVwVobc2sRmfkPi9naQZXUCW0SKvL7AwOKeUQxKR9r8ZDKx/3POz2qAHiT
	M9B8DP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdnk-0000000DEqa-1sIj;
	Tue, 11 Aug 2026 04:09:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdng-0000000DEox-3iK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 04:09:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc891373e0so31513105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421356; x=1787026156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJlEafp6iccF9h9o6L+laBWKHv5r162wbzlbDYkDTLA=;
        b=JRbOyMMsiT2BD98w7H4QiT8J3KppJJQdIT2JM7plIDF6vymQnyNtQqb8AK9Kc91/kB
         owVcVO3J7wBQYjxjcfVd3La8KT1ZGlOaODnYyAKrMdgqMbEtdp35UHGzmc6VeBLYCxk1
         EHenAQWxb5MUnX2HVD3Vohhh7xWbHlV25dC9GSO14FBKSw97XplJz/Hn6Hj+DLJtPf7O
         nfTL8mYbjbJPR/iOkeuRTqUrrpP+QhZmMx99gmXmEhD1p2YYI8wEtyFJvTqyfvkXZBQ/
         OKKAAhrdQrWqXM7Ocm7sQQT6ZSnSXZbnbUTEk8kJdvo6Nl1Qs18zGjZipjHB62s3NNoJ
         Lj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421356; x=1787026156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJlEafp6iccF9h9o6L+laBWKHv5r162wbzlbDYkDTLA=;
        b=Tf6g5jS6aNsYN2QpTGWnVIeforppTPr4UTFMsVlZh/7o0NQa5hTh2hHAw3iKdSmpxF
         xNZiNY2LQK7+P400n+eymV/XcEqOlge+2QTFwvemCUztyUXNfHyFPPMe9gvCP2WG6GFs
         bOP5unYEA6nje8NQ8MbqX9vIKjxRd/w472q8E3HnLjm6hwoDGyiIi1pPjULwl0sfh5Se
         O5DQSx+SQBfbSR6rl+Vddga+bS7+hsfgZojkAIbTdjgu5pzIo1WmrS6VtBGkqET1gMTm
         +ic3bn/RGtFSVLjWEbya4xX73X67f6K4HMIlzA+Z5gdfvHAuOyAiinm49TwCg5j8MWK4
         +ucA==
X-Forwarded-Encrypted: i=1; AHgh+RqcVvCUNMfD6Uw+LgXyQisYej5HlkOtXC2ZBdAv1HX01tSuT+skImGNKoY8iXgFa0xJ0pld3CpfH0IAgTQp8Ug2@lists.infradead.org
X-Gm-Message-State: AOJu0YzxpaoobV91JpTnynxS0bXhcB+i3AJ21m42YXh2VrEmp5osd6F8
	R8fxnxJVwWXg1B6mWbYJDl9ls028sNYQ5r8FJAM4JLol3QsIHsqsfh44
X-Gm-Gg: AR+sD133YikfPO0XgWzwbpXEYYg0Yffxl/Veg1WSUIXM4Cggn5293zJi1gIaU5iCQpm
	YCd7YsSGBS+BkQQACGIYBa0n16PIhI+yDzF7fMNO4RvG8Yq+Z2Ist0ZGOKPbwR7/T6SsVL2z4bA
	a4nVJ6cmugw7qokzmU3XKs6begFfK1OGWTt1lMzhvpWd5qWzLV+TQOIEbAK8RtCAQdv2vj+xw/F
	zIwdetkvNFtflcrIm304QsDAk6aWYmoFFgvYJG2epuxZoek0V1gQ8qWe58aiqlddhREWF64MOH7
	s7++ArxIGw50IVPuvkKEe9TBOquXkhRjNAdaOQT1lIAGyOUsRzVwmM/xKJEiK8LKEHwD2eKp5Wk
	d8WUfQE+gWXBn5OrSJ8zlkvILBjrtkIE4TgchVx2QVgvXqesxIzof5V1gY0TZafmvhhzWxz0PNs
	SSTHWxZeKoDHQpa6t/5O/1kzbzOeJDxX6EaeE46QJy7TVVvuWxr6qdpYYcqv+Ja9H3ZPk8JOOBu
	0AKMx/9HbK5cfMH2PEuTgU1zteElD65pNW/58fxWHKqrM7D9dELNMvIcqWoYo65kF63Kfy8gRwJ
	OkxJPfvpeAWkbUw=
X-Received: by 2002:a05:6a20:bea6:b0:3c3:66c5:68cc with SMTP id adf61e73a8af0-3cc2bafad57mr930131637.21.1786421355638;
        Mon, 10 Aug 2026 21:09:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbed8e74420sm153602a12.15.2026.08.10.21.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:09:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] phy: rockchip: inno-usb2: Handle errors from optional IRQ lookup
Date: Tue, 11 Aug 2026 11:09:00 +0700
Message-ID: <20260811040900.7151-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_210916_930983_3CCFCCDF 
X-CRM114-Status: GOOD (  13.17  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() can return errors such as -EPROBE_DEFER,
but the driver currently stores the return value directly in rphy->irq
and continues probing.

Propagate negative errors other than -ENXIO using dev_err_probe(), and
only assign the IRQ to rphy->irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..6079e776b4bb 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1390,7 +1390,12 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 	phy_cfgs = device_get_match_data(dev);
 	rphy->chg_state = USB_CHG_STATE_UNDEFINED;
 	rphy->chg_type = POWER_SUPPLY_TYPE_UNKNOWN;
-	rphy->irq = platform_get_irq_optional(pdev, 0);
+	ret = platform_get_irq_optional(pdev, 0);
+	if (ret < 0 && ret != -ENXIO)
+		return dev_err_probe(dev, ret, "failed to get IRQ resource\n");
+	if (ret > 0)
+		rphy->irq = ret;
+
 	platform_set_drvdata(pdev, rphy);
 
 	if (!phy_cfgs)
-- 
2.43.0


