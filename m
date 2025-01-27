Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF43CC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=; b=h6DGsg2NKmjBAefbW/KFYwNshz
	+ia9EcBV5HOIE/4V+6j1y71DvNfN0OXFl8BaZqcZKe8Gjavk/P/OHZRb3O3+dGj1Sg10BJSch0eE/
	51J0lwy5rnS8Ak06LB1h6I7GWfqNg5iyrstP8rQu3rHS+Aq7F9+SGM30OP6KmzfBNFzB8KISKFOq2
	JUCpETzd3mw+baBoPl1pa0pR+3TLmWcr6RWPP0hT7PuIXLiiitkJMfQa6sgVoIvmdO+rMzC5FdX5n
	M7+ekirTKUuYeMrpRPg/JxTahh5RjyuM06WK+u10kWZ/Ea9oMbFr2fv6usgSlvTlwgMQNk9RFuw7x
	4MqGXvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOcN-00000002Jnb-2dMJ;
	Mon, 27 Jan 2025 12:53:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVn-00000002IGl-07nc;
	Mon, 27 Jan 2025 12:46:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43622267b2eso45486165e9.0;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=RYIb+tddn7KiyHO6M/M+037MIQNhTLd2k9yHqJL1CAIyL2IqfWJVNekSsive1hx7yY
         v9KqDsIdN8GUquDVTza+1ROzSs9CiXgLndJviKxyEzSSKIYicJ9ZNv0OGECUhH5J0c6I
         2pvF4MxyF3hWvIunGWWiaaHcbaZC1UnQBY1BY4rkZboSivsmxpTcwT5EAikDoSgzI1bW
         R+MqdK2AQ7P3JAHf45N2bwkMKgYOTu6xVCd8yK3hURse8zgSIWkICRpP/qb9i1adU0Fv
         rMw2vEVyim6/EKfR2uKJd1Q8RCjHl52KNPTKEV50fGTEoDmh/pLlpR5SxheMfAiZmxEj
         IyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=eChkIoY0AxualHenxjDRt4lBHUvIvffv5uxWt0ZZbtjYrOrFoFu5jlzMILaLlxbLFz
         3k/RoltXuD32NNdVG+/1F6kR8R4P0HRthGCOmTC2QxM7Snyje2g6coaFQ4y6tlxom0bo
         9glnE0jveRa1MLQQEU0HI8xRVRdHxYt6lLHoSQg5CXkz/cepIv1GNjwbU2meUgj2vQ9g
         J01R6MR6cLrnRAUX78SHVHtyYjIDb9PfHWAvjKHIQMbWYGsX2t+oNKDQa/vYn2HhXUZx
         Pu6MNxRjFKLO6LxwHzXOvPY2XsYgTnq2qbl5zaSEEfJWqr27j4W2w2OENdDPCi3LmPxi
         hZDA==
X-Forwarded-Encrypted: i=1; AJvYcCU//VqelAHcM2grOM0XLXDx8nqvEPNMPXLVEZxLm1FymtJLJpGfmMg3qUA0+WMjlT9gEdU3t/ylh/93JiCPcv4Y@lists.infradead.org, AJvYcCUHBqW2v/6exG80C3nI+feon2aLIljNVkS0BFrCmxX2tCWFaQEUolfIKuAtLfwaquWnSjFShNKA7QydyCxchJ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPidOPaXa6UL8OKlsqsXSftI28saESg3UEcRck2VMVBmwRUxp3
	8mQUBUTmt1G6gH6MmUnihIjkL2FF5FvbCSk8J7+PS31AOATJ18lW
X-Gm-Gg: ASbGnctge1mguHWqvGGTmeveQw2mqtlH7fpA6nFNcLz5B8pZu0UwRez7SvUYO44Wgv2
	0eHjIBBY2IXKnyigNVfXwBOva0tSA34mN9AstH3z7ZWwJMBhozyFSsnNPCx2EoBm23MCMMDOOSy
	0IXlCC6HT97UorDZXW1vo7FyzjCXrcwIutjIq50YBgGy4a33xfuqadgkXlsUS0tT8rH3tfXOe8G
	nDo8+waJlWowLjIP06spNi74lC7G4qiMGrkqyLFRAuFk85scwTtFqUYe/x01RLsAuUd5BexM+Ue
	FA2r
X-Google-Smtp-Source: AGHT+IHO/ZR9VI0DRMcofIQwLzf01DYV/sQAqDzIwYKFLnZG8rtRUybzRdSJJBgxpXuRFsHSUi3z3A==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr408036395e9.0.1737982001587;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd508257sm129236735e9.23.2025.01.27.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:59 +0100
Subject: [PATCH RFC 04/14] ahci: dm816: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-4-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=MLMI+xe4jCIVViG+z4qmFWASYnmXjrbqAPj9rw3IXr4=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArKDkEFE9Y3A5/bmNOJMKuAZd/TGXo/Hnk0
 /0p5XyElHiJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tURaEACTN9XCdcNODbQBu+CcA358dwkWhwqcBpvBKiMOZuk7+bUram3CM+KscfMs2J4gd6MtfN/
 mJ32c1MQWHifQWvKWmdGr0ooGdtSGWohsgTrfVhi9KB8eGk6x0bHW7Oa6nMO/+bH1XBpsB0NGt8
 lXIhrHV9Aro7NvZiAp6oOB3ttVN38qKt9pdnA5zp/rNFfrnOZcYhx//s8ZOiR21PnNyOVag8OmA
 OTqWHR3pWFfC2fzT5NUG00T6TKnBaQhXEXczoDingtphAfQmOMG+y1za+ZrtTM1Ahb7gNuf47Ja
 3Fm6oikO5kNJqf7VkX4HSIYGpMhV8E0eadZxxZnnfo5NnGwwwlWDmYx/H6XTI4+Tp2uxJip3Ul+
 zosr9bo6XJW2rslEkJwDfPeeM9AIvuGfRgiQPuX6O0tiZeWFKEiDrHCpXfY5EC2vu7irMCitW2M
 JBW/vef5FWcx0wvsnOQ7Qi7ZyPtx6LXjxikC7Y2LS+TaLuoDlLWV+4mJrtniq2Gd0iFHqRsaaKK
 RPUxZjtg8KwWy0iUFXZGrQu6+Lc0VEmI1hmkEBZndGhBBo7Rh0sWQ/tlkvBFPkG+jU3/scbaqmZ
 gs/H79R23Gep2Ovribf5X2LTQYpPgNuxj/tbNOCOKw+TxFhMGgxXHZhZ1o6J+D9DVTps9jbb3ty
 0tD1wvT4bx+yMwg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044643_076981_F04CB1AE 
X-CRM114-Status: GOOD (  13.28  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_dm816.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_dm816.c b/drivers/ata/ahci_dm816.c
index b08547b877a1f77ba220e925de321ed034147d7b..cb30a55945b8bdb1efefab192575864220215d08 100644
--- a/drivers/ata/ahci_dm816.c
+++ b/drivers/ata/ahci_dm816.c
@@ -170,9 +170,9 @@ static int ahci_dm816_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
-			 ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_dm816_of_match[] = {
 	{ .compatible = "ti,dm816-ahci", },
@@ -186,7 +186,7 @@ static struct platform_driver ahci_dm816_driver = {
 	.driver = {
 		.name = AHCI_DM816_DRV_NAME,
 		.of_match_table = ahci_dm816_of_match,
-		.pm = &ahci_dm816_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_dm816_pm_ops),
 	},
 };
 module_platform_driver(ahci_dm816_driver);

-- 
2.48.0


