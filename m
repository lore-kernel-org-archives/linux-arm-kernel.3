Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D5C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAEvK0nsuAdwTuhct7+bZxnrDEI9EsDzKFK6hBUoHwM=; b=HkC+16479AKcQ+7+Cip3rK8zfR
	H1Awx3GZkEC0Z/4cd1AOmhZQbpkn/nVCutt5UexDDXqqDv405ptHkviBSEzmmhlptHfTEmJZ0+juM
	wp6K2QvywrDwDWLQFfamWLIHl5GEIHaFxPgllnIO45ttwFOtzTQOKtqcVyp060OWEuHlIeZUHTL3j
	ZNqcMMFCLcQpJY3Q+f5eKEMVKD+OO2kRCaPEZ51ysAyr/LGec1eJDoW/TaT0Uz1ubJvhfcFuGhRg/
	KUl+qBv1xI331IfyVsK5m15YC+wS3W0rM9zoZVr3C98By5mtqAX2hLK+bxE3c+AZj/socv3KC1j/z
	4C+zje+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJGo-000000044kW-40iD;
	Sat, 15 Aug 2026 18:38:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvJGd-000000044WF-2Prh
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 15 Aug 2026 18:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eAEvK0nsuAdwTuhct7+bZxnrDEI9EsDzKFK6hBUoHwM=; b=iBYWzuRUjseeBQHsnS7IJSg1/M
	cMqxHHjj4l4Z7ANuN51SnJ4VtZiDMxeXC9i2+YZH6PyMPos3WI77oosl55a1o5aZCBkuOp0PjSfeG
	2kqzmpn8kwQIwi6eOqDe9fGUwkKwbJhEX/PbuACZgbJkLdqN2BDoWAlYET1UFeTXAb4NT6MroigFh
	VNcyzwHGZ0MP961P9YTEEM4tmENaPeirR3/rwDJYuuTT2IHqpJNTbTNsq0bwTMkZao+t0GTK52vMa
	6ai5G4BlvAcilvkLpQl+ea0AvWWYmpv7KL3qwqoLCSVPFx9+MNKHSgvcNnQp1qjNy/ilZTA91OfYu
	saXa5wGg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wvJGa-0000000HVsR-2T6W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:38:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0445315A1;
	Sat, 15 Aug 2026 11:37:56 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1DD43F632;
	Sat, 15 Aug 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786819079; bh=0ASHp4GelyBBW6AUV8K6qt1iaX/L1O6I0Qak7wuQ8e4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZ7asqNMPAT3zUIpA6L5eQn23AN1ItUtjspcNlzaIsaivoT8Ocl1I1bYS4FpQ8RjX
	 bwl/hGTI6jdW/wBtKqdGbqqbaIO/2w2FtpDJR4t9q4rRwmwODS5oa4EPSHb5RYePZT
	 RGnqf5ZHI9OvOLAQNBOVzX6ytTLkrCiS0sd8L77c=
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
Subject: [PATCH v9 22/24] docs: ioctl-number: Add SCMI Ioctls
Date: Sat, 15 Aug 2026 19:35:50 +0100
Message-ID: <20260815183552.3250194-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815183552.3250194-1-cristian.marussi@arm.com>
References: <20260815183552.3250194-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_193800_873542_432929E2 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
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

Add SCMI Subsystem IOCTLs numbers

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 3f0ef1e27eb0..de136c5967f4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -399,6 +399,7 @@ Code  Seq#    Include File                                             Comments
 0xE5  00-3F  linux/fuse.h
 0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF1  00-FF  uapi/linux/scmi.h					       ARM SCMI Subsystem
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
 0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
-- 
2.54.0


