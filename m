Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C10EC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=; b=dJrhpVszX6Wcj7+F746OB2qLGJ
	kvp+HbuTvcM/VOEyXyil9cK+F75LHwApcnOUV/kFhg/Fw1G4zevmoU3YU1sDwkj5ANQowmb0F1CsW
	FTimKIpAT2OigSWk66LQe/w1BAYWbJEmIzCnvRcB1Cbo0p38Gvx7+HmpQImLJB99rlpKWGmsyewVQ
	18pjNYjTkKeushoo92sgv3CVcbgf4SloNCrFh9VCwSMT0JV2Tr3boAuvOndF3mkr/i5DpG7Hk7rX/
	OuRtGRCK7w6LzKMZSZyI+sqohznxuKtrvVfCVWJFIHp7YEvVB+PMkNOvYNC8Ya3LZQZC1zolwaIP8
	SQyveqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGD1-0000000BgZJ-2Qj7;
	Tue, 06 May 2025 11:11:35 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEg5-0000000BOQ0-1nKV;
	Tue, 06 May 2025 09:33:30 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c5a88b34a6so576047785a.3;
        Tue, 06 May 2025 02:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524008; x=1747128808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
        b=Rd34OoJ0dc04BBoqURwV7RUjeysyarLf83lX/Fd7dygxlj+E82dTZb0rFn/RdJEQCd
         KQPHWe5xdimu67Zu7VnX616SDgjbNcHJ48twbJaOXvCznCF5FtNJjCx/TamWPTjHCW52
         BHJ0dk/i8hEpU2Hn9XS2igN/Lxwr0tvGKMaQlkjkFVfrrfH9XcX9IbgOlLGhFObrGs9N
         4tPhvJVRZmbFBYKzJzwnOVz7H547oCxQeff2UwSXtSCBWyFlTuYERy+tIa5pA3Z3EWzl
         7SbFJkAjZ+U/O7EXuvh7JBKftmd4/KiC1Pm/hUHh3IiPaOnGsyzuS1AnxL/GGfgFxFs+
         5lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524008; x=1747128808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUQlHE3WV+AglG3E1dueIGqmAdWvRG/aDbQh6p9Pats=;
        b=ScCB6e/C7tYkyckMBfzYds+NPkQOJbN7YIrbDrDpq5tvkW0RVsArNXCKYCkZSP+wsx
         KjphuaQazXomy6oXh970a4hBFXMLyiHX+6pCiKRM5f2aqKhqYyP5jKK6GymWHnr+p2wE
         Yof4ccTqf08XZURBbf8OJCPGWuWxlionoonYAlK+VRMy9hNOFQickcJ0GKkuN+bX4xaO
         JQRZloaOkxrX5tKR3oLDtccxmg+E2FroXHwRKcY3Q9uPoLpB6Zvn+USMwkuSedChdqYe
         1DY0EfmWkCt9b+p80hol5xRcZ4GHxk6QTlzLhxmBJUTTGoHLeghnCFTmtHcqeM7sdrEX
         pT7w==
X-Forwarded-Encrypted: i=1; AJvYcCVvLUGyvFBYXnMk7iKee8hQAiAaRscCb5kbp/RjMv19aYEs+hiYBMl1YQruSxOMCcX70iRTm22kGIqFD8nwyHqm@lists.infradead.org, AJvYcCWlNhxHje7ZKTo4nOP9WImvDEBMZN72jywUXIhELJnSU+bOOXS8OVmSVU6PXEHcnHtOuPAOA6Qg134ftgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfsngpS/jtuv/Ul242Iwy81mCo2Q6zO9pD1cEDSsjd80Yde7Gk
	mJ9jtEVttSEw+TP6wYprnBLsOGaRpJJhCyRX6PO9Iv33qvIV7UUH
X-Gm-Gg: ASbGncuzwG39xpaSWZucdWegEC9cWn7tCO6fraglLpk4+zEzwOYnMG/Rk1ERT5bOcPu
	vSJPufvriRU5A/h/tZFXdCaPVLwtnjeBOO/fQFTjjLocgcmNEaO89+/T3s5yzdnCKcnGwbv47Nt
	7F3XoeuTf/3FkxZ3TiGfykwhnajvPPbj4hzsnqdvhbq620159Vp9lYtGUM5gkCtZj2CpJYGsjos
	jtbhkQbjPajLt9jmewsgZJkpnSqtfKwBHI7iob+QCaE+tD18c/HUqZ3h3cpVht/yw6ugfyIYGjp
	pfny5fIRk+ub9Hnx
X-Google-Smtp-Source: AGHT+IH3VqzXlInrKha6VmM4WZWfAGkLbfKCYjNCx8kJZ1aXhqv2kgptMAcRo1MHkN1XMG29piZ9jA==
X-Received: by 2002:a05:620a:2549:b0:7c5:5d4b:e63c with SMTP id af79cd13be357-7caf09d2a28mr363658985a.47.1746524008194;
        Tue, 06 May 2025 02:33:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad24501f1sm685744385a.114.2025.05.06.02.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:27 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 2/4] net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC
Date: Tue,  6 May 2025 17:32:52 +0800
Message-ID: <20250506093256.1107770-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_023329_463838_3A656309 
X-CRM114-Status: GOOD (  11.57  )
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

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.49.0


