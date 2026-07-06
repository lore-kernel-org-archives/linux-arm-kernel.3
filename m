Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0A1C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7/LPgPHafuhWx2kGPyKT0GuvCG2HyTDGmIUK8zlhcg=; b=YIxfY4QZbIjSCC0Iie4ey4sglJ
	xpxbTOmjLVXKfWLk4Lyewab8hVMTWGVZ4A+5dqPT9csx9YZqhpSfoiuh5btf0pSaC1kRYiE0Od3JL
	aOieMbSvlSkdW9doRBHYHSm+abSrCjhTMO10c7k86lgtDoWuAL9aAsQj2c2kwOJT+n1GaJ3VayEdz
	vo5rrmq1DIu4eBbTrXgWhFwpSvmzdTShBqNZ/3R06At7bee08WdSnNTDamHIq42S62dr/n5ICDfzb
	onYnnea/AGyJxJAiQR2OJT8iPYPzXcA/Jm338FMi/lQaQcxSv9kDg7w6I27+LlKBRsmsMpN4ymZNj
	+1Pggeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjan-0000000CdC3-0Nnc;
	Mon, 06 Jul 2026 13:42:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjaj-0000000Cd8t-46IZ;
	Mon, 06 Jul 2026 13:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345351;
	bh=FvhmAwRahI9fzILkaq1TNr2JWF13tuLDc/rxp//pvFw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iekQeojuPi+V+P1TLfcF/Y7Q9x39yxvTpD9R8Z/b7vCiMbVF/MJ6SmUPaQ2OiMjPA
	 Aatcy81mQV0QE1yTR4nnWwM9cFl1OxDh4ah1960PYMwAa3rbcnoL25nOykXmXIA8jR
	 0/w0ZDZOdq6ioZksoPrwnl2sqiUNJV0CF8yFTKUS50rrXqeARzHJE3P85C2w8TG7Rp
	 tcseNLbInXqmLJIN3SwBPPU9K1bEadP6XHvBbm/1yjagocvZ8CV12TsMA/fsPn0AXx
	 1f2ilOW6bUGKKm3j81nfw4LwBVV4vCsoCS+A1jok7jTwfX+00ELb++DGQoh9rsdZNj
	 YqKt00oX4sjxg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC64417E0DFB;
	Mon, 06 Jul 2026 15:42:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:19 -0400
Subject: [PATCH v3 2/5] docs: media: add documentation for V4L2 driver
 usage metrics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-2-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064234_336786_CA75B489 
X-CRM114-Status: GOOD (  24.49  )
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

From: Christopher Healy <healych@amazon.com>

Document the V4L2 fdinfo interface for per-file-descriptor usage
metrics exposed by V4L2 drivers via /proc/<pid>/fdinfo/<fd>.

The interface is defined generically for V4L2 drivers, with a set of
mandatory keys ("v4l2-driver", "v4l2-driver-type") that identify the
driver and its type, and per-driver-type sections describing
additional keys. This leaves room to extend the interface to other
driver types (stateful codecs, capture devices, ISPs, ...) later
without breaking existing users.

The initial per-type section targets stateless (request API based)
codec devices, both decoders and encoders. With stateless codecs the
kernel driver explicitly submits each frame to the hardware and
receives a completion interrupt, providing a clean per-job metrics
update.

The specification defines "v4l2-" prefixed keys for per-core engine
utilization time and operating frequency, following the same
conventions as the DRM fdinfo mechanism documented in
drm-usage-stats.rst.

"v4l2-core-usage-cycles-<core_id>" is added as an optional key for HW
cycle counters, when supported.

Also provide ABI documentation, currently as testing.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++++++++
 3 files changed, 267 insertions(+)

diff --git a/Documentation/ABI/testing/procfs-fdinfo-v4l2 b/Documentation/ABI/testing/procfs-fdinfo-v4l2
new file mode 100644
index 000000000000..7c64403b6814
--- /dev/null
+++ b/Documentation/ABI/testing/procfs-fdinfo-v4l2
@@ -0,0 +1,129 @@
+What:		/proc/<pid>/fdinfo/<fd> (V4L2 device file descriptors)
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Per-file-descriptor usage metrics for V4L2 devices, exposed
+		as a set of "key:\tvalue\n" lines in the fdinfo file
+		associated with an open /dev/video<N> file descriptor.
+
+		All standardised keys are prefixed with "v4l2-". Driver
+		specific keys are prefixed with "<driver_name>-".
+
+		Counter values are cumulative since the file descriptor was
+		created and strictly monotonically increasing.
+
+		See Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
+		for the full specification.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-driver
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		String. Name of the V4L2 driver backing this file descriptor.
+
+		Format:
+		  v4l2-driver:\t<name>\n
+
+		Mandatory for every driver that implements this interface.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-driver-type
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		String. Type of V4L2 device exposed through this file
+		descriptor. Tells userspace which additional type-specific
+		keys to expect.
+
+		Format:
+		  v4l2-driver-type:\t<type>\n
+
+		Standard values currently defined:
+		  - "stateless-decoder"
+		  - "stateless-encoder"
+
+		Additional values will be defined as the interface is
+		extended to other driver types.
+
+		Mandatory for every driver that implements this interface.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-core-usage-time-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in nanoseconds. Time the hardware core
+		identified by <core_id> spent busy processing work belonging
+		to this file descriptor, cumulative since the file descriptor
+		was created.
+
+		<core_id> must be a non-negative decimal integer (0, 1, 2,
+		...). Strings or other non-numeric identifiers are not
+		allowed.
+
+		Format:
+		  v4l2-core-usage-time-<core_id>:\t<uint> ns\n
+
+		Time is measured by the driver, typically from just before
+		the hardware is started to just after the completion
+		interrupt is handled, so it is slightly less precise than a
+		hardware cycle counter but is always available.
+
+		Mandatory for stateless-decoder and stateless-encoder driver
+		types.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-core-usage-cycles-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer. Number of hardware clock cycles the core
+		identified by <core_id> spent busy processing work belonging
+		to this file descriptor, cumulative since the file descriptor
+		was created.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-core-usage-cycles-<core_id>:\t<uint>\n
+
+		More precise than v4l2-core-usage-time-<core_id>, but
+		requires the hardware to expose a cycle counter. When
+		available together with v4l2-maxfreq-<core_id> and
+		v4l2-curfreq-<core_id>, userspace can derive an accurate
+		utilization percentage. Otherwise, userspace should fall back
+		to v4l2-core-usage-time-<core_id>.
+
+		Optional.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-maxfreq-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in Hz. Maximum operating frequency of the
+		main clock of the core identified by <core_id>.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-maxfreq-<core_id>:\t<uint> Hz\n
+
+		A core may have several clocks associated with it, but only
+		the one that actually clocks the hardware processing engine
+		of the core (its "main clock") is reported.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-curfreq-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in Hz. Current operating frequency of the
+		main clock of the core identified by <core_id>.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-curfreq-<core_id>:\t<uint> Hz\n
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6..0b82df83b2d0 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	mali-c55
 	max2175
+	v4l2-usage-metrics
 	npcm-video
 	omap3isp-uapi
 	thp7312
diff --git a/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst b/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
new file mode 100644
index 000000000000..c56b1d608cd4
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
@@ -0,0 +1,137 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-usage-metrics:
+
+==========================
+V4L2 client usage metrics
+==========================
+
+V4L2 drivers can optionally expose per-file-descriptor usage metrics via
+``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo mechanism
+documented in :ref:`drm-client-usage-stats`, but uses the ``v4l2-`` key
+prefix for V4L2 devices.
+
+The interface is generic to V4L2: any driver type (stateless or stateful
+codecs, capture devices, ISPs, converters, ...) may implement it and provide
+the metrics relevant to its hardware. This document defines a common set of
+mandatory keys that identify the driver and the kind of device, plus per
+driver-type sections describing additional keys.
+
+The initial set of type-specific keys documented here targets stateless
+(request API based) codec devices, both decoders and encoders. With
+stateless codecs, the kernel driver explicitly submits each frame to the
+hardware and receives a completion interrupt, providing a clean per-job
+boundary that can be attributed to the submitting file descriptor. Other
+device types (stateful codecs, capture devices, ISPs, ...) can be added
+later with their own set of type-specific keys.
+
+Implementation
+==============
+
+The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
+callback in ``struct v4l2_file_operations``, and the core wires it into the
+kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
+includes the driver-provided keys.
+
+File format specification
+=========================
+
+- File shall contain one key value pair per one line of text.
+- Colon character (``:``) must be used to delimit keys and values.
+- All standardised keys shall be prefixed with ``v4l2-``.
+- Driver-specific keys shall be prefixed with ``driver_name-``.
+
+All counter values reported through this interface are cumulative since the
+file descriptor was created, and are strictly monotonically increasing.
+
+Mandatory keys
+==============
+
+The following keys must be exposed by every driver that implements this
+interface, regardless of the device type.
+
+- v4l2-driver: <valstr>
+
+  String shall contain the name of the V4L2 driver.
+
+- v4l2-driver-type: <valstr>
+
+  String shall identify the type of V4L2 device exposed through this file
+  descriptor. This key tells userspace which additional type-specific keys
+  to expect. Standard values currently defined are ``stateless-decoder``
+  and ``stateless-encoder``. Additional values will be defined as this
+  interface is extended to other driver types.
+
+Stateless codec keys
+====================
+
+The keys described in this section apply to file descriptors whose
+``v4l2-driver-type`` is ``stateless-decoder`` or ``stateless-encoder``.
+
+A stateless codec may be composed of one or more independent hardware
+cores. Per-core metrics are reported using keys suffixed with a
+``<core_id>`` identifier, so a single file descriptor can report metrics
+for multiple cores.
+
+``<core_id>`` must be a non-negative decimal integer (e.g. ``0``, ``1``,
+``2``, ...). Strings or other non-numeric identifiers are not allowed, so
+that userspace can reliably parse and enumerate cores.
+
+Utilization keys
+----------------
+
+- v4l2-core-usage-time-<core_id>: <uint> ns
+
+  Mandatory.
+
+  Time in nanoseconds that the hardware core identified by ``<core_id>``
+  spent busy processing work belonging to this file descriptor, cumulative
+  since the file descriptor was created.
+
+  Time is measured by the driver, typically from just before the hardware
+  is started to just after the completion interrupt is handled, so it is
+  slightly less precise than a hardware cycle counter but is always
+  available.
+
+- v4l2-core-usage-cycles-<core_id>: <uint>
+
+  Optional.
+
+  Number of hardware clock cycles that the core identified by ``<core_id>``
+  spent busy processing work belonging to this file descriptor, cumulative
+  since the file descriptor was created.
+
+  This is more precise than ``v4l2-core-usage-time-<core_id>`` but requires
+  the hardware to expose a cycle counter. When available together with
+  ``v4l2-maxfreq-<core_id>`` and ``v4l2-curfreq-<core_id>``, userspace can
+  derive an accurate utilization percentage. Otherwise, userspace should
+  fall back to ``v4l2-core-usage-time-<core_id>``.
+
+Frequency keys
+--------------
+
+- v4l2-maxfreq-<core_id>: <uint> Hz
+
+  Maximum operating frequency of the main clock of the core identified by
+  ``<core_id>``.
+
+- v4l2-curfreq-<core_id>: <uint> Hz
+
+  Current operating frequency of the main clock of the core identified by
+  ``<core_id>``.
+
+A core may have several clocks associated with it, but only the one that
+actually clocks the hardware processing engine of the core (its "main
+clock") should be reported through these keys.
+
+Example output
+==============
+
+::
+
+  v4l2-driver:                  hantro-vpu
+  v4l2-driver-type:             stateless-decoder
+  v4l2-core-usage-time-0:       123456789 ns
+  v4l2-core-usage-cycles-0:     74000000
+  v4l2-maxfreq-0:               600000000 Hz
+  v4l2-curfreq-0:               600000000 Hz

-- 
2.54.0


