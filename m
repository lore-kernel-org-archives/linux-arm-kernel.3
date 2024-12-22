Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34DAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=; b=2L8383BjkUB6m89fb6y5BIbt+t
	2i6zS90bjSaSKnqvp3ul8fznaz9mL3EXr5hKLrQWOp0Gun9Mw5vivkq7eb0nESNKBlAoYlwuAs2J/
	6LFwtvvanrQ5m68qpi/475msWWr39sBj7Efi62aYh2VlI/Ax5fGOgmWtumQY35eR7SnarZhc00HCZ
	QPgO4MhuJn9zVq6BiTziZ5g9dUu6AhXfFy7+QgKUtuZeW1dZiVLA4TofrLbF0kFO+XpHH3raFf3UD
	vXZqawYKBX0/Q7RPnE4V7ReF9IMMdzIz+DeYMmjxsrghcj9WOVgBorPoJKaeie3049bbHk+Swy+8F
	uXCXSvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPzi-00000008cpw-2lUr;
	Sun, 22 Dec 2024 17:43:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPuC-00000008bxV-1xPZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:38:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21669fd5c7cso32149785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889095; x=1735493895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=ejiOouanW8c1uO1ZRRx6lzFmPzqfM8zdFiZjRempnLJ7/l/El+nk+y3vHMvLpP0kYH
         a872u4FMih5WwRI2UZP8LaKdjVbn6i9PxlDlNZFqTmR7VD8KW8Z1QHrnW+23hwEOPvOS
         D+ehi6+AV8S+6rTW2+80LxRqT3NRrkymB6x8aPFHq815KbhfM8PCaJmWjNyrbToG6oTg
         t+K0LmkD2G3uFxGlJBX8q6f1yMk3VC7H9KXIRTedQLGHaZDZnt615f7knWpWO9Oe/XQ7
         /z2INfpI7swLdzrX4VwgYDWSZqSKYJI6BjvbhYlm3lNDlk7pHJq6H/huwmL2LLFOlHTb
         /doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889095; x=1735493895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=jDQKTLQPAJQ5x76+GWc31XcKJEWxMk3RSXX6pcg6spHAkGgxp/qOqNgCrh60wWP3cu
         qMbcu93J6svIzDIriFkgYNaDVzsbnq7ghAHwmkdATzuB/hmapq+NjeZbpJiFkDyGhAiL
         cW2g4LtwvbCkq+OVTcB+iOEdfOFs5OyR092ReMA9CoRyn86Pa9ubp9uodkIq6irgMMkB
         W+6358AtgttmMia1xy0Uwj3rs1A9dwL9OY04jrXJuaFN+llc6/GQECx1kaEylR5X4AiB
         LtWNO94jh5bV22AMODYZk1py9Umx4H4rAthg2hycVIsrVoohnObcTQ1UkAmzDgW5IAte
         boxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKwMzidp99uRs0iE4R5Pli+0ZfnclaYPq1ZumssdOpXnxuiQJjx2VA7JDba4FW/FB1I+QvljQZvcmZt3LunXob@lists.infradead.org
X-Gm-Message-State: AOJu0YyJrJNTonuD/0mqbrM8JXSpGIu1tQnAvS9An6V6oy4UAgBzAhE1
	YG9nbeHVL/d2BNJVU6c3+VxgBhvqUE0Mv3FwGsNuRtF13w84g57/
X-Gm-Gg: ASbGncsYpFY7kWq2//oYeru7V7tcLrWfIyYkjFFQLCRQI36KKkeyZGTD0PT38ygQjBp
	aKmqxrD8+h9BNpda/h/unO8B5fAaLQHgOd+Wnvj2OEOZK4FZPbTldnccLclxLIg6sx/TbgdqKnj
	A7ZZDLmR9j51DAy66DBquGi+gWFLN8RXim7RfgRSF04Yw55N1kiofIPWBFNtxHwG8HzqvR7q41e
	rXp+wxRyCqnZjTbjT9q7hyE9ljy2q6/YQAdrjPHVYTa2WlU16+6gLuwyw==
X-Google-Smtp-Source: AGHT+IHTIsviKSZ1LKilIoOjqzYkBQpMrGt61rnjhIo4zoH5+CmZSeIBYKiQb7rgGn8rEI4N9j1c7A==
X-Received: by 2002:a17:903:2287:b0:216:682f:175 with SMTP id d9443c01a7336-219e6f42c4dmr149570225ad.49.1734889095279;
        Sun, 22 Dec 2024 09:38:15 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v6 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon, 23 Dec 2024 01:34:52 +0800
Message-ID: <20241222173750.148071-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173750.148071-1-towinchenmi@gmail.com>
References: <20241222173750.148071-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_093816_518756_56DC35FB 
X-CRM114-Status: UNSURE (   8.71  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1


