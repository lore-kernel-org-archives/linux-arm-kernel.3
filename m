Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615CCCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4qerrj6UX/Z0xW9m5oFGqvhu+d9Lea7yfQjzYQpDbWQ=; b=AgqoUUtWxCZ0r0bQ1Lzjpa4VRG
	QaxnxsD24TuS7+S34AHEyqTiM4NT87vEdPv8SyT06oQ9QXCCpeVpSlwL1it+mpd8USBfLhact3u9W
	v8xCdy1TIX7RcE/xAKQOn3TMFhjpFyRLwL6QsKZ/Itkl+gzCXjnqrIAJY2rPe8hxf268JYZan9XKQ
	iiRjP07fA8wf62cFBNRY+DjFmvXdoYB9HKYbNNt6f0PrW1vC8ZYcsEjWJhFLjQm57RPOif9A4MUHt
	bkSriWunxGZZe/JZQoDR3gqjAPmqMaqL8NP4v5/YP+M718/wC5uX48KT2qFiIaAfs0ZA1ARebeNaK
	uDVdzexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gFZ-0000000HA1I-30us;
	Mon, 06 Oct 2025 08:07:17 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gFX-0000000HA0S-0Spr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 08:07:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso695266566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 01:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759738033; x=1760342833; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qerrj6UX/Z0xW9m5oFGqvhu+d9Lea7yfQjzYQpDbWQ=;
        b=yXvTccWu2r1CfmVF1UT/REPTuhRlBv9TIwTvm/dGFSmXmbvPy8N9Li7xthyD3241bB
         XdIe/gRrfL9qXe9PIn/qhMYCpkFdMsT1CVcfmjYAmr+CQMUQfG0wG0IyDfctIN/TZmu4
         j/Vu/bRZvK1LesJtPDWUwfk9526dIXM2GfbPmZS6FDoYDr4VmcpxnVMLgk1btWDrHCHf
         TMKTAo0/Wt6meXG3y1rOcTXaHmjg3Eqt+5jmf2BlZqvWj5VYbolYhBS10F8KQxln4bd/
         9wMSrdFivAgekU5VNXtEf6WJf0t2orOu+KXiVuDUa2aaSCVLQKgnf6Lvgdsw1vCBbUTX
         e6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759738033; x=1760342833;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qerrj6UX/Z0xW9m5oFGqvhu+d9Lea7yfQjzYQpDbWQ=;
        b=MP6pQHVPuJgQ7StydYm+rjcOBJnMbTGRPh8w323ylUGI5Jk978lJLM6d3FBVK6jdig
         eJM5M7PSpzEsqANxyLSlhU/yHkX5OR95WuAWJLqqC4xq1iqwr+XwH8LKRJrNcUFvxXXZ
         fuztdmDhcxZhmPo9QwkwWEq56Gbe1ygvVHzB1IXDWdh1EAp95qAkP8TRQGV2SPbZb2kw
         vGbRvUBiXcJ9O87XycqYMj4q1L1aMWZn8yfPUv/u4ky6t89hrDeZcHX/ApdWpnRNqsjt
         ZEqSYANlwVMpmZTlwPZs24prfv/lwV+grEpeqWaPBh6F4yJhJoShyQEpzdukrf4r6K3T
         UdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOZid0IIZDyJtImSmS4bc/nwv2MRb/z+5SpyNNQMqFJf+3vHAoyrNMq7o6j4hfzKfLMNHZsl86u0LnfSVSuWCy@lists.infradead.org
X-Gm-Message-State: AOJu0YyiTEbfXuYZSKhNFU/6DERFXDviN35NPOSgR5DgjdQD3BtiS1nx
	fXhVSfXiXmCIvlUwO+e5WZ/Tcx4UAfE8CgMzGJpaa9u2UzPwndt2BV9UJYbzCIW9sFS4NpP3Gui
	jr+Cepc4=
X-Gm-Gg: ASbGncsw7by3yJh2x43AN5u+qHi2h+bBVEnS4G7Y5Aq8YKxhWEN2b2qsfrLbkNv/yAi
	LTUVNN+C80YVhCmpUm9waixW6Rnq6gLWB6g44jbThcnbdI646LFqDALxew+JzI0k5ay8ukrUZTW
	JIqtB02hRGldOpp7DiJG9mEDh6NgVWbIh7PEWWNP3zMjyGZtjONkwHLDQWrFJD+FHTAt1c1882s
	aMdyn1ZYMMrMa7FGDRsGo1iVHlMZBunLixWImOihplyT2EDsYfBNs7V2u02OGuzbOWaUne3hjF8
	YCsHGN0ZMuknSwIZBFjc7HuwaFTRFyFIGM99CWXJA6l+NHw9ezu3kRbkYtRiPEqKi/Nu/+v/BJ+
	oQlNWGRjp/dR0IOPKXEe4wV85by4v3vhwZMErDHmIKD5+/ZEwLNtiDMr+MIXD2BxRrMCb+pjTnt
	s3HoiopcK+1kuq7h7fSxnAjO1i+U2NsPPxbf6UYw2C
X-Google-Smtp-Source: AGHT+IHPnvEx2+1A8spGyxDZCYqGJPXGgpZv7W3X/UPXBelvQzXyrYlDdDiI9fhuch4s1Ysd9y+b0A==
X-Received: by 2002:a17:907:86ab:b0:b47:c1d9:51c9 with SMTP id a640c23a62f3a-b49c3f7d31emr1499754266b.62.1759738033192;
        Mon, 06 Oct 2025 01:07:13 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4f1d1sm1073772766b.71.2025.10.06.01.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 01:07:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 09:07:12 +0100
Subject: [PATCH] phy: exynos5-usbdrd: fix clock prepare imbalance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-usb-phy-clk-imbalance-v1-1-205b206126cf@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK9442gC/x3MwQqDMAwA0F+RnA00Za2wXxEPbc006Ko0bCjiv
 6/s+C7vAuUirPBsLij8FZUtV1DbQJpDnhhlrAZrrCNjPE5KhvCjEff5xLQuKO8Y1pATo7ccH9x
 5Gp2DOuyFX3L893647x9CN6EgbQAAAA==
X-Change-ID: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_010715_178308_4B086443 
X-CRM114-Status: GOOD (  11.55  )
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

Commit f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend
with UDC bound (E850+)") incorrectly added clk_bulk_disable() as the
inverse of clk_bulk_prepare_enable() while it should have of course
used clk_bulk_disable_unprepare(). This means incorrect reference
counts to the CMU driver remain.

Update the code accordingly.

Fixes: f4fb9c4d7f94 ("phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)")
CC: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index a88ba95bdc8f539dd8d908960ee2079905688622..1c8bf80119f11e2cd2f07c829986908c150688ac 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1823,7 +1823,7 @@ static int exynos5_usbdrd_orien_sw_set(struct typec_switch_dev *sw,
 		phy_drd->orientation = orientation;
 	}
 
-	clk_bulk_disable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
 
 	return 0;
 }

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251006-gs101-usb-phy-clk-imbalance-62eb4e761d55

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


