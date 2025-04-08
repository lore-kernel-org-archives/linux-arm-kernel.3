Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FB5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/j7X89O9xO0mUxcRUMJWfkgUvGR1hQnYHcZiDSC8zs=; b=k3tib1T528z6Sremf6UkfKxmfu
	/cizk37ZgYuRoXbBjs4oy7FupQ/KJtCO05PHpJ/3JK+ZErLZtlw4onXCiL9/l61jht67qHT5ojmhj
	sDOa6Kt+iPleQXyShZ67icOzCZys3OZ6bIrcv0AJxcfz91rasjWk6zUB9F4sCKv2bvy6HT2NSeF7s
	1ZrI6GOMXeK06+WhdUJQHFIS1S6fMqXDV1IQ6cPVbnVY7eE4vJ0g1zWv42VC8YBkwkY5rYSrBYlyA
	EUXtjf/+BWtuZhljWfPspZoVk8Kmj+MEBl3yKOrfrdseH7LW4YONXRWqqeE2UCyDv4fQ7l/g2Y2zN
	ZHCdDfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22YL-00000002vRT-2dgF;
	Tue, 08 Apr 2025 06:35:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Us-00000002uy7-38vz;
	Tue, 08 Apr 2025 06:31:48 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54963160818so6485257e87.2;
        Mon, 07 Apr 2025 23:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744093904; x=1744698704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/j7X89O9xO0mUxcRUMJWfkgUvGR1hQnYHcZiDSC8zs=;
        b=EXxSUEN8a/1h7wE7eVtcBWpaFO0FNMuYJZWQ82GYJ1coweaV8rwe1+MQI/9+FKPaKI
         cIvu57Ed/Fy5KbGZnPPxjsJ/ItUsE+E7WXNuMV8plPOshiX08Fw215zKBuRORYuEqHTy
         6L2LQe14tUQIqkns2PWC5bnlWRa2fRvGJHMXEtJFzrNDMQgveCJF64HCPDMftzfSNx2R
         z4/eMd+ziYroomEcEke//t/qL0nIbdMjRRxCl2vRiInaV78zuBLtpWkwj8z0VLvdrLl4
         Ipr8L0mbPe/N8Q4l1XxYlaTHGVEBIZ8q1qtmhvWi/HnaikMLGlu5VTVpbQ8605vjXEKW
         MhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093904; x=1744698704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/j7X89O9xO0mUxcRUMJWfkgUvGR1hQnYHcZiDSC8zs=;
        b=UofSc6aoakDOCsgd/aZeuAif8KkhxyYWU+3RDl3CkORJ9EkKikO0p10B2+JtaOoRui
         ZMZ82Wb47jNkWNHEN0Jp+ghjA2W1d+1RuiuSaoajgUWkMJfF6ZV0BuvPcJvvm3ny0uYm
         /Hty6GG3CB2voBL+SwJaknXMIq3MtihU07bZru+Eon/W1wegeQyERskGEgQp1pRaUnCD
         6tVNVM1otk/kwa531pOS1EmjDbDDaF3lQSbKfnHlLJ+/yfkbAeQNpNkXvdJrF+NKWrEK
         p1b8HlGIEfRkCWWVRbtdeT7WfpgLH7X1rPsfoAuxzkNL09lBXjJTZHGSwpmlKreQ9yCl
         0itg==
X-Forwarded-Encrypted: i=1; AJvYcCUQujSSXd8FOs8EFy+U8v6ls+c1ywSsSPPwch7WPTDNMEXij7GTpzv6ZKqCScBawj/RBsiOZYPWeLvCbbzVjJM7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2uYb65BCqYMnOF4Rrv6vTUluEhL6axfGn6G0ckCcQX1k9PT4c
	pyiXWFiaA2SSht5jTA408XdLwgVaGXvbExmGnY90l5ntnbngy4mNaaPX66Vs
X-Gm-Gg: ASbGncs5j2i1QS+Cwfyt5oRrYLcuuBmQDk69+vtUaD2tgC5aRwySPS1hSEf68jjsfNz
	W1gBOnMThc7YVFluAbja11lmg0jSrsmYClgukTE8PbpjGrNrQcBKCmaZUqrHjnmKFAnRQwnpyE6
	iFByHO5kqOz4s918k9pX4Rel8N7+0OmQWmMNBY1yDE9RS5yvVNFaArsmtOqL1AHsEsV6/ITcOYc
	TYZHnRy+yhTLNGKkO3bLHTFHRAqga99otNsjruQ2udu+yJnjVGzu/AtZ9jwTF9EpuE/m28xY5Oo
	7pDlFTqUtYbT/5xWSlxaXi0CAeJ6JpuVp9tXc1kfGrgIiu7j15Oj1dBs61xwmOBZc/8=
X-Google-Smtp-Source: AGHT+IFFROvjnZfAxfoyPcg5HrxbhQFOC3CDl1CKWR3dFbmCGB2xIAFGBL6OygaC+l2LUb1NElNYeQ==
X-Received: by 2002:a05:651c:221a:b0:30d:e104:9ad3 with SMTP id 38308e7fff4ca-30f0c064a24mr33615061fa.40.1744093903907;
        Mon, 07 Apr 2025 23:31:43 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03125862sm19141801fa.3.2025.04.07.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:31:42 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/2] clk: rockchip: clk-pll: Typo fix
Date: Tue,  8 Apr 2025 09:31:26 +0300
Message-Id: <20250408063126.38904-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250408063126.38904-1-eagle.alexander923@gmail.com>
References: <20250408063126.38904-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_233146_786320_6CE68C8F 
X-CRM114-Status: GOOD (  10.26  )
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

Fixed RK3399 -> RK3588 typo.
No functional changes.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 77ba4d6e7b5f..6c5039bd661f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -949,18 +949,18 @@ static int rockchip_rk3588_pll_set_params(struct rockchip_clk_pll *pll,
 	/* set pll power down */
 	writel(HIWORD_UPDATE(RK3588_PLLCON1_PWRDOWN,
 			     RK3588_PLLCON1_PWRDOWN, 0),
-	       pll->reg_base + RK3399_PLLCON(1));
+	       pll->reg_base + RK3588_PLLCON(1));
 
 	/* update pll values */
 	writel_relaxed(HIWORD_UPDATE(rate->m, RK3588_PLLCON0_M_MASK, RK3588_PLLCON0_M_SHIFT),
-		       pll->reg_base + RK3399_PLLCON(0));
+		       pll->reg_base + RK3588_PLLCON(0));
 
 	writel_relaxed(HIWORD_UPDATE(rate->p, RK3588_PLLCON1_P_MASK, RK3588_PLLCON1_P_SHIFT) |
 		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_SHIFT),
-		       pll->reg_base + RK3399_PLLCON(1));
+		       pll->reg_base + RK3588_PLLCON(1));
 
 	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SHIFT,
-		       pll->reg_base + RK3399_PLLCON(2));
+		       pll->reg_base + RK3588_PLLCON(2));
 
 	/* set pll power up */
 	writel(HIWORD_UPDATE(0, RK3588_PLLCON1_PWRDOWN, 0),
-- 
2.39.1


