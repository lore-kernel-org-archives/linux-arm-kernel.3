Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E536CCE9D79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwWbmg1LixogQBRKNwlcpVErLo41/Cy9Uo/WwI+a3U0=; b=UhoQ/8zKFirjZkLQmhtcMyoahg
	/tfVfIN+iXLvgN4j/BuibadxhbLGojs7LdaZEyVkBXeXFmBLZZMNX3sdv+1HvaWu0iZlUE61w7ArE
	EXX3gbkq15rdJNS1ciB12s1oQwjtsgPl8NKfM63dNtbAoNcvsZWulT3liMpiTrQ2xoYR+b/vEw6AO
	GVi884rvVmg8NPo0TtgzRLEib2q0upyfKaAfh/PiqogTmJxAk57AFoSUHzuayY8XOC7B8+QYT2Z7w
	oDRUtMwPhJkHc77wS1f2dozpXn6SVOvtwW9QXttQL8W+4gl2v5WNp38T1K344vF8oD5vdHhj0IaiB
	Kq6rTbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9v2-0000000DUNs-2jmp;
	Tue, 06 Jan 2026 16:28:28 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9v0-0000000DUME-42U1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:28 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7c95936e43cso470549a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716903; x=1768321703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwWbmg1LixogQBRKNwlcpVErLo41/Cy9Uo/WwI+a3U0=;
        b=Bj4p9zL4kKgLo+NPCZhBd9KvyNeq/Mj5GJH0NoQ0yV7T7vpncOwb5BU1Zobs7V+KwC
         WfigVrlO/3PNoasKQWBZxVjFh0FPe9Wmc+WrotBTSeZI6KltLjY0AuL4SAG2BOaOuqhh
         dcmu1WfU89icqiNoDzmXogMmVbB1gOd/wfYOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716903; x=1768321703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwWbmg1LixogQBRKNwlcpVErLo41/Cy9Uo/WwI+a3U0=;
        b=pgV4Dti91Icq1iH2LFSdSjfgD760Dm3rFz/agoZ2hGmijdSLFx3wiHvXqrBH28MqpY
         xXgm31p44k3yLzvQhQqgl7cdSExwGIjFiQHgu2+WONfc3Pe86J1D1ah/ZibymM8psJ3e
         VqrGUsMhiFMaNRTXQjQ+cYl8HVdxiTLCFvLfv4ovkNy6db7s//G+wn/8TGtUF0Zor/OF
         5vb6rz5vnbFE1lKEDk/THc0fnHOzygJPlwJT1E/MXllwRKJKcowM0RcfloMHJOYZnI7I
         zDdYK+Q0vFiozgGAh4vhMtSUujKJWhfeOye3VrUppaClcjN9ec4MvMwXF5k/pLbFRR8r
         JJ+Q==
X-Gm-Message-State: AOJu0YxC6GODG/TiVCv0ewkbb+7M+71ldNrl/7nTCWgUGDzljlXJNNsx
	dsSvvtXiZ9TPywrMA60zZbQWgMJ1XCXJ27DgdC8+2qg7vnH9NGlqE64eEry8lvQRNB9loSi6y2q
	FvkM=
X-Gm-Gg: AY/fxX78HtfeHgr+g5v9YVKqO44XqsoocjVks6WPHQCBpv5NyTH1QwV/d3cK45lCnVi
	LpvoRYobYPM/5OWQ+9x3TgkMQc642L43ldbkuqy2puuzafINrpA5emrF3tGLZBiDZq6eg9N8V8u
	UBnQAFrSosvOw6tNQTOkvp/bZIOgq2LYP2yIMxOlxeM+tFarSuucD9HV9YH6bVpEI7On4O3TxLd
	V6Ttgno/4aXxHYjDJaxVU1GMDWZHcMZ9Dkrzb/MARxcdIyaDxnux+0SGMwnMhc258+zOL3Qutyb
	BRVRlIkC7uMSS5P0Gug3G/4sD5fLvNCUZ7jzwR++dsC/tFNSHdeR0anQGICF0LArypdRZktEgzM
	DNDI3vJhArQt0+lDfGzfyAKr/e5wO59bSdVp+EjiL3zcnNbw3aaOnXVi1GPYHly1N75qPiSc7/h
	+g0wwW
X-Google-Smtp-Source: AGHT+IHK40C9f+L2GHswNDmfeFQ2PxZE58CGQqYPlGLUuwSHM6XOss0i030yV2VbmGSNJqRvDCbgNg==
X-Received: by 2002:a05:6830:2985:b0:7c7:8060:e197 with SMTP id 46e09a7af769-7ce4672bd11mr2181966a34.34.1767716902698;
        Tue, 06 Jan 2026 08:28:22 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:21 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/6] scripts/make_fit: Support a few more parallel compressors
Date: Tue,  6 Jan 2026 09:27:35 -0700
Message-ID: <20260106162738.2605574-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082827_010644_0412E50F 
X-CRM114-Status: GOOD (  12.46  )
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
Reviewed-by: Nicolas Schier <nsc@kernel.org>
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


