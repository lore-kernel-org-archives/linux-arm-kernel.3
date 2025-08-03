Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA6CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=; b=QPrK09/UGzzq1u4vooBgUaVgMJ
	DAT0kLlXmYL3cFB1Ih+fftZ1OXeJcMksS4auKL8mjZ4MHqG3IIToZxfvCnhTxXB2ase+degNP6ufE
	3s6ErFMrz0pTJ/JmIHauz83hmVZRAPRNTIkuny6Ltu0CLKRrdG49Y6p2R2ZmOl8IZnIDe9PR1Zvfo
	fdnBJA78sfmv7MhgRSN1VPav0HOwgke89dhuzRvR4vdxZv6/KI9mZsAN9+v7jJ+NLzBZa/q62iSC3
	GwCcUzFKMnY559rmDoiQWIAUFQ2bLcukv5ffS6nf+BPYTSuj6fwRVObOLt0YOjOUNG0oWHAKdketT
	UrxvDU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiS13-00000008RFx-33Um;
	Sun, 03 Aug 2025 06:16:17 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsy-000000088qB-2m5e
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:49 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e3f01612daso11600545ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193588; x=1754798388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
        b=PtG+DGA87fITpOnUD1OnJURMCNXQLQLuLdqg6Q5oHynkOfkDO3hQdXxs2GSyaMbNBB
         KggcDxDYST9v9jSP6oFwY2+n1RB6CCbf5n2tW6vvNzcmWI8IUtVvJGJkYh7fN0fQWeBA
         TBuUuzKkuu/Ky8l4lMVYumKtP/KLqlPIsWrxtUcODp6bqQR2HvdNeM9dzakqZXqMfBaG
         J1UAzJ7XbiQza0yyFf+JBhB9kTj+AgFDBzS0dk5OVu8WDxeET6163SgcQCenMjrM/vGE
         xBkVPs7ljc25S83L3Z8AHOoCQIPX0molipvz+5jlkjk483slpNWd4ubS6zohyGRZU0Bc
         Djsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193588; x=1754798388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y2j3K6T9pEbVJmy/1+mQG/Hh4BA91G5pqycFLMj9u0=;
        b=naaru5MuOsbW/NSUXzPd1LkRyzHiZ3itYzWmR61Y/+DlY1x7gN0S4fZmmzSaKMhxpm
         DncvfggjiSnaAKoJ2up8aGGhVQin5YDL5V2CJtB56tv6SS1lCr0FnVjfV/Yea7EGFVOS
         LhOa2xQ3X2EWF6AFh3QZVUDfjTiCSrrqJxFfUlOvvPY2yFvrZZ6KUy1s7ymf+gnur2nW
         3uJa6cg95pCA0aV/H8zgqHSM5erC+oOcl5kgVdRe6o9gFXvuhTaNPnUWRAJgAhUiJuHj
         C+L5Qg/TETV5q2LDUXyDKGzi/Om4xksxXCWfm9c/Gb2BB0rkLgdhIkbKNF7BEk0SfgRP
         /SGA==
X-Forwarded-Encrypted: i=1; AJvYcCVfit38RSEEU/uSbgh2gAVU2RKNLg4qtcbsBctNDFj5JMYnOqArhKdFmEOPaVmLeotTjPi4RiDLNxQ4QYolVwHa@lists.infradead.org
X-Gm-Message-State: AOJu0Yya6AEJzRJ19dI2UNqbVCQiD+CYewKglvUXTxWwkuufb7pjc0rX
	NqMczHJqy8XnvRaKcNrrhqmK4Y584QHGfaAzSNU3xhPzmn7jLlKHp9qn
X-Gm-Gg: ASbGnctQVTWpHeKoxhiXzhbBk8UEEdltS07zJ4o5w3c2Xe3znXN4sN6QzENQGo6Ml0T
	qFyX/JvbSDmFJk2dshgPzpDJUxLZ0oWWJ3zTLAANKlM1T2VhS+H7T+nXlUnvyHP2lxO5H0xIq9Q
	RIaa4MWHb9YQh35Y1uTuYng5gsovlzhrWMTsM70m6/TjglitofQ0PONtzeB6EwgdwLU1suVt2Dy
	3kCI2JDrIRi1PDQRKvNifNshVWXfwG2hMN3SOrq+Jk5t+boRdkKA9mKIIwjJyoFSvheiw8Vecgj
	3+W6lgsO1iai3QUHrCif6hhL1t9gG2TaylsmVE79IFdEN7EbG8zVYwSXaXTASJtG0QMjqSHAp7/
	Rv56yNT0/Nh6Gr7nlzRVfCrrOXi1HTaPfrsY4tMq7pgvbigM47feSWJYf2n9VmdNyEcOyf5WSsn
	glJg==
X-Google-Smtp-Source: AGHT+IG5rAfDnGWWHI38mC3T85otZ6jr6iMt5B4TFAIz2EjPIhuXzfVe7WbaaJ0FoMpD7p5DssgRSA==
X-Received: by 2002:a05:6e02:164f:b0:3e2:a749:250b with SMTP id e9e14a558f8ab-3e41615d149mr81988415ab.14.1754193587969;
        Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:47 -0700 (PDT)
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
Subject: [PATCH v4 51/58] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Sat,  2 Aug 2025 21:58:09 -0600
Message-ID: <20250803035816.603405-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205948_701780_C6CDBF45 
X-CRM114-Status: GOOD (  10.24  )
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index bc58991a6f144..5ae66ffd72bd6 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -21,6 +21,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.50.1


