Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B3C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=; b=HiO+DYYPPTZuxjyPmHi0vDc1yO
	C4x1ov1lBXDUQfrggnLeyJuezFiTQHthgHBpwFnSXSuLXNXNJI1/oSBaHE4sKfxjUtyHLbNsI/+KC
	oJCecBSLEUOco7mAc620NXCPOfalyrLPOM8KyEIfnUMlfTttKl0nP6A0ywTrgtLlmYCQaKXQ8X7Hh
	Ai1nPjBaD70WoTHfwUhtpr1VM+xp20zHRr3xdvqO9AX9autMzz3d8T86bfMN++P/6xJYtzPhrSH2o
	O5qpj98TwqGlDbXqJXdpb3m4EcwCbdmTErBDq70tS7T82v0PayOJ3MpegonTFGr/4uJjr9JOelP5a
	eTbMd2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQJy-00000008CSu-0W9g;
	Sun, 03 Aug 2025 04:27:42 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPs0-0000000884U-28Xb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:49 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e3f0287842so27593785ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193528; x=1754798328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
        b=PN3FokjO44km9IrTMe9FgFG4A11I9lbolcsOpKGjD77DMB/P5nb9PUmSuOGUWwS80L
         hAveUKzHs3k0M8gOyWTiQ46FpnzvS7cNZLxix0lMiJ4w6tYFhN6XJJVhZ2sLgZRZaXJB
         p8aQvE2t3riHF3BUV2edK0Q/i13zwS2DGevaPv3Ng2e9G48h31bJLHXCd/8zLrYBrHDg
         uEDyXqvpgFarZbmGHjNCTvx5Gb9/htwBhkwfBbJLJ9KdH1M4NOBmvYKP7NyUKJzWQsbF
         ryxRe8YsHRhM5VZzkyMpPcKudlgyRkpj6j03d3l+uj5HbRLJoiZpaa/uD/rGtNuAsG47
         lvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193528; x=1754798328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuNmIbrdZwfa0pVSTeAraA+TCM/HhXLg2Msu1oHrhfo=;
        b=gXUvYno7VvdibXwt2HHe3213hlV647WWuW9O7GGWWEm1V2FCwjBnueGyoG4ofM2uj0
         QMjQZyQh3ZCNrDkFLujQhiq4hJp2EMwhxED0At+ZWfqAt9k+Qd9n8C3K+W/kCa0MJdMy
         awTS5CUTTx6ktDibKGDJaCXsn7dkCLZqNs9dWY9+qGUI8Qc3ApWScl7XoVBhIn7KpnKl
         Uix4M0Wu/3E0Y581i4386eenS8QBaLurS1jB8Zc/uJMEGSVtDV1QK4FWuaMDTm+MuV+L
         yUBpwnK6aj7IxcWhvtf+uOENommL49WZu073w5F+yDhYnHuTRJhaQDNU6cyzqGNzFOvb
         zO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSY0ImyWZ75s+6Ce5pUtaJtZqhoemhuCtDD6cTZav5Xk57dMUfl2QJSjGnyaItv3BZXvRozRkDLaTQxcuPKCUD@lists.infradead.org
X-Gm-Message-State: AOJu0YyaYooS5a+LD1gGEcJ+rLJI/NRjK2c471DTAlYvAvpjxA+8fn6G
	cHRfZVAVLKbHp5C3x5b+cxcdIS75T8sJb7Bb8lXW3UaF2AgxufDThcim
X-Gm-Gg: ASbGncvqEiARspjchsB/y0zCG3LC/5bpcSYxp8cSjYafcJbZmJIzH1HHD6YLcmb+e9e
	2NUPbQLRi83B7aR9jc/apPzEG5JXpdx+8gsTwLJJCjJyTcOCkqkUZqykOKqaZzuHsrqyWNVnhD6
	h/bFhp1rV+OvdeFItwfWG4axdGKKAzjWsGMiVoC1CQajvK4k128n2eZYkWQATDiQGCc0K8HnPhB
	nvaNf/YyLf5RgfaAbR+kKO7LFpUaew21ukEgcH6DX+bfm8p0ZCI5JR3jqGx2spTEzvR5jIlW+rG
	ceGnP6SKTXNl1WFhC1pdARByQFo2DKNluyy7+ieDS5X7ovjd13ELQDAsdlc7Ku9jhCNJ4L7BO6j
	m51FKGntj5PSA+ZvW34LDanmK49OCRQ7ogucWM6yo8ZeGcspUVVFKzTBFsErBIpawHz3NXgHDfk
	sYSg==
X-Google-Smtp-Source: AGHT+IGcflxY2xQddxU8v/rmDKw+QE+rWz5yIjaVEFD/GSKgriVLCHdPf305K8rfqYkhIJesD2M8sg==
X-Received: by 2002:a05:6e02:17ca:b0:3e3:ccfe:d597 with SMTP id e9e14a558f8ab-3e41610a07fmr100947485ab.1.1754193527658;
        Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:47 -0700 (PDT)
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
Subject: [PATCH v4 10/58] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Sat,  2 Aug 2025 21:57:28 -0600
Message-ID: <20250803035816.603405-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205848_557962_6DD47EF5 
X-CRM114-Status: GOOD (  13.01  )
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 96cd31c457e2e..08d095dd19ef4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -604,12 +605,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -621,9 +622,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -679,7 +680,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -689,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -743,7 +744,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.50.1


