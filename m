Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67D6C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=; b=z3jGE1zbkOiKe86O6WOcpiUjG8
	eKZbw/5u7HYpK5DsbTaPK7OHeztvBUg/aM1vk9V+J3AiSrT8w2xOfv0PPOP3arKnYUoCqddJFH7UM
	yuDk9z45DajEucZ70FfeGHDjlDpnNP6sARJ+4kOYBcfEC9LLpoulu6dieIgUrBWjWTL/5Zw5Hv0+F
	+djpJ5PetDlpHcYLIstMMpG3mX5sFhjusnzrxqKTrPPaXnttFXmwPFWaQrFQAz7gtg2wRcJaFwEuk
	iusTA7f1+nRlDrvhj7Nz7frdWSYvod8oRbhCifhegXD5Dwmi8Meg27nUgYU+zdtJBEXaIdxR4+Et1
	71xuvl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf8-0000000DBzy-036f;
	Thu, 10 Sep 2026 01:33:14 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tf2-0000000DBun-2aiv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:09 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9628135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003987; x=1789608787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=drEd77rKJBpDFqhEAvPHqyQIdn91JrCglq0yiKpZOv1kwIYZp68Wf/kjaV5SrHDgxf
         bVpN/r3/HEuybuT50B5B9cip3AQtf8FEcOxHD3fSC8BVj/KqpqxOkva66Ir8WwrA0faX
         tR8YgzRnVOQVtRIaJG73OS/oCJG5PiRuEnVzbrDgDKyYKiwUgtmCADWcvpqCAxwUgQSo
         rArdRwjcUkTqa1APObtu3X/f17cUTdSelOOVP9qunHSkDhsO7YR5pKtyyfVVmHbS3c0O
         arnXXu7+YBzj3Sh6Ty8r9WttwagJKzAc8d+oZ+N2kq/rfauEsNOxx+hu6D3+Dd21YXDZ
         rP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003987; x=1789608787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PQdyP9lzK8puPxCmvP9p22b7bgDtVaxFnQRwYj/u0p8=;
        b=EZZXhnUx29OxBi9X/yQM2zQ7BIGj4Gy1DStHy/Os8aJoNNGGp0RDx57txwiyiUFQai
         pvWWK2zrJ2W/VmA9Hc/qaSxTE3vkB+SLB9pWIer2RQHUK7YPONvz90/wBAt/bwbg5JM9
         GhIKgsx3jf1f2jE8eBk6ASXrUYjsm3v8r98SjM8I5LKCdjAyF0+nGC4G6A+sp2xLGzyD
         +XLNHr4+7uVh9ntU61as7+NS9VpA1WJqzuUi0JO9Z34HkObF1SwvnM1frJkgyZq4fDas
         5SYySgSLFthbAILYyPLar0i60kmgd+x28VnMII9opFYNTEBd6+YF79wKFveMrRZXpPLq
         XGRg==
X-Forwarded-Encrypted: i=1; AKwUvBzry2O6TnfVFsuDMlSvO3ee/lnRh2dp7iyRuHJDE3u02249pZE6kOdxdxYfw4FeQ+VXjd5HGsOnW2c+SyPG3h7l@lists.infradead.org
X-Gm-Message-State: AFuF++lskT8ezpQujWveDk9YMerdo0EAXq2c518zLPxWZ6dP+w33f09/
	eQk0IHJOzf37aVwSR9UliVELM0hLRNbkrIUG3+gr2VvIuYa/cL9WdjcS
X-Gm-Gg: AYBFou3HMiq3W3JjQ2trveMj9ug3YV59YKaI7l7ILdRe4t67zH1JVsx1thfFdWBTYVX
	RRZFJONeu20Vmc/qJlaAaYRGSMJgD65WHiQWdGMYb35FyvPWqHfmWwjplZ/ew871pGyEHHE7TIh
	YFIUv/+I7IulY8vwHuIs64gjx2w33YS7Rhqx6ft0wLonDSJdonwiGGToB6GXHqTu1RkvzNYTheD
	0mzqcRI1MFauMwY28MirQFVB/cg3SlI2Zx5vGr8CyQ2kutF5EA7f2Qm9KPYoZInYB/mS1mLu6ZT
	CJZ3mPWEwLVCVKLoHFB2IzjBP9CrIhpVUvc2fDRdf57Fcp/R0Q7gItClNr/iHZnCi87Rq5cNAAB
	FwA50u8T6eX5URC5D2BSCua40dKbIQlR6JdjtIDz6us4yomC4eQCj7LaBUN91TGi1PyATFmVlXo
	XnS7KvlBeRTHLX+u9MujSz8FDWaooU9ztgcGy6pxUc6fdu+KlF1SQ/86wqMWAwa0C0GTfq5qN61
	DXeYroP+QB7viNj+UPtUy/KIsBTOA0tIBndb/EnHDZ/G/8jW0HHD9WqF1LdxfrgW+Iwu8E4PHnU
	lVeqQLEH4fLs7bodZqSnvv/jq12GKsWQ/TSpTdS8QdAT67y10bQ3tquyMNZzulfqbwjet11nlxa
	oWA==
X-Received: by 2002:a05:600c:1e24:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49d259502f1mr79893755e9.16.1789003986665;
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:06 -0700 (PDT)
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
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 7/8] docs: kernel-parameters: Drop the omap_mux= entry
Date: Thu, 10 Sep 2026 03:32:44 +0200
Message-Id: <20260910013245.8619-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_183308_673830_4D5A1D22 
X-CRM114-Status: GOOD (  11.68  )
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0

