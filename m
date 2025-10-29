Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE15CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=; b=0J54jgOKvS/4TPIfljL18Q6AcT
	30Jkt0nxMI0+2nkjSw1ofd1Fe0nBeq3df7IAAYpNVQ797X9GnXBBF5XCqPzpoIQBwOx65fYaDdG97
	3g6E8JPhDh5m6/CbG9HglvREPwWOkStMyU9Zn1lb/OMmtU6MM7vL9+Xyb4sJjlcTcwPbmv4GV0erZ
	CIFZq9GO2lo1q4sABWhwR4J0fwW98rEhUGun/mAjmhVr9f1ya7W2OjVxzbLy06wdV0eYflSimknRV
	2xia22JUs6ONx4Ytga+4j2Oa2P8mvrCsh9Qw9Of1wbot3n+w+HYcbhwRZhdT0A753uh1XUSB0mI1d
	wSlQo7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97j-000000021kU-41m6;
	Wed, 29 Oct 2025 16:34:11 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97U-000000021RU-2915
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 16:33:57 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso27663066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755634; x=1762360434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=OVj6w+7WJed9COFABr0ZF0wFrGrswzVDHGrIS8PA8RpbS3ky+Mu+BckC1Ae3z9LzXb
         ANHZEtGXiUQD7RR4wHc533N2vyOrGDyS0DTu5FmwWmERzNR7uAl/crbRENsBUdfvJdd8
         mly/5zoCDYaCOr2jSxy2TgdTyH8baDdjlqzqcFI3gFtzk8XFLeFj31bivQfwTdVI2lLx
         eIoTEWiYTba/KtxvDbzCptQzP9m1lLOmvMsXBbMrZNOqRBBAHXI16bT+H2y54VNbsL62
         1/HYYeMcjPpebCH4yE5hbmKkBhGYhSRv0d3XY3Ra6KQxsomjg4XE6bk6jEaBYXpHp0dR
         mbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755634; x=1762360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=dVQ8R7ut8SMiAdTopd2VDRdLcegh5oHeZZEoTt07zRf4fJkvqF7wuhvB2ERjyGnYvE
         TQMsLksloKSWl7vcgeCWbEaPJbkobKoCevy2x26DgJAH6EkQTIhm3PYDhD8OBd4Ftr7Y
         AX7OXvszWhY7P4pYkN5rbmDSxcHoiG8OhQiJfPcGPwm7twIgv7oUigbxJAOlpEDAvXqn
         C8udWiHhvNjRLOrjA6Q+6Ysy9LZq/FLhYZnFHMcGyDeSfaT6uowZ2dtapEwVOpawBKn8
         84I6ZYtu6edVm8mAAsJjiC96Tlp2jbbd1Cb9mZZc1JMQAJgb60AAPq1GeOk6WV7sqT6Q
         ZrUA==
X-Forwarded-Encrypted: i=1; AJvYcCWGgDkcy+cgupXk31WEt8oPPJaR99rKyn8uD0uoN9brQq55x3+wF9ntoQ05gqWW8xisDUb0e5JZtzWCkEgs08bU@lists.infradead.org
X-Gm-Message-State: AOJu0YyxFr1m9xkmlIewo8tfeun+kXEucbMD81No1O+/E9j/bQdvjKM9
	C2jj+cfuVmEAAh/g1eEm4m33hAni3I9BiBcJfhzsAWq21xxWaxwxp9rk
X-Gm-Gg: ASbGncsJs7jRWRw9x27wPDSeFmaFyvwnabocIei1H4pE5+ZLCC6BGEbTUTSGA3XG82C
	tU/9+baPu66zr7Db9m/IdWhguXZMe9Ng0Y2qJRxi0JeiwK6/ZMIVnhxXa6iIdlVvGqdJ3hepyX6
	WcRhIgXCfiY0lPCrVEwveEa+c4ywOP6po5q6AiFWkhOnvGZw/Aun5EVun7c1xMDY58oEAn1KZHt
	Q47MNUiBTxdUUMFbar9pi306EpiMbxtbu2xNIg3l9OvGg26YhEyaGrenYzNxxFRr+0NJO6f1Trq
	CHFgIo/HXJR6jWzPIOBMZXuqLdZj4X1nGNSsrYGi1seMptv/RkStSjdX3eESBtIL7RQlNMTGo6Q
	SD6n5hatBIDZqv+KMt2UwAr7V/+qad9ls8MpUlaj95hiN6wr8yLCdkA87EzsMVUwVY3/HQHiQ61
	wOXRvnLcweh/CXuCeuX3UnF19+0RazXncKbp3ICJaAh5r76mwhKk71aGII+uED7d49BQUk
X-Google-Smtp-Source: AGHT+IGxst0GGPbE3zlpzuYvmZD7MtT+fgNns/2gbspQBUcAcExwpAJ9gNyBIh9hmr+9IwgchPtgzg==
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b7051f278acmr28890666b.6.1761755633985;
        Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853696a3sm1468789266b.27.2025.10.29.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
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
Subject: [PATCH v3 5/7] clk: mvebu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:34 +0100
Message-ID: <20251029163336.2785270-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_093356_564380_48A6BCF9 
X-CRM114-Status: GOOD (  16.56  )
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

 drivers/clk/mvebu/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 5adbbd91a6db..8797de93472c 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,10 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
-
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,12 +217,16 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
@@ -231,13 +235,10 @@ static const struct syscore_ops clk_gate_syscore_ops = {
 	.resume = mvebu_clk_gating_resume,
 };
 
-static struct syscore clk_gate_syscore = {
-	.ops = &clk_gate_syscore_ops,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -288,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore(&clk_gate_syscore);
+	ctrl->syscore.ops = &clk_gate_syscore_ops;
+	ctrl->syscore.data = ctrl;
+	register_syscore(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.51.0


