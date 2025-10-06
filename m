Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFABCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/04FcGUHZ4AKn3TuM7bYMUdqJTWV25qYG6FlFl5oan4=; b=HUg8lSxYxUB0Z/o0lmB47lMXB2
	EDU6A+CWOBNBJeXRDli6SRn/lPd4i/rpAhp/FpwY7vxhE5LlqGO0+qqdmImkQSser+HwdpO3wET4b
	AYjBr38N1Xq/JK+dwXjwD1j5hesujhIuJjxjinDAJYYGOLr8Yliopzuo44o3VYMBIQ/PmkmzEu9+b
	zl99W3tPJWmc5xBnvg4dmTWVMWt2xr7rGgMg+BjokFfzhOZSUIJgDqxS4vZvQxRGXhJR1kPeedy72
	ULuNTSR+ihlf6Rk7t9jF1D7PJpXsCcWyWdbRXTu2XZlYtkE0YtMjXa5Yu/n9DbavDySL9wHjRyenY
	r+uSUKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEB-00000000xsF-44el;
	Mon, 06 Oct 2025 23:02:48 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uE9-00000000xrT-0P3H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:46 +0000
Received: by mail-io1-xd42.google.com with SMTP id ca18e2360f4ac-911afafcc20so219674339f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791763; x=1760396563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/04FcGUHZ4AKn3TuM7bYMUdqJTWV25qYG6FlFl5oan4=;
        b=gPU22hDY5SMi8JvNwSLR6HQbKbqJe7gORqg+plUqjhipP96qrW69jVzxAL9JE3079h
         9JAFxHspVmx5AwShPtIRjyXq4kJks+Q40AluGmF7M82WqTowFbo4CMXuR+qkMm/kg4+c
         5lXsvA8IzhqIfy4iFscyZrJnRIDZIZZ2JKQks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791763; x=1760396563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/04FcGUHZ4AKn3TuM7bYMUdqJTWV25qYG6FlFl5oan4=;
        b=TPrERcMs+F6MhGjV4adwW8JozdLxnjWXYHYRtVlz06ZBEIYYuLwV07lUL8XUPA336U
         MpO7D0FytldY/vuq488yP2qmmYGqxMDkGbvg4IW86u6sOotdrw1pDHQTeJLp49oHDsYE
         2iVzhd8Wf6PyUfgNnJtmZUYy9+oWU3Oop78KU2AnxMIztTYlJIXGvyOXtHo9JbVbs4Se
         m/vUL6dcNMTJiCx3nKheXYPQ6g9jM6bzZBqQNSqM0d/6Fj0imz4d5Od21ZSHO509GuaD
         RWyS7AyFwowQu/4FdybISeHfmzoAOxMMHq+Qqgwd++4WVQk+E3f5xh6pjiFgqhEFZrNI
         ag1A==
X-Gm-Message-State: AOJu0Yz7+rEdSwgGUH6g8b1T8//dy8sgqDQSw1w0s8XM9R3P1Z8s59Ta
	QtZwToxH9vymQOc9QI/XjTmoOVivLq4kFz6DkMTfZhs/wMAdnBw17+ak9xZKXn70h50sqyNWFkZ
	je80caRxh
X-Gm-Gg: ASbGncu1/vFFSRjqMtqv5vkRuLR4LEAWix4UDUHFKSTWqgwDPXMT5tlBRQcVMlUi4ag
	88e6fA8BXvDrZFrFbWR6ngwz63M7Ts3J5dmunSZsBR1eL4iZ99eGNLajy5EaHqHDtRknxGNhZuA
	jmKJitQ963MeCQb1aB2mCUxbiS2x4uaUMDNC8azcXsoDbqPEJetxKKTKFYiNc42n77Rip/RPuov
	G8lOAFOxONWgWRKsxW1wbeUdjb0BtKs3YZPNEzTekBCJzrPTQGZZ39pw69XjM7n3jhGYDlGyVVB
	6O8IUn6kSkV6eaBO8wbB6SWkWJll4bpwzpQVPFEjcouIAkotZFJ6FuC+6ajfPlyLWYv4I5D+w5b
	MGthQNEGSutPfnI4+H+xOmPTe6Lp7IKf8FgyWx6mQ+WQ=
X-Google-Smtp-Source: AGHT+IHT2eZsuDBZCCUdTjmcq+oBn1mLiCVw4dyHErxCXf+keS4Z7nRDbUIXhcGV5W24pJMpa8mJ3g==
X-Received: by 2002:a05:6602:484:b0:887:56f5:26a2 with SMTP id ca18e2360f4ac-93b96a9952cmr1753381039f.14.1759791763505;
        Mon, 06 Oct 2025 16:02:43 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:42 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] scripts/make_fit: Speed up operation
Date: Mon,  6 Oct 2025 17:01:52 -0600
Message-ID: <20251006230205.521341-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160245_134224_66C80FAC 
X-CRM114-Status: GOOD (  14.39  )
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


