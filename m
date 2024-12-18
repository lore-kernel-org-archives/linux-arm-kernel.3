Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C49EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhYpasr65D04oywlSIN3QZu9V00P1KHiHgVqcAI4Gc0=; b=TGok/oKzoSMLmxpmZQcHgW8zGi
	Db+FSmntAd87yXaZEIun4ZHbkbhl7nQoZp0tNBTsHTZN9Ag11x9Ahcpazkp/kogy2xtuWdSOAw/mN
	/6o5nE7z8HVkh4JuEJX7lkB2F2UhbaMWyEJSWG/gc3zPkhHzREHYUbmS+C8H/drrDk8jQjtZ7sV9n
	nQ+IEiJWwW1kfjDPQwC3hQ5TztymTah3BGxmeW//dYw1tGr2fXdFdOzwnfVqnAuo/VVcY5Zf6QrMW
	j/YpsBLbq9SD4C+yN2ddoOOQAvH31QNS8EK4JYFSTSBHY+H3En725BdEEd/1w+IbnPU+TprdYp8Bj
	pBDsdMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNypI-0000000HRfI-0Mew;
	Wed, 18 Dec 2024 18:31:16 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynA-0000000HRIC-1izn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-801c8164ef9so917222a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546543; x=1735151343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhYpasr65D04oywlSIN3QZu9V00P1KHiHgVqcAI4Gc0=;
        b=i3FLPhipO0fB/RVcIH0G3Cm8d2psfWfQU6Sp52x19FEBRXRyonWnM1KjnD5BpRu72e
         7cy+vd2Ay81tap989nhYD9/n9lkGXYuz0sKnVw50/3Qq+bMHKTOL+EPqlfNLEXpp+iDo
         pL4Y/HmrFxuzg2JfsrTjh7h8BEsxtNMNXQlDVK3xO5L5W6grDSqaKzHq6hhhf43t9SzC
         oBfXWQvN3+81AWK6xAoWunKLZ/m5dkpf3oNY5y3ZEWzlv4+qjXx4phKyvwVkR9dpf6DK
         WbtL9t09j+Z5JUC6H5u9FHD9WLj+/dKkElKw84OlRvg+1uWX+yzzqzw98sDPvflNos1d
         haNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546543; x=1735151343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhYpasr65D04oywlSIN3QZu9V00P1KHiHgVqcAI4Gc0=;
        b=ZjZncFoIt/hCuVks7kQVZrCJL91w7QyNGKgo0eSztcgQzvjotx9yGgNenjRgO66x4o
         5At7UYuUeltqQulclfFIr3KC8x3oUBKxkvk42HVY9WAtFOe5vkdcQ8I/Ua+9Dw7jM2J6
         3jA++ZkAes9sEpf2WM2LkI35MtsEMkcTx4AkPVwfP3epshHbW3ibtggX7/iMY2AgXs7f
         gTZqVRnFh3Awif4Diqg4ZdlqoN2w6zyll2QlQJOZRTl55Pa1rdJht9G0uHFtbPxU1YGx
         3v/IZ8J15gQqLkio+WzuhGaqEyNLlrBXXUR8YIIWdXDlGzXZ6McrzNThFzZM4B+WhXhu
         onHw==
X-Forwarded-Encrypted: i=1; AJvYcCXUzFiFHkyCfWw3O/mobP1H8/CGEEkcJ9xSILzTqOJ9twlgKQ6kQnQGC1XYQDQtlc+8WsmR49dcHWkrc/6zpy2Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9YBZ0IYS5JQzTeXz9rU1rZcK0JLPCiRzXFPbL0v+fqLQgkP0g
	fXwerUwiBOd/dtAqwn7MHiHDebmFl9TW/X6M17a4uu0m+BfRoYHf
X-Gm-Gg: ASbGncucIoShXTbJKyhgepyOEf9oK6FCmQnd4AA9SgtFm+EZAB3uIiB3ROpgUI0jM8j
	gaz3Jg0KIHN62CZnkg3WV+12p0Q8Ll2m0h/hm2QX1wI7FoPiMndDAhlypsj/uOUe1nQa6iXjA8N
	avYzYS5JR+XuqhR/lzpt7B/YR3BQuRKb+0979KqK1w2Q5bnbf7iBG2k1vp2U7+fYy1PcmwBv4yx
	oRjXJZBP2IfUHsFjZVvmc+7C5V+L4uKLuPawpq2JL8ckcDdIPRUttJiIA==
X-Google-Smtp-Source: AGHT+IHxbY/o3QfZaUi3hlJYtIOkRSgPETDeI9GVA24+K7rvStkNiiEjw923gS1zVQfPSU4+ivzQUA==
X-Received: by 2002:a17:90a:f945:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f4437bf688mr461691a91.13.1734546543178;
        Wed, 18 Dec 2024 10:29:03 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:02 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/7] dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2 compatibles
Date: Thu, 19 Dec 2024 02:25:03 +0800
Message-ID: <20241218182834.22334-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102904_458232_E9FF0221 
X-CRM114-Status: GOOD (  10.09  )
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

Add compatibles for Apple A7-A11, T2 SoCs.

Apple A7, A8, A8X gets the per-SoC compatible and the A7
"apple,s5l8960x-cluster-cpufreq" compatible.

Apple A9, A9X, A10, A10X, T2, A11 gets the per-SoC compatible, M1
"apple,t8103-cluster-cpufreq" compatible, then the
"apple,cluster-cpufreq" fallback compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/cpufreq/apple,cluster-cpufreq.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
index 76cb9726660e..896276b8c6bb 100644
--- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
@@ -24,9 +24,17 @@ properties:
               - apple,t8112-cluster-cpufreq
           - const: apple,cluster-cpufreq
       - items:
-          - const: apple,t6000-cluster-cpufreq
+          - enum:
+              - apple,s8000-cluster-cpufreq
+              - apple,t8010-cluster-cpufreq
+              - apple,t8015-cluster-cpufreq
+              - apple,t6000-cluster-cpufreq
           - const: apple,t8103-cluster-cpufreq
           - const: apple,cluster-cpufreq
+      - items:
+          - const: apple,t7000-cluster-cpufreq
+          - const: apple,s5l8960x-cluster-cpufreq
+      - const: apple,s5l8960x-cluster-cpufreq
 
   reg:
     maxItems: 1
-- 
2.47.1


