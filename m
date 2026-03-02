Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2789EA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBNRmuJe+0PPQ4BIarWTighfyiqD0+gta5zQYlDF/yk=; b=FMwa+sAhowwixs2xGOHPwWO3Qs
	h/uIazd0eWoI7oQR/+id+/qgjnr+GdNn1KCvXEfx3siMteChGdx6ntPzUWO5h368B/2rLIhE8l5Ji
	GpVodR65QD4395LJRM7bYjhmzl58OQbNswzGD5p7zaSvZTy8yloI/VcbSdf0ToHEnvG9vG505lhgJ
	mCD/E/c+fGPRkosV+PxSo/iHQThWy/uE1GM0xpj8BQ/zzRU9HMU5uB3yh/xL7oSTMceI1/axi9Xy+
	7jbc5EbM5a9s1hqyYURmvi9cICE81aBkPtD1QEXfPBLuewy3TC4cR+M2ltpgYacbScTrbphvgf39i
	M1jAS1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5b6-0000000DPTg-4BB7;
	Mon, 02 Mar 2026 15:54:16 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5b3-0000000DPSU-29BG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MB
	NRmuJe+0PPQ4BIarWTighfyiqD0+gta5zQYlDF/yk=; b=koUJWiJa65TZE3NOiR
	jshin6wHuOBLR9vxA1nAEz5xkJGMjEKyqLYmA/IvDDS6dmz1OdViytSNlKj4uHHA
	bo6BFdRe7s/gdHf1whIG67ejgu4aHoNURc2k2Qhh2X8ASw9GEuBjhhZQB4ITCjh5
	WfTWsOCjCKFOqLd1tshKEhL2Q=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCX1weOsqVpju7dNg--.43634S2;
	Mon, 02 Mar 2026 23:53:51 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: sudeep.holla@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] cpufreq: scmi: Fix of_node use-after-free in scmi_dev_used_by_cpus()
Date: Mon,  2 Mar 2026 23:53:48 +0800
Message-Id: <20260302155348.26374-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCX1weOsqVpju7dNg--.43634S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF15tryrGr1xGr4ruw4kZwb_yoW8Xr4rpF
	W3C3yFyry8JFsrJw10vr4UWrWYvan3ZrW5uasxKwnava98XFy5Xryag3WUXr98CF93Xa4Y
	yr1rta4xWayxA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUfQiUUUUU=
X-Originating-IP: [240e:b8f:927e:1000:4390:9d39:cacd:606d]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww+TN2mlso+dEgAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075414_038076_E3B064AB 
X-CRM114-Status: GOOD (  10.41  )
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

In scmi_dev_used_by_cpus(), the code previously released the of_node
reference via of_node_put(np) before checking whether np equals scmi_np.
This could lead to a use-after-free if the node pointer was accessed
after being freed. Reorder the logic to perform the comparison first
and only put the node after the check, or immediately return if they
match. This ensures safe reference counting and avoids potential kernel
crashes.

Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 4edb4f7a8aa9..187aeb65e221 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -413,17 +413,19 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 		cpu_np = dev_of_node(cpu_dev);
 
 		np = of_parse_phandle(cpu_np, "clocks", 0);
-		of_node_put(np);
-
-		if (np == scmi_np)
+		if (np == scmi_np) {
+			of_node_put(np);
 			return true;
+		}
+		of_node_put(np);
 
 		idx = of_property_match_string(cpu_np, "power-domain-names", "perf");
 		np = of_parse_phandle(cpu_np, "power-domains", idx);
-		of_node_put(np);
-
-		if (np == scmi_np)
+		if (np == scmi_np) {
+			of_node_put(np);
 			return true;
+		}
+		of_node_put(np);
 	}
 
 	/*
-- 
2.34.1


