Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3335EC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6jmnEPT7fD3xBv3ETDFiEGiqoLQ+7NgCOKIiQ+7Jw4=; b=Mt01gS0FuvxM3B5+WYFQAaNqjh
	HNoDxGnGUamIO9RrXg/DrX1YaZ5Hm5Y6Bx84oF2JbX7TBzD1ZoUWIj8qGCqglrZwfBM/fB2Tz5c5c
	lix0rLTzg4eTkNf30e61LgAtws35X69e2LZmaIcQQEfd9bDB2BpFm14AefRfnGXqqx7uHIMURN2WH
	jrnyPRJDehzmC81tbzdyUeaBYRQ4ZJjNdaJ0UjvWZiW+oAYvUo9irQ5aYoiCE95gH2jlE3jlEsAQF
	9az8E5EIJ3T7nnIVi5LSj2N2+MjCD5s/THfy4oyUv/zlEmKm0dWzKbxVD4mUvQhY3Qy0bbTLB5wlu
	JRROSEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIu-00000005ZfB-2WlE;
	Tue, 28 Jul 2026 15:01:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojIm-00000005Zb0-2GwT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:01:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4955de8797cso25523645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785250862; x=1785855662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6jmnEPT7fD3xBv3ETDFiEGiqoLQ+7NgCOKIiQ+7Jw4=;
        b=mqKKtFp9XlUIpnvqDahbWqN41LuHJMXo00zb9ibnfVqNyCo5Ez9mwV+eP2KCyQJ7Ia
         ZvK0+E1GiVkCWySzTE8/qvk9Rqm58VSDbCkj4gDCebDDnYQZHWovqwBp6rykdP6sW8Qf
         ZxCuXEQg+G3xJsPIBjGgO1FWfwlIuL/rXHVLo859gl2rpYZdXEVrT1GGHgobu8ZoVj81
         q59ijpqXBcMoPHDRClowoKAiyoMqzw4et8YS5nroVbpkrjE/dN4fDBeSmAWRPWYAgOpZ
         LXHWI0clsIpBhOIRE5Cjur5msuX863frjprNS92to4QtYA9JJ7KnxTFhuyEZe1QgPRfs
         VE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250862; x=1785855662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6jmnEPT7fD3xBv3ETDFiEGiqoLQ+7NgCOKIiQ+7Jw4=;
        b=T33ca2RIBcodNZvNcfYnLQreTbG20LqkZLdX3JJGUMrihl2lXo5mRyS9SakVL3JZFu
         nNfos4yJhZlPadYivLq2T3wBNxdLmzSv95yib92WQSdRk5bMru8IyVKbaiNIwH2w65gB
         iiagD+oGtTSlFmy8nRT3eseKsRjorcuBq6gWf0Q6hFjvEXjIAl1zxnyYrppNgeH0T2O1
         4RnwN5UO9Wcoibee3Bz2QQkHlx0tIQHcRSOxHhJuJ9CXGuGEAeyFwDyeVblZGRNYps/P
         FTRfI0yCB29NZ1GCiGsq0i0253Vj9dQsI7tpnzyiDMlXm+tYr8mZTU37yx/itWrEdRNh
         V3rw==
X-Forwarded-Encrypted: i=1; AHgh+RrpPw0vJO+0fxo43UVbmz0lDoCJ+fd+PRTF3uVrX8iRQCYXiTdfPPpZuN18Ha62q9ddijXZBqzRyL4n2eUjXUOy@lists.infradead.org
X-Gm-Message-State: AOJu0YwYm2UwnUXNxyHWClVTsQwkKHAfAg+Jon+2fefw2EEUPirwntC7
	8rZaZInbEYZCAPzJV89I4/9GpgwgfGqyMXfS3/LFPJC3/WsyIThhVVfttj7LW16sUTA=
X-Gm-Gg: AR+sD11AFyNPlXHTmNiOFZVN2v8V1sHixw+NNE+0ykwoKLif59LtbvLNl4jLOfGK/u3
	ykgeReBHD96aRi3yNtfWsh8nVs99NT3lBo1CYiaKO/eupIepRr4O04eVN+h5TL384bcf0/IdWPB
	VUC39lpCrrTNIW+qBNfA2n1AOsdIZvO6jdrhG8irOQxWLpbDZ2XMiSU6cTOPNSfdXSIq6vPgKdh
	ettHWrQwogFvWvAEen/AyMSZg37pheTaHR38EUWy62y09HgCRWG/b1Sw91YzHvnXKRSv+yU816A
	bcgg9hDv46ul2pckeEt3D3jf65JtJmceDPM1rjYcKnwgDItj7bCKOezwD9jSmmq/qVr5ADF+dir
	+LB6uFnwgHKLU2i0YBZV66JsWI11dxlMxz6rTEuQ5W64xcW0mtQBrIhe7R+Dl+qAfVJk5qcsVZ2
	0bF0tw+SM=
X-Received: by 2002:a05:600c:8b41:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-496c653e2a0mr31514365e9.8.1785250862436;
        Tue, 28 Jul 2026 08:01:02 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm61036324f8f.20.2026.07.28.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:01:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 28 Jul 2026 16:00:14 +0100
Subject: [PATCH v3 2/8] coresight: configfs: Don't assume active until
 cscfg_mgr is set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-james-cs-multiple-per-threads-v3-2-6aee7579f1dc@linaro.org>
References: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
In-Reply-To: <20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080104_623045_E4B19B76 
X-CRM114-Status: GOOD (  13.51  )
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

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Fixes: a0114b4740dd ("coresight: etm-perf: Update to activate selected configuration")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..475e8fefa100 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -581,7 +581,7 @@ int cscfg_load_config_sets(struct cscfg_config_desc **config_descs,
 	int err = 0;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (!cscfg_mgr || cscfg_mgr->load_state != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -662,7 +662,7 @@ int cscfg_unload_config_sets(struct cscfg_load_owner_info *owner_info)
 	struct cscfg_load_owner_info *load_list_item = NULL;
 
 	mutex_lock(&cscfg_mutex);
-	if (cscfg_mgr->load_state != CSCFG_NONE) {
+	if (!cscfg_mgr || cscfg_mgr->load_state != CSCFG_NONE) {
 		mutex_unlock(&cscfg_mutex);
 		return -EBUSY;
 	}
@@ -902,7 +902,7 @@ static int _cscfg_activate_config(unsigned long cfg_hash)
 	struct cscfg_config_desc *config_desc;
 	int err = -EINVAL;
 
-	if (cscfg_mgr->load_state == CSCFG_UNLOAD)
+	if (!cscfg_mgr || cscfg_mgr->load_state == CSCFG_UNLOAD)
 		return -EBUSY;
 
 	list_for_each_entry(config_desc, &cscfg_mgr->config_desc_list, item) {

-- 
2.34.1


