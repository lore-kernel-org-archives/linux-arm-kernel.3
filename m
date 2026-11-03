Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD02606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XCTcZWO3;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GcEcuEVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rauzFWryPvLyBGmPfmCf4yU7zrPY15jbEucaJwu7RGA=; b=XCTcZWO3ellbmmqfkTk9aFK893
	QIvLosI3NbGM5TYVCKdio13i8h12zRvGANjMP88I5bw9O6Td4QAdGQDJT9/AQcicN58Wn0SDED2p4
	IWGD1DnNZu7xhsQO19gsly3KW0KWRPzr8SeCXQRelr3nO1lOsW5zVqpD3TcFGLDzDW6FJQGKlt7uO
	P6VDzzyphbRSRth3hyGnfxIkysu0TEVQcyX8T7CoeHZ35k2kNddNbEm1zfZ3Bfii+1n+pVYtqaODk
	OpIM7MLEJlo4mgGAEvTX15wsyqdkJQt1/dgW5OWHB4fy3NdxpRUHflqhFZnkOnAyXerusamEYTJEC
	paPzy5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONe7-00000003umx-1Aqe;
	Tue, 03 Nov 2026 23:10:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONe4-00000003ulw-0RFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:10:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCFE1595;
	Tue,  3 Nov 2026 15:10:17 -0800 (PST)
Received: from e121740.manchester.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 465A43F673;
	Tue,  3 Nov 2026 15:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793747420; bh=5PdF7S6Qt0U8B4kKlbu+dpwG2CeHusjyFfgxfiz/nq4=;
	h=From:To:Cc:Subject:Date:From;
	b=GcEcuEVLaqxRyNraEfi2BqD19fYcUKfCyiYHYmvH9jD2dzV9dahgwauNi3qrE6nLx
	 d/Llbw6DsKhA22zNcI222guUs/bt5TyVz+J5L4YAvOXUmmREhp9gY0lUeVIGnpsXID
	 hfbScpLWD8C8Ic3Y3qye9uChRFPN2cndq7DQBq70=
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Philip Radford <philip.radford@arm.com>
Subject: [PATCH v10 00/13] Add support for SCMIv4.0 Powercap Extensions
Date: Tue,  3 Nov 2026 23:09:54 +0000
Message-Id: <20261103231007.537082-1-philip.radford@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151024_875324_626FDE06 
X-CRM114-Status: GOOD (  26.31  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

I have taken over this series from Cristian and in doing so I have
addressed a couple of issues raised by the first version and added six
additional patches since Cristian's original series:

[1/13] addresses an omission from the original powercap functionality. The
ABI documentation describes allowing enabling and disabling power capping
for a control type via /sys/class/powercap/<control type>/enabled. This
first patch implements this functionality but as stated before, this was an
omission rather than a bug that requires fixing. Disabling the control type
disables any immediate children of the control type.

The logic for this patch is based on the logic I was using for enabling and
disabling the synthetic node in the final patch of this series. As a result,
the synthetic node enable/disable patch has now been significantly reduced.

[7/13] exposes the measurement averaging interval (MAI) value when the
agent has registered to receive power measurement change notifications
for the power capping domain.

[10/13] adds MAI get and set support for the powercap protocol.

[11/13] introduces a synthetic root zone to act as a common parent for all
top-level domains.

[12/13] adds get_power_uw to synthetic root zone, summing the per-zone
power of immediate child zones.

[13/13] adds enable/disable functionality to synthetic root zone to
enable/disable immediate children.

Changes for this version are in response to numerous concerns identified
by Sashiko review system and issues identified by Sudeep Holla (thank you
for the review).

The original series was based on v6.17-rc1 whereas this version has been
based on v7.4-rc1.

The rest of Cristian's series is explained below;

SCMIv4.0 [1] introduces some new features and commands into the Powercap
protocol. In a nutshell, such protocol changes add support for:

 - setting multiple powercap limit/interval constraints for each SCMI
   powercap domain which supports multiple Concurrent Power Limit
 - enabling more Powercap commands to use Fastchannels mechanism
 - adding multiple constraints support to the existing notifications

After a bit of needed updates in the SCMI core this series adds:

- support for the idea of optional multiple Concurrent Power Limit (CPLs)
- support for the new FCs
- support for extended notifications
- enable usage of such multiple constraint in the ARM SCMI Powercap driver

Tested on a single and multi-instance scenario on an emulated setup
implementing the new protocol extensions.

Based on v7.4-rc1.

Thanks,
Phil
---
V9->V10
- rebased on 7.4-rc1
- changed control-type enable writes to snapshot per-zone state instead of
  aggregate
- cancel enable/disable writes if a root child zone is not configurable
- roll back changed zones on failure
- changed control-type enable reads to report enabled if any root child zone
  is enabled
- fixed remaining powercap_cap_config use after the CPL layout refactor
- adjusted contorl-type enable handling to use cpli[0].cap_config after
  refactor
- added interval validation for CAI/PAI values
- allow all-zero CAI/PAI values to mean teh plaform did not report the
  interval
- clear avg_ivl_config when CAI/PAI values are not reported
- pass the powercap domain descriptor to avg interval get/set helpers
- use firmware CPL identifiers for CAI_GET and CAI_SET instead of array
  index
- use firmware CPL identifiers when describing SCMIv4.0 Powercap fastchannels
- use interval-specific validation for CPC-reported CAI values
- allow all--zero CPC CAI values to mean teh platform did not report the interval
- clamp exposed constraints to MAX_CONSTRAINTS_PER_ZONE instead of failing probe
- warn when firmware advertises more CPLs than the powercap core can expose
- use interval-specific validation for MAI values
- allow all-zero MAI values to mean the platform did not report the interval
- moved Powercap fastchannel firmware CPL identifier fix to fastchannel
  support patch
- skip immediate child zones that do not support power monitoring
- return -ENODATA if none of the synthetic root children can be measured
- add synthetic-root enable helper with per-zone state snapshot and roolback
- abort synthetic-root enables writes if any root child zone is not configurable
- restore each changed child zone to its previous state on failure
V8->V9
- rebased on 7.3-rc1
- added check to powercap_set_root_children_enable to make sure it is configurable
- added rollback in powercap_control_type_set_enable in case of failure of one root zone
- included validation of the number of cpls in iter_powercap_cpls_update_state
- re-ordered validation of cap_config and num_cpli in powercap_domain_attrs_process
- included validation of length in powercap_domain_attributes_get
- amended cap_get and cap_set referencing apl_id array index instead fo firmware CPL identifier
- added bounds check to make sure cpl_id is less than num_cpli
- fixed CAP_CHANGED notification paring to accept old payload without cpli
- changed secondary CPL validation to use scmi_powercap_validate to catch
  zero steps when min and max differ
- Added validation check to make sure powercap domain doesn't have too
  many constraints
- Separated out domain specific fastchannel initialisation from per-cpl loop
- Amended per-cpl fast channels to use firmware cpl id instead of relying on
  num_cpli numbering
- Removed redundant scmi_powercap_get_zone_height
- Added scmi_powercap_parent_name helper
- Replaced tiernary operator that checked empty parent->info->name
- Removed redundant if (!pr) check from instance_root_get_power_uw()
- Stopped returning a partial sum if one child read fails
- Added mutex lock to instance_root_set_enable and instance_root_get_enable
V7->V8
- Rebased on v7.2-rc1
- Fixed conflict due to updates to v7.2
V6->V7
- Added control type enable/disable patch
- Refactored Synthetic zone enable disable patch
- Corrected naming of define V2/V3 payload sizes
- Prevent possible cpli[0] out-of-bounds access
- Added cleanup for zones during scmi_powercap_probe
- Prevent instance_root_get_enable reporting a stale state
- Rebased on v7.1-rc7
V5->V6
- Re-worded existing comment for POWERCAP_MEASUREMENTS_NOTIFY
- Added define for V2/V3 payload sizes
- Used new definitions for payload sizes
- Fixed comment length
- Changed warning message warning
- Fixed line lengths and alignment
- Updated docs for new fields
- Amended omission of spz initialization when unregistering powercap zones
- Tested unloading and loading powercap module
- Re-wrote commit message
- Added use of to_scmi_powercap_root macro
- Changed instance_root_set_enable_state to bail out on any error
V4->V5
- Added enable/disable functionality to synthetic node
- Rebased on v7.1-rc1
V3->V4
- Rebased on v7.0-rc4
- Added sythentic parent node and functionality
- Moved fastchannel inits outside of loop
- Renamed arguments for consistency
V2->V3
- Added powercap MAI get/set support
V1->V2
- Rebased on sudeep/for-next/scmi/updates
- Amended Copyright to include 2026
- Added patch to extend powercap report to include MAI
- Removed creation of pi powercap_info struct due to legacy code change
- Amended references to pi->version and similar, which were based on
  legacy code
- Wrapped two variables in le32_to_cpu() to appease Sparse warnings
- Amended comparing operator value in response to feedback

Cristian Marussi (5):
  firmware: arm_scmi: Add SCMIv4.0 Powercap basic support
  firmware: arm_scmi: Add SCMIv4.0 Powercap FCs support
  firmware: arm_scmi: Add SCMIV4.0 Powercap notifications support
  include: trace: Add new parameter to trace_scmi_fc_call
  powercap: arm_scmi: Enable multiple constraints support

Philip Radford (8):
  powercap: Add enable disable control-type
  firmware: arm_scmi: Add an optional custom parameter to fastchannel
    helpers
  firmware: arm_scmi: Refactor powercap domain layout
  firmware: arm_scmi: Extend powercap report to include MAI
  firmware: arm_scmi: add Powercap MAI get/set support
  powercap: arm_scmi: Create synthetic parent node for multi-instance
  powercap: arm_scmi: Add get_power_uw to synthetic node
  powercap: arm_scmi: Synthetic zone enable/disable

 drivers/firmware/arm_scmi/driver.c    |   12 +-
 drivers/firmware/arm_scmi/perf.c      |   16 +-
 drivers/firmware/arm_scmi/powercap.c  | 1064 ++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |    2 +-
 drivers/powercap/arm_scmi_powercap.c  |  491 +++++++++++-
 include/linux/scmi_protocol.h         |   97 ++-
 include/trace/events/scmi.h           |   12 +-
 7 files changed, 1407 insertions(+), 287 deletions(-)

--
2.34.1


