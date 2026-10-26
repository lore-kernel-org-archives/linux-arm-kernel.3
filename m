Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E38606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cR4SsLyB;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Aft1cNwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=; b=cR4SsLyBO36Tkk
	QD5dzE9b1sxFhHCnR7ACXT4sKSul/KOchwzcDdoLU1jBzNl0cGsqRQaXbKWnTxaOh4tVFm56YMqD6
	tL3x7oDeLQ1s1kr8vCe4OHACUmoCVbiJDsiw6HeU6ppWxWV0C1zMgiV0cqvuHoqwTmXnMvwwrVVWw
	x1zhMaGe3EFq4qjjt89sJU34esXkAdOHqmxbk18AcO24Rgnojk7Oz5aRH89UkCju52KBSvWKZ3ec8
	Qm/PK1B8ht4rRYUUA1oox3MxQ+EPocleesY9GrpY49K+ugM2kf1m/pFhDPqzwqevvniBE7jSGzz95
	aD/Y8sT15YmMgnFMyD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLd-00000001yre-18AB;
	Mon, 26 Oct 2026 08:46:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLb-00000001yq1-0JUr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:46:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso27697615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793004385; x=1793609185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=Aft1cNwVWNvT0QdXUnsPs76bDOLZrzNhrtHYC0M8xxdOJunRW9zgzaY4BJGu7iaSIV
         6cHfcJowdmllcb6+vfMh4fdNSrKIh8yE1Q6ARF2B/VEOMDavElf/BiCt1cVpmCSOahtH
         xuGOXysqrMt3qDgaoFgK2mz6U9cBBWJTcg4anSWCTHQgQ6onIDyRwPiY0I3jX0ocsAMm
         DHZlre9q0iVdI0F7fKRMxmZ39JJotza5594TSYd+S4cH79T5ZuHFYVFcrl25N3Qs9Hje
         OsIMvH6WxqHqfNGBXhJbSPIzLvnQpMZrrBI1xSqq7Lu6L6mhztHFZnfxvWboyqoty5X7
         MWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004385; x=1793609185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=WMtvdTJKkp/AqpFT/R9iaV/AEGvfFN0LuB/KK/23iK3xPZkELjKQnyonpCe2bDRRb6
         ZsFF2L1pDCrJA27dxXFHIM3nYRUqyaRQOROZerzHwhkTu+6qvPs6CAoVlJuq/lqvqw/2
         SiQKV+Ev60pbOfJ5XRYlR5GlWLoBXbik0ETmIv6ZAyYzNr13P2sehowakdeOOITeejwF
         y8MKdgS4xjclAYyw3eC1izfzynWCwNapsij9X79V7FPllv8S2WWyWglF09jpL7E/8aZn
         Q9dAgog7n9xrHDtABy0qWTlzMtd7Pr6xnGjsWt4CQ4x7STy7dZmc0F1guL93TIilgLUx
         SU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzqOTR0nz5o1hoeKRlvPH+4Ml+Zk8X5VkVEiUDf7nvTuL0V09jH7bxbyJSgy6WFOybFZ3Sbgj8DgOa4+4TDvmQc@lists.infradead.org
X-Gm-Message-State: AFq9FYJwCCmaQbBWZgpX6PQJ5adavhygIPPEMqLUDETTAY9wFOGjVWQH
	K5YoCvHEnLwyqEae8R54YV48bZ4TwvEHZmZ9TcKtvuIsp4/xGqxUMLsM0jl9w7VQrKE=
X-Gm-Gg: AYBFou0PP8fU1N+6IAqyYY2sDRbq93AjAfhUtHge4Y/HrsdIMpnUlgG1cNPgrpyKefe
	NCSxG+33UJKeF2H/9q0U9DShLblyoM8nhlcKiiUqK9WTFPnDVZQAmCYhw6ade9WVY7LaaBYFjdZ
	tLBWwkx/ECnW5BFl4TBToHFW/nxqE7Bp9cUkLue0U4RMbtCUER5eaxAHVpNBY6i8i8rsjvdByr9
	BvPX+qM0Y035R1Lrd4CA3vH9yDI24L6dNSsaGbdwF7zcsWVGvzeqmvUtb6ye8sverGYjFMeGoRz
	efwTqB7QmDGbpRkS7YNHSFyIApQ5PgrFrBX92c3iSe0wzVF7P88SnImyq2ZvZNlxPttCUZFooGM
	ScZyFQgT2nE58xJ/R7KwCQhu1nK1DaF2VbGhf0ewABa/MSuZg3u/6uzJIJGHVzAZREkB7WsHVRp
	qD2A7U9AMSohB85lPcsh9KYxeUDBuxHQwG6A/g0/V572dVn9l9/CHsyhhBQlkh/dCETKnqXLwBP
	oqBBEXPxni9uflNqYZDOYwvQp0Aa5yB7E1pdkZiSMZwVuifj6v8KNtjiAjQ6G5raP+0254Wc7E=
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr105232365e9.3.1793004385073;
        Mon, 26 Oct 2026 01:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm146277845e9.2.2026.10.26.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:46:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:46:21 +0100
Message-ID: <1jik2okfxe.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_014627_129320_CEA87225 
X-CRM114-Status: GOOD (  23.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On dim. 25 oct. 2026 at 20:23, christian.koever-draxl@student.uibk.ac.at wr=
ote:

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:
>
>  6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
>     field moved, so the mux always read back as input A and DAPM never
>     powered the selected path.
>

Jiebing has posted a v7 already.

Using AI is certainly nice but I would advise that you slow down a
little and get used to working with the mainling before sending 7 series
in a matter of hours.

> [ckoever: Jiebing, if you have a newer version or prefer to post this
> yourself, I am happy to rebase the fix onto that instead.]
>

For example, instead of this you could have tried to ping him privately
before trying to takeover from him. He would probably have told you
that he has already sent a v7 and (I suppose) is working on v8.

So please be patient.

> Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
> plays without errors at 44.1 to 192 kHz (not listened to).
>
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
> Christian Stefan K=C3=B6v=C3=A9r-Draxl (1):
>   ASoC: meson: g12a-toacodec: fix the S4 source mux read-back
>
> Jiebing Chen (6):
>   dt-bindings: clock: meson: Add audio power domain for S4 soc
>   dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>   ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>   clk: meson: axg_audio: add S4 support
>   ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
>   ASoC: meson: g12a-tohdmitx: add S4 support
>
>  .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
>  .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
>  drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
>  sound/soc/meson/g12a-toacodec.c               |  51 ++++++
>  sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
>  6 files changed, 312 insertions(+), 4 deletions(-)
>
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> --=20
> 2.56.0
>

--=20
Jerome

