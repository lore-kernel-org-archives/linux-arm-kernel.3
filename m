Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVf5Wdha;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCksLcyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QzREGEJSVqjauamhHrlGrhsC6OsN4XRohPnzT15eiL8=; b=ZVf5WdhaC2Qemh
	SaoUl+zKoG93kvY6lXFDIBfU/UHC6abOqdqFL5mJ05bgyELgA9w2d9QsLvIsQcmW1h7Fx8k8bWTRX
	y6sk1sqXyuAKRZ8UNo9wRKpPEItt/fuU7pwfaAG4Bin0Y+nrF66N8k9Y3bIWuuW9t88I22Iof8vL0
	tx9ZRbit2rrdC8r+NoA4mEs3rnPDCWFkX1Hms2HrQjfZZynSH+tv8VQINncW23UtTcVHOKuywC6CA
	LHl35DJcESU/QLn98qtHxUnvu+wr8mkVDq3q9btd6hg/3O1v6lD+K5uZsC+ZMKArrxemF7DfDxrws
	UcE2/2OdDzThAHb6q1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuT-00000005HG4-3Qfh;
	Wed, 04 Nov 2026 12:16:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuS-00000005HFV-1EVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC91E60DA2;
	Wed,  4 Nov 2026 12:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A40C1F00A15;
	Wed,  4 Nov 2026 12:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794566;
	bh=QzREGEJSVqjauamhHrlGrhsC6OsN4XRohPnzT15eiL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SCksLcyU90tDWcOxApx/Xx5QXCJqa0z8zNZuNd23K3VIGll91Cq1Cocki8t2Y04Zo
	 L4njwwnrzWxf2r3iS9aBgEfh1YG7HRWbVOoEoA204DmLkMNcNvuIeIoveSyO33MaHW
	 6R36tlLeAB+HrKPHmeYbbBQhAgK/2mC++qBzL4GntHH9F++lozWro1Q3yHvVy5FFM7
	 0ErGb2HQmZPiXcBLh0N2dSieuaLh2ot3wgNDjSbiumQduPwaTeHK/7dZFubPYHJsnV
	 CH2TPZEkgGFAf3fYLUH2mE0lTYep5aR3Q5B9YAIvYw5VKHrPNf0OYwADgex3nbx2cA
	 FnuW6IEwS8D6A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 13:15:55 +0100
Subject: [PATCH 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle
 governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-2-c7fd14706715@kernel.org>
References: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
In-Reply-To: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
To: Russell King <linux@armlinux.org.uk>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The multi_v7 defconfig already enables cpuidle and idle dynticks.
Select TEO to use it as the default cpuidle governor instead of menu.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..b583c5db8210 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -121,6 +121,7 @@ CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
 CONFIG_ARM_SCMI_CPUFREQ=y
 CONFIG_QORIQ_CPUFREQ=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_ARM_ZYNQ_CPUIDLE=y

-- 
2.56.0


