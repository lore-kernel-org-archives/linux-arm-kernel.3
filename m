Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5763BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiBRqPKPwoTjvCLxWk9I8YtTWfokUqMiJIhsMR9Lf5Q=; b=zLZxFJJ2XX4LEMCyzIpJmaIKNl
	l0ZWi237yh1vODzH/aan26Zs4Nbz3XWNRUSIhIAoNO5Z+k8HTKc5kRaCBQUl/BipWuoW9Z3tcd5hk
	XytaJcI8BAaUOaxMcfcJldpQ3HQm5Y06hVmCYompTPibfpkJh55NIU9CTQfMnB93XVlQky6ug2NSL
	3t/VetuYGNtu7cpvF9eMk8EJeWU/fmDwXEQCS/Go8+AqPEizn3Py8/zuk2GIHlH4xGY1vjLKguRG0
	Bbwf1V+rW9CYuEDpwhGAIHydgi199r1zXg0SKHYrIjvnyZ6V8D8l1zXfQOlvPtifYUk0vPBnKEWId
	9G+Za8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3RF-000000059gh-0XsV;
	Mon, 17 Feb 2025 15:53:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3DZ-000000055Y5-0vjK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E6FA152B;
	Mon, 17 Feb 2025 07:39:52 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39E633F6A8;
	Mon, 17 Feb 2025 07:39:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:45 +0000
Subject: [PATCH v3 04/19] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-4-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=kZ4/y9DUzlAVsB+B8wZcgeoxtKetDWyU/DxHjgkskJo=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1guejv910xM8qLwgUybkj8V3zFB0dE+XXyEL
 ysdpk5aHfWJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mB9jD/9pahw2bI9ZGgs+Lk8rfGttLPSDcZKs/caLMhRMeHBrLa98jGOCsq7AAOmndqBvzmxi475
 GqdtBeW1KuVIuwXdS4ICus1lAcDpyhZpYK/L2MEHSn+CR0fX7Eutks2uLS+exiaKBXVPb+lcKG6
 zOM1YJAc1T3UZ9PqECQWbIZlVmV0BxsIEmyvyyEO9yPULIv4/0aUiHQynQls2fPFpYKeD0PMlTY
 IAuSl8lpSvwfp7rXnBJ5gNfbPGMFoIYlsZ3NAJpyeKQf6mN2BOSCBtZSe8uLkOB5M+gxUY7HvmG
 OtiTcksj1+tv99gLS4x12FRFX2k/9SF6UbH1Qlf8t/PAaEaqNsFuVPT347VJjOk3ewrGU6WFj59
 dABMEXM6g1Rvv5eKFXsD1qSJUiLGwU9WikpXYSXfFydH0keAh+gje6kEg2mGrrlhmCJ4HPJ0eEc
 kb11fIAYwSFlaa0ARoDi+f53GK5kpmz+WXeh8/NYJTOM7GL03QocyIBeKEwWGb2eXRkuQeHp6VJ
 bN0VQ5yMyAHqO5MhMl5MFO1RAp9S1kVlA1yb9Ayjl3+57gdiTX676BT0vLbNuR7XfU0lKAtm/Xs
 Ao9zj7VMe/lZFd520GOWh7FTmDVnCsG0vlp9YtvIgMQmx+2qht/76Sf8a93x7D5pujag+NXj+C1
 J4OC1ciJuH9wqJQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073933_313242_5A370287 
X-CRM114-Status: GOOD (  13.18  )
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

Currently the FF-A driver doesn't support big-endian correctly. It is
hard to regularly test the setup due to lack of test infrastructure and
tools.

In order to support full stack, we need to take small steps in getting
the support for big-endian kernel added slowly. This change fixes the
support in __ffa_partition_info_get() so that the response from the
firmware are converted correctly as required. With this change, we can
enumerate all the FF-A devices correctly in the big-endian kernel.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 037e0d684994fd30971f40bf139367d1e45c1bf0..bc6ffd25ad2e2fea0fe3610cf896718dbed8f0ad 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -276,9 +276,21 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 	}
 
 	if (buffer && count <= num_partitions)
-		for (idx = 0; idx < count; idx++)
-			memcpy(buffer + idx, drv_info->rx_buffer + idx * sz,
-			       buf_sz);
+		for (idx = 0; idx < count; idx++) {
+			struct ffa_partition_info_le {
+				__le16 id;
+				__le16 exec_ctxt;
+				__le32 properties;
+				uuid_t uuid;
+			} *rx_buf = drv_info->rx_buffer + idx * sz;
+			struct ffa_partition_info *buf = buffer + idx;
+
+			buf->id = le16_to_cpu(rx_buf->id);
+			buf->exec_ctxt = le16_to_cpu(rx_buf->exec_ctxt);
+			buf->properties = le32_to_cpu(rx_buf->properties);
+			if (buf_sz > 8)
+				import_uuid(&buf->uuid, (u8 *)&rx_buf->uuid);
+		}
 
 	ffa_rx_release();
 

-- 
2.34.1


