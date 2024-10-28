Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE044D33992
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIsY/nREQ/fAaAdcNyrnzEfHa8eQNfg/wq8e5XlHCaA=; b=ATdO8KGYgsk7kQOcR20fkb443Z
	rHhlPkUX3URRT+HnabIBddPq+8xN5IzR+TMBnkyziIo6yyeRopaRYWfG13NbnP8iWIcIQGs8fGx8F
	FGQoe1Tmwk5aimMuj45DyyeRyP6Sp8oi4eRDHyedaRfKwi6rCqC6CBVhBrJ3OdFGRRnko+++ayLds
	AjHAk0zDGvzzmncyGYeCC7mZSHARxOOVmfMwA4A/OVZpglCqpMzZoeN4YxOi3/I2btDRI5jG9bYm/
	pVDrcVe8soE7dKP7zFY22piXwRycM+DfHXa+OCJzFrROFYRtw9F0sR5KQqoLXAXMU2VU2qjHrLRTM
	/QxxaLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RCn-0000000BDWQ-3VIV;
	Mon, 28 Oct 2024 14:58:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QeH-0000000B6WZ-12b4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:23:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DD1F5C56F3;
	Mon, 28 Oct 2024 14:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58B3C4CEE8;
	Mon, 28 Oct 2024 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730125392;
	bh=INIyxIjyW8dZrymPTrJki0+QEIhN5rfp5OXIveeeXZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jJ2f9wPsfrE+3WverENvTtoDPFfJmQyO1YYV46otysBHoQkrDQ2LSKZfoA5L5qju4
	 Zc0rx+1EQtCOXtkw1hlSTfDUDTPj8y2xH56BUB18XzAI2BFL/qwAeM/g+yv8YoluYl
	 kL5zNLidcdx7h+lqz/o2Pv6MzLCyHtHwBup4AMq8o0aRA5kfbR6vwI2gpoCb+QuGEJ
	 B7cs2vBEe17JVwULTELVB8YgA2/x/b+efJ6oiUZwp/emdJ09HI/DO49eJ+C1IUDeMD
	 CCeuPSTY1jXexgHkvLvTYKhReHQA0VGzVz1D55YRMUrPaDCMTPQeIF04nBTqfJZktg
	 GPWif56YlStwg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 28 Oct 2024 15:22:58 +0100
Subject: [PATCH 2/3] firmware/psci: Set
 pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-cpu_suspend_s2ram-v1-2-9fdd9a04b75c@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730125380; l=1306;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=INIyxIjyW8dZrymPTrJki0+QEIhN5rfp5OXIveeeXZ0=;
 b=hEJdSTloRMtioiwdZulRfEu6ZrNIJW/pFqzZKFYyiI1neblGkpxAW34SRPduGpLKNGaZLn5Dx
 8UHBjCVaPk5Cet6SNHK/H7Pzfc47zOOWQ+8V6z1TwP6LpSXQ8RsXjCU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_072313_401520_81B82ECA 
X-CRM114-Status: GOOD (  10.22  )
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

Some device drivers are curious to know whether "the firmware" (which is
often assumed to be ACPI) takes care of suspending or resuming the
platform. Set the flag that reports this behavior if SYSTEM_SUSPEND is
implemented.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/psci/psci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 2328ca58bba61fdb677ac20a1a7447882cd0cf22..0e622aa5ad58bbe69dfc3a71bced597618e73f15 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -507,12 +507,22 @@ static int psci_system_suspend(unsigned long unused)
 
 static int psci_system_suspend_enter(suspend_state_t state)
 {
+	pm_set_resume_via_firmware();
+
 	return cpu_suspend(0, psci_system_suspend);
 }
 
+static int psci_system_suspend_begin(suspend_state_t state)
+{
+	pm_set_suspend_via_firmware();
+
+	return 0;
+}
+
 static const struct platform_suspend_ops psci_suspend_ops = {
 	.valid          = suspend_valid_only_mem,
 	.enter          = psci_system_suspend_enter,
+	.begin          = psci_system_suspend_begin,
 };
 
 static void __init psci_init_system_reset2(void)

-- 
2.47.0


