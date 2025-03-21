Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3713FC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=; b=ie2Flw7itrIDn5eb3A6CQz4VpW
	Ko+cMPZwd2kPENAUCTAX5Z7YToKZl7yA+3xfYKqfJ7RlSBM7cyOSpfVeXsK9q05XehVfp5hO4GBN1
	JM42BaPt+yd+I0zH+EmUWWruiLBO3VDFDlvHwsAxQITgraktPXKmUY+oFxlZKlTnA3K4S0eMa5v0G
	tsHbWyTH9FsIucdUEyqm+pV0PS1N25Ze5RnzEPTAX1n4FqzKu+LQiTLpXXQAK9fuLKGKHpDbl8DHg
	YHClj5zMIF6PoKl8zLCMiXry5NK5JLnGi5ox1Ez3IhN711dd/doz2Psr19z2qhU7OnlwTs+a3hQGc
	TW3rFXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdcW-0000000FApq-3mU7;
	Fri, 21 Mar 2025 14:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdU0-0000000F8al-0lGT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 14:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=; b=oVzpjopst71Lgs+5D37sF4Gzx6
	O1cggH+c0piW5+U/MgWjrs6HcamSAB1cSY395YJcdXQ2jXw+NiPwAyPDpkvoH84JWnsVZQb/BHA54
	q/nAH8N8g7bMMnYf9sZHhat8FovQx7KWu13KD/ZmxNDp/O3urMfqLQ4ZJmvDdgZs4EyNzleNrKr4D
	6Q4mhi/kys5kWx6QB00qVaeRgyZx0dSl4WI0WipJn6gbI3FAVlMYEHLYXZpKaXK5548DSIC04Wdb2
	ykNbu4e6Y9YFLiqvedthjlbRMzWUf+cTI34ifaDoqoV15P30XU/vMrPLxkWoGBzzU54OVpUg7i00K
	MfqsVkGA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdTv-00000004OGz-2yU7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:36:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso15356835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567777; x=1743172577; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=;
        b=Z0NMazvr0nzcqJW/VWvxSR6atAaNkXYoKsr2eLGq3gUI5qBHXovmECwh7mQMUV7dxA
         MPBwWmvTSG2mbpQBSCmIrRjytB7n/FGi+TGkKihjpt/BGLXEM+ljk5Nz1etMNomudnfg
         zPcxaIuvLJrLJAtgq6xKe9ukmnUMEqNHk5aW+CuH6OfBQAlJqISdMtxZgvq7F3CQRAum
         6nsMt5swMY9sUxLieWNTHGegekFUlpQdm+b6ALrNeb5IBZ3V4aa7JuRfYjTA7rkVfMuw
         uFh6VAfqNIyH7Jxf/ChP6gysE3nsaNdSq1xuRnIXKwNnTAUzSWU4knvIBI+nR/VhKKUu
         uHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567777; x=1743172577;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra/8DYijPPPXyKfJwTLkvfoC8/C3kF5QcCpYx+TRQN4=;
        b=e+xNjimPhtHXJ9r6OO2o6f3z68OeN8oydjICF3F/6ZiK9CrBJF2RKDSUb9kUUrS23l
         Wd3tSPeN9qDn/EAScoaQwkXmGKBP3HM7jylY+xYYReDRsSxjKcPceXMhgWt9WibeoKuu
         YDcZUsagKpQ+5uHf+xyCQuGbb/6wNkJwmUjnibsgGtn8brDzYtQGbvuDsSSrlNv4FkF8
         WzsKWDYdcxN0tmwvxcqr08CdDVuo5QD7nk4dNRuhCIfpTpkohj6BnSNhuu2sVfXb+Sr2
         vsjNqSAejHMpA1JvnjiVQAfWVhIQeA5n0d2vsGXW+4MVe7/uJnXI3AyjBaZ48AsC123T
         x/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUNZEOlSRjSnM4dC91WIe2YpKmpuLOsWP901BMF480j/4sllY11DVAm26xUVloV6m2nVOhdmFh1mdDxe4MHiI0K@lists.infradead.org
X-Gm-Message-State: AOJu0YyBn3Uu+h4uwxVw5zqyETw8Cg6yNDwLZQ0srwVWudtOP6X7nLfw
	aLmZ7z+IzBgMJtpkW0vMgm2flBqz6A+RBkxBGvkyXt1DVeEt2oNMY4ugxGutN2w=
X-Gm-Gg: ASbGncsS1bEFiUzQRA1wfgcD2N7dgrecoGkl9Y4eZfa1cLC6TO9IPd2fZl4CrVpD2S8
	xXtazPR4Scn03OfAcSTxOn/0Hv4tiZJHwz1nCDyJWMlvRt30Im9/ItL3/2GnoSo6dM6fJktll2t
	UUhDDkn2qEwOjjEBxkXhjmnr4vTIOFxrIoKXAi0ykf+lnF5jHO9kz1lBGT1VICw8ry+4sLTUyus
	3gGsrzvRfvwn6NDnABUL/T/w0oIgWC6EnmHVnwd20skUkY1PIZsgPJFSTXt7G4L2cfHhZB1ojkW
	Has4xlmPuHZQj+nIee9uLrnJ790Tb6hIvBElAkSOuQsvWqXSoA==
X-Google-Smtp-Source: AGHT+IEBLRuGXXY3Hg/ewdBvYCF4zvDlD21Rbhn+1Z3hKO681e8YV9SPfJqpV9SZgDhIe4keKF4QkQ==
X-Received: by 2002:a05:600c:8719:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-43d50a4ae7dmr28254255e9.26.1742567776837;
        Fri, 21 Mar 2025 07:36:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fceafacsm29121045e9.6.2025.03.21.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:36:16 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:36:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] phy: rockchip-samsung-dcphy: Add missing assignment
Message-ID: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_143619_810849_885518E0 
X-CRM114-Status: GOOD (  11.10  )
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

The "ret = " was accidentally dropped so the error handling doesn't work.

Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 08c78c1bafc9..28a052e17366 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -1653,7 +1653,7 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	clk_prepare_enable(samsung->ref_clk);
+	ret = clk_prepare_enable(samsung->ref_clk);
 	if (ret) {
 		dev_err(samsung->dev, "Failed to enable reference clock, %d\n", ret);
 		clk_disable_unprepare(samsung->pclk);
-- 
2.47.2


