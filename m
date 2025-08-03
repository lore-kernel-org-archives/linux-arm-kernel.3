Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F17C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=; b=r4MD9I6cVOyBdxrZ6WBOZQTp9/
	9EXVfGuO7+pAk5TNGipwC3CmBJSA1Z0tp+B1ml/F4N4nGBebktrHNJmQyz57MLpP1ebDcV8uBf+h9
	e0zQXlL+/aBNQydAcgQzBD1TE6rmzdIhb8GZCbe1i2022Vf2ZER8XbkEcv52iuscFS4TpgUHtAHWE
	ImGsnsFUftbzpX/vN/j57lEPW0a6++eXUbu+0jkBhlzhmEpubTWY8G9qUJsOb9Mlh2jhLYkKmbpps
	eTv88vwTrHRzPcI5CBd+YlvoeCAmLILyNPKScJCoQApdX2Zwkmi+fCTwhCN6welHvnhoeBiNnjU4G
	DfbNWxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPws-000000089i7-1B7e;
	Sun, 03 Aug 2025 04:03:50 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPrk-000000087t6-2mEX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:33 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e40050551bso23417335ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193512; x=1754798312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
        b=ImiIVacbI3oqp0J14jTmyC5f4aR9/e5Vb+qDOOuP4nwKGR8kfFvo/778cacs3bV0zs
         hyojW8F+c4cJdP6THuYjPBbfmiHs932lfUMiFiq8SQK1d9SL9lPc7FNYTcbVByw5m3bf
         8fTXD9JE5KKblTh0L3OohFSWaDN3LjWk6ZVIZm+DitcvO1Un7+Z4yzZqkShTUuVecCwS
         ie/+gyhtGa10NYxRfALg3oVEf8+eKXAIW6YG6xrfSjWWXJdq3wH0vL0jZqlZBIQa/7SJ
         8w2cNQaRCXJ9Z+bkR2idhXEWXW3tHX8gBtIksEU4m6UIdsWqyBtH68cp9Eh1l7fxib+i
         T5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193512; x=1754798312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beSu7CSL3w07WglnJy1Z2nCCA3tI3eTc18tKf1Tqulg=;
        b=Kr4SkTb3LInyvJxgNzZ1UpJzl08ZpKNNBa/dtRrCukr7TK+ywBj2Os9xoFFlLi6xdA
         Q9tTxo0Ou3n0yakU8n/hu7iZwmf4LMO7mCWnlsUab1XE/ylb86prqvtEszQc8NBAOuym
         JC73zlpM2BZa9scvnX7eBO9bBDrN8J9q4OgN7Zht9Lt7ZvSUztrf2AGY5Ean45QOMURR
         ZgQqDbOjxP+6mh/D4i2IJF+8n/7N8HNjhQOWeod4AhnGoSAoBKfJ5oyJBokbUo2D2qte
         EUSMh108snNZN5zA+A2GjizLwc6n8G9GFKfhy77Ay68AsTEXRUFUPvkvEQaokmaqq2Tm
         wt8g==
X-Forwarded-Encrypted: i=1; AJvYcCWbFdmBnMJGc612BcPKFqBY+NyP5OqlWfIE5n7wfkwOAnda1wGTy5ZypjF6/gkPxSkU9IHvn6IQdm9kV+yr8Z5b@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3jPVe4QXc6HJR7k6UEKQSYmmiHfDRcWh9OCKkQrxc7vMqZ3Q
	uEzT9CDQvbKWdWUoV874zmmyvHOiTZhUKK+gKKKlTde5vWGQYSdvD4yH
X-Gm-Gg: ASbGncsXh+C3pQtNEVGCdzorYe5EaoKP6BYyIp90JfNKaDmch4PQs5RT5qocTT19lv/
	IJk6044NjEin2a6wu9pN8owbtXf8SaMykFQKbtmsXKl2inl8o746qKtWvObdf7YdyRe5rb32qUV
	uOu3/zB4193VK8EEzJRmkEz4I1dZb2p3lvljMIBS2UYSyHwcWYPQXzmbUMr9+wJJW2KfU30oAX1
	oRqkrWgm9oOF7sim7w6WG65JnKxtp5E26ICf7Yovc963k41sLwCIw5lfd+XLeuBus0k8QiNpjMG
	N9GmTq7cR4HR1MN/SFffWGlIjMwzZHkp0rEm5kU75UyMcoZ0nXP7IvCdnTrWliJ6iJ6rZacTnMp
	Lxx5KGmFR3Pj8oNd+u7etf0+HgbMd6MUCu49pjMXs6Ccs8B5CDtF5p1bMgw3UqmmPkZHY1+8bvy
	qm/A==
X-Google-Smtp-Source: AGHT+IGPxms8wwqy9B3Lg0t/TQmY+5ADcF8m62tHbLa+p0mv2IAzywY5OepZnyyKE5NE6pgPzLJclg==
X-Received: by 2002:a05:6e02:2608:b0:3e2:c345:17f2 with SMTP id e9e14a558f8ab-3e41610a08amr92075105ab.3.1754193511817;
        Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:31 -0700 (PDT)
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
Subject: [PATCH v4 01/58] docs/dyndbg: update examples \012 to \n
Date: Sat,  2 Aug 2025 21:57:19 -0600
Message-ID: <20250803035816.603405-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205832_708418_100B580B 
X-CRM114-Status: GOOD (  10.44  )
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07c..4ac18c0a1d953 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.50.1


