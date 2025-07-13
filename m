Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218FAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=; b=eiEwh1GlIzPvHuSkFZhRWIzDeb
	Fay0EzI4OyJnNLGvkszmVok2SY9h067m5CKVgBIt7OLwQ4eoSsBxddWHkyw2pQcHKgXahprUgTuB8
	F150Q4zQlZWcxzV6soiN2X8paiuUL8F6Es3Jnso3g8NfAAYDfg6WwGoe6qbH33NFPR6jQzpUeAe4Z
	6ZG3xHIsXdTchA131K0InuoOFttGOzXVKUFYJUqyMPZ/dr04vQuBMvIsQIV+iPavhkwSlewt10HIb
	6K7GptdtuwGk83zHw3pHaxnm/qmVBsj9klsTvxJqP2PT1bdnH+y4YjFqfapMMI3fFX+G5cZyvQBvy
	EcZCqr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarzJ-0000000HW4A-4BUL;
	Sun, 13 Jul 2025 08:23:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarjY-0000000HUHj-23Ni
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:06:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-456108bf94bso2899755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394011; x=1752998811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=VVbNdBV2T8Estt6M+afE0r2FaFutYt8Yh7jJVHfnQnjWh07J0E2FFg1/dPbCLOhwnl
         e0vqAYsJIwJ4P5nyLwt4T5Ju8YxvTkn1QZNI9cnHxOg+6fyGATaQ+Zr6jWrv1LcDKmE+
         +7gC2Fr/U7XwxePNjcYJgg+GjemRbd4RMNNJLimrYXVItiUOjnrM8VpbcXLPcQfmt6Xl
         qvC83ymfvqGC+biuYn4wY6UbyMpkiS83KWKZtWu1i18tjNZtLO2LoVSqch1hBt+3g999
         4HG79xQAWhV35JENy1eo+oqAW8NSHzijFZI2B7ySPQa73hnjbbaErYBa7XfYm5eqgKGu
         sh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394011; x=1752998811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAW08S+Y4FxJpq/IdHakejhpfXSII54ErAoQ1lsTS5c=;
        b=u5SPFWqy5VwkoQG/NRlFCh91fhcm7JjBOyghKuRpuyw6HyzO333t80vBLD7ZIg+GEQ
         5z5pbGFjdlTTHmKLsCwnX28GEM3L0nelfhYE7o8swrzr/GsetNtjZY6mCJIrBvu9e5UZ
         +T88BqeSoCo/jGSE0wR3BOCQdbY625nDFN9/BFLwTELzxhJ7tWqWGd+UbXUGa2OD0dqX
         pAPSXwwK4D0j57wczFmyyUyXQeYaYK1ESw8IOwN6JsRwn0AlzZ/GZayioO3KSwB8QzVG
         VgeBkXj1RPiid3srefEKYwI7YITOi9aOQ0qbq6VBthekZv8IaHc/an9gRw0keO278RN1
         N8bA==
X-Forwarded-Encrypted: i=1; AJvYcCWR6Yb/I9xVxIK4MqeVZZ69MRjcioVTRvd0pE3EmbOkbjXXaEFB9Fi/plLYvUOWxiaF749bSTvn6zR//ZHrq8N6@lists.infradead.org
X-Gm-Message-State: AOJu0YwqH8LOty6cGy3Ga5pgjmSGxHAtCCxt7evSLGz1JgiDKkTYTvTN
	6xBlrzy8PXc7YUaQ3gJKhuIF9BUS9PnTZTn4b4dvzzaroGE5BEEEaTnieQW4y7d5sBw=
X-Gm-Gg: ASbGncsqbZZVfVYQQ6FiKXeEu2XzPUWFaAnpXssLhtcQUy4It/Of/Bc5+NRN2d3/iFV
	lbYbamYB+mXfPlZx5GfR8+70UKYqlX4+EsAzmt/g/8ZK+YBzJ3JHq1ziqYrTl6lHPT2cyfS8hoN
	wjp6GoNEJJ93j6N1fkBjRMCkjS9Ib4FR9iM77xV6Ay6+w3Jo9bR4hA73tCzvwx7Ofg24YIDm0x/
	AoXqKzZJIQCqVOPdEEqB6AHSgFI8YGzT4s3owQBxSA3tgJsN2XbSgAhUKkfq/BWpXUeHZH3/El3
	5adkNb3GORye43G9EP31kbRMc7CWYDNAZvRQQTVDOwy82lT5965gz6+Qnum+AkULPyg6Ro55IoD
	LY4yZc7TzKrfy+JrI2Dz18A365r0dR4g/vOXA
X-Google-Smtp-Source: AGHT+IFzbSLLoq4xPNfOGVd8sTIPd/t0yDUx4KghGsVDwxM4zXUXdUnMHorpLtbhoNnu0OiVsDGzYw==
X-Received: by 2002:a05:600c:3512:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-454f425a934mr75835865e9.33.1752394010817;
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:06:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:28 +0200
Subject: [PATCH v2 06/15] dt-bindings: mailbox: qcom-ipcc: document the
 Milos Inter-Processor Communication Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-6-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=806;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Elfy6tnJleoo2wYkconqwz9MsTMigTuOtLwwGmq+1oU=;
 b=T2sEIpk5VLO06Z/e33bFZTdbkdzXowfc67kVkvG9wOw56FtIAb0kMpA2M7/tW/buZQMtHaZQQ
 Pon1YBhAc/uBXmxbSDoNOEBzgAwqhggF7KCZYb3eZ+GNZX+lwv3/qKq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010652_567170_6CBFD4CA 
X-CRM114-Status: UNSURE (   9.68  )
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

Document the Inter-Processor Communication Controller on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index f69c0ec5d19d3dd726a42d86f8a77433267fdf28..e5c423130db67109355d7da3e51e1eeb008dee84 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc

-- 
2.50.1


