Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191E2C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4zDcGXV0Wrr6UrcV3hneOvPmBkSl63aNO9Jl4ntVeo=; b=rX/HDaHUXH2Zz4feouGcZSXtYy
	+AsAMHjo5CM30bvSe6QWyqwvLjUIuYJ9eDUF/PdJphbWFAioQIF/Yty4bdbvoIwrixCyV257oWv2l
	iit6rNaFC7Wg7UUeiodCu2FaFU585BjP6i+lrDhPVFw5u9mRyDYIx9nNxYWbOPjMF91+xXwaHSCPQ
	a68lFb05bHcvzCpYd0f4DlopJW/KFvX3A4w21Phm3rz9X3mUAxXu5s8fsGLzoD5zaaaE5TCyYqvy6
	twfcrtkrMLVCmWiqWjYBGOAOXrGeT4SbYhz/s9LeitYCsbRlirC4qSypcYUkhA+o7KPo3bqBRbAZN
	nRu7gogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RRQ-00000006Bi3-0vOC;
	Tue, 15 Sep 2026 11:35:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RRA-00000006BJg-1poD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:35:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B5D21BD0;
	Tue, 15 Sep 2026 04:34:50 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D2AD3F86F;
	Tue, 15 Sep 2026 04:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789472093; bh=OY9M4kkCabp+bV4ooKfCZXYd5uvoGme47JFL/fchmm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PFL3l9JBUgxUIxK2x05P+HdgTK88s1Tfe5qipYp9uXSOuU0fXAOKOrBrZBEIfkoYU
	 IYAbT1gL1IHrNUncP5pQgoj7TaQrepwRUyYa5nUU0B2MeuzLBke03UWQXzre+jrcqS
	 /POJl+B7DLSnizqbHN2UqmRA5W1/n+oYwNhPRutI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 15 Sep 2026 12:34:37 +0100
Subject: [PATCH v11 2/9] coresight: etm3x: prohibit modifying cntr_val and
 reset while session is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-separate_etm_cfg_v2-v11-2-d2b258d51747@arm.com>
References: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
In-Reply-To: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=OY9M4kkCabp+bV4ooKfCZXYd5uvoGme47JFL/fchmm8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqqS1TmYIRhSMz5EhthjcSwJUaxwuP8BpyV1qsT
 UcrhEL1dwaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqktUwAKCRBt1cPRWsUx
 MzeNDAC7pg2DnobJUGrqYeiX7Jh3wLOoJOfPfXcMFQ6ikhLAt+4WFTQI/IpZouq+NTJXtAb6KZU
 B7sAyTKTyBpN0KfTsjozkMko6ZUgc7k97C+l/rYSdFf0Q214QI8QlQUMKslSiaWeCGWv1uk9cjD
 ZrPDmdRQKDOJzy7cwYWQTWuaR3fO4BNa0Gv4fYMaTfmrfCWaXQpY1ewGkcZyTioRUEcT3aKU0J6
 QincnIEvrKBxXPErZA72fbOuMtJHnieyAjRlvpQWm5lWjUIAm4tDXRaJtY2qLn1Qmmdgypjv41G
 MtWWPPsPTgJRyfTzEAAIeaVIEeg/8MC+KSaCMFXQtd51OdHSlHPr8tZ5OW1N0DpY7BjHOcadCO7
 vL6AOfh1egSer4UoD9eRcyehAXXqUFzUfbXef30MKxuBAFLtaTJCLeFR8ifE1vFSzVZYbnaoj1B
 pz+7bB6Kr2VVI8ZmId5ef113VnfGdMkzFByoGrZ0ywTsBbFc92ZYnbzTwRcbJSAw826gM=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043457_589651_35534F82 
X-CRM114-Status: GOOD (  12.41  )
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

cntr_val are overwritten with the values read from the corresponding
registers by etm_disable_hw() when the session is disabled.

This means that any changes to this value made while the session is
enabled would be lost when the session is disabled.

Also, reset shouldn't be called while session is enabled.

Therefore, prohibit modifying cntr_val and reset while the session is enabled.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b3c67e96a82a4..d4846d6364945 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -74,6 +74,8 @@ static ssize_t reset_store(struct device *dev,
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	if (val) {
 		spin_lock(&drvdata->spinlock);
@@ -744,6 +746,8 @@ static ssize_t cntr_val_store(struct device *dev,
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
+	if (coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	spin_lock(&drvdata->spinlock);
 	config->cntr_val[config->cntr_idx] = val;

-- 
2.43.0


