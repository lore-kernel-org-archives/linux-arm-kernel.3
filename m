Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF52DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=; b=d2S9pVuJf3gaxJ5jmINk6Kj6RT
	ArUyjBEtwDHWSXgvHPbYbquSNyJStZ7vFFY7xAogzH82ZTP8qdNgCgFvdki7yggxtW4XLMWHoM20L
	87BK7aX+rL5nCXRzur766CMuRlw6nJka4WTOXeq3zyf4JN7VswUcS5suUjuHoF1ShvtceIBLvxqKq
	ay3Io3Jcm5GECXwr4Yu6BjTZRs62O3Yb+Pvi/Pzimm7A37uGRLuOKUX3s1hK/ClVMtgNa7taytqH4
	Vrtm5ZzFFoq67xGDrmPi1aMC6q+SGxaAfyIYvT/MjP8cBV9kre+YKvIuPbynUNVnzMpR236beSqg7
	N8m/zAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQ9j-00000008BaI-3lfe;
	Sun, 03 Aug 2025 04:17:07 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPru-000000087zx-2ll8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:58:43 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3ea9e8154so15985475ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193522; x=1754798322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
        b=DYPe/q+PSq9WRvnU5r4yoLlNOcsdIvEKo0pdrP9YeeCoooNGOxjjMC32ePxUlZJRV9
         WzhSZVvJnsqvcPL93Ic23q/lQ8cLFhZcWENIuUBhNwlhr+PjyNiT0bZruLkhzRf2PSKG
         15jV422uXO1lMuPFyJ5lY5Hvq2pmLKDsjo6PdBvDReciHhSqy5tedTQf3BpSxVqefjuX
         N9D/8tKH0y8r9l0MWMhQyt4MkrMwEMm7Ha643vpzkJJjMUN6wTIvnvbl5ckjjk2pmdu+
         h4w6jlMK8E8a7bgGvbM8wIdNwMMrFsLz6mjyW4UmqYTLdRIU+VhfqXOX3UCc63yOsb+z
         fZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193522; x=1754798322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbagXP4UXG28aliKh3hTngHCxH5FuTw+jOpgL0x5ekY=;
        b=W4z76kZ7hTNtuQG0bjoIEJ7ltSzsWWCYKwxzU8ZiH1ZW4iCTrCSYxQV/NyUfPnw2ue
         mlNhCd8uNVnx21yQiwmX5qq4XhRPTAIgeT0TTL6PF4aQ5yURHc8o8i4U2A4aGHiLa4rQ
         W6/GiKOojutDwbOyNaI8FnsCpktb4dU/w/dAbH/cMvrPiWiAiMuhbiqhHh2ol0hVbGK0
         aMGZCkNNcVsYoLYsFp7i4Yv0AuHGRlW65JhKt3V3VHMubVtqKMhbV9eF+qbmVOkyuZkJ
         HeftwkE+Z+DA1d8K1iF+6pq3Uu/FU9mgyy3B2MS0qyyh1nvv/5pVJsUn9fuvCjybGp0H
         wiiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKXAZpjd04uZUMKsiOWWpMnRU2Vyl+tQdUJQfbH4THrYG3OwwcuY1qHvGcbk9VCikRijBNCvzm09xIhuonOr/+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+dJgPLioM0pMYPLJ9eAunam1Er3C8C1seWltAKEaUhGSph0Bz
	+gpkPpN9oWP9+obG0ipWl57ISbSAKl+vFcnWgppwSh6MX8FFc5TlFCsK
X-Gm-Gg: ASbGnctxdbFdBrbQ2pI+xWUz2O0UtF1FRrkHK5YkvF/5mWu+b11Qf2y64/TvcKnE23w
	lT2FVdZGYKNtW0Q5xwj9S3sZ4btuUaZdF7wwVZCOvoFFFFXTW21Djxwpxzfy9YYRvrtsIEZD1TL
	BD55ASw8xI0r7cskOotDiADJZ3/KiJaEyJcaasqAHg3ZWOeNVvTKPJbHIjr/IEJ/+s02uj+lE8V
	K0tY6V9eyqME03TJwgAVAa0Jc1zvZZbviEjzUVJCYE/r7rVfPiO4rguodztmjiNZde9tNHeAL5G
	r78mvBCsiu8l8C2NaCwILVxwQfgj68qRBOAkUzdUCIIp1Yde5j/xU0yNq7aBQvcNlERGlmphE9L
	Kt5DEDFvmctnSJS+5ET/R045n3b2YcGAAGFxKUFZzQiMKQhkrC/dxQIwabyHCO1diVc/NBRVsbO
	zCoQ==
X-Google-Smtp-Source: AGHT+IEBPg9osrUDJ2eMDLZJ8n8wcDzvlf2PJNGm/kwan5N45OjUBgHKkKoWTIKMjcalGwUYti/UbA==
X-Received: by 2002:a05:6e02:348c:b0:3e3:d674:6754 with SMTP id e9e14a558f8ab-3e4160fb6fcmr87580415ab.3.1754193521740;
        Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 06/58] dyndbg: drop NUM_TYPE_ARRAY
Date: Sat,  2 Aug 2025 21:57:24 -0600
Message-ID: <20250803035816.603405-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205842_701886_8C5B7D9A 
X-CRM114-Status: UNSURE (   9.70  )
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b9afc7731b7ca..ac199293d2032 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,11 +107,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.50.1


