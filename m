Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D84CF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=; b=YFgPzrVgxOOX/lQisbNf4kC0CD
	t/fj1yVCvmVPHSTG4QcwEjnw1sThLtv2i0D3E7dDKHsV3qduaCqqcESad/12CWwH4Q69cFHNn6j+B
	tRLTABSF0TDcpfn/mAsNv7xvw+k/rjul39BtyAW+H6Tu3s85mnWeDY53RhovEdo8mNuLuqPW3ewID
	9mxJR6iJ4gp87HjSUAz7feuL1+BmiXSQ5/PyFQ8DlJJR9ik7Q6AzfsAvAyHjfu1rWG4dMDeG/uY+s
	L9aAmJ1mTvpcQWdRBYtMrtJQh1DXzOb+0CPTda487I4yQ3PdDim5j5zK4AvjjKy8629M8Bs88KbkE
	IPn9WcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmgx-00000004TYt-3cxU;
	Wed, 19 Nov 2025 18:14:07 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmgv-00000004TXX-1QFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:07 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-948c58fe8c2so53539f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576043; x=1764180843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=;
        b=Defpnrn4ATScZD1x1T0HdLSTfuxoipb0uYAYKcld7jSqgPV7UxVhsS7zQXcm40kEuy
         sDnd0nchQ6lnOPaEKRw0Tgd4Kcv0QhdhGrXKTCzQpT7ufp7o9L2UDJzwqedcX+IudIi4
         6lvBaximfRQ0cKK/CrTnQd/w/hggP25OcIc4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576043; x=1764180843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOwDYlRH5DhNzOzjWWbwzUOQiOeiolgsqjgpBqGQ14g=;
        b=mFCqddGeThaL7NUIyaJFmegNsKE64KNsnt1np/iG9pyZFa6bHs33JVSDMHvYjJ3A+v
         V/Y+p4wQPZmEpS1q8gP750yvaXWFWUbepcIp7LFl2dlzpkmmvQGRg3kSDdgHLi65szUI
         Vn90N4GdwS8Yjd7Qg2v1zFtyOAPZHaEC33eWmEEOFr9G1H9arWOfYc5tIUxdZO/7iHta
         JMOapENXRfYnHGQr/bgehm6rl5rK9cZXRDX2vU7M8Vck3i5HqgYRnWA3uBsG1O4D1XqU
         +89bGLvL/AERLUbZVAisv0TSnxj70VJSYUeuPndPkOSX2mKhAfVZ3afXMaBsMduokfYJ
         XtcQ==
X-Gm-Message-State: AOJu0YwOWeviS4XbDl9C8QTXhh29OZPjIBTNRyjvu+nG72OCygizzO5c
	EUoZzu7dbFP3UTn3Zj+5LZB1qBxcw5AEUJegTQMsdm4t+v+rCG3nzQtmzNMLYbwvsdm1TmQjVOl
	VycE=
X-Gm-Gg: ASbGnctaIUEv4QO997LrV/KGmON5Itp13gGFmCXjwmkvXUun7CRVePyYVRbUSsjhaUx
	XpXPSO3i+gl44KjGRRhIFH8CShwH2M87AoGTm+K2SP32Ef0QLx1OnMGErD8aDL80+igh6dZjOLQ
	v3GtDMrqNJ4WTvwCzGGBKZsf9oBkDQlOeD+WFYUAXtYF0tQPxtDMoLNPbag1Qy1EeOsIR9djg3J
	gcck6TbZ9IQ6Cq3BoDbCRMY9apUmVZyPIXhJie3qmhKZSXIwAm8aBkgfnNWU+NQr3Jyo29eae4K
	qLBgrsORVIxfDzWJzFK8RgH3Bp67gdEVDh3UhctJbEm4AtRGOv55eQAHTw259tTEL1XXCs8b/Lp
	pNIVqHcXN9QrXv9Esfh1SldA9FVt4Q7+JENm1jZcprIGuy/KUCBveQdm1ZdzIXFsC/xu4HEKdWW
	TcXrNiqs/Gk3FzRxQ=
X-Google-Smtp-Source: AGHT+IH6yIX6WHieDPQzbEo8QY+iE45HF4Ibs2aq1PWlH9l6naUWz/+RgOAJxj/Z0iBtnKJ4hNu+AQ==
X-Received: by 2002:a05:6602:640e:b0:948:707f:1421 with SMTP id ca18e2360f4ac-9492b6b66bfmr387613439f.15.1763576043003;
        Wed, 19 Nov 2025 10:14:03 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:01 -0800 (PST)
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
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] scripts/make_fit: Speed up operation
Date: Wed, 19 Nov 2025 11:13:22 -0700
Message-ID: <20251119181333.991099-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101405_401456_FB060202 
X-CRM114-Status: GOOD (  14.84  )
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


