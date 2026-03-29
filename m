Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A360FC97F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PPpHwpK+XhWFnGV+Za6xJpLzu8J3tufoqK8mJt5f1M=; b=pYxXgJAmIwaWXZYleoPVy0MDM9
	XVneuXTDCfpOfej9++0ecVwuaRQQXGVyG0ATF/sVq5JSXWIfEWy3hclsKRazsx9Slslp/HLWkk+vz
	b8fLmNCsCTZBwWx0nZQjqcNW6G2yTD/hlK3EAlInUuyzMMmQzUx2eYMMUyn6s9r7cYmCo/p5av5Ax
	9wIx4slf2CrNXS+9T7QQrdHx7bTkwgNMdM/NfgTPL7fMQjTlSGRsJ5xU+H2qlKQ4ZpGgyqUvuuSt6
	65WIjhKa2qxtazh7G9dpI2ZnfiDS1pRmp3ZvyNuUvTUfPGm/72pdoDZAaYJHH/6JAgmCNNNh+WpaN
	8mcwpXFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6y86-0000000AMVV-4BR1;
	Sun, 29 Mar 2026 21:57:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6y84-0000000AMV4-1iTQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 21:57:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43cf73bbfbdso526636f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 14:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774821426; x=1775426226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PPpHwpK+XhWFnGV+Za6xJpLzu8J3tufoqK8mJt5f1M=;
        b=VODJuzzGl7H+032K1DlvckgoqGOiX5+c4grJWTWasCRRFpWHjMySVzjkjwm8Q80/86
         OmpNqNhi4JGW8OyKWIc3uNg+3kkiMgaNskM06uMvZaCsecfrIIi4odwDKLhlLwfPWUo5
         oWAlqhZORqi589jiFBYH1otkyVP1zrRAxJWB4mhTZ6+mTO0G1S2YpN6L0371joG+JRjO
         RGV9jS++0VCdCxAHk6cpC1QWFSqPGwz46F2Ot6m2x36eqWPKV0G5q15lVaXoVpghDQVP
         rhSKhnfkY188BB9JYeVafG4DuJfPNmP29RPIgfL5A3KGQsqhr57cw9mcsWSWTRSaVDzs
         gs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774821426; x=1775426226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PPpHwpK+XhWFnGV+Za6xJpLzu8J3tufoqK8mJt5f1M=;
        b=lFT4XJ/QSIJc/PKa7NeLX3vvZV1HudVpL0Lqs5jDVhPtXLh0tg4FxXpLot0WuJtve+
         R3M5acT2cEOV+zYX7dt394WNn5W15PildatKRqFnHLfWYAe3/Aei97BbiFyordiD8bpQ
         o/pBfYFcmCzazenB1+Q6jaAZM3S8eDjEOlK9A6g/A+ASHcrMXLUxtrOBo14QdD5E+PO9
         JvbgHaH/Q1+0IFmG1zlaaihcc0tr+C4mn5QpTZ87yFJPcQDXtQgby+k8x5Z/aw6CyqEr
         F103C7hG2iLaHPMey0H4i6wfo7lxubrCU1PcdWWys5gcTalrlMtKT26gsgktCEtdfR92
         7VWw==
X-Forwarded-Encrypted: i=1; AJvYcCVMZBhttuow7a8ytTSGkWTpRBzUy7jWZMCppzahtWPZHjDWiFi4OKpHD+SU3HRyVIsIw08M2lE5rBenO+FZA3rp@lists.infradead.org
X-Gm-Message-State: AOJu0YwSukKVyp7gwdby5mDwMbv7Gk3nCuqOv+zC/fnXvAGBkxpI2+8z
	k8c52bQ61hpdjW9NTAFoMxx/IIel1Q2Cslu8z0iVeJkbQ30L/64U+uRIMq9WDIU6
X-Gm-Gg: ATEYQzzcJS01S40bwk+TRC0BdBS2p7FigVZaEQy2GmF4kIGCBX2xZCG+H9Zue40SbNA
	Zj4ks0Z4y8yiPOcHvXpeN4KCh5OMulhh4QuNfF+x3U1oLdiyr2vGi6imblG+QLiavD4afMgKzzd
	z4y2iNWmSy5NgGcMPGQiiBTCHZHJggHoGfbvzffOzVwuCREKPEorOB/2s1AjC+X3SVGVPwrE9T6
	V+eEDosnQTtwfqLjEWAHHUmsDmZX3/C9Q0Bklsh15b2vVshPgd336tOT5eBR/vaa/jGDhk+zXNH
	PTs88w8f5EeCca9asvWQDPDHjofStOE5vxorzXuzfa8c7IINoYgDZYYUrEeR9q4eDn44dw123J3
	85AUBXQvTM3hln2MK4QR/XYB8mVPBvcVn9K4OH/scJvS4Liu+pDDC/rK1D2KBEwRxZ/4LEtIaNV
	A82EheDgm/6wH3hKMcqpnN4IdP9Ce1MPU4wDkMeJIk2IqYDEwEKvaHzCa8uApIFWVW
X-Received: by 2002:a05:6000:400f:b0:43c:fdd9:188f with SMTP id ffacd0b85a97d-43cfdd919d1mr3533554f8f.23.1774821425608;
        Sun, 29 Mar 2026 14:57:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e3602sm14596947f8f.4.2026.03.29.14.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:57:05 -0700 (PDT)
Date: Sun, 29 Mar 2026 22:57:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ardb@kernel.org
Subject: Re: [PATCH v3] lib/crc: arm64: add NEON accelerated CRC64-NVMe
 implementation
Message-ID: <20260329225704.0eb82966@pumpkin>
In-Reply-To: <20260329203829.GA2746@quark>
References: <20260317065425.2684093-1-demyansh@gmail.com>
	<20260329074338.1053550-1-demyansh@gmail.com>
	<20260329203829.GA2746@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_145708_501547_743D14D0 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, 29 Mar 2026 13:38:29 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Sun, Mar 29, 2026 at 07:43:38AM +0000, Demian Shulhan wrote:
> > Implement an optimized CRC64 (NVMe) algorithm for ARM64 using NEON
> > Polynomial Multiply Long (PMULL) instructions. The generic shift-and-XOR
> > software implementation is slow, which creates a bottleneck in NVMe and
> > other storage subsystems.
> > 
> > The acceleration is implemented using C intrinsics (<arm_neon.h>) rather
> > than raw assembly for better readability and maintainability.
> > 
> > Key highlights of this implementation:
> > - Uses 4KB chunking inside scoped_ksimd() to avoid preemption latency
> >   spikes on large buffers.
> > - Pre-calculates and loads fold constants via vld1q_u64() to minimize
> >   register spilling.
> > - Benchmarks show the break-even point against the generic implementation
> >   is around 128 bytes. The PMULL path is enabled only for len >= 128.

Final thought:
Is that allowing for the cost of kernel_fpu_begin()? - which I think only
affects the first call.
And the cost of the data-cache misses for the lookup table reads? - again
worse for the first call.

	David

> > 
> > Performance results (kunit crc_benchmark on Cortex-A72):
> > - Generic (len=4096): ~268 MB/s
> > - PMULL (len=4096): ~1556 MB/s (nearly 6x improvement)
> > 
> > Signed-off-by: Demian Shulhan <demyansh@gmail.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next
> 
> Thanks!
> 
> - Eric
> 


