Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FB6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=; b=Wznoams3HdONum6636S+l4im0H
	dz1hdN2xqzvlrrdvcrPzZfstBLBT3m/geabuWKog4rdd18EU+E2tMUXR8tIr8XohjCPpVg8WgOYF4
	/dpKYNA4bD17D4Ee7QXZC6yBlw6GZjLHrl4N/p3EtKulalCtPWPTNVAnIPRqJV6kKI9yEG4xJq8A5
	/ViPNaG9iu/drueDpKGVuf2ylO9lCULHPBMzw1w1OiaFEMgUHu/6QEDoJWR8tbB06ClGj2oqPPEeE
	2Z+9m5Mj5HbNT+uLZCAMlxSdqpCFcYfxQj28KBVBGOsxZiOHeHouhGHjTWlInspUwOwwhF1JE9NYQ
	pvNkylfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dqe-0000000DoCZ-3Ll5;
	Fri, 11 Apr 2025 12:51:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dcp-0000000DlMA-3nVv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1731978b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375011; x=1744979811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=L7Nx/iDXo3FHL+oEA7JVlfYdjRvNYWBccVqgq6GIDF+fwZ+WcIvOU8q4vGBAXxo7xk
         ZjuiRXPj82AHFAwzSgGXglMAOO8kCdUNLUs07g5/FN4nDc5/IIkFHWCI1nkvpZhHA7d4
         I38uw5u0jEqzplBRiNZQbZxpCrDf64dDq/s4WRn3vAR25bAv8h3YYHKmJT5AvPmdzlQh
         VEVlkSZ5QXjzfpmuvsqvZz9st7JzI8lU6RROY/GzF+b88TY/L00DglTyB24p2cSbBMch
         gumFYPXRn4YfVQrDy7Ixw65gu6PnljrDTLgHjo7jOUla1ZvPpi2uYB7Py+grvI0eocOk
         uhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375011; x=1744979811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSHsj9E7pEVKPo/XiZbiTbb5aejzBmBA8Mzu2UJ7TSE=;
        b=lv/ab1l6ahqN3nb+JyO0HsmZis1m13/l2HRDLpW6djBKUIg/ujsaXFKx1gtppGAWCa
         izuPxzqJAiCmCLuBW8iK5S3LMFH7x0rbK+bz9WyjQS7uCQS60rlhFwrq6GvHty1nfZlv
         E6kEkjDnKCy1XvFYXXLAEg0Tc1/vSaMVj2L3IpzTTnz/7trFySIm98DPnDFcxtK5N73R
         yuXHSAMxh8O251gDsNdvKRhRHl+Y51Pc2XhWxj/7845yj5wjD2jhLlWRELItIre4BlTq
         +jFTeMJ+2QtNfrP6GlB80nXOiJ2PjV0FyBGjRxnlVaqc6Eb1zm3LFZH/QgwRFClz6FO+
         mOgQ==
X-Gm-Message-State: AOJu0YwmuF/gHR2c3Pg0YVTq0mii+rXqsu1Rlx1mhYL6C2Z7sINsGkWe
	9FptXlN3jEhvRO8SRKtdD1DD+WnbGM4S0NldzojqGGG11ptXSkFPb+vlDvb4ZzU=
X-Gm-Gg: ASbGncvBHiuv4kdV44jKtxWJ6AjOz51oVQxNk2yNNELf/DZwHO2H4hs0zqmEMKKDCMk
	FgGD+d0k3S+Gy6+e/XKuFToTm7IC3/9dWVYpNWXgUL8tDgLCeDgSrS3t5cTgq3tOt9J3gw+vyBO
	2G2bIXXUJfuoyzlUMu/af28Wb2esILdpdPqI6x5bnBgQMszXAJ5glicJ4Uo4Rx9BsPXLz4a6QnW
	wCiWqbnrsLLty4bVZKudCf8m7BA4AaNza4pK26nq1fbhwSiWi8ZRgtSpNaHq9Rs2cht985Glah2
	s166GAKtuLyxS0Fr9n9/TO3LRIURJG+Xz+4fEi2PeqI=
X-Google-Smtp-Source: AGHT+IFfX3ot/L43d0QBZxG633pc/hZyXtl8UpByDyVjAeqVDIhCDU73ulTwgr/AGiuYBQtmE0nzNw==
X-Received: by 2002:aa7:8895:0:b0:736:3d7c:2368 with SMTP id d2e1a72fcca58-73bd11dc695mr3255714b3a.7.1744375010978;
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:57 +0200
Subject: [PATCH v3 4/5] rtc: mt6397: Remove start time parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-4-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=trGJ+81hvgNk61JAyUi09epqF3tLwjd5H58jiE8ssKI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+LNjqc2TQncoR/fu21kLb3B4nDnpKBpYpF3u7
 K+vKNHeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURUBLEA
 CAC42jhzXF95nwzYaBzqk8pqi2wLrVXoH4PBA0deKY2gEdZoIl9sAOEFMAke8ktBZFrY8zyD3Iilcs
 oByCGpN9m/wQ5S2Ih3Us5gmmwCkWz1CcqvUeMk6aOzqC6tnV+SUW/WHutDoEzQrS+Y3hbbq8SCf628
 TxVPv8tc1AaQc1RRi29L97urd+zi8P2/ucYydlvR0VnVd5BEd9ve7obWrjiwfWA22tckQTsOCO2sAB
 z+j+DbUM3nWqNIVBRj+hlyQOkgxl2NMLlZYfY4uSdJjl42PBffIMp2plpK2m2DZwO2b9LqYtEu33Xv
 qKE/nKDGQK3kUPIQqDkgZpXsg8YdsCSkn09ne3NOpGaw4S8q306wT4gViU2OyQbq2jDy/+5X3WyH6r
 bswFi1Fwgg1sefTSK+B7S/NhI8rhjGYcRxNj7YvLRwGEu2bzNW8KwkcQWYjlF5FAo7lfeuIizrxfqA
 OLV8tKAgl8ncXWKuHgzKKtYqaJzfA2aJXrD6yK5u3U9aNlVe5qbOd3r10sFURDisAhtuCm7fURJqHx
 JC+aHpfgCVZUB/fiWVkYOXBkyeKLsx++ZOoMa2Wi8/mg1CSRWFX0MERFX6a/9stWB7mb3L0L4McAod
 KlRc9GKCciMymJ4QFkvBsy0p0HLsmyvqgdUvtv0sgoLe96aZBCXhM1PiaHFQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053651_950241_4F65040D 
X-CRM114-Status: GOOD (  12.57  )
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

The start time parameters is currently hardcoded to the driver, but
it may not fit with all equivalent RTC that driver is able to support.

Remove the start_secs and set_start_time value setup because it
will be handled by the rtc_device_get_offset function using the
start-year DTS property.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b2..d47626d47602f 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -291,8 +291,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
 	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
 	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
-	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
-	rtc->rtc_dev->set_start_time = true;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }

-- 
2.25.1


