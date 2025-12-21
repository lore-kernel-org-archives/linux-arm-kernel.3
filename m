Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA2E66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQ/i3gg2RhHrVi7oTjeMCjSkh1TUB3W9zVzP6Ymc1nU=; b=xpvO2zu2+xDcBw
	rkCZ3Jt1dv4cQXO1E4KApWVHH5orc+VVIRCsQXrOOx4pyXOHsUXHYgxoRudxtCWBx6InrFZxOROpb
	M/0IZn9qPmBw3hKVLB69/qH5D8yj1JHtxEUDCjzH3PQZS+LHumdBmfWsAdL4A7svjW13TFzzctu/Q
	4jgqMLOCTxXuf8EpXrQAB7zvZUgVvWb0kMOPgeUZrGvQUvVHS8x56E6EWfUhqF5opD7UWdbmETlfB
	P2Y/QcwwB1Ox2gd+gVZohXUJaL/AV7R6u7UB7hVuzeYeKR13hDkAfSm56EOtDCNZJXUSs2eozoWU8
	Rwy3ySVh2xdTErZSuVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXELs-0000000CERL-3ugd;
	Sun, 21 Dec 2025 07:59:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXELo-0000000CEQp-0n4v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 07:59:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d0788adaso26698325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766303975; x=1766908775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ/i3gg2RhHrVi7oTjeMCjSkh1TUB3W9zVzP6Ymc1nU=;
        b=detcgruK/hc6lgLPC2qt2pLvuR/4V4MRjN6Vpnr1dj0EbypiqymIVwds1xbSqiZ9Vi
         XPsDwt4lGn1VNbo/y4bMx53RjhWSmglxB3aC0M898Vdp7UekMwH6lVGiX2U041usteb3
         zEuxlyuSjfZ5jvqebWb6phfCaxBFWckExwiOSnBKz1wr2OHxHii05PRAupttwqrv29WD
         wGnSk9rKYsVOYtzdqdIaM6/vuJZAsv8qN7D/tODEIAnj1dEdrN3WA4YAMcmD0dWy2isA
         bkX/W4AjEqto7MoMla/Xti2925DbJYyzm+2qUsIdTFTPXiwgoORleLDgiA0KPxD6CBZg
         Pp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766303975; x=1766908775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AQ/i3gg2RhHrVi7oTjeMCjSkh1TUB3W9zVzP6Ymc1nU=;
        b=dhKIiZFfhOJuYtjwBt5z+6ovGo5jlFrsMfa8CmknJIgyncUHhcg2aLlJss+KhdKBY2
         coxWxyaEmS83jz/tlEzEVI2DwRolwwkz3VB7RWeKSU2OlFsbyhDQtdCkc9n1YAu5uvBm
         4IuPRS1fGPUyWBJNxw9ehwO6pbC26Jyw56mxsh0Apz5vdNeHa2xmH+PfcMudT+Bu5Cxi
         Pl8lD39J9+y978duZ5Pya6iBm+jFOtX/Cse3rpOGlwtgR+N7Y5YGRGwtNfQBHJOHNucW
         42hCrTB7woyV6drz1nTHal+1ItLzy531Pn+yWkLHFoZLs4viNlObbI5hbh6AduXmqEbA
         dryg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTSjLTQH3tkEC9YfDQU9Q9wUQLJoMMmAOnY6MugR3hLPKZ+Zow6NHru10DCQV+lbpFaPZp7uNf8Nd3MLnec/u@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXIn28qo2Qn/8wOxJ2GpYv9oZ4mCdW/rZwa0ZioirjTZEpnwz
	96GUxgUI3F8UyhvpsVSi3AqCVdeSQj25EbusRnz7oV7WevhH7wey0wrD
X-Gm-Gg: AY/fxX4qD93W94vS7mFaP4J8a5s9pVoDDm3hwKpFncwb/rlpjrwhHF2SKyHhmTT2pLK
	5i1ROkAHGvSIO0dxxpeyRYmwcfty4jGvvKWTjPK4ybHGe7ytJcFkkdWlrcmboQg2Q7oBoi7o70p
	kfqv+UnPSdhYZPB+zbu4tF+E9wWDD37oMWTE7Hp/1+hzp3cB3M/ly61OayWWRXMv7sh/h9Kw1oa
	QLmvCGvQTSmmEk2KVeRO2HViqMzwBmybk+49P6Gj5Qygo+UylKhk2uQur4Iuc3TGpc8ulmxIq7C
	1hoq/gJC9pE6ClFkd9whdL24V3420v6mLpG6B8BsFuZvseGpGHYpbgDNVtEincyX+xRA59c4J6M
	EguMXdxJQILSxEzuH5G0AQXIkk8N+5GbkQ6aAM4DMdp5eVj9lf6SeAY/ZN0ApUQLpGzZVu3v0OQ
	drnCCGWiaQwSU8K+1ywrhB17x9
X-Google-Smtp-Source: AGHT+IGvott4j8QweZbGuwsDW70w3ULSK0vaWfXBfaowVt0tvY9dm8J5MiuZ3H4ez82g05E/xhvWJw==
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id d9443c01a7336-2a2f222bc6amr78335135ad.18.1766303974903;
        Sat, 20 Dec 2025 23:59:34 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a17fdesm6226424a12.8.2025.12.20.23.59.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 23:59:34 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: robin.murphy@arm.com
Subject: [PATCH 3/6] arm64: Provide dcache_inval_poc_nosync helper
Date: Sun, 21 Dec 2025 15:59:25 +0800
Message-Id: <20251221075925.65445-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <99bb1797-06ba-440d-b173-db62d5f54e08@arm.com>
References: <99bb1797-06ba-440d-b173-db62d5f54e08@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_235936_274101_14D2F35F 
X-CRM114-Status: GOOD (  16.65  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, 21cnbao@gmail.com, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, maz@kernel.org, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 19, 2025 at 8:50 PM Robin Murphy <robin.murphy@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> > index 4a7c7e03785d..8c1043c9b9e5 100644
> > --- a/arch/arm64/mm/cache.S
> > +++ b/arch/arm64/mm/cache.S
> > @@ -132,17 +132,7 @@ alternative_else_nop_endif
> >       ret
> >   SYM_FUNC_END(dcache_clean_pou)
> >  
> > -/*
> > - *   dcache_inval_poc(start, end)
> > - *
> > - *   Ensure that any D-cache lines for the interval [start, end)
> > - *   are invalidated. Any partial lines at the ends of the interval are
> > - *   also cleaned to PoC to prevent data loss.
> > - *
> > - *   - start   - kernel start address of region
> > - *   - end     - kernel end address of region
> > - */
> > -SYM_FUNC_START(__pi_dcache_inval_poc)
> > +.macro _dcache_inval_poc_impl, do_sync
> >       dcache_line_size x2, x3
> >       sub     x3, x2, #1
> >       tst     x1, x3                          // end cache line aligned?
> > @@ -158,11 +148,42 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
> >   3:  add     x0, x0, x2
> >       cmp     x0, x1
> >       b.lo    2b
> > +.if \do_sync
> >       dsb     sy
> > +.endif
>
> Similarly, don't bother with complication like this, just put the DSB in
> the one place it needs to be.
>

Thanks, Robin — great suggestion. I assume it can be:

diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 4a7c7e03785d..99a093d3aecb 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -132,17 +132,7 @@ alternative_else_nop_endif
 	ret
 SYM_FUNC_END(dcache_clean_pou)
 
-/*
- *	dcache_inval_poc(start, end)
- *
- * 	Ensure that any D-cache lines for the interval [start, end)
- * 	are invalidated. Any partial lines at the ends of the interval are
- *	also cleaned to PoC to prevent data loss.
- *
- *	- start   - kernel start address of region
- *	- end     - kernel end address of region
- */
-SYM_FUNC_START(__pi_dcache_inval_poc)
+.macro raw_dcache_inval_poc_macro
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
 	tst	x1, x3				// end cache line aligned?
@@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+.endm
+
+/*
+ *	dcache_inval_poc(start, end)
+ *
+ * 	Ensure that any D-cache lines for the interval [start, end)
+ * 	are invalidated. Any partial lines at the ends of the interval are
+ *	also cleaned to PoC to prevent data loss.
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc)
+	raw_dcache_inval_poc_macro
 	dsb	sy
 	ret
 SYM_FUNC_END(__pi_dcache_inval_poc)
 SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
 
+/*
+ *	dcache_inval_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end)
+ * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
+ *	sy is issued later
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
+	raw_dcache_inval_poc_macro
+	ret
+SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
+SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
+
 /*
  *	dcache_clean_poc(start, end)
  *
-- 

Does it look good to you?

Thanks
Barry

