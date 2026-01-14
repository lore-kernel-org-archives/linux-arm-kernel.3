Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FF9D29FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynkPk7babxU84g1t3yQrFmQCekDZd6OkOgAG24crBmQ=; b=P3k4e8mk6r516aqT5UrSz/PFeu
	otOEl3T3xnXwTrcu9bCraSXHDbVuIZKUXu75uCLRW8WODtTrWWPVHXXI7IyNU31hk8OmQxKOTV+F3
	BEhiAQ3w6TuTgIoaazBRNNwn22qiYhs42qUMzl0w/BorMJlyFaDGlZ+IW7UYreVbIIet5de2/5L4z
	cLao5CGPdFvVAbBj/kwL2GE5+Ta6yWUuPEUMtlNGTGV7QqVc8z0LZPfXHUGRHALP0ly4KsqkxpmLo
	YCVmFIxneUqZqqWuoSacqW84P2JYndw8nOssWp/vQCx6AUjmtfH5upsPm4xPQ4V0ALNRHZ7TlE+7p
	eGZZe8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMS-00000009174-3px2;
	Wed, 14 Jan 2026 11:48:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMG-000000090la-0vwn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:48:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6E11424;
	Wed, 14 Jan 2026 03:48:08 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F773F59E;
	Wed, 14 Jan 2026 03:48:11 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 14/17] [RFC] docs: stlmfs: Document ARM SCMI Telemetry FS ABI
Date: Wed, 14 Jan 2026 11:46:18 +0000
Message-ID: <20260114114638.2290765-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114114638.2290765-1-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_034816_422413_5AFC6DBF 
X-CRM114-Status: GOOD (  16.21  )
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

Add full ABI dcoumentation for stlmfs under testing/

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
RFC since the documentation is still NOT complete and unsure if place
this into stable/ or testing/
---
 Documentation/ABI/testing/stlmfs | 153 +++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/ABI/testing/stlmfs

diff --git a/Documentation/ABI/testing/stlmfs b/Documentation/ABI/testing/stlmfs
new file mode 100644
index 000000000000..efa001a7d82f
--- /dev/null
+++ b/Documentation/ABI/testing/stlmfs
@@ -0,0 +1,153 @@
+What:		/sys/fs/arm_telemetry/tlm_<N>/all_des_enable
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A boolean WO entry to enable all the discovered Data Events for
+		SCMI instance <N>.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/all_tstamp_des_enable
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A boolean WO entry to enable timestamps for all the discovered
+		Data Events for SCMI instance <N>. (when available)
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/available_update_intervals_ms
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry that returns a space separated list of tuples of
+		values, separated by a coma, each one representing a
+		configurable update interval for SCMI instance <N>.
+		Each tuple describes a possible update interval using the
+		format <secs>,<exp> where the final represented interval is
+		calculated as: <secs> * 10 ^ <exp>
+		An example of list of tuples that can be read from this entry:
+			3,0 4,-1 75,-2 300,-3 1,1 5,3 222,-7
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/current_update_intervals_ms
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	An RW entry that can be used to get or set the platform update
+		interval for SCMI instance <N>.
+		On read the returned tuple represents the current update
+		interval using the format <secs>,<exp> where the final
+		represented interval is calculated as: <secs> * 10 ^ <exp>
+		On write the accepted format is the same as on read <secs>,<exp>
+		but, optionally, the second element of the tuple can be omitted
+		and in that case the assumed value for the exponent will default
+		to -3 signifying milliseconds.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/control
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	An RW entry that can be used to discover, configure and retrieve
+		Telemetry data using the alternative binary interface based on
+		ioctls which is documented in include/uapi/linux/scmi.h
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/de_implementation_version
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry that returns a string representing the 128bit UUID
+		that uniquely identifies the set of SCMI Telemetry Data Events
+		and their semantic for SCMI instance <N>.
+		This is compliant with the DE_IMPLEMENTATION_REVISION described
+		in SCMI v4.0 Telemetry 3.12.4.3.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/des_bulk_read
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry that returns a multi-line string containing all the
+		the DEs enabled for SCMI instance <N>, one-per-line, formmatted
+		as: <DE_ID> <TIMESTAMP> <DATA_VALUE>.
+		These DEs readings represent the last value updated by the
+		platform following the configured update interval: on the
+		backend they may have been collected in a number of different
+		ways: on-demand SHMTI lookup, notifications, fastchannels.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/des_single_sample_read
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry that returns a multi-line string containing all the
+		the DEs enabled for SCMI instance <N>, one-per-line, formmatted
+		as: <DE_ID> <TIMESTAMP> <DATA_VALUE>.
+		These DEs readings are generated by triggering an explicit and
+		immediate platform update using single sample asynchronous
+		collect methods.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/intervals_discrete
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A boolean RO entry to specify if the intervals reported for
+		SCMI instance <N> in available_update_intervals_ms are a list of
+		discrete intervals or a triplet of values representing
+		<LOWEST_UPDATE_INTERVAL> <HIGHEST_UPDATE_INTERVAL> <STEP_SIZE>.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/reset
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A boolean WO entry that can be used the full reset of the SCMI
+		Telemetry subsystem, both of the configurations and of the
+		collected data, as specified in SCMI v4.0 3.12.4.12
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/tlm_enable
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A boolean RW entry that can be used to get or set the general
+		enable status of the Telemetry subsystem. Temporarily disabling
+		Telemetry as a whole does NOT reset the current configuration,
+		it only stops all the DEs updates platform side.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/version
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry used to report the SCMI Telemetry protocol version
+		used in this implementation.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/des/0x<NNNNNNNN>/value
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RO entry used to read the last value reported for Data Event
+		with id	0x<NNNNNNNN> for SCMI instance <N>.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/des/0x<NNNNNNNN>/enable
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RW boolean entry used to enable or disable Data Event
+		with id	0x<NNNNNNNN> for SCMI instance <N>.
+Users:		Any userspace telemetry tool
+
+What:		/sys/fs/arm_telemetry/tlm_<N>/des/0x<NNNNNNNN>/tstamp_enable
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	cristian.marussi@arm.com
+Description:	A RW boolean entry used to enable or disable timestamping for
+		Data Event with id 0x<NNNNNNNN> for SCMI instance <N>.
+Users:		Any userspace telemetry tool
+
+
+... To BE CONTINUED ...
-- 
2.52.0


