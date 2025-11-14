Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED744CE7B12
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=; b=lllcSmVyP87jCsxn8vhKr8dw+S
	fDyP4GNa+wD9cdqmSxjOzR3NJlAvE8+P7000qIUd9bsxlSs+nVy+tlZlAm17rrRsZuSm45c9xUVIA
	ZFHaycyTjMzTLSCHZ4z/vmdqZGcCVSSTDPaaJLZQXJDGuQc3232mT804NlRM2rWKFJXmEX5a7KY9r
	TYhYYnhgDLTya47Z61FZiv3Y0F/0C0CGNyTEqvROYgVDAGXIF6YtUy1EhnuA2ukwpkh3ncKYJuKVA
	pGUo7V9HOHGzguLStWFwiwlqO39H2zPm3G7JxYJ6Hh+aiXvzlt/DaICREOfwnGAT8sz0uLVkbW1vd
	Ww410JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumj-0000000CN01-2aSD;
	Fri, 14 Nov 2025 14:28:21 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumg-0000000CMwv-2EF5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:19 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-4332ae0635fso16021905ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130496; x=1763735296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=;
        b=dUl/3uGsYQtUA3JWQvI0gYOMavfRNvHKPAq9GdOJX0nZYVJ3YG7lEEAbgYhne88nW/
         VbfG9PT1DLNghmxQyV5WdaPJXjqYGWgkj9HnFYzKwBE9DzTe6gct5GxdvF+q19gjVG4O
         CJvymZRpcr/Ce+htQUpkerlHk6FjT9MVPKIt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130496; x=1763735296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=;
        b=lElHpCxbE2HGb1Zx1ZVMwDxP7wQs3evKIbkfElPMHPsj8nqlfIZ4VROOxa/lYREupD
         iZqX2bOBMa5EEmZ0+Mad/ERxHkHeBIll0epbYbYSLROyzk7tRbh/DmFTwVXcHe91Zgp7
         jG8+PTRNLcys0e2HUjRmfVPQe4GVSRweE8N7XRPIpBgw/bjnmpX5eK6gEWPbXML/Js3M
         n2MSCI3D+wlBrlw9ExAJNjMx2Yyexldahavpfvm49o7a72OddN5WSxqgWpGRA9r7hpgX
         yrTh7yQwyLSZQ6KBAnL5jcFmWq6a2CYXnyu5QKg/t+GZfhDmxp8S0XGri7DG7/w7R9CH
         SLRA==
X-Gm-Message-State: AOJu0YzFAPlxk+VQpBXbFiBRy1uBWuwsOXbIF1mi9u7xl1+lprawvXy0
	dqPxOwjMhZQEn7+EWLSDCCqDrhQctF1ARuxEKGY9bZOQEndkHvV7RuQM/iiNiKg0Fe6XL5e69TW
	44DY=
X-Gm-Gg: ASbGncuZO8eO8HbUeFDypVqBYd8CmOc/NJhsVaARNwYjIlPjxr9xsWW+Y2LhygZqXq9
	5+yBIFuwhlx0uvtowx34VLMUhxhVcXPEzDoE7HgXefhsaCO3h4sl2UIKYUSSgkzPKRaDbWR+2JG
	yKYe6mgxbmqYjvU4GezoXRqbBnPnT9m/5oG0IaQl6WO9IOE8PGDgGqBw4kc4BKXHf47UE3JqcLT
	04+dYyoizPeVd8DivJHup/ObvD2KzCrwttks0zMyxbtghrz9H/bt//MVg0Kclrn80DnvC1GklbM
	Z0wJIsZzOt1C4AYtKPUSFBVTxzmp4jyT6xU7HT4QyVj0GJlSo1DVgfMYf0vcMVs5ueQNJHFZhwJ
	SZtlR8EvHh7OT4Nht/8DELzHVa/MudHd9nPqUpXFYqm23Bfzqqkag0M9iVRFA85gSp0j6VPfdqH
	1OD8Zv
X-Google-Smtp-Source: AGHT+IF5K+GTrsGobgCXU6IqK3u5VkD77G/MeCEjJbWOyc35yy8/I+punAVonCr1oOz6r5VuSD8dEA==
X-Received: by 2002:a05:6e02:170e:b0:431:da08:d652 with SMTP id e9e14a558f8ab-4348c7d3099mr51311895ab.0.1763130496474;
        Fri, 14 Nov 2025 06:28:16 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:15 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/8] scripts/make_fit: Support a few more parallel compressors
Date: Fri, 14 Nov 2025 07:27:33 -0700
Message-ID: <20251114142741.1919072-8-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062818_577599_DF82BA4B 
X-CRM114-Status: GOOD (  11.07  )
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

Add support for pbzip2 and plzip which can compress in parallel. This
speeds up the ramdisk compression.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 scripts/make_fit.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 3db129f40b20..10a040f4eb83 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -57,10 +57,10 @@ import libfdt
 CompTool = collections.namedtuple('CompTool', 'ext,tools')
 
 COMP_TOOLS = {
-    'bzip2': CompTool('.bz2', 'bzip2'),
+    'bzip2': CompTool('.bz2', 'pbzip2,bzip2'),
     'gzip': CompTool('.gz', 'pigz,gzip'),
     'lz4': CompTool('.lz4', 'lz4'),
-    'lzma': CompTool('.lzma', 'lzma'),
+    'lzma': CompTool('.lzma', 'plzip,lzma'),
     'lzo': CompTool('.lzo', 'lzop'),
     'zstd': CompTool('.zstd', 'zstd'),
 }
@@ -220,7 +220,12 @@ def compress_data(inf, compress):
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


