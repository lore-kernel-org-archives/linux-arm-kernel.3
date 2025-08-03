Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04139C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=; b=YUlyQZ2l5rQiqNYG5X+amFVgle
	RhcaSyFIJbzaTPw7rBGN1y7eYSBzSWkNGEQ8QxoAD+PHkAL9Ucg9PV+nqO8LeOS3YfEIeuPKrDA21
	ON1DqMOALDoy5GuZ28NkS/zUa7o1/2JHUszBhRfhXMu2/LtFJriMAKLg0sX3QdeC9YapYxPCw1oSP
	FLLXbP/uOgMKYF3smTWmQ+11Yu6QWhuujRoGDkVAzmz6u46cGLuWmx8L1N/cC0zRKjforxdbn2iKE
	HFGtiH+/ot+ftnCTHfGnygODLmUw+6Q0TbwVEwBZlfox12nUGQpboTEhc+Na1K4w/SfjRTswAfGzp
	TePWkUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPzS-00000008AEw-2n6K;
	Sun, 03 Aug 2025 04:06:30 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPro-000000087w5-3GSj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:37 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e3d94aa969so14694915ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193516; x=1754798316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=lUqFVIWoMmdcCPrnKbweTFmG2kPyvbeLPFrwc+yUbKRAdt4GYb9QSGksK9t6SVVry1
         B5ER80REY1YALtcmiSwM8zEp5jG5cNvFpOdNDdKLwMndPDk6iugqoFacIofeOauwXc6I
         WO7IXtcdnqDbsm+5FMWH9c5kAT9FMoBlYKWQi06atMsK062R+obFA09z3GGA7/+ArhCm
         O+JbpXa4tCjJ95ZKKoyzdzQRnCiJmqNB6LM4vmDrMIFhd3OmzLxBCFKDkrC5ePDnIN2y
         aZKJZHK6I/LRp1tcItVbNztZ/LT2ixr/W+h3mgzseeAxFB/1zlplDAfEj8dKu+Yu5u1c
         J7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193516; x=1754798316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=d7lbHLTMWlLjIDOmzzonIp6lpMl35c8TfNuHeYiF3RyoXlggrdyFIu3f+tCABvpTmZ
         AOD9HAV7iiKhSsKTSuYABVcFA0IvLpAtsdmHLXAiRxy65cpPcIPhxPtzTXqEqCFNFcXg
         UYRRAUyvU76t8abJNaZton80Wcksy1Kyb32sdemMN3IbRLymqPqjL+Y9b+hFGWT6nQ2j
         k+vKZIsJvreNs1ujvm5wrdSxeRpP/rbt0iIos0kmIzKGhKFw+ZuJdjmktYl3T2/st7nX
         nSbtcd0HkQxQ2kjSquhXT1T32SNGENw4rlLHCy5c3m8zcC59k8LJaNo30wgJ+YYOHJJn
         Dnbw==
X-Forwarded-Encrypted: i=1; AJvYcCVjVPZhMKvOTtfxZks7TSUjIZQUdps4WLbnm0goDJE+j/CgJEVwCoiZOYVLms11pDWxnXsANZQDNWes/n4BGacA@lists.infradead.org
X-Gm-Message-State: AOJu0YyDr817OKrgtva5GZN/VD2y5Rtyn1rm8Q27bjaJFZROZybc70yr
	qQMIJs8wlSmInqptFsPHOvueF/MW3590ldy99udBWn7K5E1mLmicoVnj
X-Gm-Gg: ASbGncsom4mo3kHekpWIW49VuHco0Z+RedxKYKNeebHJtIXfo07GzJglmN1g1jgAEI1
	7iHgsI1AH/RVylaUFnu3XnrfFdBkVvAz4Hzq/IhhuW6fIJaBosWjrbVz7I0jwBIhhPAKSOHbbwR
	BNbbRSrRdlmFXGGCnBMec6DmEe7m5c6rtSOE9TvF7ZtQsPnGCMZC04sys8+0m8wLlSJeoiOZpuz
	4rqln+7W0Irg9XCrdyf6GLpJyy/7k0ZJPP5AwyWAA0MhUX5VqKAbaRkh3xhVd2RVs5RD60urvaQ
	vN+YfRp9TJiGf/MAUIrO9PaP1ON2ZLyLVZtdePrzsclDJvPK+Cm7LZ3CWbI2rCx3V1MjsGZgyHh
	ZwDYlsqTUHQUzsDZPy4VhBI6w1R9AoM49OEiYY370XKludOE7Q4GgJjIDSX5a6RMbUVs4o3lKHV
	q8HQ==
X-Google-Smtp-Source: AGHT+IEFfqhK3Yu96GZwkzn3H2xfn17hF1ni9VF+BRmo2ZqR7bTqyB9jhLRitAgzMOgRv2m2JMXKjg==
X-Received: by 2002:a05:6e02:2612:b0:3e3:d8af:3847 with SMTP id e9e14a558f8ab-3e416181770mr93924425ab.16.1754193515916;
        Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:35 -0700 (PDT)
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
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 02/58] docs/dyndbg: explain flags parse 1st
Date: Sat,  2 Aug 2025 21:57:20 -0600
Message-ID: <20250803035816.603405-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205836_812955_27E760E9 
X-CRM114-Status: GOOD (  10.84  )
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d953..63a511f2337bc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.50.1


