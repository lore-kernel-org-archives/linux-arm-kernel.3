Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D664CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=; b=gBOYJcUjg4iE5eyMj03/ZF1Z3l
	M2sNoNwmrdJVGXb8l4DxYS2O2xQta1abexdOPgRRG6sgoermd5ZGha3zkcKUR2dEvZXMJJuL/LL98
	+XHfzmihPIeDYJ3/bSavEGrlmluXnBYTjB3y1KvpCmfhbxr1JzO31lM4xP/WOU7KkCBR17g37yIQ8
	ysUAFXL63Y6wEQdtVsxR1MZoy+50zowJx6R8b8LdAxx7rYsYx9i9C5Wt+wMjxZxJ9a1g0A8QpGXuz
	GXFo/lQRVTHFNK0ej9qI9AoJ5Iwk2g0z3H7Q0ar62xQAM96VYALfWTWxxCT1T60YDcZyDZbA8uyQq
	KNb7do9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEN-00000000y43-0cl6;
	Mon, 06 Oct 2025 23:02:59 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEK-00000000y0U-2yRi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:57 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-42f67e91ae7so27959235ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791775; x=1760396575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=;
        b=PPE3PYWIirDTWxRB9L940AxSHNVJM9WnHbYGx+csreAYCylmBKLyNuM/3iskWZKGel
         k1r86o6KYoMKGnraS59lLrx/kH0jxZEOP9sr6Tuee5e5GxUZQ94yEfiacbkefH1BKj97
         Knm/WwX09Ocp1RCXKnwyKF9GgftH42eFXXub0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791775; x=1760396575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuN93K9Dcy3JOdIK4h07lOL7a8R3BcxISOfJinfzFRA=;
        b=EbY77XOXVCor2YwDZokQkAyIvmIIRh9xLobW+XKeyVizd38QtynDSfUx+D2b01lzdH
         NrCH4Dzx45dMOO7inriDgYwjkdr4XuCsf4PlGmN+UDKaI4htrm22Izj02UvvY3yq7wiJ
         dUfOp+m3Am3G4MEWrp9LH24r1ka4OT+LAdh4hFVTk7TYHj0DuWId38LRbcGhsEAkpAMu
         Jw+8MTZlKjwRrW4evOehUgx0Um01q3/T46SJ2zHTlt3hvkZDh2DX3pv3Co3Dn6VbKHv2
         TIIWfvZx+5jhyifTPBscJ51lvyU2bWdckGsmLJn407ReubwWQuzO810vTpz0+2pwfwoB
         SBoA==
X-Gm-Message-State: AOJu0Yx9+yxUiY+rN6AkX0lbjXkPo5tYRpR/BRQUejuEukYQQex04f6W
	hSE+GQ4bcgJUj9PZ/cGU62gp8g2b8bn+3pTVN57xvNDOJqUz0jqLLCo9bgXUyyevTTuu6QfZ2S2
	tlvXDiw==
X-Gm-Gg: ASbGncsdbMq0YVEUEBZCtsuauZquJvMBlkxPzFKhljZ/tHJpyP/N6KoTBxaBhSZNIWy
	uLNr42VKSLavuAx9ZzOvUFIt8pFwCq5iJk748f7E2EKoqM3B9rtTJ8hA8YHCi5z6zH4UDOCchbM
	lBfL50T+N1YaybbuzrBjQ+OyPuygrxX4JdJBlBoFIJGcEYnCMDCOtu151+1fCsjSLJsk6gbz3up
	irF/q8AFFjj2OPzVV+pkS/ETLCo0Vvi3DF/yDDeqE9tlOYQ2kLeOKW/VG1omIQ4aJa4qfaOD3hP
	vmEIG9tjbzWmyss3Cr6dlmzkoAwSfQoq2c62kTjngwuzGUlZ48qDYTFR3IdHpUC+R1ltTZBhR76
	Ck91z4xMRVM7rAMmaE+Kvkyc3SdTB1TCo8hFOTS1icec=
X-Google-Smtp-Source: AGHT+IHSrmzWbWKM4UXhJ9zCemfI3AXTkSgm4z+CxyCTVL+PvyrUOX4Z4dhsZa1vuM2vjJ4J/tIMig==
X-Received: by 2002:a05:6e02:1fec:b0:42e:7598:73eb with SMTP id e9e14a558f8ab-42e7ad9cbc8mr205043605ab.23.1759791775171;
        Mon, 06 Oct 2025 16:02:55 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:54 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Nick Terrell <terrelln@fb.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] scripts/make_fit: Support a few more parallel compressors
Date: Mon,  6 Oct 2025 17:01:57 -0600
Message-ID: <20251006230205.521341-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160256_773950_3A498535 
X-CRM114-Status: GOOD (  11.38  )
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


