Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3680BCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imvbS76XoT7vPDnoNBAMw6pY77bkDW1TJhU+1nyBJGA=; b=YNVRqFvecpDiFYIr4RigzXbxEE
	k4JeG3SeiStrW280r5dAn8urJ/DHrrp8Q6hK9bKoTl3VsAsrQdu0VXvg6VAbUkws6x1lzTnF9/d50
	iZh1LI8Vy2QKVCuMIG7wS3KJJvXx38hTaL4KoKbjJGQfj9uH1pEzI/hp+jbdKbU8/whZ9X5JR2lcY
	Ol1YXlwDOUm65QAqgKzcibXIMjd3b7+uWGbtI9myWFhxkOcWq3lek2ua10V/AQ6hiQPeZ1nqvoAWw
	XjL6u6PtYBstTlIeq5qtSYEsY1ogqs6M2mLgEiasGJuRBPLWXvlV0P4zNt3nUgmLbEIkYuQRUNciR
	F0qDPQbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgRk-0000000A7Fx-0anR;
	Sun, 31 Aug 2025 11:42:08 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgMM-0000000A6uz-1bVp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 11:36:35 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-70def6089b2so46747776d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756640193; x=1757244993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imvbS76XoT7vPDnoNBAMw6pY77bkDW1TJhU+1nyBJGA=;
        b=mmeNfMCO5ChKCLArkQep2EOxtB6yh5/rPSijaQqPpTcI7gmJEVG6+d3CP7/7SHAeeV
         XBeeAAxarIBP3hKPziilpl+wWerhnJcOPBCdOHV9Zgs4G3rrO3dyXuZPh2idIvXtf+yQ
         +qLK7x/96sHkzi8lvdt7qwoMIBNKKTADNSwT5RB+A8WCHKwwbauy50Y51pr4CjsApUc8
         L2qzlS523yqsUAgqSSzuAiuHAVWW8LqqG8w3zpjHNUNY7Nmula8PP9THySWEPNW31bUD
         d3jkX494111CdfA3p1qSlxKz0MgGsb/3y4qXNIE3VrdfkVBTtvMpJQE3JX2KZIJQZ3XV
         GK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756640193; x=1757244993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imvbS76XoT7vPDnoNBAMw6pY77bkDW1TJhU+1nyBJGA=;
        b=OID1Fw+lk1zueXJgxBV/EOYacPtPssoKjI4asP8gVi2yduUnmxYV1kC7KBN7ET8ZfX
         sf6KjL/9XAUrbg1NaOZqMRwoHYnxa2VWKnjY5gsGH5h2Kb7CEg0md/u3/phuQfFZTs0u
         n9fUPGGU2LC31CFSPYLF5HmX33eL095l7PN2tPQ9aT42C3hb5gIpErP/W1YkDImbsNX8
         5Wqx6DeqOAuQwGklUHRHe9kF9IZExwZbi9xijsowyze3pUyZSod7Dc7feFiGEzm/J1Qc
         FyCeCR4mWIbJqNb1lFtR7svJH9XqG2LA67H0ZH4ju2iaL8vBpuXtYoHMLsrZ3MNxpV7W
         Bwwg==
X-Forwarded-Encrypted: i=1; AJvYcCULYXg7tUoD0IqkH25vN6NGL8J9USTY1pC6SGMA7QYiXZpj9lhxoga99YKlxJ2LL48zGkYGKkVH+5jBVHQWqtmz@lists.infradead.org
X-Gm-Message-State: AOJu0YyWbrBPcCXt9Lq36Y+CxymhN9DTeWyv+5NDRg+NMmaAE4iYNXVW
	5q1EUNcdoZn8rVY0QLbcsGirwATFrXJuUnkMYA8luoqzd+7Qxrs5Yq46
X-Gm-Gg: ASbGnctaC4kamRlvpmYcNV66qURse+bzYPDkTEXtQpmnL+XypxdKPoGY72UAaLBwk23
	QT69mzKyIhUn6GVgOYDsPFdS6oe+bB5m4XSDIDpvThCq+qQWN7tGgZ3WcHT9Ona4A0Kg/w4E4Tu
	C/C3GMXTgIyaRJ4zZRvR7bFp8o4t6cO9XbDd7O+6cepQaODO6BvUpWyyyLwF9NMxoiaGTabNy7/
	DM4A/uHdHTPG2QzqvLQz1Xl0dngPVc+f3dXQXGHlgJ/XMPp9vGZdqn65UV9LhurXPDRNqVgpsfy
	/V78WATrsSY/pvkPtdO0AXcAMOeYqapW+Hk2J4XWT4j1911xzgEqod+BmfD1fh2jME6fzpYQi0S
	GzST4G2j7TGdGlCwCh3o9G8TBugpNGlSMvqC1w9EFHMzK2KjEdo3T
X-Google-Smtp-Source: AGHT+IHV630wqWGffYM6kShz7/qTYJvqOJRnSYz6I3w0weN4IBkM8Q5XyHS+gzuNT6ATIJlJwAut8A==
X-Received: by 2002:ad4:5948:0:b0:70d:d4d8:d3fc with SMTP id 6a1803df08f44-70fac8d3491mr45266476d6.46.1756640193195;
        Sun, 31 Aug 2025 04:36:33 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28383b9sm20519076d6.37.2025.08.31.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:36:32 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 11:36:26 +0000
Subject: [PATCH 1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock ID
 for HSI0 block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v1-1-02ec5ea50627@gmail.com>
References: <20250831-usb-v1-0-02ec5ea50627@gmail.com>
In-Reply-To: <20250831-usb-v1-0-02ec5ea50627@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756640191; l=1077;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=LfoZx3TjTj6uwJ1O/VBARwGIA99pc3EHjHaCgfE9NuY=;
 b=uLgDqC52/VYRAqkLs2JCoyEBud19Hv2fcWbUqQ6Rv42NnR1elkkUsxTwEF8CdS8DYjgEfI6hZ
 jnzGk50t/WPBvRxvltHhT7a9FhhOvTIoPabcMi47dkWersyeSL3KlXO
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_043634_432993_FABC3224 
X-CRM114-Status: GOOD (  11.25  )
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

Add the missing LHS_ACEL clock ID for the HSI0 block. This clock is
required for proper USB operation, as without it, USB connections fail
with errors like device descriptor read timeouts and address response
issues.

Fixes: 5feae3e79dbe ("dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings")
Cc: stable@vger.kernel.org
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index c5c79e078f2f60fdb2c0f61ba6e7f3c6f2fbe9f2..c60f15503d5b18b11ca9bdce86466512dc933901 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -236,6 +236,7 @@
 #define CLK_GOUT_HSI0_VGEN_LITE_HSI0_CLK		20
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
+#define CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK		23
 
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1

-- 
2.50.1


