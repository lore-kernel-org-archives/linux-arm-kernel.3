Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE29C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 04:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=; b=KM4nJodrDxHBkiDvPzxbosS8Pi
	Zv+Iw/3Z/685jrWie5PXGce9Px0iGjjt7h0bTvANT3+ZvMagFiZyGfRvLN1sNYey9jNNHiLmAhF9h
	mSJ2RRutKbM8WfpBIiIQj5lGhVXpKhnN2WfsxK2JEpxTUpJQFMGazdF87Y8SdE4ZwntSO+wJffzmb
	h1nMDC7QWKQwOSHwQHFXMx+pFJuQPUaFAEMABJsmxBs7ADVANc65B7ISXch1/5FMmfxm0BqFakEp3
	F2Y+cO1r6YX/qfZk6+8XJ2cA3BKkKAx+ltet4KlB1GEIx5K58qL3rB6wq+tx8vMZBesizXbFoXWBj
	MCaI/d4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiQh7-00000008Gvy-3iy5;
	Sun, 03 Aug 2025 04:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsI-000000088Gv-0lXd
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 03 Aug 2025 03:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=; b=eybr2Hhlsn/SRDmUhecHo/CLki
	6fSpEM7pj/jlXcfpOc/wAN6zqyT/brJPfNfP5BFnBj3P0lJsGlwud0IgVj0IREswE9xkjSxJMYxIy
	xJSm3IDLEkyNz7Hfj77XGP+FYTJ5e9A0w5Np/avMbAUd/CKKFC6SMb9b0TKZp347YFe897Kv3TnLP
	JvZUyq2i+Bjoxc2tqqRwgtmnbgcDEPbro4IauponIc4iPu8yjhjW7C++S001dP9yrQ+dDin2HayF4
	MJi9txWFGGfkqMilUJavPHfTlNObsuSvclk66l5Ep/6wWL5hk059H97S3WbsG97om4ZTU3pMNdwui
	Nz3eP0Tg==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsE-0000000DXHl-3Kgt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:04 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3dbda56a5so9950685ab.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193540; x=1754798340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
        b=FTA6JOgff7t2k27G6Eo8O4fhG68iKhG66VGssxXPFbMSR9WKhyYrMCGANjAkNRm3qm
         mqRDgPaFOolVwG2l1ob7AdJOdX3gOv4GdogmP441bMAD32CDxIFSz7EXR35Xhr63F/aH
         7/JKY0qCsFpl46np4A3bbh5NTyk6XLyiEddERqIVVq1VcVwEcprMNFgNoIZxE0exPFsW
         GVhl3jQ3+4vV/YT/vVzdFuwBEgrVGJqnRWfcQLCm5MYvilKxOuA6hDpk8Zn3c5qEPWAd
         hPdv0yFC7WuefAK6hM620xVln5BCTDBG1P2OiXCySEP+X7MGGNxRlRV145mcQobdi5YB
         bT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193540; x=1754798340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7NHmQkQ5gysWD4rwW/j5R3bG6qHLaOgggFqVWsv12Q=;
        b=nf2sSa4fiVfvEbOeZ5CYFo1IVCpxAuHK1Nprm3z6+tYmp7Vqby8Ga4PI4q5C9hXi5q
         k0GF7jj0n08BFIChJr8geezKhu0nEda90GacI+0QZzugFygb38EUNbCmuiF+F31/NOUR
         v2mkyGlI8vxyH0kFjm6v34EZAd6clHeLEyay7QrYdrb0BYYJDJbYcC4GcjoT8E0rQMzG
         5UiDjdpuJ7eso3N7N0W1znNFE05OxVQvhX2YVJ56IAGsTkiZS7KIRLZPhuCqg5w3389y
         Zz17IeujJi4LqD+k0sXCFRj7T4qyKTe2hsEufAOsUuAD9g76WwLLmDcGSuefy4ifDBso
         Tqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVRdXFvNEeaDkqmudxr98tQ7xpKGVNmHttyc1DqRx7/viIz7tLEv75hW24fJnASaJ7n0bMgHmbGjK+7TfAmPMbC@lists.infradead.org
X-Gm-Message-State: AOJu0YykAaOt2Hd2XXqR1O8vO2TxjOmwI06/iXKqos0G/qYw9aZvZocc
	NrqK/h38afPcO0VPcj53gxzf7uj9C4Ln3pHxfGyiSiSBRsTkTf0yNzTJ
X-Gm-Gg: ASbGnctBOQxzzdFxSv2vOrL1k21gA2ctvVKKJ1XnEon0WwDlkOmsfWDLahgTUGfVnfR
	u4ihZD1qGE6jVtacaJBbP1OQtgxdzbHKbLsxQqZaz66Sgr2tM5ol0YZqT5Tj+tJ2CUO6f9ZAHl8
	S8ARrz4f1FAMgR/27GKY9P0Ic1dURerTfvHx2t/6eVrOy8re8NmbJZsEMb5B9AF2LUvfLO4tKSa
	wmH4uTzguRTzwo5374LPKeamX4HtgfHOve1/DXhLE751c4wKcZNSzvLuY2FLeTDngwbseiY/GL0
	sOsAccCvggC9J7N2NrqK2ABtIHt9FtsnxaxVSDnYAEvCaDgO15VyEVcEXNCNxdgpUbJH0ym0DEh
	EwQ9arwHtfGsVQ2snpbmf/147PreVWfYVhkjO7LLhB66w9neSskkena6B41Re1a2ESjcEw389sQ
	5/RA==
X-Google-Smtp-Source: AGHT+IHGjrGeB/JwKNMq2lNHvYPJcP3h9GIpyCQ+sHPo7dWlzj+a9+9jFlwqwwnEMpSJYhvD73NT9A==
X-Received: by 2002:a05:6e02:2194:b0:3d9:65b6:d4db with SMTP id e9e14a558f8ab-3e416191d1dmr96253475ab.12.1754193540188;
        Sat, 02 Aug 2025 20:59:00 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:58:59 -0700 (PDT)
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
Subject: [PATCH v4 18/58] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Sat,  2 Aug 2025 21:57:36 -0600
Message-ID: <20250803035816.603405-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_045903_123623_E77FC25C 
X-CRM114-Status: GOOD (  11.07  )
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 769f02456c8e0..1785ef5b93b15 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.50.1


