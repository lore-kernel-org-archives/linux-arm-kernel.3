Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69AACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55pZ4cEaeEj0rydwxsO5TL3wb1AMbR3NyzI16xoHkYo=; b=1EJ1f574c3wocy7Zny+HXV8qHS
	wHdtE2qyTmvwdFMC/naBy7wbYcdCyDbTClYp3QLhgGT6WsBpuJfM+3PSHbK7Ji4uCqn+FmocloGE1
	NGUAs5d2dA5LDP9Voaa97NtbQmrb2aS6LhsbFvJtYbpu14Pk192bKi5fwZ4MNiVFuKOrUS3gus8kk
	CkeoUuL7J3ckiKquBMrYf5ei04Xoa8nPse4MyWuRr79spnLyEwqEM7PzJFzwv6UNm333bIgJJvmSE
	/hfiRglKp1lweExoL1rN22TBsHVb43uDBuoWCYzr91BxnaXx4WQolBni3cp8CX7E9lJ9+9NozP3Fc
	aM5x/9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgUR-0000000A7Px-006M;
	Sun, 31 Aug 2025 11:44:55 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgMN-0000000A6vR-0jkj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 11:36:36 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-70deaa19d3cso32202456d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756640194; x=1757244994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55pZ4cEaeEj0rydwxsO5TL3wb1AMbR3NyzI16xoHkYo=;
        b=ktSC3SXhSaOtBwKHhmSe5+yYhAcr2lPu9Za3dB9DC8gd9I8hCxbJFhIx7j/woyigDo
         KkWAjlgQs2wZDE6omfDYO8WmrZoYXNPr1sRW9KxkaGMy19uBuxuzHOOZf4Z4DwzE5H44
         Fgot1P/eh5t040SqauiDafR/4SW4lxoE8fVmXT2EURMOxLzz3sOKRNHqXAT03iqRR1FQ
         z9mOEuRFYA/FYXxBscvrUWtGmAddoGCWziUUuaNdtaG/nlhuI3YxAIBkXCm48j6zmd42
         xH2yKKhWbHENZ2Qm385CJuOyghofHxwXNFDTefbNxjlc1GlPGJxz4KnLXmIYITe0d1tY
         3+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756640194; x=1757244994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55pZ4cEaeEj0rydwxsO5TL3wb1AMbR3NyzI16xoHkYo=;
        b=TQuz3QqLXP7SfcPuFsfCPxKNjC4H7i7nfhMyPQYif9340Rw+f3HpP5OtK7YO2kvvbM
         xE8h/92UOeZLKbkfGXaSPSwi+uJwFpmQpZFN4Qd+8ehKcoblQqdTerMOVcnVrPuKF/11
         hr3IZd7Dq/EMugwnEvDy2u7BVP51xGVcIFiG6cByQyUiVcgqVq31dONCUFHjB1z/3Yrg
         2oc27trCA6SxAOLBHZuf7eOMPYLxr/GNlXxMOrSN3DAsmzFVJ9Cbw9GCkoQWuq/m/Dlr
         WOAYtMSCpeYYri5yVn5c3VjsmezwSMJ6fNAjq5BGAgRjfGL6HSD10wTPXfzfxYtj/hwy
         IIYg==
X-Forwarded-Encrypted: i=1; AJvYcCVkQp2Njz/spz0u6ZhSxZ5U29hNQfZrihnqYGzpvHFyDr+8WXqjx4NG0Fd4HA6swRtz5Y9Gs6frRP1k/QPw8Cr4@lists.infradead.org
X-Gm-Message-State: AOJu0YxLF37p4l4+T8aDNgSU+rWaU5hJKlszNRQFGJyld/9La1NMjAQk
	f8FyiTh5LNV/8ZtTV4CVu4OSu7E0WbCVYBtbFGrqk6OC4F69/fK50jwg
X-Gm-Gg: ASbGncsxxnrByIJCawQb7FK1QjH8X/yJqzk/J3Vnd3jQP6dXMUS6nk+554vr1YwxlLb
	aj5af8Mw9Q5bLJyOahk+F2mxH1JRwr7GXZDfN/enNQn3m0zNBGdbHoAp9JAcAHGh00+p6erHqkW
	AciiWae0nKLLnccbcgM6okfzKnCC4rUv8DP2tpQCw59DUPu6R8LZqbKFL9TvoXb+B2+eaoBwy4T
	XqXPDlzqrSYKWK6psLOLBlFz4Nsrirdlrx/9cg3FGTknpScvgEt2Cj3iRGCxt6Fu9Uam8yAdakx
	c6TbvKELWFzukU7ToFivri5jmM40l0KX8l6KG5Ns7vda5+EcDD8h4FcFhNLPL2ulK2RKdNz9pIg
	cdPiDNxEvwWz2mG2dU4YQh6J6PzIKYw8=
X-Google-Smtp-Source: AGHT+IExHYamVdOAcgQV8wp2Sxz6sXo66oWwsm5X4uR2NdQwoTIYNsv249mMC/XJXTvsDtdfpXt8aQ==
X-Received: by 2002:ad4:596a:0:b0:70d:edda:f4ff with SMTP id 6a1803df08f44-70fac6f831bmr48324426d6.11.1756640194107;
        Sun, 31 Aug 2025 04:36:34 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28383b9sm20519076d6.37.2025.08.31.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:36:33 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 11:36:27 +0000
Subject: [PATCH 2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock for
 HSI0 and update CLK_NR_TOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v1-2-02ec5ea50627@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756640191; l=1688;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=5UMA1QQbhpw59AbBzA24LNrq4MiD/a6bEyFrWmfD9AA=;
 b=jzsHw7/2Z/SAz8j9iHAzScqWyZXLXTBtJv7RhMq+aamElMTrlEiFWBFvcyT31bvKxO4J1KdPZ
 h4q9KYV5gcECA2Pr61g/PalEvkcP0getvfVGo+OnzKyk3aZCfQyrYpB
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_043635_222274_9093450F 
X-CRM114-Status: GOOD (  12.65  )
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

Add the LHS_ACEL gate clock to the HSI0 clock controller. This clock is
critical for USB functionality and mark it as critical to keep it
enabled and update CLK_NR_TOP.

Fixes: bdd03ebf721f ("clk: samsung: Introduce Exynos990 clock controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 91736b15c4b4a0759419517f7b04dd0a8f38a289..7884354d612c54039289fa9b80ad08f34b9b7029 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -18,7 +18,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP (CLK_DOUT_CMU_CLK_CMUREF + 1)
-#define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
+#define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
@@ -1332,6 +1332,10 @@ static const struct samsung_gate_clock hsi0_gate_clks[] __initconst = {
 	     "gout_hsi0_xiu_d_hsi0_aclk", "mout_hsi0_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_XIU_D_HSI0_IPCLKPORT_ACLK,
 	     21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK,
+	     "gout_hsi0_lhs_acel_d_hsi0_clk", "mout_hsi0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_HSI0_UID_LHS_ACEL_D_HSI0_IPCLKPORT_I_CLK,
+	     21, CLK_IS_CRITICAL, 0),
 };
 
 static const struct samsung_cmu_info hsi0_cmu_info __initconst = {

-- 
2.50.1


