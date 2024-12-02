Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75012D78332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=; b=fadDWc33WuYYhL
	1YDXD1iU8UnFqFH4fnoCa4ID/SPEDFzDm50UwekJVpXgM5b3PAexwDYyTWtVNfe3/CymUb4PZ1gSX
	Mz+0ceKyz6gfCRv8kgh85D68LWu3J4Ne6qbB/Gfmo+7RgN4AkTa5XtoDkdqcIzSIfmQFfBZ9zCAaY
	MIB1tE1Tth5vSStoPujAWtGz8a3Agco6jqBX09ui/SDa82/pMWQxIVQ9hVKQnft71fhmvt+1Gu92K
	FgKrOYFRBJ55iACqcTsv2eOWonXx4eXhnz8+z26OJX/5dPaWG4WG9h9EHv57I8xq+4eSJfGTc2spQ
	DQuLY/WYNeUtj4T4h/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8hP-00000006jBT-0fuO;
	Mon, 02 Dec 2024 15:50:59 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8ds-00000006iIe-1I9k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:47:21 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ea467fda32so2224532b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154439; x=1733759239; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=JNOov6zfNcxIwxL7L5/rzzMJX3zhjnkUz4jqOVV0wnofcSa/7zr/ozKwa6dXrvPlZv
         hGbmIpe6Hg6AoXX1fJqG2f0EZCBuEytsbC+GR8eFIGRSUCXTwTl7M/m3hxRscwuTrktB
         LuXhFXEHUPZGlG4abCV/b7qTyY7dAva4q8cGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154439; x=1733759239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNctqgbgKX4M7vIwY0GeY040xXoP0R2au1vBq2qCPD0=;
        b=Gj+ggtrxnJ4ZJFzViOFAGioc7+xFGlxSKAhG469oX1Et/Kp0gnK6EGx9Bwdb9rbMrO
         CLCjW4zcL8r41m8CH9PWijF+Jm8RoTT3JP3jWoDvsCPndDIni+zD5/bwfuj3BjM5QHCE
         709eS9Z8XqX7KtxYmgYVOnZmOrC240UdE7VM2rnTKw4+7wsV+EzyEGXZ4iryYumVmGy7
         w1nvMN2KjuZm49p4C1fZ+zDFpNr16ZgfqUKcbsWRz9l5M4bWG6QBBNbW/mXha/I4rA5V
         SajsomWOu/8XyruViEgC43E1h4UcTgJRoUgfySkxh5Bfm2nfqrp1VflcgitjWsNdbVDR
         wttg==
X-Forwarded-Encrypted: i=1; AJvYcCUok619LPSb6v8eobMCwPN6WBTdGMFUy6otcwF/gewMifkjjXWwlShPZuG+D1B/GA/vWC1GU4sRJV1CA9KpZEfG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd/PPnd7yZ8eR5VLnANdUvhZIvnhY3S5s9ch1tQ5E1PYSfTc26
	xX7N7MbeM+jvx0FcPZVbcjP88AsxyhH3Pcuh3XFHC+nf8P38TF1I7Ch8hckUgA==
X-Gm-Gg: ASbGncsohrhk8P8FAAi53X6MxlaKpnYNWCSS3Kr9FFQ/ItdHf3BCit/BErZbkYAvatf
	wfOzJJ+CrzlnX3D6VkF+O0thKYC+Nr9eGnx0i9eRaX9WnRNtWJxZjKvJ/CudKmyeEDVCiHqkF6J
	wYVflWNgXY+XXGzL7intTjQktQu1TIRgIr90v+1YGXi11dmh7IjmjyqJpqc5ZgzepM3DHo4PhOu
	3y39WrJgLs4pPrRas5wBL0yP5agjAQAkkK0rXAGLnREbgB40TeGaK2bvByJc1vR29RkuLb9zo+p
	JWFv6aL9AufHQBxUHdxNqbGK
X-Google-Smtp-Source: AGHT+IH/7hpTfNse9nN9Jr+DgfzObAaRxU/S7oa2RXexy0e4f94BDSUNP4uGp0FObZdTBwMHoHxTgQ==
X-Received: by 2002:a05:6808:1589:b0:3e6:2471:4d10 with SMTP id 5614622812f47-3ea6dbd43f1mr21613568b6e.11.1733154438947;
        Mon, 02 Dec 2024 07:47:18 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix warnings with llvm9
Date: Mon, 02 Dec 2024 15:47:14 +0000
Message-Id: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIPWTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbllmhm5NTlmupa5JskWJuYJpsmWqcqgRUX1CUCpQEmxUdW1sLAOK
 puwFbAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074720_347180_0002F07E 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

When we tried to build media with llvm we got some new warnings, lets
try to fix them before llvm is part of our CI.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      media: cx231xx: Convert enum into a define
      media: atomisp: Use the actual value of the enum instead of the enum
      media: mediatek: vcodec: Workaround a compiler warning

 .../mediatek/vcodec/encoder/venc/venc_h264_if.c        |  6 ++++--
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h            | 18 +++++++-----------
 .../media/atomisp/pci/hive_isp_css_common/irq_global.h |  2 +-
 3 files changed, 12 insertions(+), 14 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-fix-llvm9-4c8d705c9e3e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


