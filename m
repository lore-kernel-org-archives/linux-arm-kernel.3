Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4063CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itYhsB6fPdpzra7msCKHByUBTLvmx3RYWl3MrAXGf0w=; b=2z/qW5DOotuxu4ODpmTfj+GKTA
	cNjeh/RHbm2s5XNAW3H74Ye18ht5C+MAVnu23/IHKeu5zqIRMmDuXBm7UigYSvWgPr9bN+kRuWRzj
	iRyWCOJPiyN/fSmf7eHJZUs+uPdV1lr07qm9upfYRxfzq3K9hDRGBlcIxjvg9DORO9BUPRXCrpciX
	a8mQ7PMWZG0TpzGD9jOh24S6HntzXgTyie/92OhPkEHuk5nhQq+XslbrqPQMkM4Y/GRh3rPrNow3k
	Lmy6WySUQq4ZPUl4yTb2v9phSDk4EYdapJQPrNJohXv4dQ/oQ9av/g6Bsoqi9S0X1A1FVDgnj9BHj
	I3xAoMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofz-000000067UX-3Ssc;
	Fri, 31 Oct 2025 12:56:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEofq-000000067Nr-1MF0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:56:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4710665e7deso10542605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915368; x=1762520168; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itYhsB6fPdpzra7msCKHByUBTLvmx3RYWl3MrAXGf0w=;
        b=zLw/+1LgoLmZhBzuCnLjB9GQ56ox90kRgUxRqq0XSxk447EpnQIEyICP9Ynzpqh0nv
         c1jsboUnUEhIZlyRvMmBcF2pehU5uQ/COuqpzH/zYzc8HoRbATxfyb2FZtkMay3dGnok
         sREabxEuPTK4sMnyQIm2i/BhV+V86frCZ4pj3/kWz6qs3AgSh+Gz7g4quR6iYvLq0ttk
         nVguQDAY94Gd4mZP2PXCqbFM54GWcx93eVwlP+QiJFhZX2W7ttyaMhib9QA40+loAbUD
         22a3y4Q2yLi58DYE4WK7bvo9TqImBE+hXitQGENj1bU8/cI9FncSnRFqAqQAaeQDQ+p1
         OlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915368; x=1762520168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itYhsB6fPdpzra7msCKHByUBTLvmx3RYWl3MrAXGf0w=;
        b=ttv3DD99MLyGIc6GqL/7z7lj9Vo//fPeGCMymFU4ZHZwKbTDY6lJ3KqoQiT7FENuQs
         2s7jyL9qOPpvgsJNWSLUAnNb7MAfYf9gG2qvzmFcdxU/RVLdsl0ayFw0fTGerFSuRcbS
         cTk8MZ7k4PRVOjHqzno1LaPRGdSWbAkXEZg9NCIAdl2q5MmHM8TfNGxHpMTPyEHNKtcK
         EYbBH44pFZTUH7H0BL+1ZDSizruu8WMvcRdURnGeEbUhoOXSrkyYHCio7YNl1I3uhxO8
         oXS9O0dBNEeeukkzPfwRMtKPURbtyQj5PIP89f6g1B5RfDT27mcRYlWEE3yin1ZBs7KI
         +rPg==
X-Forwarded-Encrypted: i=1; AJvYcCWWa28bhCeVvB9tj7IWinbvnxe77mDvtiuxNRXRabnhK3YdHgWo36WwAIOt7cARPyi9aipVC9lWKtj/vhiCwgAC@lists.infradead.org
X-Gm-Message-State: AOJu0YyoddAfi0Isv776WMhufpRwLTt6ZEU97/yA1LdE38G3Yrx3WNMz
	zF4hgp3w4XdRBLcD53UldUiMHkOcxWdPE5mmDfjtRy9gHIlUeW1S4UO+/W9WhpcGGrI=
X-Gm-Gg: ASbGnctgHNiLi1ptWDNSGe7E97g/l1f+rxNFeTuw/nh2a8HUp/yBStnhmhQGNKO2OWd
	9Yh3J+AEe1LIPpUW7J81bJFatXf2E1jCZW0wOxvZYyh3K15Tj9zmPriK3YLjpMzI+vtBMdSNk/R
	vH5j+64r4+vHEb9AIhkvi3CC3DlwYYfr483VHMVgG8SAJ8YuiNWhwgKJpKI0UShnmkY9Cuqq5w3
	80FTXMCve6rbDeMIUWisB+JU91fjjr0N/1jN6ojjjuDwNo1m97Ivjmf9+Xv2zbKcn6ctzY8BxP7
	Knulhgg5Ry4J24X7ERfbZbjeW9VSu9d8QxVXi7nwBOei9dvYRX55VJvtDFdkDzJLADiXpW4TU3+
	TPXau+L6vx83nL19qkcRL+ATYxuLXvfyfGSB6qEdhQrpwZgOMN6NRA1ZQAtBZHTtmwX8/WJOZHI
	3/ryUqKj10Wf1QXdJwQ3o/AbwMMmfwzhWnfr53gQLt97q70ZpWYAtZDo65ZMq6qJk=
X-Google-Smtp-Source: AGHT+IHji7cnPXAM99TSnbeTgigh5KRVC5HbAljjx4ZpeP0cWM3VaZ+C9Ae0FF2SW0ZbMs1zBgOQJw==
X-Received: by 2002:a05:600c:3b26:b0:477:19b7:d3c0 with SMTP id 5b1f17b1804b1-477307dbbdemr33249365e9.2.1761915368337;
        Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:05 +0000
Subject: [PATCH 06/11] soc: samsung: exynos-chipid: make asv_init opt-in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-6-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=2276;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=2b2RMRAbQHJoSplfNlNFCrm413eCNhV1Uu0eYavspbw=;
 b=Y7M8VEUe8Ma3wIFBHexvsVQYqz1qW9K3xn6HQU8oL0V54u5FhpPmhqkF0rW372bcl2eRdsAb/
 mahZ6Jb2R/0AW1hOGjVtZBKdJz6HTZeH+NKyzbFB+XoMLLo+kDS0/zg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_055610_400521_4CAD9C92 
X-CRM114-Status: GOOD (  17.67  )
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

Current ASV handling is tightly coupled with a specific Product ID
(0xe5422000) - only one from the list of Product IDs defined in
the soc_ids[] array.

Since the implementation is highly specific, make te asv_init opt-in.

Note that the exynos850_chipid_data was intentionally filled with
.asv_init = true to not add any change in functionality, even if ASV
bails out early for these chips. We can follow up with a patch to
remove the ASV init for these chips, or better, to update them to use
the nvmem API that GS101 will use, as I suspect they reference OTP
controller registers too.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 7b1951f28e8d4958ab941af91dab4b0183ceda5f..5678bc85c4d93547e446caade64a0b650d06a332 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -39,6 +39,7 @@ struct exynos_chipid_variant {
 	unsigned int rev_reg;		/* revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
+	bool asv_init;
 };
 
 static const struct exynos_soc_id {
@@ -163,9 +164,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, exynos_chipid->regmap);
-	if (ret)
-		goto err;
+	if (data->asv_init) {
+		ret = exynos_asv_init(dev, exynos_chipid->regmap);
+		if (ret)
+			goto err;
+	}
 
 	platform_set_drvdata(pdev, soc_dev);
 
@@ -193,6 +196,7 @@ static const struct exynos_chipid_variant exynos4210_chipid_data = {
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
+	.asv_init	= true,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_data = {
@@ -200,6 +204,7 @@ static const struct exynos_chipid_variant exynos850_chipid_data = {
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,
+	.asv_init	= true,
 };
 
 static const struct of_device_id exynos_chipid_of_device_ids[] = {

-- 
2.51.1.930.gacf6e81ea2-goog


