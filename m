Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3253C55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAEvK0nsuAdwTuhct7+bZxnrDEI9EsDzKFK6hBUoHwM=; b=PpCW3H18rSrmkOA8N+Y5c8VB7Z
	/u2dH2o1aY8SWJNTUZ0vUR4S6rYOPMfGc17X6SQers5acSAa6VQ7eALfNJwzUsXIVCB/7T49CX9Nd
	HrcSJnmj01HY4+LMwEUdo0gF4ZPbiSYtBR/Wc7HAEw98HzfPrd2AYZqdGN6mOXcqLTP8gNgxGFdLO
	18odDld2GZob8SSEanvdnAToEiyKeH4gcqduhhzsZjOdeCMBHkInEfU0TC2OLIe0MNO6qTv3dtfV4
	Z9oHx1AdulX1t3z0waiNGgcaJsnO5NRPRaT5UcfXL7AA2yE9ll/58DmdKtINMhc69jw0Yb7bvGSkx
	UHIj1AEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXed-0000000Fkzi-2CAG;
	Sun, 02 Aug 2026 14:59:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXeb-0000000FkwZ-0Mdi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:59:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECD06143D;
	Sun,  2 Aug 2026 07:58:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AF603F632;
	Sun,  2 Aug 2026 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785682744; bh=0ASHp4GelyBBW6AUV8K6qt1iaX/L1O6I0Qak7wuQ8e4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwT+njZ9w/iH7iXMtj/fVAU33BWnZU+8lB2aMfgo7WRRBNKkAwvPAnScDq2XICAow
	 50KJqveUfzby4h26xrKZ6gpBszIDQsvwo9tpiWl8gX1ogHjKR84Y+HSyIqxuxMbpLA
	 3u/E7YyOWDxSMMfHxZh4jw1JeCRYpimQEID/qXn4=
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
Subject: [PATCH v7 21/23] docs: ioctl-number: Add SCMI Ioctls
Date: Sun,  2 Aug 2026 15:56:16 +0100
Message-ID: <20260802145618.1952804-22-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260802145618.1952804-1-cristian.marussi@arm.com>
References: <20260802145618.1952804-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075905_169139_A9D25757 
X-CRM114-Status: UNSURE (   6.96  )
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


