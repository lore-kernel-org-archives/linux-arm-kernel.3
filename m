Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD29C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYYRqgeZiApteoWJBXjzzgnLBwKqDetB9NQD5Hts6BU=; b=Hx4E5l4ir4IEu8oVh6X1IxDCYt
	I1UX5yeHtfo2WjAvt77St/LcEY1a8Esir2XZmO2fmfp65IOa3w/lDH49tw4cKm4CFK5fTlcTntzy5
	+3wSILx0wV7CPNhfFlzkKGP+gr+hvApSgBTWxg5G5SIJX7VpvOk/X5AQnlAi/FgPqufEdmPh2iZoj
	sbV7Z9Gv0K+TS+lSQzZrE0voJQvZvGAjy2aglJjzRuNEaAnkGIh8IhYjyirtVUzhI6XP6UnkuL7tz
	PW0rDuFfROlS3M0s3yyOkxX44A+RwQEDx60QtrQGwbYFRJGkZAHc8927SKmEy6kEBugjkkn/Qt4k+
	tgetmRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DkK-0000000HAXF-3ZBN;
	Sun, 20 Sep 2026 09:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DkA-0000000HAP3-0czi
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 09:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aYYRqgeZiApteoWJBXjzzgnLBwKqDetB9NQD5Hts6BU=; b=WxWgoxrz0sMpmQuK3HEnkIwnFx
	/8CQ+No/6ChpC1Se2kOQLBKXhYQwkk9ntqnwhcUuM9yr71T8rE0bmdhXpiVaXMdaf9MSR4JhF+Nws
	XxeBF61S+3P2FbIxswnPO4+ag59BNa9o2+s2CPMjybFApxoHoLognYscQ2pIoKMN8ZqaEuSZ9MyJ9
	hJdKv4mqHlEfxp9D3e0blRX86mLaoM4OLiOttKue/Vtq90yFm0ciQV1T5PDlsV5LnyQUpupNSOZaz
	tY3487zqahQfWMufOfHEPzWWY7j6HMnSLv/fg8CMsfBlAZA3dLxlNm0rDG59DRfhn/IhqSPk759Nz
	YVthcJ6Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Dk6-0000000BI2Z-2SCc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:21:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D526C175A;
	Sun, 20 Sep 2026 02:21:45 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5284A3F59E;
	Sun, 20 Sep 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896109; bh=KgyzAv1AKC+T5jVIxoIIFo2Oowe2Igerilum0mNQIko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YtLWW3YNEe9swiku6k/Id0vcWG513hKLHA3xmHKWuQa06cmLp08wsWspaf2CzPkXD
	 QQ8Dgi3dnrTPb7o2/jXacAwZ/kRzDJnlnqr9sBAz8cnLBVYRC7GHuTWrudc0WFDsxn
	 qUNJZ5NhmTAtdmBdg8gM+HRxWLhmmtUQRJLm3mTM=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v12 23/25] [RFC] Documentation: Add SCMI System Telemetry documentation
Date: Sun, 20 Sep 2026 10:19:26 +0100
Message-ID: <20260920091928.2014972-24-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_102151_087547_878B7BD3 
X-CRM114-Status: GOOD (  20.81  )
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

Document ARM SCMI Telemetry IOCTLs interface.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
RFC since it still needs more extensive examples

v6 --> v7
 - removed useless top '..stlm' reference
 - added new IOCTLs, fixed a few grammatical errors
v5 --> v6
 - fixed typos
---
 Documentation/userspace-api/index.rst |   1 +
 Documentation/userspace-api/stlm.rst  | 148 ++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 Documentation/userspace-api/stlm.rst

diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index a68b1bea57a8..22daa7ebf78e 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -54,6 +54,7 @@ Devices and I/O
    dcdbas
    vduse
    isapnp
+   stlm
 
 Everything else
 ===============
diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
new file mode 100644
index 000000000000..e30b1d1d19bd
--- /dev/null
+++ b/Documentation/userspace-api/stlm.rst
@@ -0,0 +1,148 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+STLM - ARM SCMI Telemetry Userspace API
+=======================================
+
+.. contents::
+
+Overview
+========
+
+ARM SCMI is a System and Configuration Management protocol, based on a
+client-server model, that defines a number of messages that allows a
+client/agent like Linux to discover, configure and make use of services
+provided by the server/platform firmware.
+
+SCMI v4.0 [1] introduced support for System Telemetry, through which an
+agent can dynamically enumerate, configure and collect Telemetry Data
+Events (DE) exposed by the platform.
+
+The SCMI System Telemetry driver exposes one or more dedicated devices,
+named as tlm_<N>, grouped under /dev/scmi/, one for each discovered SCMI
+instance.
+
+An IOCTL based interface is defined in order to enumerate, configure and
+read telemetry data, as succinctly described in the following.
+
+For more details on the uAPI, please see include/uapi/linux/scmi.h
+
+Resources Enumeration
+=====================
+
+ - SCMI_TLM_GET_ABI_INFO: Gather ABI versioning detail and basic SCMI
+   Telemetry features like number of resources and supported features.
+
+ - SCMI_TLM_GET_INTRVS: Enumerate available update intervals.
+
+ - SCMI_TLM_GET_DE_INFO: Retrieve DataEvent description.
+
+ - SCMI_TLM_GET_DE_LIST: Retrieve the list of all the existent DataEvent
+   descriptors.
+
+ - SCMI_TLM_GET_GRP_LIST: Gather a list of descriptors for all defined Groups.
+
+ - SCMI_TLM_GET_GRP_INFO: Gather information for a specific Group.
+
+ - SCMI_TLM_GET_GRP_DESC: Gather detailed group composition information for
+   the specified Group.
+
+ - SCMI_TLM_GET_UUID_LIST: Gather a list of descriptors for all the SCMI
+   Telemetry UUIDs defined on this system.
+
+Configuration
+=============
+
+ - SCMI_TLM_GET_CFG / SCMI_TLM_SET_CFG: Get or set the whole instance, or a
+   specific group, configuration.
+
+ - SCMI_TLM_GET_DE_CFG / SCMI_TLM_SET_DE_CFG: Get or set the configuration
+   of a specific DataEvent.
+
+ - SCMI_TLM_GET_ALL_CFG / SCMI_TLM_SET_ALL_CFG: Get or set the cumulative
+   configuration of ALL the DataEvents defined on the platform.
+
+ - SCMI_TLM_RESET: Reset the whole Telemetry configuration server side.
+
+ - SCMI_TLM_EVENT_SUBSCRIBE: Subscribe/unsubscribe to a Telemetry event.
+
+Data Collection
+===============
+
+ - SCMI_TLM_DE_READ: Report the last updated sample for the specified
+   DataEvent.
+
+ - SCMI_TLM_BULK_READ: Report the last samples for all the currently enabled
+   DataEvents.
+
+ - SCMI_TLM_BATCH_READ: Report the last samples for the DataEvents IDs
+   specified within the samples input params.
+
+ - SCMI_TLM_SINGLE_READ: Trigger an immediate platform-side DataEvent
+   update and report the collected samples.
+
+Memory Mapped Raw Access
+------------------------
+
+ - SCMI_TLM_GET_SHMTI_LIST: Gather a list of open file descriptors, one for
+   each SHMTI memory area defined for this instance, that can be used to
+   memory-map such areas in the calling process address space so as to be
+   able to directly access the SCMI Telemetry SHMTI areas shared by the
+   platform firmware, and parse the TDCF format.
+   The SCMI Telemetry TDCF format is defined in the specification at [1].
+
+
+Example
+=======
+
+.. code-block:: c
+
+	int main(int argc, char **argv)
+	{
+		struct scmi_tlm_de_config des_cfg = {};
+		struct scmi_tlm_config cfg = {};
+		struct scmi_tlm_de_sample samples[3] = {};
+		struct scmi_tlm_data_read data = {};
+		int fd, ret;
+
+		fd = open("/dev/scmi/tlm_0", O_RDWR);
+		if (fd < 0)
+			return fd;
+
+		/* Enable ALL Data Events with timestamps*/
+		des_cfg.enable = 1;
+		des_cfg.t_enable = 1;
+		ret = ioctl(fd, SCMI_TLM_SET_ALL_CFG, &des_cfg);
+		if (ret)
+			return ret;
+
+		/* Enable Telemetry as a whole, set a 400ms update interval */
+		cfg.enable = 1;
+		cfg.active.secs = 400;
+		cfg.active.exp = -3;
+
+		ret = ioctl(fd, SCMI_TLM_SET_CFG, &cfg);
+		if (ret)
+			return ret;
+
+		/* Read a selection of DEs */
+		samples[0].id = 0xA001;
+		samples[1].id = 0x0002;
+		samples[2].id = 0x1010;
+		data.num_samples = 3;
+		data.samples = (unsigned long)samples;
+
+		ret = ioctl(fd, SCMI_TLM_BATCH_READ, &data);
+		if (ret)
+			return ret;
+
+		for (int i = 0; i < 3; i++)
+			fprintf(stdout, "%llu: 0x%08X -> %llu\n",
+					samples[i].tstamp, samples[i].id, samples[i].val);
+
+		return 0;
+	}
+
+References
+==========
+[1]: https://developer.arm.com/documentation/den0056/latest/
-- 
2.54.0


