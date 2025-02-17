Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F23C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=; b=Xm0vxyWPX93nWKbHdN8mopzgu3
	1IpG4f+kp3DnlpRK20kr0Gyuwus9x2IeIHZFHSLBlRMBv74IVM4fYx06Jw6l1CWk2Vu9xG1f+x2OC
	ezcTnfEJaCAV4J3qOE5fGrlTVBCPytHmM/+HPPf1kEU7oH5TjeE56BinF5gYvGjMYRk+o0bgPEF4m
	x6amc+DM9ACx5IUHzNRN2p1kMYHDxqptxkr+CVk1vxxhbotxbysvc6fr7Ogt1ZIL7ErjeCRy5VZb8
	hAmvdyBJEqKvRGNX0gjP2O8fQAPDb0Wi/smzJwhOWbzkJ9SK6qNT4+HAD5+tiv5efhLWJ21KTfNB/
	ccbnsSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6WA-00000005iUF-17JP;
	Mon, 17 Feb 2025 19:10:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47g-00000005IB7-3U6z;
	Mon, 17 Feb 2025 16:37:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f31f7732dso1647243f8f.1;
        Mon, 17 Feb 2025 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810251; x=1740415051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=QQyXiXuoQB1R9wHyj86DBspwbAh3Vq4ggkIHTa5STE/12jEpVm5JJ4WVuGLt7yg1zL
         ZXeys4TaSkHMp+Yry1SfML7MDzUXvCV6bEV9x8fcQFeLjQWgtQEuFMWjgPTUFPTWAbU2
         SUqVnjMKqG2GoNdLJBGPO2jDWIgjIHzokDUoePSzsMM/SLWt2iOdIWOkboLCT1ig63mN
         d7m2KURBS8bd2JVBKSC9WDWvWTsyYbD4N+W/0LpbwtqpXuHkvh/50PJCgCju8JbQqFoy
         4KOY4RbpELpR88T9uvSQ9vMc2nUkr25GLIdLbXXySMykX0+imr6Tc1bbS/c4b+x4hsyX
         FvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810251; x=1740415051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=JqeRHo9L8At4k2kSkS6v/Xbg9Fmy7zHkAE0XcJUgGWiZs+g89nBK7SNXkKfFIoVn/P
         wVQ7aVO4fTydXQB1HLi5S2qNocbXcCgyLXs/b/csfn7P9+90dJeXUCNmbJKHh8Mr1MH7
         Q5TFC2KZLZu2Ti3uUbrt2ZMZd9XdFLKR2vPW+u4cnGtApX/xjAVYRbgzO08U3FzNJHuU
         ypyBtQJr/ffcccQ3/tNNJRM7smInht9hKnOoYT6F3ZjQVPrMz6jvPfCb0AVDS9x5NZZH
         crPbdDUU/x69O66Ku6nwv+eBaj7AvlVNYuJaoARxgyagP6cXxMhNXzlPtoGRNcF1gUQa
         O5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVCp+4ePrHemueru/NU3TWfe6n/8BMFRM+Gcgx0dhSXB3CeO+XDzQCVRTixh3mTaATy/p9meqrjjQPI0YM=@lists.infradead.org, AJvYcCVXShPLaKiFkU8EvfuVyfVgAWMsxe8v33HxaIk/Lapmvru9jYo6m1qFB9RkGUEhInMOx0hyOXg+oYvRKp4aiFfX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw47jhhwlejueWSObsfuT0xouCLLmn3HzxOlbeQWE9DUEmTnWil
	cPWah67DgjSWHqV8cJUex+K7qI+YhFaoII0giX0g9xZ7MMe94hDX
X-Gm-Gg: ASbGncvMYS3uQG8MlS4VNz2KXwngC/4FEq+xjQ15IwSHMpPdbWFRGn0SErAwWuAsAEZ
	mg9VGhFj1MntCOWUJecAXWgEjOwfQ9L/Gbq4b8sLI4bjrjLuJD3s3HfdNhyLTL8nbNR1OHmfYRH
	/g8bBetydm6QlmCdmxjb/8OWoe1nMbSu503B6jN6kd9RltPBCdvIjRWp6s0NgtYehOQHP5884HU
	9tDiHXVZRrVdJ9PR2Q04hUPycXskj1/7uQ09kKdz+5tXlt0NsQLRoh8xtzSIfp/LIsFYPFFkkeS
	TKEMaeUitLgZgO2k1bx49MSiMYgny+ZvYrkgYxSsv+c3Ux7rIOJIeLXsUAmiiPfYa5M3WdFVOya
	VCMgZ1YE=
X-Google-Smtp-Source: AGHT+IGKeFn1JZI+61Y36W80rkeFL6tO0xV+0w/zCm2hwXiflv2MWSmUK04720sV0csGUnPk6PUGmQ==
X-Received: by 2002:adf:9bdd:0:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38f24ce77dcmr14937408f8f.1.1739810251284;
        Mon, 17 Feb 2025 08:37:31 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d5d8bsm12702877f8f.70.2025.02.17.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: [PATCH 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Mon, 17 Feb 2025 17:37:11 +0100
Message-ID: <20250217163713.211949-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083732_893901_3A3D90E8 
X-CRM114-Status: GOOD (  12.87  )
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

This enables the syscore callbacks to obtain the clock context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/mvebu/common.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index ee77d307efe0..53712c3e5087 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore_ops syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,15 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
+static inline struct clk_gating_ctrl *from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct clk_gating_ctrl, syscore);
+}
 
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,23 +222,23 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
-	.suspend = mvebu_clk_gating_suspend,
-	.resume = mvebu_clk_gating_resume,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -284,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	ctrl->syscore.suspend = mvebu_clk_gating_suspend;
+	ctrl->syscore.resume = mvebu_clk_gating_resume;
+	register_syscore_ops(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.48.1


