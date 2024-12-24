Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7668AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abfUfSyO0Ovqz60dSjdmWlKLDKX9WWl1WsL2R6WWMKY=; b=p5pq24Pln1dxa02ovvbsg3Unao
	doJwaZOUJ8oQZp2Bqir+5C9+X/P48O29iFqrfgRIBW2kQFuB6t3RA5fS1ReNsSTexKzgYLCys4/za
	/S/ZvxveJbfMSrlfHIxlwwKpwC0V48TO4VYIgf9afhr6DVOI7bfqNTlbWeQcAlat1UwbDgELnDtTw
	5vQO11MIwTrTsLvaEzGr4jbazUpoRiev8yO+LAQ+qnoZs7yEWBu1YaYyJttfenbwPatWzAVbR4q/J
	tcre3kV7DJZzXj3EKyP/qIdpK/A27SyH9kFDYWOa9JhXGaA9HsqUrun2hO1Ygl2zEnSrCTOx7qYDp
	WgEhI5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5Wr-0000000C6X8-3u9u;
	Tue, 24 Dec 2024 14:04:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TG-0000000C5xe-0Xk8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF3A61CDD;
	Tue, 24 Dec 2024 06:01:39 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41AC43F59E;
	Tue, 24 Dec 2024 06:01:11 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 24 Dec 2024 13:57:49 +0000
Subject: [PATCH 2/5] firmware: arm_ffa: Replace UUID buffer to standard
 UUID format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ffa_updates-v1-2-01233aba3e1e@arm.com>
References: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
In-Reply-To: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=an0T8BaHmmjnOIWFrg0XcNclda/TDCEpL5ml8sjKwio=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6lhi4yhEDslzvYCrjWKpW44hclMgOQaNwhi
 YMs6mHQP7+JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mLDyEACrsAezKlrginjjexiWtgrP7eT8IBa0q8aJSh0aqu7z8PezFY1ZgvF+kEjCexmJPryJGSZ
 ExnfLADqV43gJF/9cf6XUUfMit2MW9jR5Z9eqbRjr1+nGoSyxU1vcploxYGZooL0SwSClZCwFxt
 xPygmR2sAQ7Q9PIi+8cB0pYgMRfH6Bu6QWu98c9Ckq0DDdvydoMQpp05I7yWwKAO2qDBUlAKqE7
 0WAB3vG5sXwadYzWRwaE0YcDfyeVekh4Qa2cYlKGasnE2sjfzPOym8D2BryK4iFMQvYJamkRtaQ
 jFA8iIWy18sf3/zAWCI48SaJ361jC3gp9XrbWKqOmPck47d6fHjEW+XZINkH9W/gA0qTL0yeBnR
 9kWa9hzh5JODhjIOHxAwS2T7dy9qrVdbgE29uOshTB/Zvbs44EBaUCP69XhDfNRbzNr7Fb500kU
 Lz0LJsafAgGq7+NYByXsqxepIUEjTL5GPGD4/L+H3L7SNP6j2f9D1jme48SbakHpAQy1Woh5rIF
 QmrKljaKK+RQXhmDFoBrb3LFIfjIncKr1YWhfDmG0HBmfAMvQ5+KKgSPk5bU5rKrpoAXQIZiAVP
 UExZVOFa6deY4syNjd6BrRXGffcxEeP1e1mIE2SAzEORRT7PWMA+wm0rONKynmtaOzVsO34jj2q
 0cj7zi87gOU+tzw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060114_222370_785CDA21 
X-CRM114-Status: GOOD (  11.37  )
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

Currently ffa_partition_info structure holds the UUID in the format
compatible with the firmware interface. However, most of the functions
in the FF-A core driver deals directly with uuid_t type.

Replace UUID buffer to standard UUID format in the ffa_partition_info
structure.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c | 4 +---
 include/linux/arm_ffa.h        | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 52b1f09209a0e51e321cd23a69aa7e4c4daa8dd1..a90e2faa990219574ff20b8f573dbb7ca76137d9 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -192,7 +192,6 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 		    const struct ffa_ops *ops)
 {
 	int id, ret;
-	uuid_t uuid;
 	struct device *dev;
 	struct ffa_device *ffa_dev;
 
@@ -218,8 +217,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	ffa_dev->vm_id = part_info->id;
 	ffa_dev->properties = part_info->properties;
 	ffa_dev->ops = ops;
-	import_uuid(&uuid, (u8 *)part_info->uuid);
-	uuid_copy(&ffa_dev->uuid, &uuid);
+	uuid_copy(&ffa_dev->uuid, &part_info->uuid);
 
 	ret = device_register(&ffa_dev->dev);
 	if (ret) {
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f65948b05991732358855cdc31b54adb..abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -238,7 +238,7 @@ struct ffa_partition_info {
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
 	u32 properties;
-	u32 uuid[4];
+	uuid_t uuid;
 };
 
 static inline

-- 
2.34.1


