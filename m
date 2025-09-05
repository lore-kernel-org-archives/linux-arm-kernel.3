Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881F6CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC3Ih+3Bk4xdwbwU0Ef6uM4jrfPw6U/3ht2D0BEr27k=; b=cn/S68G3vECOgHLg2s4hgOGmu/
	pzeBRKUV7hiG0CuvYAXv+jMg2GBsDmbT3mgedQwCIDsgeUQROeaM0ZBWHiNGW7JUFsf2URb8ojxDg
	8s/W1mD89/BkzQC3UrJQDt5Rzi1Vh+ziNWVn8qCGUa2K5AHjs9E15SZkMy2VTslEVe4dunHFzxhby
	0cmUxjhvJfCpzWXiyAjzLdLMn4AtNl/yyYFtnf5su+ATNwJHN9//WO4PKbG+gx28YVybiMOV0jtUT
	qkNkcVRutyrVYZrTkzBoMJd+1uDX0+ib4gO1NzBqJvRDc+OH1KimnzvkBCA8WvVUAHRzaK0wn9v1e
	ryszmvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uua6A-00000003QK8-42Fv;
	Fri, 05 Sep 2025 17:19:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWRG-00000001xX3-1DsU;
	Fri, 05 Sep 2025 13:25:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445805aa2eso21238835ad.1;
        Fri, 05 Sep 2025 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757078713; x=1757683513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC3Ih+3Bk4xdwbwU0Ef6uM4jrfPw6U/3ht2D0BEr27k=;
        b=gSo3A1q5iuXbffxD4hBvnjS+fwqDfCIOtz8ijoB5UcW9bcRcsQinp1k+T0zsuaAQ5E
         VF6kK9FRnCsG4VoVGgmHCMlkmLw0D9d3wWshExVjE/ABztDtotl6YOUGqorUbElTGH7d
         hhILkdrSEAIKGbOmOHO7tCS10DgGb4cE96Cg75V+PHay5VmiswT95PR3kpWj101Skuor
         zGhRt0BCc7d2QLP12LbFbeGT69JgpvYVUFf2FbN7W8Z7i1kYFuet1wsvfoYwKA43GawA
         bCN3hRJm4QeBeIvgo319swEDeZfTPHR5RIM9f8CubQlPi+VuHpBBsW7tHY7vnsshiVIg
         bNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078713; x=1757683513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zC3Ih+3Bk4xdwbwU0Ef6uM4jrfPw6U/3ht2D0BEr27k=;
        b=kDRBFzrtTkxiRLE5zCegW+L5Zaeor08YNrEW+++XGhAjZCojhK7cfPZ1y+4IC3zi1U
         OnMBvwNOyn/1UyAI7j2NvuAJLfc1Ctzv+mZ8CHqtyVK+akGzMBOnTasdcis2nm6OZTQ/
         /LvXGSEweUMDcIijqIlufn1yiOzFYz9+wBfTsF7tXNatt95y3fZs7EzZPD9c4UYshObu
         GnTIteQRFocsxfvpNsDMlKjdVCaBMAKey+QacQpy97eeCTWgXSWylOC89u4mZGTSPGlF
         lvpWT3IU+8dkyFrmbL8bKEKj0UGFOAsYSfrCJ1D5U7ty5hXTfcXkbyUVw5p8ss/lyNn1
         V81Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiJdFXtSZDb7zqHLAGQl05qxZPMU+7kWmUk4B/swdZ69u3uSIhSxjaWSEXT90i9uMZRUEtalJnke5llw+twGs=@lists.infradead.org, AJvYcCX7Ym87pdyAcB2ODpv16LKkhovI9hzuU+DiolMbQ2jZMHIlXxVhAoO3zu6Y0GVE7ACloUxW4rPC8IUKmAm3tnkJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4sh4W1TArAodH6mtoadtXtC8ecw/jjEebR9h9Ddo+DXaXaCAg
	QdToQ5xv6vBAKGRBvw9uyX4E6q58rVijImG52am0+TslZiqqbxkg2kLi
X-Gm-Gg: ASbGnctha6viLPbHP8aB36QKU06ZDsYvZ28WXwfWoIJTBtwbYdARHWD361Gc3zu6sAb
	zuGC+dzCFViAPeeSqavZGJyCZfXzs+rMevcbp6MMYtj1ba9Ek+Rf344H4GEkd+BJLZq3xHBWn4c
	O4cMfHSGckYQWQhGDyPnW2lxz65bP5vXxpZEqxCMrOCEp2mwz7Z7vyqH/SiHxLsJaXVm6yyGFx4
	1I5MjDzx0XCTBJoDhKigXNieXxj6Ombwm5lEi2MKxXKEO4nPC0ahXN4Jf6Ggs7ouNoFxvU4vUM/
	UAPWuzR82LbHbg/TTb2U5Z+o8vDwVGKwbmFCs9tm6HSDwkdedhdJdgxzGfcSzlXNyXfGgdJV9b+
	EXkIq4V9GLC0=
X-Google-Smtp-Source: AGHT+IE+eUTD1AjKw6WS82Iy2sBoi205L0uzIQBM5pFUvuD+OqHeIgDN6VAY3z7Yrw3uD7CXrMOfrg==
X-Received: by 2002:a17:903:3d07:b0:24c:92e6:3921 with SMTP id d9443c01a7336-24c92e63c8cmr141227795ad.17.1757078713506;
        Fri, 05 Sep 2025 06:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm76447955ad.127.2025.09.05.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:25:12 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 3/4] clk: rockchip: rk3368: use clock ids CLK_I2S_8CH_PRE and CLK_I2S_8CH_FRAC
Date: Fri,  5 Sep 2025 21:23:27 +0800
Message-ID: <20250905132328.9859-4-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905132328.9859-1-cn.liweihao@gmail.com>
References: <20250905132328.9859-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062514_331576_484D1B45 
X-CRM114-Status: GOOD (  11.09  )
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

Export the clocks via the newly added clock-ids.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 8159f643dc..1fb18c9596 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -244,7 +244,7 @@ static struct rockchip_cpuclk_rate_table rk3368_cpuclkl_rates[] __initdata = {
 };
 
 static struct rockchip_clk_branch rk3368_i2s_8ch_fracmux __initdata =
-	MUX(0, "i2s_8ch_pre", mux_i2s_8ch_pre_p, CLK_SET_RATE_PARENT,
+	MUX(CLK_I2S_8CH_PRE, "i2s_8ch_pre", mux_i2s_8ch_pre_p, CLK_SET_RATE_PARENT,
 	    RK3368_CLKSEL_CON(27), 8, 2, MFLAGS);
 
 static struct rockchip_clk_branch rk3368_spdif_8ch_fracmux __initdata =
@@ -367,7 +367,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	COMPOSITE(0, "i2s_8ch_src", mux_pll_src_cpll_gpll_p, 0,
 			RK3368_CLKSEL_CON(27), 12, 1, MFLAGS, 0, 7, DFLAGS,
 			RK3368_CLKGATE_CON(6), 1, GFLAGS),
-	COMPOSITE_FRACMUX(0, "i2s_8ch_frac", "i2s_8ch_src", CLK_SET_RATE_PARENT,
+	COMPOSITE_FRACMUX(CLK_I2S_8CH_FRAC, "i2s_8ch_frac", "i2s_8ch_src", CLK_SET_RATE_PARENT,
 			  RK3368_CLKSEL_CON(28), 0,
 			  RK3368_CLKGATE_CON(6), 2, GFLAGS,
 			  &rk3368_i2s_8ch_fracmux),
-- 
2.39.5


