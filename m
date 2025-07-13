Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1A8C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/c/J3A9ASq/x8Yj1Xu/txbcuuFB9UfWNR/sa9FS0As=; b=TAhpbL+guyfe0NY8a7QcAOtg5R
	/tDma45443o+V/LmEqquA5ZPVnQ9bKlrv7CNJGz5PtoOaNpraAsgrB/4V3BPZoZh6chVPjVqrXK07
	VEVm6XipxaNEj1dSxY30DeWQ0A9hKKuxgLG/u9E86muQViHIagLLhrKmvvpNBiXp7ssVxWfEu9pVj
	i2NYnRn6mTqQBrbPw0SeRpU5mlSRXgxipCH8SCiUavKwFyckMmWoBXgeX9Ldipb/Kk9R921Ytn2m/
	k/jcf9fDQt1XTy3vKCZzrZbwNCOoI/NJniXtvHARhYvjW5hvnFhT8tWIhjTOmY6Ob+Z0oduqIcMsH
	i/fhskrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uas8o-0000000HWmb-0r86;
	Sun, 13 Jul 2025 08:32:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarkD-0000000HURb-3TjB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:07:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2390876f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394052; x=1752998852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/c/J3A9ASq/x8Yj1Xu/txbcuuFB9UfWNR/sa9FS0As=;
        b=YRr7uncqgzJivIyMnSW1oeS11Bd8QzJNx59+paXvouhtCpmBtGfyYL6zSAED9Ia/RU
         uwmfCf8kgVlhnk2TfwGMjfxVmF6ZZjzZfez5cNj73wx0/RVOsm8BHcNJfkflnG+nkunL
         19iupc5fX5lYsV1u52Ee1J88fsrFTUzIRdnWomQ3NT4UDNmSRvvs1E+R21KNtkz0WidN
         +z1lTSKOzXOUlWqpAVN2xAJgOlRiapY/D7oVmlzNcMpJY84MpRFH9e94nCVSlOq/7h+N
         TeVA3iKbnG2pSoTABctdcQlRkgy7G77opt3LrteMIGeibn92OqGRqm8Fe0MrYkwyO0Yt
         r1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394052; x=1752998852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/c/J3A9ASq/x8Yj1Xu/txbcuuFB9UfWNR/sa9FS0As=;
        b=UdqwPlL1ixytkgSKOjLLsWYow7/i9G7qKKAd9JdX1Z3qhnCyRUm5UfB6J4fnCg9EE3
         HLc3mOICbu4CSkn2MWEW2cgMvUAUbn6tAIMktBV28rB8A5nO2hR8QK2YnGiD8EJ4M/Q8
         TBvqk6ZYWjDFn17fxLpqhZlYedwd3Xc1SAFF4JtQswLEBzExTXDn0UpD1AOOIRqyzung
         lMd4uR03GFe/REFU+qaq6CX5/rqEC+FSZqWu9iHkhv//KEYvnN1bFdh1cXBi2qLw8xK4
         zJepgYyGyR5OPX5QmtwpfKaRl17Lbcgx+5tbONZcER06Dq0d9WOD1jwG6XOkgxua+X4Q
         eBbw==
X-Forwarded-Encrypted: i=1; AJvYcCU36Q3w1FTW9WoIbIx3AJlm25WFbfTDiikL4nk+g8KFslW12PNxKBXP6RxUXGpJHNOXaEMSaG5VON6el+PusS2G@lists.infradead.org
X-Gm-Message-State: AOJu0YybBv9YZa9MXzogYyA7aerPKu1pgUqJrf97r4/EjpchR84vgv7x
	UBwNAF7di1R2/ue8rlVVtkAJH+lGTqJw9+/cYE6GP567MBv2U6zUm3ANd7Hfww2LK50=
X-Gm-Gg: ASbGnct4eqGk6yZ80KVl6OM2YY4IKDfV9jVJLBcvuNsCt2tswn8+0Thyl+Lvr1om+XD
	dBVLniX4SMjsrIzClTIUICV2i3vGJnVvFgCnaw8sEQKyTW3FYKAwcn6cAg/1oOSfT7tWmbRnWf6
	UKXe/EwL5hJCFCJcimayRGQR0tGzTwawrxxppqOcy2xYVXkYW073i2i9lpD8U4sfX1UROXrbDw/
	6vZG6Mpf7/cTjZFzCwqQEH71F6RRqzMMA19nUJUkxgSt9eq1henvjDdyvcUcxFw2Q+yl6AhFBpl
	FN7wMQw5eCkQaq9Xdg5asY6QyMS9xBUnzcYip7sg4uC1tfAbHqw0WpzfO/t1ZaLfL4cMGYe2M+R
	lbJ5h9F3cS8xSMr6eJlyFFjt5Pb6oajmR698Q
X-Google-Smtp-Source: AGHT+IHfutuWB7rD4cm9MzDFG+4cnjfzK3xIdEUacutPo2JmbTjuiRMzIjn8M5NoivS2vTb1Jp+CSw==
X-Received: by 2002:a05:6000:470c:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3b5f2dd470dmr6368310f8f.23.1752394052404;
        Sun, 13 Jul 2025 01:07:32 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:32 +0200
Subject: [PATCH v2 10/15] dt-bindings: mmc: sdhci-msm: document the Milos
 SDHCI Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aDMmuhwLGm8e9aVoqg3PeCCwJAaRLrTPedtNvgdSwWY=;
 b=QyvoywS+ViPILVHSWP4Oe4jmXijRzJRl4R/Cid8Kttmp8MEimcvZbZ2reSR7fMW32bxl68sjl
 rIaZtlOjefZAQM2+cVveN692VtVF73WT6QgLclxD9GL7msUjQM+72/5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010733_870411_7E4802ED 
X-CRM114-Status: UNSURE (   9.66  )
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

Document the SDHCI Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 2b2cbce2458b70b96b98c042109b10ead26e2291..6f3fee4929ea827fd75e59f31527f96b79b2cca8 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,ipq5424-sdhci
               - qcom,ipq6018-sdhci
               - qcom,ipq9574-sdhci
+              - qcom,milos-sdhci
               - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
               - qcom,qcs615-sdhci

-- 
2.50.1


