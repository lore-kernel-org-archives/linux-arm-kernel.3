Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BAEFC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 23:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=; b=HSiiLajw8DEWDq/gOALxqfEkm4
	Np2v1UdcWv6E6xUKrFb1jQ2b2b3SuN39+spC8InOyjaBjgnZ83OnjuSAOU2O2eDHwUR0tx0ZkLHbd
	MPRBQdWN89hj+Q7S6YzpA08YU00I3UNrvljmC9ac4hs2ybJ3JVX5DXwlBdBpCd8727fibGwxsU3JB
	+e+EKCNNVXTLMWQS59QUPfsEbtlmoFT2GkXBgfJXLfiYi2nTwac65+ktltOCo74HwEK67FjewIlFK
	sKFJS0Ud3ge6L+WxZb+uwMYaa1nP+/gjBMCykjXijOwfvoFyKCKt0Q6dLhgIooZA9owpjCbrpjV+a
	XkRz8s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p2p-00000000Ag4-1IYK;
	Mon, 23 Mar 2026 23:50:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4p2m-00000000AfL-0xwn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 23:50:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso27702775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774309846; x=1774914646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=fc1XuqPOIlyL3poqIzxt40sgst3qpl90PU2/RJzBgUnVh1kj2JkDhMgdyBVbO6nmJT
         4pf1a5Y+QD0J1/itrWDDG3P6pKII5LDkaz43nBn2r/DYRp3HpzpWYUSIqYn3LIjRudvm
         HssqeYBsmgURfFFqfDqB60HwX7inAQvyZWeDDQF5/jeCQthU9zlMgtmCH1Cq1hpR/ave
         nC/XZnDJDGwo5Feh7vXl+dubFIyjuqLwIOI1l8qW97/iRgzn5f04K5FU4X7vHKEu4X/7
         mStJdREn2BleqLqALAR1s2d0wstr07oCJlsy9Iq/BwB4akyY8YkjS/sf7URtowObMX0G
         sT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774309846; x=1774914646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fJKrbaMxfDl3XY1IeHz35xE7hWQhlMR+J2+KKVf5HEE=;
        b=T0k/Q+SzMlAV3RjNNQ0pFyn3ihWLI5+aKwKQG6EWtMY/Iy63XNsRwo42c645SNsP9c
         7nnm/txwMq9BsplmQRG1sctx1xlPzBCIpvG9H+zovsJaVRaFrzeBLPfzvLMg+56Psg5b
         w1acNSaQb7WUE/xOoVm9zwcmMICuKxNAj3gjfK6zFTRTUl80uzNIG/zNOtfLMvbFAO2C
         vtENIU0W9nfMtu63o2GT4IRvT/1uERuc6QK8xxb8yfzClR0rAjN62DkHiwK3vyBgPqHi
         B/cmGcO1bRAgWaRhcuFwR6lRPcm20H6GpwAtSIaR/ZaeeMu5uvJwzJm9hwGzUBSZwp/L
         bkKw==
X-Forwarded-Encrypted: i=1; AJvYcCVeESTU17U9DeOx7BQVjcNNAdU2oAA7nw0DO1hiuS5N1yGn5UkeQkXB9P8ivJjloDj1/xLzGxWP+GG+WpAawjW6@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQT+fbFWQoNd6s8oTeYM8Sq77uxE/tl7rf7sd3rKXncLNkzXt
	Sxe+h/3nCn9Fi8ZCwlTbpN5rvt+M1V0axcsOh7uaKS7YCm0xpkO1yz+8
X-Gm-Gg: ATEYQzwIHlUnXJPlcVLGULhfXDCcBr/DtnzByMdSTy8qdQGTXG7plNOYUisIkoHwzfQ
	gBvI26cH/60K/d/wToPLb/AmFctYNsFZi2UNLm4Wvfh8rSJwPZrNaKeg/PcHFj5rOJcqhCsLyoj
	nR3ZwJ2QwN3efl2VV+Nf9ciCqwkT8EwUgrM9/VKLVBZ0nkMBcEnOjLV8U4cdraQE3qr6oXD+4a3
	l9U48wo43Eh2RXKStsEhP+/5gDJHgfzEWmLU10qBzCQWsUTAoVW5afDfmX59Pf9aqjRgBUqHpVM
	UUMlsQ1sUUK3c8ffSi1R7xqAiIYt09ZPm41u4rGJygEU0pjPi6ZGdpiHMB9//E1Jek0nuxyjw4f
	f9ZxSH8ztfSSV3IJK8cJeAIJIt3tTIatktv+pWrWAnEdCGl0ArSUfXiIu8H1LtQgFW07I9LHQuR
	1+D9mKvz3zNvvkxrVNDOKUYP5RyWDf4jSd/TPRRJXLPQ==
X-Received: by 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr183730635e9.22.1774309846416;
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
Received: from jernej-laptop.localnet ([167.71.101.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm7483995e9.5.2026.03.23.16.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:50:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sun4i-spdif: Make reset control non-optional and check for
 all errors
Date: Tue, 24 Mar 2026 00:50:42 +0100
Message-ID: <5975699.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260323172450.1259111-1-wens@kernel.org>
References: <20260323172450.1259111-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_165048_273311_A119811E 
X-CRM114-Status: GOOD (  10.23  )
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

Dne ponedeljek, 23. marec 2026 ob 18:24:48 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The logic around the reset control is weird. The driver already has
> quirks describing which compatible strings require a reset control, but
> the reset control is acquired using the "optional" API. Then any errors
> other than deferred probe are ignored.
>=20
> Instead, switch to the non-optional variant. Also use the deassered
> variant to simplify the code. This also fixes a missing reset assert
> upon removal.
>=20
> Last, clean up the error message printing with dev_err_probe().
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



