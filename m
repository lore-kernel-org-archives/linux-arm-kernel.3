Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81786C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlprjCXzNhYiu8119hAJidFX3Tj0Nj5OLp/Tir9pgMI=; b=oXvPiO4gOra2aMuyAIoJmcp7YW
	HmBZjD1qWfTKQM9WGgD00rO1L+hriqx84DkgixJobyIkf74B1EaAZPDQaFZrbo8t2bq7eZZmogsQT
	VKAWVJ45qwoJYJVSXf+ry/y3RYOmOiI7ytXeVGL8vARLsMkKW8GYNk6AQ9GXXCwscOdvTY8mMy/mf
	fOwjdqKgvDwj9Cvd9YJAQLivt300awQzHJ2qIwBSiWtz1AYpb6osM8r2uhECHk4GqIcFgSPMDgPXY
	hylD+KdJ+u7GnE04TfY23yVYPBjuWrUj6QHTc/XA88bsE5uam9mtG3ykxnMlc64tpAlg5lnjMoYL/
	EPduyF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPdN-00000008h26-1OEy;
	Wed, 25 Jun 2025 12:53:49 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLj-000000087Ps-1SfK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:24 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so1235098a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843402; x=1751448202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nlprjCXzNhYiu8119hAJidFX3Tj0Nj5OLp/Tir9pgMI=;
        b=heC8eUJmCVczV4xKbqz/6tcCPM/sV4pd5OTvtCqxJqURJ6yt5/wnD4sW7uH6FfbnHQ
         356oaTpl+ckeMUljI7fYAFCBRLu34owmsfQrgOj2RjKergEKpMXo8dPBqz+i4bnP2Sur
         H7Em2upjIklUL9A/UBL20N4PJvAWb9238MgV3g6J60xh/rNMsz6t+okS4JBqroGC25yq
         zwGlV8Pem071FHolnMKniPtBhoriRAnl4vdVCc+hsqxkC9EZcEO01VX4APPnRPmkFlnJ
         qkS2aQiAz10t7YFDtAF9pIs79pRTqZhnWLcHkQLPPI/hQHK9RNyp3dXofXPAz0h3XF0U
         Fl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843402; x=1751448202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlprjCXzNhYiu8119hAJidFX3Tj0Nj5OLp/Tir9pgMI=;
        b=TOd3S2j8a/zfUIp9I0j5Wy5DjF/meDGN92ODBxfFrX3QqojdBXElQVQeAiXDayvq53
         9C1NRvDD0dHd8vKD+G+DJoffhfpSZiEXRo9g7z8HoQLZ19r3tjvix82BSheOkjE+c+of
         +4C8rA9IQWDhYbZz7eu8HMuX4x2jbTATzFibdTVmn//9BTDxyFQwoeumCJEaf6Sj51AS
         pfPnC/3gsCWwBe3f3yOkCDT7InIgs1garMPwbb76e6megXbVqfPoEPjhJu/PqSMKVO9i
         8Ywx73pW9ccZ+tnWqSAGhMBtPgiWjIBvBszklI5GTPngmcRCWZJ47eG6oSID/Uz5vnsv
         AtCA==
X-Forwarded-Encrypted: i=1; AJvYcCXw/JT2wl22+3Y28K8DQVIQVKcA9SRkM41qtWE4zkPmCa4eKIefqy4LoTxmeUH+W5goK0KYm25G75HSGTlBfcXQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyeNBNfmC6BEY4TerFx7T1pxIfa4uWHYy6jSek698dqw9yiS5HF
	BcXoQ91y1OJOSCE2YhSrBY95KDf//rjBRRsL0TEtMR8h+zfqSDDnfRDAcMo85jbZtSA=
X-Gm-Gg: ASbGnct+viTOqQzUskJgSETwJTUYQK02SoHkvuAMaqgX7kjEOADn52HUwaHnvYbJj+I
	KDHW8d2cmORyjNT22poJ9hZB+qpgu0nYLhhE1KDyqr3hd6etZj3+pferiS+oOJ2fgjXgBKyzjvx
	RifBRfC6tEo5sqDg+rKbRuXq1kgnArb0nxwGHHxW9E+j9FPUaKC8pjdUBFM90eFEHTSKv40s+PE
	4hf+5GMPR49JdpJYc6Ua+YOJYJcDMt1PT7aB9EymXFmRy2SeB0H+YABQ9K3c8Rn27gPCLoupsiS
	XZv3wH4O7HviSCvMd4TIKx6cDoSUc/xHTjClcTBm1nmJ/a8GLRS2QBFouHAXlSDAL780VnAsqi7
	3Nt0Q8MPx9RDY/PjIVGejw0urxp1aeVtq
X-Google-Smtp-Source: AGHT+IFMjj0Y3e5vRaQHZvxh7fHnevj/9XdkbDfc1cM5LOi08SBv192uCl1KLf+bmxAA3PmbEJU5qQ==
X-Received: by 2002:a17:907:608e:b0:ad8:91e4:a92b with SMTP id a640c23a62f3a-ae0c08724d9mr179615566b.30.1750843401578;
        Wed, 25 Jun 2025 02:23:21 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:07 +0200
Subject: [PATCH 12/14] dt-bindings: arm: qcom: Add SM7635 and The Fairphone
 (Gen. 6)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-12-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=996;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lSbZQMNS3mZ2Qhlodk3BCi0I8+R0Xssr2JSReaIqHv4=;
 b=yilPxLb4+1BOE1rCFDSywXfKUexVB1szD3ZMpoPtxgrPy4d6BGvUtVW9enhV9rLTafFlsiUdc
 CU20Ge/ADStBELDiO8FCnFwU5QmqC34bwJqV2yiobXy45sPeekuAPH0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_022323_393788_04292DC7 
X-CRM114-Status: UNSURE (   9.54  )
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

Document the SM7635-based The Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..bb89f81437d4ae12ac9fa447377d6b48e3bfa581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -93,6 +93,7 @@ description: |
         sm7150
         sm7225
         sm7325
+        sm7635
         sm8150
         sm8250
         sm8350
@@ -1056,6 +1057,11 @@ properties:
               - nothing,spacewar
           - const: qcom,sm7325
 
+      - items:
+          - enum:
+              - fairphone,fp6
+          - const: qcom,sm7635
+
       - items:
           - enum:
               - microsoft,surface-duo

-- 
2.50.0


