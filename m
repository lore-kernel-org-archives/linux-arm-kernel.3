Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC74FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=; b=hTsxMvkaISi0ErszkJrDrK5vWz
	mmi5QZALtehr7AGx8Meub02Vm+2cVerFSm1geSRvfVfQMx41DSdSWPfKnccLTiL3sBOf3MufBCtG3
	RX9vYuQ16roOEhsuzjquIF0I2J8m+DOa37uZEa8Mv/6tycC8NoW2m7wDVMpURoEwf/mfDO6ZBVOK+
	FP9HLbEfhpp87xUmysp2FMm9ttUmleSrj2ev0hazv7gXDhQl3b0DqtGFMs/xjCNJAJfb2uXly7rvD
	RHy2LBEaja5mrpc2fDyFHMazaTwzbHDlRKCX1MMxYeYndOI2QUuCn8q3URMUcCCtZrlmM3XZWWSEG
	tRlV9yNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRlm-00000008QIV-3kCO;
	Sun, 03 Aug 2025 06:00:30 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsq-000000088is-27Dt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:44 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14697475ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193580; x=1754798380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
        b=bpHU0gudWnCav7HYkdGqAdmmoKXKV2tdBD/vYJjv385Q/L03F3vjrFpt1WBWg76Upt
         fjkcexTZdr2m/JJyJ4DJfubsh7bpU3ANR28yOZA6fwsnfTBD7imcld6Fesd9Z1gVprFF
         1PiUiyIxrp5ZC8IM4oY7gnVouk2pPyyCkwprXBJAC/d8tbZP8lacYfRixbl9G67WjXDN
         MwLBIGoFQZAcHEJmsI8n+boz6ZonO7RXxzqUO9xmbja1eaVIS0TWjWxNs82AH4QVJkK7
         GZRwjmDrvwlj7G+5IbJoLMzVJpi2esCTSBCA7MNdUlJrMUKMeQjA+NhZmQKXHRJwlnY+
         0uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193580; x=1754798380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
        b=kI5ElsFfgKechO29B+smazP7jbxb+r0a1R6TmWizVrRR1y2D/ZoFzzVmO4o1fv/2R5
         CIhbHKnWq3f4m+8geAqFpPoS6D1x3mLRkcRgjrlQ9XesJnPDK6pscHE9s4X7twm0ehIi
         zUEtAl4emdNDswnLnCc7zXf5WHy7dZ9MCu6B0HWVGDE8yGsprAjCvIm6ZOjDKO3AOoiG
         37+oG6EGVp8bOXNr/BPjJLVd6exjX0jersAgzszQIBRZFNr7u8a168iW8vsvenciAfFJ
         RQAEmBwLqf6MF9XS1alMPusXrISPxY0IaTrI49314VwL+o/t1e3fHgRS6+5GfcJiffHV
         pGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/pGJCevK7z9++cfa7Ryfyggk/UjG2L4eegY8JRdfk3PU4brlVoxnGpyKUAuwfYxfGaJE4kkB3SQ7HIMb8dNfl@lists.infradead.org
X-Gm-Message-State: AOJu0YyChdkmdvg6WxRiowTjiOXSQPrk02Sr1XqPLdupGPFBmQc7PIZp
	FOpgHEOqnhhYgq7kFn+Nz/P55Y0Br/PuviXeXlq/fCI9o0Uo/9Y3kJep
X-Gm-Gg: ASbGncskaDD+M+wfTaZErDZt7xzj2dKD9R5PtqBJkAyGfhIpNPWzhl6YOMTPLSpjaVB
	RTQLBjajEmU2jxGtEJt8bhaf7uwpNgD5IHpZ5FR2OBQ3q7PMYOJDHyXTfW+SLq+aHIO1wNRcfL+
	1X+A48EdwaHI49I907Pz1zNQkP4miEKQsYKCOMoL55ehyYsPItUbHm59+gFAtgm5ybOTw6RarKC
	n5aYlUh0FJSwkN/WiQJ8b8AVhC1F9qSsf8IZG67Ft01bAVD7Hg+zAkgzQhRG553X3Hv5o2La7Id
	JKOB71w8u3rt9u7IgpfvKJbZvAM/7dQvxD6aspZkipFM56q6AUF6tMrzAKKBcigz5/uF8txgxxe
	eDB/5U5W1CsPsZYQZ29gKND/VQ5/JzydJXLbRfnqdC/4EReTtoA/d7owB+MUunbKhen76mjWV5C
	VDTje2dIGCgSRa
X-Google-Smtp-Source: AGHT+IHMF0Stckwb4tgrilrVESFlmaGnVXMaPmoUxRg8HxQvWlfXjPvvkTeyvK1bWCUd/wSr8kLBNQ==
X-Received: by 2002:a05:6e02:2707:b0:3e3:f9fa:2c8b with SMTP id e9e14a558f8ab-3e41610837bmr85829345ab.8.1754193579730;
        Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
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
Subject: [PATCH v4 45/58] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Sat,  2 Aug 2025 21:58:03 -0600
Message-ID: <20250803035816.603405-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205941_937223_1863B4CC 
X-CRM114-Status: GOOD (  10.07  )
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fba..dbcc8ba70dfa5 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.50.1


