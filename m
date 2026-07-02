Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9602BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3ft3tRLrMG0cJ7Kk5xBk+7i2ydkvs9V9CQnLPDB5ag=; b=uVc6eHZjEPz8expO1a78ap1v5F
	oZ/t0tFdgkg+x1R8+DMy5Xe783YyEcA5FUzmCbu+FjYCS99VsQo64bta5aTK/bv4w1tUjUTnvjYPD
	OfrHQYrCPDVxPOYb4WWzhNbYN7h06Wzt6LMec5cX4C6dzlwc6DucQDOQWo4gbtEq4iNYTY1D/l8OA
	VuOW1RyVXXJI76fYjOC7WGUMtKlmvUHHlslGi49gVC3eZGRtmgLBd9Ra8S7ZgUMimqcdYh70+pmWx
	+uISbem8foP0kxKCtvMA4E+CYA3fphPFm3VUjhTccVSWXfOj14m/xGbqzEatjaP42wXIvmtcPD20k
	gksb0Y2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTK-00000003yew-1JJH;
	Thu, 02 Jul 2026 09:12:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDTH-00000003yeB-3jei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 09:12:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4728c12ba97so993044f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 02:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782983554; cv=none;
        d=google.com; s=arc-20260327;
        b=OXoXKFGkB16+R1dSn3/ecrcCtai4CZ+rM8F1ricFJUm9Z5Q/GD+j9JQ5QyuwcYgRtL
         J4TvuCGcu+T2pmeZL7YbX/FimOs0Li2PI6Xkq1XQXUQ1hBDdv60fx5EnwoS67pJV4hP+
         qZ6tMkhazRKUzdQnJjxaqYxpYxeAQ2+CEQ1H5qfsHqvKffeeRRtesBxYZv3MQYlwYgFu
         G1HzzecsBmDSHJ5n0b+7Cm6wikFkCYVbTuJVLMFGMDJaZRP2TuOMx928QRHtPQlBV/2v
         eGuQ2idhGZvVQIctag3VPRPwtZv5yGMYFSXFHrI2QMZH4nDftUYs9jPLhozNPlj4Z4cr
         kHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T3ft3tRLrMG0cJ7Kk5xBk+7i2ydkvs9V9CQnLPDB5ag=;
        fh=Zh8UFKgo9xBGCvWBLTTxR6uUQlUGt7+mFvykk97J5Y8=;
        b=d9T6ZXicmmrHRCENnrviubZjol1yTjZ2m3oVXYBOz1bypCZ4Aa92/5xSIzW9t4Wwjc
         AQU8Hxnm6RsxKMEjoWbSdwjhisdE5IbUg3QNbRDKhZGVOYDCMq/iPpYyV3o29yXqv68D
         kvKLmZ/QfTKMiLXfKB9FLggaDu9xQE5XlZPbu6GZA+LrVHauOWaCXRMjn9MymkYyWd3o
         zs1AY3SYXbSP+BO8WhsBMDF5p++BzpVbzgAibSthFPLYXix8CCwdaByC+pL/oStyRh4r
         PsMTtr3ebNfyz5HMDrJgED9Z7bUHTrLS0oroouighmXYFM1NPqPE1aWauSotiSGJrqS1
         RLRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782983554; x=1783588354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3ft3tRLrMG0cJ7Kk5xBk+7i2ydkvs9V9CQnLPDB5ag=;
        b=skl2rYlY2p7Kzk8Y/IbbFZr6jzC4ZJwKDbXFAHqKojSHjx2vDHZ6A3wlwCMjWPGHhd
         rEXfLt9G7iyhQp1QTM4SCWEx0uiQjh6MrUoM4GMRbLzqY74Tak5AV04Lc6bvu+5wc931
         iBVMC+9b9+n4Tc3IyCEVOI13rdqoN/O9eZgC3b5KB/8mY/aapZCbeRH/xg+ipxhxvFDk
         9zKPwM4DeWDSCTXh9503kuC3V/CJpE+Pz7X3pMcY0W7klYrQlaCex/1YMownoPawS9rD
         dYEMZZchSNvyy7Q12umItDF5ZHyCh2A6LtbTOr3PH/NAVZ6C76lIJwXOlHkTEoUwng/q
         VKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983554; x=1783588354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T3ft3tRLrMG0cJ7Kk5xBk+7i2ydkvs9V9CQnLPDB5ag=;
        b=bt5ul+S1DKmmUx1KxVVsRytNt6FYZGffaMeoTX6OBCo1zA6vqmCehQBJZ8INdvEEsw
         gygr117BS0Qdz9lDb0MSwscshv++8grL2+i+KzZ2e0K0uHnS9qGrMcbpUFTlHDp2veBv
         kE5Wi84ZDIw8Q3PlcC/41NDCTmGTkETli5yAjYZav/EMS9p0n4BvejsiLkpqqJDFxmrS
         aIJs6NP5aHc+CbocOx+Wx0MmYJBBqo0GPrRWbPSD7cnjxARRCKPpGOSkQMuNX8L/8sCq
         Pzn1lEX8rzstxAcE2w/KovXoY4Zk41s0jqQ+FcNuFNecZyDAq65z2GuFsUCbt/C/QMMt
         HcCg==
X-Forwarded-Encrypted: i=1; AHgh+RqFSfdQWbDjREd6mQ34jQ9676aQ12xTpAquOmyvEyE+e+5L+ftwkrnipxr4Co0Obszr9MdTvW1wKvMcA2jpbMDV@lists.infradead.org
X-Gm-Message-State: AOJu0YxgKXIQgVCjC44rz6Vih7+UXS6Wjn8oSDDEEPxziOXPXtIijuqF
	YKM0+i1BppTtty8G2odxti0ApAByLZTdDaMFKhPO8iZ7Fph4sQurX6RMiRBfFul2ooFIzHu/DY6
	sP9A1phr0T/r8weiF3hfNSreT7DokDzs=
X-Gm-Gg: AfdE7cl4NMa3IpqIkIfgsU6hVq4M85QvnnWHUD4NiqzNLKUXQuQoGi1OrNflMcwSKsi
	wUOpsUKBEf/9HOB7Z2ZV9nf+HbJs5ldm28Rgy/5HQdM8+xcZ2nRgQX9bGyO+rASnjVgoxIGHx+q
	2yMoVd37rwnSezqWBg4eluHxQqLEyUqdtHFUAAQa/HMjF1YR5M2RUCiuS36Pv/sq+WIuPgu2/kM
	i3jC0M1GNQ3hRVutPvlO0n6JJVe8Hh06Pcu71lksNUVDGtp2pfkvTM0L1d0hbZwa8prkSzGYQ==
X-Received: by 2002:a5d:5e82:0:b0:477:6874:5415 with SMTP id
 ffacd0b85a97d-47768745749mr7737422f8f.26.1782983553952; Thu, 02 Jul 2026
 02:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260624195704.5c29c0353163babb721585ca@linux-foundation.org>
 <CAHKocdHJ-JB5jjXG3_-syz4P8k1C=jWrGaFxwnTjcinpGyR_BA@mail.gmail.com> <akYplZcaLXIl7AsP@pc636>
In-Reply-To: <akYplZcaLXIl7AsP@pc636>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 2 Jul 2026 17:12:21 +0800
X-Gm-Features: AVVi8CcJp1pyatOcbL53Miz31Xo_N5fLyvuzJxEDo42UZVGDzWrZofDOAf6INJY
Message-ID: <CAHKocdFk+GmvCSYaQ66t_NmvzckzxzzsNXx7X9M+UB2ato25mA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, baohua@kernel.org, Xueyuan.chen21@gmail.com, 
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	jiangwen6@xiaomi.com, shanghaoqiang@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_021235_996808_A7F9B890 
X-CRM114-Status: GOOD (  30.65  )
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

On Thu, 2 Jul 2026 at 17:04, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, Jul 02, 2026 at 02:35:24PM +0800, Wen Jiang wrote:
> > On Thu, 25 Jun 2026 at 10:57, Andrew Morton <akpm@linux-foundation.org>=
 wrote:
> > >
> > > On Thu, 18 Jun 2026 16:47:20 +0800 Wen Jiang <jiangwenxiaomi@gmail.co=
m> wrote:
> > >
> > > > This patchset accelerates ioremap, vmalloc, and vmap when the memor=
y
> > > > is physically fully or partially contiguous. Two techniques are use=
d:
> > >
> > > Thanks.
> > >
> > > > 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memo=
ry
> > > >    segments
> > > > 2. Use batched mappings wherever possible in both vmalloc and ARM64
> > > >    layers
> > > >
> > > > Besides accelerating the mapping path, this also enables large
> > > > mappings (PMD and cont-PTE) for vmap, which are currently not
> > > > supported.
> > > >
> > > > Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multip=
le
> > > > CONT-PTE regions instead of just one.
> > > >
> > > > Patch 3 extracts a common helper vmap_set_ptes() that consolidates =
PTE
> > > > mapping logic between the ioremap and vmalloc/vmap paths, handling =
both
> > > > CONT_PTE and regular PTE mappings. This prepares for the next patch=
.
> > > >
> > > > Patch 4 extends the page table walk path to support page shifts oth=
er
> > > > than PAGE_SHIFT and eliminates the page table rewalk for huge vmall=
oc
> > > > mappings. The function is renamed from vmap_small_pages_range_noflu=
sh()
> > > > to vmap_pages_range_noflush_walk().
> > > >
> > > > Patches 5-6 add huge vmap support for contiguous pages, including
> > > > support for non-compound pages with pfn alignment verification.
> > > >
> > > > On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core =
and
> > > > the performance CPUfreq policy enabled, benchmark results:
> > > >
> > > > * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> > > > * vmalloc(1 MB) mapping time (excluding allocation) with
> > > >   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> > > > * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
> > >
> > > Nice.
> > >
> > > > Many thanks to Xueyuan Chen for his testing efforts on RK3588 board=
s.
> > >
> > > Indeed.
> > >
> > > I see Dev had a good look at v3 - hopefully he (and Ulad) (and more A=
RM
> > > folks) have time to go through this.
> > >
> > > Is there any effect on anything other than arm64?  I'm wondering how
> > > much testing these changes will really get in mm.git and linux-next.
> > >
> > > How is our selftests coverage of these changes?  Is there some existi=
ng
> > > selftest which will exercise these new features?
> > >
> >
> > Hi Andrew,
> >
> > I ran all test_vmalloc subtests (run_test_mask=3D0xff) on both ARM64 an=
d
> > x86_64, comparing base (v7.0.10) against the patched kernel.
> >
> > All test_vmalloc subtests passed on both platforms. I do not see any
> > functional or performance regression. The small differences below look
> > like measurement noise.
> >
> > ARM64 (Radxa ROCK 5B+, RK3588, pinned to CPU 0, performance governor,
> > 5 runs averaged):
> >
> I think there are still comments to this series. One from me about
> naming and there is one more from Jain here: [PATCH v4 6/6] mm/vmalloc: a=
lign vm_area so vmap() can batch mappings
>
> Could you please have a look?

Hi Uladzislau,

Thanks for the reminder. I=E2=80=99ve already gone through all the review
comments, but haven=E2=80=99t had time to reply yet. All the feedback will =
be
addressed in the v5 version.

Thanks.
>
> --
> Uladzislau Rezki

