Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25372C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=; b=kzN4fa8gcKHU8G6ZH4RNtgu/dR
	xxiWEOEsR1FA9hCLCjXcYdVBnAHS0aP8fx3F9I92hW/nvikjwgBgbfRH6/KPba+kNOq8OK3yHQV+j
	HgU7cwEknzI5JgXHW9TFJQo9HUuvF/7M7r+DJWuHl0rUyHRqEaF72eP1J9WGGPhVq6QKCYmQB658T
	lfo67wrQaedCGo4xFtXkWXjyaqZOqee+CVX5CDhXvBjo5JCToVlohADqbqdK0bYb71TP2PRxtGRzM
	dkkXblFZr4JCGHQbT0O5ot6v5lypT6Bidx2AdOBwCSkDqzKIICQK6ID7FaWBsAu/w5/GnHTSV0ttV
	7t2B9OXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uas6Q-0000000HWUp-20xx;
	Sun, 13 Jul 2025 08:30:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uark7-0000000HUQF-3Cgv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:07:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso3972195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394046; x=1752998846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=HnpnHgmINSyibBd+yyQcS0jQrPpoJBvD1gmY70nCiaFcwGPuYaC2s2u6lQFS5hIjrB
         IesYdoffot40GkyxOJ9qaQgpvZJcz/CeASw7iGUeNuDGeywb/wmULy2XguHoYRd1gcFq
         6WaS67ZqOLrnkbqAugBvJ2XQsViDqLyHKW6Ty/DTJlIHyCNMVutU7IwglBOsoPKefxZ5
         QhQDWRn4xdTbUmETnLzZna6NYGkxqCorH7z4qojw5tcFOUfjS2GSeRqyCskTtFzn0Lnh
         fu/NuZuS4b6EOjgG8pcUHi9qPTWzMCOg7m95vAa48v6S98XOe+FCfeAW7JpOUmo3fzK/
         e0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394046; x=1752998846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAOuh0e5PjdM5Thiks9XcjQnZt1mrG00zqw/b7U8tlE=;
        b=jLyUh27Sn5wfWheN4CQhuisblkOYUbf2xfvp28OQhTcxyXi1HDy/usbuIe9uDrNMNY
         aP1vky5qyAnRhtQJxHXYLkL9eFT2Vffd5U3wmkwf5cfkwoidB66chITOAzfmAjgVJ3Mf
         wdo4W9IKxaAR21uCkvfpvz/e21mkWYRerGuZqgrU6k6W01EbtuIleNCOCoHIV2NwC6ZC
         6x2ye3cffx0ircXlKd6BwgyPPxSMQS/Y4lRrxzasjU98X+/9BBtUCnOz57Mphb4uV9rK
         1NFBqFMZTyofNRX6SHuPLM6j3Kv83SuNf511ZOU+HvpIPJeQGS0ooAM0JgI35fJ+ShP9
         0ofA==
X-Forwarded-Encrypted: i=1; AJvYcCU67tRIKZ391k9Oj6ZMwuo2IdpA4rLvdFBD2ATSclZD1JTAzaxXIyD4SM7Nro2LKVM4+ZtZaAATgBRpW1ktrkJA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0NAFqvrJ97iW+XODcwOVavfk7JeW3vMKZdR/0WEIdzmBVH0Jz
	JH1tPsfNEeZ7CDVri/xqFtbQZlDRSP4D/7qwV4TvMw0hAfC4zNC/1irF5m4EWfX7prs=
X-Gm-Gg: ASbGncshZyL2qfv9mfYWm93/agP9W/6dc1iCCHBlTMEmCHC7N8slWkKh42LUzWsPR9v
	/lUy0GqIciiRck69GW6+BMkCys9cRG36VAe3lWTGuU+kFgvkN2G2E7eNN7IarJXeEA7ThEsWVjZ
	LkeluKvoriRqwE5CzZ3zqade1eH8nsFARNYPugkvyafPAQplJ22J/tEkUFGPPGE55djcMzb525f
	wJUTpP0jGg8lHjk1o8Cs98TuQOUUKHufl0IKyuDUWaFQTOGV8KQQLc2Mj5XELg4EE9zOfxflAw5
	Dpdp+23Tljo2rw9vJAzMhlNPHnDvOiZlgxo1OnZ2pmPthMSLiBIktD3lNHUP6LiB4zZVLEwPB+I
	daySFWL9MIbLGgEPBlgujOvryGPb8NbC6W3xd
X-Google-Smtp-Source: AGHT+IHNat+zEG/luHBNIINd5V8v6XlcBVNxebQV2Q9VeRLv4kxzRp8ULT+stMytttEuuhYWEbWuVw==
X-Received: by 2002:a05:6000:2086:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b5f18b3eaemr8361545f8f.33.1752394046075;
        Sun, 13 Jul 2025 01:07:26 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:31 +0200
Subject: [PATCH v2 09/15] dt-bindings: dma: qcom,gpi: document the Milos
 GPI DMA Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-9-e8f9a789505b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=809;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cmEjmUIEwJdszNuha6SGlHW2o0fXW5xz6+LSWPvZsgg=;
 b=PdARDzzFMZy7Ut6DdJtISA7htSoj0AT2jFnSpJ6mCPR7xKdPfXUdr9NJCuHBaBjbgQNs+Hcav
 9Qi/8P7T+qNBz/thYmFy0Bn74Jp3O9N12GTa6rI4xDYY/rk8g6EpebR
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010727_806642_70A67870 
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

Document the GPI DMA Engine on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 7052468b15c87430bb98fd10bc972cbe6307a866..1655f21a4f64c588851c48381a18965c946e2df0 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma
               - qcom,qdu1000-gpi-dma

-- 
2.50.1


