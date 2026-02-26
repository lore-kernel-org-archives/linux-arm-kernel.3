Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513EAFD8FD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=; b=vBqrT5T992BTvhO+iJxyoHahi9
	K0bGUi6NgaI6fInC0HOYkGOkM/h+UugAzols/ZM9f4ZqGbRK0s54iOyCfBvaUILxQAmLfi7MV3A8T
	jn0DObgyYXe/L5plNeHfpu+yxIHMD7cdjswMiVJJ3Ahuz3ICYW86UZdaPWaZjHaQeGCoHwqfB2y1o
	GkmTrq7QhaQiQ7kJRjczUQLRlcwNqhBe2aG62xA4PW28RmxQ6xqSR9P/Ev6WhwFgtWLuOlUI9t1Lt
	5jWzBZA1iAHynSlB91O6b8gdDofrlmQ6NR5ousNs6Qnq/ZqKgkm1OyPA1Hn/C96w8HEPnZf1kHbVA
	SLJ382cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaB-00000006Y5A-43oy;
	Thu, 26 Feb 2026 15:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda7-00000006Y3l-2CNi
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=; b=kvxsNVkETwHK8mMcuJ6Fzhewtd
	NwDd3UzsQTgEgIhODOWwLgwoLSB9041h3y16csuCx9rKM1lXoni11gbXKPPYhXMrkyRRrJ/qsW2kH
	oEKIDhR2hIhrzaNTIeAa/bUTJ5sECOHqPDvFoyO8rSOq6k2Xf/SIIsLLZyaDvF0nWG3UKAgTCl/nh
	DOjdl1pQa2Ss2I4bI+n8oWIPB4+rPnQNar1gpkfZhvQOE8xEoKC7UiJdm/OogtdS/XDtLd05aGLyv
	d03b14Kg1utj3CgI0UwnMXDkP+NxSCib7Ia0TG2rspBYuQXcgHaPI3UqezM8bWeuB8sKO7seOjxlA
	5O1NWH8Q==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvda4-0000000BMx9-1wFt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-483703e4b08so8984735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120831; x=1772725631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=;
        b=QUqnpdw9kAL8dqRiz7eCcQ4+b+C+6cHETFx7xE47DJO5NMwgZClNTGsKftkRxvFyTc
         HUvRnp8+8yQxxMe8tFZNgWx/xRpBWsBVMk+ziaudPw2nx4K/6wE+0JCFePv+7vMJic6i
         YisBIvymW/q9WWIAoDDxveLncyjHXP5TBt0vErtD1sm54blFZEhlhqFrYHIhVPVvXVQz
         962OdordxvImRIpwQFIB15t+i14jNc1cdiDmnMHqG02lMTZx5tLllddUnrYbhv0giczJ
         CfC1GuBKncEHuWGsd22m2J2bwe4fXUpR9Z/CdUjk5wxvz/p8lDTqx3TSAC+mjKa77Jyi
         njHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120831; x=1772725631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOCnZA6+FMHJsj1uVopQCToE7k28a5gpta1dDefWpi4=;
        b=tuo0RIJvEPSP2lvkXOGJ9dgtSzSSLUQWJzg8yGp963YCafhS8wcK1c3QCLXFEMzdkK
         6aczi/PGCJA4HgqFZKpgVKgx2EK1k8LbRHX+ykBg6WHz1sNrBUvbbzx6/kTrNDlrLiXD
         x6kNaXjZvT9CQZ0uq3ZTkTRmJkTaZws1r8aa6YTIdoFtzQvCqRuYEhniOY5FUMMZT+eD
         zyJ2Uh9Ix7lA/8GDR1fbr2L5idlWWRQ/L7lgVQnimvDqwEf1alHvoJcZSReLP5JCXF3Z
         2BLDm+1Um+63mCEaWLfhtKHVuPt8spBdVpkoOC/o9AIg0eoYvZYRYSoViRsGhwbrKNTp
         G/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlwy5okdTLyCqXNAqfsqz34QydO2G/dKE+OJhP1teIyiScueUnXPrKJ1lqun7hQka/mTsA6k5Simuyo5zXvKl+@lists.infradead.org
X-Gm-Message-State: AOJu0YyT5WF1XH0WCl2wVqq+Q54nfHfvoudJnu9kCEbBzXh2epwfps3S
	M4/oEKjYGu9DQqiC+uYq2ECrt6sE6nWX5nKvptOkpCgpUh0Nyf7VEQa1x/85Z86Rw90=
X-Gm-Gg: ATEYQzzYwIJBLAxp5W1YR099bd3ZQbL6r1s1fmeCJkLvjAx3q/j6WpTc+oqPtNKq4GE
	EmA31d41Y2kysUfxWemG5q0et8sgBo2HQ1xD6wZO6uixHcLpYeoYRYC4NrdgMkfzHwTxyKi3bXE
	ULhRH7ue2Jf95TlAG8hIF6pQa1jfeC8qB19I4Jo8xMMKAtS1CG2P6YRQkjZcV8cI28Mn/OMD5Os
	ttF1mbzIyKnn3u/ruq/JbheFx6g0JjwOubCBpkaLeu17NFvTGbAxjF649hZn/Ttv/7eBL2wY47r
	z3d+wGMCAmQmEYAS/iYncU7HA2xhDohDRAxB/pkb18oHRcrIeRmcOi0eIIF3qjPN7bAjok4gMa5
	W1ethw/0J7MDCHaf19UrY+VP3dlSmmfCBvZjmniEI6qrl0+mpVt3HeHmOMxzx24nVm+Xo6SDSZF
	4x1Ek2Gy+L8xYsaz5Y1gHyeVW1F+hJy2Qv0v9i3F4dStHGFp2eP/GxCiHBWF3I1D4DsLuA9iGuc
	6QNPpCXHwiLA2Y=
X-Received: by 2002:a05:600c:46cf:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-483c33ccbe8mr69194215e9.7.1772120830721;
        Thu, 26 Feb 2026 07:47:10 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:10 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:07 +0000
Subject: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154712_614893_6D0DF5EE 
X-CRM114-Status: GOOD (  11.42  )
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

The GS101 PMU interrupts generation block is actually a standard Samsung
Exynos IP block found in older SoCs like the Exynos 850 and others and
not exclusive to Google SoCs. Thus, renaming to
samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
directory to reflect its origin, since Exynos850 predates GS101 SoCs,
and preparing for adding Exynos850 description.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..f9b40f3fd165 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.

-- 
2.51.0


