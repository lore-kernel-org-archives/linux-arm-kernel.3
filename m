Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D312C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=; b=x7ifIzxXpU4q0Yi5xiiZIbNy4x
	pc8W73dKLeeVU9eR3U2Jy7k9Xt7ZthsLpU+z/gr3EtJnBPIdOUVMfX3UCjGeNbxd5agI5miZ6XznK
	X/vfdphP7LYIEyu3OkN1U2UlCH1oRc//ZeLa5GdtKOIUB6sUJGcGMVd2CJ6dRz9Z98jioNMyRr0QC
	5jpu3k/H8+szyeasGqKwwLYsn9NFJGFpm8JwPgAz8iW1JhwLCUYabKMtF5yoKcbvlZjj/rNqWKIbY
	45qZZ5TXNzS5fDPqyox6SeOHnhXERwS4jQmgru1vVJZLwngnNlB4Gy7fHk3NBnRzRY7fnsccu4N1/
	HPyEjspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQlo-000000091zE-3Nth;
	Tue, 18 Feb 2025 16:48:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQkK-000000091ju-26vP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:46:57 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2fc4418c0b9so4408075a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739897215; x=1740502015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
        b=H5gHWG9a+OW0MfcUPZnuCQCBntDii+SQXWdxQ35GXXl6Yp3NLlf2vXY4Aho7NqZIAN
         3keaMMSONjz18nGJRAHpQJdqqsogT3W42vUtRUEclYAhiMN2p/xkcu3/tk4MlDh3h4Hn
         J03G+6UzXnJoFFBIsTEzmVSdxBLIJ2sD5TuQItm5tYr8VpvOzqcDMwrsgncKxzgeJLTG
         2melXAxX7yZ8i1nc/OpAT4DZ7CebWvQhZBTZsU9aCYzWjUR36uTcFSE2oEvT/5pIB12E
         o8kYJdYnc3CQfanlR06WhYVEOm1p1pKZ693YbuGOH9IBySmyz4jJvsL3PW+OZeU73fjS
         C/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739897215; x=1740502015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOylOGK8+KXVlSKwEjhOkQ9Uo6qP5iYjwH/vqYLvpOc=;
        b=NwoAUYSGAKSAm6FwVvgk1Tni7ed17x6kr9gOsclwl8D/3whi2UXRyvtiYIAyoKMbLp
         NN4z/UasgogUSsXZQBz2v38PIZ3mjVlZgQwO1PP9eNskgg06tzKaQOzthjDBtqulbwd3
         TxCQ2VcDe81HQE6+VZdTpYBgh9Fy64HSTcT2XKBiAKL2rJfpzOB/kyGrJWk9NsbGCQmD
         oC0M2L2hAg9mJ6RDveQ6JxE51DehIsOatDE7eDqGHWD4qCXmq0sfXssOyJmKikVeN0Hb
         5IsmQixj/DI52MN3sChg/wzm53BGSIzTRNFjwp4QDFTkhHSNnaLzxekllHceDh71hxll
         d5vw==
X-Forwarded-Encrypted: i=1; AJvYcCXBDRXLStt/1kr6Fr2h6MNvTBCoD0sboKbeyHuu39wkUHw2AKE2txy5w6up1vP8e47/YRweqEmG2w2bIrrca6l0@lists.infradead.org
X-Gm-Message-State: AOJu0YxoZ08o62SbZbtUJCNvdv6SImr2wig/nmBTMwZIfpGChQPUS++U
	hMRVy/ML1JRHIteuj10RUXyt2heq4jSWNdpPmgdVLir6Hr0etmgYp/CO6rctthvc3xzgojuJ1bL
	f2IOyjWPogp/VPS/baxp/XtevHxeddlJgRqwqJg==
X-Gm-Gg: ASbGncsXrClINHAWX10SUf7GhvdOcqtWuKFh63P2xhMcAAEwQKqAea5JK0F74sgR6UC
	WzYRGKF4hZc2uvuKaVCAVnfNM3dKaJGajQE+bOA/OrL/VUe7tmjrDc4fuCL1XG8oEH5QHHQ==
X-Google-Smtp-Source: AGHT+IGHwzBsO/GBPkHZczfaNaO/9Fri81n9XYQ1ztlxgGE0CRA4HOyjovvD+vqgo/EOu8/IM5aMJO/ERmz9uK+U4xE=
X-Received: by 2002:a17:90b:2783:b0:2ee:b875:6d30 with SMTP id
 98e67ed59e1d1-2fcb5a17ccfmr165222a91.9.1739897215586; Tue, 18 Feb 2025
 08:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 18 Feb 2025 16:46:41 +0000
X-Gm-Features: AWEUYZkKtmN_-KWMeq06D2l9RZUatLIu9Ka5J6k3tL8rcVyNTYGe730GhgI3bME
Message-ID: <CAPj87rN7QQ2XRa4KnaH9MZrvyRcRWWrihSKousR1j7GD+bEQtg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_084656_553193_4C9C5D3C 
X-CRM114-Status: GOOD (  13.35  )
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

On Tue, 18 Feb 2025 at 14:35, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> This can be tested on a RockPi 4B+ with the following steps:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
>         -b prototype/sdp-v5
> repo sync -j8
> cd build
> make toolchains -j$(nproc)
> make all -j$(nproc)
> # Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
> # Connect a monitor to the RockPi
> # login and at the prompt:
> gst-launch-1.0 videotestsrc ! \
>         aesenc key=1f9423681beb9a79215820f6bda73d0f \
>                 iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
>         aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
>         kmssink
>
> The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
> into restricted DMA-bufs which are consumed by the kmssink.

Thanks so very much for putting this together btw. This is the exact
thing we were just starting on, but you beat us to it by a few weeks
it seems. It's awesome to have an implementation of 'real' (if
useless) SVP, so we can actually exercise these codepaths in open
generic code.

Cheers,
Daniel

