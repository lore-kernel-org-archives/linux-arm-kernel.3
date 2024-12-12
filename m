Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1mUrluCnJ0fPEMknV/0+7Ek1RhvmPJezxVlC9+5fiE=; b=Z6Zk5HPL/JzHhakdjJBx5Zj5RQ
	8zlFAIglJX9l9Vi7+UT+2jVs1ejEKcg1b5VEB2nzfvyIMxUh+exxhwBZxg8HbWraLR5p3FgqJELlN
	jmLppbT3U/20Y1SJKZpP8OC0BaeLKngYy/EgzkNNC+gSCcV3gd0rEA60nvp+nC1E21XiG4RXxsyOQ
	Xc2VjBaf0w5RetKNGKzaemjhcGkkJFzyNap1JWGbpf326opmFFhCpkf3UHmudd4JsDROP0NNIh21I
	JHVqutKpevU7nkhA/tC9+E1ZWFDMc7Z2F4uW57Q42lYc0WH/+KGoIxrjhyXHz7xdmrxXYraJGqas1
	apGZgj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmJe-0000000125b-0fd5;
	Thu, 12 Dec 2024 16:45:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlIj-00000000mvP-1drA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:40:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5390B1764;
	Thu, 12 Dec 2024 07:40:54 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436303F720;
	Thu, 12 Dec 2024 07:40:25 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 1/6] arm_mpam: Clean up config update checks in mpam_apply_config()
Date: Thu, 12 Dec 2024 15:39:55 +0000
Message-Id: <20241212154000.330467-2-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212154000.330467-1-Dave.Martin@arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074029_468784_A186C0E0 
X-CRM114-Status: GOOD (  14.30  )
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

In mpam_apply_config(), a simple memcmp() test is used to check
whether the config passed by the caller is already installed or
not.

This check will never find a match except (very occasionally) by
accident, since the component's version of the struct contains
things that the caller won't pass or doesn't know (such as the
garbage collection record).  There might also be random padding.

This may result in MSCs being reprogrammed unnecessarily.

Instead, only compare fields that the caller specified.  If
anything is present in the caller's config and doesn't match the
installed config, paste it across.  If nothing was pasted across
then the MSC reprogramming step is skipped (as the previous code
attempted to do).

Signed-off-by: Dave Martin <Dave.Martin@arm.com>

---

There are comments in the code suggesting a change of this sort.
I may or may not have gone in the right direction with this, and
I have only tried to clean up the behaviour rather than optimising.

No attempt is made to skip unnecessary MSC register updates if the MSC
reprogramming goes ahead.

NOT well tested, yet.
---
 drivers/platform/arm64/mpam/mpam_devices.c | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 9463045c0011..41962dd1bb68 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -3120,6 +3120,29 @@ static void mpam_extend_config(struct mpam_class *class, struct mpam_config *cfg
 	}
 }
 
+#define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
+	if (mpam_has_feature(feature, newcfg) &&			\
+	    (newcfg)->member != (cfg)->member) {			\
+		(cfg)->member = (newcfg)->member;			\
+		mpam_set_feature(feature, cfg);				\
+									\
+		(changes) |= (feature);					\
+	}								\
+} while (0)
+
+static mpam_features_t mpam_update_config(struct mpam_config *cfg,
+					  const struct mpam_config *newcfg)
+{
+	mpam_features_t changes = 0;
+
+	maybe_update_config(cfg, mpam_feat_cpor_part, newcfg, cpbm, changes);
+	maybe_update_config(cfg, mpam_feat_mbw_part, newcfg, mbw_pbm, changes);
+	maybe_update_config(cfg, mpam_feat_mbw_max, newcfg, mbw_max, changes);
+	maybe_update_config(cfg, mpam_feat_mbw_min, newcfg, mbw_min, changes);
+
+	return changes;
+}
+
 /* TODO: split into write_config/sync_config */
 /* TODO: add config_dirty bitmap to drive sync_config */
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
-- 
2.34.1


