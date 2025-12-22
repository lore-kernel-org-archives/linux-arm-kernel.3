Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229AFE67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=; b=lNbWhyFtv/HUdTm3R8b+A4ueyq
	k7Z2kmYwrIK0S/9N5iNOlm4UsPfMRg3hyO+VJpaNGD0vQIebbwVuzB1hc0aMd534x30ePqDbw668P
	/gp0Dswl4SDufsv3OrQ6Hkf6sUPkVgJ+pSSg/AuH6w1kzo2hNSk2xhpuxpELzGsqjAgQHVOIaRjSm
	f+ZlUXWzsi9Xlngt8WJbMXK4AVrKTvQf6NVB+En01GzrwLiArTh3TXmD7EgF4XPfAVAoayz+qdmr2
	9rMCtRzZOofE3l5d1TjzY2eyr4VFNljqKHFHKw+leQJWpzatSDVTk3ULuIi9TjqpQySTkfIFSAEDz
	NRgygfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCf-0000000DPRZ-1eap;
	Mon, 22 Dec 2025 08:23:41 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbCX-0000000DPMo-1MOF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:23:39 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7f121c00dedso5007249b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391812; x=1766996612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=GymlbE22Ulg2yN3LjneXHzZyEW33Uou0fAWTBxBBTuAwtlQ8g8ikCP6H8a/BfnEyYa
         Dy3FzIuO7DJcUPOJukWJUlmtHgZjW5cVvs7/L16P4ag1P2WUUTyISfAlHuNhKFgPqXPA
         MgNytu62Un+iul5pgNkbuDwa2xehMrqAXdmjGIJGthKqkZJr1rhUn8wkWnpAyct8/i+H
         JehAFgK1BsVX8t5isZ0zdnrSqyYOLPQih7X0R+OxMmBUKaqzYcI1ilE5/tIPg7BOLiIE
         FoUKX2jii/kAs8729N7fENJxadZZE6ebYjYfbUY8kZc8TDbBg1YceMGzyFt4qmUtcF+/
         IxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391812; x=1766996612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=b1cEK6WpCF2z5mkmIk09kKtuUTgFHW/s2W8AoFNof4RNHat01R5WifhDcHPy38lwu0
         mxGHwe7hiJcmOlgFzYKLfR3ueyi4a+R8dX7P/8Ce5vLeZ32CxEDpu91qHEOvPTiZTIOk
         jiu13SdwEiEy/hlPL2TsoRJH3FybeK6VV92GE08gilTAyS6e/eC/giUzkrzv0mfvaOPf
         uYTNqssKuwraYrvu27JQj5V0WUKz0G6ky36AekfWBWbJFmFaSEk3Rb+TedJBJMFXHg1b
         8TiTJEFBOc+pqFliNDIzuNQBBmmeFHUX6zcdVYiNDAsrC9+xIiwtAPXp0xYb+OdKGDpj
         CyKg==
X-Forwarded-Encrypted: i=1; AJvYcCX/SwyNQxxFYBIPAsENWfq83W6ZKOvp/OjOL0IR62o0xqmWwU2y6p3DSlwsA6JRV4QaEP5pbL2XQc1L5s+uyY6A@lists.infradead.org
X-Gm-Message-State: AOJu0YwrY0kThUbjETzxL6N/7fDJ3IShLKYHyFmG5tg4uiqVKzovwB11
	NsdvifFBSGDy5EHC+Ubu5qP9lr89/FeLasA4jrYGMV1rOqbZqw1j7WnX
X-Gm-Gg: AY/fxX4trL0rSdZTwTIc38rmWOObaWOP8vY1C88vKm54fgXb/m1+yuAjBDZjbOyFfJA
	+EzKz5QMdoGRg40JcpErq/3IcbInSRmx8FyF2Eo9c3I3CSerrAScyle1+Y0w+z3CrR4YXWlfdo8
	a/DCWjpYLvk/WtOu7B0Y9YK96q5JC8Ja2rBbt2QAAd+Ks2UDSKBl/FrvJTVfB0642Vy2dJV5H9G
	UV8s07AHZ1GjRpaIiWNLvtwQNtg4Ik24SYQHHMhniJZLucS7cBUWFVJvgvdDVjIEro6wQpc7PS8
	JkgwZNOnVlqhSokg+8bTnivo2UHsox6q4YSLm0priOSO+hCv1wo1fJtMo0xOm4D2Zzh0VU3tilw
	odNz5aiBKiQsiJLjj0HKW4PyPogkx6b8nUDWS61XK8W7psIWF0TMIo9mi+5OHYib7AcKoGOaKFN
	GDnRzMmT+5
X-Google-Smtp-Source: AGHT+IEAZMs9QfUDe2we6n2g+FitaNoCAtMAvZyB3nOYDQz1xn8UTnE5egrQpYntQN6837WRTsLoLQ==
X-Received: by 2002:a05:6a00:3309:b0:7f0:665d:efd8 with SMTP id d2e1a72fcca58-7ff6705d34cmr9495645b3a.67.1766391812599;
        Mon, 22 Dec 2025 00:23:32 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:23:32 -0800 (PST)
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
Subject: [PATCH v7 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Mon, 22 Dec 2025 21:20:29 +1300
Message-ID: <20251222082049.1782440-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002334_072163_E44ED33F 
X-CRM114-Status: GOOD (  12.87  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 64d69f5cba1b..db0559763e60 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -606,7 +606,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -615,12 +616,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -632,9 +633,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -690,7 +691,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -700,7 +701,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -754,7 +755,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -767,7 +768,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.52.0


