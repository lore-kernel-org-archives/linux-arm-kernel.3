Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97134C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=; b=hIo+7ji1wk69l9qrswE8ioxmD+
	MKuFhCpItgl1dMzq0PLLDz7YTafk9dBoT2xeTzjNnCHTY69Bd7XnLcI37lUaUTqcz3DV6yNyihaSy
	n+xvBCL5ABx1rIVBluzg3SjqFE/LwMdh5tZR3LvkcUVInAzWTw2y+GlfJUjA8QsQ++xMv4j3yCc2F
	egGebdwzHIQsMpVCWYHWrt8foYptO+KjtZgkgwOHX3JET+NP0lUMYaEouKPuZLPl5/exK69v1IWm1
	frag1iB/wH+OSRiibobyi4+1HPpmY1kwZbIJ/WpFIf3l0uLAQfXxtxmu8BBI9lcpar5ANuZZeTlgq
	ieQO1AEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQ4c-00000008BHK-17py;
	Sun, 03 Aug 2025 04:11:50 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrr-000000087xU-2X9n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:41 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e3f378ea68so21342215ab.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193519; x=1754798319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
        b=NkNNC4bDRZgf1GovV2IutQ9fC36FigFeY5ehb4BPbcQjM161yRo3l5bUA30pp7vyOi
         IH9XKlnK54x/vFDBzTYBKTeVwGW/u3cxDdYkdxh1PDtpDOahS5Ppy2whDEoDnF+s9Bub
         EFPR/kKv18tJVrG2wJunqp3b6ZBltu4o11Dz9GwFUh7tN0Ip73Qbv+pBVlh/Ed7Hxs1v
         jb8oevYWTfi8Ti0SDDmE7An2ZTAVwNfKg19DDfPWvmtShChbF4ikBRG9DDIXGZ4MA1Nn
         wnuzhX8WU+BRxoMSe9CTkKWpeQMFYMsebci5u1rEakqa/ro8+wyzexyd2X3io3qQncqk
         WYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193519; x=1754798319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHGyuGgnpKZsaheli1wyL5zDNg4zEDBviVdaC5XZBoc=;
        b=iE1fHcJcnqs4Zyrny3ZPx4lf7AtrAOiNaBwhXu2wgF0ycHrJqDsb7wM8JODpHXkZTa
         2zdlf9hRG4r/yjY0kbMCma5gn8rTVz+PxNafVpkCvwvIM61XqX6BY9piQpLrsZfrhrFu
         uFnRL+KwTXVWpZDG/3qMWB1XhROCdIdTloYPfiEeKNJ0GABMEcWrhMKEegiZ29aLKmWo
         m0pvfUyYmsBcYnckVcxfF425dN1juI/xnnPNK8xlf+57y0KDCkRQjG9EQMd5BmGfWXn8
         XNSjweE1oJIe68RoUiy+BCqEYZNjxu3twb7ec6Q4HQWebZZO1DsSCBqiPJa2hP0HtPak
         fwwg==
X-Forwarded-Encrypted: i=1; AJvYcCWbLVQOnLOIvq95VTC/KfejVOSjF/09tFo7PPeoYyltZK+0jaByX+K8pnv4GvR3tbmRSP/pa1a8/PPoL3nB1N0x@lists.infradead.org
X-Gm-Message-State: AOJu0YxGlKv48bhEbvHnlEfkVdG6CpBY08V46sWyUzMCnqJm3He0AB5N
	3pQCoDFhcfpUa/Dw3n8DFW3inEiQiPgAlcJhyZgYmQga2SgB8sfOKuLW
X-Gm-Gg: ASbGncuRP1sfbI+A8cvYtWFGF5cOt/b/EYMpYQs6tFnwwNgSY90xuYiSS/D4UezHTxK
	+WcK/85AzuFDUAy4mPobCRIWT4uFK73jZ8wCZ9bhtcJi+4ZLRCuIEAEgka35JXQMFL5cd5VEZAV
	+tD9WQPrZSNkEpEouEGxL/Hsgyy5LMEryuqcvBdkI5clpA6pQDW4qHYiWhk7eOLUZjYtM+5EZMf
	XggfoRehNSRPQ6HcrI+QBxyOtg7uQ35wB/EK8DMpiD/zdRvQCn1f59TadIl2J6I81po3HitdcOX
	t9A6I1x4YtIBuV8F0SFlIb+SW+7ACHCGJ1OR2C/dSN0rk2cT3wXUTCIX+25fCJsTyZGUL6K6Eyj
	5KQWqjlvBEIk+cF3RSJxx4Lj76UmkmnsID3xlgnRCVBnPpxInz5ZddcoJMxlCxc5urwUrUWmNoY
	vPQw==
X-Google-Smtp-Source: AGHT+IEGWj5ry9FocCclfChHk3bFL/qs2Ye9qIuJae5+Nv+8XnL0ndSBGTCV5nBBUROVehINujYa4Q==
X-Received: by 2002:a05:6e02:148b:b0:3e3:a1eb:4462 with SMTP id e9e14a558f8ab-3e416116bfcmr104124655ab.6.1754193518936;
        Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:38 -0700 (PDT)
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
Subject: [PATCH v4 04/58] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Sat,  2 Aug 2025 21:57:22 -0600
Message-ID: <20250803035816.603405-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205839_651974_7440DA7B 
X-CRM114-Status: GOOD (  12.05  )
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5a007952f7f24..147540c57154b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 
-- 
2.50.1


