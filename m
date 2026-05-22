Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FA5CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=; b=mJYT3RZZ6YIZrBJPSXMkCgB9G3
	M+V5O4e+bpFZSJsgug0zJ8IuQuUP/rtVoXYZd30iwFgBL2wF8tMLeAeBv6mxIW5D5Yx0bt1zLQHAa
	gKO0d9sO2X5i1cSgXaJq1+L5I3WBiGkKRSNwkhk5UWXABZtI/pu4uu1DnmF1pq5J76L950bn7xcdJ
	Fw3l+HjBjipXxmcZp4GOkjO3mh8r9yRWtOAPBtWMS9WWLyQW7wmTjCddaxw89A+P83MYfIcTKxtat
	wtBZqU3kdhz/AWAcHVarK9IOIWFWvFOUAS9j/BcNIGs4Be6F23ABtkSFBIprTexT2vVAdq3OTzVIP
	IfjLP9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjU-0000000AQhU-1Qjl;
	Fri, 22 May 2026 10:03:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMjQ-0000000AQd4-3rFZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:03:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bd2051167eso33459265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444232; x=1780049032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=AHroY5c6l/AlhZAKhimXAeW4VSIFt8SE6DUIFDn8gmpde0gEQ0lczwanmdOwYFD1ET
         xzI+i6bpohhIJFl1VKT/9z5z7CmdJNJXnXxwSRjOd5Ok3t+q3DR2QKK4LJhLLBXCRTgE
         UPhotq6pTeP9I/Er5DqZGcKIk0tppH+622Lfgm/Kg4PNVK3KkxyURpGhDiqc+vRMUQkC
         cSGc+8/g//I1io/k4XC3p+80DYc1qc+0n6TOXEuWsow7i3Y5kQlRbcH7tSBg9eLYCTuT
         VD5r+IyzOyRoyqV+mvRxlmKiGAX9+AGKuWCRMw1NNa766lENPMq0tr9QNigUwBRhXAdm
         4uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444232; x=1780049032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=EN0n4SUyc5mRdb9PLZJ5juWxXlB4iMFbBZrmH1znhkvHuluQhImRcdqOssx0CK5bxE
         q/IQAFHXUpcSQ+PkimKEYWwmLK/EJPSahxQif7PtoygFFmK7GTVOohpm+nM/jJdceASf
         ZtTA0d01OUfR67om4sEQzZ/q6N32+8vWWp+8Jk5S3rBW0kGobxDwSiGmVMhKHJzcI4mN
         HujQU5yuY2Oyc1JZ5bDA1HKyI26OZqeyBb1tJ4fjB1FYMix6iuwWMZS23Sr1YzXObQ9k
         wrdnAHshJW3MYVtNjUtKjBoVqY4p4LE44pUY1FsnxXR4a8kQsXv1tKoGgVonP1NcLywu
         lVpA==
X-Forwarded-Encrypted: i=1; AFNElJ8sPmy8mlP7cdDqNFNWCQHnPsLXiOfsDWh369EeGKZq8Iu6wpNoIIjEFuJQE9y7I/4ohhVpwRWF1ktyy0euCoIR@lists.infradead.org
X-Gm-Message-State: AOJu0YxOSligdVtExfx0kaH7CrR5YR09l0bRH3QAoJrLqUOwjbYSEZrX
	nO6HqX4JQzbazjmowio5zqG4apQR0bIdkTh4tegx7B3chWzp1fny4PqA
X-Gm-Gg: Acq92OGVkIMriEk5jUhg27L104bNXrMQT1jd+MEs4hHoUisgeynDEOMIAzYy6pnbi4d
	pK6snOt/HNMcoUnGIQRxRSHTIttQJzADr/HOXQLM+scJEqhRqw5M2FF8SlXh1tzqf5VxdjsH923
	HLRSI2nellHzIFWm/wFUYqIx1gj7AQmbDW/bMaD044gIcVPeAO3MCvWMX4e8ih/Yc9Sh4AlkBt4
	y+qHSgzoxeWiHHxwhO30XxkDKp08cSKQpyswSZSS3GbfMaRD0pX9k12I0eog9H3QkoCtlgUo1hL
	kYSOT74bFc4Ej/9IgaVfSbZI4oIynCPIvX97WHCNSzComskd4KND6mgHqacLdD8x5NYlpP6hmdL
	RWvLVpDpxI6O+UQEiax1bYiEXY3Djw0iu8g9d1+6v/jzzgoD2pZiQ3paHrrX5iVWj50rS8dJsDB
	QRfhdcWp+RWzDo4o0fwfbFJTY4A+HyfKQu8loVZgBYrMUG8a6GfM5NozultQ==
X-Received: by 2002:a17:903:24c:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2beb06c45e1mr28671585ad.41.1779444232060;
        Fri, 22 May 2026 03:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:18 +0700
Message-ID: <20260522100318.73474-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_030352_976795_A39DE709 
X-CRM114-Status: GOOD (  11.58  )
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

Enable the 'hclk' bus clock before the 'clk' controller
clock during runtime resume.
The bus clock provides the register access interface and
should be enabled before the controller clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..8f78f7bc1806 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -422,16 +422,16 @@ static int rockchip_pdm_runtime_resume(struct device *dev)
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(pdm->clk);
+	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
-		dev_err(pdm->dev, "clock enable failed %d\n", ret);
+		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(pdm->hclk);
+	ret = clk_prepare_enable(pdm->clk);
 	if (ret) {
-		clk_disable_unprepare(pdm->clk);
-		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
+		clk_disable_unprepare(pdm->hclk);
+		dev_err(pdm->dev, "clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0


