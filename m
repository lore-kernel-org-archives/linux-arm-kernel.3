Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7488CC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBl/0d7npiHtCMqYLtgX+6Z+YPUVDkW8dgxG4AFDoao=; b=RXsxn9L0J21Qxjpsxv+Zk6rm9h
	QSFmfxxKOBpXM8X++TvnjZBTAGyg7RJaLlPpic5+M5+GnvsV67LdmB5iD1inZZ36fttcudtaPwdGA
	5+8/8Bl8YnL4N4SQDQ2yoPC90+h2VS4nhQ0eTFLGSwO9yld53nGe4JRdpy036oP5Opo3V2hR2Y1uI
	AiLq/5KfcT3xkcDSgZsMA7i4/485af6LOXlx/032MqMi9YIE7mwtPBNKaKeDr2dhoUyFB5bsojZ4T
	vLck2otKTviNi0zzuHAdyXgGD4pClXKnyV6kOcyNYMUOp0P5pWqNBNNONJ5T3z/HjXjGvI+LOgg3/
	3DKtfUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884g-0000000Gn4e-0BH4;
	Sun, 20 Sep 2026 03:18:42 +0000
Received: from out-30.mta0.migadu.com ([2001:41d0:1004:224b::1e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884c-0000000Gn2o-2eTQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 03:18:40 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874315; v=1; x=1790479115;
 b=qgs0b/yBrERYTjY5M8aM853MXHKXuMqTl3dC3nGJMra6awJnuuNkeTJrBFzelN51nvSJTBHQ
 SfWWd0IcxpVepjPqqp7TQ0SWF3DZPpWcvVKL2egnR6cK454XBInldUz8OEcljDRkRrcaxvussnG
 1jXddu+UWhjRUMr1Ceabtk64=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 4239474afc06c193;
	Sun, 20 Sep 2026 03:18:35 +0000
X-Mizu-Trace-ID: 4239474afc06c193
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Sun, 20 Sep 2026 11:18:02 +0800
Subject: [PATCH RFC 1/3] arch_topology: Add a die level to CPU topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-riscv-die-topology-rfc-v1-1-071c0bf61d5f@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3769;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrA+oZbvrfOL/008GwqU1e10rnnEsruPKnx6tZjXmD7
 9yzsq83d5SyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWwIF6cATGSDLyPDV4f1J8QTD50JTFnE
 Pbeoz4OnaDZT4+/5xVPzOcQUDz/nY2SYWXIuevPUK6q3tHP+mr9bIRFpt9jxzaX2FT9tmBn4Luj
 xAgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201838_819581_4AC95464 
X-CRM114-Status: GOOD (  13.40  )
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

The generic topology model records packages and clusters but has no
representation for a die between them. Systems with multiple dies in one
package must therefore either report each die as a package or flatten
clusters across all dies. Both choices lose part of the physical hierarchy.

Add a die identifier and sibling mask between the package and cluster
levels. Initialize the identifier to -1 and only build die sibling masks
when firmware supplied a valid identifier. CPU topology paths without die
information, including the current ACPI parser and the fallback topology,
therefore keep the die unknown instead of inventing die 0.

Scope cluster sibling matching to a die so each die can number its
clusters independently, and maintain the new mask across CPU hotplug.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/base/arch_topology.c  | 20 +++++++++++++++++---
 include/linux/arch_topology.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a3..ee82827be3351 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -766,6 +766,14 @@ void update_siblings_masks(unsigned int cpuid)
 		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
 		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
 
+		if (cpuid_topo->die_id != cpu_topo->die_id)
+			continue;
+
+		if (cpuid_topo->die_id >= 0) {
+			cpumask_set_cpu(cpu, &cpuid_topo->die_sibling);
+			cpumask_set_cpu(cpuid, &cpu_topo->die_sibling);
+		}
+
 		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
 			continue;
 
@@ -792,6 +800,9 @@ static void clear_cpu_topology(int cpu)
 	cpumask_clear(&cpu_topo->cluster_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->cluster_sibling);
 
+	cpumask_clear(&cpu_topo->die_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->die_sibling);
+
 	cpumask_clear(&cpu_topo->core_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
 	cpumask_clear(&cpu_topo->thread_sibling);
@@ -808,6 +819,7 @@ void __init reset_cpu_topology(void)
 		cpu_topo->thread_id = -1;
 		cpu_topo->core_id = -1;
 		cpu_topo->cluster_id = -1;
+		cpu_topo->die_id = -1;
 		cpu_topo->package_id = -1;
 
 		clear_cpu_topology(cpu);
@@ -824,6 +836,8 @@ void remove_cpu_topology(unsigned int cpu)
 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
 	for_each_cpu(sibling, topology_cluster_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_cluster_cpumask(sibling));
+	for_each_cpu(sibling, &cpu_topology[cpu].die_sibling)
+		cpumask_clear_cpu(cpu, &cpu_topology[sibling].die_sibling);
 	for_each_cpu(sibling, topology_llc_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
 
@@ -969,9 +983,9 @@ void store_cpu_topology(unsigned int cpuid)
 	cpuid_topo->core_id = cpuid;
 	cpuid_topo->package_id = cpu_to_node(cpuid);
 
-	pr_debug("CPU%u: package %d core %d thread %d\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id);
+	pr_debug("CPU%u: package %d die %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->die_id,
+		 cpuid_topo->core_id, cpuid_topo->thread_id);
 
 topology_populated:
 	update_siblings_masks(cpuid);
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f969..2a5591bb95075 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -63,10 +63,12 @@ struct cpu_topology {
 	int thread_id;
 	int core_id;
 	int cluster_id;
+	int die_id;
 	int package_id;
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
 	cpumask_t cluster_sibling;
+	cpumask_t die_sibling;
 	cpumask_t llc_sibling;
 };
 

-- 
2.55.0


