Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141FBC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=; b=Bi+9AzN2XucIyMV5J3Cy1yzlKm
	25D8NZb+v0hrYFP5DGEIEUZeGsG9OQurWDULRxSc0Y6JdmivpLOpWAoKY8ldhRpHvtFIt7/9tkJUb
	615LnacQhIgBONKJZILZXxFx9nxOx2L/xLCXAxYMvgZJW0pKQKWdgl7LA5uREq0EHW2vwO54BurKW
	Q2pPHPg2ey0Z7vGxZKFZlbjTpNxEvHL4WacbQC8ssHriZDLrteuLX6i0ROC29tn8sz0HT5Pk0NZ1z
	UeYf0SLP2Jc6fbzjnoMXztvhV/ObgSOfftZe6ypIzBc7CjZH2Wp3ljDE82SGVWA/yJrCmKmEZCwQI
	DRDDYSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tez-0000000DBsC-1jpF;
	Thu, 10 Sep 2026 01:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Tew-0000000DBpz-1uuN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 01:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=; b=L7gOJ2s+ov7mrJhMTk7aXKwRtH
	cZdFzX6QTdWHzod1xLzvjXcNzx4N3Q+Mg5OdO96ctJJxNTZbmPtPAMhXqT26hy7tZnpsF8+Ewgj/T
	kfTYtGLZk9xdGERLOjYjLGzKpiFV9/heJ7bUb4EwSG2xnGmAciNp+6cyLljSco3/fTo4nNcKtjCJ3
	jN9yPD6qLM88Xs+hchr3T++S87R68PH4AVEMXSgBFI1zjK9Qemv0qySu9CAOzmTeRxjkK44kRYVwY
	hGNA1k/jdwoC2nadcuAlFPHanQfJR8IdNSBMasy91FoXlFKAw4rJnUu8QghSnglpHB3m74hb56209
	EHMe7/fw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Tet-00000001sOq-2pZo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 01:33:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49954b88fffso47527415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003978; x=1789608778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=f5ylQh56KjR38QT3QuM27Eo/q/Ngj5OKyRNzQEqTs2lla5KszOyNQ7Q4c4eV2x/8de
         I/Qtz/fiBYLfwX/kUOTT1YIu/4veSS9K1ECx0jFMaqY3wESgRQt9/3citOu/bPRjNSKX
         tg+p3HL8y/tu1+YRB1BbXg2PhUn9CbAP6qjuoiaLTkiaiM573l98k5aj94N1yHdPH/DP
         ddIynB7ieu4vqfoGNJN0ovlYQvqyrCrhLhHXRVEuKw95LqLVa2GqByRc2FA1MYSEmZUp
         aJw7siqMevEwxBvDGNcI5+I4zthJpmy63D1npZFYiJcWUJUrbZPRxqYPdneD14eBRFaH
         CURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003978; x=1789608778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sjlutxGiX8pDK8sYanBqVVvMMg/4+no/0Rn14LPE0yU=;
        b=ejTn7hvrOOu3qC4vh3mK8yO8PayMXX8yaMIgeVbEvjPwJKwLDJMVPgeI6f/XTlS2JD
         IpGmsLnrh1mHFdmfidrN0hu9FvSIszy55VUnfKqCaze5Xa/619CLUqZsNpnrH2a2QcZj
         GKalRSy2EzSkpVCEJZ5JG0//t0QY4zqFewdnOm3KiOH+hTTYp9rxMX0mQvqL9ghfqQ/u
         Mh/m3X8ZdUvdZ2U8be5NNRVZ6DrU/uRxL4oe6v5+ajdB+3nNpSfvS6srzSJaBKzo/QE1
         lSYdCQoh63qaKAYhEnHqxoszejJnBP9KM6c55qkIVexDn5tSEoATlRwy76b9RRwX0/ci
         m+Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxw65w0zg2/qqF8iZ7NLqQVvsRYieVilUVRJDOLWmFTADs1RsasqR9EKQQtU+hKY5923edVbAeo94CfBimryAer@lists.infradead.org
X-Gm-Message-State: AFuF++krqf8KuaPjagapja6Ooyep1k6kffr9veur8KREkCHaqf55E8fd
	u/pVduGgwoHxV7jwfJ1TZIj7KxwvKYzZZSihVMsFrQBecFODgXLoCvRp
X-Gm-Gg: AYBFou3AVZirkmTC94j0mzqVJY+0tQCB8LjUnEsbjfoPqZfWejeeKeLGAdKT/zjSO4G
	98oAvFu8n6QYCv5BmoaMjftcSnKWp7S0WU93oJWLGAQDKXiAqHbSAz0wqnS6UgJwM76jLKgdE8F
	XUd0atRsjfhPb5COmhaaxeRDdSmMwn8KgFZNCUuibII4+Zt3LCE6LYJFxkAM9cn7Wy+SdlFZngR
	2uX9/QkqUgjjm9z+Ttig4dvhCvUV3qTzL8VcgkdcwvVZPPMayXyGN9tdZm/EAbO7KjOMo/PzPyo
	UYc2OnDGiO7hILQxqFvc8Pm4Ifinu7TJBeX3RQuvMAZU1COwap3GcuUad1jfQZjoJpZ5XAo4QTE
	JtyK7weU+LurEdHwYV1cRxA4kTPqvobfGraS8S1o/otkfx5rKRU6HvcL9EGRYL9HHbbAUCuxw5E
	r704bV/+/ed638h+U5PqKRRCHHXkwNY72z6TOkdb/zRbNavZwwc3bvhtoZ2a+NdczY9K02REGlY
	YJ+wI4sc/uh1P0Fue3x41BRIfP0ooH5SPzwxL8F8MJsamr7jAaEAwfyEGE4DyuzFz3CW6dAzyre
	0ZtCkNaQ0fUvmUT184b0bPbWp3Ob/gclHL+0lf+qH24rwjgX/Ben4y5pFYD5cntpv/Gu7rqIi5C
	ilg==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr366891825e9.26.1789003977900;
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
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
Subject: [PATCH v3 3/8] docs: kernel-parameters: Drop the edac_report= entry
Date: Thu, 10 Sep 2026 03:32:40 +0200
Message-Id: <20260910013245.8619-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023259_785825_C32C6A86 
X-CRM114-Status: GOOD (  11.36  )
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

edac_report= became the edac_core.edac_report module parameter with
commit fee27d7d9788 ("EDAC: Delete edac_stub.c") and went away with
commit 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks");
nothing parses it any more.

Drop the entry.

Fixes: 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v3: name the right commits, Fixes: tag moved to 7fc0b9b995f2 (Boris)

 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

