Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6964DCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 01:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yo1ANKt2AnPbyfOMzXRqEqyKaR/EpdFhiCwQ4FFZO/4=; b=I7rNrb0IY5aMONrvqn2VYdan/o
	/JXg5nQtTZl9z1Dyl8KxEJ3AdZR9QZpWPTcvcpkwc5e4nX4X2LGLVRyau9O9r5eMdhH0ckkK1SWMc
	m3C7Ztw2qTa1zaSYi2h7FeCTH0K0/kGriphV+O8gEfNO7GjjBnw5LrBF3d2qKIVACS+3pwbQ5Fm4O
	CsuZiiJRZkSKpi+T1HAXRVDFF9s1QVMZ3FecW/iLAQJKunPpexpBaAuhQxr+tkGaDcg3QjOORdoUb
	y74sDFgtmm6lSZz7B7JlcskDPSk5Ial428Fm2E9KrsbDea1yCQaGcFhdVnnBtZ8F/2hOPiH70DLd8
	GNlZtyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOn71-0000000DrQ3-4Ari;
	Mon, 18 May 2026 01:49:43 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOn6y-0000000DrPG-30V0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 01:49:41 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2ee990e8597so5241290eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 18:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779068980; x=1779673780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yo1ANKt2AnPbyfOMzXRqEqyKaR/EpdFhiCwQ4FFZO/4=;
        b=cTI1hHNN+gQiIr6K/q9VEPndWSTABMB3FtlRTyuRGd4LY24MoB4iBVM1sioBx9Ib6P
         Xwv+S1Yprme+U4gTwTSGDglDhlQp0WZvdUPtwY/tRG8+y7C8RcUIk/cEPKebRJ2RQGWb
         z/hKRvrHPBslVMVdwEj5q3flZyEb7tapM4Q/fQ8rAWNvdA2xih6E+ipqZ7tIfoCajKDS
         XI4GoIDFEapswFYSownH7qc2FPM+RAgWguolRyUZxOJ8D27xP/KaNPImQSMBMl51iyvf
         Q4UgknmMa3DJSLZDaB5gb8CCPmcqYrIyvH6ln0DkyAo+23aflaZmXWe6IJdW3oAxqWYp
         jTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779068980; x=1779673780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo1ANKt2AnPbyfOMzXRqEqyKaR/EpdFhiCwQ4FFZO/4=;
        b=q2NbHMbLNFzVxOqm+lcaHyWDYpCNd58bMreZhlBdIQcURNamM6/q0i5EyIMARdFK72
         aTfCqkouXf5z6YtMfcENXqmBvOwlv5Ff3A6eLg59+Ba6bdvbX70Uja2jdjkQ7HWrY7xr
         dRQ86SJaoBI0rlv81lAxjUzbbVpyGrRX6HgQp7OsMKdvvWl1Ys/btokeDsmG6gDOa23O
         4kEHlREOVglbCWsl2o7fFdPdfuxc309NuSRLblgpI5b58gc9RO5spy7L61uRdQy7BqLh
         SeAB6xFXQb4UOLxPxGjHBbg3B4o8T9GzV1M/NJEzvrMXe3w2e8GmdJuHx0k+IN07IhCz
         EHEg==
X-Gm-Message-State: AOJu0Yw/a8ssxb9VamjgKWAesb+lg5IN9Tmm5IWZEiHNaBUgWdp4g99Z
	N3HJKErgqWTMsLau0J7JXpmIjulQD6Xha5ZPWBihKlQ94lgyKJl+Y3bHqRTdnEvDisA=
X-Gm-Gg: Acq92OFAytKBJUv0Fqxfz1xx5Hk+rq96mt4L5kiQFTweRtRO1sxMf+vqK3QOIt/82UM
	DhW7Q5OxF7/1h9v0euewEipgrMY24vwIC5KxrOxpNs/ZIw9peK13fR3OYiqHI/swUyhwpTjZqob
	Kk92kjOHh3pi4QUHpT+q07RfqR8mHS4aB+J7txDTeyQC0gzGEPTvlry81pPCyOcsoOM5QuYzuBD
	MJY7MUgxZcGTgppy6MBHHLKz3rniViHx4Z3fMSEz6RZkniwXFCpAJJqqq4Zd+asqjN1trTl0lrk
	8HbKExgo2x/mRXHC0vGNC2B++zNMjqxehzRLyo6UAPV7UlMLssilh9+JhwDAZkJ11kUk1mvkuBl
	XXFwuxlvrYwlN5wPB/kHDQ0WIlTKCLG9gd8h8dEtbIQcaSseQU0r87esJgCHsNPPezKmm+M82IW
	JN/VPJmnZz+TDAdwO5GS6DvCmcW4v3JFlmsx2h3k3RijGdlv37N+xUz/pGSzhMLRcdMeHy5bUL6
	uGQwkHp9ZlnTjRexW4D/7BIA0orC40Vpabq14rJs2i47W4r0ohy2o1EvRBxBhK8relxx6yfh6zf
	ZazoIxuGYJBM4BWBEQ==
X-Received: by 2002:a05:7300:ad30:b0:2e6:e504:5435 with SMTP id 5a478bee46e88-303982be4c5mr6340680eec.12.1779068979663;
        Sun, 17 May 2026 18:49:39 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc8ddsm12335857eec.21.2026.05.17.18.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:49:39 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
Date: Sun, 17 May 2026 18:49:17 -0700
Message-ID: <20260518014920.135011-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_184940_794966_BD41AE6C 
X-CRM114-Status: GOOD (  13.00  )
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

The eBPF JIT unconditionally generates ldrh/strh instructions, which do
not function correctly on the Risc PC because its bus is unable to
signal half-word accesses. Work around this issue by disabling the eBPF
JIT when building for ARMv3 (the Risc PC is the only currently
supported ARMv3 machine).

Fixes: 39c13c204bb1 ("arm: eBPF JIT compiler")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1155c78bb6aa..8185d013e5d1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -98,7 +98,7 @@ config ARM
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARM_LPAE
 	select HAVE_ARM_SMCCC if CPU_V7
-	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
+	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32 && !CPU_32v3
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_BUILDTIME_MCOUNT_SORT
-- 
2.43.0


