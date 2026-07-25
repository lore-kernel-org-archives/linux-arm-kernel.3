Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B59C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=; b=UVc8+5roN60RTAlN5+9pmh7Ded
	tDpmMRFeDV9HhaOpgv5YCuqkFw/dVRlBQeNFkhvSLr0eqrRekq2XulrTgs8vtcK2LUx8TdZ2vhoFI
	vZ3G2Y6jHGZUJ7pJwf6wi5aRhtMbcbfAZZ79pVkPuPrACBjsZx57tWRw1E3dFvkvc7jwdm08nyJKT
	/aGb5TGk65YaPb0kKCPP5mdeN6VTkk/vKUJBfWa+fe3NycWZ5Dqm5yOo5azLbLSf1qX3MPAk1fbbT
	qv+2Xv3hWlzTKENTbwnJLQPDgZUzSRKvUyvsgodRgBB3DerX2V7ruRsTv4SsOvKx0WfsvIEPCrRXd
	QLvJeydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXJW-00000000AHU-0IBQ;
	Sat, 25 Jul 2026 08:00:54 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXJT-00000000AGq-2YWx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 08:00:53 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-92ea24a2dbfso112056285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 01:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784966449; cv=none;
        d=google.com; s=arc-20260327;
        b=b+MitLIwZVFfn894eFqOYtFI1kr+cZnaY4NI78zd9ranbh8HLd1RUYFMeQRgu1kbFn
         XRq9brQkxo7qm6x9LfMfMWHIhkIGQUKZNTs+rGO0UYCUldi6ZVHXu+7rzkM/EO9Jg3H8
         jlzLVbfEu2PPdA2FFv+zhK4foeWVqNbF0ncZse7ib2zpzZ6+LkJUMPMS4UM0vj130Yc9
         gf5P680kdlqSflYAuwLZhGs65OG/2LRN6WDcWqi/QGawD5EOTnr3EXWs0aBSyitR6q+m
         h+7Zxt7RlmURR6WhfTgyjTra6ow9CMVsSl6aMeR6/BXuykwwocpenI2zvVBwxoU5taPB
         0dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        fh=Q8maQt43ix+kexQDZxXnqFpjjhFFvlnju5ulqgRm7oQ=;
        b=c+vwBRQDam89yg9f9/pXIteZ2+D5hp8AX2Hyq7dOaYN7b2/3E3IyjVG13jloDKzuR+
         tua9GNxLTt4Yx8N24ll1LkcvMuM+JQMdGITLxDYO32Zxa8fgH1v0z7fjmVQTGipStAEA
         5Y9lFlVZMTICfVzBM75jII1GyOLgaARRLIS8k3dUzP7UHC6ua+3OaMS04bPAHe1slTAp
         TNuX5p82ujfpc/cpl+Zh+THhseCn+Ztl8o5sc/ydxFJ89EVwHcMcTOL+x7uF3WsjKWZO
         Zb6IFftKBn4as4B7HK+DtCO/rqJjobd7A7Wvl466mo5zIu0Z4A0+3e80v4uSMPM6dKn2
         p2og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784966449; x=1785571249; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=X+7+yY+qxrClaKL2w3R7lmE9XGCpRfge4Ut/wDDgzZxuYcaZwQEd1iT83E4HxLetk0
         FlvKGDPhxZWRmHSyr0t7LZgzQ+zh4sBrfo3CXiTg0oJoqgZJGe1LD/ZfOh2qAab7zft4
         rY24PRQqSJpCEgnyKMgfWypQnUh0AhErGhF3eL+Cd5jWl8dfEwP6QdAkfAMjTsPVjm6U
         sCRS5DxtaYVfdUxBm4tyaQ34FXVB34T1LFtSVld2moMlf9QCtFhSEyVyV9zxy6jjLPBI
         g9w3AOppW+dG6Fmw0r81EII2bqOc9MwxoMUdtMSVDpcsrlGiBMvTxug8HmN1RhBnjR9l
         ITYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784966449; x=1785571249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=Vb35Z7ySrfEGx3hF/utQ16IIPnKJE4DHIDAuL2PzBg6JHR8S8XCWlxSxlT8YonVPEo
         wNK8JMqB2CYxiTcAFJiv3e+HpWsrVEiRshicTsNTvGl4pERUBmHCri/hbvgulAOPBWoF
         rLnSGK2RTAX/lDPu4sOTJhisVNa7fkKZQwtjGdwlUfwLolYbE0e3Ngyhf3XDOqWCO5/Y
         JbA1p5WrJjqgZ2gLdi77kGIL3fmTdS8Z51ch2SJEMiiRRklE0eVHv5egbJOQuCBtMume
         OUDi+JrpMrsMoyxZgKVE9z3/uStYVS2XWEOsyFwaend/h+6lahc99lZrMdKTzD0bt7qY
         eUhw==
X-Forwarded-Encrypted: i=1; AHgh+RrByEZHGdYP/pUBEtst4cnxutB7YtfBYcZt1RWcE5qJJlWx+qhyBKNFmGs3vvkQo8zJ+elth6a3jImkkxg14KGa@lists.infradead.org
X-Gm-Message-State: AOJu0YzaWLlmvbILudryaI5Jkbz944XS5L//jGCa/3s39qjjXI3wZoLO
	HyHeka2sGLgrB3gSfISDqXzG3ER+NBmNf55oBKwU5ICZY4Kh9OiRV+srkRkFif3JpPvbddzP8TA
	yWktqc4GvjxQHO7fMZdIVhAFZ6gCHmnQ=
X-Gm-Gg: AR+sD135cnxA2RmWbLp3u5poxZNn8juzdOaWdcocXAkL7HxUiKUlaQgA88ATfJ6dR3G
	OjfzQNe2pacIoxkEd5t49KkNfAgfxbIuHxOnkrVtaZATiZulbfttuV0+iiUbuAgzSK42sIsMpUK
	d73iV/pm5h3aTdRdygEZccBC1CbOBlVkWj50+P5kNg0axSYU3s7vm0+qBkMDqSBmWOWYZ0TdX76
	MFqbZSbPGn2qqiwCH9P8jJ6RXQDvW6+nw7W8Wkxt1xboBp0hbIBk0zNSSn71ldl7mAKneguf21G
	fddQF56U4APYMmCDTOGU31Dpn32FBGqtjLCa82A50WJFq4tiLHyFhaNrQy2p6SU=
X-Received: by 2002:a05:620a:2681:b0:930:dd19:11ba with SMTP id
 af79cd13be357-932df6f0f30mr100360085a.92.1784966449572; Sat, 25 Jul 2026
 01:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
In-Reply-To: <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 25 Jul 2026 15:00:37 +0700
X-Gm-Features: AUfX_mzCV0IN9fI_10kkKdi3HsilTau4VYjXeApWLMbv2AYQ88l9nYF0tHwG8Pk
Message-ID: <CACak8wNJsmVKm3m+JwYPSxqfa26MVFRo3jE3YrppJPi5SBBAUg@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_010051_666202_AA277C76 
X-CRM114-Status: UNSURE (   8.04  )
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

> Mix use runtime pm and clock is not good.
>
> You can put clk_bulk_enable() into runtime pm resume call back
> and clk_bulk_disable() into runtime pm suspend call back.
>
> Frank

Hi Frank,

Thanks for the suggestion. I will inspect the hantro pm_runtime call
sites and let me implement your suggestion into v3.

Best,
Tharit

