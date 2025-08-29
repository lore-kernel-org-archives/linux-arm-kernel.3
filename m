Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92210CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AHA2He2eucznMnQB7HWbxknFKskg4jkSSpYcfB9WZf8=; b=H3e5YAix4Nf6i2zL3QJFik8GAV
	27nrrTuofzKjPYszhja9K651rzxdvOphVy5qsgv+SMql7aKOtfu2SVcMtc+DX+sGuyU5SI+hBIxPJ
	l95B+I8OUhwqR50QTG3T44fMsrqPHDjxf3m1HO2TBnEX/ANuRe1kBacxC6BT/7rKIQCKWONMLBs9c
	DlEKAsD7M5JEED1v2uZ70X6Ma5spVRaw8beEH6verU1JZcmz9a0SHfAIv2K/6CugMK+iI9jjuz250
	rJQ+dcXmI4k41tKVENMUM1zRXG/ZQxiX0CZNheHo7/AKCBRUm264Y4xS2K3SToiewgpUA7QlY2aCE
	e7Qzskcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us345-00000006Yg6-1m68;
	Fri, 29 Aug 2025 17:39:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urz4t-00000005oP2-2TeL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D172760142;
	Fri, 29 Aug 2025 13:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FFAC4CEF0;
	Fri, 29 Aug 2025 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756473818;
	bh=uftIey/kDewVzHrnVcmLL9rZu1wmE0j/IP3oDq/orCg=;
	h=From:To:Cc:Subject:Date:From;
	b=PJuP1z9eXFKD227sW1+apYQKx4mRlPB33arzkfsePLcHJtm0ctJwbjDz5EEfcfJfr
	 EGX4FPrdYYHFYtBjKnr9aKnDgY6POkABESlAvsBLQ+3QFppyeps+HsQ4kef+zdCp5N
	 tMlBM7tjaxIvv1OS8yWleE641mW/ZXL1bz8qiS0yaUvR5sE5nf1fHDN6wV3CCELrLc
	 F8D+zCkSMBxmRH8pne717bGqaBXBVzCh69D0ztIVyhunYOGYRYEu3hw3DKvLwzR/CN
	 Brm5Rs9FhJs/WagMKa6UMFRKIYPNKdUZWJ/TJ5Y1ffuZ8T08xwiy8tRDOMVk2LLw2w
	 tgMnsEPIq1fyA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urz4h-000000007N7-3tyo;
	Fri, 29 Aug 2025 15:23:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Date: Fri, 29 Aug 2025 15:21:52 +0200
Message-ID: <20250829132152.28218-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The quirk version range is typically a string constant and must not be
modified (e.g. as it may be stored in read-only memory):

	Unable to handle kernel write to read-only memory at virtual
	address ffffc036d998a947

Fix the range parsing so that it operates on a copy of the version range
string, and mark all the quirk strings as const to reduce the risk of
introducing similar future issues.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220437
Fixes: 487c407d57d6 ("firmware: arm_scmi: Add common framework to handle firmware quirks")
Cc: stable@vger.kernel.org	# 6.16
Cc: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/arm_scmi/quirks.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03960aca3610..e70823754b0b 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -89,9 +89,9 @@
 struct scmi_quirk {
 	bool enabled;
 	const char *name;
-	char *vendor;
-	char *sub_vendor_id;
-	char *impl_ver_range;
+	const char *vendor;
+	const char *sub_vendor_id;
+	const char *impl_ver_range;
 	u32 start_range;
 	u32 end_range;
 	struct static_key_false *key;
@@ -217,7 +217,7 @@ static unsigned int scmi_quirk_signature(const char *vend, const char *sub_vend)
 
 static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 {
-	const char *last, *first = quirk->impl_ver_range;
+	const char *last, *first;
 	size_t len;
 	char *sep;
 	int ret;
@@ -228,8 +228,12 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	if (!len)
 		return 0;
 
+	first = kmemdup(quirk->impl_ver_range, len + 1, GFP_KERNEL);
+	if (!first)
+		return -ENOMEM;
+
 	last = first + len - 1;
-	sep = strchr(quirk->impl_ver_range, '-');
+	sep = strchr(first, '-');
 	if (sep)
 		*sep = '\0';
 
@@ -238,7 +242,7 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 	else /* X OR X- OR X-y */
 		ret = kstrtouint(first, 0, &quirk->start_range);
 	if (ret)
-		return ret;
+		goto out_free;
 
 	if (!sep)
 		quirk->end_range = quirk->start_range;
@@ -246,7 +250,9 @@ static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
 		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
 
 	if (quirk->start_range > quirk->end_range)
-		return -EINVAL;
+		ret = -EINVAL;
+out_free:
+	kfree(first);
 
 	return ret;
 }
-- 
2.49.1


