Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B11E92704
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=; b=yOHz1k2tHGvMGyPDV4I899jXFh
	A6xmkWTIbLPsQlaDM01QiHWa2LVE6/ZviVpl1wkQmi/TflXvJ88Qxc2DeGo3HxK3CB6NCa1IyM8xN
	VJ7ppIsaU6HSxewdjSvl7wGst2gXBOc9YKX3PmXZFv824vH/nLr1Y2KGUnvui7+C1/bGTJirNxrug
	eHruPM2sDWtBG9fCVDDLfjHE0JSs2DCyoQQAm2zf6s9IGmHe1qNKdzINlSrmRJmPtaAoXeYGHej4x
	fVzAXbLh7Dn3y8Yf3K4qRH+1QBKu7hvqhdvaO9iGCMMPI/7YX11y3SQHXplZkaZmu9sE6AKU0B/vf
	g6xtg32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBZ-000000021Z9-1P7s;
	Sat, 27 Dec 2025 14:22:25 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBT-000000021Xu-1cw4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:20 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7c7545310b8so3928188a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845337; x=1767450137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=SM14z4rYPvbrsijB1E5QBYiJv9mq7WK6LQrqT6RIqoEGmveI39gWrXAKgJkGzbQrQ3
         iGV6iKMbxoei1ZoKSq+HiprJ1kJ1BGk90wUL3ppRlZv0IMDYKiISWc0Mfui9Rv6f45DA
         JU7UYVM8TYibMgclJeKlcJ0AmpSTFgaLoUzL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845337; x=1767450137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CLsfEOgWDExJ3WhLf4sg7dIsOWS7vuQUYkgDX6My13A=;
        b=klFxBMOqb+4gtEyWSxp+bwHXY1R1Iz4lRBdE3bNalEjIJdixRgics4yBUmFh5r6+no
         sE+3ih/4IkgmmmeN9poxls0xHc+LBArcIRX4cyWIYrUDvKBcnnEBMKB10o/TcXOhigaR
         ePiHlKu6H6QRw4sBneahuNB5ffqUt/0CDtN4SVAkZpbHF3WH7rvJPOCJzxC4ILelRUdd
         jA0P6DVTCRH5/R0T9dBqEFziCNE0NsXbGVMqhrxPv568GKLrugWSFulyRLuwtI3au4Fe
         ovkn8R9oDVST0ffDGScf17nzcA5k8Zt/nx0xckbjbZlRm60OvdSUmG4JgF2Lz2d9A/zH
         6qDw==
X-Gm-Message-State: AOJu0Yw5pr+0r2c5I2kBmYGcPumU8RKFsveKMgXmXKQ73YjtBELi41i4
	akGXU4b/exQfP/x5Z2420Ya06SsJ2wfrF8QECmhvKkr6rjJGg4FrFPlM9kJQfBN/Ao+eI9bazVD
	NOa8=
X-Gm-Gg: AY/fxX6U59ALF82om6RLqJ5iGld45eqHsAaYjt+/Qk95uaBeJp83LIPnzmNmLlf/soq
	fBg1PV3o3t0nmnX3mwSRGWHJHraxKeFBxwqEXvGKPYk4ru6JkwQA1udZQSc/szSMRMQY9oSvqPr
	g53tOI/XlqGXF1/HOUqEael2uW4Lnk3KM2GnZnQFDS9uzjGLqlwe0A3dTOf3Xb/imzok0Of6Dfp
	DlfpmCVJGg48z/TVY8bcmRCtLdbg+1avi4qeYJAgkr4qWO5BneujRbWqTUXByp8Pc83d9NNInJr
	yw69UXRvRghF8AiMGquDDmLhNxBoq7ilU+f6nElTfXA7oidQ6Q+uskiJI0tiTaBmnuIRhCLS4W8
	RRKCTE+rLjJ7u/N/2Z/cIc5R/AyG6+5Mch4sKWTQIK2kuQBIZxC+Slw9l3LyVEoF06gndDyCVs4
	RoOeXC
X-Google-Smtp-Source: AGHT+IERloq1wbu6MMPNkQSZUoJASFP8MfNfOubJP/R1dV7qustFVakA5w7Kz2wH7QU+n8t6pVo8uw==
X-Received: by 2002:a05:6830:4c0e:b0:7c7:827f:872f with SMTP id 46e09a7af769-7cc66a5a9d7mr15858241a34.37.1766845337511;
        Sat, 27 Dec 2025 06:22:17 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:15 -0800 (PST)
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
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/6] scripts/make_fit: Speed up operation
Date: Sat, 27 Dec 2025 07:21:45 -0700
Message-ID: <20251227142200.2241198-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062219_447729_C0ED9A11 
X-CRM114-Status: GOOD (  13.90  )
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

The kernel is likely at least 16MB so we may as well use that as a step
size when reallocating space for the FIT in memory. Pack the FIT at the
end, so there is no wasted space.

This reduces the time to pack by an order of magnitude, or so.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v3)

Changes in v3:
- Move the ramdisk chunk into the correct patch

 scripts/make_fit.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1683e5ec6e67..0f5e7c4b8aed 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -98,7 +98,7 @@ def setup_fit(fsw, name):
         fsw (libfdt.FdtSw): Object to use for writing
         name (str): Name of kernel image
     """
-    fsw.INC_SIZE = 65536
+    fsw.INC_SIZE = 16 << 20
     fsw.finish_reservemap()
     fsw.begin_node('')
     fsw.property_string('description', f'{name} with devicetree set')
@@ -299,7 +299,9 @@ def build_fit(args):
     finish_fit(fsw, entries)
 
     # Include the kernel itself in the returned file count
-    return fsw.as_fdt().as_bytearray(), seq + 1, size
+    fdt = fsw.as_fdt()
+    fdt.pack()
+    return fdt.as_bytearray(), seq + 1, size
 
 
 def run_make_fit():
-- 
2.43.0


