Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA460A8C1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRtGZEIc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GeZjq+us
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o3AVB0ETkxpZ0HvtZ+8EoQbSH8m8RIduh4Tc2fWtLHw=; b=BRtGZEIcyM5WdbR7tbnONW5L67
	LzTCLsq0RFOq8gtI+CKgCw1Eht0VlqWn0NkBrybQhTu+0FtrMtRRyHMjkh277Ds9NSMI6Dc6GexYG
	bNv8jp6+WmcMU3s/Rz72BAoALEttxjb/JQTxRVJG2+FzJrWAbQLvgIBqxNZAOTJONFjC9NNr1kOdN
	K7rOk8BNMPTr2/IYcGY3GSr3/sSZJDiWmOIbO3kfKMz5008DiN8sh9AxXrOA/p0a2Rt+2yQrTj0LZ
	1je2Zlgyzvz4y3v3vKVnNgyH/m0F+4j0qGxV5dhLawdNSMp4abIO9IHogFxBvuddjk4lktSkMz99I
	JEdJaKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIz-0000000HLmU-0buA;
	Mon, 02 Nov 2026 16:54:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvIx-0000000HLlE-1gMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:54:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C798516F3;
	Mon,  2 Nov 2026 08:54:39 -0800 (PST)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2C353F59E;
	Mon,  2 Nov 2026 08:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793638482; bh=vU8cAQb+W+3Jz4MqGi0aLi6f8A4ixtLOHyc/TKPt4lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GeZjq+us5BurZjRNIT43c+NM3rS/JX04fMY8YozO0IdnAEjZENp8O85dkUWlG43UG
	 8129T8eHv2pbUJRWKUpVl6MX3HyKdiiaowbmhagkwP19HFh2G1Qt9Cxb6NSXh/3j3S
	 39FjGXkosqQ4MHo0As+JkH7VriuoPQBROtmFXonQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v5 RESEND 4/6] firmware: smccc: lfa: Add auto_activate sysfs file
Date: Mon,  2 Nov 2026 17:54:18 +0100
Message-ID: <20261102165421.3651202-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102165421.3651202-1-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_085443_521665_8A969B27 
X-CRM114-Status: GOOD (  17.01  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


