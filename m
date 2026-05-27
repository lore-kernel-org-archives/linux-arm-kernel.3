Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4E1CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jh4B5AC2q6XDT+EhwYr9A0M1dYuh/w8VgN+zze6pNI=; b=TlBZ8GaF/nzzr5fmnmWTC+O+CN
	mBAjGmpPTrO/lugJPCSf7LNLU+1jIzHYfg49TvgSOeZaiU8pWMGTjwbiVWCfTCBMXK4RIcPTaVCeV
	/+0rJVAuHQgwDDrHFziXHo8PBmDs7ZD3xTp480adUBh3cbPSSw00obQx5oD34Ri77prRxLBYek6Fv
	F6yB9wYZz3n45w9lYx++cKyAQSgLbZ2/Q9nFdD8A5EkWkkwwH/W6USdU0PAgMH+x0qaxY5TpUZtvS
	jm5qRDPh8uIMsOg4XSlXhkOy/57B7O+JzyvrX+5h9Bi+N4HvxLpi5qeL2RlfwIM6mplV0aAgxc4A5
	+idXe4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAhl-00000003etP-0T4C;
	Wed, 27 May 2026 09:37:37 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAhi-00000003et4-3iw3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:37:36 +0000
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-90fbf21d9d3so1741677985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 02:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874653; x=1780479453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jh4B5AC2q6XDT+EhwYr9A0M1dYuh/w8VgN+zze6pNI=;
        b=YgoR6cQHswPox8HWKzIvZzUbWrnJ5vDWrdJHgbNbfQrUBIKIXxrw4ppYdfribYmpiK
         lm0/NpW523OvqNT7LaBiwxWw0fqZFodhaTsNEOTU2KJSzesxbQzMv/MeH5+RSp6n9Mqj
         PXJcRIO7yyCHaTmaRHzhXfQSLmOkyLQPEX0F730cBXkupG5A19tAAerVF0Ym8PJRicw0
         oK1anv3KrVZFFlKH5h5cwVYiP/Ll4o6mQmGRjvq1g1fpf4vaPijKSL0hRqESr7gd7mkT
         PngAuXNyUA88nDfxp0nsOXH7Zm9BcL2BbSEotD97S3hdEasaYqKCWGRTs34ZdCmBg/Zy
         DUuA==
X-Gm-Message-State: AOJu0YwnpTksatA/BNS+nT6+pHGynE9OJjSIyQKzYVb/utPVGeSAcP7H
	CLfzt1/0xgwxU5yDzx7pijBV6QXAhmr0cB57EgODVBpA4kTDLugqDCbbEUI9s1xRKzE=
X-Gm-Gg: Acq92OEUyRtJ5if3zO8W0pWzH3OtJU3yLX1i1SoLT+7IF9HziOruruEsDwZOMMhTaMI
	Zfr4mFCjT74rCWXJPP0Pl3j7SXmWLvwFPa5y2w5fU0zbd8/IeVhaz+pfiIlS3EBzA122vkOE7IF
	imrSm7N4d6UWFMez/5BLMSPSouSrRwYXLAbY8t5AF/I4X5kFnO05qYH6Ck4chNk72StiVUFUUwy
	hPpmxyKRxK+qejJjMCG5zyIj3FhP7UHWB+6LUHdaNLSXI+w7GhhaSOxAfZQqXivDkNQkuRO1Mwb
	3cLOBKJ0RfiTs9P5dd3yt6lC2UbccszRaVXs+Vvlk2BOkdzGbZLALmk7LVufGi9C0xJcGXzF1jh
	/7E+9+mxuZ55+bBbax0oUHcWAPprKGY9ff8pMG+QGI1PeV9vXYxTZxg0isXnXxeRCFzRdKSPE1i
	UWmx8FS+lH7SqiLQqK17iD1z2kywNXJfbcaKH1G02jk2XzCC9+EfRjOHZyQ6iM
X-Received: by 2002:a05:620a:468a:b0:912:671b:d09b with SMTP id af79cd13be357-914b48f7442mr3150440485a.24.1779874652972;
        Wed, 27 May 2026 02:37:32 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86ff80esm433390885a.13.2026.05.27.02.37.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:37:32 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cc9f97a124so43561856d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 02:37:32 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:633:75d3:3545 with SMTP id
 ada2fe7eead31-67c84ad8af0mr10485506137.30.1779874287601; Wed, 27 May 2026
 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com> <20260526175846.2694125-30-ardb+git@google.com>
In-Reply-To: <20260526175846.2694125-30-ardb+git@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:31:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBcpw8NTg+EVBmwiRWY1001EN94J9XstHG9o_hyUg8yA@mail.gmail.com>
X-Gm-Features: AVHnY4LA7PW8Q0XMk7lUiX1q-1VC5_AKr651tENC3X6CCFiZsD9Tq-B3NK3PBjs
Message-ID: <CAMuHMdWBcpw8NTg+EVBmwiRWY1001EN94J9XstHG9o_hyUg8yA@mail.gmail.com>
Subject: Re: [PATCH v6 13/15] sh: cast away constness from the zero page when
 flushing it from the cache
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_023734_933528_B5D7AE9D 
X-CRM114-Status: GOOD (  21.88  )
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

On Tue, 26 May 2026 at 20:05, Ard Biesheuvel <ardb+git@google.com> wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> SH performs cache maintenance on the zero page during boot, presumably
> to ensure that any clearing of BSS that has occurred at startup is
> visible to other CPUs and DMA devices.
>
> The __flush_wback_region() function takes a void* argument, which is
> conceptually sound, but given that empty_zero_page[] must never be
> modified, it is being repainted as const, making it incompatible with a
> void* formal parameter.
>
> Given the above, and the fact that __flush_wback_region() is in fact a
> function pointer variable with multiple implementations, take the easy
> way out, and cast away the constness in this particular invocation.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

