Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81D4C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 06:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=; b=ZJt5OiBf7epdaFt6J1izwqy+9K
	fhoEy05FjTy7T6mv8f0jEbyD6flJAhEps4lCuOcnjQ5ky8uXnupAbQiQESDqwq7j5BzEOISAWPlSO
	KS2WiJw0hzXRroDAhD2UD2mFX/UbadrcuHi86RkioH444HTNAYTA6ScIqfODqoiTvfdQvmBa3g9/B
	qNGGxOZQV88e0qi+PtE7fXVDuG6wD4ginXpfs3Cm5kxLgQm2wtUosc85KbXchtheQwyQ5ZPwLJiia
	MAfe1RCbUx910onGfqyDC/QQ/crwl2OwZO2Q0aCHFIHksEwLYLIropk41k084DKtUvayyXesKJeZu
	jEgVbjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDEi-00000007Old-1xeN;
	Tue, 18 Aug 2026 06:23:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDEg-00000007Ol2-3VkF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 06:23:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso1005768a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 23:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787034225; cv=none;
        d=google.com; s=arc-20260327;
        b=QgA8HWCXQc/E5OYqLgxC+4kkvnzKAPYP/58eQZL4yYEL7SAQilbATOU5Mo2r6rbFmb
         aChzv7V0k/4LQ695yce6Jiw/5wxJcYifQer9SrSzd+97a2HDCbFf6EMMKbHM4yDVt4Ot
         dpvZyU1erjpAhTyiP4acS/Yl8ndP8u2q0kJi58PitgsuzYJF7EXSv7NEh+y9ey4iuhYN
         ElUQ8LfcUkZpk6op4vdYOl0Po1b6/jInjYoGdHwhYFC9zS4YjEagkAnI4g5qGKktubs6
         xWFL2IcKQhoKzgbcrM9FQhgUl2FqnIePwmJSy8OXWuAT406Y7tjWKhnxNYT8NE1Zv58Q
         hrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        fh=HBBFqbAstfl5aJvWnGtO+DMJ13+ijRRO2Gb0XFv3rb4=;
        b=D1GJPcHf9n7RFLnZwFz+GwAIdvt3IwxLk1whE8aGvbTG9PGwE6Hi9jHWLdSrLW2I9G
         8BL7fkFOS3KPcIp3XdbqKpL1xE7h3I+RKeT40lIBN7GsJWjAJLUoijfBCcP1R5IvxIJR
         PoMlBqZLm6T3FhFtnFbDL3J1vip9ED/2oR0hIeL/mB95Hr+/4tbkatf2puq+asmx9vMM
         u2oqfeLVPwUN5BAN9M7osuRxlSHYH5gF45gr+36wm9xl2mxaw7FP88MaCxi8yzCpYbnk
         eVfd6bZIG/LaEL+NdVtyPciZkmZJBzekNOhjTYBk9d2/9qkjnCCssVxa4LqCPGf6mXOF
         hCUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034225; x=1787639025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        b=pqp699Hj3heJUX6l4KDdVQUDeg3+A396bU+4AeD7Z3TepVM+6vP7Ct/YBBbo5os7yn
         2tFuyFlcY5yZxRwUwZ+UUlD5feOW3CY8jlWeFePhvf4q/O9tiqxA/tgWPfKIwkEKFQLR
         jlXw7baYRff2qX/NR51SKT4tSqt+nZNuwFiSqc3RRR7mHriSFVLVjQQNdSZlz4GJ1HR8
         KYaEDbSut86zihmoMlN3uIRXYwI/imayD3UKPUU0O2KtyviPlhuhxp/x8qY3LBjtRQYi
         BN0EpGmepbcK/NjLyhgVyyv+zeFbr5T15csc2lBwANbf0FJZa02CER3cKcyAllyOEaYE
         La1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034225; x=1787639025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYviVjsYfQntXFFeGvZpEVL58y1K7JWJvPcF4zznEXU=;
        b=Q4DhpRbpAuTnc8dz6wRuNq/IPuEDdUqseMCDM2HA0P0cT8EPGWqXeD9RqPo0nyPofn
         aidkKMT7U3VjzXspn0G0RVJ6uBIiTaeRVjXwliRW2gUyUijAKMkwB36vBmHfB8hzKTw+
         AyqJtawS1V/ydkIW5E1ydZcxrPSmLkwdaI1nlvcqt9SeLefFXK1z3eFmIztLcJLa5MYD
         ps0IB73Tt8IRON8MOcs7fLvM8aXZGpDqbOW1LIYApEaNjzP8UBDAkyMonZ/z0aHODdqD
         WA/udKdeFharS/N88ErhjTaIUNGkqNQk7l7AG+WGt+CNLENr9PUaiWLlb077uKOUpTz9
         THvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5s2z2g4rb2rCLTrnTYcgy7RKkz2LUand8TqeVB/D7OzqLTDQ0g0REM5Vxj5YtjKcSse4BMPpJy2EFN/BSk2Rt@lists.infradead.org
X-Gm-Message-State: AOJu0YzSTW85HKqCDdr6yOLVO2xanHDMocOkHDfZs2ekGWENOXqs6sQd
	Hk0/E+8mnrzSXb04deDxs5yly/aMWF+juDFtT38i+2zWb2CL+VY5W6cTolsswQvcWOiAXpOhw4Y
	2mB+k836KiW9dNDCDpLLou8+O0yE+u2I=
X-Gm-Gg: AR+sD10udYZDncAmp9+Lrkye4IDUXOXflk2rpn58Sx9N071kHt/PuWjU2g6Ghniw2uL
	5WrbHNGf13NEIEuiBLDtT+XXg8UD/Sqg/DRKu3zSNxlxWtMjrldCmAeYPL+9JrXTFitGxhXqhkV
	Jj1b5qUVczzg1j3KMrqVHyBA1YLduV/oEYE2uRNVuZKwLtt+hmgw1tGWmkbpBXB8UJm9K41Uuup
	Rq88ZHHthlD6683LkvC3qkhl0W9tQo10TC78dY3fFTmvSgmg/RxOiXFnSOXXXgYxXKj8p3r2Yhs
	lnvmwNk08b0CxJuIsYjYh2wmjslmV2ABX9ve8FzXtXgFzNUSRDotYDSEdHgcmobO1Z+ZHSWO0e0
	KT/BfQ8khSra3ayOpIHuh5CUeSqGTxhkCbkAg2nae
X-Received: by 2002:a05:6402:5d1:b0:6a1:f95b:8cff with SMTP id
 4fb4d7f45d1cf-6a3e0fcc3aamr3228499a12.1.1787034224858; Mon, 17 Aug 2026
 23:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com> <20260817161756.5fd2185a@kernel.org>
In-Reply-To: <20260817161756.5fd2185a@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Tue, 18 Aug 2026 08:23:33 +0200
X-Gm-Features: AcwNN1VY43fpVsyllKSRAZ5AdHgJn9CS_GzFXYhOAY4pGHpCjZSi42ezqsoQDyw
Message-ID: <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_232346_897839_A595807E 
X-CRM114-Status: GOOD (  17.42  )
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

Hi Kuba,

You may be right that the underlying issue is the SWIOTLB/bounce path on
EN7581 rather than DMA_BIDIRECTIONAL being wrong in general. W1700K does
show SWIOTLB enabled at boot.

v8 does not switch to coherent DMA; it only rounds up mailbox payload
allocations (dma_get_cache_alignment() in v9) and maps the same rounded
length with DMA_BIDIRECTIONAL, while the mailbox length register still
uses the original payload size. On this board, mapping only the payload
size regresses probe back to 0.0 even with the larger allocation, so the
rounded map length seems required here.

I have not bisected whether that avoids SWIOTLB entirely or just makes
the bounce/sync path behave. I agree a platform fix would be better if
the bounce implementation is broken. For now this restores NPU probe on
W1700K after 6f884eb.

I'm happy to gather more data (dma mapping debug, swiotlb usage, etc.) if
that helps track the root cause.

Thanks,
Daniel

wt., 18 sie 2026 o 01:17 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Mon, 17 Aug 2026 11:06:01 +0200 Daniel Pawlik wrote:
> > On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
> > DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
> > successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
> > 0.1111.
> >
> > Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
> > ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
> > the original payload length into the mailbox length register.
> >
> > Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
> > 6.18.44, including two cold reboots and sustained WiFi use.
>
> To me the fact that this patch helps only proves that the swiotlb
> implementation on this platform is wonky, no?
> IOW AFAIU we are avoiding the bounce buffer so things work, but
> the bounce buffer is still broken?



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

