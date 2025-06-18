Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE0BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=; b=ZFCd5wTfOCbaNjpmxc88bb53I0
	Jf9z5FeRKwpEfBuAdKKPXy9LT5EgwjRdDiGiF6SHl0/BvHlEGA5/RX+fY1mqRgzKcN4kb37e8//1G
	MzrnAydaV0EHAzEO/Q8+bPoJ4N32koBMbH1ikEiicuBvZzj7a/zyTFK0Xb7R/Hp5vMeBhWbPuKj86
	2mlRUl3AnHZ9F0tAqs0gGFzMIeY/aqwfj1RTwzEi186RORfpYHakhCeuMutBl+yP58SrnktYCszSI
	xq91IC5sN5ITisHQQ7VAsyQiodu4rAuD9WA81atdH4GAxQY1JHXZ+xbS/XjZTOlXX06EBMk0GpO+X
	BbcYpTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp19-00000009ZWR-37r5;
	Wed, 18 Jun 2025 09:23:39 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoyN-00000009Yq6-3ohL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:20:49 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32aabfd3813so58767361fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238446; x=1750843246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=c1u7kJMwnmVnHIbLAidB2aSa3WEgIHYe62K52qPmiiYeI350peJM7T0/dQTk90orC0
         pd+rWvtvFFqfTmbeCkb5yzXK7IP+zzTApjahB6OaSSP75//RcP86ETinj1aFC1uMrFb+
         1yVN79c2TT70Cut+rlknsrvtC/KlcqYhy9flE90FqgmprE8Adju/rVSSJCxQwt4Xjh1F
         GllZpU0K1QNCvY1PCDIUGweZu0EcQBz2X3OBZ67WLNJcUVafihatbfh3INclOFYBX4AN
         N7lbGsE8esAE6j0w2Lh/QZQwY7XLSPl30c2p3Xfjz8VY8yrmjzm2dm99HgSQTxyhpRaz
         wC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238446; x=1750843246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRP+3CAFUW4BsJ0AF1rbBPjb6qCHBeVG0qqt3MSiEw4=;
        b=DBjYF3fjZJfTyQAxrR5QkfwgOzzgmru0TySvY5HXQ+Ga3rXZqd5Qb6zpCu3p9R/Dpu
         cENSUzr1l++TfAiUugYVEU/JPO3ojyvXApU12rBtqRnz6xxMvF0jCUB71uPw9TzCzpBR
         KACdrxFiSCechTvjhEf+Fg1ST/EmbughZyUKQBXnyh+kgS15SXTaDZdxNqfwA3QLqyiE
         mSUqthfLU9mZ/TBg8rxzOoUT/5+RC0lGS1wcBYASmsCjGDChre5ffso1UC7S1p2P57b7
         FaqMnwmAfVsKNoTiieqi+1EFEvsDJgd+sLaAwYjZH4nQmtYM07RDthlXLJ3qCe4+J2ZQ
         oeDg==
X-Forwarded-Encrypted: i=1; AJvYcCW1v0zzfQIirI3sdh5jyMk7hEcIRYhxhwXu702n2gCBBOk4i5lgJzsjBEdzntgqXC9DxGBVodmVl+0lSEYi3zvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfIBsQubYQZBMi+D+M8jufzjDv5qIfb1fQprAmDEuAxqqyFLj
	APWMEYOdWdN20bN4T/JYWem8T24y9lcWMWWxrVmWjGFkk69tRDRmrXxgDwGIuVEqyGdp3h/MTVN
	e8+BONUrFEldUVeLdWj/nDo1a4OIPssHfAF666Rdcyg==
X-Gm-Gg: ASbGnct4qDbQhjTdWQ5lD5rcgKm67grdLL6Og+4SdYa1zKoaOhlxb4spdXj7mVIweeQ
	xJ/NClSvmXmXDm3sx3/KYnJk39TfHpUoVhqnLFINK4cRj3NgLjqT+jTMO7CNApoNRv8rz8qSUFg
	TgYJGNsxW07lTyjSBJsbYHgXm9JN2oTJbZWysb7O8+5U8=
X-Google-Smtp-Source: AGHT+IGYHmwuRCbsyGw1J8Pu6GUbhDQ6w+nVs1//AI3lpbzQb9Bb3dDWstkl4KwszZdq0G2erWbc3Ga3QrnKGmbGGhc=
X-Received: by 2002:a05:651c:1a0a:b0:32b:522b:e446 with SMTP id
 38308e7fff4ca-32b522be65fmr41755231fa.10.1750238445710; Wed, 18 Jun 2025
 02:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250610143042.295376-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610143042.295376-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:20:34 +0200
X-Gm-Features: AX0GCFuWBc_XYewjnfwAEfEgMlAZ5vMOVJJK7KgI8KvNcDIipEswDPcxuF3xpvc
Message-ID: <CACRpkdYVaTvArLVNUYf41nm_StVkWT0CMmTxheT9ovbBE+PopQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: stm32: add irq affinity, RIF, module support
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_022047_948335_17BFA453 
X-CRM114-Status: UNSURE (   8.14  )
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

On Tue, Jun 10, 2025 at 4:32=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> This v2 is a subset of the v1, split-out to simplify the review.

Patches applied!

Yours,
Linus Walleij

