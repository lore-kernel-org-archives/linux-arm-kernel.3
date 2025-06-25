Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5DAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=; b=lMagBGfVHixcjmB8tg69WaWzYe
	7J/Yb7bgMG5iZRrkoSlWTbQ62+QTi+1pSJGlfhSZ3Ry8plVtEZOsw4NkqARoU2roy/sBC4jyc9KI8
	5RQ9Ghum6PNQ13ayZjAAGyBfL+iVYgXF6XBNdRJotIqoSU2zqQMvL1LsQGn39RMG4uYgSF2rCmpEf
	PnL1TQ8A/NT5qvAEy25q4roLTVwfHYee2xyn94lld2vcX/mol2l3wo1Y8u47AzXg2udWFL3YxTPaO
	JUVPr+dLfZ2mhg1LnsAcKbLgYsFaHJeMKGZNn8r6ojVSEXQqYYLtFthXChBN/Gf+1feJ1KQ6Y7kqS
	N6d5zl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNbz-00000008LgD-21V6;
	Wed, 25 Jun 2025 10:44:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLk-000000087QN-2ecK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=; b=UDvLQQok0P2/2UtMBKGrYCSz/i
	NgoilyIuXu4IujTc1hEQQdcjhGZsJuhPHiwoJCl1lWY1LRp+UmVQwFPLJhRDgcGSRy3kYdh2Oy2Nt
	ioxPzhy2U38LsRR0WQenaMN6+Rp6+hVAUZ5HXKVERhbGWI92DT23FCOMU9EEZ79JjwESD502kZdMV
	fgKQTXyRD2A+Zck+ogKbDon1naZZ2joHz4bEtfkmgal+jfSVBt0H7bTfjqTaRIrqbQSQtfVcdaaaT
	F/zhiLYM9wyurdeYwOoyOWe20vqMc1VJ6kCo7+alTFo/wKPZX2SMrgth5iw9NOyOrz+MApjEX7HsI
	dFZe5ezg==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLg-00000005jLp-1are
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so682866a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843395; x=1751448195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=;
        b=fOiNgdiGczWxpqDO+lNrNzZPDGPQ9NsP+NAPFeuMCnWEcj4yJXegap6xIrJAElvqSv
         pb6BQeVYVWVCNivQEqHtJGouNhmCZ42ACJEwB00aGunxF1FL/M05gqevlKPGrtnfKTz8
         L1AC1loDueStOwqyvQh1Rx/BbTwOLh4N7DG7XBYwt3JEtlmQoEdhiU/gTz3wnL+D36xa
         ALapiGQ23ujjqLenETrdqqUnnMT86d1HR6IYVc/ZDuEVl/Fn+HOcvh+CidtZ1VRF8uLQ
         6AVDUt9RJT8PjN0sIxZjvwMb3tydui5jLRSxc7udnDqqNYlWqdxFIQGAHKcViNZuqnBt
         kMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843395; x=1751448195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbAxlNGNMBjPB368qsF4KlT8ElPeOLO2pW0abGoJlYE=;
        b=gew+I9TK9yPMqUsK+v1xGh3yioVYHlGwperruW8uci/ZMz4bFiMyNO0z1FlieY0lx6
         2BpVtQxtYtS34eiR9yV2YDxchbgof0nzrLZMCJyuVa6+lOeWB08ZOOf4A0YdUNe3bUVD
         XubNwfPCoE7oAjS4FGl1k3SAruN5qJZck0aX6EonaOW+x8plWVtb06BwXp6qE7rvLLPo
         zJwfk8UfuDyDiBvncD5Gf+n9cqoQlDF6wXZqoei1XiFu7IC9uuMm8y/1+J49z2UExJtQ
         w7BdWIBv8NzUU++BDbBzE6nWbCLeuzUA/IVykruZUtwZqa5A0yIGTwIufduj4UEuWmyF
         TEbg==
X-Forwarded-Encrypted: i=1; AJvYcCWGUhTtHH4YTTmlS2UMYKXiUzjvbLVBdZm0iGF522a1oj5SazDMlSgpzzEmK8VckdGBslDjlB72Zf0/JsTlEqzm@lists.infradead.org
X-Gm-Message-State: AOJu0YzS5sLwXsAoJEdLIYOlsBxO5XHhNdPBWlujTH/f8v4rPINKESqb
	NzekoLf0DhgZKdIy3jkTOugzrnyjVt79vhs19d5H5Uu3p0fzf6emg5ORTyNG0TUXXNw=
X-Gm-Gg: ASbGncuy1sAto6eJZD/JKl1o9eIjLRld/KkLLj0EQCbzrAe80MhSwfGZaU7i+/88DQd
	QDODBPI1yvCV9qSeoKSLTJf9e+agfzwe2lNgGyjY61GRHHLrH3kH3teu8TJ0UQJaQMPPIIjjZ4o
	MYPXlO040KoMG/6UlpSsgdoPWUTkQcF3wuaMIedZOkha/iUYG1RYAnBJC0rlZeG3FomvHcFqPFx
	d2YqrrB6azA3DBHrC15OX9EdrUiE4jlbI+QYUkzWHh42Oyo2qoSJeW12exjuTTUlnc+J/nLPtGS
	aMWH6eWZ0qqpGttByaDTDYZgQ9ClwbUz1WQQtw7OeWUpojhF7QMPYHMK1M2Ilma//HjisvYjduM
	qkqiszbhaV1zOjO18uv6mp1TZZdzDV7Q9
X-Google-Smtp-Source: AGHT+IH5Ea6Oe8g4N7kGjKPuq2Ehn1sdorRYiGI7t0sOOA/sE5jzxQrPTZnHeS3tOTzbYiDpRieahA==
X-Received: by 2002:a17:907:6d0b:b0:ae0:c539:b89a with SMTP id a640c23a62f3a-ae0c539bd16mr168789366b.19.1750843395300;
        Wed, 25 Jun 2025 02:23:15 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:02 +0200
Subject: [PATCH 07/14] dt-bindings: soc: qcom,aoss-qmp: document the SM7635
 Always-On Subsystem side channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-7-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=C2JtTvyb4AXtbDuTYKqVJriQ2UbwtZ/ycgN9VosRmWY=;
 b=NfoI5zbKRHbMeTR2sEabxYna1BsVoqMJWG6yk0k36XGqnYtuT0/2sUxemlmo/hi6+elMefc19
 3axPadbKyacADeOKyW5Iv0bjZ9mnmTelUfPVfAa3dsIc/MTy+uREFd/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_102320_524908_A8EC24C6 
X-CRM114-Status: GOOD (  10.04  )
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

Document the Always-On Subsystem side channel on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 41fbbe059d80cebb214317df8ae15b86573546bc..24f7536ffc5ab7489d252359f3061c8619f1eee5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx75-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
+          - qcom,sm7635-aoss-qmp
           - qcom,sm8150-aoss-qmp
           - qcom,sm8250-aoss-qmp
           - qcom,sm8350-aoss-qmp

-- 
2.50.0


