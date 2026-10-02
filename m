Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3F3CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTC1rS+ncvu1o7dJheAFSjoXB0ahDudA6M6fvIrc0B4=; b=DAajnEkXm/24EsCOcUxfYnr4M/
	ihMZ3hR52i8MrAglFi1CDwHVc2eVBQYHP9TihB78Dh21QuBWXQb5Ukp3Oj9JSp8KJWb+LI+50Kf+d
	7NK5qilXlz1WA6tkrkP8UZ2wo5PMEONkF3tICs4gUlAUnmQkzfAcVrUvWLKjSmmFh30JeLZoaXfr7
	V8KAhqmNz4ndnNQ79gzbijJ7wHF+H3RZpSLk8JQI7d7tIjhXN4DBz2cXQUCJGwofgHI+eNAxhOsPs
	3vswRcVjK9/sEQikD0rIDK7BwiWFqpc3YjSwEh0+AvMPEXdROW/aW6xxklX/OqAdlVqK1ZCPfkdNy
	VID+v7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf7x-0000000Bub3-3rFg;
	Fri, 02 Oct 2026 15:24:49 +0000
Received: from out-241.mta1.migadu.com ([95.215.58.241] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf7u-0000000BuaK-2Wqw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:24:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hYyvJwonwfCGOBqxkCTnI3TF2uBM9Q39BNu7gbnNaxg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790954684; v=1; x=1791559484;
 b=oh5Su32LWkDXSDxNOhOyggCT/bTLugpXxcWRcSRiiBUBWZka0iLsMMC30k2LjyCzrQK5VIAI
 zsHM+EzUHpS4AMW3vF3ignMO/EmilOqB0AMnG92L0tKI8qR7BvV1MkBd7t4N+cS8Y7ulEw7dd94
 zkQZj0bHarRhCtKxedJpkPKI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7a4ec9ea5a154b5c;
	Fri, 02 Oct 2026 15:24:44 +0000
X-Mizu-Trace-ID: 7a4ec9ea5a154b5c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7228e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 08:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1MNjxNSUYgSFb21QkrxIn5oXSLnhb5kGRMt0YOUt26v1bfDzYK34oGrGSs4RU7yRsqL3fjVr/bjDEKrbLoyob@lists.infradead.org
X-Gm-Message-State: AFq9FYKVXbHca2IZou7iOXyNeQrRSds5HbX8FKfv22dg4aBUc+9EjhuW
	ltuI4YTSdPiVrDnFfKFI/8D8Ps2V/x/ribNfsFmKvoMB9sUwsFXa1AhAssjEUoXEcK0bl1uVoau
	adSk28KzRD8nA8IzpS+nBbFgtWemR1gDJ4vCa9Bjj
X-Received: by 2002:a05:6512:3b26:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5bb7c91a8a0mr181872e87.2.1790954682993; Fri, 02 Oct 2026
 08:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck> <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck> <ar_E5HUSTxMSRZhL@arm.com>
In-Reply-To: <ar_E5HUSTxMSRZhL@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 2 Oct 2026 16:24:06 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
X-Gm-Features: AclHuK8y7NoaOBtAtTR_MzPpGP3lTRFskNsPTGCg5jv7b0-WVHrMhud2cJRGSNA
Message-ID: <CA+EHjTzemfoX9e8Ppw+AcuUpNND_CipLCUM9xgid1eYXmV=jzg@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082447_745636_7EFF7259 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, Oct 02, 2026 at 03:51:16PM +0100, Catalin Marinas wrote:
> I couldn't figure out the #8 either. I wonder whether it's more readable
> as (untested):
>
>     sub    x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>     cmp    x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
>     b.hs    .Lskip_pmuv3p9_\@    // Skip unless V3P9 <= PMUVer < IMP_DEF

This looks correct to me.

That said, if readability is the goal, I think the plainest is two
compares and two branches. It's one more instruction, but this runs
once at boot:

      cmp     x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
      b.eq    .Lskip_pmuv3p9_\@
      cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
      b.lt    .Lskip_pmuv3p9_\@

I used ccmp to match __init_el2_debug in the same file, which does the
same NI/IMP_DEF check with a raw #4, as does reset_pmuserenr_el0 in
assembler.h (and hyp-entry.S uses the same pattern for HVC64/HVC32).

Cheers,
/fuad

