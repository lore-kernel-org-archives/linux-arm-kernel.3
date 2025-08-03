Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB7CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=; b=K/ckN7Pwhn9x0UR8swWytKrzG+
	x8L/iU+mjbf62YTSoeW8UbFmglQNTpNx26mP+Y107PchLgcIfTdKbk/ywCyMiQkmTkQay51L4wJft
	Py4TP3VT6iFZ/q439D/XaLEmrh9oadjsXuC/88bo7u7kLrCpWP19cuN9RsO5BlPtauTd4yuAtGJZs
	T42hBsNcyp07tNwMBHe+NNml7dKVsf8THk4sYl8fxEgjScF8MoSNRtAxAydOLZkKcvjEA7jiX1XW+
	p9yw8jDLf+0mYeXhCI/dyn8UbZJnAQnfg5Kn2/ERre2TbLPWftbW/kQdVHjTrzd6a/bnIAxYRkBoM
	7aGWH89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRC5-00000008NcI-2ThN;
	Sun, 03 Aug 2025 05:23:37 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsW-000000088SM-4Bw4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:22 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so9951305ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193560; x=1754798360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
        b=XvaJAty+k5UhcZPFNRGFr/DNl4EV4yKXr1A5F6CafZyt26nVWf/8pmReMGAgi1WmJM
         tl7/BDgOJ2rJjhYTrl88InYPJ/ej+9l9+gR4sVUi8ICfRCdw2IK5anUPUfF2EXVgA/l6
         S8HUQsjuKAjwpsAQ6gLJzZ5p0QNRhHmw4x10fzKkThKocg+V+xg8Sof9WePpW+4nTNfL
         JIrjMCNWrqHYPl2dPZDyZLWoudCt/h7ViEHPJACT4yDtDu3auFoJJdCEWZL0qFyV/SBN
         iiOQlTG25ODiuToQr2y6cjHUCUrAsa3exTbYAbVh88euH6jTADdJpwg0cWckn3ZPYgL/
         Z89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193560; x=1754798360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtM07pJzYNN+E8iBAeVUHbxcWX+I3Pz7zufEOWphlcs=;
        b=kRfp3Ld6xdeRmFd/45x/hrTDnxhl2e8KrvJ5d+5WKpXl1YYUe3mAt4ZclbPyfxHJ4q
         DnbUdD7ePNS/5vVPK+6Ieqt1OU05AqnlLdhnKpAm8DoK+E7mr9GPgzQhQx87RQ4SSlOm
         KC6ubd9YMDU2kTDFpvfYiKNoWm4MMqB3gDzvvfCCQPayxfjpR51zUXDaX1J2auGF312C
         E48XDJbo9OabCieZ1+JdojcKZciEq5CsiNEh4mNyaZ4YG9TKOaWm9dgC8Qa/tAmnWOxJ
         ZDIFzOxwTlpQ1eiouQe5+q++TMBwACgId32MCi+oJaKU/bfeACrf8/eNhwGQZZY4LHdH
         jyBA==
X-Forwarded-Encrypted: i=1; AJvYcCUFb8frseuos8eK1UavUGvq8Cov1mWnHWrUc7EU8mG7jlCjZkKrC6cpQhCjmOzBkC0fWSzuEQzE0TEebYexDYM/@lists.infradead.org
X-Gm-Message-State: AOJu0YziqRaABeHX2FNv7Moi708Ou0DrHFYHNXTf8FZqxCCd+1VK/AH4
	O5FfitjtFePJEKhC3Xszl6ZfITgltQsAXnFb1sRLmx27ib4wVBXAkZIn
X-Gm-Gg: ASbGncsUjKAV5ySKiisbq8NfVfTfu88umqSh8Rf3mlBk7EWyUMcYBy3/JMOHI+BrglZ
	W4bZ5Sxq8OIfqdQziziTA9UI0e4d07ndPzHgX125GFt9qf6COeJ79Ufrs2WN7YB5AzqyxojgHGs
	TP1Ht3m4jd9vTdGgOGTw/UNfO70AakuzhLWzL9Inp0kystSauvTyiwvYNDVtWASak7BeijDfIk8
	wkEKrK7pKyAJ331zj/Z/E7hNLs1LW5KqODVNzkVlnhZaox3+XmEpoGAAiwY21YbrReHKmD8wLh+
	UHi8TouZiTxjN1uR1MOdJTNOVtYzRC6zebinn+z1uf/+F6YljVNXRjH/FEETObHoi2qZxBCCzOL
	1/L0MkBxBEZH+Qz2nYNJMOoLYQ0fkGCHrA7RScWCndKNxaSAgMQSu9dIibfpcji1mz1sg3q8lcc
	f/bfRuVQ8Yu9wQcHiQ2zPV3sw=
X-Google-Smtp-Source: AGHT+IEkAFQydYpFJvb1kzqjmURuxfZ7yJ+hop2qWEkeOQ2xbV3exZjxsMe8uB4jwvdg4HEc9Ir9zQ==
X-Received: by 2002:a05:6602:6206:b0:875:ba1e:4d7e with SMTP id ca18e2360f4ac-8816832db31mr945512039f.6.1754193560218;
        Sat, 02 Aug 2025 20:59:20 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
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
Subject: [PATCH v4 31/58] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP for +mfsl flags
Date: Sat,  2 Aug 2025 21:57:49 -0600
Message-ID: <20250803035816.603405-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205921_041649_F8A4F6DD 
X-CRM114-Status: GOOD (  12.77  )
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

dyndbg's dynamic prefixing can get expensive; each enabled callsite's
prefix is sprintf'd into stack-mem, every time a pr_debug is called.

A cache would help, if callsites mark _DPRINTK_FLAGS_PREFIX_CACHED
after saving the prefix string.  But not just yet.

_DPRINTK_FLAGS_INCL_LOOKUP distinguishes from _DPRINTK_FLAGS_INCL_ANY
by selecting *only* module,file,function fields to compose the
cacheable part of the (+tmfsl) dynamic prefix:

-t  thread-id. not part of the "callsite" info, its from current.
    doesn't belong in the cache. it would spoil it.
    do it in outer: dynamic_emit_prefix()

-mfs  module, function, source-file
    they are "lookups", currently to struct _ddebug fields.
    could be accessor macros to "compressed" tables.
    then they might be worth caching, ready for reuse.

-l  line
    this info could go either way.
    I elected to include it in LOOKUP, so in cache/inner fn.
    this makes cache larger but avoids sprintf %d each time.
    smaller cache needs smarter key.

All enabled together, they compose a prefix string like:

  # outer -----inner----------------------
  "[tid] module:function:sourcfile:line: "

So this patch extracts _DPRINTK_FLAGS_INCL_LOOKUP flags-combo out of
_DPRINTK_FLAGS_INCL_ANY, then redefs latter.

Next re-refactor dynamic_emit_prefix inner/outer fns accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0f7476456614e..d64f13a7a7394 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -40,10 +40,11 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
 #define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
-	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID |\
-	 _DPRINTK_FLAGS_INCL_SOURCENAME)
+#define _DPRINTK_FLAGS_INCL_LOOKUP					\
+	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |	\
+	 _DPRINTK_FLAGS_INCL_SOURCENAME | _DPRINTK_FLAGS_INCL_LINENO)
+#define _DPRINTK_FLAGS_INCL_ANY						\
+	(_DPRINTK_FLAGS_INCL_TID | _DPRINTK_FLAGS_INCL_LOOKUP)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
-- 
2.50.1


