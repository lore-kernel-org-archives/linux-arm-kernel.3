Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88203CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOUTRe08GDoIq/W1AquA3toZQUYbeBtoJXoaHUUU0Oo=; b=qKzVXNkTqqoOJiRkgy+RCd4WzA
	iwr9cxgcfSLLbRzJOpOW2yQysK1T7jH+9l6lnGavsT0VNqgwjY6itUxb1r+TgqLtzTeg7vYAOsO+a
	4r40ssRmLhL3OP6QL6Zp0g8ahu+q5LbhZUgiKHte1HXwe02ga7cIW0LJ90O3O0+UEYyLp3Nqcp7so
	b5PPq/XhKQVr7EmoGfznkfw6IeUul99ykU9/zf+cp4HqiX/Ubmlh42rYJ0d1Dpo3lMURwwkTCTPGx
	wRCOIKT2wgRk1ZVN8c7yJ72YAdiaFdrgvAonb2G9NBt3bLkQ07/iNgKoer0VmrhS3VwpqPI/haCzE
	MAYsW8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjsQ-00000004G08-2G6E;
	Fri, 19 Sep 2025 22:46:50 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjsM-00000004FxY-02Ji
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:46:47 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-4248062c973so16798455ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 15:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758322004; x=1758926804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOUTRe08GDoIq/W1AquA3toZQUYbeBtoJXoaHUUU0Oo=;
        b=ihu1WsZvkkSMS95XUtUJQJICln3MWnfwlyTUq8Dz1WC3zfTp72ObhrutN9+dad/Wev
         qZmd6Ko3GxmQMhThqnptABj9SqtHysA68yeXuXjiTLUruJDzR1cFPZVOasj4jXU3/Ucp
         kbQNgWBPULuxp7lWnLvdsGdowizS7iOaKZ0o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758322004; x=1758926804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOUTRe08GDoIq/W1AquA3toZQUYbeBtoJXoaHUUU0Oo=;
        b=aBYjqq+0RV3jZlYw41puFLxRhqUsoHk1Izuv+pJecAzOOlfxlnpVfRHtHCgYWQjxHO
         p4278XfMe01UzVJ5oIR5xSXzSfZsjvVT4/C+aQv2kWwg62OotYFzC4iFLNtlt6aC0uxd
         WnlvO/ZJSH2AMXJCdKkZzOR/vbfUIpqyiFc36FnDIjM0++B0gY4tRSFK8MXmM8tjBZ4E
         +fDSXclSvMlEkZjUkswX2RrkFVxa/+ISYjI2ZIH320sWQBek39ISZ4fGsR3kb1y3V+eV
         5z7BGGjyZxCRELfHVJoNZT7TfHOk4ZRfKN+Pc0/vTt1fGy2L1JSSWUkJQcILe1C9qVby
         mdAg==
X-Gm-Message-State: AOJu0YzhikjHUgsqLV4Cu58weolPcbFV1F+XFFriS7lN8qYvEzsFUbbY
	3RE+h4GVtDLOVHhdm76BQ9WgfncBLSsbXtmpqAI0Jw/ZE7YP00cckhEVlplu1WfpQwHWvzgKhp9
	VcdW/TIEX
X-Gm-Gg: ASbGncse46zUhCPpJXmvw2T+dCg0dB/3D8HimKDfcqno7PTB5ciBPG9KUBkZrpkkkFU
	AoaieAaVgBtm2zWqbHKS6nIKuuA8Z/wwV0eQqJ1HG/dLfZl1OnXaH7CFWgvh61wODqmTCGyKXVo
	42OI5qnzTyLihYfXik6Fc8bnQV+dNdH+oZzarYTGccratr5lzSe9/Ke4aJRNxdrLtzQrpmMVTk6
	dT0eqzF+G/cFAyVE43wtwSNbfqNQ219AfBwcrH2CY1Qq0AfVGNz5Fx/8SRNhntEp1Kvt3aypN1G
	APzUQgguBDDVdkQUPxpqnp12kalwNdtGccH7jtImuQVPBuG44Vf1DcaX42ffmxdIHWduwiATMi/
	dzm2Kw9wnjCF322O5
X-Google-Smtp-Source: AGHT+IEdXiCfv9Gs62VtANBDE7YU4iNvacYa+DhnJGh2pRYvP680kqKeF9WUwtFdyjIgW7k2Eg5j8Q==
X-Received: by 2002:a05:6e02:380b:b0:409:5da6:c72b with SMTP id e9e14a558f8ab-424818fc559mr88377195ab.4.1758322004376;
        Fri, 19 Sep 2025 15:46:44 -0700 (PDT)
Received: from chromium.org ([96.79.232.53])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d58bed61bsm2581743173.82.2025.09.19.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 15:46:43 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] scripts/make_fit: Speed up operation
Date: Fri, 19 Sep 2025 16:46:25 -0600
Message-ID: <20250919224639.1122848-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919224639.1122848-1-sjg@chromium.org>
References: <20250919224639.1122848-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_154646_049086_9D96A8FA 
X-CRM114-Status: GOOD (  14.53  )
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

---

(no changes since v1)

 scripts/make_fit.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index b4caa127d2c3..904f45088978 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -100,7 +100,7 @@ def setup_fit(fsw, name):
         fsw (libfdt.FdtSw): Object to use for writing
         name (str): Name of kernel image
     """
-    fsw.INC_SIZE = 65536
+    fsw.INC_SIZE = 16 << 20
     fsw.finish_reservemap()
     fsw.begin_node('')
     fsw.property_string('description', f'{name} with devicetree set')
@@ -330,10 +330,12 @@ def build_fit(args):
 
         entries.append([model, compat, files_seq])
 
-    finish_fit(fsw, entries)
+    finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
-    return fsw.as_fdt().as_bytearray(), seq + 1, size
+    fdt = fsw.as_fdt()
+    fdt.pack()
+    return fdt.as_bytearray(), seq + 1, size
 
 
 def run_make_fit():
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fit

