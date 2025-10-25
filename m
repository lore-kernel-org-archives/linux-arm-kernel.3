Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB39CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgpdQly6UAXSTR5MLgLdCsEnF7u6zwKVu6ylG76tjIg=; b=gfzs+Od+vGNjpfvTMdAFblGNiS
	CxkF59Dx7oNj/MT8YFCrWJJSPaiCKxcJ2YdfDUZndKF/zV5dcuMAcqJF+oJmqmrNe8WFI48o2i0S3
	Ae/G14F6iiONsSrIJlMHorJCzRyAlHCWUT4+2/WEvygrRif9/ihro8huZhMrachMd0kjWN66/29CI
	rRvnsv2kAGYjjUMYOXgYyVippecrc2y9y2IYO/I2NcdgSl5X8piPgvgv55B1pZ0B+4H6Z8LC1E8Jj
	TNxSaIsReX8WhDfiX697k0yDnPxWTJSg7iNhsOdwGFoVZbU+6yKxF03Kqg80ciN43Qg9o807xos1V
	BfSs/dUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChD1-0000000BX5D-3CR8;
	Sat, 25 Oct 2025 16:33:39 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCx-0000000BWz2-1tGx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:37 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-87c103928ffso30451216d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410014; x=1762014814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgpdQly6UAXSTR5MLgLdCsEnF7u6zwKVu6ylG76tjIg=;
        b=XMvAw1kwhXFXlhGeaTMseY/T/pqMSuuzqf6MnPcsmty9sR1Hj9EUAR+U58ZMoZSiqU
         dpNyNCyrNp8WPm1HM5q/crnSe0N4Ge/rTrL8BSZDg5bJeXmFpZTK9tx+L4rlwCBXR1WH
         oRpSdcqHKhhrcZamH1OWnvSFtFKEQxh1XwgrgTgCXqR2EDDdTGvNCubf6HPJgVLfqeL+
         PEHYCgCWfKb4iuCokSVlExfrfLyVJAT4YUb/P8Nv+qLt6cWd82TmYinPTc9jTDttKqza
         9DT6GI606TtjnbsLdnhWQRHnAqR4a1+sMfvU63hRecOtyCN7v1SCuSftjDSit6BJK/HH
         2PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410014; x=1762014814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgpdQly6UAXSTR5MLgLdCsEnF7u6zwKVu6ylG76tjIg=;
        b=glHki5ejz+QAbMT2+j6roPJIb3FbvBXTBkysUDUCQCjTgSNYYbfO0NCvRNKj0EJpzn
         ZdJnYyZywRU7CbI3JhhyUt+VZ6AH3T++Z0pFQIyAaiS7QdyanHQpVjyzEYMK24bEB1A4
         qpCFkVaQOb4YK+Sg6Wp6xV39QaI4Vq8OOG8SNMVChYie977SxFLntvLwjFwOHoqB0zn4
         B7SxfJ3Tz/vmgCvrrgugNIfzg35ExwsIK/BgIT5euusIPNurimtrywZLg6GSWUYenSJG
         FwhxrTTdlkCZrw5B8ARSM9dn5bPObl6MSHSZX7jCpTZjOzCAkalKXfVlZGfF3xrXuAIZ
         vzKg==
X-Forwarded-Encrypted: i=1; AJvYcCXdeorR3R/Z6ovY+GlgWaUnbJTgutatX7HO9JEHAjdrLZMtXRR1RO/8yDmJtkoLFZj90GccUTijhbWW+BkaYEV+@lists.infradead.org
X-Gm-Message-State: AOJu0YySGzuIcIXoC/humbYa353Zl5cVuwKgOlh04xBMaK8henTbL/YK
	nLkppnnzZgvG/oCJ2sEmJmhSKIV/F4oaFQAXdPHMyNQ4Wl0TQ90Pn4ic
X-Gm-Gg: ASbGncuESlaotkha4qG/bV7KCrPsQG24OhDAYDgu22BSiN+IlbX0WESiALcJuLOITeL
	s9DXjPp4R7OEffz3lC1jkMgbdwvq7ZeYGoerrF3yef+uzdSIQTL9s0iylpuBWMHKr/bSzheKCUH
	9yn/AIb/3SgpmnHf1wH4lzPbNyydEtyGZNH5wTkAUDhNRe/gCYCZOZZ+r7ukklHLUq3XIeONHbh
	gunh6PWIdBb0XYnuziy/gdttE/uPzNfTgvhxsrqEbDLAlhQw+KUGC6pf4ZJSYPnCYtSaaokp2Uu
	tZYWOAkwa5n3CQJmyytEZq1EKGGl2eigJMJeyxi0kBhynYzVy6ujFME03e7rwtCRYdF0oThoszP
	L4Tx+1zhbrNt/nUfFnDT/5tikeoKCjxS3RcwnH9MfkQuZsmAvOMVXjvF0Mf3QpFsSvBaWxbYD
X-Google-Smtp-Source: AGHT+IGaxqILFk1sWEKYs4/aKTapgVfZamjsAKwhDmFO0q/do78fw/vH+Xpzx9XExIL+rzfn38dWcw==
X-Received: by 2002:a05:6214:500a:b0:87c:2797:4942 with SMTP id 6a1803df08f44-87c27974b5dmr317695766d6.15.1761410014091;
        Sat, 25 Oct 2025 09:33:34 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49fde48sm16301696d6.61.2025.10.25.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:32 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 18/21] fprobe: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:33:00 -0400
Message-ID: <20251025163305.306787-11-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093335_518966_0F6B5BA1 
X-CRM114-Status: GOOD (  11.06  )
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

GENMASK(high, low) notation is confusing. FIRST/LAST_BITS() are
more appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/asm-generic/fprobe.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/fprobe.h b/include/asm-generic/fprobe.h
index 8659a4dc6eb6..bf2523078661 100644
--- a/include/asm-generic/fprobe.h
+++ b/include/asm-generic/fprobe.h
@@ -16,17 +16,14 @@
 #define ARCH_DEFINE_ENCODE_FPROBE_HEADER
 
 #define FPROBE_HEADER_MSB_SIZE_SHIFT (BITS_PER_LONG - FPROBE_DATA_SIZE_BITS)
-#define FPROBE_HEADER_MSB_MASK					\
-	GENMASK(FPROBE_HEADER_MSB_SIZE_SHIFT - 1, 0)
+#define FPROBE_HEADER_MSB_MASK	FIRST_BITS(FPROBE_HEADER_MSB_SIZE_SHIFT)
 
 /*
  * By default, this expects the MSBs in the address of kprobe is 0xf.
  * If any arch needs another fixed pattern (e.g. s390 is zero filled),
  * override this.
  */
-#define FPROBE_HEADER_MSB_PATTERN				\
-	GENMASK(BITS_PER_LONG - 1, FPROBE_HEADER_MSB_SIZE_SHIFT)
-
+#define FPROBE_HEADER_MSB_PATTERN	LAST_BITS(FPROBE_HEADER_MSB_SIZE_SHIFT)
 #define arch_fprobe_header_encodable(fp)			\
 	(((unsigned long)(fp) & ~FPROBE_HEADER_MSB_MASK) ==	\
 	 FPROBE_HEADER_MSB_PATTERN)
-- 
2.43.0


