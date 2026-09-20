Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D2C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnaTGECv9DoKyDP50R+Pckd69+dJSg4GClFoz5B4YTY=; b=tockBlxU37yFvZQ4uvDA3BP3vN
	tL4LIekEbcZY3GXuv6nU9ed4vYMXtCkU9HsQv5zMZYy+5wVl4zEIpQX1gUpnoM7gqSrm5iqpBLVEM
	sBKdr5hmkLo7OPk0NU6/ZKaBvPvQ1sr+mlKtpszVo7cLVJ78f7k6FG/yxStuRWfbkOsj7vf16XHr9
	ZOFWL63H1XydqKSfjAg8GUTBHiAQWse8Dmq1JS5aQ58fc0rl0XHwdltO3VpNAHjzarVwJm2LkAZBR
	hZWUJQdL2Zvhoqk2TDikaP6/g2QBy4hofKZlDo7VPEDNrgzeCsOTr+FMGYKz7+l31tSR5m1sMgROD
	nH0UWGeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884m-0000000Gn8o-1dd9;
	Sun, 20 Sep 2026 03:18:48 +0000
Received: from out-37.mta0.migadu.com ([2001:41d0:1004:224b::25] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884f-0000000Gn3o-3OGq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 03:18:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sLuj1hW1gJrgOf+bnaZxdaJK6PTj0i8XPll8TEvnjak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874319; v=1; x=1790479119;
 b=dqyr9T+gOoSShrtuh4ylvdAKLRaghASR/DdxUBa78jCKNZEv6if1f3ZbIO9cnM9A/VyqLyL4
 nGrhtyS5g3r/haug09/iRmHJ2C+mRl7hR6eRqIANhBEu7dbShEcc4RjO43yDplrc3t9lFy7mXqH
 uNnRpP/yaq8wYI9x0HeBA1+g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id e98d43414bfcadef;
	Sun, 20 Sep 2026 03:18:39 +0000
X-Mizu-Trace-ID: e98d43414bfcadef
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Sun, 20 Sep 2026 11:18:03 +0800
Subject: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=sLuj1hW1gJrgOf+bnaZxdaJK6PTj0i8XPll8TEvnjak=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrAxqen56er69bWaF1aNrfd+c7xHkDNrv4i8ydL73y8
 r+pGs/9OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACbyU5mRYe2mb8yC/m483tvu
 fo22+ijgqelmff7Oxx8+cQrvzO7NDmP473J16dm3EYtL1u6IWfOC47mE61d91Su7V677zTz1Jud
 zCyYA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201842_032696_3F65A780 
X-CRM114-Status: GOOD (  16.54  )
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

The devicetree CPU map can distinguish packages and clusters but cannot
describe multiple dies in one package. Such systems have to flatten all
clusters into the package, making cluster identifiers package-wide and
hiding the die boundary.

Recognize an optional sequence of dieN nodes between a socket and its
clusters, and propagate the die identifier to every CPU below it. Enumerate
clusters independently below each die.

When a CPU map has no dieN nodes, continue parsing its existing package
and cluster hierarchy but pass -1 as the die identifier. Legacy maps
therefore remain compatible without being reported as an explicitly
described die 0.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/base/arch_topology.c | 48 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index ee82827be3351..67a984f3ba8d9 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -498,7 +498,7 @@ static int __init get_cpu_for_node(struct device_node *node)
 }
 
 static int __init parse_core(struct device_node *core, int package_id,
-			     int cluster_id, int core_id)
+			     int die_id, int cluster_id, int core_id)
 {
 	char name[20];
 	bool leaf = true;
@@ -517,6 +517,7 @@ static int __init parse_core(struct device_node *core, int package_id,
 		cpu = get_cpu_for_node(t);
 		if (cpu >= 0) {
 			cpu_topology[cpu].package_id = package_id;
+			cpu_topology[cpu].die_id = die_id;
 			cpu_topology[cpu].cluster_id = cluster_id;
 			cpu_topology[cpu].core_id = core_id;
 			cpu_topology[cpu].thread_id = i;
@@ -538,6 +539,7 @@ static int __init parse_core(struct device_node *core, int package_id,
 		}
 
 		cpu_topology[cpu].package_id = package_id;
+		cpu_topology[cpu].die_id = die_id;
 		cpu_topology[cpu].cluster_id = cluster_id;
 		cpu_topology[cpu].core_id = core_id;
 	} else if (leaf && cpu != -ENODEV) {
@@ -549,7 +551,7 @@ static int __init parse_core(struct device_node *core, int package_id,
 }
 
 static int __init parse_cluster(struct device_node *cluster, int package_id,
-				int cluster_id, int depth)
+				int die_id, int cluster_id, int depth)
 {
 	char name[20];
 	bool leaf = true;
@@ -572,7 +574,7 @@ static int __init parse_cluster(struct device_node *cluster, int package_id,
 			break;
 
 		leaf = false;
-		ret = parse_cluster(c, package_id, i, depth + 1);
+		ret = parse_cluster(c, package_id, die_id, i, depth + 1);
 		if (depth > 0)
 			pr_warn("Topology for clusters of clusters not yet supported\n");
 		if (ret != 0)
@@ -598,7 +600,8 @@ static int __init parse_cluster(struct device_node *cluster, int package_id,
 		}
 
 		if (leaf) {
-			ret = parse_core(c, package_id, cluster_id, core_id++);
+			ret = parse_core(c, package_id, die_id, cluster_id,
+					 core_id++);
 			if (ret != 0)
 				return ret;
 		} else {
@@ -616,6 +619,34 @@ static int __init parse_cluster(struct device_node *cluster, int package_id,
 	return 0;
 }
 
+static int __init parse_die(struct device_node *parent, int package_id)
+{
+	char name[20];
+	bool has_die = false;
+	int die_id = 0, ret;
+
+	do {
+		snprintf(name, sizeof(name), "die%d", die_id);
+		struct device_node *d __free(device_node) =
+			of_get_child_by_name(parent, name);
+
+		if (!d)
+			break;
+
+		has_die = true;
+		ret = parse_cluster(d, package_id, die_id, -1, 0);
+		if (ret)
+			return ret;
+
+		die_id++;
+	} while (1);
+
+	if (!has_die)
+		ret = parse_cluster(parent, package_id, -1, -1, 0);
+
+	return ret;
+}
+
 static int __init parse_socket(struct device_node *socket)
 {
 	char name[20];
@@ -631,7 +662,7 @@ static int __init parse_socket(struct device_node *socket)
 			break;
 
 		has_socket = true;
-		ret = parse_cluster(c, package_id, -1, 0);
+		ret = parse_die(c, package_id);
 		if (ret != 0)
 			return ret;
 
@@ -639,7 +670,7 @@ static int __init parse_socket(struct device_node *socket)
 	} while (1);
 
 	if (!has_socket)
-		ret = parse_cluster(socket, 0, -1, 0);
+		ret = parse_die(socket, 0);
 
 	/*
 	 * Reset the max_smt_thread_num to 1 on failure. Since on failure
@@ -667,10 +698,7 @@ static int __init parse_dt_topology(void)
 		return 0;
 	}
 
-	/*
-	 * When topology is provided cpu-map is essentially a root
-	 * cluster with restricted subnodes.
-	 */
+	/* cpu-map is the root of the processor topology hierarchy. */
 	struct device_node *map __free(device_node) =
 		of_get_child_by_name(cn, "cpu-map");
 

-- 
2.55.0


