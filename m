Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99F5CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmDVLK9y3zOvif6iYNrFANbdbZOSrWSvaro445iZ0qs=; b=MxdCOuWfH+g3wKrT3hYWMJKUld
	af3Eg/8UsOtNPcC4SrDz7gnEYcAaBreo9Tm6j06BeTyScIXSdHUSXgeFwbZgsWatqSKH+TRuvZs20
	6ovcPsSCQaO1U+G6KAkTwzYTCrNuVlBkt32JyhZxNAUSNrxFnSHVMDa66yDukmbHnQimR5m6RL9Ww
	6glYBnc4AlIQHDa+SuWCQi8TTH1ErvAs98qC2fE0E6mlKbYr/CQXrnzYro9vgGa6a6kI2xxst2EDR
	b6goELVVd6Ev8oovvRxOIfhhfdVusvBCBcS1wwgCSmv7ZZqiJrpP44+S4eNrMnZLYMWy1/N7J1wUt
	32JA/SLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8X-00000007iBJ-1mmc;
	Mon, 19 Oct 2026 14:14:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIo8T-00000007i9E-1NtF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:14:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60DED1D70;
	Mon, 19 Oct 2026 07:14:40 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E262E3F673;
	Mon, 19 Oct 2026 07:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792419283; bh=miXpFvzDWp1rgsrIkIJfHSpb/+AkGB7/fFGMtDBCe3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l9dXBqARznxrSaps1Az6u/BW5Xm0jOtXZVumEkspEArMqdZgkPfQYABcb1KFyhhOj
	 7U3xhKItwpjISLLGlM6dESb8ktfUiJMea9+SLU+88yIwD1zMY5Ve/nvtcH7e5ncUN0
	 HEREipB6KnRWOa0MGj8pz/omxa1XHRQvCr9PUjXo=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 19 Oct 2026 15:14:34 +0100
Subject: [PATCH RFC 2/3] firmware: arm-smccc: add FIRME device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-firme_interface-v1-2-27895c9cebaa@arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
In-Reply-To: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=miXpFvzDWp1rgsrIkIJfHSpb/+AkGB7/fFGMtDBCe3w=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq1iXMjM/voiX2Ms0h8f57FQMSvqR80WL6OssPU
 ovmmDE4zOuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCatYlzAAKCRBt1cPRWsUx
 MwpfDACtswE5QJhiFVWWeE0ASCXR0zcB4pqB7yJMiKcm4fBw0OSzWam1ux1itTZ2+fhhLu3FmvM
 RT4s7OaMx/MuMk8e8Y8zbOVo3pu6fcHzWGwWBt2yzA2+jPUZqwnNSo1XKAnBy3cMSwy4AnUjeKE
 44jUK6UK+i1B8TtakqUoVWw0LSkm741TJm68YkcAJOoHsyAHDYnQvzWpXZLsddJfzXI/kEPVNAo
 32PK0kh3dWRMybl1djyzZNfvXpYUW5qApM5Ttijy4Z9jq89lSK+dCmHz213DyDv13Itbgshhpuh
 vos2uj0qY5xd4q+qix9xMnoPGUtpS9QMVynspeAt4hgFGWcps/3JGFMITfuRBBVQqo8hQznORk3
 crqRHaYsFDNmu265dlmzR665lf7DaZP/39oindQ8Djn/aWXcDZKZW2mBwOpm7Xdnw3VwDDywkX0
 qL+Hyu/jF0Gtd190Fwoh/KiPzooZHrRRlR3Gc+RN96S2jVuD1PUPRUQysC6F41HN3yHs0=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071445_449416_AE689568 
X-CRM114-Status: UNSURE (   8.83  )
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

add FIRME device into arm-smccc bus to use FIRME service.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/smccc/smccc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5dc768ac4143..8398a77a2ec0 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/arm-smccc-bus.h>
 #include <linux/arm-smccc-rsi.h>
+#include <linux/arm_firme.h>
 
 #include <asm/archrandom.h>
 
@@ -100,6 +101,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = true,
 		.device_name    = "arm-rsi",
 	},
+	{
+		.func_id        = FIRME_SERVICE_VERSION,
+		.requires_smc   = true,
+		.device_name    = FIRME_DEV_NAME,
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)

-- 
2.43.0


