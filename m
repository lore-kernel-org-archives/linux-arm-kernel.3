Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4A0CF58C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Kb7vK4VelnueHMlrM8ApAVfsFwcfEWfXn4uz9Oo23Y=; b=pjrLYzr1IchnzwPWdrberpcNQU
	NaBERYRxNMBBvTm+slp4hVpI8XMa29q+rKU/jep8U/53vtQVHrWWJ9eUijiszs6DaSk0U9pGzeOky
	DFM1pEQfkAEDW21Bbq8cV5TPxKAJ4cDg/vk9uo/17foh+n2rWimFBgkyJQKyCG3kbzoAC35f2hI3J
	t/x+ziOj9sGd2Myn1h+5324jNESDA9boxBT09PqojL4Dt3lGv33ocoYO/zEFJe4XAIRkR2J2bsUoy
	OWla/6u/FuWScAtdxRSrd3ZHjLjC6DtmZW/0lPm7++OrdMHqpiX1BtHY8VwFV09SuKZKQEaEcRzTz
	9Pv2xCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhG-00000004Tro-11BL;
	Wed, 19 Nov 2025 18:14:26 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhC-00000004TlW-1sUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:23 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-9491604d00fso118167739f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576060; x=1764180860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Kb7vK4VelnueHMlrM8ApAVfsFwcfEWfXn4uz9Oo23Y=;
        b=QvrRFTbehALP41g1Ezh0Igs6YGF3c51RTjJsVUL6zziKhV1F9WWM4WG+x4lbkdlCzH
         LcPDsvKsdJcIoES/L9J/93RdS9d/It1BLQs006zhcZpr9dPFTu0kY5wMPlNxcY0MyUfE
         coEHX5kCKhVJCOW8Rf8K59FbWFO5mfH8Y5bx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576060; x=1764180860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Kb7vK4VelnueHMlrM8ApAVfsFwcfEWfXn4uz9Oo23Y=;
        b=PhJxQjGbN0wL0LUQ28/diJirGW+XsFZyZbPvWORqz12EWZ2c9AjnyRoigpn8Ntl28I
         zNDXYLbpHoGHmqqcQnykJY1VTXUXTTecN7bzhYyPSpr6oP0vDFwmGQpbNoYX5eeNU2FT
         VBR9ulYJgMKKoNFnLdKQYnJuk/xauZLHDoaWltD5zLVbfk9ymKb8Ss7koMdtRgRyPBTf
         eSGxKPO0eHU/lsdy8oNxuH6S46v9bH8hMkd2+wRe2NLUAKyp/n+0nZE164P3Y6RTk87+
         ddYGI6mSBrRRcOALxoHAc0/It5JHvfB4Ccm+YSDJ3cveTE4JRbhyGq66ttY9Md8piHXy
         w9nQ==
X-Gm-Message-State: AOJu0YxgHuuUE8VlA7YNEGKQzq6ONgsEsqU7hqxWIq7YBeon+EjmTjzJ
	wmE8hMdWzeyL+bLl5MDkpi/FcCKzSz4tXzUOwMmI8d+U7VuFWPtMQiAkfqLIy2N/h3EWK6IDYn9
	OmMk=
X-Gm-Gg: ASbGncu7zgKYEEyTODeCuq9tRwFQ4JDzs7O4p6Wxar158rO6oQlZ1Y9smO2dzrt36x4
	8iK8JGZDckLHD5sfcFzCt1DIjMooKOPJtuJHH0kQx6hYwj9IgPbpVI2lOYtT9aJZYWTPXS0v8I8
	e0YxvZdsnV+9ilol8uWdbSqSp8WwIXvBQuZ94QE9WNFlt+933xmvnNLHYTfwrJ9nx5X9J8At3Lh
	EgGvjv3kQMGibI0CEn7UQSJXCul9YHQUP6ysCsHDwohBQQ+2J+pORyhzNJgWvRNqxdyU9mZRALO
	IosNw6zsnSClD418eG/94Jb3LHFPI9p7VzrLmGv4aegWrz217QVc58Lw0TXX7g45x7TVC6SYAvP
	juO1ThTeNUjJd08VwzJdxMUz5Av+Tg9clTGldWjttyzpQEk0kVjrm9OyTHkqEu3htq6xC1L/jn0
	8NMR2T
X-Google-Smtp-Source: AGHT+IEW7AT1anDDeb5eUBJlU592g0AeT8YdBL/KDYsyZnupxjh5lyG6UUoFw9lH3XXKvCmP33BRyg==
X-Received: by 2002:a05:6602:2b0b:b0:949:1123:13b1 with SMTP id ca18e2360f4ac-94911231590mr1034792539f.19.1763576060105;
        Wed, 19 Nov 2025 10:14:20 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:18 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] scripts/make_fit: Support a few more parallel compressors
Date: Wed, 19 Nov 2025 11:13:28 -0700
Message-ID: <20251119181333.991099-8-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101422_531041_39D88431 
X-CRM114-Status: GOOD (  11.95  )
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
index 9dfef11fc4b3..64038f17a51e 100755
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


