Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B85C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftWAf9HXVXmmB711i4hh5hMl9Vp+I9XL75wqlG8xNbs=; b=nf0JaQxaNOtB6mpl+fFB1ZhtXD
	aNZJ6Hd9kzgz5iggg958HRTrZLvANnX9o5U6PaB1KeBR2VtGDOkAh6XFyViEeXmGfNSh251q2I1Ek
	YOvG220X9KzMMWmrHAOAksBag9be9XNraJiBdv70+MFIrSfQkC9+tMaj5gFpkjENRBcAA4EPiV5Kp
	4ZtSzP18OTTIU73sM+syFBYk2aIvDqABnthpZ3p3tbJzqClTWxRiZhy1hcpIfI6f0tW+xKzDYBNRy
	AiF4nRu3g//7/l6r+2b+gbCn3Lo9rppODliuDxEGBKnWNSKhVOjLhOJbbJS+LDrXmsU+PPPf8vn7t
	ImU0PcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQx4-0000000Gzol-2nhd;
	Mon, 10 Feb 2025 10:23:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQrx-0000000Gy2R-2MD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E4465C4B1D;
	Mon, 10 Feb 2025 10:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20DFC4CEE4;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=qrdsVxvuQlrneXqnvXiP9gvzFSX4e5M789thOkYc44o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikvZ3d5lUn63D2CLG8RDencAAhg3jR/LANRXuatdb34SMOGWeaYQwR/Fv7vAAXLOW
	 orS4OccvGoabjkvJx2g4BQ26TxsvR5UM/lrUdnWFZqnXQw8Gy2mpOztu6qaaPwZGgx
	 VWOxjVGVZQcRsoCvWBjI36iq+YlN0Og2Ni+cXU5aOMyIhaz2yHjygxGiyUnkdTS807
	 PT7WgUJc8bYq+Z1hUeWLJK8xJwqBFjrur4jQNdNkoNyEmwnN9+/zeGWfOXNOMC/MHZ
	 9Org1oD4LAMqw4WAAbyRd/TDqsLTiEglSz1AkgQ0wW2UrH8kVkecgJFp8XWG5EVMNA
	 dvsCpEBJODdgg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQrt-00000006CiS-4AXV;
	Mon, 10 Feb 2025 11:18:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/27] ABI: sysfs-bus-coresight-*: fix kernelversion tags
Date: Mon, 10 Feb 2025 11:17:54 +0100
Message-ID: <72c3a6583c2ffca23ae9ee1c0b6dc98618ae0775.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_021825_700603_B48AF06F 
X-CRM114-Status: GOOD (  14.24  )
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

Some kernelversion tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../testing/sysfs-bus-coresight-devices-cti   | 78 +++++++++----------
 .../testing/sysfs-bus-coresight-devices-tpdm  | 52 ++++++-------
 2 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
index bf2869c413e7..a97b70f588da 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
@@ -1,241 +1,241 @@
 What:		/sys/bus/coresight/devices/<cti-name>/enable
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Enable/Disable the CTI hardware.
 
 What:		/sys/bus/coresight/devices/<cti-name>/powered
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Indicate if the CTI hardware is powered.
 
 What:		/sys/bus/coresight/devices/<cti-name>/ctmid
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Display the associated CTM ID
 
 What:		/sys/bus/coresight/devices/<cti-name>/nr_trigger_cons
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Number of devices connected to triggers on this CTI
 
 What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/name
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Name of connected device <N>
 
 What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_signals
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Input trigger signals from connected device <N>
 
 What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/in_types
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Functional types for the input trigger signals
 		from connected device <N>
 
 What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_signals
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Output trigger signals to connected device <N>
 
 What:		/sys/bus/coresight/devices/<cti-name>/triggers<N>/out_types
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Functional types for the output trigger signals
 		to connected device <N>
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/inout_sel
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Select the index for inen and outen registers.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/inen
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Read or write the CTIINEN register selected by inout_sel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/outen
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Read or write the CTIOUTEN register selected by inout_sel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/gate
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Read or write CTIGATE register.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/asicctl
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Read or write ASICCTL register.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/intack
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Write the INTACK register.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/appset
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Set CTIAPPSET register to activate channel. Read back to
 		determine current value of register.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/appclear
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Write APPCLEAR register to deactivate channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/apppulse
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Write APPPULSE to pulse a channel active for one clock
 		cycle.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/chinstatus
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Read current status of channel inputs.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/choutstatus
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of channel outputs.
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of input trigger signals
 
 What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) read current status of output trigger signals.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Attach a CTI input trigger to a CTM channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_detach
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Detach a CTI input trigger from a CTM channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_attach
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Attach a CTI output trigger to a CTM channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_detach
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Detach a CTI output trigger from a CTM channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_enable
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Enable CTIGATE for single channel (Write) or list enabled
 		channels through the gate (R).
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_gate_disable
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Disable CTIGATE for single channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_set
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Activate a single channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_clear
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Deactivate a single channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_pulse
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Pulse a single channel - activate for a single clock cycle.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trigout_filtered
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) List of output triggers filtered across all connections.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/trig_filter_enable
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Enable or disable trigger output signal filtering.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_inuse
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) show channels with at least one attached trigger signal.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_free
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) show channels with no attached trigger signals.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_sel
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(RW) Write channel number to select a channel to view, read to
 		see selected channel number.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_in
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Read to see input triggers connected to selected view
 		channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_out
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Read) Read to see output triggers connected to selected view
 		channel.
 
 What:		/sys/bus/coresight/devices/<cti-name>/channels/chan_xtrigs_reset
 Date:		March 2020
-KernelVersion	5.7
+KernelVersion:	5.7
 Contact:	Mike Leach or Mathieu Poirier
 Description:	(Write) Clear all channel / trigger programming.
diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index bf710ea6e0ef..53cb454b60d0 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -1,6 +1,6 @@
 What:		/sys/bus/coresight/devices/<tpdm-name>/integration_test
 Date:		January 2023
-KernelVersion	6.2
+KernelVersion:	6.2
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(Write) Run integration test for tpdm. Integration test
@@ -14,7 +14,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/reset_dataset
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(Write) Reset the dataset of the tpdm.
@@ -24,7 +24,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_type
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the trigger type of the DSB for tpdm.
@@ -35,7 +35,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_ts
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the trigger timestamp of the DSB for tpdm.
@@ -46,7 +46,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_mode
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the programming mode of the DSB for tpdm.
@@ -60,7 +60,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_idx
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the index number of the edge detection for the DSB
@@ -69,7 +69,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_val
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		Write a data to control the edge detection corresponding to
@@ -85,7 +85,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/ctrl_mask
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		Write a data to mask the edge detection corresponding to the index
@@ -97,21 +97,21 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/edcr[0:15]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		Read a set of the edge control value of the DSB in TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_edge/edcmr[0:7]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		Read a set of the edge control mask of the DSB in TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_patt/xpr[0:7]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the value of the trigger pattern for the DSB
@@ -119,7 +119,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_trig_patt/xpmr[0:7]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the mask of the trigger pattern for the DSB
@@ -127,21 +127,21 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpr[0:7]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the value of the pattern for the DSB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpmr[0:7]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the mask of the pattern for the DSB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/enable_ts
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(Write) Set the pattern timestamp of DSB tpdm. Read
@@ -153,7 +153,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/set_type
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(Write) Set the pattern type of DSB tpdm. Read
@@ -165,7 +165,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_msr/msr[0:31]
 Date:		March 2023
-KernelVersion	6.7
+KernelVersion:	6.7
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the MSR(mux select register) for the DSB subunit
@@ -173,7 +173,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_mode
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:	(Write) Set the data collection mode of CMB tpdm. Continuous
 		change creates CMB data set elements on every CMBCLK edge.
@@ -187,7 +187,7 @@ Description:	(Write) Set the data collection mode of CMB tpdm. Continuous
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_patt/xpr[0:1]
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the value of the trigger pattern for the CMB
@@ -195,7 +195,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_patt/xpmr[0:1]
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the mask of the trigger pattern for the CMB
@@ -203,21 +203,21 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpr[0:1]
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the value of the pattern for the CMB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpmr[0:1]
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the mask of the pattern for the CMB subunit TPDM.
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_patt/enable_ts
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(Write) Set the pattern timestamp of CMB tpdm. Read
@@ -229,7 +229,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_trig_ts
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the trigger timestamp of the CMB for tpdm.
@@ -240,7 +240,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_ts_all
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Read or write the status of timestamp upon all interface.
@@ -252,7 +252,7 @@ Description:
 
 What:		/sys/bus/coresight/devices/<tpdm-name>/cmb_msr/msr[0:31]
 Date:		January 2024
-KernelVersion	6.9
+KernelVersion:	6.9
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the MSR(mux select register) for the CMB subunit
-- 
2.48.1


