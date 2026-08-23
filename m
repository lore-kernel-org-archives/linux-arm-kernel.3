Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C6BC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=; b=QUYGao2BErjdN1pQZfESvh0tns
	i5uO5jvum/SJhOOpbjlZ6oBxDFdipkG4IB4yNngE/c1w04F2rInn9ZabrQb79KXhMY2zLo/xhuK3/
	D/wiiqKUF4fH3oGc0lLetttp/c7XCoZVaXYxH23AVLFVh+Lu9Ok4LveexsS/FxLAJ8i4Eyp7TXHN7
	sZwQhQUoktcP3m/57wc5nq7xv8xM9Q7CKc8ZeCWfTviq0h1dPK/pF7n4BjaV4UuMVK/iEjEQiz69c
	KAAVCzxWN3M4Ld0WVRUhb+h4eA+wRSeSz3TWXH5dcF2/CD9yhi/Hez9yB7ny7Y74xC8f0Rr+UCHob
	nWCVcU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy5eQ-0000000FG4k-2a4Y;
	Sun, 23 Aug 2026 10:42:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy5eN-0000000FG41-42ON
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 10:42:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso400295266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 03:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787481721; cv=none;
        d=google.com; s=arc-20260327;
        b=Gw89U5ZVJVIMZsjavf3HaEVVip2dzFZrwULFVldcqHfgyt3Kv4tODAgBhmmcF6cevb
         EREiO+DBMIzdlKlJVmm7nGG+NbtGecKB6/dPO5+gKjrnhpPQBpSj1JmnUH+vfFT5Zt9D
         eCdhmtsqGGI6EV40AQNxHoje0PyrAJvWg6DgW5V9SwMOI4odX9GdjpXJK+2pnzXKDZj4
         pskyahm/2A3NKy5ltrWlsU6fmGHcWQZ1ER1Gdr5LXqqaAUYY4NDWMH1rCnDHVScfqXXR
         CRFYaUZmVggapd4iPKoSUE+ZOwY0horJv0tVlYrE3GiMpYZhdHZWx6LgK7pC4xvWOrxT
         e5XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        fh=8iN437u8czz4dlcEn43svY1plESJGDrf9uCCDqojN6E=;
        b=EvtLa8kLvGstJ83xBHAGIS2jNjf1krEVg3EPkCWO23Uh75vvF+3/PUl/B+S1idEd5m
         YHfmIMb0Ltfy/oi4VxbwqSLeFLgERLpDe8SKcVvDom0onXfV1EA+R+Z7y9DXXO+GxbOI
         TZpahTwqve5ayLnXSZ5mSXyIP3iTjEBztlJMjZc2KFQ2NRnsXpyRuDqSOAv7rkQmpPFx
         UNtOdPCjjoMS4uroGmMIBbqDb4kR7XgPJGN87s+X1tPufkZLqXGsi45khm/0NDntzk07
         O7m1DXXTLojPgbp6DwNVCtMUkbEqQ4QEBbs3wd7Ucc5kpAk+4ZrN643gGGYzTSPqm6Zq
         y01w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787481721; x=1788086521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        b=UEb/O1qF1+FrTiOmq0PZmeHWiCiyvWtHc58Z3C6L0fxRH/BB68ltpUrEWJiZmDDs40
         FUBCCVDybBI1xPjfrpZwoz56UgUtQuuGHuTlCYiM+v2zcWXJlxyW/atp0LiIoFuTgusZ
         MGr6L3l7T9m2TeD5QBEJYTDAo1YSuAIYZsclKoYWBHHdQ0TbzRs+ybrz0mj2vhT0oiod
         2lKSv9N1HqffwHFEvYplKWFdxp2tGd9Y4yXEAtJZ9JrUEsZrnasJANCoelWZbVeKjoXA
         BNtjESaDadYluGzH/MKB24EIImjkK5nhEeA2fU5NsTZwUc6/7zJfx8Ru772jAyE2+KUj
         lQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787481721; x=1788086521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQUVqT2GsNnO1vNVmJUiz/YI3RE2fLyeDnXMk0gCVEc=;
        b=IqIRpLMtUL6jKpKkPWB80jtUXaGyxm5k6BN2Fz1pZGgin0zwHXp/rbA7Kc49QX2qJ6
         JJaECvFVubnJvl7eoA8avDrqbggvfMI9CwbWEjxj1H0foj7HwK9vQZnz4H0aVXFq+p0g
         8Ya2XKWgIB3YNf/zSWb6SMaMhYRVNddcOtal938TxC93JXA4Igh3nLD6XZvaHhNzE6QY
         R2K28qZfjQg0FCyXcSKqo4+FRetWM6PyEk1fVDx8PKkdQ77sZdyTCq/VzbrdfuWd55zB
         a5uOV78GYFPa/1TB1xbcaaEM3q7ia62Lzk3T1iYa6a8ZPKwHsT9jMaOWCn1rAKtNVLpG
         tiWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMJniQaJIsGH+osEIoH0i1L6oHp7f+to4nT/qWadaDWNNdFUwJEcUlz5YIJXD+YoRIy3DBlowIyukG/v5jKwio@lists.infradead.org
X-Gm-Message-State: AFuF++negeUQShb+yzdD+0S4vvJMRSCazCx6zlg9/pTYw2EHwMDGvqLD
	hFggh3PxSNdNf4MjEfuOVGLsiOpFBuewgm8gkzomxENd2eu4shsYpkBc7qwhuedObPd7mjCiP/b
	K/mfk5/bs6JpkrySpU+JLoK+0EgSkQQ8=
X-Gm-Gg: AR+sD119PQ4hLddksK8KGOjwVer7X/jLaLR+SJRd26l15tWTPOjfK3P47eLMHOtD5yU
	rUQfyon7xl4MmafBgvopplHSBaTVTGFXhkVLoxjlJenpxaQjSAnblkCdE7kX025GPUm/+trcpap
	yqMwM2ZeIOl2+vUvV/k2YZB1PNXQl0kq6ZIAWE++4BPXgeE1IyyaFeMtvwoD6mFQyplqfg7zcjc
	byeW4tx/5vCDcRFSkSw/JeQNzHo/ZvqlFpKbXSvZlAEb7HHVWTICgSZW76PR+tbFz6GdUePIOlQ
	cCy1HBupLhJp0Sk7cM6i5gBHd53ue0MPy09Lg1ElfiFvHhPbz0Vrx3BUGEdTeMVWBMqn7NLwbW2
	YyeUQ7lVqq9nazYsg0Mk7lUCYA1FK9A==
X-Received: by 2002:a17:907:c706:b0:c20:f913:9337 with SMTP id
 a640c23a62f3a-c246a657f9fmr2290057766b.20.1787481721077; Sun, 23 Aug 2026
 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260820085941.380401-1-pawlik.dan@gmail.com> <20260822122727.4f437bb5@kernel.org>
In-Reply-To: <20260822122727.4f437bb5@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Sun, 23 Aug 2026 12:41:49 +0200
X-Gm-Features: AcwNN1Whb7yUsS76NaQO16mZ6ya_4eh39L6AFwo6dWX5dJOjIcUnhZ_fwDLV2K4
Message-ID: <CALC2Api8nhePvuUPsw9CE6nX-0pFOMO5qy=4fzqox8_XM4eSqw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA mask
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, lorenzo@kernel.org, nbd@nbd.name, 
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	yangshiji66@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_034204_020755_39BB5DAB 
X-CRM114-Status: GOOD (  12.62  )
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

Hi,

I tested both patches independently:

- Patch 1 alone (DMA mask): NPU reports version 0.0 - probe fails.
  The streaming mask is correct but 24-byte buffers still bounce
  through swiotlb, and the NPU can't write to that address range.

- Patch 2 alone (cacheline buffers): NPU reports version 0.1111 -
  works. Cache-line-aligned allocations bypass swiotlb entirely.

So patch 2 is the essential fix, but patch 1 is still good to have as
a defensive measure - without a proper streaming DMA mask, any
future sub-cacheline streaming mapping would silently break.

Dan

sob., 22 sie 2026 o 21:27 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Thu, 20 Aug 2026 10:59:40 +0200 Daniel Pawlik wrote:
> > The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> > leaving the streaming DMA mask at the bus default. On the non-coherent
> > EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> > after approximately 41 calls when using streaming DMA mappings.
>
> Can you confirm if patch 2 is still needed after this fix?



--
Z powa=C5=BCaniem,
Daniel Pawlik

