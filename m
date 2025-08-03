Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E03FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=; b=LgaGfHEhsQXqISTwHTXlbUSEia
	zkGdsMKlP0XxY4nz7UJWTFeW3oNHJRxAQxUXBuKhNDjhTzshZxgjFFC3D4lDMxyWyDz2OUKJe2kAD
	G9awFJbXTqpabzIMjTCoZSrXs2hYY+YnnRR1Bh0y8XXblE0QSDP8n4KNQlgesADr7QI0RAHiuY7we
	N1NbjnlH3pZpQ0dAiMphwi8eWf+tTr8855UwzgLfr3GQMNQVlW615BZF7egAAOtEuR5Q2xetSIVZ8
	S8vbPqVeswQaRhlOrVp1k0AtJWp3yJU5Pptph0R8tshxyDNA5ZpZGcz4EEizpv1/0Du94/c+J+2F5
	GXEV0JNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiREf-00000008O8j-3LOd;
	Sun, 03 Aug 2025 05:26:17 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsY-000000088TS-1pbP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:23 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e412f3a0f0so18938735ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193562; x=1754798362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
        b=BLPAaiFVVQlcFLKGt7dc3mog/KVEW3xj498+14LpkGdotLOeZ+PV1KuUE+6+IRZ2fm
         hnhVQ56VJDaTsThFYZZAZBHnRxgLtA+1Q0vjcN9ApaV1M1U0yoreCpuFdOtkBQJwdP6r
         I5u8EWHIj+8S8yI1aSKmuYLOXx/1dN6LXV60R8Zb9ONvXvmkZlUUDsj+2PLK6LvzWToM
         zfICh7zZ+ClZFQYcR9t5owOSfBJI6ZB8PSz2GRhXEIvb8jLffL4GORR6kg75SrDtyjyU
         kSE93urMYRe2edEuWd64zQicGB8DI4FgvOd6U5oNAm3kAqTrlO8OhNvqTz6hCPdCKWsK
         Om6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193562; x=1754798362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
        b=iCuuvyY47n3IMtO9xJInzYzu9jO7meq/RCElAM0rMiGvnEJhsLuBa2IiUriEREUqme
         sQ1N5NkXfDmi1Rb02QNO1MLXCDQL/Rn5F3ZBwZv/bFrG7ZR4CMVSB8UgSFza5+wtdH7+
         UmrtORTzsnbSuLaK8yaJDqC36mdHvOzJwGDtX6639f/j5w7INh5t6FTk2Eh+y5BSKxI5
         wHdNtpFagOcJhuMs9uqssPMycAdDUlT7FWNHrtTYI7yzuH2cABVyThGGIgIWSSmjnV58
         kO3CDsP64GGWfV+FVb0EjBjpQu5wTry9jrbaBXeEFshFj/bgm98jE4/DFSeVGNbtCK2a
         9fXA==
X-Forwarded-Encrypted: i=1; AJvYcCXyPrbGRzMbvljLIN9HubezwH6eu+7Pt5LgbHvkA8s9RILv0bb9ee5UCwOeSnFgbmjEseZ3MAhoXidezqk4RrXk@lists.infradead.org
X-Gm-Message-State: AOJu0Yysu6oY+DnThmH3DhIAIh/p4RGtont6iZT2/HGYDVnZhK6jwgyR
	Ops9emNmzwtx6WkTvE57ur7YTTtaQJxfdSi7/quW8XPoQ7IBcstt8tSg
X-Gm-Gg: ASbGncufcoCl5xaV9O+qX2PXGk/OFG3GZ75jzTq20X09zB65lPXYE59KL7txUkeQ+XW
	W1D0VVt027s5+I6qMv02BB6a3lJ2WJq9tOZsr76h3d73ny/N2ARwrIeEqYGwtjZVN7P70IBhRFx
	QgPfLtt7orzZQn+hX1Zfl/3MPKvCPXJ+ryLjKKc3jmzi12z6/yrlk63RnAebSn0YpKjWN3Go19U
	V9gaZO6NQjy69ZBovG1W9qBkOvp3H4nL1jIU2t4MRZJnUzywOJ1QwI58zLHHt0f4/i+t4n7ssXn
	5gZd0BSjbxN0+4Ub3Jusk6aHRFfWcmxCSm3bXB2dIJwIUIGGbx87FOCSEPjnd0BdJEDnUaPXmIQ
	CoFfbs1AbR7NhoCVhZ/ZYIJrk4TwrP1oqRuoYez7RpxHNPofU1rSZgasFNeEz6BrMYK88mrpqD4
	XAtQ==
X-Google-Smtp-Source: AGHT+IHkYA6Ve5qjyBOl298LajPA2dLsLYiKeEEffa0px/i/mFWvep0iac35UJUfFk5w3QjlIsT70Q==
X-Received: by 2002:a05:6e02:2382:b0:3e2:a7a1:8cd8 with SMTP id e9e14a558f8ab-3e41611a075mr96109765ab.5.1754193561731;
        Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
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
Subject: [PATCH v4 32/58] dyndbg: refactor *dynamic_emit_prefix to split lookups
Date: Sat,  2 Aug 2025 21:57:50 -0600
Message-ID: <20250803035816.603405-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205922_478679_0700297A 
X-CRM114-Status: GOOD (  16.37  )
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

Split dynamic_emit_prefix():

1. keep dynamic_emit_prefix() static inline
   check ANY flags before calling 2

2. __dynamic_emit_prefix()
   prints [TID] or <intr> if +t flag
   check LOOKUP flags before calling 3

3. __dynamic_emit_lookup()
   prints 1+ of: module, function, src-file, line

Notes:

With 3 only called when needed, print the trailing whitespace
unconditionally, and drop the pos_after_tid var.

By doing TID in 2, 3's output is cacheable in principle.

A prefix cache would allow de-duplicating the redundant data in the
_ddebug tables, and replacing them with space-efficient storage which
is not fast enough for every-time pr_debugs, but would work to fill
the cache the 1st time its enabled and invoked.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c3e27637d9357..26261b5f99f05 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -824,19 +824,8 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_lookup(const struct _ddebug *desc, char *buf, int pos)
 {
-	int pos_after_tid;
-	int pos = 0;
-
-	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
-		if (in_interrupt())
-			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
-		else
-			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
-					task_pid_vnr(current));
-	}
-	pos_after_tid = pos;
 	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
 				desc->modname);
@@ -849,8 +838,29 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
-	if (pos - pos_after_tid)
-		pos += snprintf(buf + pos, remaining(pos), " ");
+
+	/* we have a non-empty prefix, add trailing space */
+	if (remaining(pos))
+		buf[pos++] = ' ';
+
+	return pos;
+}
+
+static char *__dynamic_emit_prefix(struct _ddebug *desc, char *buf)
+{
+	int pos = 0;
+
+	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
+		if (in_interrupt())
+			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
+		else
+			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
+					task_pid_vnr(current));
+	}
+
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+		pos += __dynamic_emit_lookup(desc, buf, pos);
+
 	if (pos >= PREFIX_SIZE)
 		buf[PREFIX_SIZE - 1] = '\0';
 
@@ -859,7 +869,7 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 
 static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+	if (desc->flags & _DPRINTK_FLAGS_INCL_ANY)
 		return __dynamic_emit_prefix(desc, buf);
 	return buf;
 }
-- 
2.50.1


