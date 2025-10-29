Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E50CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=; b=MZG5+h/AHCMLonvIrkZrlmw7wy
	NhQZpAyvTW8FsQkDZlQaxzUUMW9r3MSs1t8NoKUF2kedULjqi4i9U+d4BW9rNF9XTvUO4uvee5lMO
	pknyGBV0xkbkN4IboqIQ1k6ZaiME3IVm14mWe5zvk5yJOgiuSZ2d/qxJfgKcW0hPPCmDNnG7ts4RM
	OOMJ0qr3vzU4zFRpwT9JzywjqFShuAyCbUXyJWVr+unfNWGhKxWP+NlCUr39SCDZgZPW5pMRlGkHn
	iA4GQUBoQpP/XfM7fEpgYtxB/nytcU13MUSS4h3EWFY5l696Xy6QDvI5Y1Vku6d7f0FlZm1VTfFTf
	Aj18RdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97Y-000000021Xk-3BOQ;
	Wed, 29 Oct 2025 16:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97U-000000021Ra-07XH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=; b=BMIVmjAkAxoEvHEPKxmRkhOq5T
	DimvvpzF4Mo9iXwSkBDPLgLit9gsdszlMsdhTDlRUeEtgG6+7zfeoIFQvoz5oCg8CQYSn4KimHAre
	j9TdHiaQrPb351tb3Y0XylhkRVtpDU85jXojUTQfk953eTjXdatbNgpHZeLeZgD286awuaVWxKAl4
	HTKCfXgQGP9LdBXO/bUHFot14DkmtUmISNLl3gSTuBpe2cvoJl2NbK/maX4CPx60gbyiTjNcQkLLE
	Ho83a6Z5tCMkD/RfZoGEqI14cHe5x7Y0g4098e6nE+c0k5ZKujoWVf0cCBppX3NPwoZ/8HOdnPoWp
	9uNH52eg==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Fh-00000007JdU-3wm3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:23 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so18726666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755632; x=1762360432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=NxUjZMbH/jEJDwrFBfzFDtTkrNyOH/SW7lmvLKlJW9FvIX/HDCPNzlBbngMHEbt1c8
         ytuVz4gf6hyhLdGjMQWoyfvCev8J3c4Uv2zL7mEbwWqa6drtIxgetlMP051wfMJeT9I6
         mbqzskZB2Mg/J4QopX2y/HB1IwDMpv3lVYeBI5zlDpS0QSoykeEN9WRvlQoqzEc3GRaR
         HXMJ7svo7UAZ3Swz581brY/ncrUeht5jmVY2Gr6N1HSTNrIKMw2Sv/xm8lE1hRQXA0Y+
         SlAqFOO1B3znsghXfQ0tBZfFOfD+YXq6aVLiBWqCddr8Y1Ng2eqhfgnrdieWRY+MAlxf
         GWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755632; x=1762360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=JilVJHKQIKy7SHcghEVVbe3ssLIxBo1N7SKkfvECik6ZcMeqbo8WxHZwM9DjL6yTRM
         1ub2WVdLH5wzhHblQEl+DKdEy4HYBfJp3/U6y79sTYOq2daeK8oACG+YSYKcefU5XiX6
         TLw/7A4z1fHKp10+l++TtoqQh52qX5ct0MISbslatDEXXw7GMW3RvLlnbEpMYbGNAKiT
         u/2pSZXzE1LL+8GPoZe6ctaGdOjmDI/9WpGxoXfKjGO9P7r8hQ5Ao4fFSiuS8NxireOQ
         Is75m4eSHmkHGRuXKpWMB0SIv+Grj9GNTrZnD67qLluMUBelajULs6WYrnED/c7y80T9
         x7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXccmgaUjQthLyfohcJEYEcMrJzW+BXd8S+z2kytkuPcyWNGWngJMh6Tm/ckeSGqZ4w3+Np0qkbzc7ZmnP44+DC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn4ChWDTbx5HnLp3laMTeK5pqdJY3JkPwE13cggtZd8YnNoHWx
	4wC6rR8f/nk/OEvTtstgC3dE3FRL4kTv0VbBoX+xb+LfXui12eyrc+Jt
X-Gm-Gg: ASbGncvap0fv0o0XsKpE3Qo0AV/zMfcW+egwPfxlmu2KTAEQUMGzGiTmwPFsqiC1ekq
	X9ggM2QfSK51qQrC8PJ8IrHPSaa6+BMv7S7CWMclfPf4tNSXedhdDNTKi68q0Bv9thRDOSX/iN0
	V3OKllPtNkA/1bCs5dm0cDT+Vt9C361MLgz77vg1ky7s9ZrGV6JO4mGtqCXyKUE6fEzmtJ1g2qL
	Zph5F0LqvFz9fsLq1eBcdbGN86fwZVfZzWclkmIgyWLe1YclLTpN25MpqOQ+YTS3uOAGOuHY+Nq
	jHKdCCaY92xc0pU2WnsERn7z4snsGmy7VMhLUu8+EnaKqTxqg2RWohGqjFYWj9jds6JNgeNIqSs
	QKDAQnAhgpkB9AN6fdkGCLH9xfaKpkSufqe9+IbKe67JJqIsLG3LTUcJlG0st3hoihM/v2v4FtP
	ciPXSeeP8OLFGwslFIIfVdcLplYvE534ccYzLg7yEIgM48PvVL2ETzgzNlPZQDClDg1ZYv
X-Google-Smtp-Source: AGHT+IHRieiPBGU6MC5P5jZHI6G/6PD4P6RVg3Iggx9u+yanu4koYZOv2T4MUr84z07ifr1PiVwzxA==
X-Received: by 2002:a17:907:3da4:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b703d2dc3fcmr322653366b.9.1761755631652;
        Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6da1e2226fsm1067814666b.20.2025.10.29.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:33 +0100
Message-ID: <20251029163336.2785270-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153822_155556_C64C1246 
X-CRM114-Status: GOOD (  17.20  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index bc6a51da2072..8c6337d8e831 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
+static const struct syscore_ops tcu_pm_ops __maybe_unused = {
+	.suspend = tcu_pm_suspend,
+	.resume = tcu_pm_resume,
+};
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.ops = &tcu_pm_ops;
+		tcu->syscore.data = tcu;
+		register_syscore(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static const struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
-static struct syscore __maybe_unused tcu_pm = {
-	.ops = &tcu_pm_ops,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.51.0


