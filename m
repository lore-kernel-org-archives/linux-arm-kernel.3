Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F08C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=; b=llN9vgneRUrVcM/0IVdK0yQDW8
	GEUx6pW1GewehkRE6xmsD2vmsjum6DFDVKgkKApESI1kBCV5aEBzATS84BO4nmdIcev5DJHg8O/ne
	co7u1dtAbHOF5oXGoAnTpO99MxUuZSwhWHRiVZeTF7XP8GWLgY6zXHywXiM0jueo9aj39/YKIqz+f
	eRb6fk5U07McB9WsUOk8EvsMKbXzBdzZbNYqapPO1Xf7n4S5MQsCENmhWxTwNCAiGe51tVFIqSpsU
	xsaZLwilSPSrUS+tdYaJ2i4RLdJ5d4iXD7l9jlNQpyxbUQSeyc1+Arp1adBTLu+I1dCud9IFhIsQs
	VS8AZSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRtP-00000008QgB-1K88;
	Sun, 03 Aug 2025 06:08:23 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsu-000000088m3-2Vif
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:45 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso9003835ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193584; x=1754798384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
        b=Y0Z/9U+4csuCTO+EFLPI8GZWzfox7XGfW5E01dkALhZhvZMVtWCCM3Lpt0KxtPVSrb
         BWhsDBo+lk8D+abZdLkuHC7YyeDntry2I7AkaDjDEXmG15R6POzHJP37C0YGsO5hFIKD
         Cx93kUXVCug64BGgsuHURceJkLLQ/r4Yg4eEIMnOfqU1nfjXTmDNRMeTXzV3RzoS5yhV
         0EH4w/VYKigFVm0/9uBvagCsB+j2HSerpZa0tvybTZaXvsAgOzkeLaL/btwWlsPZohOV
         Pn5ijDFYsjUqdVLlHEOOJY1xic/5CfmWLWgNXcF7PLLsR+33bWiOTmvZ8Ye+HNq0ZL8K
         YdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193584; x=1754798384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xsd/qFJRqh5DgAbSh3xpznnIfN6HELFfqd9qkYYMxBk=;
        b=vH0COWE6P2VRxS+1lfwhYvQWC5xhIqXfoj09/DmWW/lcQ8eMVUOZuv/Ie6hyL1v4b3
         0zPSfu9E9Tt44OOwqQt7whXwkIyw0TdPUGw6uEcNZqCYK9EiPIr8fV2EBlViAR0UU5wX
         /xlklrmNy8H1oRzdVpBok9li0EyjYVE9LdgRy3qqrjO9x8WMmGJztvYy9ol9cx10ul/Q
         2AZzRo4uYzpSJiCge2xB7e2tR00d3rx+wFAg+Tj18LmnrJLwnyWUenDgh5FbuDKqk4tz
         0a6kSeTLMeWCFa9HH9QYpztro37Gbr4pTdD1g3+yRJ33W48XPqcrhc6j7KEKgFeZmFBE
         XkXA==
X-Forwarded-Encrypted: i=1; AJvYcCWWu9tV7BdfAdaSq+USixi1G224dWl9vMCqbb9GLJmeF3LYcHe0Tda3GJ5gLixhVQv1IxDtsOu6c9DUGuvyqN9T@lists.infradead.org
X-Gm-Message-State: AOJu0YyLgaWVM24mbMjEsGCpEOjqziwV4nui5caXA8/etlceb+K2J4Ub
	UELRN/CzfY7iR9wXqYohHcm62FUX1WR9LcgnQ74pXK/rCeQ/pGjsIVoy
X-Gm-Gg: ASbGnct0T576PkF7Ae43ZuO6u3A1O5oI5j1lBdBZLwk8P5JXXlPq6DIc/jNB4ijf2pO
	cnMQyL6WLftghJDWwlvqMoMdTKAs39i3i0z6OiqC1xnlDdU+KXm1SyI1nkSUuU5LwmyJUzISJcO
	dPIfAapi2xFq7J+KT18xBBpxLBRA+sGOBNxfWTZIJJdnAOqydrI8MHDWRRfxyRF0A1Tql3QpOJn
	ceImDV9OSbKxZTMXvAmVjTR23wnyiOuKZ9ZP2pgo76hZbyOJaowBwS5ewd3vs8kPjZLNZPItl1l
	5PWnSPjjI8LYqLnOIjwtPsHivYzCMJ4j6JWSdHXvLHs4YHZ65abutWYgZTUCSQ6wAajhWjR4KAL
	b94hgXysK+y/AK1Q4tTgd6a4tcSUX3CWsU5wZuaIl9pl7qTIVqtHoHAWRkcRIEeRrTh0Q1exuro
	aNnQ==
X-Google-Smtp-Source: AGHT+IF5gmZRxVoJe/ZrtZudgNIc0O6RXiQi/MncQOQVxzlu4r2b5IK1NE9kZPr2rom2pyyvDkmK3A==
X-Received: by 2002:a05:6602:2cd5:b0:87e:7359:133d with SMTP id ca18e2360f4ac-88168353137mr921122239f.8.1754193583881;
        Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:43 -0700 (PDT)
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
Subject: [PATCH v4 48/58] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Sat,  2 Aug 2025 21:58:06 -0600
Message-ID: <20250803035816.603405-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205944_637233_3265D68E 
X-CRM114-Status: GOOD (  10.81  )
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 267f082bc430a..6eaac728e9665 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -253,6 +253,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static int radeon_pci_probe(struct pci_dev *pdev,
-- 
2.50.1


