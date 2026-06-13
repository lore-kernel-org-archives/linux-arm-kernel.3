Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E1CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 12:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=; b=GJcXXsgDaQd+44cQO4u9T3XZXP
	uWSi2a9udZRFENMR6XWp+MuV3iVXt4A/wjNvSlYXA69cmsUK/mg1JM0ul2UxxjAiOSr5294soztDR
	B5AOQi/+ZCrjqgo9ky5bcIB2uPYiG99/4dROHZ6MSyz2vZWK8sLZi0vaa7YxhEP+1qEaiCMttQj3C
	Ewqw+kN/ll+6wUVIdPjHT8l+Z4SeNjUGFXNwcTvVVMV7iIoLeEBBqcKcth5Czbqk8KBu3JN4bzi+S
	R2PJlOo+WMHQjGRhJXy5sIHU+MURgukhbUR9z2A7b5W6wKlIYm3n+SBamRuNRjVEPAReEvcyKBM99
	4JhrUqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbR-0000000CHU3-0aJj;
	Sat, 13 Jun 2026 12:36:45 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYNbP-0000000CHTJ-20mT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 12:36:44 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3074adb8fcaso1303883eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354202; x=1781959002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=Im/KFeD8U0vifvVxHrB75LZ4wD0L2EOsZec+lJIwkUONuM3spOLfZZYkZPcXwkrpvc
         YlWtrQYAXJ41G/4mqvPumnRqn6MsuC02XzMWEEst60GLDpaxupYsAurcOvyHycjxiEkB
         eO/g+Qhc5T7b5hagyirLYxgPcyNMkySmLNff2qZhX3L2RTlg8eSHoYA07yGOm1PLO+Jf
         kwAwFkgDWUeeMgfBag1VLamETmpqZq+MCrWyIlMc3tWKLvgcB0VMn8uYNjMbmfPdcaiU
         wPSG7LtaC17MTt2IwL9Z6TLx7zQB7IC4V8uD+fHdgmuF7eemDlY9Kr3oAC21BGzWh+im
         QLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354202; x=1781959002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=WjF1icuv+rTxGbdsa3fdHKKXuOgKxuEpQqGdnky9dhNfCaOjpSLyTuRnoZQqlj8QuR
         DG8DII5JojZqUbvVX3spHhqFBn61NN0OyYjW8li5E9IknXw8to/3t8YRA7/sTQj2gxMD
         z2An6/Ge1rCc045ncOHocwp8tisKG9x7xsJo+2DwYfCv4QqPvpZ5xgjuikRFwSb+Ip64
         BFitfBffrpg9f2aJpJjOmqBsTlwzxHerE69meziNwM/CEiN19/1omym+McBk4uOetkIX
         W/OMZfc4viXq7PLceYCD4kkPqskyPZvqIgl3p1SVbmYGx3oqEoEkmFSxzjjaAdAI0vbZ
         3chg==
X-Forwarded-Encrypted: i=1; AFNElJ8vrrbSEFFtFoNlIiTAWrDRFJwk47qpy0uz9CJAg87Dxk+6LCCq2wUZiMNvAXc7x5JBYLe9mSCHuLttyJANKyM3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+940Fy8Dkqx1CWsXuPj4SHJyt/1ROBTKwydhcTdz7wzuMHnaD
	82uoBhUe29eodaQxozuva1gmRl2BGDj0IgXtq8neZNYsAQJq8kXN2qqr
X-Gm-Gg: Acq92OEM8xpMzQAQxh4kGbqt5yJOgvPpmjjPhrva16JK8w9imWyjjPYwOxLAtoIW/2u
	akww5n8HMeDJxNdKGNbLerR9EXEMWdStajFLvYUU2z8VXf8PhCvzkukPsixwPyUyihDiftC34RV
	FQ7WwXuBeWk3fVbh13wRwFMQ0NneCOYaTKE6Dj7E6dVMoJE659Xi6xD48VguC/bKNqOSItZFtlI
	GOhb1Idte9g2wnLP0QybQKaOIJrY6ZL3TFDi88B+3lNDJXscJPxpuishQhDTY2t/kwzeRovvyWY
	e7VC/Tiz94IjScV135MZM4fTRI7WCjo7+CgYZDLXM0c4sQkKPwO0mVcxeNWyS8+xnRLR0TLQhky
	T3BN0HsMfozhgYSRSJC0f5K5dMM5UfUsS8m9HxTc1eCsGuv7bixcPKrzDsqaRThfyD2uSOAF7zA
	/EyUoGxhUv0gNdgs+8/Xi1Xmw+VpLbqSyy6yutqHc=
X-Received: by 2002:a05:693c:2b01:b0:304:8366:9fb6 with SMTP id 5a478bee46e88-3081ff64a9amr3890172eec.2.1781354202552;
        Sat, 13 Jun 2026 05:36:42 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:42 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:16 -0500
Subject: [PATCH v3 1/3] dt-bindings: clock: exynos990: Add
 CLK_GOUT_PERIS_TMU_SUB_PCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-1-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=704;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
 b=cGHudpsuDr4dmEXiqgk4rHAdC5Scnr9s5I+xmQapgQwg9WM2IKjiyONnen2h6xyEJzoB3fPXI
 P//x7ItggwFA7Zu3/Ft7OBNLTnVlO9mc14jJ56iS3njjJLozCLp5HjY
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_053643_519641_A3E5237F 
X-CRM114-Status: UNSURE (   9.18  )
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

Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307cb52..c06f591d9d90 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

-- 
2.54.0


