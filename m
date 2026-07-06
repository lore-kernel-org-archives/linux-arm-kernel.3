Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EL79Y50FRAVxmnnlJsIkErdepD3FvDl+N7VCboCkaKM=; b=MGnv2zPYcZIN4SJdcMm3UtAgYQ
	ZYJsnBpelnDuLordbgBJdx6R/G50tmG6eYh4ZipeD+W5gpM+MkH1WaMF/ob5/8/Ltp+cq9ZApnecu
	vvt170O3aompTlc7MsmXXJ6H4nB4CwZ0/+f3xt7Ga+fqfL1HkuXcSkzeMQ0hxTs7b/E7sVA/GCO7g
	rEoxM/fShXSdTab4h2LcAZ+nNp+JoLsRI3vI+1C0qt2wOhMDyB568jo6Z3Zce62A6bUPd3kh6jVca
	jn/fVdlxmTiY0x3/GqD/J2V9x5phtMu2o3BZYm5bZqd+iWv1/4NYuLnc4cLYEkU7PqsCIw/za94VK
	Wx1pnzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggTy-0000000CCYI-2V7u;
	Mon, 06 Jul 2026 10:23:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggTv-0000000CCWu-16cM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:23:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c7c61b5292so42193325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783333398; x=1783938198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EL79Y50FRAVxmnnlJsIkErdepD3FvDl+N7VCboCkaKM=;
        b=IANjrRo3H3cA3qG3cdW8MhieLcLuLu8X75mejotFePuMO84XQ/N6b6TRmeJmaJQeMd
         PDzOPn3F0HiAaJE1Gasy4+p26NXnGBhqEFLKxC5RPkgPujshHYoqOQsHDHK6CExJ+Tm+
         nnY23Ow0pOZIwtlmafjQ6F7LAkdg8X9kK54pqOxCcyBJxwIwOH7UtUIRjol7HJMbRXnh
         wzv37gr6jTd4GysS26YMXK7kPFGLZeu+UABd7tiDkganId/kerdsBjeArfGzF4Kr41W0
         nDZzt9rP6WhzBGJUmz0JxwluzwAzBVS0oHFqSowj0xaUa2Cj5TI8WYB70mMM3qcHugeL
         kOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333398; x=1783938198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EL79Y50FRAVxmnnlJsIkErdepD3FvDl+N7VCboCkaKM=;
        b=H6Uf3g97lwWfrY2FbOuqEbHHBL/eO5tinoQGALDxh4bdpw/MtO1CtLcoruMeeBHatQ
         kYpUYQbsd8rhVRWI40mT/AlY6BKIDVbfgj9FFK/A7cgtlMvgKDAjQ87oQzTLzSn8OFW2
         6XXMziHPxljSvHSRDwiFqL6DATQLAmxTD/rybd+lbBCGXTJI2X9xYB8lv4ighQ/7hnmK
         aEol4XICmCcgIWy62D6ChwtM7qYOZUVAPSc+WFIyh4xAQBhXmvWpBF2IqwT/jF04ZwEP
         bkPG1Hv1ItJRw05d/KwJvgzdCpy/iDw8ufZq9C4YSxMz5XdWDuCrkL3xjsSXZ16gxWiB
         DEmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfOsjEluvoUcIM4t3dA6em6684NdXrmvd6OVAdB6EsbLqVRsF2X0JNgUZJdll9jxLbydYC78mNTkPtX4SP9ob2@lists.infradead.org
X-Gm-Message-State: AOJu0YyyUWvkrGW0Esxtvlr5qfPmy7H0VqmM7kb+r4Dy/gUK2I29WlGz
	WS9fF78tZRKr0GCgH6CgMDLizUJT7ZM1Ktb0/VFRfPamOCzHSWnucP1z5xp/kJz0ULA=
X-Gm-Gg: AfdE7ckcTQ1mfmRyxoMTTOKH6mpGeXOfbZIWhtYIz64TCySo1DmzQykNlpZNuvdTzou
	kBjaX1rweEOTSOuOA7QyzjEgS4B4IhDZBgxiQWmNYCo756n1iiQsnGjxKVQUxMdyTyg5fA0LPAO
	INR/E3XERzs/Lxz3Y0UJ6/D/NsQjXzLUzucThwKQwyEMrTU07IWSo/D10mEcEFIhyTJzO4VWz4/
	Lvx+vdZ/2yqKuI+FtpjGxMxWOhsSWcXhp1/V5f9TRZeV0JsfcsfAh5Ka/kvLfodwSHR9SFnYu3e
	cP4b2+XYjA1WTx5Q1iPeegMxNrMVAmGdLn0tpG3mKHXkrRc6Rr+XpAK1FYrSLWxlJeYXGOyfq2m
	6j0lOqSJBnddAVqoZVaHFb6u8rHnk56n4EYjY9pAs6Ze2P5Q5Ycbkj9ZrU8WAo0smoC8YTaXYLZ
	m8eawkKM4uDk0Z4y+Du6rck5o=
X-Received: by 2002:a17:902:ea0c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2cb97e432afmr89665045ad.3.1783333397781;
        Mon, 06 Jul 2026 03:23:17 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3ececfe4sm61161044c88.8.2026.07.06.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:23:16 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:53:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: st: spear: Correct indentation
Message-ID: <gbafvant4c4cw5gw5pxrwpjjueroj557i2dor3p53z3jodqimz@cbiztajpiex3>
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_032319_308089_5DD869C0 
X-CRM114-Status: GOOD (  11.54  )
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

On 06-07-26, 12:18, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear320.dtsi     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

