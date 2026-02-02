Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ED5E7DEF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QLQJlIi1xp3GOgxJrSuyTGl+kKtHgLV5lTV9J+BYkDY=; b=CAcTbOYzvcTC7/FzvSMg6jwBr/
	ju0d8BrVgReEnIPJ0DJxxhHBfwtDtTZ5cN3fIHHY2abC4UqtFvRL0NDix8r9rNuDPgvIG3/EKsRGY
	+U6IuqjJcJ9EpPDleUXK9VIdC+6lRztHsrVxCvPwRBVQsPYpBqEna4Wg8+fPTlNbsEIpVBsekw0FX
	mjZf/SySrdGawSydH16YEkNEOtcXm2LPzrko4wjCht3rcNn1IRrsrJxAsjNzaD6q0/61sH7QL2OvA
	uIfhNbXAYBsVRwqEheCAHfWmEd/HNGHkLfLISfe1qIGOEWMYp2wWwd22cQlmXm+zftSSDUCKCNZoN
	iQjNqLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvZw-00000005AM4-0pJq;
	Mon, 02 Feb 2026 15:11:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvZs-00000005AKd-45Yy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:11:02 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-432d2670932so4209647f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770045059; x=1770649859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QLQJlIi1xp3GOgxJrSuyTGl+kKtHgLV5lTV9J+BYkDY=;
        b=RlruWYHLvL3u/OGPsGiOvrDM5d7FkhykhN+t5w/tWV+awQM4wAKFuFGiAPnBzqm0RY
         vYpXVqDohxBxh6iLqIDQ+C5rpmcebYllWirJv9bMv/dw9tLAyeYXr3CQIDPHd6VFfNSw
         cgaTG4DyV/yt9VBaHw0j11fUlPW3aZKiOAF7cW5FpjZ9bH7ePqpSclSAPRox4noivH98
         zmiqZS6z12nh+3WQu5r6rzS66pgnW9WCBdKSqaYXw46qAfgBZCSBXTRVnFc5h4bhJ1w1
         TOG/0TVcZzG0YoZUpgkmutOuBI3OMxMo2AIc4InYvS7SxobfHa5w19ysitMo9eL/qBJ3
         TKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045059; x=1770649859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLQJlIi1xp3GOgxJrSuyTGl+kKtHgLV5lTV9J+BYkDY=;
        b=UTH6x0NSFksaUqwh7E8pPmlZGh4tvgv7EW0TOgskZq7DBH1E4v8bdw63T0h9kEpNyV
         nFGD+zFf4uASL1WqqEMN61aqsdDGKQKqSkbhupzek74uTGWYIXjH1jfEfLsPIyqMjvz+
         7Zx/VGmPPRerfq77/shvKG3qrI5Vw6fyaPpK5K/B5XC8xo7iVShWHYoGHvIH3oNTIepK
         HbN9vqrXLxN80wWxQ7FJBfwomfuOs2fgbGJoRx20GTWXohFbI3J+Z+4O2azYR3O17buF
         skLS8o1348ID5O/fJzUIOlc7oUSr9eiLAotEsdEcUxTh+03jtPgvJeOkYprOksECBEsj
         5J3w==
X-Forwarded-Encrypted: i=1; AJvYcCUu6qqf+zGnOm3NKDDRxTwgIwQ6BZ7mkwZojIvBenQ1XmtZyZoEEqvAf9yEZfvj0v9NGFIF51knrzg5M+/hXS1t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx49FcNr2tZ7uX7zwRfIjcumJ4YMcYVt+Av43eJ1HoEO2XcU6QQ
	1j9+xLGm22Q8asyjQoQ9xgks45xCX/eUsH056/CSm9wB2DiWXoQ1yKEXkDduPsAOBWU=
X-Gm-Gg: AZuq6aKD4UpVPqnFELurNf3TQ4aFCHW7o09/i3LJPAgkTvWtWVRa1hAd1wvoHiNIVPe
	gtepd+BfQOfhh8+RXkhOo50H5GpAGlpZwlmbygoKlP7goQmHBmPvb4jRTpNwSscuVxeciYZl+b2
	mUYSo1/SdoO/+H9Lq1pCT24JOqbHbnV41P5p1zQ4+rniwYTblf3iC6M5JVbW7Z7Q/tFaHVD/ROp
	+uc4tIt4kQR/On7M3aGq3tJMkhbXyTkBWH3zp6/WV9QsYxGIGUA7iVMY2+wx/2aoxCDKcubsa/q
	+HJ2To9VZPkclYhV9l04qqKp3A9G2XaBGwLTlR9lpDpmwV+nUtz+HthF5IxFpm/HXsYM2KdAWeJ
	Qfcea9lazmB9WW+ypDEOPO50CyU1N7esNUC6Zx2nB1ufNyY9oKcucpWWVGdjbJHxWA85s55qLOW
	u8T9YBA1HzONOsTvPkqaggnI/FaCs=
X-Received: by 2002:a5d:64e6:0:b0:435:982d:97ee with SMTP id ffacd0b85a97d-435f3ab9a44mr19652025f8f.57.1770045055569;
        Mon, 02 Feb 2026 07:10:55 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:7cf3:628:f0e:cd4d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm42845021f8f.17.2026.02.02.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:10:54 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2] PCI: s32g: Fix ports parsing
Date: Mon,  2 Feb 2026 16:10:50 +0100
Message-ID: <20260202151050.1446165-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_071101_364513_25970373 
X-CRM114-Status: GOOD (  11.47  )
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

No error return is missing after the loop resulting in removing the
ports from the list.

Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---

Change since v1:
- handle correctly the case when there is no child port

 drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 47745749f75c..b3ec38099fa3 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
 
 		ret = s32g_pcie_parse_port(s32g_pp, of_port);
 		if (ret)
-			goto err_port;
+			break;
 	}
 
-err_port:
-	list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
-		list_del(&port->list);
+	if (ret)
+		list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
+			list_del(&port->list);
 
 	return ret;
 }
-- 
2.43.0


