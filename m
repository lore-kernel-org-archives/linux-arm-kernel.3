Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE203CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkp8rZF4lVA0oNQP0GR60xzREQudRVAEorQdb1ogVkw=; b=s9O/UA2WEY3nbetA+VwyiK97pN
	PC6tIOZXRZaZNT4Ciq1/HE1LEgy15qa5HkCBLAbr1IdXg4QjkAWgtA7/rjMB7Xrxn8kAYC41VfYwu
	GWDP+KKdht4s65oNGNA46dPtbwzVmXo0krSHv1M9dcAR6JowWg6pqaBXE0pYcyXzBPpmgMrapbRx7
	eGLLMgFO6VhizT5cTW0w5G5w4Z8TMhYGFRGLR0q+H8VI1BzNiR7lOqBpOAZ0pZ2lFjd22vgV/zgQG
	xW2sSLtj/ISJKVTJeBI440L3wrCfl4P0cqlLXpYJq9q+tg/DlJN20ktbUN4oDIZMn/uCyIU0wDVvg
	yPlcW7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAXu-0000000Bh7c-2vT9;
	Fri, 12 Jun 2026 22:40:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAXp-0000000Bh0t-1glg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:40:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE71A49FF;
	Fri, 12 Jun 2026 15:40:03 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 819793FB7F;
	Fri, 12 Jun 2026 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304008; bh=2xFb0yd4e6PVKxK1zP38kbrj0J9BwkRIv50r5RQ9dow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zg39thJAVlH1mNgA7oz/sukNr8YuChQlDHrmMcSoZg3Nqgwu1/RKQWwk+GSPDjTaZ
	 NorWhjJuK/qCOs8QQmmQRW/gSDlNVCul15/5M3CBJv1f5EXS9Acuwl/KR7W8LnV2OW
	 Hd1smxlreZ9G+NW02ok43EkvlqO5OZDUgvWae7a4=
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
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 22/31] fs/stlmfs: Document ARM SCMI Telemetry FS mount options
Date: Fri, 12 Jun 2026 23:37:52 +0100
Message-ID: <20260612223802.1337232-23-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_154009_532683_2A46DEF2 
X-CRM114-Status: UNSURE (   9.17  )
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

Detail ARM SCMI Telemetry filesystem available mount options.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index 123e0e68e041..a15da85b9971 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -109,6 +109,25 @@ sense to allow this FS to be mounted inside a container.
 All files are created world readable and, where needed for configuration,
 owner writable.
 
+Mount Options
+=============
+
+This FS supports the typical mount options needed to modify, at mount time, the
+ownership of the root and all of the underlying inodes:
+
+ - uid: id of the owner of the root inode and all of the files subsequently
+	created under it
+
+ - gid: id of the group of the root inode and all of the files subsequently
+	created under it
+
+ - umask: a standard umask filter to be applied to user/group/other: defaults
+	  to 00222
+
+Note that all of the above options are explicitly designed NOT to support
+a remount operation, so as not have surprising effects on permissions of
+already discovered/created telemetry files.
+
 Usage
 =====
 
-- 
2.54.0


