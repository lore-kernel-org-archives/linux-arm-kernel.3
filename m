Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6278FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=; b=bk1ctbuQ9dEdAKDhjHSjLR3xdF
	SVhairGQwwrKl4nYCncM8UTqWBQVxYzHqMqlhOFRzrNSJnAiaCSTrfH9fb2yc6qCDsy7heAqLTX1y
	OuGQqCPMbPEYcj0AdrgrXZxAbzK5wIUt9+Zg6dJ586FnHm9OWV+ZBi8NlN+cPF6y2ZGkzjkjwN3cQ
	LgEzGaIOemi8H2Zbk3eOJcTfjQhz0xAlO6hqiMpEpOGDNj9bKlUtqMldJicGIQC6/GywoJzUt6JKO
	D7U2e5kklaTABt58T8v686Imb/DUr0SJVYcZbpxPVLrlNHwTxd7EpS9XeJFiDowSH+f02K6nDgxax
	N0iHMaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiR9W-00000008N5z-3UYl;
	Sun, 03 Aug 2025 05:20:58 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsV-000000088QF-12Eu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:20 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3ee9c7815so14652705ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193558; x=1754798358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
        b=aiwLK67E6cZyUHIZnrZN0iULnpphrKRttpl+8gxIv3Roymp3F/Utvt4/FoTlrY/xr0
         yUdyfSj/W70VbXuw+7S0fpSQ7L0qMrM+CUZqJMWPBtj5G+8TetkTK51dXN7bzi8tsCp0
         IjACs+XmKNU5/RK3D2p9WxxenHe21uhaMlI7ked4tvmwl0yG/Givsx6NQqTJ9p/6p/6g
         rIh2CyEDC4nL1BNah1bVsSQAX6cARKYR1rToOTsVx0j7D3a60QcJt6VTyxTaqx8nL2Lx
         8YNn/qbBiMAmeOgG/g1rg6yKXaZArvUoQMbhMaz5vhWzLSXFAAEP1pz2D8WUpyXHPtnv
         YZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193558; x=1754798358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2ReCJfEK5pKTcOheDemwRlm+fJVRguF1Peh0eFAuDY=;
        b=pOCc65+KpneID0bGMX04LhJoVT2+EhPoLDcSt+MkduPGPKlP87t19Qn/saYwhdchsf
         MdA1pdFE/a0FUCrato7JTEL8qkY2MFDwn5rZMVEKhwh1kKLytaDidaPu7IyFDqHZBtfx
         rgKE60rcZZPgjTyaNoLBlUtBvBaM/56YZ9K9Dyzwr5CPMA+aBG0DQrRqjy4AdRJIk+mM
         v1GlVVXa+fCODbAavXplytjW9xcK+5RmyEGrGSzLWpIvIpfU2OeSkw0vi/w832H8qKNZ
         RmQh41ifd0ZNkoO+38UIz2ptVZTQcTbXD3EfGClZnco3563wsBYeuCKtnEsJ7+xocMoD
         95Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU97IDb0UALzufeuCCk9D/NTPVYecdIVJwEs1Er0YXPGw0pxiqApsQLU68NWfcDWkFcfGs8mPM/D6lcDSMlvtu1@lists.infradead.org
X-Gm-Message-State: AOJu0YzIKz7M3Lyh+LmfaTzyOV28tFlMtdOAf8zlggxCFEqHIRW6vYGK
	s7Azu7j3fgdvjaKlvFqwjCiGhDZt0bg88DE12in9za6DQ6brgP1TnL3x
X-Gm-Gg: ASbGnctDgvFaZ8/Tn9sVxbZmpa30ODd1lYEqwcjxssiKMc6VzcYJMttQ2GoT5pNB1jo
	mSjG6V65sWxwiMDi1H1TKoYizcww/17C1Of6TpmTiVRDDApKTzA6mvMnnFn8iIgV53/mprJWm8k
	KPUlJ2WBzpHBrjM6t7qbCaUtykJWUieE9Jn/Eb/grTgq7vdIG15L0XgtXR1eU0PnvFEVqXHElkO
	7VOEAX+dhzo/RA9G18eWKVaoQl7J0QmoLplfdcikRlOPrfHZ29/e90npEy4rnW1S2qrDPq3kQUz
	ISB7LngoSbGl0rQkh9hW4n+yGAzst3thMM8xsTUlooFIDKxjNThcOXiq7AIFZVx8nT1RWhwY22C
	wyTgVEsCMeXCqdf2P0Ps27cmCX7lHvX2MTufcbgwcoH0OROjBquifaXV8Xni97fGgZqqFu5afgQ
	wViQ==
X-Google-Smtp-Source: AGHT+IE2FO7VIZaFeVJY5KU2r630EjFzadS4s75s0S/BwhMpT2559l4J/Oty1dGX6agEpkO8lUIXsQ==
X-Received: by 2002:a05:6e02:3b82:b0:3e2:83aa:1375 with SMTP id e9e14a558f8ab-3e41615baf9mr95938835ab.14.1754193558557;
        Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:18 -0700 (PDT)
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
Subject: [PATCH v4 30/58] dyndbg: reserve flag-bit _DPRINTK_FLAGS_PREFIX_CACHED
Date: Sat,  2 Aug 2025 21:57:48 -0600
Message-ID: <20250803035816.603405-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205919_295739_8327D705 
X-CRM114-Status: GOOD (  11.29  )
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

Reserve a flag-bit to remember that a pr-debug callsite is/was:
- enabled, with +p
- wants a dynamic-prefix, with 1+ of module:function:sourcefile
- was previously called
- was thus saved in the prefix cache. NOT YET.

This allows (later) to cache part/all of the dynamic-prefix for each
pr_debug that gets called.

The cache contents must avoid the Thread-id (its not callsite), and
could avoid the line (to shrink the cache).  But then line needs %d
each time pr_debug is reached.

ATM, this is just the flag-bit reservation.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index bc26bc9128c1c..0f7476456614e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,6 +38,7 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
 #define _DPRINTK_FLAGS_INCL_ANY		\
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-- 
2.50.1


