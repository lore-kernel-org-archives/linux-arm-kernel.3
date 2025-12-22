Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF00FE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=; b=IKM05N9uAhztrgonz7r19c9oYo
	It/57pFbTLEjes19HxAX0s5oxViPA3nEXZ9Sn+qIHzRZnvcAjpGjlBSBC3xKZ+1z6O8wgJyc5+fvl
	y2L3+J6ca24v7xoOD46iGEEGIwO37D1bj3X/dJe/nFl4FPn6u5ACTOC9lTizYT6807nUj/qZd32y+
	+a5AXOVT9CmzVrHjd1u94mM5hzol8b4CigGCjsqyGsUrHv82HTsWUAbqnAcBtYv7jA1YLPFv1xja0
	ylVNAXOn+6ktKDKv14BCwHsP9BkSpxOdwt6b90ayLihB/VSj25BsTrPKNVFI9QBDiOU0iiIDtVnr6
	DQHq7YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBx-0000000DP2e-3v1a;
	Mon, 22 Dec 2025 08:22:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbBq-0000000DOzj-29mM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:22:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso5830219b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391769; x=1766996569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=gtR76xmpFmRgtrrkpBtE1zWiOYoX0husyrLuEJcTyqa7hwBiwJzD7pHH6puC+dGpj0
         5gs0ci3cn7AUgDK6QqSOTChPgf0IwW5n5Rt0D+3hknN6bkOjCIZSDV1Jo0egvqOZ4877
         iXGHGNEy2twwzyTkveElnyItPBfvLjF5qIUqgddjMjsiQTBHSEs/QRLrGSsbkPLlK/42
         02D+Vu7ac6omKL9Z0TaWZ4ZSGelMsPS8OEtESGSgP1ipcFchkik50ITZ8fIkNJ0ew/Br
         k4yS/kEYs0cVMY0coT003zfBjou+Ik9vk6oSqXoMuI7IzIKLyb/DjNYNB1Zka9XyWd/u
         skww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391769; x=1766996569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
        b=F/oKo/COCLCRlcEXADEFB1rypAmD8yynMNyzD1IH4yMYKtNlg8zUw4ULH7Xp31VRj1
         9WZhZYHnlwScYU4DMCv16x6K4r3Xs1TMzyYMOVOCZpT8J9dXUizda2kJMldGAhP6DE7d
         PqMf/jDMzp2d1kFS5hdA367JRycu6YJ8lsQDpDjmrV+Mj9JupU2kTA0BngAy01exVP6/
         cki/0aQhqE8vSVAXZmTnumEk5X98Uyn6kDSZiBvDTqF+hOPdlIJsXg4AcVYIvo0wmU+F
         NB1BPILekQmZhyzMDOiZjJoSJiSjZMcm1zbTr5aA0Iel7h/tUxPYJXXUgBtekqFRTUcj
         Rz4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyK/9rVZIKAWfgWQEBv3q7+GZzV4zBjFgU0nLsoa8EV9acN9ZCt/6atgEpfKzWHRzrGUHAfIIRTd4qrT1Xva+C@lists.infradead.org
X-Gm-Message-State: AOJu0YxwAuzX+DFgacdL7HD6AikVbdcgaTsQuWowXnj99ya81f3vZpfI
	vZQzC/MNQnpRXW4EzqtlurJPiVtUuFCExlwe1snfT0WrVcSiXzSlRoDp
X-Gm-Gg: AY/fxX672UFIEHVdIhjw9AeyamLHBAlKJqSQ6JG+1JYnaVZZgHx5jvTT6eOU8td4SVD
	ZK/Kr5VFn89ODTLFVp8LohWJONOjAWriamMce81gvQZolqT0VNq2VemRd8GH9hBhtFKmABT0viR
	2k0kevqYdh5pyjoPBlHfVzVLHfn0oQoNmtOkC/+kwj/yKTn1u1QxpliOyUv9qCrrbSDG53Eje+A
	Wh3qPv0vWrX0Yb0kHUSiBI2UUQ5byUjmXUVwVkWRG/lvY4AhTd81is01QIjxJCCN2z/g7iz+5VJ
	QQ7Nou++ebfuKxUy+1zEr9XQkm1tdA24QfQa0SqYqRdmLZxiAhPy7sO75vQO3XElEY6GuSVbCWW
	jYE0s8uAC2ZXrqL64acUJw9gQiLxQTj2qnEdxpPAqlYlhUoPIh01PxALwZW4Xw0n5t1YPYZs2bu
	2jENpnx32X
X-Google-Smtp-Source: AGHT+IGD08I50soJcdL+xzw0QhupyvnNGdXij4KQgDOgK8/wl2+Is9lHSt1ytu+E7hNdpFYZDBEOMA==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr9986499b3a.31.1766391769458;
        Mon, 22 Dec 2025 00:22:49 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:49 -0800 (PST)
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
Subject: [PATCH v7 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 22 Dec 2025 21:20:25 +1300
Message-ID: <20251222082049.1782440-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002251_193472_C98125E4 
X-CRM114-Status: UNSURE (   9.53  )
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4b7c3b997657..c4ae79f934d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,11 +131,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.52.0


