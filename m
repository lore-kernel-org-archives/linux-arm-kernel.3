Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597FCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9vgkd0DO9ld4CriXjJK1r7oGUIIiZc0S6wFO0Z8nf8=; b=rKHqhWOQu8DdItJWkUI9P0Mdl0
	cTiZgtwJbd6OrGdEM+Ws63g4xWNzb/Ek7ncWdvOwnkkw55pj+9cGCx5BC3XvT4Gf8TclhrBGBDGDc
	RTbKuM9m4tiJkbVJI2LlNbWpRWqFd6gZaRKVuELDw613pD4QXFEpNXCFCO/zNQcNa7rmu2mJIvZ2b
	86igJDYVt+lPSEN4NwnTKgf1ic/JW/m7WH9fvjQH+wgfoM1zd5bc6opw+0nBoRtq3NVF3BLziJZSY
	pX/10L3wQznSZ4AMU8/MBEqoKksM6UoO7AMBuG6YSJfgGLtLhPChtJq2/3s/bT4ZyApyebbOYaAkI
	9wlOJ3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviG1-000000027MJ-28a1;
	Mon, 08 Sep 2025 20:14:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvepu-00000000mlf-0mlL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:35:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96FAB60054
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E6CC4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 16:35:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QUfi6Qg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1757349317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9vgkd0DO9ld4CriXjJK1r7oGUIIiZc0S6wFO0Z8nf8=;
	b=QUfi6Qg2IxLpxxdufJ8nhrwlM+UciMtybS+upuJV4RnioYi3nUU/LbBcdRHTFkl4cD/Cm5
	FI+6Sp1I1MjmV13sQv9vUvmnGfdewY58Nple6Ewof9hEZKqH/cwKU6ZZf1YaCXQ1WOit46
	gttqiuepPPNnRr0QC3AXp2XgwqsLSSA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 12355a5b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-arm-kernel@lists.infradead.org>;
	Mon, 8 Sep 2025 16:35:17 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-43835f74960so180507b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 09:35:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0ciHYFbyhD9xi8nRvUBxPzb0NzIbtzqk1m/4dyjrXInNcU4gsJNPJjT3erS0GCtKmWnIB+oXjQGiafvvWWyge@lists.infradead.org
X-Gm-Message-State: AOJu0YwxN4glng/LF6rpymYa/AM1VNTE6RGG5CcN4zW7Eg9kLV3SVDN0
	6k8dQ/4ReBheq9NJF3lR2IAPwQo7515MjbR+FQvDT+pG2M5HyPwkMWjjR8s7FXiHZZRPQJ3I4Ae
	WOitP6SRpgHb4Mv9XHH41MEQcHrqTHBo=
X-Google-Smtp-Source: AGHT+IE7fQgFT2M5TfL6hfVQrredcaZ/GbV/THM8Yume1F79jQqGz4wG7cG1y5QelnlSxkfYukb++fwfMciaqG7ZTM8=
X-Received: by 2002:a05:6808:1991:b0:437:d800:3c1e with SMTP id
 5614622812f47-43b29ad403amr4222584b6e.23.1757349316183; Mon, 08 Sep 2025
 09:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250906213523.84915-1-ebiggers@kernel.org> <20250906213523.84915-13-ebiggers@kernel.org>
In-Reply-To: <20250906213523.84915-13-ebiggers@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:35:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
X-Gm-Features: AS18NWC3VPTUIVFps2V911IsRcGv2esz89Ld1bpphWm6ntSx0SQwkxhIkBDwZbk
Message-ID: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Zhiqi Song <songzhiqi1@huawei.com>, 
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Eric,

Just a small nit -- would you commit this with the subject line all
lower case, like the other wireguard commits?

By the way, I have been reading every single one of your patches. It
didn't seem like it'd be useful for me to respond endlessly with
Acked-by/Reviewed-by, so I haven't. But I have quite actively been
looking through these series. Thanks for doing these cleanups and
reorganizations. This patch here especially is quite the relief...

Jason

