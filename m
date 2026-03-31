Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD1410F930A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 23:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyXOvXecsbCli5fUuOAvQ69jimjkm/HRTXetPurxhOQ=; b=TQsex58+d0Antvt66OK4xT2T4c
	khN1n2U1Vu4Dewb/1PK2NZeq2O1IKBqGsTq+qS4/QwwQA2Swr/dmiPiIq1Ftae+6s+Ht7YAMZbAd5
	Zatob8G1Fur/PX44DSopZSXqfTcqpmpUEdM02bRGfkXDKx6fGL8NnSpAZDZF4l2uMlzm35ibwYNCb
	ZPJRwDWQDc8Uajyff5YQISC4ml9Xyh1/BPx0mzdlNMvXi6soB6JHCJhge/Rp9Nel/b6bbJDqK+Y5l
	le4pIh9PlEdsHHqhvaEtSlsn0Vcf0U9jk76vhLn7MbtalzBdPAwsVe1R527ozkf5+7uB7MvXWXyub
	oWeg23/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7iQ0-0000000Dfkq-0yhM;
	Tue, 31 Mar 2026 23:22:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7iPr-0000000Dfhl-3Hyo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 23:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DAAB44558;
	Tue, 31 Mar 2026 23:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F32AC2BCC9;
	Tue, 31 Mar 2026 23:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774999354;
	bh=QC+/tqe1/wX3mgbcC+PR25ooF/RqKPuOwtdoO9U4yTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JuSTj4tHq2+YsBAEbcPsvI6QbbqD+H2GAvp6bE6TYbafBHZg1v0TgDIdr5obxUnVa
	 Fh1DK8wuDW7WFRM9DO5bG23UV2HzDOd2Kq37fSwmHh0BFbT6fny4UlcAIqcuUt0qcx
	 rY0Zpg0V0jkRyo62FEQKVjTRReYg0U/wJbFl0qMRyO7uNpVHfczbnndmm+CZLbrXEX
	 dLMldEHr/HzAmdWk5jqL3pQb+5MlT6gjwdWZPZ7yjMMjY45HUY5TBYtYGk1prNRegq
	 yFCJ/q+pyF2zGR5TEmjcO18FKytr4HOVVQ2jP8eef/r4fYwznKz2JGgVAZHbCXrf8p
	 NFEhR4MPlAMlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0569910F930B;
	Tue, 31 Mar 2026 23:22:34 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Tue, 31 Mar 2026 23:22:19 +0000
Subject: [PATCH v10 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-max77759-charger-v10-4-76f59233c369@google.com>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
In-Reply-To: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jagan Sridharan <badhri@google.com>, Mark Brown <broonie@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sebastian Reichel <sre@kernel.org>, Amit Sunil Dhamne <amitsd@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774999353; l=3004;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=EfsBhqbhWkOWcpl6lnnrrFZd6U20wlHL8pMi8geg4Dw=;
 b=8SnUCdVnNvBOuxFKx0mY+BFXadDyNmS+pNAGroFaPxnnnFjJszZYb3XPGU7KnX3Ah4iFaQ14u
 kMXZaNKamdaDxRE3d2kcAh4KMnLpP+A7JwXaKor+SxkvvBmk21k9wau
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_162235_896121_7FE78EF0 
X-CRM114-Status: GOOD (  18.36  )
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add a helper function to find the selector for a given value in a linear
range array. The selector should be such that the value it represents
should be higher or equal to the given value.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 include/linux/linear_range.h |  3 +++
 lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index 2e4f4c3539c0..0f3037f1a94f 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct linear_range *r,
 int linear_range_get_selector_low_array(const struct linear_range *r,
 					int ranges, unsigned int val,
 					unsigned int *selector, bool *found);
+int linear_range_get_selector_high_array(const struct linear_range *r,
+					 int ranges, unsigned int val,
+					 unsigned int *selector, bool *found);
 
 #endif
diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
index a1a7dfa881de..c85583678f6b 100644
--- a/lib/linear_ranges.c
+++ b/lib/linear_ranges.c
@@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct linear_range *r,
 }
 EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
 
+/**
+ * linear_range_get_selector_high_array - return linear range selector for value
+ * @r:		pointer to array of linear ranges where selector is looked from
+ * @ranges:	amount of ranges to scan from array
+ * @val:	value for which the selector is searched
+ * @selector:	address where found selector value is updated
+ * @found:	flag to indicate that given value was in the range
+ *
+ * Scan array of ranges for selector for which range value matches given
+ * input value. Value is matching if it is equal or higher than given value
+ * If given value is found to be in a range scanning is stopped and @found is
+ * set true. If a range with values greater than given value is found
+ * but the range min is being greater than given value, then the range's
+ * lowest selector is updated to @selector and scanning is stopped.
+ *
+ * Return: 0 on success, -EINVAL if range array is invalid or does not contain
+ * range with a value greater or equal to given value
+ */
+int linear_range_get_selector_high_array(const struct linear_range *r,
+					 int ranges, unsigned int val,
+					 unsigned int *selector, bool *found)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < ranges; i++) {
+		ret = linear_range_get_selector_high(&r[i], val, selector,
+						     found);
+		if (!ret)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
+
 /**
  * linear_range_get_selector_within - return linear range selector for value
  * @r:		pointer to linear range where selector is looked from

-- 
2.53.0.1118.gaef5881109-goog



