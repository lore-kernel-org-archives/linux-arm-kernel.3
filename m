Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C69CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1e3rwdHznymhqcKmmEPEdrOZ6tPA6MN5wQk3iVJNOM=; b=zihnZdUudB7KTAyNDDd33F7hES
	vC6hLWjdCKW3oUnl3rsE7EBVnQptF1ae4DKeoS1+zeV+IVdseX+i5ME0NH6KPayXpw7eBgPZqjC0V
	boFL6bWVrGWWO2Yar9fwwLclCjTnusVSJMNzhIx6C+vpMoO5trI7fNd/Oey+fVfKUPYNNfr64nIFv
	d1Shax2dgAdbVIYYXkWds57+fZkXeis27/BjZG7xBbS3RFxVtMVlEAWIzL0j5eDdWRRySumSGtq1v
	KOUeej8rOV7Rmtp96DoisiX4KwplTgbb5sjrEzEQ79KH2tMsUZoHklIfr2JGkdcrQRIC9KdNZ9cyR
	mOA+EZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLR-0000000BfbK-0C7p;
	Mon, 22 Sep 2025 22:49:17 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pLI-0000000BfVG-0Fuy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 22:49:09 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-78807cd2236so739008a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 15:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758581346; x=1759186146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1e3rwdHznymhqcKmmEPEdrOZ6tPA6MN5wQk3iVJNOM=;
        b=SJHgqWkPxNO/+HKVqDN2oI6IiNBjC/Stdkjs4/W5iuKdS/tFRf9PCLMVzfoAlHQJox
         DtIZDjMjru5mvNSnOKozq1W7grBT2PnDyebHbl/m0OSjSLRT1lcmQNVT1VHw2MQPwSW1
         q7ltcgDgOEs9450YGy0sZNuvfT5/7HUwhNyQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581346; x=1759186146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1e3rwdHznymhqcKmmEPEdrOZ6tPA6MN5wQk3iVJNOM=;
        b=lZY9v0yHpxUgYHfE8/nLzEsOlE2Q65iJYugahHSFgFEw3wIIa5wO6ODtIR2R15Ske/
         /r/XKviIZSsHvvuKQktxz4sQnjOrGfMWdn+f1f8q4XTxUXG+dKqQR97ITmwimyVML5Uc
         Tt4PTdekKqeWSTOhSPlrdT5q5cVvPHJtXLpe8o/o+Sqzfu+i7f64u9ZI3E5ygK1Ww0iN
         9kxZnQl8Amxyo1d8iloSvblUoyrcUoKPfwPfq0/nR6SxR9cB5WLfDqAdUX/PFPGJJnEr
         y8Yha3Qt0KTICKFPSQazvNd/SJfTivHXRa84vK3/C9S5elWD3/SxtNXp+whYjVUyHQi/
         71sA==
X-Gm-Message-State: AOJu0YxrXQIs8D1FDuAPsWA2vlXNPBwUqvI7p5Y4P0mpDdXp3QRd9/iz
	VlXp3mnz3mho1jIhycNNsrt9GmU/gkXkYAbVYPKacodi4NeOZRwqdgflXlWy7CBZfeHOTjgrPU/
	kD1hH6w==
X-Gm-Gg: ASbGnctX7IfTVTAEOTSI8zoRjhlfwj89ZlCF01xDWwMOPHyWnt1RgL9gPRdDToyf/cG
	f5hvDUsbW1htPC7Y3rfUaLb0ai0a1whOtFLzKAXwFOcVn3V5yz+fZd9HwoT5uZF10j7gVnafzxH
	p6OBUxCb08NuIa8BRcc8hd/rIIjV8W4OVjDVpFmUgFWa+WILdgctc0EE2vGAkjV3t+nS+EKTsNZ
	dTutPJV18e8c0qStpK6qtxrZ6j+GFDBobnjHlhhbymS9lXInyJBNTvkSeUxd8RLr4CSzsL7VMj2
	6uTM+HjPr3kauEq9YhbDudj5eVL1dSfBVRuHX/ozG1ks0luEZCyfBemNXEHboN/xsMwOlob+YYW
	PkjPd+QW/WMoFG/OUfVA=
X-Google-Smtp-Source: AGHT+IGr6tap0sPqebFz42P7hl+4lEILp28PDgb1nPW+SCIac0Vdb7urReiwBVQ18LGCt5FqC+bUvw==
X-Received: by 2002:a05:6830:3484:b0:748:317:dd81 with SMTP id 46e09a7af769-7915d3cebf7mr212842a34.29.1758581345941;
        Mon, 22 Sep 2025 15:49:05 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-78780383017sm1167244a34.37.2025.09.22.15.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 15:49:03 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Han Shen <shenhan@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
Date: Mon, 22 Sep 2025 16:48:32 -0600
Message-ID: <20250922224835.1918759-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922224835.1918759-1-sjg@chromium.org>
References: <20250922224835.1918759-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_154908_105793_36E44793 
X-CRM114-Status: GOOD (  12.06  )
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

Support 'make image.fit FIT_MODULES=1' to put all the modules into a
ramdisk image within the FIT.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

(no changes since v1)

 scripts/Makefile.lib | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..2e880d9b4706 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to 1 to include an initrd with all the kernel modules
+FIT_MODULES ?= 0
+ifeq ($(FIT_MODULES),1)
+EXTRA := -B $(objtree) -m
+endif
+
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(EXTRA) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fita3

