Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9856BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=; b=VkWWwiy+F2Sfs9UVySIhhj6YcB
	+V5bF9SdZhyUVmk0746lzrArJGTNwiEusP3+vv8mWB2m6+C9zXs7TEK4w75xLu+aHACa9uBLA/PlG
	JITCdOSQ+Hz+CGLS8ZNtyAEZ0BJZtOuiKVhGK0oUozuA9TSHUj3yr7OI4vCKCGFfSCYXrYkiFZhD0
	NGhuuzOl+tmHl03TroV6+1X1tOHnJQmrhARTzUmfk8YEQDGC3+lGAJOOci+1SQOOp7D3+Wnosku5G
	MvEqB8B1XAd2OWqNoAY1NtdvN+TA7DugFAF5AQjrsypod0jrW16sMrQLXZZbdDryzeskOjHeSGAF/
	eaVB5VtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Kq-00000001Jh3-2mhz;
	Tue, 22 Jul 2025 05:14:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5IH-00000001JX9-2h7I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:12:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-558f7fda97eso3691547e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 22:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753161120; x=1753765920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=;
        b=Vi6h8/CClN8WPbP/lLu/nBOkwhiPD+fM+r8/pEO0iW/wMWzNPtxT9Zm0w4qyMJK/Dx
         NsN6xojNzg+YJokU2UDAfqZKX/yjhpP2CTDLvBg35uq2hAqZ3JCfdrpMH2RL6u7BM51l
         iXdn+hN2STz18a5BypW8WutJAsErZWGktM8/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753161120; x=1753765920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cp7QbS0xMvkOoKs4HA6eWBnh1DAtlgpSHTgAb9VZb5g=;
        b=AzjPsluwF3AlBmTAzFllQDkEri08cLWz0U4RIDTJqe5Npl4iBASW2Fi5Y/6MEM6rY8
         LmVtecgfSG9oc0j57a7ftISQfUMPQDn9nb0FKE7jUc/u+av1EJWxSnZhnej9kemfui5G
         N/JDVwRe8zzvOtMhj9sL94a/cWganvjG8z0STBBSBgxsey6ZOB7mmE37XMjOj2A7xH3b
         IMzMdbaIJd4rpxLVzEx/CYDia++5qmo6aAoRlBjDnhgYXtfuCWvVMX5Ao5ZMfdtPLpVm
         KBtRyWsfr+rhDgBBnfhaTwa3YmrG81WXJ22ANLphXNRPPbjx465isCWhxx/Pt10m+1tT
         2sfg==
X-Forwarded-Encrypted: i=1; AJvYcCW9+ESn6ar9iGJRXNMg+DqProRtBlY6JXEQOxlaSjombMYE7/GU28wfPqCgaLKNemD8t1OvhmRH5GbYULJfwXN/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzupqxkj1YklpVKkKGoUcokXKDrxUDS3ucPBznc71/VpBHggFv0
	G2auyBgvp3V6bTPMfmoD87KfEfN+UGaMlyUC64gnH8BWehaG6JRRJ7SRMz4RaZf3zW/ANd5aPgm
	cEnLattJI49sCdJASGfTu6WP1/TWGQllplIDi5gpA
X-Gm-Gg: ASbGncsxfkfL2QFUNx6QfhN+eplF5KKA9NZRNdabP1qJzjkhrqWxP2qHKq3EYsn4TRQ
	tbMGubBDvnNIGNqQKSRGOTE/06FLrIphzZeopyeDv5a9yAgxdMfLeHOaOiHIKqYRhNzgkNvOV/R
	UNlsjgFY/uizXZPGEltImClaIKdWzMbppfxcaSQfIWj3K/zQuKTbJ5EdXX8qHrNW3Z/SGS7usTi
	MaS5PKUZnXVQGZDIQ7xQPJeTVrTjWdfVsw=
X-Google-Smtp-Source: AGHT+IH22/vbUKUG8iVF8TLU3Pr09FJMHHQB0cP/VJ/YH6NAlscN+8Vsgqf7M6hY2SpFOoAipmEJQYGQAxTIjPOplEY=
X-Received: by 2002:a05:651c:220d:b0:32c:a097:4140 with SMTP id
 38308e7fff4ca-3308f2bf935mr75562221fa.0.1753161119744; Mon, 21 Jul 2025
 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com>
 <20250715140224.206329-2-angelogioacchino.delregno@collabora.com> <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
In-Reply-To: <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 13:11:48 +0800
X-Gm-Features: Ac12FXzrJFH94VROkFmS93jdH200nA-PFU34ujXfOAcSOpzNe3a_1b3sR8e3Sus
Message-ID: <CAGXv+5FAm2zwnVZ2+YHiSJdMoByUh_UV3j4yNTmo7Ngv89Ck6Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_221201_910332_4C149E98 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, Jul 22, 2025 at 12:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks.
> >
> > This chip is fully controlled by SPMI and has multiple variants
> > providing different phase configurations.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
>
> The descriptions match the datasheet and design notice I have.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Maybe the supplies (PVDD[1234]) for the bucks should be added?
Not sure if the control and I/O supplies should be modeled or not.

ChenYu

