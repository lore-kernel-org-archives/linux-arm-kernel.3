Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjkVBqGocvldr3+5pDfPNG/mAD5wl5azsqsATuuDVzU=; b=vgTfgzw12FQSkV2jlAlxqyoDyA
	aTpQbtwZtIbV7PDVUo0+WfiuJs84nyWA5/v12z8sCOYEZyU7m+r7DsUjNoflDSzYM2KS6U9qy+yLv
	DFs5MriT0TCCueCMNF3L7erI94B4ZM5voJwgTPob+tOR/WiJNfhd8zX0u0ACsBbR9PwP93UrGNcBq
	FPBaXjowbjAArOahMT8jRjZQbMJyIZmjsYoqpxodol4ZQnyHQjC/x3R5UTv4u56f/BIThCLruiJvb
	uXA5yZbZviO3dr0in4JZkV1//XfNqmUgx5yKNnHPLdsgVWz/ZT+FT1zqnoCpPpAqkRVjXzIbf3aRg
	n02ActTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarps-0000000HVTQ-3Yqy;
	Sun, 13 Jul 2025 08:13:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uariw-0000000HU8h-2Wup
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso3329374f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752393973; x=1752998773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjkVBqGocvldr3+5pDfPNG/mAD5wl5azsqsATuuDVzU=;
        b=yAUVcVihajjKAw1Dh7mp6WEtE0EPJgEitueD/I+sfyASdi2TLj1iVGrLnv57vFamV5
         CBg4OzFCCeZ4gPi2wi2NR7a5kwyxoz7GvMQ4PWvYtBu9dPmD+dRPd8fKixISs6Pwrp2j
         ZfPVxSrc8lSH8SvN1GG9j+zHIEbeURRbhwnNwF4IwWR7jCqE343mARdz6/RDosFtOWQv
         lSQylzhtGOapMHXIfb8RSScefdDKTho0Dixshk3NrIMLRxMXhHuZG+dHN9Xuz/3T0qVd
         nzvbtP424m6rECFqAQm0DwgMOKwODsINTs74POJr/YJIpDIe+SZik27hWDIkU9PMwgTM
         4Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752393973; x=1752998773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjkVBqGocvldr3+5pDfPNG/mAD5wl5azsqsATuuDVzU=;
        b=hWqG/Un8Fj6tfQw9Rj3Ppq85FpHAHKe779OeJXTnZ9iMqJE95831MOzRLVuzKubY62
         XYUbdeL+O17aWIron81jPc62gaviyGRxg5FBAlNyJUiB+EX2qOOPDB42mzBHrKoXaZiP
         3dTo9HsuPNXbIhEq4KCNaIxqgLOtObxFPfQoDblrM+sRUiRY5eDBBec7lGMMLrAXOGRH
         mYNkirf7oouRZlRdf4SIa2RHcD8eAPrsR/i9pl42VBZevtgxgP3tO0AdyDtGaYTIwp7Y
         y322xv1Qdq6k9HzkDeZm8Gp5lfPo3ZdARZCEUisESBDzCx13MEJLvdRC/mppLf3cxexO
         ve7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIP9t6p9AyOLaGTeU/uZvfRbRoaV+ffyMgc/Bmunq3/WGVPcvBsxsVvzdJmyZXymKj8+0AUifr3z3HgxaCtU2s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg/0LptQ9x1yBcwMfKih/kab6YoDF+W2P6v7rmgfoZZh9zf0IV
	CaRoOL36TR/o9sPImx2PQXyOOmwrRFMEOd4De/ZMEdYO5f9HMrMC8OK1PwHTxl7ddNI=
X-Gm-Gg: ASbGncumtbaGxZuTBL42y8/mb/rwXx3ecoeD6ca+JSHxUHLyNlGG7azAcQXqmeI8qA6
	CFaHIUYwUEtdo3NvTg39OKIJKHcKvCzb6tGtk5KjHZ48hAmYoSWU9CzWZzjZd3o37IaFoT0kQBR
	zYQUTox2zuorGO07HNVJCynAfog4B/LCB/lHEUxXDaQSzlo9DrMC93Og4I50WGrZEgmR4iErfC1
	XguwCuIprpZcJp3F/K6L2kNWzUg9nR2luBpB1PEq+BGWf9LMllb7sxCCSe6pkw9RMDXAhyIpqzf
	5jfyoZbKdBkQz1uCspdccyaYTugAuSAaPVOiYCdm7BWivFM/sMKpJB5QOlMh69lA+yfLYmoAEhj
	mXm80ObD406/rtFbQfxCI9mYQXpHTqF78V19O
X-Google-Smtp-Source: AGHT+IE7aiBW0y1UJWTkFw2jo19wh2kKOFls92CeELkcuzfmOFh/b4a0X3Mbc9B6RVDds+HgM7Z+rg==
X-Received: by 2002:a05:6000:4613:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3b5f186ed15mr7662034f8f.25.1752393973014;
        Sun, 13 Jul 2025 01:06:13 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:24 +0200
Subject: [PATCH v2 02/15] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-2-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=1165;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=nbSwp5ROysMSTLKLxq6Pg7q3VCWJ3MFGpodgkXirdrk=;
 b=URo7Ywj7eQLjWeGSKpTNmv79uc7iAPWio/PyLw17wxDECtuAiz2Bu3PfwHvwHO3pZ1RhCb5ag
 VyL+DFxfUJDDy0DR7snG/iq810fQKBhCUA6IIAt4osJpIsLJpCqxh/T
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010614_649723_F93670F0 
X-CRM114-Status: UNSURE (   9.99  )
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

Document the CPUFREQ Hardware on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e0242bed33420a39b8a8cff4229ba9eee994ca30..4fcadba87fbb90f960201aa0763f1a22c0f0f9b5 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -34,6 +34,7 @@ properties:
       - description: v2 of CPUFREQ HW (EPSS)
         items:
           - enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss
@@ -167,6 +168,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
               - qcom,sm8250-cpufreq-epss

-- 
2.50.1


