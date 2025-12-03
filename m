Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A0ED12D56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=satbyq+rTzhiXazZpyBeA4DvXCVBPZa0t059tdqKGwg=; b=PKLbJvhwnQTEMVNDj/Uj2Lm73p
	mt3ZyXJ6UoZGqG6LV1zeZzhx0tlTGNwp9i/TkLFn1VzaYMdwW83RG6m6uTbj8sWa5dF02a5YVoN+l
	zvkxSiS3RspJL2nZRXWpte6K5fgGMWPdi7oUyWGDlonJUF8Hrmeytf8R1EsYF0Cyo7oA/TD/NBx5c
	VqkDdfY1gUGGE18tFfXGkn02QKbLP/fEbhIXA8bfkQZ/dGpQtkgNMLmo5bbFk0fMhQscsoBiX2gZe
	K3jLh8qJp8abrHCoAhoMpQKsQBfF+P4LN3ApMAl4qrdppIyex6cXGR13kwyr6++DDjKALa0G2CrEL
	rhB1EWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltR-00000006YNX-0atl;
	Wed, 03 Dec 2025 12:23:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQltP-00000006YMc-1Dvl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:23:36 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-88249766055so75459966d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764764614; x=1765369414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=satbyq+rTzhiXazZpyBeA4DvXCVBPZa0t059tdqKGwg=;
        b=IbiLUIefXWS0/NPolE2m2KxgoYhi193t/cFMszplERXkKPsrKvIln5fzz8eXBI0q24
         dPl6dP4wRJKltXlwcRYnWE1Ocp3dGK+s0mx4I056BF9SXp+h9QfsHt93uyHf1Ro2/CoB
         OC4hH3q5CRAVgnQev3pA6G7jxhnm3D1oLgXWJcr+tuIb6V76zl9asQw26ovlgESnXvKq
         HWUlbnl4EROzMsFKSIrhu5lAH3uJYL47QoY6vItC6JDRWBU7qPAJru9f4cxy1bjscSQv
         BlLU+amXmOCDBVYP4yNENdyVQ9/BQh/3qhiTDjYiaJ4V5DZMWyeF8BCikpVk/N7grnMS
         xrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764764614; x=1765369414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=satbyq+rTzhiXazZpyBeA4DvXCVBPZa0t059tdqKGwg=;
        b=cbHDBfYXzd6t0t2NO8zXbZ7X7rKkq7+E5qcukNxuNGAbP78b9yE9TLy0I/pOexrik6
         guhNRWubsPnJK2opMjX88/oYeia1yF2RxoF2ZDkm9vG66FR5l2tzMk8+IZQ0eQ2k81yD
         qvpvvGosM2UIttJUbNFRRTKiCa7VBIG/xefWijJ7jc/ccc4IugMNrK9B26ZfUbddY7CC
         75lncVZv1C4M6NDpGUIlYUM5rLiIGiUQHAF646ZzPHeCJzE/WltmoOBlXwttoukkNTWQ
         4tOZTFvLnkK9K6ZcJobv0T48Sp6lSO44p5Xo5T+Egd+X8og06Wzurc7AfQI/YmskKCcA
         C4hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB4yHMfsgv9QudAq7VOU1QrXZdmM4dxLc+MPzaGsUwi+gIT2UOsndzPQR8L+YFCC/PRiShaB0bgQSixRbkl1KS@lists.infradead.org
X-Gm-Message-State: AOJu0YwQWzOjGtXYZor8WZYL+3oGyYPt93HtgivGEbO9z6ore0BLvPDk
	LgDaNRLY9WE9fItktK5Z79GHq7EkF/++UCYaKPzk8uUlbLJGrQ9TURZO4wSxcxOGT8jyJf3C5gJ
	+yrg82pQ=
X-Gm-Gg: ASbGnct8YI4cnCnwqYqDSKOY54bWimDgGK1Zer9KDg+YLx0BS0RvQp76bZnITIadeqv
	aB+ceudNJWwS/XNJoXUWwbWbX4K2MNEzgpLNhrOECslCvpmchG3mtc89EzIVwOvcNZrDBAZ3UXA
	CnCPbjMSfXVkVmP/AVg278yCR/L8mnzUZLWpKJCpky4xubNd43yIUsQUZ3cdxNToPnQQPRYHjOT
	j1xIR3noVlSBCWOGihG/YcPXhO+JMthHoSOqD5bpru19A3tROguyJqTwjkEde0uYmp0JOF5wao+
	Dc2NhgxthQWMoiLMcfEbZtyrXzeSZQalurJMyX6l7JEg2B8QKekRzbU7wGIM3w2ONbaDCf/9Fid
	u2nnZUhqFnhSroykMG4oJL/+jxmN2a6C2tEWMzgScSRP2ABfxtde8gWBtozzBWKjdVAbhSAQm1D
	miDy/J8cRKXD8ZrlTBn6uxIEr1SI63vbgjWpW/iFKXEu4I
X-Google-Smtp-Source: AGHT+IFl3TKNz+YdngGiL3n7sUr4ySdTN/WzLz6DBC6FFCPdIEUd90ZIj3x8M5TK77zgmChu8AVP7A==
X-Received: by 2002:a05:6214:ac7:b0:876:403e:a15d with SMTP id 6a1803df08f44-888194e5b42mr27914966d6.26.1764764614078;
        Wed, 03 Dec 2025 04:23:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm115214351cf.3.2025.12.03.04.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:23:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] include: dt-bindings: add LAN969x clock bindings
Date: Wed,  3 Dec 2025 13:21:31 +0100
Message-ID: <20251203122313.1287950-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_042335_339955_0208EA5E 
X-CRM114-Status: GOOD (  10.62  )
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

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 include/dt-bindings/clock/microchip,lan969x.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan969x.h

diff --git a/include/dt-bindings/clock/microchip,lan969x.h b/include/dt-bindings/clock/microchip,lan969x.h
new file mode 100644
index 000000000000..5a9c8bf7824a
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan969x.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN969X_H
+#define _DT_BINDINGS_CLK_LAN969X_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


