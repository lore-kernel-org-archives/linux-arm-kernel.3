Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E87F3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7cqfTef2M+rQft7BjRxDmXaPQowf3XdNc1QuoLJr2U=; b=XbUpGlH703pANd+MsXd3VaEdtg
	xs906eQgOVWeONpdApnWcj0MmcmWnqaZikdoMgtHMOg0F6qvf9SxWIT/CavoU9l16lRCfJrXyZron
	StEb+w0rnBj/f4OR2hMG8xcgjZbuOUAjakeyzkU3fS8YbVE4hHjgebkZKJfHV+ESwDvKsFSNeiqk0
	Vsh4hlglibni5NZkzUwVG/tYFYq6bZKKzbVNzc7oMAFD18e7/g+s2rmnqIrGM8EL3E16CTYhmOi1M
	NJz75OKlBOsOxR35fimvbFuR96ypbrIrPp+H+868lT9kuxXRIJCak5ZUxaTxDVLFY7iJjJseRtfqH
	sPYiDjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t7c-0000000A9Ht-14Yl;
	Sun, 29 Mar 2026 16:36:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6y-0000000A8rr-2lKW
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 29 Mar 2026 16:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O7cqfTef2M+rQft7BjRxDmXaPQowf3XdNc1QuoLJr2U=; b=R6mOqacywah7/aFahRlaG3heHn
	GlvlQPKIgJ1IBFn+w0ta4iporX6ypa6JEKF+EJjtpYQRaWt/59dbu6gQxAJD/Fx13qQxh7POEAmPF
	yvsvPmrtx9AlQhpBvdM4ZMzN7mhc27lQD0IDNEIWB44mLZAVHsQEZyQvspSVg6hJZLYxdbM88zqpc
	Kkp6zRBT4wF8YjvF3M3ZPr9IvO2FkHNQo21Aw+3XASlvJRHJSGzaIqNLLcysrKy4qNG5ZhEinKBOn
	PeJQwIFdE4m1HtjlW9BmVSLoo3euR0P1F5gx75Y6CpuP6SfurB5+26ktTOAK0Bfze1HfdWUismNqx
	rS3UK8Bg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6q-0000000CeZA-0q16
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:35:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA605451B;
	Sun, 29 Mar 2026 09:35:23 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FAFF3F915;
	Sun, 29 Mar 2026 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802129; bh=6wzddMfUQyGGtHJTwF0gZAbRgVKVvLunzYpai4YkSBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pSeNA74CAx7djO856jVtla60xS71CAxUgKCgH3O1AA3gBb8aLRUH8PRRntLS/wqVz
	 jDkwRcetmJ7imYb5jLHgT+JQ/8EM8YUza9rBSVnA5b6My9oejxtTv5aGE3KQ9VnAST
	 ge0ZnfIRC8AHAn+FcfQGL/cmqZm0GNHEo/is6ZNk=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
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
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 23/24] fs/stlmfs: Document lazy mode and related mount option
Date: Sun, 29 Mar 2026 17:33:34 +0100
Message-ID: <20260329163337.637393-24-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_173532_732611_BC9E480A 
X-CRM114-Status: GOOD (  11.32  )
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

Document optional lazy enumeration behaviour and related mount option.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index a775da24f320..9a5c8bf588c8 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -74,8 +74,12 @@ Design
 STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
 discovered dynamically at run-time via SCMI.
 
-Inodes are all dynamically created at mount-time from a dedicated
-kmem_cache based on the gathered available SCMI Telemetry information.
+Normally all of the top level file/inodes are dynamically created at
+mount-time from a dedicated kmem_cache based on the gathered available
+SCMI Telemetry information, but it is possible to enable a lazy enumeration
+and FS population mode that delays SCMI Telemetry resources enumerations
+and related FS population till the moment a user steps into the related FS
+subdirectories: *des/* *groups/* and *components/*.
 
 Since inodes represent the discovered Telemetry entities, which in turn are
 statically defined at the platform level and immutable throughout the same
@@ -105,6 +109,19 @@ The filesystem can be typically mounted with::
 
 	mount -t stlmfs none /sys/fs/arm_telemetry
 
+It is possible to mount it in lazy-mode by using the *lazy* mount option::
+
+	mount -t stlmfs -o lazy none /sys/fs/arm_telemetry
+
+In this latter case, the des/ groups/ and components/ directory will be
+created empty at mount-time and only filled later when 'walked in'.
+
+This allows a user to benefit from a lazy enumeration scheme of the SCMI
+Telemetry resources by delaying such, usually expensive, message exchanges
+to the last possible moment: ideally, even never, if using some of the
+other alternative binary interfaces that does not need any resource
+enumeration at all.
+
 It will proceed to create a top subdirectory for each of the discovered
 SCMI Telemetry instances named as 'tlm_<N>' under which it will create
 the following directory structure::
-- 
2.53.0


