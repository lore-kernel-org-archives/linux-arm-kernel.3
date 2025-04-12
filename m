Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3E6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=; b=devuG/LEnX/4I2ZeFfUNMgsYRP
	JIVtqPd4Tz5/wKKKpo7FxkvjILAbz7vimjPlfS1C/wLltaFIoTioDvIpF9nZSEi1H/xv8TYGjOCJ3
	ktAhuIoLvE98xIp0/vL40mDJy0Agu4Sy1su4gXrSAGrw9U9CTGez4tiLD/DMaRKe3gYWeGiKS+NRx
	sfdquVIPIpJHHelQ006SFuHwiMaE68Q9FE+MwgRq+YiCPzc8PtWnzwIiZhxl8mXfyuWBAiEwlMIzF
	pQUtUE6itYtcHc+CPFHUMhmPtPEpg0/WP1pYUDguf6Eql1qofU54i4sTkc/wGrBo7Grx4v2dGxK3I
	5yqamA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hdw-0000000GQhp-0GfN;
	Sat, 12 Apr 2025 20:40:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRS-0000000GP3P-0IKC;
	Sat, 12 Apr 2025 20:27:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso21588465e9.1;
        Sat, 12 Apr 2025 13:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489624; x=1745094424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=MLdFJE4FBFzWiXaFhOmvyZgNGQ0xtFqI0fAPHVi0MAk+4gtoHoVVSR4mg6NzydZYju
         Vw9NxQGvMfH1sMThzR/R8yfNHG54Cf3jF3+qVfbfsp4dnIavrVdfRwSKHgSyrTAd9r+h
         X4Jnrq4dawI69mq5gQeNDaDqJVl06yxZmv8WpW6d3FqiZ09Fetk2QtXEKQzZfYC9PtYC
         VZgor6saGJ1MMjw2mvQJBcTrsId1mW9eVJlyiEwJBfyzJCiJssCgdkskx+sZVQUYdJAP
         iquJ0sTML/09BybhEduz/3WXGrz0OzyX1m1aKQLYykdMB1lU/P2xk46O15tAKe/vL0U/
         CN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489624; x=1745094424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mVbqwsxzgFPfZ9lDdnu8dfGQADmGRwdt2QEaF4tnGI=;
        b=C1/isS9EbZBhhHQ/aszJQrbM2KGJ+5OPdYBwra1nvwi8Sb3l9iFux4vivubHTNnHs1
         WJyRFvz/tbLXvk7rZnm47AGPnzjdN0/IOfqnYi2WkZ+WjP2i4B9hfLYiGTdjxExrB1bq
         ALW0srl7s0vGRyeGwar18TozN1KCnK6b80W5vUwLDVVXHJCsNC+olU9pwvvmcGxolK9e
         3GXRh9xTPJ0CEX7MVY2/tn/ZNcelhjtzqehKPU9FmUmoBPAdZ0M4RSzlAKM8/X+vwN5X
         dVJQGVp0EiILDnKoGI+BE8CCyLYfCjaGgViYBU/40hj3ij15JEDicf9O2Sd7cUHEfGRc
         g10A==
X-Forwarded-Encrypted: i=1; AJvYcCVQc1fcH2rr4J8hlhvNSLn26586lJZ1W4mG9NxxPHtuQLcycjoeTyvTrC9mICBoxaIGRzC4ILszInBk@lists.infradead.org, AJvYcCXb1j3uuZ4hsIbbE0RaFL4uMWMIEomtYwOG83jnslmB7W7lVIVDPOLT+hLh1IR8EEI87mOFkiCt3U08suyHSZI8@lists.infradead.org
X-Gm-Message-State: AOJu0YynTi6Ll6m8GbgcE55eNDdOave6VTNLb04fX0ikAIRzXWRAMAoC
	2ay4Jib/1D1geDKatN5YLWpQArR5cQY6zFgfPkyGMJLj1Vk/kDrf
X-Gm-Gg: ASbGncuYvhAjUpA1G7g8YmKlNP2zRsJPZ7fWrESHxbRsXFgD1abt0kpTPSeRUiRnW2M
	tPd92lY0nC3wQOuBwWhXU0BcFUCiocmtQz45tEFkeYeFRrUHD46IqJsDU7AL8CRqHLP5H0VukHE
	NPZrJ95aljyuxHGAsAKZzTEjMSEQpxGq6ncd0VgcsaOhXqDEU0BM8IpgtJyQJMw9jW1iuO4zheT
	4xJVt1qYrEmKqPoSeqs+4tlDOEI1LJooKxp0Pyf5rvo6oYAXdjhdj0VixFFqspbgHnpo5OZOQh1
	/j5fGeCe2oTl/K1eX1VOnHGzI5OEsAA7AmdT0fpt0NxyEolk1wKBPo3tZgyp+NqDAYALmcmb5+a
	RtpbA4adJFO03KWNw
X-Google-Smtp-Source: AGHT+IEsgvtrWdgSeL0DlLpKGI9k/yst2bpThSyr13W7zdJuj6gazbdG6ZqfVwdkcHDp3Ks5PdCzxQ==
X-Received: by 2002:a05:600c:1e18:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43f3a9ab06bmr50489615e9.20.1744489624337;
        Sat, 12 Apr 2025 13:27:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 06/10] phy: phy-snps-eusb2: make repeater optional
Date: Sat, 12 Apr 2025 23:26:16 +0300
Message-ID: <20250412202620.738150-7-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132706_104841_D61D5BDB 
X-CRM114-Status: GOOD (  15.51  )
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

As described in the device tree bindings, it's not necessary for the
SNPS eUSB2 phy to be connected to a repeater. In configurations where
there are such instances, the driver probing fails and the usb
controller does not work.

Make the repeater optional to avoid that, which also lets us use
the eUSB2 phy when it's connected to a repeater that is not configurable
by the kernel (for example it's missing a driver), as long as it has
been configured beforehand (usually by the bootloader).

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1933e8440..4094786d2 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -426,7 +426,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


