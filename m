Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98596D216AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=; b=Q1qNmrPSR1WorgwLAFEaN3W0PX
	JoCEzik01iuRc0Mu77qP5Ys26u3WKQqTcYKKaBHYJxQAMdzpKSkIgucR9d3Zxzdm7hFUgjWjw5l9k
	5b2k2PhEmg347kVuRgOTLqA3ZaDgimmpnVol2KNk8rwMH3N2JzKLeLzKeM0SH77rjvIU0vseQjgdP
	ibtlusSiPOcY4dn+8x4VPXg/vPMq5CI35Pv74hxW7sgt3/yJycaYG63+N1g7Jxi8rRxQlAezcyWBo
	MnlRshccDufkluZTIHYIJpgFeo7/LOdoHN0ZYI68ce26iqYnCCoGrc9FppvY/qNJ15dSLKN8vTl+i
	2lcpSX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCAv-00000008Hky-26wv;
	Thu, 04 Dec 2025 16:27:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCAs-00000008HkS-3pmk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:27:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so11860615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764865638; x=1765470438; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=deep7YCJjGp0euSnjfjcLUzMc0rQVnc5WUy4mpY54QUUCRuur4PjXJELmtVmT9o5q/
         lFW4xEfVnvsLSifA4vU6Xl2eJg6dH1v675miEulGCZ/eMFxPGB3KqjmKB8Hztow4JpsA
         SdAzgYf/PFpsnF6UvYmT2IMJ3DS/kK7xHOUNPttZ+vsb9B3Pqc0INHcsDQo2hEXr3yWR
         uhCKCy2anic7zIINDYdJBzmkpbwTNr46wuvq/a1gIM/m+gVIQOL/YmdkRumB+OYklPCE
         VLltEiabkD5PDPJorYJ7taDH5bCGokvK1kb+fxaIuXGZOjn+blSRZK9s/m5wVeyQxjN+
         yAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865638; x=1765470438;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tPUK02ZLrC9M/8Z+z/1Oq9I1aD8192v0FSJkrRNjw=;
        b=hmKPmMSF4H1b9Jj7vB1OOeUI3gFhg45uP4rwWL8zmxVCd+mW2u4bY1hI3Km3YBIBR/
         tyyA28aRlumZwns4VsNGp8aWmflcJ84ttaCQdGHM9yA8vfEQ34zOWd0HUc02ueap3On3
         /UW/EtFdz5baIMB1uZ/o4oFe23PqHx+raY0QY3rlCie8+8RCTTP+z2e2qZcc3jH0nhgu
         Gl/CKIlrJ5ovQdfpx+R4nbNNfkRoIf8bdYaUMFS2pUucSurWSb5ZcuA4Z3i/wagvyJtx
         EfI0fu5E73436jh7nBGiB07dk+pUxYsMwy4vzfHYFhf47mLVs7ifm0gO9LaZlz/Xlv8I
         ccVg==
X-Forwarded-Encrypted: i=1; AJvYcCWL7hH7k6gLTEZrX+PFdlsQHSGupNlApLkPuPdPFBptLkP/Rw80+BHqkZ+9Q5KtJroGuahxY0IIDxcg2cPN3E8g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+/NdNb8fkufdcU2wlWWgTOLQjaRNLghOiS2rEWikPQ6layx30
	y010TDfBlw0ChMccEF8NMJqzf76eh3O2BHe/XZZ0J3jlwb3OVIWG/NOh
X-Gm-Gg: ASbGncsKNdXIgMhWDvHA7Mtc7yJJ42CAt2XWIJKtYNXhDXz592wfjdGB+89JqQwcAcn
	Q3h6yUlHB2TmGXiBeEZCfaJMP3fXTX6A5jVnxfUKC7DS/wwyfQnK5XLVtKP8yC8bY9HdGguBXBr
	X71Rjh/rYZOIbtByGxbaP55UBr6W2fY8gTskpvN8jM489aPiDx7nK/eZdLlg0Oux2VS+tyxLdgi
	usk6r+BUlU9y1A0bohhvaJtYvrwL02rKUqTNi4iOqwr09U+u9GNMEFlo4KZwTpmjDnKazvuJWFR
	em99CcWkGYsyVvVE23KMEiFmrtB9ooXiSiTe26gS13c5ZU22dOXsto8sEOBxNd9GUPpeLa+usjC
	giMx/JKvUcdXOhzCLPTNTq/FiHNs3oA2k/MO57pRhC58BD4srQh7Tm58nxqLGHbzFcf9yPLjnuZ
	VRrk0moB19qtzgjHZjmI8AoTs/bs0w9z+QzVYtq4G/lm7X5gTkgjk4BpwK8CipAEB4eVhDGNKnt
	qoJQE9axoxD66AA
X-Google-Smtp-Source: AGHT+IEeiFh5JMgnQ8pShAVUYlCPwfqLImrWniLzd/dBupEr9CI1rxYrCJtKX41c/om1WIELKCCDCw==
X-Received: by 2002:a05:600c:1f8e:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-4792f23c727mr34378505e9.1.1764865638123;
        Thu, 04 Dec 2025 08:27:18 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d2226e7sm4044141f8f.27.2025.12.04.08.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:27:17 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: soc@lists.linux.dev, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5058772.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_082722_999825_A68BF2FF 
X-CRM114-Status: GOOD (  23.85  )
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

--nextPart5058772.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ARM: omap1: avoid symbol clashes in fiq handler
Date: Thu, 04 Dec 2025 17:27:16 +0100
Message-ID: <6216166.lOV4Wx5bFT@dell>
In-Reply-To: <20251204095355.1032786-1-arnd@kernel.org>
References: <20251204095355.1032786-1-arnd@kernel.org>
MIME-Version: 1.0

On Thursday, 4 December 2025 10:53:47 CET Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ams-delta-fiq-handler.S file has a number of symbols with fairly
> generic names, including one named 'exit' that causes a compiler warning
> in some configuration options:
> 
> vmlinux.o: error: exit() function name creates ambiguity with -ffunction-sections
> 
> Change all these symbols to use a .L prefix to make them local to
> the fiq handler.

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-omap1/ams-delta-fiq-handler.S | 38 ++++++++++-----------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/ams-delta-fiq-handler.S b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> index 35c2f9574dbd..5cf6fcca602c 100644
> --- a/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> +++ b/arch/arm/mach-omap1/ams-delta-fiq-handler.S
> @@ -97,7 +97,7 @@ ENTRY(qwerty_fiqin_start)
>  
>  	ldr r13, [r12, #IRQ_ITR_REG_OFFSET]	@ fetch interrupts status
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ none - spurious FIQ? exit
> +	beq .Lexit				@ none - spurious FIQ? exit
>  
>  	ldr r10, [r12, #IRQ_SIR_FIQ_REG_OFFSET]	@ get requested interrupt number
>  
> @@ -105,25 +105,25 @@ ENTRY(qwerty_fiqin_start)
>  	str r8, [r12, #IRQ_CONTROL_REG_OFFSET]
>  
>  	cmp r10, #(INT_GPIO_BANK1 - NR_IRQS_LEGACY)	@ is it GPIO interrupt?
> -	beq gpio				@ yes - process it
> +	beq .Lgpio				@ yes - process it
>  
>  	mov r8, #1
>  	orr r8, r11, r8, lsl r10		@ mask spurious interrupt
>  	str r8, [r12, #IRQ_MIR_REG_OFFSET]
> -exit:
> +.Lexit:
>  	subs	pc, lr, #4			@ return from FIQ
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
> -gpio:	@ GPIO bank interrupt handler
> +.Lgpio:	@ GPIO bank interrupt handler
>  	ldr r12, omap1510_gpio_base		@ set base pointer to GPIO bank
>  
>  	ldr r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ fetch GPIO interrupts mask
> -restart:
> +.Lrestart:
>  	ldr r13, [r12, #OMAP1510_GPIO_INT_STATUS]	@ fetch status bits
>  	bics r13, r13, r11			@ clear masked - any left?
> -	beq exit				@ no - spurious interrupt? exit
> +	beq .Lexit				@ no - spurious interrupt? exit
>  
>  	orr r11, r11, r13			@ mask all requested interrupts
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]
> @@ -131,7 +131,7 @@ restart:
>  	str r13, [r12, #OMAP1510_GPIO_INT_STATUS] @ ack all requested interrupts
>  
>  	ands r10, r13, #KEYBRD_CLK_MASK		@ extract keyboard status - set?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@
> @@ -145,10 +145,10 @@ restart:
>  
>  	ldr r10, [r9, #BUF_STATE]		@ fetch kbd interface state
>  	cmp r10, #0				@ are we expecting start bit?
> -	bne data				@ no - go to data processing
> +	bne .Ldata				@ no - go to data processing
>  
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ check start bit - detected?
> -	beq hksw				@ no - try next source
> +	beq .Lhksw				@ no - try next source
>  
>  	@ r8 contains KEYBRD_DATA_MASK, use it
>  	str r8, [r9, #BUF_STATE]		@ enter data processing state
> @@ -162,9 +162,9 @@ restart:
>  	mvn r11, #KEYBRD_CLK_MASK		@ prepare all except kbd mask
>  	str r11, [r12, #OMAP1510_GPIO_INT_MASK]	@ store into the mask register
>  
> -	b restart				@ restart
> +	b .Lrestart				@ restart
>  
> -data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
> +.Ldata:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  
>  	@ r8 still contains GPIO input bits
>  	ands r8, r8, #KEYBRD_DATA_MASK		@ is keyboard data line low?
> @@ -175,7 +175,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	mov r10, r10, lsl #1			@ shift mask left
>  	bics r10, r10, #0x800			@ have we got all the bits?
>  	strne r10, [r9, #BUF_MASK]		@ not yet - store the mask
> -	bne restart				@ and restart
> +	bne .Lrestart				@ and restart
>  
>  	@ r10 already contains 0, reuse it
>  	str r10, [r9, #BUF_STATE]		@ reset state to start
> @@ -189,7 +189,7 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	ldr r10, [r9, #BUF_KEYS_CNT]		@ get saved keystrokes count
>  	ldr r8, [r9, #BUF_BUF_LEN]		@ get buffer size
>  	cmp r10, r8				@ is buffer full?
> -	beq hksw				@ yes - key lost, next source
> +	beq .Lhksw				@ yes - key lost, next source
>  
>  	add r10, r10, #1			@ incremet keystrokes counter
>  	str r10, [r9, #BUF_KEYS_CNT]
> @@ -213,9 +213,9 @@ data:	ldr r10, [r9, #BUF_MASK]		@ fetch current input bit mask
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -hksw:	@Is hook switch interrupt requested?
> +.Lhksw:	@Is hook switch interrupt requested?
>  	tst r13, #HOOK_SWITCH_MASK 		@ is hook switch status bit set?
> -	beq mdm					@ no - try next source
> +	beq .Lmdm				@ no - try next source
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -230,9 +230,9 @@ hksw:	@Is hook switch interrupt requested?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -mdm:	@Is it a modem interrupt?
> +.Lmdm:	@Is it a modem interrupt?
>  	tst r13, #MODEM_IRQ_MASK 		@ is modem status bit set?
> -	beq irq					@ no - check for next interrupt
> +	beq .Lirq				@ no - check for next interrupt
>  
>  
>  	@@@@@@@@@@@@@@@@@@@@@@@@
> @@ -245,13 +245,13 @@ mdm:	@Is it a modem interrupt?
>  	@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> -irq:	@ Place deferred_fiq interrupt request
> +.Lirq:	@ Place deferred_fiq interrupt request
>  	ldr r12, deferred_fiq_ih_base		@ set pointer to IRQ handler
>  	mov r10, #DEFERRED_FIQ_MASK		@ set deferred_fiq bit
>  	str r10, [r12, #IRQ_ISR_REG_OFFSET] 	@ place it in the ISR register
>  
>  	ldr r12, omap1510_gpio_base		@ set pointer back to GPIO bank
> -	b restart				@ check for next GPIO interrupt
> +	b .Lrestart				@ check for next GPIO interrupt
>  	@@@@@@@@@@@@@@@@@@@@@@@@@@@
>  
>  
> 


--nextPart5058772.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxtmQACgkQ2WqSnlts
jBrMsQgAnOqLcgqd4VMzVjjHNYxPJsmd+I7OzdOytaNRJ0eqRFAYC36GAVqlkuqB
Dwwv+bh+cCPlES3ozAUr0WJ9fCgfA2Zvi1EHNdIJlyDwZOkpHKMm7BGN9drPBFST
XjUsixxJWQKQBUVFK4aASFoZ3cbrQ2KtOOHjqBQ1coaPw6cWZa8fbwWRDxLXGcDC
ISeJBjlLxHH5BJrUhlJ7iGw9LN1kDGleu/wal2gJfnuGZ6WVApDLujyDWhUsAV0M
IMf7x7yfyyCA9YoSNpZus4+w716T0/fKkVflh7TvqeQGqA1+FH8HRYguVYeRQkUQ
rnnTEfB6obbtIPimzaw1lvcrV9OvLw==
=X4/I
-----END PGP SIGNATURE-----

--nextPart5058772.31r3eYUQgx--




