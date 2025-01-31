Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0CAC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fxc9RCS0yJMcxzv/R39+HJdfE9CEG2gSGkEU0ozgl8=; b=j3AeyCLxK9eLogGmyCHp3at2Fp
	7+VXOZv8FwUEZ4ffaPu3uPdsTPypgJ01iW0Ff0ZVxk9KQ0uhaPG5FPBhBqnPrLDSPQ7zVMlquIh9t
	wCZNpWi8wQqou3Cg2lwr5ynu+ehmPSHHbUgUsCvun6BtL0EjPiba6d8hv0HJTYYaaxE8ascL2v/MW
	gMZUZjORiWTgcfn5MMXzKngR5UNi8pmeYg/JBdw3kT75+7EITuMllnuIjMUUjIAZE0fjgUT835yK+
	iyLltlp/7+lZRBrBrUtSxnrKYYJcozhcw0I9kXyMiiih0l+5cer7G5OVqMRo4Hhj2zdHqcDpWHBAp
	wRRPBSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpJK-0000000AWHK-1D9P;
	Fri, 31 Jan 2025 11:35:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdp97-0000000ATpp-3W5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 11:25:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDBC71007;
	Fri, 31 Jan 2025 03:25:38 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C919E3F63F;
	Fri, 31 Jan 2025 03:25:12 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:07 +0000
Subject: [PATCH v2 07/18] firmware: arm_ffa: Handle the presence of host
 partition in the partition info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-7-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=NzKYKTJax7pPW/1p5r9wLFeoyYWNp6T+H8b/gc+oDek=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQTwKrUk2nwtAsORQMj+77uPDpexNxTwmxk
 sUAJk00vreJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mIPiEAC0Dx2fkcPYfjDpwPAdLR/zezjoEdMKNoWqDAOjxWbTNbcKztt3Qywl1sd0Cha70uYIi1f
 Rv25U0ITRCmmiYuaLnfkVA/e8/O9EokNqR0xAIQXco28DbSrMWvPLsisvg9hIRNG6xOT1tf/+EZ
 vJZWMuvMivkuTlkcF2D+2emeKVrHI9AExeuQIL65d4j6YVvIaAm3FkLN5Fm5lRTA8atNDRl/qht
 an0JTBKCkaHdh8L+029OTANcU0/MpEdD0m79l1RSnOrgOKGr6U6oow5WY7IyjRcR3yJBT1gIkjw
 W2p9B1hMcu7Uxsv8REApjKLhP2VrT8Uq3lq8kbGoNAQe0hnUNIZ+xgxMTnN9wdwE5ZPAOW2ekYb
 6rfHBa3lpvN+nN+d5hsPgj/FOGsYU3TOQXLxBmYEkKJ5JnhbMQQkQ1nI0yNxUBXuSYaw50ZGn9D
 bQ8l360l1mJJ3S4xDzDP1Si7HHVtmtySQCqInQoDunAXbDOT329Zf+jS8ep2Lk8G253go86a6mp
 Ip5TghlZrXqP1W4WU0yCFWxrntIB7A3LB44giCc/miIGh4r5wOAlW3XmZ/bGmlzStsPUGkq4AlO
 iKvHDW7GVF0CNL2f3c7uk6offFlOtSZpWaxKc9sdAtrnNGK49as7WITf8DB/lFaAjVe6gbrY3T9
 mBdXsIPXapk0B7w==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_032513_922024_68AD2976 
X-CRM114-Status: GOOD (  13.93  )
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

Currently it is assumed that the firmware doesn't present the host
partition in the list of partitions presented as part of the response
to PARTITION_INFO_GET from the firmware. However, there are few
platforms that prefer to present the same in the list of partitions.
It is not manadatory but not restricted as well.

So handle the same by making sure to check the presence of the host
VM ID in the XArray partition information maintained/managed in the
driver before attempting to add it.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 67d5be261d83633805c81dd84fdfc2b5c702f3ca..54777055d54f5bf2dba1128e6a91bd1c0ece04fc 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1489,6 +1489,10 @@ static int ffa_setup_partitions(void)
 
 	kfree(pbuf);
 
+	/* Check if the host is already added as part of partition info */
+	if (xa_load(&drv_info->partition_info, drv_info->vm_id))
+		return 0;
+
 	/* Allocate for the host */
 	ret = ffa_xa_add_partition_info(drv_info->vm_id);
 	if (ret) {

-- 
2.34.1


