Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4791D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=; b=XitZUc9kDvqA2W+VHB10Qxbsei
	qz3WfFlsYCS5mSH8g9lcBd4onBFAo9KShyULrVrAWfzn3bq88H+i/R9PPqNzVIAz6mz5JcjZgNMmE
	jXjoFXU2tBV+x39SGPfJjXzgR3X5/ocRGDm6hCHe4F5a7aWsRVKv+n5ESWoZV+8g9CLrM/hDOcqpa
	1QbnrwJfgkMkdynM8O1itGuwo462ryFCojm9HOBp59pFjPkG4AEJmCrwuqQYWU1095rbrl6Bf4Kos
	J1oB+HmlFTfVoqdWAxx9KKW346oPSkorUJ2+WJusW+KJD3diKahgEp721JSMNBcmpC00IGX3/3iDP
	ER2OU7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDw-0000000DQBb-132B;
	Mon, 22 Dec 2025 08:25:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbDt-0000000DQA6-1Bh7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:24:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b9387df58cso6064623b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 00:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391896; x=1766996696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=IOQVchSPLahVTtlpU2npoLqzDazBnhBlnHRPyyJOoZrNgKBUYa2TXgzsxU005oxmZh
         8PvRd1akuxMRAl3BjXj3uN6rFHqbagkR7NpSqqxjB49OzGnlZbIBxdG4iKdMrHATUC1d
         r4LMmBPVSH2zm35hMG3952k0Rke3MFz+y0b9+wyLXFVc2Rn2skshQad2P8jiiQLIfUCG
         Z12KW7LALY/07GhVO1+soCLCIHe86/Mjh3fqfaHBsg3sytFcFvHQw+dZeLAjci/1NeVU
         NTkLLcOlpn9cUqQSx3godY7Zx6V3uiZnYfTxvCewiam1100iPVYrMWFGB7xQJfW1Xj40
         PMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391896; x=1766996696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
        b=CsB5QpKZmCJF8JMDwHethbdulxPgJmdca3MmAgJMPxDXlHlGW9Ncx3fzhOsQIDZYS/
         YEy2+7W1pKCtLFJAbiuorMEucrZD7YmIH/ogLrK440N/8VrZCLVnNAW0MVhXhh+EA5Y1
         JIGYqcevmxsLx09tQvtF7vElmo8bb3bCbmKC8/PFj3+UhS2I6BigB50Q0X3o+ruvfWqi
         3d7sgx/irptgp8JFvTuAJw7ViXhVifLK7P44V/i0JLOpy+spCHR85KxDO5Znbno/hplp
         2PsjN/ASJ/dtR3Rgyy67Ts3wqTczUKjZWk1hb9Q14GNiKe1YhRJwd3bnC/bEpNQ0f+EB
         jHBA==
X-Forwarded-Encrypted: i=1; AJvYcCWZF0FUreexGhVHNXT/vld5G9pjeOzu/6TFzrhnpaENpj3zqCmV5kqAM96dWw4U8Hm4bsSY7FidSZvmpr8FRjvY@lists.infradead.org
X-Gm-Message-State: AOJu0YzIuki3IaPUB7eV9MgedBcdhxb0Gv1NZNcumn4EuG9qppbVMQdj
	JFaLcJLzo6JUdZF6qiGzE5LioaqM8R8fY2pACYvFMvd0zLlbqph5sjXK
X-Gm-Gg: AY/fxX51Ov/yGRgsSW+ryEalT8JgthcJNNGWeRwx9P6EBGUheCpg6TNur8LoRms1E3O
	JAAygNa1gR4PhAWvzk0fs+cXlXFFvyw0eW7L7z87mJ9mIXH7jEwGkAFOjSRI59r3m64rC7E4Dws
	q2K/ojh5bzIOs/+LtR4Tj+ZhQaXLx6u6OVYzm9mV3jIw232HnCeKlSb5PQET5j/0umCGAylcCBg
	XZBtfraLNaXlanwfr3yXnKjj1jSWJ5r5M89o4YalKV7sKPm1NCUvrmcdJ7bva+170QaTEOUqW5R
	EQtK2x2uVP/5toaDtE4gX69l5GH7LSh/6SkMeF4rK+vgOabhgnUvRHx8UUavtAd/18gL7pJljle
	J1T3JLPuaV6gkNMOeRp/ifwH2SMAsya4YehtmWJmQFAhVYvlNzpEq0Y+/lM/8EqYFFHxpVrTaj1
	idfQS+I9Sv
X-Google-Smtp-Source: AGHT+IEBN8n7tfe9iu0lB0z5JyKVlf1YDr7ixcXKx8kSouS/KoZMy7Fhajpfqtky2YSRXNA/9ikrkg==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id d2e1a72fcca58-7ff650ce054mr9990683b3a.31.1766391896403;
        Mon, 22 Dec 2025 00:24:56 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:24:55 -0800 (PST)
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
Subject: [PATCH v7 20/31] dyndbg: change __dynamic_func_call_cls* macros into expressions
Date: Mon, 22 Dec 2025 21:20:37 +1300
Message-ID: <20251222082049.1782440-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_002457_338776_B5FB8B38 
X-CRM114-Status: GOOD (  10.68  )
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
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
2.52.0


