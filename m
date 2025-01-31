Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69ACC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6yaTCvuf266S3Vbr6sCPa+5pcMy9vqb5mSr/mPIMFs=; b=DNO4ibNs3vxtWPp14BsUUs97Tw
	GG31KURVIx2dsNHZGouEIyGhTUNkKTiXwCPZmFAFio3DVN5T8X27cDnSZ+wjXGOj0q4m84dTYUjZU
	q23Ubf02meprz0lHsdziC8JMCj17XDZ0fAcqwr9ESaNlcJQtpBoJQQy7nICgEK6P8JbtfZFQfNY3i
	Y1ZsYScwFQJ2FR3gJ4nZ+JG4Rpabl/wZP3Jvfky9teTg9cKjmh90BRanbJqFtOmesJIUouWHBAB1J
	PC4g+pPldrkjKFPidOOsWKg7RFHjbkXEeR0vk1IllJ005LMGbYtclstUAR/wMSCvockYHird97qWx
	CnRCFStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpPj-0000000AX4A-2SAt;
	Fri, 31 Jan 2025 11:42:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp9C-0000000ATpA-3RTp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1837AFEC;
	Fri, 31 Jan 2025 03:25:44 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76ED3F63F;
	Fri, 31 Jan 2025 03:25:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:12 +0000
Subject: [PATCH v2 12/18] firmware: arm_ffa: Reject higher major version as
 incompatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-12-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=dn+DuSMwXmxU+1JfTRIj8nX1GA6XGv4XdKBQ+XxFVgQ=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQqqizgtsYtZ73bbYEh3Wj6nROHylyl65QS
 auIrx9J3VqJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mJKpD/43GTqRDy1jK37kf+bolvnOdK/SY9f3bCx+Pudp3IvfrG/7kqhrU+jmHphcOpyvtjC0pI9
 tfdamBHGY2NnoVT4IXeJI7a1hugCsv9p1RFDbhLwmFMK1n2iQxXvcrFlMECnVkNreknobgLNwhG
 /phr5q2w9RF1/MH3HjPooxNYUqlh+Z3XvDQoaVndoZhCkdEef+X8PKr+8jPkDT1sK7a65qDuLcc
 gb8D2P4TsJAuGyEdBFZwWx7kxYHSpzxMN5pHMmzV3Nc3y7GYFYdRDL3u7Md2+xd0nSb4nDuPMHo
 ayCGMj46nJ19F+HMGGdAHiGlOf8Rywm+NjQC0UJ60eUU7hNApnX/3oM9NYJBvkZrGsV2Zv0KDnq
 MTx6T7Eko8KcJ8Ej/LIyUQnkWLDwazPiBYJ78z0M8QVDZz4NtSM0jaszQrSUMUGrT2BrKhgMQlx
 erovKG93QaRU/NWNOcKQzR5/9Dj/oAU7N6qXJBgF0iYsJ+LfqHH8ylWDTnzHwRclPHPvf9Q2ZHh
 3dWRoQxE9afol2H8RMa/rIE4OuYskjD8STMqPEUZ665qwoMyLEr/4n//LJzvyQAJG0nYx1aH2+0
 4awiCuW2/PdvH2QjWiNxkpKwjASbISpe45ahDYyrKxG0cjX5Pni6+/gPLhP6bsE/NOCWo2BbxKY
 yr1JeYspMtSwf3Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032518_916230_6CCD2BE3 
X-CRM114-Status: UNSURE (   9.86  )
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

When the firmware compatibility was handled previously in the commit
8e3f9da608f1 ("firmware: arm_ffa: Handle compatibility with different firmware versions"),
we only addressed firmware versions that have higher minor versions
compared to the driver version which is should be considered compatible
unless the firmware returns NOT_SUPPORTED.

However, if the firmware reports higher major version than the driver
supported, we need to reject it. If the firmware can work in a compatible
mode with the driver requested version, it must return the same major
version as requested.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8188c8dd3ed6ceb9e9966148b42ef2f88baa6dd3..1a0f2d1d7a2220e341d4e78240e799a2919fca30 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -150,6 +150,14 @@ static int ffa_version_check(u32 *version)
 		return -EOPNOTSUPP;
 	}
 
+	if (FFA_MAJOR_VERSION(ver.a0) > FFA_MAJOR_VERSION(FFA_DRIVER_VERSION)) {
+		pr_err("Incompatible v%d.%d! Latest supported v%d.%d\n",
+		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),
+		       FFA_MAJOR_VERSION(FFA_DRIVER_VERSION),
+		       FFA_MINOR_VERSION(FFA_DRIVER_VERSION));
+		return -EINVAL;
+	}
+
 	if (ver.a0 < FFA_MIN_VERSION) {
 		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
 		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),

-- 
2.34.1


