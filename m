Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6560CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=; b=rmlTZKGf0mgPUHV7Gd9jruXilI
	G5ECcBYZgDuSzvucF2sJ5PIbSPB59o+RlnA+HQpuFUC+CGstVAGscf99urxcegnRWU2qPBCwAVI7x
	eFNDeJTMVjFIIRedtw4FxuA2Hlrv022KnkqWLtiTQ/KE/UihiPUebP4pGKNUQ1qMcKCN/cxBCA27D
	eallmekoshD5R2H8BfmMB37ZRgxR2Ns+lXTq//q3NTfoSMBoSqtb3ZhqbPZuypy5T0c7pqhD5QepR
	KCdu7Ir6Iq760Oos09ESpg9fMWWQJuzZG2u7kgk9vZtHGfZHlJ5IvPbazemUM+udSTM1N1+uiVbu+
	4ZgxAhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtM6-0000000EQIg-2wVO;
	Mon, 20 Oct 2025 17:07:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtM4-0000000EQHi-3dLA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:07:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so25088465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760980051; x=1761584851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=;
        b=kVKDedAqZdG7Q8NcqSt7lT2cIa0DrtJ2AZWflZw1hhLIEv55erGzvw5Rj2RNjgKZSm
         D/k16U5dHgiIczEI1CrMYcQ43mGFaB69FbUEgT39S6DDBnnZkKH6lQNnwnA3XVW81nQP
         qaCWTSjAVQAZR6jw1at9rNngirbdrIOxA4XdnB21SrzeSin+NiwejLtiBndgniBc4z4a
         HgkA7cIMaFVpAnnU8ep11bP32F5+xzaDAx8yJrKGJSu/r0ti2mwn24hMeEII+ClZ0J6s
         z3x2sNOILjqPE9fF2wCwrtSQBZ7f7pomB8FYo0Dhiydcunk8qzS7d9vvOms+nUzZ731k
         34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980051; x=1761584851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=;
        b=g8N5p6jl4n1bIvkty57wGFToudoVyRRw8ikt6bt8omQC1K8EM9LMwSCTKd8vEvaSvR
         t6U4nb56KNMLa/KbS8DCDE4WEaoaderuxNmm9Rm1kognOO2W3HcuFRbXjMF9K3Kjq0Ld
         BDUmrNjTD9wUmDbg7Hn5WIOvxqYGA5OYSQeOl7TLH0sizHOvC/KncR42aWz4AAOp9jXe
         NsCepf0a95BCjNohyc3AXHLGVp7OVWT/t+E6sAJc3VrtacDWBGrQk2AYeGkk/SElfd4C
         ov9IOYvcIee1SWCUot6YBAKYU+hyb/81RJn0HSWvw2hOJ49d4kkFbEdBLQ3NfMm9PRWb
         TvmA==
X-Forwarded-Encrypted: i=1; AJvYcCX5IGmfFAJSfDDjEO+QLnwvYtaIOdMYuVv9X3E5Ckt1CVHbtFj5BeLTZedqd61f/xI/+laekkCSoWtr9cxdyMY0@lists.infradead.org
X-Gm-Message-State: AOJu0YzID8aljFT0tdZ7cxwprVO9T9zDSmDcR/FAWWhIMDxOvr0WGVRR
	vIDcecJPlYT6KuF9c1al2gUI9/p2T65el8Zj/kijQ52+qrD8j8uLPrnO
X-Gm-Gg: ASbGnctNanvM+0AMkr0Pb2oN1IontF0ypn4pToQzL3r+7xgR6/84q34wVncfWKGSAJT
	pSR1rLOlXvXEqIx9sQpk+kcoe2TRg2Y2DDl2oiqxoj1LtsI7cw5OlrUpQDXEf7hXD7hfabNiULU
	A5/07sh9SQHyma5nU+wbo/suNnmbrwXKOY1YsRzlv0/bgd1Qyetd29b+DtqzjG8HGh+2C9TaZJQ
	+Ytrv+tWoWmfyppn25eBNi4LOx7w1X4MYhP6uJZVo4cIZLlnPjBup7xnmJMA54hqUKkFRt2Dnov
	95XU0gO5ES5uffLKSzN0UeFAo1lYKFBH88Liq/oKhXXi4GHBI9+jVToDI/uk+MR3H9Z6XgjWUY7
	Jedwrle64KDJSFN/uNVRabTca9ON9v77SNyBc3XG8pQtxEUJnIDRXvbnVszTpsZH6/FLVy+K869
	y1E1z0KBtMVhTE/slaWsUHBdZjEd4HsHZ/VXrV6QBSyDy5ZUeTYbjSs1f98Vcii8AGv+/i
X-Google-Smtp-Source: AGHT+IF71H05NxO/mN75w8LXTuLNlvDg53UBaWFoqKaZMqlp8yMREG6PcbIoHKXwfd7uM03lA2vPNA==
X-Received: by 2002:a05:600c:524f:b0:471:115e:624f with SMTP id 5b1f17b1804b1-4711790c2d6mr98843065e9.21.1760980050861;
        Mon, 20 Oct 2025 10:07:30 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c34sm252921305e9.10.2025.10.20.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:07:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: Add debug messages for cyclic DMA prepare
Date: Mon, 20 Oct 2025 19:07:29 +0200
Message-ID: <1934468.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251020170147.2783867-1-wens@kernel.org>
References: <20251020170147.2783867-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_100732_911475_40FC813D 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Dne ponedeljek, 20. oktober 2025 ob 19:01:45 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The driver already has debug messages for memcpy and linear transfers,
> but is missing them for cyclic transfers.
>=20
> Cyclic transfers are one of the main uses of the DMA controller, used
> for audio data transfers. And since these are likely the first DMA
> peripherals to be enabled, it helps to have these debug messages.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



