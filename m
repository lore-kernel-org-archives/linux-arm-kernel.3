Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7BBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjlzbWl9chiW3b1bcyAnwj9F/eAWfXtVDjTLB3PlhTI=; b=JCijouNAzASfamQmc4KSLc4gwq
	WqDYpNqz6IgdgcUm0VQtit2z27uLddaHEq7fTL0/iWZ8bQ/BeFKCAocfjjHyLzapWtud+0jHDnEC7
	M/H8GIqR5DIY2OOta1Wyr+kV8esqmX9IK9ktomhaiufyr4QRZHQoeRxBl8/AzvHx6qgrMIUFv4LF1
	l1DSToi+ZstWqORxRmaJKe5MyOqYieIPvUl5Xfukylw04W4yks+qTrYeIDKAcCdBAA/3bngVbdGUe
	97L41h/eSuHbTBKh7QbUsI20YPPog6LsibjApYxusAj5u2IiKg0F6ERZrCtpaujscFLILfBTZJYsx
	cfLe5L7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8r8-00000004T8l-17zv;
	Fri, 13 Dec 2024 16:49:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8n3-00000004Rum-3UUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso4455475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108320; x=1734713120; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjlzbWl9chiW3b1bcyAnwj9F/eAWfXtVDjTLB3PlhTI=;
        b=iEAtTG4aj9JUrYlvUqassvu2nhv1ndKktxOVin/UMf2NAuGb2o2GIsAq5zHCKjXbEl
         96d4j6KkOc4v2PdN+qSX9BWVQm0jAPq9A5C1jFhzXtPsoGqtUGs5nVkLmbRKgGghBk/i
         F4d6C6Yahufca/db0fJ0SzDf99JBeHpvviXiumjXqvXrP13qcAutZeSF1m/zFpOMAhTl
         oxmEpo8BW/HXmXTd/WU552odRv/d+Nf0ohxOXaeMGz6G1KYR8CdObPksrdfHJDWilcNo
         QntadANy7hilUbcYjzUJwBq0ytV+JY0CWDn6TtYU84pf8ZIyeWS4zKOFy/BCzcQKFkt4
         15IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108320; x=1734713120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjlzbWl9chiW3b1bcyAnwj9F/eAWfXtVDjTLB3PlhTI=;
        b=FffBUywXZXQFeSQ6BZnXJUObnkMQbQ5Gt0mdIK71+OLQYUxoHcszis6mIz2/AOCO82
         ctM8MulB4sYVsYZ8EJqL4D+00oMj25OBf0w0ey+PDw3rpNvCwBnJXetCK443N4wVxXaf
         VFFx0hCDJREbuYSQ3XufjyyABEFRKdZ3Kq4J/a5xdI3MpVJvgH3+L7FX+zHxL4oXBRa0
         vkh+5WFYH0H3GAUB3tv4rcc/2ULPIYZgM6ZbhSLEp6JHoMtVq/NKiW8nILxQGiPMhd5P
         HZ2YKycRkRf735i/Oj15ncZpq+ucrhhhckT6A94UG+Xhpf+APHe6xeM1PVe3wZ0WVpgb
         dW9A==
X-Forwarded-Encrypted: i=1; AJvYcCXldpAM80nx6UOpvd90Y8VI68Ldp3zNg0mZEeZ2+wUnxdCGJ33sC81HHsg5eZ9XOADIpaJZ/pAf7EjlyyHERBSC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd8SIo4Cov0ossXjmAEOxkUT6O7Q726mFFPuTtxzTDDTNnpNOR
	iwc7efXWGSphZnBBlE01NfRyaeuVNsD6ZBQ4J+IkMMvFnHoiHrVOoDFKVHKEc50=
X-Gm-Gg: ASbGncvkFP7Gc9g/XIYNwK4vGR/ObxFE1vQLWI6uweNF2f4o1lR77Swdr0jZEGrLHqE
	RyR0kLY0iibL6FxppNjLDrL4K0qYF1qS7o3L9LlktNPu6H76AqQIClFQ1a09JFs3ZQPtYmc1lFQ
	CDKKrYKbsDjfiJy9Qh8AIu/NObIM78A90AdFw/3xNQvAZ5p7mz5bsev2vS0xsiv9IDOECWZOTIc
	LS1BbOHKvNTaqQECAN5XYAmH1rrpaa6/p/bXhlZiwvOAhzH29XNlp2RHvsqsC1w14XCA9/KDWls
	AYVxpt+nIw==
X-Google-Smtp-Source: AGHT+IGEMv1e/DIXO21O5MsRQ5xu7AvkX9VSUgw7Z5GjjX9HSgSRS8PPK1Q/zoWIWgCKahnDrQunCQ==
X-Received: by 2002:a05:600c:510c:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-4362aa3e398mr33232645e9.16.1734108319836;
        Fri, 13 Dec 2024 08:45:19 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:18 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Dec 2024 16:44:39 +0000
Subject: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for
 gs101-pmu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
In-Reply-To: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=aKfOXqQGDukFzONr0CiKY/knEiGL73lWVm8HRLM5iLs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSa4bgZiEwGnt8X8V7Vmo0R6b2jQKykl5ebV
 3aqYK3KqAyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmgAKCRDO6LjWAjRy
 utM+D/9Lk7ruFKfWr5gVg4qeHtniwokKKn/WAgFmW2kqL04Q3frRnu3hIB8xkoQ7CTPjR7CizPf
 6UPCsN88uZ1a7nBp93Gs1M3goA2x963JhBm+AEQs+zh1Y16BBMWQIwdfExz6Nc7o5fe+igiYYu1
 LtrTWgFHIlOPvlCEN0MtjZn6RWT7aMfU88pln7puSgEe+CrY+eIiL/tCKRmsee5oLjFM5tvNWoE
 5a+tCA7o4zU3t93z95vwF/DJOucolzwDyeabj/6uMXvakh/umqYYsCIHgkHCStcPGXiW02IwmSn
 v8y5eLd099K8jyA2GQzmXNQQPNFXtXz4oVmo5bWAsWTh9qSeO0qbwPEeUJ+D0X1kzXx4c2OiF+v
 irhcrq+TtLF67/20GIpZlhrZKv0vs02CqH1VjdspQtJFKApzxMzs3x8kcoSAZFgtvp6bTCFNywk
 a+fyOEzNidOvBSAc3IGCLlJWD2pkD7XUc9i6Fy9K1wFpuGwIBsweqrejFIf/arD6z/sGKleAxfx
 laB+rnMD391eqZJGamVXGNA485w01JVITKcfxQMYWN/sABgS4bCxw8CUvSJtD+8mrjnuJKXfYHC
 oDxsOUbrO7nM3BCrS0ao6/NjDiB4yMcAjY4Kt+iB4vcJsP+IDzJh82FOP3GwxBaj8nhM4//Q2+9
 BjKjkQz0D3wdIvg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084521_906292_2AD56DF9 
X-CRM114-Status: GOOD (  11.00  )
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

To avoid dtschema warnings allow google,gs101-pmu to have
two reg regions.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
I don't really like this patch, but also didn't want to submit the series
with a dtschema warning ;-)

Possibly a better solution is when Robs patch
`mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]

gets updated with a v2, we could remove syscon compatible from
gs101.dtsi (an ABI issue). If I understood his patch correctly,
it would mean this yaml update would then no longer be required.

Let me know your thoughts

[1] https://lore.kernel.org/lkml/20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org/T/#m5ad1ed5c69f693d2a5cc54342a87fbdf3df756d2
---
 Documentation/devicetree/bindings/mfd/syscon-common.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 451cbad467a3..9cd9739d5e97 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -59,6 +59,16 @@ allOf:
         compatible:
           minItems: 3
           maxItems: 5
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              - google,gs101-pmu
+  then:
+    properties:
+      reg:
+        maxItems: 2
 
 additionalProperties: true
 

-- 
2.47.1.613.gc27f4b7a9f-goog


