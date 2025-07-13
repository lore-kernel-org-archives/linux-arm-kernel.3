Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9668FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SQo06CwZZ+bZ2XWolSLrsJUXJrZwysl3KLdIVv7Q+Y=; b=sCBv2XlJ5iozcXgFodHq0AGgl7
	3Q6nYBeqxe7stvXNNJvgUWeCXHLizpngShwOAvOalNPcVnIiBmLgMsatr46tnXj/ZA9MJ4Uhcw+4s
	JlI1q1Mzbr5HZvA6ebgTM93oYjfqSNNjR4Uo/OibmANiW64e7Atl7CJgmc5ap7pMXaK4DhPpY424L
	y8XpmEel4cEW4V7FqZRs6Yu08j9cHlONxLl/oPkhX9/1QFEGFI/a7JfFijdgpmk8rpaRNf5kZf4qs
	yCkrdSk477xnwpOHl0/AwN7QUrh/u/l2zS2mGH8O4F1zifbRjDkatQCb3xJ8rrrbBkLhNiAifPkib
	8J74vH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasBA-0000000HWul-0yBH;
	Sun, 13 Jul 2025 08:35:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarkV-0000000HUVZ-0V4q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:07:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1996262f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394069; x=1752998869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SQo06CwZZ+bZ2XWolSLrsJUXJrZwysl3KLdIVv7Q+Y=;
        b=q4dYx1ngJhMZs/B9Zzup4s6xpw41CswchpLux2zs/h+A0mUYSFBzOStGWd3LDth8jg
         wlCSwuHV6/mGejMGGZhMPTnx8OctlKqWDD6Ec4pWhLA8I3a7gZT28I2xurYCn7uHTHLD
         EfkQ66DGhr5mqxx1vqUoxKKVxicLxqZRuyjjEgioEWFR3Y/PET9l3KUae52ybC2p657C
         +ubtsXRpE3RCuiG9gGRmKc0r67ONNp8DYAfFVogBCduedIGeYWsCTl8myvVo2MUP7XG2
         6IArhKj75b+xKhhfhvxskNWsdUYEGycZciiUKKQLl3SUx+z55gnq8R51WIYQJdX0qcsw
         Nakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394069; x=1752998869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SQo06CwZZ+bZ2XWolSLrsJUXJrZwysl3KLdIVv7Q+Y=;
        b=riJRwsojgAAvXmq7umE2IzLqg3PzWJR9Ad/shjY9ZteDryNB77IB/vIPvVP/8DsL4B
         3NhyjZRjdYngxze2x0iajjee7tyWtMH3FG70pClzya72KL2nky5vkl79vnEFWkyVceNw
         OxTW0gKwJp0trGBeo8zn1IE2Ww7nLctLfWpmA3LIE0kOaBdvBKuGCOLb7YjltIOrvjkW
         s5pAp1WklGQ7kkK/Gp1oR7zv1te+1nmSpSQGH7lA+a+qHFZh1CO3/Vms9QSX6mTmYYDR
         tNSA4aSaiBZX8XtrHmSG6OxmUb/MeqyOqGYqdYC/wXBSQNpTNayjrSGodPFucZ592ghg
         cCtg==
X-Forwarded-Encrypted: i=1; AJvYcCXtnC5DEfcH6seT11TW7M4vQj2W67NQthnWi/WKVkW7zHoN5aYeIOVCwXiVV/25lkUBqIl6nhk4aNXDnesjKpqH@lists.infradead.org
X-Gm-Message-State: AOJu0YwwEUL0/VDWD/cEncG4QfbHARckzrHrO+2J/Az5UEITpATta/KY
	zUTJHYseMGAfJ+4iS2uLSY2Z70AS7LbDn2Zj0wGuoDMC2YQ1U2O/hDwKqA1OfjRzyn6f/bRPhgx
	piU72
X-Gm-Gg: ASbGncvaOTR7yT+RR5Sn1dMPYjCP0JiuEWkmESgCWs5yayBMZ9oq2NHZqD6rHbRYOzN
	BMlBfsyLPxl5Q59ZLTfur/zWvM8sp2AhWVbJiaO7tklxoSTGOeIQlfnSh6gztsKl7qvgINgF6jV
	BCceDG0Z7Fa6PcFTtXoGyIR+GRh88m8fjkk7NG/h7Dqy4kdEF/IJ0TDvOrPQWbMZCKlTxZRxd/J
	XjZC2FgYNd/dXZxtvjzOKkvwUwkmjDDo+GHvX4xwJlurXFWqax7bJLyhMfzbFMcFlcAl+IISE7J
	jsTdqqEF2MjYRB/HCyBolX51BU58ZFsyZRqOlgIPOkeHnWu+FJU6x9fagszoFhsw5TpmBbbjK9K
	G/vchXrGAoGcoBNODANdUx6Pg31gZLLgeSt7o
X-Google-Smtp-Source: AGHT+IHS2sHqpL2/eZHUmAy8MZC5zOfAiyOO2INQCZr8EwbUKzOMR7kfyYk7nmZApin+IuOyVWkYMw==
X-Received: by 2002:a05:6000:40cf:b0:3a6:f2da:7fe5 with SMTP id ffacd0b85a97d-3b5f359996cmr6132510f8f.55.1752394069433;
        Sun, 13 Jul 2025 01:07:49 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:33 +0200
Subject: [PATCH v2 11/15] dt-bindings: soc: qcom: qcom,pmic-glink: document
 Milos compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-11-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=913;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DMp52hjvQJeToXn5ideaGQ3795khbQZVtSdtbMOEerA=;
 b=2eut1D91kUWr+UGFcP8InACFwKyZfGSbIzuWVeP5xkcguaoH4DRmEvY3vHIxpLqdLQJKX+0r2
 KfHKbW+PBgpAlCoAY9hPuWiP349REQ62oa0RFzX6yRzG0QgrVbKKlFK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010751_161912_E20C2589 
X-CRM114-Status: GOOD (  10.14  )
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

Document the Milos compatible used to describe the pmic glink on this
SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..48114bb0c9276c9326db3256401a3ecaa8b3b9fe 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink

-- 
2.50.1


