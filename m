Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E2EE8FDCC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev5dZu+MNaNiCXAmHypJMGG2mZAu4GrojXqEHePJJcQ=; b=m6SLHpZTHLwp/89/fZN8ADRy06
	AZjbaloj3K1FcVMGdWZTnb7D3gaUDLdqmp32fU0yyeGw0z7zyx+ccoBA95guKSTMYZ36GPyfj0YDo
	3ahbpEM/p2TjDEXsFRcuzXgBmEHp9BR47faD5HShH/zOm12Nv0rWqBBG8GWncTPH1nSlCyFPTXOjm
	tGt0wkZSRigqrUfA0lVifMWZEcRKRv0V1z1EY9Px1ZtO4eBsGBSdanXdUemsklNLIcrKyL7txSvm9
	7b9BY7Fq9atlCDJmorPEnLMvI8Mr7CBcyHrf7+m6Qwe2zDLKSdm1T6RAnqwooKMpVeK5fX96DbNg5
	HzBpDknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBr-000000021f4-0gwI;
	Sat, 27 Dec 2025 14:22:43 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBi-000000021bS-0x3C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:35 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-459a258561cso1566786b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845352; x=1767450152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev5dZu+MNaNiCXAmHypJMGG2mZAu4GrojXqEHePJJcQ=;
        b=m3rxj5q1pTNc/VWchckQ9dg3YcNo0Ojg3h/09XuOm3u7zJhD6sB5LLZA+41Ayi/ega
         xdODpolbDvLRtu042egyaBeR2JuVsGE/TXS4sn8FmYwQ3Up4zbPmEc6beEDJrk39Z3J3
         JQIujfzPzru6G/tp07gKe6veaQdnNmcYK5axE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845352; x=1767450152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ev5dZu+MNaNiCXAmHypJMGG2mZAu4GrojXqEHePJJcQ=;
        b=ZKKTlNvFHK1dcl1nqDg8Lz8brbwXpJ+7k98tde+WPLDN5kdJ0LL8Jh+9c5VhvD+Ine
         lG6Kw9IHqUmxJX3riOP6jW2pJ6eX4tueZoGUXN7ufLHHxqRG6MoxWZ2vf3ENsZyPG42Y
         0Vk2k2G5smFjfaNiVwk02ZkWYECtzlySQhpKmuTsTVnw8/ImkuYxfVmF3eivm5oA+L4x
         FzhJmeuDQY6/sHeh3gyop3aovW0w5fMysKFmHnPyBgADVkwRKTPPPAKEjQOvyhY0sfJv
         bY8NuAwvFKtf6gYYizI68RouJSP6YlVlcMVqq17Yb3b5HIUiChdjvXG9wkmFiuqPSTE0
         TnKw==
X-Gm-Message-State: AOJu0Yxi6dFwrxzrP53IdciiS+6qDZyv8JnsA0+UXtIdBLx52pIthyEP
	2ztZs/XnYYBlzzJaAlMCqjPPVomXoJRncgG71u1fM8/NmOhkfUsZCWuQvRGEua3QI2+0kzbka48
	Yedk=
X-Gm-Gg: AY/fxX65ty1zfui3/MNNIbg94/UYlwRvw8W/NhDgRng8kZQUobFrZyafE65ssPGvRuY
	maG6V+tl6TzroQgmLM4m33U183SiVUnTfHLfY5ozWA47aZDu98WiawQWox4nGHPE10tMmNMIMsq
	0smnHH8mzBzV4ZvtfWePsNWCsjhIupapfXsXtbJ1+eD9sWSaU0Qh0uJBzPFVTHUa1LeLfAYnFKd
	VzrFX+HpHHFgQryW/kzTh8UdThxi4JzX3ToV0oluptCZTnAS6kU4I8VLHv7on967105JzGBq6+D
	dQGifh9kEMvtFBzK94oJzJdzMdMBp8DA5p+lCuxx2uzrd0qTyhYmd7+zP32ggu3dSQZQzn9ID2M
	djeOTNUyo7+/T2skCQQITRhORImIYhXuByV5AGvDZGLeCw9qv4+0J9FbHbv5moP8HROyNWlrhJk
	vF0RBu
X-Google-Smtp-Source: AGHT+IFbD2T68RWby1LSxTFnHXAreDJGvHAACCzMPzQU2qMbAT3eAIYfVlwPjWmULM1RMKcUvRYWpA==
X-Received: by 2002:a05:6808:6a83:b0:450:b92c:aaa2 with SMTP id 5614622812f47-457a292c4d7mr13567904b6e.18.1766845352225;
        Sat, 27 Dec 2025 06:22:32 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:29 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/6] scripts/make_fit: Support a few more parallel compressors
Date: Sat, 27 Dec 2025 07:21:49 -0700
Message-ID: <20251227142200.2241198-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062234_268451_B4DC183E 
X-CRM114-Status: GOOD (  11.71  )
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

Add support for pbzip2, xz and plzip which can compress in parallel.
This speeds up the ramdisk compression.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v7)

Changes in v7:
- Mention xz as well, in the commit message

 scripts/make_fit.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 7ddaf3c0d783..defb87f223d7 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -50,11 +50,12 @@ import libfdt
 CompTool = collections.namedtuple('CompTool', 'ext,tools')
 
 COMP_TOOLS = {
-    'bzip2': CompTool('.bz2', 'bzip2'),
+    'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
     'gzip': CompTool('.gz', 'pigz,gzip'),
     'lz4': CompTool('.lz4', 'lz4'),
-    'lzma': CompTool('.lzma', 'lzma'),
+    'lzma': CompTool('.lzma', 'plzip,lzma'),
     'lzo': CompTool('.lzo', 'lzop'),
+    'xz': CompTool('.xz', 'xz'),
     'zstd': CompTool('.zstd', 'zstd'),
 }
 
@@ -207,7 +208,12 @@ def compress_data(inf, compress):
             done = False
             for tool in comp.tools.split(','):
                 try:
-                    subprocess.call([tool, '-c'], stdin=inf, stdout=outf)
+                    # Add parallel flags for tools that support them
+                    cmd = [tool]
+                    if tool in ('zstd', 'xz'):
+                        cmd.extend(['-T0'])  # Use all available cores
+                    cmd.append('-c')
+                    subprocess.call(cmd, stdin=inf, stdout=outf)
                     done = True
                     break
                 except FileNotFoundError:
-- 
2.43.0


