Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941EACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRIx+h29v+wDRALSgCMC54JRrvN+ImyEhpFsn0qjpS8=; b=YN6DcYuk6BfNfBRHd8MdhO2rlA
	gXfLX/tauRX8Y8Cxt0NeuEg3yqFBBxfaarFZuUmY2lxqmc6VtyBT4/g+lkYnG+7AZ3wuh5qQ44xb4
	xvSf1q2n7vpw5PbVFO9WPwp+WhziHzOcOwqLYNxCElIG9eYBnmAX8agjXgsukvi7ZGgeW7sdK66KJ
	RppnUUjxoEVcp7XTmuoArA6w2k9MQMDXJMZow0uxGW6RUJBvgSio0K0MmiVL4jyRXTmKNbrVHs40I
	0CJ2OatbvN8aOSfwfCH200DGPsEHtJx2pACLKnsOjUW4NcmsGt1kk36IZAxFt/VLKIRysw/WLpNfa
	SCZ8N6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAY4-0000000BhLg-2Zzx;
	Fri, 12 Jun 2026 22:40:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAXz-0000000BhE4-1SNL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:40:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 267703543;
	Fri, 12 Jun 2026 15:40:12 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 248CC3FB7F;
	Fri, 12 Jun 2026 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304016; bh=3/illUbUe14yM1bBO0POMgNIA5fhxuEisKxh0m03C50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0ZCIAEEdEfSoo2+PrVYMP6AzeKkPWnpkG4y0OyewQJ+EapPUP03jYl7TDCjLd4mS
	 8E5vO559u+tXLjrZ/k64oiLgR8WBFzlz9uTFVCeZ6u/BC6Q8V/nTSpplWwyax0Lpg8
	 v2fEmWV7nxUU9sDVhhHyqjS7IqeqHGvXiS98sUbQ=
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
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 24/31] fs/stlmfs: Document alternative ioctl based binary interface
Date: Fri, 12 Jun 2026 23:37:54 +0100
Message-ID: <20260612223802.1337232-25-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_154019_492150_66C262A1 
X-CRM114-Status: GOOD (  11.26  )
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

Document the additionally provided special files and their usage in the
context of the alternative binary ioctl-based interface.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index a15da85b9971..0c7b7c006709 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -143,6 +143,7 @@ create the following directory structure::
 	|-- all_des_enable
 	|-- all_des_tstamp_enable
 	|-- available_update_intervals_ms
+	|-- control
 	|-- current_update_interval_ms
 	|-- de_implementation_version
 	|-- des/
@@ -160,6 +161,10 @@ create the following directory structure::
 	|-- tlm_enable
 	`-- version
 
+.. Note::
+	The control/ special file can be used to use the alternative
+	binary interface described in include/uapi/linux/scmi.h
+
 Each subdirectory is defined as follows.
 
 des/
@@ -220,6 +225,7 @@ values, as in::
 	scmi_tlm_0/groups/0/
 	|-- available_update_intervals_ms
 	|-- composing_des
+	|-- control
 	|-- current_update_interval_ms
 	|-- des_bulk_read
 	|-- des_single_sample_read
@@ -227,3 +233,21 @@ values, as in::
 	|-- intervals_discrete
 	`-- tstamp_enable
 
+Alternative Binary Interfaces - Special files
+=============================================
+
+Special files are populated across the filesystem so as to implement the support
+of more performant alternative binary interfaces that can be used instead of the
+main human readable ABI.
+
+IOCTLs Interface
+----------------
+
+The ioctl-based interface is detailed in::
+
+	include/uapi/linux/scmi.h
+
+The filesystem provides special files named *control/* to be used with the
+ioctl interface mentioned above: note that the behaviour of some of the ioctls
+is dependent on which *control/* file is used to invoke them (as detailed in the
+UAPI header above).
-- 
2.54.0


