Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A435C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwMfzsred/Fu2DVt9SdbNGJQWxv9gGFYvT5fUnsNRVo=; b=yntKkKhDylGHDCFalHYMmKvfiQ
	im2lQQFVBQsADVX7r5L8R/tZd6tZxXDfv9NSOATbQIyw6Ht8O6JSjYGZIrmfEYVS2PPVy7zoDcp0S
	sB90JSW3JW6ik+QQO5WBl/N37foqDHB//of8TfvjoLBzBYqC0dAui5z4Q96nvLsXLbwhPdKov4fwY
	s1AVDIZTqXik7NOYtLTWJHd+3vjVBmCR1lQgvvdk5y88//0T5Tn1KJkcuqUJiEBKXxiU0zcHZRagq
	ZI6XyrXqxlrQzXMcXg03Lu50NWSTzbB9ZZl1GFnOK31DZ70/yP2595TfB8R0E1rfGfAzekmQHraGx
	JL5v0sPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLsQ8-00000006B27-1HZY;
	Sun, 01 Jun 2025 23:48:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLs6q-000000066Hg-3e88;
	Sun, 01 Jun 2025 23:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94F274A7B2;
	Sun,  1 Jun 2025 23:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E70BC4CEE7;
	Sun,  1 Jun 2025 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820536;
	bh=g9ywwi2Yf/PKAvy2MwqZNEw5Np9DzAUcOpshioCNmAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XR0T0UZhgrO3JQWXqzvISJ+QfoRrTLnkWzcfjfZcBJpzh+SWX69FecBMLaf3CbV6X
	 Y1Tj0UVJSzpVqL3Fb0hqQXlpjnDfYY/EOuO7rgqvuqL4qZQFIgiGjelw+wrLP1+9ch
	 3d00WNznEC7GqesDvxtHgDDRwoGThcBB2NrxBBlrsmLdGOLb/paHbhpqsTjNvVcF8L
	 AsYHRHMWD4X4cQe8xbUUSyL9N/HeyCSoUppGi+/9kNfjtOgEJvg6lqb58LI0LkH9JT
	 dUhzTno4IsiT/Q1CGF/5LYLoobgwxkYD5pAzWaJ0gxa9+j/9SwZbu8r4XNEmBD1lRl
	 kQESXfSCfuoRA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 092/110] genirq: Retain disable depth for managed interrupts across CPU hotplug
Date: Sun,  1 Jun 2025 19:24:14 -0400
Message-Id: <20250601232435.3507697-92-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_162856_957589_6EB93BE0 
X-CRM114-Status: GOOD (  19.64  )
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

From: Brian Norris <briannorris@chromium.org>

[ Upstream commit 788019eb559fd0b365f501467ceafce540e377cc ]

Affinity-managed interrupts can be shut down and restarted during CPU
hotunplug/plug. Thereby the interrupt may be left in an unexpected state.
Specifically:

 1. Interrupt is affine to CPU N
 2. disable_irq() -> depth is 1
 3. CPU N goes offline
 4. irq_shutdown() -> depth is set to 1 (again)
 5. CPU N goes online
 6. irq_startup() -> depth is set to 0 (BUG! driver expects that the interrupt
    		     	      	        still disabled)
 7. enable_irq() -> depth underflow / unbalanced enable_irq() warning

This is only a problem for managed interrupts and CPU hotplug, all other
cases like request()/free()/request() truly needs to reset a possibly stale
disable depth value.

Provide a startup function, which takes the disable depth into account, and
invoked it for the managed interrupts in the CPU hotplug path.

This requires to change irq_shutdown() to do a depth increment instead of
setting it to 1, which allows to retain the disable depth, but is harmless
for the other code paths using irq_startup(), which will still reset the
disable depth unconditionally to keep the original correct behaviour.

A kunit tests will be added separately to cover some of these aspects.

[ tglx: Massaged changelog ]

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/all/20250514201353.3481400-2-briannorris@chromium.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the current kernel code, here is
my assessment: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Bug Analysis The commit fixes a
critical bug in the interrupt subsystem's CPU hotplug handling that
affects affinity-managed interrupts. The bug manifests as follows: 1.
**Problem Scenario**: When a managed interrupt is disabled (depth=1),
then its CPU goes offline causing `irq_shutdown()`, and later the CPU
comes back online triggering `irq_startup()`, the disable depth
accounting becomes corrupted. 2. **Current Broken Behavior** (from
existing kernel code): - `irq_shutdown()` sets `desc->depth = 1`
unconditionally (line seen in grep output) - `irq_startup()` sets
`desc->depth = 0` unconditionally - This overwrites any previous disable
state, violating the disable/enable balance 3. **User-Visible Impact**:
The bug causes: - Unbalanced `enable_irq()` warnings - Interrupts being
unexpectedly enabled during CPU hotplug - Potential system instability
or incorrect device behavior ## Code Changes Analysis The fix makes
surgical changes to preserve disable depth: ### 1. **irq_shutdown()
Change** (kernel/irq/chip.c): ```c - desc->depth = 1; + /bin /bin.usr-
is-merged /boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64
/lost+found /media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged
/snap /srv /sys /tmp /usr /var +
amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md Increment disable depth, so that a
managed shutdown on + amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md CPU hotunplug preserves the actual
disabled state when the + amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md CPU comes back online. See
irq_startup_managed(). + linux-kernel/ + desc->depth++; ``` This
preserves the original disable state instead of overwriting it. ### 2.
**New irq_startup_managed() Function**: ```c +void
irq_startup_managed(struct irq_desc *desc) +{ + /bin /bin.usr-is-merged
/boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found
/media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv
/sys /tmp /usr /var + amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md Only start it up when the disable
depth is 1, so that a disable, +
amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md hotunplug, hotplug sequence does
not end up enabling it during + amd_display_timing_generator_analysis.md
amd_doorbell_analysis_framework.md
amd_gpu_documentation_backport_analysis.md amd_si_chip_analysis.md
amdgpu_csb_analysis.md amdgpu_mqd_prop_backport_analysis.md
analogix_dp_backport_analysis.md cgroup_rstat_analysis.sh
cgroup_rstat_analysis_guide.md cpuset_comment_fix_backport_analysis.md
csiphy_x1e80100_backport_analysis.md
dcn315_smu_indirect_register_access_analysis.md
drm_dp_helper_dpcd_refactoring_backport_analysis.md
drm_format_helper_generic_8bit_conversion_backport_analysis.md
es8375_codec_driver_backport_analysis.md expected_findings_summary.md
hdmi_read_request_analysis.md kernel_analysis_commands.sh
kselftest_harness_teardown_metadata_backport_analysis.md linux-kernel
mediatek_vcodec_h264_backport_analysis.md
pidfd_open_kselftest_harness_compatibility_analysis.md
qualcomm_camss_bus_type_backport_analysis.md
selftests_harness_libatomic_backport_analysis.md
sphinx_version_compatibility_backport_analysis.md
spi_sh_msiof_grpmask_backport_analysis.md
spi_sh_msiof_sitmdr2_sirmdr2_bitfield_conversion_backport_analysis.md
sta2x11_removal_analysis.md test_unused_param.c test_unused_param.o
ti_bridge_encoder_crtc_refactoring_backport_analysis.md
xe_driver_flr_vf_restriction_analysis.md
xe_firmware_per_gt_backport_analysis.md
xe_sriov_logging_backport_analysis.md hotplug unconditionally. + linux-
kernel/ + desc->depth--; + if (!desc->depth) + irq_startup(desc,
IRQ_RESEND, IRQ_START_COND); +} ``` This provides proper depth-aware
startup specifically for managed interrupts. ### 3. **IRQ_STARTUP_ABORT
Case Update**: ```c case IRQ_STARTUP_ABORT: + desc->depth = 1;
irqd_set_managed_shutdown(d); return 0; ``` Ensures consistent depth
handling in abort cases. ### 4. **CPU Hotplug Integration**
(kernel/irq/cpuhotplug.c): ```c - irq_startup(desc, IRQ_RESEND,
IRQ_START_COND); + irq_startup_managed(desc); ``` Uses the new depth-
aware function for managed interrupt restoration. ## Backport
Suitability Assessment **Meets All Stable Criteria:** 1. **Fixes
Important Bug**: ✅ Corrects interrupt enable/disable balance corruption
2. **Small & Contained**: ✅ Minimal changes confined to IRQ subsystem 3.
**Low Regression Risk**: ✅ Only affects managed interrupts during CPU
hotplug 4. **No New Features**: ✅ Pure bug fix, no architectural changes
5. **Critical Subsystem**: ✅ IRQ handling is fundamental to system
stability **Similar Pattern Match**: This closely resembles Similar
Commit #3 and #5 (both marked YES) which also fix managed interrupt CPU
hotplug issues with surgical changes to preserve state across hotplug
events. **Real-World Impact**: The bug can cause: - Server/datacenter
systems using CPU hotplug for power management to experience interrupt
handling issues - Multi-queue device drivers to malfunction after CPU
hotplug cycles - Unbalanced IRQ state leading to system instability The
fix is well-contained, addresses a clear functional bug with user-
visible symptoms, and follows established patterns for stable backports
in the IRQ subsystem.

 kernel/irq/chip.c       | 22 +++++++++++++++++++++-
 kernel/irq/cpuhotplug.c |  2 +-
 kernel/irq/internals.h  |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc847..ab2bf0de34223 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -223,6 +223,19 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
 		return IRQ_STARTUP_ABORT;
 	return IRQ_STARTUP_MANAGED;
 }
+
+void irq_startup_managed(struct irq_desc *desc)
+{
+	/*
+	 * Only start it up when the disable depth is 1, so that a disable,
+	 * hotunplug, hotplug sequence does not end up enabling it during
+	 * hotplug unconditionally.
+	 */
+	desc->depth--;
+	if (!desc->depth)
+		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+}
+
 #else
 static __always_inline int
 __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
@@ -290,6 +303,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 			ret = __irq_startup(desc);
 			break;
 		case IRQ_STARTUP_ABORT:
+			desc->depth = 1;
 			irqd_set_managed_shutdown(d);
 			return 0;
 		}
@@ -322,7 +336,13 @@ void irq_shutdown(struct irq_desc *desc)
 {
 	if (irqd_is_started(&desc->irq_data)) {
 		clear_irq_resend(desc);
-		desc->depth = 1;
+		/*
+		 * Increment disable depth, so that a managed shutdown on
+		 * CPU hotunplug preserves the actual disabled state when the
+		 * CPU comes back online. See irq_startup_managed().
+		 */
+		desc->depth++;
+
 		if (desc->irq_data.chip->irq_shutdown) {
 			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
 			irq_state_set_disabled(desc);
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index 15a7654eff684..3ed5b15927355 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -219,7 +219,7 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
 		return;
 
 	if (irqd_is_managed_and_shutdown(data))
-		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
+		irq_startup_managed(desc);
 
 	/*
 	 * If the interrupt can only be directed to a single target
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index b0290849c3956..7111747ecb866 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -87,6 +87,7 @@ extern void __enable_irq(struct irq_desc *desc);
 extern int irq_activate(struct irq_desc *desc);
 extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
 extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
+extern void irq_startup_managed(struct irq_desc *desc);
 
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
-- 
2.39.5


