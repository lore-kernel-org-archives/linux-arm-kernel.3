Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED77D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=; b=ay3i4o4rGm3z0VFmxzXvi8r6R4
	gpFjINGEjR/KvQNiRAvK3/JNAh1OESN5DUYc00TiU8G0cEBT+twINaldf43g+y5z9KQA5i213ZaHd
	W9rCU2IJyqaai8Ld6GUyrJNlhvxIkrBBZf6pO4sp5X4WwAPgFcSyNAz2w/H64CthgDm8ZqPtIsqR2
	SjCv9OVqckmTjd7a6iZhfbWN3Ft3F0GpQxog2Kfll5qcqg+i9AsCYFHVhYNnLxOd4hvWiMcJc8xRG
	dAJGRWLIIu3CVHUojYeVonyd/Qk5T+eS93GruU8kXR8PxWli6wu8b9W2keiTY878IMEzA/LqkFkN+
	pRNrPtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t48yQ-000000029ka-1x02;
	Fri, 25 Oct 2024 01:18:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48qS-000000028RN-3Aij;
	Fri, 25 Oct 2024 01:10:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20ca388d242so12617555ad.2;
        Thu, 24 Oct 2024 18:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818627; x=1730423427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
        b=eq+KVNYZfaiNcskG6+ooQvkQN6xrE6laAz+FaUNCEzIKLSPfFR4QcyUv5waYwPRAwJ
         xKR2cOf8uDCQhKmvzycazrck08Qr2d6lHcbhVZUUjH9SvX0wID1pBOyvk7wsiHUW6v/F
         fv8RGOJr+bAoV5hSr1OVPWlWQ/+5Fc/0tbVMTpXuNOmVjdheqVpi2eWWwJuPFpDYHJRR
         Rx9Y8mQ70GbK7d1UyPWB6yDYqFgb6aKEqRxLZuFkDvIsmptD9nqjfvDxgL9AZeNviH/q
         /uNuZl7+lWXjUK4q4v1pAh4+XwSP/x9Yb9ecIlda7bwFf5lefd6/JlKWQ/ZnDoREDsJ1
         3Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818627; x=1730423427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
        b=Gs6XRYoX92/NqPzqZhF4F090U0zGT7nmo2uL0qNgaSMfUSjy9fO7V8iCd+BKxt0SCe
         MHeGI2qgJOxzP+EERkyP0nP0+US5gpgBgbPF7MyMnFLjKeHUBcx28XWphv3fYjXYQy3O
         ENlDb3KG0T56DDzCaZisFqan+bek0kkTc32fG8FPgseyad762VqIZvryar3RQbiQZ80M
         rV9979aThLWQR+MiKAoVsXuTDfkDX9Tr2Od27WDXtUx/lt/3gDtDIfK7d17/Njk8uR39
         2d9vv4R35CR5N3NFKQ4uEO/zlFg2qE7XHtqhN3NP0xqwTvrHbToTQFEsxlXn44ATSGa0
         D0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWxi0BFqCo3rMhhB3R+PBsioDq0rHgrH48GxmBCPhvq7Mz+nFT6bWIXtVjjl4fEWaUEnAGDgCZv35mFlUVJUeVB@lists.infradead.org, AJvYcCXJzI0J+nqCxSNL3Knz0leVmiYNMY3a0ikxgoKhTOapYR2278tJTCKsEBg0xZvKh8rmjOAqXzgfZ/TUZUc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKluFBuphC2xJ75AflD8zSqoNXjNmQpFMqpP1BT9MqIMIsFc6
	JTaiq3qwR/mYuQuStxpN7hqVTigCpmLBAo8aIbyeDLotvggT8vrc
X-Google-Smtp-Source: AGHT+IFuYgb27DRjo53S1PNy4oCfKnzd8OhJaIYDcpXqGHoe0olM8cbsYPvMtmxuGJEtJGwjOabQfw==
X-Received: by 2002:a17:903:22c9:b0:20c:b090:c87 with SMTP id d9443c01a7336-20fa9e5e485mr115146405ad.29.1729818627304;
        Thu, 24 Oct 2024 18:10:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc08676csm557015ad.304.2024.10.24.18.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:10:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
Date: Fri, 25 Oct 2024 09:09:57 +0800
Message-ID: <20241025011000.244350-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181028_817149_8F76DE8C 
X-CRM114-Status: UNSURE (   8.33  )
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

Add compatible string for dwmac-5.30a IP.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..3c4007cb65f8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -31,6 +31,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -95,6 +96,7 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
@@ -627,6 +629,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
-- 
2.47.0


