Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECACACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDmfIIxvbccs+VTC9JbCAL+D/6aBtsGaiV5H5qK73Vc=; b=SRIGubGsRIX9AWmVf/tL/tPi1q
	dOKtvEEmgefN93RWwcFCCNU4CuYvn0D8t8PIh8CUH/Onc/lL3Rrt3aO86nQVlz5nECBKDhdBntkCX
	2dhcscYPd/AnEBSQPuCfolrsNYMqk5rbbHoWy4cqPs/AedV527xttN8GnNrGgrs6ypxuJRiFJ0kh2
	tr5EPGF6oR2hAqLw5hfBjA9JkuX+ml2jSSBgI9TDuhfg/IhhVp72xBVLJL1CXhtzyjMqAG00jYfTx
	7AXu2fdAwSVcsQmayiPZ6xE/oLLVQIPPKPharD0SC+f63bD0j+dMs+yz40izp55OQFDsrcotabKT8
	6s/iaQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ush9D-0000000A9ot-2RDx;
	Sun, 31 Aug 2025 12:27:03 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgvv-0000000A8m8-29UW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:13:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7f8ea864d68so332513985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642397; x=1757247197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDmfIIxvbccs+VTC9JbCAL+D/6aBtsGaiV5H5qK73Vc=;
        b=OHLnT+TCypQ6hZq1d0oLCoKIfdSETtO7wF5fB7cADMtRz/QWGE3tggB9RUjqC8skxc
         yh47vVXBP4hrqAsdLdlGr/H16Os3ffQX+v0ApbEO5LNAc74WeD5ruVjupMNFKP3a4iIT
         N3ba+T0zCYAuKN72dDZV2HpFj54pcVnvFuP7bgL3fWFr44zfgf8U1RCpsewXv3CyOmlX
         LHAl0tP0KD8ODgJC09Fn+vwG20L+5MnOzdtFifpuEWDElnrI0Hz+DGJA3kSUV6+PgtZk
         LxFKtsVRUMMNhUdOHBxiiLd4Mgr5D/Ki1uARQSA72iSdLXe+Jm/pEHxO2ci35CWo2tBc
         p1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642397; x=1757247197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDmfIIxvbccs+VTC9JbCAL+D/6aBtsGaiV5H5qK73Vc=;
        b=SeyLH6+CSqWnWQvLkqpUDIjRDj4lDa/n9vY6KrO/u+3NvDGj3Z+3rp/d1ORNAd3KXo
         TG1D0AglBngsvW0kj9B1OYJ9p69wuL8cnpFKMIHa39n/qA9fkKrzB/9PmpIZ20bEw7Tx
         o8epyEcl2WCp1m92K6vBZqoSzyrbg/on6g9cp8Q0OZ9H5gS6NfVCrkcUV2vCpkPgs9jY
         RwdOOKRgpCR53NK3BpPAGOOCG27QfxeLPs/aR3XhxbXzfoMvg+QTydpI3J1r0zO7wbSA
         PCmfFiNQuyg+0Ipp9y2DOAk2Za/e40NHqtMmfq65rK242ZpPovW96fnD4nY66W+95/3S
         8J9A==
X-Forwarded-Encrypted: i=1; AJvYcCUwJOxJaPppA8sBJLQzFX/TaHBWbt1YDNIZci2PO7w9KsFN/YtEM+Qa8qLqrHAaYoGbMClzh4YpqW+5N0UfM50P@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh/R6+aOh8NT+PGaap03a8Yks2mrXpF9Mo622hO5Yj9LF2Y0+0
	FI+kircBwZoJKbDDo4MhTJPw3NmSpHsAD6bAT7tEd16kvanzBTMrinlCQZn6eCIBaF0=
X-Gm-Gg: ASbGncuiYaNc6hbDaZNlcMHWSgyKeowUeMGKzpAg8695WpKr+uJhp73t/YjSN31MTta
	OJOl3o9UkhflUzfeOfWmK+dtwlSiImboCnTRnwAYPn1X13VDNBGaWXCidEmOrnKfEEBJHFYkq9q
	4s0dAu4ZzR3ZLGn94/vLThCpcjIVVYuER3x3dz+KcMMzg6MsxfTTVV/i4hFdYRg+GpWb4Q0DV2T
	2r//Lg0BUQ95IdJ9zTmfApv5BwEXqvEg7tv73RQ1z9KxeYjBOeNIZ1KX0dQj4W7qzefpevHQMWD
	rho0uprlmBj2sF3Mbo4Ubq/i2Vr+sXTU8ILsSKecWS4T5tFX7XdvC+ocuu7apOWsJY2hUrZEDlM
	BvV+Dlg7vQZiGgpH3zh4fhzAKe03xiss=
X-Google-Smtp-Source: AGHT+IEfAh2UbkwIQ39wtorHVguSuFgrNsM8OO8yQro++Hj3XAfs/mNEBkj0O/3oJVq6SgUMzK0njw==
X-Received: by 2002:a05:620a:17a8:b0:801:3834:f643 with SMTP id af79cd13be357-8013834f6c4mr197407185a.57.1756642397105;
        Sun, 31 Aug 2025 05:13:17 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sun, 31 Aug 2025 12:13:15 +0000
Subject: [PATCH v2 2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock
 for HSI0 and update CLK_NR_TOP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-usb-v2-2-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1601;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=Pu/jnxs8vnoSEdVAdFl2BrrhE0Ef1+tymfgD1ZqCFYw=;
 b=zy4l1QKfCVLor0PXgeTtwdg6HleS57KspRKQ3hEkCQh3sSRZ3FxdOdhzXAlNXihshzq9NUphb
 hT0ddS/LwMiD3UzURxrl/9WIm5dZC3ETlNQpi+dOY9F9XKE1z3XG1Zi
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_051319_554570_A39FCD25 
X-CRM114-Status: GOOD (  13.37  )
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
critical for USB functionality and mark it as critical to keep it enabled.

Update CLK_NR_TOP to include the new clock.

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


