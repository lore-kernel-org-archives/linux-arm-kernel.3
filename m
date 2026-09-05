Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75311C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=; b=YHbKYorGCN8pZ8k5AWlUcXewvK
	pOvYhVqkQYoIHcoAjoPQBy9xt/p+3nwsPqpnw/7wfrWQhzUjYEscQs6j/aqNe9dhX9rMrSymoCyuQ
	seZXFknAWVdk4xDYa1vLiWRrSV+Vd94AzQni/q3EuZJNU5HOpcE42Ngiu+0asb8A3cqkZk6JmwjDH
	c9o7q1TJ3fvMvlr4uiBMBv9XbAgSCqmQtL9lZ9y6qRdXjeuVcjHPzvxFS20OJ+54bK17NCF53xVMx
	7/JUheQRWkJ64jvN3Cybay1OrFpUJ04B2tgsihJ2rb7wBMe0+bvk0tFNNYAOQu7luETbxWCHhx2rB
	zfD1gcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzf-00000003wW5-063S;
	Sat, 05 Sep 2026 09:47:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzW-00000003wKp-1PvB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1872461f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601636; x=1789206436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=l0qicIjDLmhzm3i807ypATT5eiCilMfxd9te9OQmv48FS0Cgbh2FLNDM8IfFuK3CvK
         duDwjIE2nPT6nWqG5UNy2EWbbJ+MFNZsBr2LZKS9eCRc49TYUdwYRHDiYjIf8+kCxw7e
         nB5bBXisxDPhemdj9UpE+JqBBE2gi8SxiF0QfCljMwlL/CzWl0PAH22QZoNO7ITD5tQK
         kNy5eSZq5MoM3/boF1PHgalw2+2cDBy1BF8fj7ppgJ318QsiBvC19gcz6tMsNGADOdC2
         Ip4xfesQzKYe4t3zIHKVxQLfCCDBsr9G1tdR2MYfLSeA6gk40wCPCtJEqwrcxS8eAOAB
         uIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601636; x=1789206436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=L+A88EOoSh49DVglKUXuR1szT6PLMEPYxv4sJhYHBifZuH1M8uKIE7aq4Fenqvck0K
         Zs2EesQ4hTPUtlcclNgPxG4SnAi/bCIIF1dPayCHWpHD3u/q/teLJbE2QDFxelbJ1R6C
         R9RgFGSNHLib08snOI3qGEuMR85vuzG8I1NwByevFkZ1NOJYr5g+fb/IZC3lHTPB96w1
         qu8kxvZaZnVDckHwFG7Yy5QA+IJERow7tGAT2OCKMoGUwbtKt0c1YCqPfgd2THZnA5nG
         pxI8BN1XSVTr//c80eMWhmJz/FZW3sIZ1e43+DkOQ9zhHcIoob5atsEn7ye8MR+qkJ8U
         eQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwNljG7S7MXgXxp5fT6jrk2sj20KVKD7rjWvfWhizn25VdHcqvHyF+G0Dvce83rQ6YAjVtwCs7Lx6TlAiPXpj7e@lists.infradead.org
X-Gm-Message-State: AFuF++m0O3ROlbq6hfi2VavK8JKWwbm0Va0EIAS/+6647L4mD1eNGkij
	JaLxHqVckFQo06A/hqihCP23jILgvm8NkZuETxEmkjg/LZ26Or7mrWXn
X-Gm-Gg: AYBFou2VQcZf3n+UkJbYKpZgiNmFnds+bgjiOtN01Zd9oofn+sn/VEXLNVqlYDsEE6n
	jLP/Y5K8jmJd4IFL+v8NIM5BQelQuCPIzFG8IliIYHlCnagd2sLC/QJrsY0p9YUDtk/1dkraC+6
	feIDBNrBaBXx9PyWb5NhLww65/uBiik1EzHVzIgS6pP4vX1eGImEwdh7G5BoYRoXzB5ZvUon35B
	FtJUww0FFzZJby3ax0oYdDlj1FppGhK4znScBOkXXPEeYn0cl/zCBk1LfTRoGuJyLikAH6FNnHG
	BJZlcmQ6/eHdLiUs9KK341M3+llA8NQxR9scwNFfQI9a8GFSc38BwW9BH1LTvjAqBxWYSDuMJUs
	Sz2K8I7+BPihrc2n6loM4KEqiSccWe/RSJFMbWN4Mdvz5YWfsa1k0UlG1FbTro40wNy8NDT3Phl
	eGWSRlsyZ025TGx8/inGrcfTNNGCNtw2GtNRDc8CcTL7V8i4bYgonxmNfA/cBwuThgkJlRPAvCF
	KFA+Ovn8dCS+7EC6XjONhgKLqbb3esC8jBdyII8Nq//+wfo7N5mcin8u81wG2eF7OALxztnjEEY
	9e1gQfgQjLLPpBU+2wdFlUHnwA2F6+rGJInESRboR7qH+hXdeQdUBVqq6X6KONoXiFTM5H2+0+J
	3IA==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr9454058f8f.12.1788601636313;
        Sat, 05 Sep 2026 02:47:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 11:46:49 +0200
Message-Id: <20260905094649.41996-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024719_154738_E334FD42 
X-CRM114-Status: GOOD (  11.32  )
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

pata_legacy no longer has the qdi and winbond module parameters:
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
both together with the VLB controller support. The entries also refer
to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
not exist either.

Drop both entries.

Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.53.0


