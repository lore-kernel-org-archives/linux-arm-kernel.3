Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B24CCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3AVB0ETkxpZ0HvtZ+8EoQbSH8m8RIduh4Tc2fWtLHw=; b=ZB+OASi9cvXdOc
	l7UJbkmSuQS0SsmjJyU0yzwJEAFTMynxf7ShEolP3n0wXINpMVz1cfYm0orRtOu3tI23ToLlNXykf
	7z0xGEMnS721q25w3fR8Fkf8EPhKzfrfiFQVxMerRSjSVgJn4EM4vJE0DCq8AaSVB5HfsYYgDu0da
	shPAa76s5LIzCZAvU/fF1gXxWCZcriCY2j1VIUvVPqg+SPag/ybOQlud9sp+FUpYeIlwGB+wdB77U
	hcjsFNn3AxXpDo7ihyKzHe9i/Q+8PlidsLS7vBtY7qE3FNrK7gor55QpYCny/envJH/tT7umsCwy6
	bYieV0BW6TqdN1xJoniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmej-00000003fE7-2BDv;
	Fri, 16 Oct 2026 18:27:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmeh-00000003fCQ-0obT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 18:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o3AVB0ETkxpZ0HvtZ+8EoQbSH8m8RIduh4Tc2fWtLHw=; b=UlAfXVCAS597pPJCgcbNbga5v1
	s7cFEUSjPR9tyBqBN54KHIy/KSjJQc+I3WDW7exQ0x2WdDhBnF3MmTN4oFuP+PNyZymosGCmdtZcu
	F5fp+QN4fGlYfx6Ff0rD0YsgPp/fx9O5IyorbrIumuqmX262N/mn21gRu+Yoj5MoFgYB/rk7gd1ZZ
	aYhQ7XkWPrMqrl5pAOR4Jz3hzj2dIU3zr5CiR2r7sz3+nVBkTI0V7qirM5m3c5a/Ptyv3KWtSOs97
	ApQ2WmOsHmNeha9sVlNajI7Th1G3xOMYivUfamPfK4H0vDAOnxUUWstmbDNUW7USbjUNTfDP0EQY2
	4VqbNIJQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHmee-00000001qET-0qFr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 18:27:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D961516;
	Fri, 16 Oct 2026 11:27:37 -0700 (PDT)
Received: from e142021.manchester.arm.com (e142021.arm.com [10.33.8.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A22F3F7B4;
	Fri, 16 Oct 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792175260; bh=vU8cAQb+W+3Jz4MqGi0aLi6f8A4ixtLOHyc/TKPt4lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XjCqaDUrx03DsD4Eo952vbHEv0pFtmmYdmBXhh+87pRBGGmhDrXsiim7w2J4k4zw9
	 fEcH2W5r4y1IBn1KpGLs02fdNcZRQ66HEUla2veIZxWKIe/HuWv5R3OAlsfN/YDqRJ
	 XcGnourEvMpc2Gw3fbBoSiAKObRLc8BWGuNvVTdI=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 6/8] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Fri, 16 Oct 2026 19:27:10 +0100
Message-ID: <20261016182714.1835813-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016182714.1835813-1-andre.przywara@arm.com>
References: <20261016182714.1835813-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_192744_681603_F462F316 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Arm LFA spec places control over the actual activation process in
the hands of the non-secure host OS. An platform initiated interrupt or
notification signals the availability of an updateable firmware image,
but does not necessarily need to trigger it automatically.

Add a sysfs control file that guards such automatic activation. If an
administrator wants to allow automatic platform initiated updates, they
can activate that by echoing a "1" into the auto_activate file in the
respective sysfs directory. Any incoming notification would then result
in the activation triggered.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 41 +++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 4b4daf79611bb..65f28ffc9d108 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -148,6 +148,7 @@ enum component_attr_names {
 	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
 	LFA_ATTR_ACTIVATE,
 	LFA_ATTR_CANCEL,
+	LFA_ATTR_AUTO_ACTIVATE,
 	LFA_ATTR_NR_IMAGES
 };
 
@@ -162,6 +163,7 @@ struct fw_component {
 	bool cpu_rendezvous;
 	bool cpu_rendezvous_forced;
 	bool use_cpu_rendezvous;
+	bool auto_activate;
 	struct kobj_attribute comp_attrs[LFA_ATTR_NR_IMAGES];
 };
 
@@ -306,6 +308,7 @@ static int update_fw_components_node(char *fw_uuid, int seq_id,
 
 	comp->kobj.kset = lfa_kset;
 	comp->cpu_rendezvous_forced = true;
+	comp->auto_activate = false;
 	set_component_flags(comp, seq_id, comp_flags, reg_current_ver,
 			    reg_pending_ver);
 	if (kobject_init_and_add(&comp->kobj, &component_ktype, NULL,
@@ -718,6 +721,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
+static ssize_t auto_activate_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+	int ret;
+
+	ret = kstrtobool(buf, &comp->auto_activate);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t auto_activate_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct fw_component *comp = kobj_to_fw_component(kobj);
+
+	return sysfs_emit(buf, "%d\n", comp->auto_activate);
+}
+
 static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
 	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
@@ -727,7 +752,8 @@ static struct kobj_attribute comp_attrs_group[LFA_ATTR_NR_IMAGES] = {
 	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
 	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
 	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
-	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
+	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
 };
 
 static void init_component_default_attrs(void)
@@ -759,11 +785,11 @@ static void clean_fw_components_tree(void)
 
 /*
  * Iterate over all FW components and trigger activation of all activatible and
- * pending components.
- * Since we would need to re-enumerate the list of all components after a
- * successful activation, and this could trigger infinite loops if a firmware
- * component still appears as pending, we create an array of update candidates
- * first, then activate each one of them.
+ * pending components, but only if automatic activation for that component is
+ * allowed. Since we would need to re-enumerate the list of all components
+ * after a successful activation, and this could trigger infinite loops if a
+ * firmware component still appears as pending, we create an array of update
+ * candidates first, then activate each one of them.
  */
 static void activate_pending_components(void)
 {
@@ -791,7 +817,8 @@ static void activate_pending_components(void)
 			continue; /* Invalid FW component */
 
 		_update_fw_component_pending(comp);
-		if (comp->activation_capable && comp->activation_pending) {
+		if (comp->activation_capable && comp->activation_pending &&
+		    comp->auto_activate) {
 			kobject_get(&comp->kobj);
 			all_comps[nr_comps++] = comp;
 		}
-- 
2.43.0


