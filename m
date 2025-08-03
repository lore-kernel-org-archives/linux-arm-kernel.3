Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09735C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=; b=gYiULehxZ79JwEN3cT4dIjjxWk
	3fpNCh5Aa9nLjiyJQcQVjVmq0zS18cJ93nI5Ywl9VJu8Un8buEE7m8Gsk4eYxm0LmmUPZ3dYhnfj7
	NOpytfGyPEPrVd9ctmF5RCpQNvo0H8vQRZd4U0eWg3ZsC4rZqvBXh5vM2me+54m1ev0hYygo+G1VQ
	eDeHq/ZcuR+9ETUAdfNp1V1uYSmxVXp42o/uDzV3NBKoOHDmgq15fRLGhb+mne6oNFzpIperukPba
	2XLO/G2y3Zl36FGjB9LFd79lsHXnHdVZqlJXAqq7ZSTTAVbBcG9QrNHr+OfJluidctdJxdZqGZiZJ
	Ca+RSOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQ7B-00000008BQT-06Sc;
	Sun, 03 Aug 2025 04:14:29 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrt-000000087yc-0tWL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:42 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3e3ee9c7815so14651395ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193520; x=1754798320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
        b=j1dtocafYyhB9IFYpcPZ1a8LKH1EisUOS+b8bzgzpo2NN9elXJtMiokXERUFbiCS8A
         5ka6rWOnCFmtazj0xpbd4XHNf6L9HnftouqqjtGo0fg5YVhmHCxForz3VkSDbTDcFDYf
         2jH1Tiy9u6M6D4JvfBnV+UASPqr3pR69Q88shSTFnT1eRCsp/9EAMKIOECnGTKwCShuk
         EjjrSHzGQbpJRkTZ823rxd9P8e0d2cDuVywuH875514P1O0L1SfeDiHIuZAsfcj+T7kf
         o/zlpsIXsAScQPm7aqABgs/R5kuWwjG+f/utnF3F8sz7eHsZ32nnAoO6Fk8qu3o56+9l
         ye5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193520; x=1754798320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
        b=pinOWpJmG9Wt3j7rSkabfh9cK4FrRD0MQz84nl6NVY0QSaaFZl/m1Gh1qket87NomQ
         hrTL6LQQ36pg2G9fpZzqnfXpir7FhEejR5R9OOg4H3+osZil/IYiahbHWoi3Cv8Q7Q+c
         gsHcx2bpzorv5yyVClHFY7u91nQyfHhopdwoCbrGrXPHjj+mWnrTfuGbPCucTbkEgbon
         QNO/PqolIPwHqV32GLLUS4En049E37M3VyW1r8Z8GQ9faBuomM73WdA+5LiwBTD/ckGK
         YI5NbdyLlVEBXidSIV31tmpm+8K+bKP1Pyvxuc9XkdJFzKCBDLSTYmcXvbZm2/6lEHEi
         pkSw==
X-Forwarded-Encrypted: i=1; AJvYcCVJWW6vTflILYJUEkfF4UT72lqZHcDlkNHS3Uh3Xc8CinFpNttS90h8kiH/Pb+J2CzvSJRXn8oy0Dj7H3p3DPkV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8bP5xluw654I/RTACjXBadkwPvFyrmq/DzMUFGHPmsmAL3aBr
	PiAtEJwCD9LytqtchmKGMgLFD9xADSYp7FkyUd0piswIdxLv4z7ulPAZ
X-Gm-Gg: ASbGncsQw7TtugGUhb7xB1lvxLTfx6k5LJqxiy4VJlNt4irKJXM5VfX74JBY5ZMYcXi
	2yRvg2d0ww29BU1DlpggyqRReT8/9T+3gj5xLg9tWzy0sg5vOKvoOBaJrjAgY5d3yquakFSQSEy
	2mlaL02oxLnSXCaUqROdoRxpdqNs9Iot+lLud7ClIwPZOHuG+QqaZdbz+hI7Bg4r7U9YvUnKM4e
	HwO8HHLaWDsDfrCF7Iy88PH5Rc/vQ8WYPVn3YfdyQ4rYhS4JbC9McNaN4QuF26nNWH2vlUfvBA6
	MExggof5BtMGaMfthuhY+53qnu27ILj6XwOANlRhBwPNAY2/JBYH2ApieEvjY27mGp3kVaQhK3T
	SMToAnNeqMMI+3v4u9YLRsQhgTOEQuReYUvciRh6rpOdUI5BBvMm8lL6y5novVHoIGTdBpsxc4w
	6ZBg==
X-Google-Smtp-Source: AGHT+IHF9fqXIQ9Dy28IS+EYItwaYkEB1EPsxWBXZaRJEXylDi+/C1dLpmjsAMSA//MVYJtcdRokew==
X-Received: by 2002:a05:6e02:360b:b0:3e2:c62c:5531 with SMTP id e9e14a558f8ab-3e41618bf16mr95994745ab.20.1754193520351;
        Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
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
Subject: [PATCH v4 05/58] dyndbg: make ddebug_class_param union members same size
Date: Sat,  2 Aug 2025 21:57:23 -0600
Message-ID: <20250803035816.603405-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205841_250188_4B83F5B9 
X-CRM114-Status: GOOD (  12.63  )
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162a..b9afc7731b7ca 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 147540c57154b..55df35df093b0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.50.1


