Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488CEC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq6707S6F7Ph6Bn24TeKW5JdfT2AUuElQEXV+Ub8YnU=; b=F5qt9xnFKdUgVaUuNJPyvSgAMl
	1PwNKdYe1VuXuAfAxkbAejb4kmzdFSO4ZgwTbK2GOhwDpAlbV3XU4n8uvpzrT07aBPvS2ugP5HhLV
	b/+RgjGbF8G52Z3C12a96RjcfjLKr/xvARmS9mp3tGy1kk+F0A9K/FaG7FntViZK8P5NOhF+IrMis
	1z76X5pdnFzc2UhghsgcJnVdVPP+V0y7kejkzOcn13NpoIHXqwxauqxAfY3/nbetgZdkKWGgDfTBs
	wM91FJZdkGL/+XIPBTNEC+pWzXVuxnE2U2Yi04yL6wNLllEX7gQnlEWW7SDaYm3mqh3I6qJ/5wkCs
	svngNJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasDX-0000000HX49-0ngU;
	Sun, 13 Jul 2025 08:37:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarkc-0000000HUWy-2Rjz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:08:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a582e09144so2130855f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394077; x=1752998877; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq6707S6F7Ph6Bn24TeKW5JdfT2AUuElQEXV+Ub8YnU=;
        b=CspuRk1ysw5pdQcqFvgQyO+s6cv4G1D23ZwuapBdVRo55jGRrrLsCr6v8uNBCQqCBN
         ibBQqOtH/MNcaO/mQbPB7AxkE1YOtuTbFGlvLZV/FguikxwFUWi9EB57YtMTAGHH3AQ6
         6Zep6NsdaSd1BfqABpQwqS+7fd67JA0C3viIX5vLypEJzd/tlf1Ij/hXtRIuRJY9zk1T
         bIMugC+/8SlnpeTzarXqPG3WNeCW8xgQutHFy0JQlRvBlBVMAId/SdSfstnveVFLNm4O
         FK3xHhsBLJKb8M6bNBpbjORU9veP12p2bT/ENYU2rBmplRFQnYx6e3xKAPSyeaGTlGDZ
         NkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394077; x=1752998877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq6707S6F7Ph6Bn24TeKW5JdfT2AUuElQEXV+Ub8YnU=;
        b=VFYI0prWnYSff9gVGTpYVJKBLrNoIbRyWkE8H6qPSq6lzkxE/gN2es7PmBpDoz9f9c
         18gbXwXeCBSv5L/f5fz9cD0OnhQmROpzQsEUMDESw7l3Y5NnZR9Zin5+kKcQPk/4FhCW
         H9xg6TZlVUtC2TKjfyazbiQWiGS10l6DMY8kH4UQRYkySvKHeMzv6Md2IDkwgmHXP/2w
         Ozpo0IvrEVGD3XTAH3p+GgLssuGvjIQkJoOV3cuWtdD2i6l7xV9Uytrb1C5hTwf/gNkw
         jST9b7nF1mWvfOyjxHP60wytADHjEvKETgawfzak8aqaO7XpnXRHXU1PvzhvfiRvuVAN
         EZFA==
X-Forwarded-Encrypted: i=1; AJvYcCWEEhcT+k7HeN6BA7WU7HaKbkYTXPzx+Q+xceAcQgEnlQrIG3f2vrox2JGyeJDppj1q6k1yYVvIB5eiUrD50oZy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0cbOxyOEHNaNokqyQAtneNVb5d0AGnw3jUKK3oXEXihFYcUI0
	jH7y5BZ/9SdKM7ev2BgtsrzQlWkhk9XLdVqsFozAkokAPxzn8lOkFgnmR7aSNWmxG7Q=
X-Gm-Gg: ASbGnctrDph78xSRXRwVgIh91qTOxUNDhFwxxzpFcZuIVyIWfenfLOqjguoLddBhk5q
	5vvoMSflLsvR37vpjGn9pDza8Si1qgMxThXy5zuTYL7RqtQN+5Ieet/GcGIQYNfSt6RlU96FJZ/
	00p+rOhnH8lLy400ybHyypR3+BB6bQuaHwrMQTV9QkPOQAMcGp+jY5N2KUQQkWhU6Sv5QK5MMOi
	ivPOm5uOigkt5s73uvmT97llYfz3EHMJ9o64t84s7vUmy25HRPJp80b/7F9lVomY+Rep5ZDIMW1
	9rzadDMO+H2F9wQi4X4tBEzgF7wbHj9PQ33iHYSzKeSM6HfTKk39YdbB6ZydQceaO33D83E2log
	bJ/Dy4DYh6Zhcd9iZ+FWncQmu9PVpQKgPwMGn
X-Google-Smtp-Source: AGHT+IGMCdx7d+JV7VT+NDUL2DlG4mtQQoySy69Gfp3Ds2b0lZ7KbU9s/Vv3M69/0Uqu3iIlOqMa4w==
X-Received: by 2002:a05:6000:490e:b0:3b4:9dfa:b7 with SMTP id ffacd0b85a97d-3b5f2dd49c9mr7880135f8f.25.1752394077215;
        Sun, 13 Jul 2025 01:07:57 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:34 +0200
Subject: [PATCH v2 12/15] dt-bindings: arm: qcom: Add Milos and The
 Fairphone (Gen. 6)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-12-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=994;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yPJZUHzJ6XbbvDpc1ODgE88aN81oenBu6+oDbLZi6Fw=;
 b=ymzq2LdMSZzjV86mE+IAARRAmbShVDeXvVgWjbmxw1Q6I+K7W0/9mujh7mmVhB2ZPk3JCIpSp
 C8m500WFnKfDTPHOjcBz48HP3rjsUZ2kL+OAwZmfz//lxGpiwkj5SEo
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010758_625927_D1037911 
X-CRM114-Status: UNSURE (   9.46  )
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

Document the Milos-based The Fairphone (Gen. 6) smartphone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..38871129f8a271bd5005a01f174ff5127a3faefa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -34,6 +34,7 @@ description: |
         ipq8074
         ipq9574
         mdm9615
+        milos
         msm8226
         msm8660
         msm8916
@@ -155,6 +156,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - fairphone,fp6
+          - const: qcom,milos
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.50.1


