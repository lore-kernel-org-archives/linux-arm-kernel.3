Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE32CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txsD8XdG7jmCwGb/J+YdJXr7ibwZf+oef5Att2NCdBE=; b=UXk8jz2osIEg1AOMieUW4RHM5s
	N/BGBsMQe6OOBusjSlDUrX1akUTFVKvkEsT33dh7h+m4FHMrqeUozehjNdGAbFCn7bi4tEnkNYMYO
	wq6lbkceJtfV8un6ciuwkTqacbSyp8iuRr623OGX4XRijimx7MgAunwiYmhX9BWmXQWH0vVFSc6jm
	KMFVx7h9WYU35ytYfZWrcP8BjyFLrSxoFhBAwDfqCUEZNUfIySsgyzWFK0U9//UEFQkDcEpzDDJCV
	OHorWNrxpeCogGC517TCNgMbI9t9vWMG6RtCLll8pv1fnwo0jEgGjOhQ5cE5+alK0QRmIf0lu4Haz
	SNlMYblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOf6-000000089da-3A7s;
	Sat, 30 Aug 2025 16:42:44 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usORY-000000088Nm-3b4X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 16:28:45 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-70dd6c93071so24537686d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571324; x=1757176124; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txsD8XdG7jmCwGb/J+YdJXr7ibwZf+oef5Att2NCdBE=;
        b=MRMdNX/fOrPEgDUcNWnWAJM4/fdHP+zrG6DhxqY4UOYSfs9bVPCK7L9tEkqJaSMHma
         EygFU7aHtGcqWH0AvB0JJigUS/EuaondlN2VJ1xxQGo0U2XN4yp8Knw+IHxJVLR74AcJ
         ntjdJ5Wi/B/71t+smNxsRm4lABYIV5mjnVYl9Zxk5bn//VTOnmJZfChaIRtZQuRCf0+W
         Og0V17aGUGfKfVpFkgQWVgyowJntqw3C8WQDhKN8VBP9/WFDXVZewP09X2xF7n+eAhdG
         lbhKCqKcrXT7SEC5zvQBrxDqy1waZ8rKjsqCOvhjYa4zRzEgPTsdHdJOAfPEkSjD6oPq
         HtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571324; x=1757176124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txsD8XdG7jmCwGb/J+YdJXr7ibwZf+oef5Att2NCdBE=;
        b=BhJPIBeVUzF2ws/xn8l/GWz05S9Iv4JDzmezsiy6hJbefWMDRsao6y9hagjVDGlWkF
         qv3nge0GYjl7V6QR3Xlqs4KNR4FnJzFA6XfW4A7cTEgfpVpGPkVjX8ceLEmtC+0T2P39
         a/hLoLnVIYWtsdGEMiePUsA+NVA8qWjQxTuxKllBatdQWonVNbv9GJPR5tBkPTrbO64j
         N6m8nQsxaNiImbOdQPhj1pAbCT2q2gt12McKCmL6SbTZnt3xDLIf4KSOiuKUtqExfMmp
         EfKj72F/KngL6V0X9Y9DFJnGjUKxLM44HWxn98LAqxtcdoPVsSqTRRwll4SM6WwDzIan
         zvVw==
X-Forwarded-Encrypted: i=1; AJvYcCWYjqP5it87OxOEgTD7u+N/+vUgUgqpqM3bF18M9+gQkHuW5VTcmARqYOa3Gwg5gjIUvruEk4RHLXzDpW971E14@lists.infradead.org
X-Gm-Message-State: AOJu0YyKntHQWACeQvJa0zvQiy3jTlYllYzgE73PvUxRu1n3XWur1eT0
	fHEYPJPmLkHCsB1u+93PoPBqj27IoxC6Pverre27/3wKh8pxrfIfq6PL4I/rkXct/0M=
X-Gm-Gg: ASbGnctfCDsdss25yp0AnPEnp/na2WH3MJpySfpBAQUnnAP7+PH+VpSP9y6bKB3KhQa
	s1hpd7cixQ5u6VgK1sQGS8XhVGMNWoSx/ot3ACOiSjLfqOPWW8DWFNQbdMMfqsHA8x/Tdpl6lic
	Vzflrth3qO187OeJ+8sf9uW7bhPq2HOXpomTWBZJQzkTj9qT+Gjf/Kb9u7DEIID76kqzRVO+HNL
	sEO8qfSJKtDotWAfTStdQLWeLhsaXIqENY0Z31/aOegtCuikkcSxhQjjW/bS60uh1fP0heE0/3F
	HECSec0amm8SCz0elmANSawpuxeQBSEldxjZaCUg9LRisThvsQXrMj6Dim2+cFluMt5QxfeMqbw
	RYEQDO1CmugDRxFpbkK32yBUqN0tZoBUlY74xbqI=
X-Google-Smtp-Source: AGHT+IFJJeL+E4p9zNxcv4dNk/C3+irfjMXEWrBTTh3+6eE1/B0cpnnRcCgGc1M5nqa7Q28tjtnh5w==
X-Received: by 2002:a05:6214:411a:b0:70d:abb0:2791 with SMTP id 6a1803df08f44-70fac88a6c2mr25148226d6.32.1756571323750;
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:41 +0000
Subject: [PATCH v5 4/5] dt-bindings: clock: exynos990: Extend clocks IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-4-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=919;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=04MZLdRvtv3dYSrEKVA7n7X4qOcNIGMw9F8ZkaILBxE=;
 b=aSAEvIpGXqzUd2y38j1q7ddgyOtKqqD82eO8ZsEzv+81Mv3QsoMnm6TOP3BDfFmeM36Z7qusH
 GbtyJYNZBajDXdB9Zwt/SHySAhyqqtQmhGIYSvpYyuiZRrMQCIj37Xe
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_092844_900414_EF5917CC 
X-CRM114-Status: UNSURE (   9.88  )
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

Add missing clock definitions for DPU and CMUREF.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2822f1c8e5086a2fc0bda783ca224812..c5c79e078f2f60fdb2c0f61ba6e7f3c6f2fbe9f2 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CLK_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1


