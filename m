Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF6C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=; b=OO2BDtD/VBsBqOUOaknooJ6b06
	FExhw+26UnOHEVnH1bAbTqez+u7KzM9w+bNoGip2oprEVntO9qeKubi5bf2pB/sa5Ov8DFF4Ap2AH
	5Da6qjHkR4ap7nvmoS2ChCFwppazmtvzzEP3Hr0vZu6UEoAYfYbcW6HohcUa7DdBl0eO3sWBCPwMx
	lPKnPIKgly2uwa+DJS6AA7n5/bGFtRuqx1x6qM+y/+kgNlUq0s32fmq+u4P837puUPzZF3Ob98Rgq
	F0iiUtjX+GnGjD4C1BLPNcEs8D5Q3Gmy71ERN7eNGjooopD4+x8ypTct3AFccsqaBisOB5XSbYrVv
	uNu5BGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNeF-00000008MBu-1Bcj;
	Wed, 25 Jun 2025 10:46:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLm-000000087RU-3zow
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=; b=fcTqCWXvOOj79X/yB5SBxH3N7V
	2imthhziFOwUsHJ1U1LchXhVcKx8z02fvcIiKgqz60I1iPBRazyPStq/43rhR0Rwq5RPPSuSqiZ9e
	5pNeAEZV4HO1dFbqedCWTsVE9f0ZXKVV6w3tqYmbeMI0ZG2vvzrOACuPoghjoKEMCaktxE5LacaQE
	HCYwR6009DVOwy48hhw8e5kO1RdS63eu83GpO/pts/4y6VP9EJvQGgJAJmgjz9ClA9XGPRCRfNED6
	mw1/+0amRZoip57T8BgQeV4mMEyomkRvzUAHFd1IFs9uNbSad2bDSUVgtsO6pFwxJj0vAHMfg5qMF
	ZX30XNsg==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMLg-00000005jLs-2kA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 09:23:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ade58ef47c0so146497366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843397; x=1751448197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=;
        b=OEWsX0NmFvCQClhgUDVVAtXD1rZfw4lQhdG0F7YDwWbgYButm+lPR6VbZ53v7SjBFU
         +0odmCKGoXAGm67DVs8bsNveIbxBDqsQ+5kSDg3s+tFNbXNWYcwo+eycnvT0eZAy9QJb
         +Lk5bVM8956/1B4Dcc/BpmKSO0baNpUtedJDZ3qfqMyAcDvsQp91P9nX1fYtSyKBzORb
         M/6DKFEf2S6jgOuPkwpwvbslpOJLR9L9NTuVyi9OJ0fbYj3upLK/L3891KVSR1IzqExB
         xFUmvrfAntpO/86i/MVZSlGYQTnEWP8XKeKYIsYPNrD2EfpIl9KQkH2v82gvEZ4VLTgK
         przg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843397; x=1751448197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpVu8A0fOF6COL52SrecDnHkcknnFYzJmrqkhyu0QC8=;
        b=beOLcxXzFPOIlmFd/P0IFliWZjs3/WlHZ+sKsMjw7W0IBCVWevGQBQV3zq0+ogPGfa
         TsVPCoHaAO/PsqvIWgXEtP94mkulk7+VzbJagJCucDS2yUwIMhiLge3zFmzVSH2w+KBU
         Bi1FQigWqXMAd80l0MnLyUhR6gDxN4jGu7iYrqy2sTVhWFjYPG2bkEyuppFg4j7Pfobc
         EUED81I4I7S1pr6q96/+7c/6OkWopCVudz5iATyQzteKhDRqU3A9hplomSHsl9H9pWjE
         C8Wf0nyUazrdK6PUPVVw7inPqjBeC4n3x3z5rbT7MWprOiRUE1PyTnLtpaINjtK0TZbv
         d5HA==
X-Forwarded-Encrypted: i=1; AJvYcCUPLTAcjN/7R2LUa2RufDdwgF/LsuKPRiLa0kOlOZJb0cprHe/g2vEzE6HZ4yZOCFdPsffkymbezgY1knQcC0gb@lists.infradead.org
X-Gm-Message-State: AOJu0YxUxYuhJaJFAefpukE1dplvymjbjL3LkHMEFUdpN21W8iM/5uhb
	CAPaTMivosDdM7GqYd/aRsAVG/IGufWS963sBbuQddS8VEub283wvFtQ9VVCTAT1+CM=
X-Gm-Gg: ASbGncu2HN8o/cd6GG3zakyZDhczC3pc29jaNN6964aqMS+qkSM3Z6VqeqwcHCY30hl
	bAzxoRFKJEgGRzkHvl31dliSzLFnwNY8NCYM+TKax0zSSbwAyNA2EKleG6gaDmicUuI0O5YpmPF
	Jk9PELdfjbapDEbEvSzkObx1KPCtOstaZ+mkQktxhP96ry82/VnThbR60FzO4oBDFSP8CotzF6m
	qAvBYMsbiZZwLVUtkoboKfzGw2m2libik3W1Y7naIPcsfLsexPYAqj2mMh0py4065sZefTBiTcs
	seHkqv3Mo4Nsbz/Kd2FF0hKQT0OC120vQzBCylTqJoCplkf9Yxy5HeZPnUc571d+KnxJ3F0VrDF
	21+1TJVOrJrljs59mDSd1B8BKxTJJigg8
X-Google-Smtp-Source: AGHT+IGs0JOq47ozJxO/VRAvUrQrVeV04oDsRGncO0FlhvJG+pk9vEPKTSD0ngky9ofslW8b5sJSPg==
X-Received: by 2002:a17:907:9715:b0:adb:2f9b:e16f with SMTP id a640c23a62f3a-ae0c07dfb11mr197384066b.16.1750843397407;
        Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:04 +0200
Subject: [PATCH 09/14] dt-bindings: dma: qcom,gpi: document the SM7635 GPI
 DMA Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-9-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=855;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YagMwxq7U7yWw9QLdcfac7nNwnvk1Yv3KEQc1uEZcGo=;
 b=tKVOirX/O5H1uxQ7HfeyAyYM5D3We6xzlJ6UXlJXIztsBOvAfenyp7TbfJ/uAqV/GmjIz7RGD
 07DUBwDoCwrCGr+c0KI+9cEHz1aYwkDjfvuOUxmsPxCvypnlcx1nV7q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_102320_759725_CC19DB8C 
X-CRM114-Status: GOOD (  10.19  )
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

Document the GPI DMA Engine on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7052468b15c87430bb98fd10bc972cbe6307a866..051b90e57d5ff42f82cd803521c48498ce6af35b 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sdx75-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
+              - qcom,sm7635-gpi-dma
               - qcom,sm8350-gpi-dma
               - qcom,sm8450-gpi-dma
               - qcom,sm8550-gpi-dma

-- 
2.50.0


