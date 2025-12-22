Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42214E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=; b=jh/0iNwC4nC8i4OzvZh8gHsuOw
	XRDDJJNrptfmCg7kOm4TE/qVUqg48ObkS/DDqzspu1aCf/5LEOLUquwVZk+nr+/woDjqXAAkx3Lot
	Xfbd7EOMnyR6sv4ZjP4xURxQnUVpuBr1fLd5kywFjEhE3h4iuo7sG7dlzI9ZrDa7zsQ0UO/U3JvMk
	vug/msDOzClVWaEny5oUGIrkWfhAs+BEI6+DuUjKgbXW8K/vnT3WXCvnvQkR6+xxERlPu6bY6tdYW
	3GLpOgCzQE8gtBrF+ATYBGOyu/FZxf6wnLzCktPIGjqvPH/62djkFQwCfbJmMgyYEUOz0u8EhdGhV
	tCmVeSGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBS-0000000DOqv-3LKZ;
	Mon, 22 Dec 2025 08:22:26 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBJ-0000000DOon-0qUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:22:25 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5189956b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391736; x=1766996536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=l0SUQk0PrAms5dxSkys9WPQNsUj3m0ZzBIrwcXEiIc+1Lp0AynncpppyfiMOIaT9ym
         gRKjIxV8cWw0RmS9yKWcjHWWXd87xqUwychPesH2HT1m4bDomSBtNufBs5TgyHm8aoDl
         6+oivRP7/synxVB/9iCVuHHuqRCwD5PPp/6eaarorT4fOV7XAupVqhKuA29knrTnVMSd
         K3IHXH32xeA0Vb1v4WfGEJ3q66PXq2WnCBYs3KqPFc1UVb5PsxAkJKE3GqynN07WmjzU
         R2Ez40ujIDEyHnoFd4ZYULWohfM9D9Ta+sW5NWlXUcZuZAGdKzgs7cbFDMIlLMaw2ymP
         oQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391736; x=1766996536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpOUBSAqvR/6qLOY5JhuGvZqZpKLgLxKB67YbPHT84s=;
        b=c8k3VDx1z14mwIKfa8vcUUKk4ymoP/edFCsQJfLobIqVP3/qjVs2tFxU7cq/vTyDZL
         rSO6+GI6cng1gMA40tEJ6FWLJv+A3G5nvkgbHowIxXP9Z95RawJc2sMm6iNw2Hu7azIb
         xzbuKDGasQ8RaQ2ig9Grt7rwn9t7gkeuXm6ONCcrslMGTjJDeuXAA9eMyX64p9AdES3M
         A0dDEO/gx4H7TN5wrN0/M/VL6JNgkF/XH0mtkNM3Cto5oNfkhDj128WEhINO4TVRcHDc
         swq+7T7NAk/93EUVoda7uPmlA8w1EdI8qPRwncnkVA13UM3GfziH6oI89bl/ry2JQ3OM
         7AYg==
X-Forwarded-Encrypted: i=1; AJvYcCXh/bTzeo7CWHqAIZB/ftNV4RT3yvcpIPZTT77Ik6uSoVeiwaYU6AqUVte0czG67Uw+B2r3PTlv/UI4G28DyGQt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw7PpglAnkc+/uzJprtAKWCnMRPxCkSoghUbBwdiI2m+MCMWs6
	hLL7ORlTDaHL4IviXB98yUt2DEhdtjWiamtuFsQOQ2Hb6m7S+L6wxFya
X-Gm-Gg: AY/fxX7jXSCGinvkMkAzf8Y+5QixrlJeRUwp7edJ4PLIHaze6vPcKY9N+WtlAwzhyJI
	LiawwSfBcvvojjwSgLR6zYgB/AMmLUyppksE9n9PJF67JvwY8RkWoIy9ghn8TogAH8y3aWRKzC/
	L1hnSRWN37NamBvjg5ZXHKMmXvaIfbCCTy2mj95IhEcDuBgFHM1fs3FTFWuOAoE4G9isdyeCbB1
	XQD3BMcgPklf+PzBaQQ0Eez3WDeMYLx7aSa5bS1WWeVOpAdpA2vSj3ShNShCgxdk7gnp7tBeylh
	T4JCOQ4txbU6bqdpajaApqeJBZsnwHeCLcErKmpdjFKaeIKMJDe/DWW6kXXqjRIZJimQFcMoQui
	uarMYbg2+MgUnoQbJrWl1RE59BnQ3SrqxaI6pbT5ofh0nT1E3AZnA3XCBRCeAJhIe0enw4OW8G3
	yIGLVVDgVh
X-Google-Smtp-Source: AGHT+IFHqnkLVdqcXm7bGw59SVF2bpwuPS776EDpm2DBSj3/f5x17l2ZGosn+Y6e7lRKYamOLqvnUw==
X-Received: by 2002:a05:6a00:ac85:b0:7e8:4433:8fa3 with SMTP id d2e1a72fcca58-7ff6607e4demr9148599b3a.43.1766391735766;
        Mon, 22 Dec 2025 00:22:15 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7 05/31] test-dyndbg: fixup CLASSMAP usage error
Date: Mon, 22 Dec 2025 21:20:22 +1300
Message-ID: <20251222082049.1782440-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002222_234303_EA07C09C 
X-CRM114-Status: GOOD (  11.03  )
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.52.0


