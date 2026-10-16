Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19196CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=; b=ImGYxqP5gIDqmF1yMtHsyQy+xu
	g7MOMBqR6gEH9yqKUKPUw6OSAYGLlRWYJK8p2NcMVkONWMBBen9u41SFnREEz4TXJQqIJ9kcaM4DH
	b1UvE8k9OgBTMN7DNt143gEbLQCZVKu7kOir9lDgYM9dEsfFQyWl5SfW2yEEVH43CRZnAo2VtZA+e
	CtMpA4bayjIoIOi6oOSjHjl4Vk9+CX/TSDFvQ4C0YqBjNtqt0VHXlBUEtwPHiW3RrWqrciSBurbwk
	YIMviMGssm0Ge1xgUgq5bIaZes4Q1b3pfnHhsM6Enb4H1S/xFR8JuOpjTrxeH7yZAuSIp8B4qRuTK
	1G6IblCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSb-00000002heV-1avo;
	Fri, 16 Oct 2026 10:46:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSZ-00000002hcb-05CH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=; b=ktO1D7yBiRhPQbM67bBxlc6ICY
	GD9Y7zzxjIOFqdQo4hD/L06dUGKHfkHZ0YygdsdvO82L95rd8ZI4QHeLkVz830lsklrqTf3VPUH/S
	nKoFEps2JgffyuhHtiUa8yXxqbG3sT5p4z5i2/PA5eb8ygxO7W2NxTSIBvOsfFl60Yv0DVj3vk2EV
	xP5JNU+KWDuXz1Xcz48Ug5jnH2Qe93qn8JgmsT8HHdrvlockcEWkBRwRae9bQ/FfLx3FOdiJ3CxsU
	N+mwzo9z5Seu/ucg4r/zRGIsXGBwncnxa8ZUEf3jogMTPIyYjtmlr758ctoDu0qkLfGCCrYz0KSgM
	F4Sc/hIw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHfSW-00000001PHT-17t1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b060ec084so4074641f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147602; x=1792752402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=;
        b=RSP4t9aTRiu6fjkj7m7TRwhu97esjerMXCckYVKPXRdFZyQEV5I1ttjrwtI61arnXR
         GxZba4t90F3XdbxEZxjJo7OcwU27I/JWGPgvac5QtXrUBCO8CzRV0t76wONHebUQTJ+u
         uM6Dw9cLQa30NqbI6EPfx99LDYsyXIlT5DDhHMnoOKorHN2lSwKD2sEWZT8MiKVDeRDC
         SRSzPfDxX3MLocfKkSWU4V6CE3oG8jZk7UgQdAx5jCB1dFIal3nKzh7IPe+Lv7ZvV5ZG
         OUs8qG8+mmqiIJFsUXwJs/QL7fswZbkFfVQW9U9p/83MsPtg0glGL2sE/WnSpSBShgaL
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147602; x=1792752402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSW2WThj73JXjd4G/88Mui+8Sx1DN1Ao1kVmiqTqMR4=;
        b=CASyqXgYogNYbHFx8nSRz4uvIdK2ueOEoK5G/0rFW4dHsZ2uam+dNyTQIL3kDX7Zl4
         PsBIOG3xquKkxeX3J/Aske/HzvAy3S17a8ATFbPjax1EMjUuNJtNmj+6V+14tPXw4cVp
         uIb7nDGkX9sIZCneRHxoEmXHlIPhektZy2BsIVvtHexuAJUWBPo4tpNoS9mOBCjVD/Ya
         PGovxRJrARE+xsq9pwZ56b7+ZrgrUp8Jk4BCXkeXCLXMn8TF3YPat++ELio1gcUiqxoH
         yJhevpSU7qy5tXwIGu4H57eDhVEkhEYYCm/MxaYkc2QQ3Bdxj3Dq4LdRZN7D6zwVussc
         a9XA==
X-Forwarded-Encrypted: i=1; AKwUvBwzJ1ihTpRXQ9NCt+vkYLFqWAUBVnkeEUlShKBF7JdzRdgp/ollmUWlcrTyFaCy8/6jiLm2LuFYA05fr7r5MUku@lists.infradead.org
X-Gm-Message-State: AFq9FYJHb/Ifceh8I0A1ARiFu7YihX0ndeSxlHNXjUnz+RaujMY6O4zD
	glezVlJjKscvnIku64LyLfGLZyeIQPDL51VOs0naDS6Oq/QwT1eha5D8asUl9os3KOY=
X-Gm-Gg: AYBFou1epairBYCQsPknCcMof5T+Ry53LE10PIqVNImAPuCCLQzFrszXDVLF4/+Ldyb
	Qf4nYVtDwq0kvXNij8r1u5fPs+ySFikkiolgZt3BDY9Bv4Chw22D/lB3g+VJ1dfvadgDpjjJVTE
	nXEFErCiqoN3Pkx3ChrFpmfjksJQbMRxD6jS672Eng9zThPLBRsNWrpKqxnjbeU+rlyt0o/mgch
	RYKioZLwOfs/51rkuULQswyH8X0of6wsD3fNSOUkmsPPaorZN2vi7ltKT1A+wQJ1Fu9W9c6IEnF
	OXJTTO8AqKYOVq1YNmoDUwx1i9Xh9cSs6sUADtfQq+1BQoBFF0ZUENi9rRNL3/tJ06qsZQeG9wO
	GltF7ywDH//0JMpa6+m5lr3agxc3QLpJyRG0G51Z8sdrvfkRz8g5BMzda5cTn/031TmVUydenqE
	aoE6kKWysfBpO9ObEReNuJQGebrTUhntQPX+ZzKQt9M5IhSZDsRNko7Y85FsSOYKVvtIqxt/JLH
	2OOpx1psEog
X-Received: by 2002:adf:fc50:0:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48dbaadf5eemr31637435f8f.12.1792147601803;
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:11 +0100
Subject: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114644_430032_BD61987C 
X-CRM114-Status: GOOD (  14.47  )
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

Perf's etm_setup_aux() calls cscfg_activate_config() and dereferences
cscfg_mgr, which can be done after coresight_init() has initialized the
Perf PMU but before cscfg_init() has finished while the driver is still
loading.

Fix it by only assuming cscfg is initialized if cscfg_mgr is set.

Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..7e3c9844bc00 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -26,6 +26,11 @@ static DEFINE_MUTEX(cscfg_mutex);
 /* only one of these */
 static struct cscfg_manager *cscfg_mgr;
 
+static enum cscfg_load_ops cscfg_get_state(void)
+{
+	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
+}
+
 /* load features and configuations into the lists */
 
 /* get name feature instance from a coresight device list of features */
@@ -581,7 +586,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
 	int err = 0;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (cscfg_get_state() != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -662,7 +667,7 @@ int cscfg_unload_config_sets(struct cscfg_load_owner_info *owner_info)
 	struct cscfg_load_owner_info *load_list_item = NULL;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (cscfg_get_state() != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -902,7 +907,7 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
 	struct cscfg_config_desc *config_desc;
 	int err = -EINVAL;
 
-	if (cscfg_mgr->load_state == CSCFG_UNLOAD)
+	if (cscfg_get_state() == CSCFG_UNLOAD)
 		return -EBUSY;
 
 	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {

-- 
2.43.0


