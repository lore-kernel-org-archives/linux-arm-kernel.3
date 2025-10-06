Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7776ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYASDCPfiPbCUV1KYUTYbx4wHolb9ntBgheoD945Sac=; b=qxr0URCns+fzg0Qlit3U+FCaEQ
	P6odJW3wGZAIhVq9hwyzAw6qZJ9jQW2nzZJeEOZz5O1BBewPdIXDiyNSqOy6W1rWPIiYqikzZ4AQf
	+2mMaZD/99u15H3QqjXgtVXCpfRKrLC/f0kSCTkzJ9Qn8NoA32wvL5jOu9eUE+imPUvCs/hNJi8Sk
	xw72FmmQHtIFaZV+qu7IOa2UuN2fyyz8GvtKT+2kZCsfR80ayFc+cbPqou3Siq6XaUEC8DYM4bUcU
	NqddVKhJfJ2nlxEGbKOPbvem2WeXnYX9fdiGvhhCf2ybo7KInzQLnKNKOHiPULqXd2BjdwRZqteNS
	dKx/VPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEK-00000000y0Z-1DUk;
	Mon, 06 Oct 2025 23:02:56 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEI-00000000xxr-2GOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:55 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-42e2c336adcso19139455ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791773; x=1760396573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYASDCPfiPbCUV1KYUTYbx4wHolb9ntBgheoD945Sac=;
        b=XvHF/A/WKUedOukUFuLnGcnDvFRjWI+I+AaH0t+q8pSETmKih54D/ijkuSK8yV6Uag
         uCQLr8EUNV9LltNi9hLJoyenvmPfPx8RGkUiP5i1zOrKnNRFvXBx2k+gQdQ5utwheNTj
         ogMOwcy8rdsiW4MdoWl10hAD0dPmySK127eCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791773; x=1760396573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYASDCPfiPbCUV1KYUTYbx4wHolb9ntBgheoD945Sac=;
        b=RFUsssdRBnky6TQHrq7JQ5GyB6/smkjjyPNHcWM1LoDn2MLG/ufjUfpj9cG6KSihPa
         A/ejoXbnbr1yTT/o39ohHfWVoNrXVD0U72u9tXsLgvtJptx+/Ha9IC1LaMtUI/7WEhOn
         2MBpJk4HN4Yw98yow7cMDANT2TLoU46hUX0rq/lu2YAlOeVR30DVLGmclmZfb/cQrmW+
         FCUu4qViLcix/FqZzUGMtWGzDciMWUdf8cvpTmtYDiwY54qsfXX1/XGFwaA+M8G1DK/8
         hVMCnsw8LruRzz0+eG0CUvE/leObSBSdaCnpXngk9wfnaDU1VM56e85vWN6RXUR+XKHh
         oN9w==
X-Gm-Message-State: AOJu0YyKOKojLIUrANbG7fb5/2DLLv15aR/HXv5tVbTsaoM3bV2/Q2bt
	QMsGPvjaXVqFJgobXnPHdYft0BiKZ7dtl0QSKtKSUipt/08PGok/PmiNlQzG/IDzzAQmjLuMUZw
	+ZDQgXA==
X-Gm-Gg: ASbGncvlZZwkGr+M4VQw/btwIvupq5+1FYdbF5CrUDKl0450Xl+a48n9JJKLutjBKZk
	DBY5PbLyOzohIWj2JqAt5EaDRbYVU68N7f4Ly0lzHp5lFS28hzRAW9ImLyc0XRo00Cb1800UidB
	zlCkA3Gt3khKzVPvrSmrqaVQqGSl2lGooSiLvVDPZw0AyidPmaFFX8OP72b9TbiedY29U0dBphP
	hy1oekwjtobXX9xCCh51+RS3jBCixhcXxLw1tbX25nNvoa96P6/uypkxvjNFJxry/SLd4CD3MTB
	UL+BJZioQLrZJuA1JuqlIIrS9CgeOKWw2QF1az1y1O7G/xMKCsMif3TH3XUXRw/ONoHzFIPQUvu
	XOoSD7uY/h0C9SEC9c2nAiO4MeBQdzKM6u2RHGZpTHCE=
X-Google-Smtp-Source: AGHT+IFWMMJp+NFmsOx6pq2dwd7Hy4kI7ynB4UcS1GCGMob/F9UqCyjwJZxXEHBZiF/C7t22Bn7ozg==
X-Received: by 2002:a05:6e02:174e:b0:428:c370:d972 with SMTP id e9e14a558f8ab-42e7acedb7dmr164223205ab.7.1759791772886;
        Mon, 06 Oct 2025 16:02:52 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:51 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
Date: Mon,  6 Oct 2025 17:01:56 -0600
Message-ID: <20251006230205.521341-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160254_580009_25F7674B 
X-CRM114-Status: GOOD (  14.55  )
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
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 arch/arm64/boot/Makefile |  4 ++++
 scripts/Makefile.lib     | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index b5a08333bc57..d10c85f96aea 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
 $(obj)/Image.xz: $(obj)/Image FORCE
 	$(call if_changed,xzkern)
 
+ifeq ($(FIT_MODULES),1)
+.PHONY: modules
+$(obj)/image.fit: modules
+endif
 $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
 	$(call if_changed,fit)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..c6a3aa653035 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to 1 to include an initrd with all the kernel modules
+FIT_MODULES ?=
+
 quiet_cmd_fit = FIT     $@
-      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+      cmd_fit = $(if $(FIT_MODULES), \
+		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
+		$(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_MODULES),--modules @$(objtree)/.modules-list) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
-- 
2.43.0


