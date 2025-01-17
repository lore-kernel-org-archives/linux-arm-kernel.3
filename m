Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98FAC02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqD0lGmlVYvuLXlZXQmHEEFleQAA2PWt7tPA6WMIMos=; b=j/USDum7JZvL2u8fz4xu+SNg22
	RB7YWW+nvrGJN7IuFKlYZ+kUYLkt40XokS5Csl/pD6iioosfshAM+pHSFi/F1CuBae5KLHrlW6nv3
	hWAFqOgA+pH9p4qw7A1OH6IbDv/UqrqcAwg2Vz4TbWWI8D3kkF518Jzr8FyUP/WRsPKifPVCm6hN8
	6wBh7OB//4H8qa6oCsnr/99byBj3nTF8DHrnghYtjRcFkp3XdWON40yjiHo/FHgCE40mO/chhO+0X
	QQDnsJCnDfwdhDnRPHHkBXQI4U9zLV2E71lLQW6UAy22oXsK/q4VUL/cY2lFKmiVTQ7JGjJ79A7f6
	kid/f++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqfx-000000011kE-1Bcy;
	Fri, 17 Jan 2025 18:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqdW-00000001193-3JOn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jan 2025 18:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=gqD0lGmlVYvuLXlZXQmHEEFleQAA2PWt7tPA6WMIMos=; b=ZOhbdFNekXdSWNEeLl7qtvcSLZ
	3fc/Y8d6ydPos3vbscEn7zeKZwWDD0LnIUm+vzmsOSjylPmBtsJOA6JtLc3+9m/J5jVnOkWRSsg5P
	T66d3IpAKs36aER00Sx9FyXTNfdxlnM5TPVxZh2KgnArwyR2bxaLkmybFor+lR3rYE39XHd5BHvWs
	i5WfGJgbGOS6o73HML1l4muX67+q1iO6rGQytes2xr4D8AUJO+oSowO8p1Z9GD7bmwEr22JOysbdZ
	Axs43gRCVk3qebUXDMYNOEiDJYIr4pkPG9IqYbJN7kiTh/kPHiW2cBsRTAiDvR+zlD94oOJhi0MUQ
	/Gpl1KFw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqdT-0000000BUJG-2ly6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13F21A43304;
	Fri, 17 Jan 2025 17:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD3C4AF0B;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=6gEYJTjQk5lbuerHoQnuWyfqni0OXL5KFNZYTT6nkQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YASA+Q+VT35wve+F9U70COnpE2hAPHn//MRQ/TmSM2ps31nQHubj3iFb39ruaCYa5
	 PpTlEKOCrRPjZoO0f9LdAGMdPWd0amvweNDhNX1uwsPap292UA4X3VLOpJJkegJVth
	 /sqnSX+Nq/gC0g3mMbSAE/26BTSSlAJ1C4H0yuf1I2TTqdWY3lLtouiW4H2z73WsMo
	 pdzTxda1YQ0hbOC4uJTxZpfhW+7SF/O2XVUvG4PZFAmYdYr+EsSpsFTHhs/ERNAMU3
	 c9+AS76Hz3If4Df4r83zslFKjeUWk7lO5Dfjtz5v+1n57ZOX3fcYaSNdu/UZbRNf0r
	 LNeibgqt1keKA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajf-1mxH;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 03/10] ABI: sysfs-bus-coresight-*: fix kernelversion tags
Date: Fri, 17 Jan 2025 18:59:32 +0100
Message-ID: <c936b07abd641ca17414f503121bb891e2bda019.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_180000_065595_95F43A39 
X-CRM114-Status: GOOD (  14.16  )
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
2.47.1


