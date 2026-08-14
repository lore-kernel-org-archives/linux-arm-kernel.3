Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=; b=iR6oIPCKyMmW0a2SPqAyCqt59k
	I3g4Dp1srTHLoC+uohDhGemC9B6tPOfmy9sRjtLk5LOqbcQRGbzPrmAS3GhjjAL78N2AjrRxqWkqP
	7ic8i91rUiyF/4GLwrR6b6XJ8AaQ6ikRc+YTnads7CoN6Hm0na+wQu4Ba8dz12AF5bspH2SCUnXZO
	xRJ/GeQ0/bptxd365YQwkTX5UTIMtBe+OwfZkOLPGlNq8KbAwP5WZULHn9lwFVOytt5palLQe7s5R
	IJcLhHcbbrtj6+Drq+xvM3IsQWzzyRzxsNBqBCyeUON4vvU9F6TPjALmzR9YdQw/Bsc08XPb77Iy/
	ykCPd04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunYF-00000002JNo-0HmJ;
	Fri, 14 Aug 2026 08:46:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunY8-00000002JLn-2M5l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:46:01 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c2020421077so138077366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 01:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786697158; cv=none;
        d=google.com; s=arc-20260327;
        b=Ym+hKqEA1xFtvlSGq+V1/1vecNvLgGc2YyMX+ey2K/nt8FHOdcZvrMjtb+SRRle7CP
         cXGkyJrtlgoXjZUQRPwGEyocDmLx16U48iTQhHqA2V582y6u63b7bgUnTPsQ1GwURMNX
         AynqG187Ek+PnZtpa7MrjxayJRmZoZdQKgosLk3HGlGGarawYL3UfAZBhS+InJNJ89F4
         LJCWnpUfTW8LUDCPWAB0XZcXBlxa3K5ljI+TDIknPUQq0l23LKmlqfZq5MXzhdC4VIYE
         QgXOKPLYLjI93vA39PQHIiIYYNuuIJd5ibzb4lnbPAFpU5yXTxmTEK406BmWeQxNQbM0
         qJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        fh=xbYdcbFuoSKOLfTkIedpm+nJf0duWNq+G89cLkU6Jfg=;
        b=kGCOwryWW1g4FveNw4WTjwPk9nHJQdI7NKtsToo3v14qXKgBPiFtsERw+V97/FCqG/
         tbZ3jkdV6FBUOWVrTnY/VVXv1yeg3KrDJ6L/K7qgqBBBztWtaVId5tTXNK8Bpo/jFbmU
         yJehT8vKOvGhKqgvdnqiUj6cSbpVuIvBIvYB9l6MUEbDzyMV/sQMpLf41OXwlHY2Rvua
         R/n8vIsK52HK95P8cRZy7WAhkrubfBqdP14AN9tWAU2Vf3+Q6OnnxEBftTyvSjWPiOpO
         vxTWMIw+E2MTlvjm7RTLyaVEpY0W0ZzVQBH/JQss/gcXMykZ2+991p5s+sVQDy/Uxh4F
         JHAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786697158; x=1787301958; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        b=B/4/YNJc2ljBvDWOvr+Wxf9ec1hh+9G0gwUKC4eMKUsgFQhXkJGrsnjPUytGkG0r7x
         a29rda/l7earguA5pC/esNEdVp1qbKNjmwGQrb7iGGXDEY+MCIYQUacZ4N65vQYJQK1r
         uJQixZ+xHPQ6+SwgwRX/LPHUTS1G+tNXagLv2CWc+Q19a/12coFJT64D9nx7SexXL+C2
         vKY9tVUgsOagHDr9M7/K9DifnU2i+5mKmd/ncBvVghU4CCtYOTiQ5POrjPHOKa89sDVV
         O27dsN9Oc3zbvvY32mJRvwtzbPdZSyKMgnXo0+A4S2qe21wCba7uqJmwR6/uKqBxLW1j
         qW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697158; x=1787301958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctpNRt4aHSt0ZiBATXpNUnAiZyBx5JbaM34XCPkr8lI=;
        b=GOjX0j60BMynGYRLeoWcp02E9uI0Rh6664v2KHAgh7qG66vFsd+zijCRE5wrJDoxhJ
         bzU9ydJgC7WFOuvO7UqGPKYy3QzweAqMz41qHtjcXMzaBzFkxhAdpRPCrEJVsujN0PG8
         Fr+xaTE29NPl2v7dKdYcs1LZ8wHp18KzYiJP03FvoOTrr/DQIes90AesLRuiQdIu4/f+
         m9mk+5R6RVyY5FdHQgOTNHqjHg2FHdWVOA9zOoYzBDKfYH/x5BcVXiU2cOs9pzjRbM8n
         mFFCo6OxkYEWhhUdHk/FeFYB2A8BiNiLnPMBuZCUgH7lKPF0/zrkWz18oj5yCVVZ8u5l
         qJtA==
X-Forwarded-Encrypted: i=1; AHgh+RrcJH6MV1vRq+COQe7vVG+enkjDp4JzcCg1MkOwXXsD+1kEZ42dko7HyXvx+rLnFzP/Lb0b7TXd6HSc4VfgVt2b@lists.infradead.org
X-Gm-Message-State: AOJu0YzElDB6BR6SClvjuj8O1GUyR7kGt8k8DjAXOXcgQDYQVL+eL3t+
	dgQBMT5JAuJlE4VPaxjURLSc1l6q5BIZshvt6MZafree5/Bm/e0HfpTS1NuOKbKX72vDB/KqmmO
	wlTScCBNKrKqztZpd0LKI6ZvBHp7N3Zo=
X-Gm-Gg: AR+sD10HPgY1vAQ0aXkJAFWxtPU66spHZLeXThor6l0zn/LtGtfziJRH4T18WxYIiwc
	t9WsxD66l2y2NLJz9PCW9IDcrWjv1ReZDSBHNy4d/lOOXIZ49SlD8LbPCTk07ZgYVv8qzyHdweF
	GKyF9/aG2XhsOj8bmKJojVtY7ssjkvKAhmiypnUL1zUwFBQFbeK29mWVRW4zl7QMuMWQp2p4fMx
	3ToviJ+3POAGn4v7up9ThPYtEvSUiMUP30P9CvS48WvMeexm+8uhpR4vBS4nGQ/+OGBHIYE6Ehd
	aIs3F58ZBFD3+v+O62MsieQxJPx2/T1iI2IE74JJcPFXj4SdSo+UsVmKAvQlzZVc0FZOM0ItBhM
	x6eQxTFn3Q3pXcskiwpmsouwzQiQ3hg==
X-Received: by 2002:a17:907:c10:b0:c20:899:b8bc with SMTP id
 a640c23a62f3a-c2129ac0d66mr200128566b.6.1786697157566; Fri, 14 Aug 2026
 01:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260809152813.585797-1-pawlik.dan@gmail.com> <20260813180532.3683abc7@kernel.org>
In-Reply-To: <20260813180532.3683abc7@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Fri, 14 Aug 2026 10:45:45 +0200
X-Gm-Features: AUfX_mxwIf5bn2G0UM-Vi351-EpN5XsVbICk5ppLvaZ8AB0iHOEQezLAyICIB24
Message-ID: <CALC2ApjREyeKcddOx0TP2AghDs2BVKY6xD6mU6ToSOk2MQ4cqw@mail.gmail.com>
Subject: Re: [PATCH v6] net: airoha: npu: use coherent DMA for mailbox messages
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_014600_664881_95AF8132 
X-CRM114-Status: GOOD (  22.07  )
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

Thanks for the feedback.

You were right to question the coherent bounce - it likely masked a SWIOTLB
path rather than fixing the underlying issue.

I tried your suggestion on Gemtek W1700K (EN7581 + MT7996, Quantum Fiber):
per-core cacheline-aligned bounce buffer at probe, map
ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL, mailbox length register
still uses the original len.

Results on kernel 6.18.44:

    airoha-npu 1e900000.npu: NPU fw version: 0.1111
    mt7996e 0000:01:00.0: NPU version: 0.1111

With 6f884eb alone this board reads 0.0 (mailbox DONE succeeds). The
streaming bounce fix survives two cold reboots; PPE offload comes up
normally. Boot log shows SWIOTLB active (2MB bounce buffer).

I am withdrawing the coherent approach from v6 and sending v7 as a new
thread with the aligned streaming bounce instead. Happy to gather
dma-ranges / device DMA mask data from W1700K if that helps on the
platform side.

Thanks,
Daniel


pt., 14 sie 2026 o 03:05 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Sun,  9 Aug 2026 17:28:13 +0200 Daniel Pawlik wrote:
> > Commit 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox
> > buffer") switched airoha_npu_send_msg() to DMA_BIDIRECTIONAL so
> > non-coherent CPUs invalidate caches before reading NPU GET responses.
> >
> > On EN7581 + MT7996 that change regresses probe: the mailbox completes
> > successfully, but WLAN_FUNC_GET_WAIT_NPU_VERSION still reads as 0.0 and
> > mt76 never binds NPU offload. Healthy boards report 0.1111.
>
> This sounds very odd. Is the DMA API broken on the platforms you are
> testing? The code looks correct as is.
>
> FWIW here's what GPT suggests:
>
>   Indeed, HEAD^ uses the DMA API correctly:
>   DMA_BIDIRECTIONAL map/unmap must make the NPU response visible to the C=
PU.
>
>   The important wrinkle is that, on arm64, these small kzalloc() buffers =
are
>   forced through SWIOTLB when mapped bidirectionally. DMA_TO_DEVICE did n=
ot
>   bounce them. HEAD switches to coherent memory and therefore bypasses SW=
IOTLB
>   entirely. That suggests the actual problem is one of:
>
>   - SWIOTLB memory is outside the NPU=E2=80=99s real DMA aperture.
>   - The platform=E2=80=99s dma-ranges/DMA mask does not describe that ape=
rture.
>   - SWIOTLB copyback or cache handling is broken.
>
>   Using coherent memory for a mailbox is reasonable, but this patch masks=
 that
>   underlying problem rather than explaining it. Before accepting it, I wo=
uld
>   test a cacheline-aligned, rounded-size streaming buffer with
>   DMA_BIDIRECTIONAL, while programming the original payload length into t=
he
>   mailbox. If that works, it strongly implicates the SWIOTLB/platform set=
up.
>
> We can take a revert of the patch under Fixes if it's urgent.
> The real fix requires a deeper investigation.
> --
> pw-bot: cr



--
Z powa=C5=BCaniem,
Daniel Pawlik

