Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1088FD41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aipOaJuScwfExD6+bFm/ZBqxUEz6heXJaJqy4EsM7Tg=; b=VgvlLgJGsXSFj/C1Dtxn1zc/Ii
	6gWyB1eR1xnl0OUCrXmyqKS8HTAWf5VRGeTAAfZS/6C0q30PxohINPg8kS8H/09EgaZqUO+3o7DR9
	CYrybMlVO9VDgWwy68Tkb9iC10qkxQRLtW9bYb8MeW8hH6Ff9sphReCfsVud3CanSkygHfKJ24Kb6
	/7/ewRPMA+NiKPs8nR1mZWTTgB4MdTD8ZjY+X/u8d+SmT1H0ou5JsYdN7CnRmQbnwhfTXTIhVoXZn
	96hvJdRdHSl4zq5fn4TjBF+Pvx5Ta+UICdWuqz+tswpUXs+JR0QnZCsmN0WGdE+Kup5Oh8FToJQyC
	Rr3CayJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGs-0000000Ggpe-1MBc;
	Thu, 11 Dec 2025 14:03:54 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGq-0000000Ggnt-2hgn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:53 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4510974a6bbso34821b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461831; x=1766066631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aipOaJuScwfExD6+bFm/ZBqxUEz6heXJaJqy4EsM7Tg=;
        b=HTGpLopTbyTqysPEAqVMnN5XyTbuvvGUfRb6LksiuSODt5xKJAcSJk0+USJlydj/wf
         tqXmNl27JV/85yrR5l9hJAjS+630/ximDpvrvc4sECSMGoMwu2lH4H3HLOLBJIVPSSGL
         HpjMKQV+CxQemuTC+/3GPWDzxV28oJb+CGhrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461831; x=1766066631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aipOaJuScwfExD6+bFm/ZBqxUEz6heXJaJqy4EsM7Tg=;
        b=kryqLaT0fT+7nIU/uQ2SSVfjBEF83YhpHpdxGyelF64DiUiY2X6vslltxyAcG6+gB0
         lJMLqhAoLcjNxKAOH8p2sN//JUm1AQYNeCMwPxrJG7FHe19bk8UTX8Pm99zxb0Ar9qhK
         0cYtMowc4ieNR8Lrwczv1H593ZCiIBQRZpXCrWLV4VLJ13ptKFA7r59aW2XbYTw0f6Jq
         BHRvLt7fn8RMbAW129TG2/DKoz8ve5AJyhRYzmQnEetcIs254zW1y6h6v6NBx1N7GGOw
         vzOc0zhlSCObtEPPY/AGlXQG+6JKk1FMwESj+vUiEGUHlVcErHb7LcDSuWvjjbLLt1uw
         LjFA==
X-Gm-Message-State: AOJu0YxNyGnzSMSmNAT/7xZipe0ZOI9VhUqrczjDhgaQN7scGR0GVClo
	WX6LN0mkiyNAHDzaC1z5ZgD61JF7lnNdFQld81WJtuJqy1cQNRicvelsMgPnpfP8ZfMeH6wnbzL
	wxd0=
X-Gm-Gg: AY/fxX4AEioGtunTjudFtRJ5F14C+/HKQwE9jM3ZBevnOJ1WjbKyItNUvC1xnXcEFTJ
	ljPr+lubu2WwexOglsB/g00500txmHsjZ4Q97JankU8ZAHb+HV4L27fJTnoWrX9FXDpPLOs6FkK
	vgAZQ1J5aeAVI2vrhrz2poehlN7Oeem8ubjnk07sJO0x18s37FivRJkdClsE/JQmyG0YcqB34B3
	1yjsD6IrKm6UD1e+/LOsUyqTnuCR6EAGl3iyJTvncyLKyIN6J1ZDraEEp971+gcZJXl1S3qvXTD
	KysiMNNiYcOk1PNApU7CkHo7a9XEh+Xk+72jycmm33aobquM+rjdeoAAg0INU67GI7k0tARr7Lg
	BJ9bwx7wE6ASsbRgZiXUc/5ifPvalIIRPu7nTKY8LVpO210mvcR0flZ5wHMK7eOIV2tSkGu+/7N
	7jiArKYOlSnLrIey4=
X-Google-Smtp-Source: AGHT+IHC3573QohLmv8SOACLNjH9ajppgT1cVKZJbAnApK3+sKvHBpgpk8c0AWII7l6JWhGkYhKPCQ==
X-Received: by 2002:a05:6808:894c:b0:453:10f0:a345 with SMTP id 5614622812f47-455863e1496mr2740090b6e.30.1765461830659;
        Thu, 11 Dec 2025 06:03:50 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:50 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] scripts/make_fit: Support a few more parallel compressors
Date: Thu, 11 Dec 2025 07:03:02 -0700
Message-ID: <20251211140309.1910613-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060352_689674_050E31AD 
X-CRM114-Status: GOOD (  11.67  )
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


