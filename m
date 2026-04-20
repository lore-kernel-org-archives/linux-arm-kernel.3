Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8483CF557F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l3E7Js9iCtlEfFoCuvz8eXLkCYO1Y8/jvTZT5sU/BaI=; b=Ca+4INCMWyBdDXNUG0Wz4dpjch
	oyeC+sCrRrqpvpSBUX6pLwP/Zaft/MDklxoo1wkZ63t/lWWgzxDAjShFZjAjT6Hue2Mjb7fF1jpAL
	tPJJAOGeoJ03yFTvcETXiEBjxjTyvS5Rh4LcqfJHWoOm9i9zyfwg0EfzYZC3u3slBgmsNUJ6eb7cL
	LB59PMsYvTQ/goOix4m+0XM/c7468Ox/AAfmERmaflw9jfHUz1UzQoehHD72h5MIqcciiRMja4NU7
	fm2NPZTrL8S9i90S8zMgM93AedoI3ePxhBX2KeATC8r+1Ltvo8JHwd5qdHJS6Dt6ns33GqpsGM5L6
	TUMpACCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkwq-00000006gDH-3SMq;
	Mon, 20 Apr 2026 09:29:44 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkwo-00000006gCL-3QaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=l3E7Js9iCtlEfFoCuvz8eXLkCYO1Y8/jvTZT5sU/BaI=; b=CRQl3FSWYhYcm8pcTXKhNrpvUZ
	EP7rGrDLzUEYtU8AqPC5MpNqCzsSMZKCw+BedlBQ1WWpPDEUz3eo4uWisHtnQAwtnkiEfDpfdzHhe
	C1qJ2LCI4IK4pCzyS4mIQJuQ8QtDpi5lYKRZd0EHpUKA8Qmq13AEg7Stuv2ltVrkFpRlerFVaTLOD
	mNN37pGoJ2O4+50iizUla1Q/wyRqz+DUVHC57tSQveQcomKbfVqtCPeaUxixqlIGWXLt1TLcwo3nb
	QW6fo3gfyYohX7E9rnEo1E28mxAN+CQe+iuxkCXPvCe1kght5RxOTxaIQLwfZRolfHA3eXosTfvtM
	+kX6N+rA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wEkwa-00HaDw-1t;
	Mon, 20 Apr 2026 09:29:28 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 20 Apr 2026 02:27:13 -0700
Subject: [PATCH] ACPI: arm64: cpuidle: Tolerate platforms with no deep PSCI
 idle states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
X-B4-Tracking: v=1; b=H4sIAHDx5WkC/yXMMQqEMBBG4asMf21AEwmaqywW6s7oWOiSqAji3
 cW1fMX3TiSOygmBTkTeNekyI1CREfqxnQc2+kUg2Nz6vCycERlN7cRXnZXStw4Z4RdZ9PhfPs3
 baesm7teH4rpuKopwrmcAAAA=
X-Change-ID: 20260413-ffh-93f68b2f46a3
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Huisong Li <lihuisong@huawei.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, pjaroszynski@nvidia.com, rmikey@meta.com, 
 kernel-team@meta.com, stable@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=leitao@debian.org;
 h=from:subject:message-id; bh=dCyASQv/4XztmsIYk1Flo/oDFHV7wnr3lzX8kb24qtU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp5fHzqn+00bv5uiKjyfb0L3oxZFEemEvZoPtx7
 SfZPToQOv2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaeXx8wAKCRA1o5Of/Hh3
 bSCeD/97foqkwPA2sEHhr9/FhCvzbuTMfq2L5IYng7YjGvEuYfpcRqx4O1FLN9tEr9/tUo7ONtJ
 C09130QdJvpFLNJfi2KYl4rLyEiGyT7DIzsfUmLFCN0zpTg0ilVHiNm28VutMdU04zMpRNn7v1m
 9VR2bGjBqr3hwSrA3Nqwx6Wv7envXp6cAWoqAWzOJb27+/zGR2fIHTHAEr95NDVEy+UI3eI/3v5
 s5q7jk06CVpyp3AAby8D60kpwQadz0TISp0kTw0O05uFrdCw0kd2/lHKh6FC9QeS0oppiy+/yrm
 o0DyFgJKyjytOJ78V2Nn7hnBacrT6WC0yVNowb10UlveuefuTmZfRNCBammkrTIGJrLrAlkRcGE
 BYKKD1keoP/tqfapcaLSyuhS3AYWuIUUG58ezNInLcs18HMa5Fyd1OFRwOIfjWajzxfA7b2mP7Z
 kwrL4MHM18KA0KYjgq/yLw+fqRjGi0/YQETM+KbnwIVTFLIHMNjSbALee/J+mM0DM6qOrm7TrZ4
 wmrcxSFME+g3Pa5yicC2aTtQJPEGByK90k+aYgM1vBDytiyfaNsHT44jvT0kWVh0em32tPanwWL
 5pHHY3aUlf3fV0WoQ+IlYrjxYKmRM+diZ/95gtNDyrfwE2Zh/rgnBnVl34tGq1uxi17NzwwiqIj
 b0Mhx3IjlF2IVkQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_022942_909400_2D4099DC 
X-CRM114-Status: GOOD (  13.22  )
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

Commit cac173bea57d ("ACPI: processor: idle: Rework the handling of
acpi_processor_ffh_lpi_probe()") moved the acpi_processor_ffh_lpi_probe()
call from acpi_processor_setup_cpuidle_dev(), where its return value was
ignored, to acpi_processor_get_power_info(), where it is now treated as
a hard failure. As a result, platforms where psci_acpi_cpu_init_idle()
returned -ENODEV stopped registering any cpuidle states, forcing CPUs to
busy-poll when idle.

On NVIDIA Grace (aarch64) systems with PSCIv1.1, pr->power.count is 1
(only WFI, no deep PSCI states beyond it), so the previous
"count = pr->power.count - 1; if (count <= 0) return -ENODEV;" check
returned -ENODEV for all 72 CPUs and disabled cpuidle entirely.

The lpi_states count is already validated in acpi_processor_get_lpi_info(),
so the check here is redundant. Simplify the loop to iterate over
lpi_states[1..power.count). When only WFI is present, the loop body
simply does not execute and the function returns 0, which is the correct
outcome: there is nothing to validate for FFH and no error to report.

Suggested-by: Huisong Li <lihuisong@huawei.com>
Cc: stable@vger.kernel.org
Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/acpi/arm64/cpuidle.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
index 801f9c4501425..c68a5db8ebba8 100644
--- a/drivers/acpi/arm64/cpuidle.c
+++ b/drivers/acpi/arm64/cpuidle.c
@@ -16,7 +16,7 @@
 
 static int psci_acpi_cpu_init_idle(unsigned int cpu)
 {
-	int i, count;
+	int i;
 	struct acpi_lpi_state *lpi;
 	struct acpi_processor *pr = per_cpu(processors, cpu);
 
@@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
 	if (!psci_ops.cpu_suspend)
 		return -EOPNOTSUPP;
 
-	count = pr->power.count - 1;
-	if (count <= 0)
-		return -ENODEV;
-
-	for (i = 0; i < count; i++) {
+	for (i = 1; i < pr->power.count; i++) {
 		u32 state;
 
-		lpi = &pr->power.lpi_states[i + 1];
+		lpi = &pr->power.lpi_states[i];
 		/*
 		 * Only bits[31:0] represent a PSCI power_state while
 		 * bits[63:32] must be 0x0 as per ARM ACPI FFH Specification

---
base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
change-id: 20260413-ffh-93f68b2f46a3

Best regards,
--  
Breno Leitao <leitao@debian.org>


