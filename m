Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B860D15DB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0GfyFGM1Oph0pY5oAbEauVJi8UkgLE6QU9SfUb2YsY=; b=nTgtkDzI6R4LPunXWxcXuRZIb7
	10YF7HYRke1xIbySMa6g45eI0UytbBs0rwgv2sE7xCnHLpu3W3Khtg2MRzTbm6rYHZcN4M9q3hjP2
	hdcW1zk74rOe9+NwSQh1rKVhVqg7Hcwpgb2MY+lVi1MiDuRWbZIxsL0rvQHvvSLXMV0UXTs0SwfS2
	jrRyCh+cV56OVuybQg7G0i6AFiK1bzwvbpj4T9LS98drKjx1zdBbJ3W01aNXG3uRLz13E1dqdv2V+
	EV81muxvZChVfK/zzgRUfBWWuEmc4CbEuE3UrU3iVnykEjvZgxqiB/V+P7n6/GI2/Q2B9fWji2LWw
	wNz69nSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQw98-00000007FYi-256g;
	Wed, 03 Dec 2025 23:20:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQw97-00000007FYR-04Tb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 23:20:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2E7360176
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Dec 2025 23:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61803C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Dec 2025 23:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764804026;
	bh=d0GfyFGM1Oph0pY5oAbEauVJi8UkgLE6QU9SfUb2YsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i52K43ItRJf5Gem+Kwl6iAnimM0datLWEvGacELCt3p4FULhukjH4QT4DVLavFWpI
	 JEAkp9xSM3Z71lEYJ4anaihlGwP9XrBIqAsLsIzneOwZvFLrgvgA1+O4W5C4r/ohAx
	 R8nV7z9NLtoxn9otR+6OxbgLljweuWOlfh9BX3f04zZKyXiJi/EKKAhUGheI7j5Cp7
	 5yGbVwAEHxfyrhFwjj6B6eg9aaG69KJO0U9/QttH/xPYGQ7+V7Z7ZWBPGn1xNgQr+I
	 x5Yx9ajGl1N26NlLSfMn5jZpEmjVV0K3nogbO4eUjT7k5f33GKNMpZ29+2wAIHXeIw
	 nHK88laEj7D5w==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63f9beb2730so218987d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 15:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP67NhQdU3A1axD9FPmWfoQEb1UJR/vd801B8beeRcp2KLt4L8Mp6jNZtNWSFldUrbYVltfkkolysJfvDP3z0J@lists.infradead.org
X-Gm-Message-State: AOJu0YwtZArU9ycaekjt4OpE5S0MtUpbkFAMNDRZXIwFabUVsV5e/FAW
	6BmUiJbGs7u/T8ChiKBVO2ssvctiHrIEAWicYDhJhRiTqpSI2zL9qLm1UjJZR7dbDng5TxbK3KS
	KST4LwbLkJVH8MYrYNBpN7pbVjIOrLL4=
X-Google-Smtp-Source: AGHT+IF6Ubehf9UyFyN7R9CQHHKnaL2+kuEjm67boDEH1TzAwnXzKTEF1gwP+gQVaHPkySSPQ+49jv0HL03LpI29228=
X-Received: by 2002:a05:690c:6982:b0:786:8a25:9967 with SMTP id
 00721157ae682-78c18902a3dmr6870477b3.50.1764804025792; Wed, 03 Dec 2025
 15:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20251203061347.381-1-vulab@iscas.ac.cn>
In-Reply-To: <20251203061347.381-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 00:20:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnH-ZT+9YMxqZ=TV=0fatXSRcFkJMk-snEuRSMLdfD6PQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn-byFumMhepCmXCRHPlxHjGckHiBtylxRKGopQpAJ4h0Hwa7EoKago8dU
Message-ID: <CAD++jLnH-ZT+9YMxqZ=TV=0fatXSRcFkJMk-snEuRSMLdfD6PQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix incorrect type for error return variable
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: tony@atomide.com, haojian.zhuang@linaro.org, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Dec 3, 2025 at 7:14=E2=80=AFAM Haotian Zhang <vulab@iscas.ac.cn> wr=
ote:

> pcs_pinconf_get() and pcs_pinconf_set() declare ret as unsigned int,
> but assign it the return values of pcs_get_function() that may return
> negative error codes. This causes negative error codes to be
> converted to large positive values.
>
> Change ret from unsigned int to int in both functions.
>
> Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Patch applied.
Thanks Haotian!

Yours,
Linus Walleij

