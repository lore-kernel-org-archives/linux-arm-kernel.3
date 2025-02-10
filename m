Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0B5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=; b=UmKPBr4hhBZriNNPVm9jI/8B9C
	U3rl3Y567KfR2QlKpkgaoCcfQmwSs1xwWJl8rTNuTtFpXrHATyLcF59+u2wIPCJfggnDGq9Ua/UpJ
	K3CJS1+TPZqSLVQAfHN/qCeXjJSR6RirRIURE4Ba3qGt07dOtG0fDQ5PtXBiGwHROGrJb4mUM3rc2
	/bQfWmxiwIh9Zb2dhfuKG1Qct1ITPmDQ2dOSON1DBy+fgjzDO1PXRRgERjzhGw9hxNT93xku1xHTn
	PA/iqAd/Ne3UIZoz5EZSvhRaUbs+b2Bs8TqKZawkAikyQP9lXegB6jbbksmJM6R6Cx+Nn9HONQV4U
	1a9HnpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaqO-00000001QAg-0mfA;
	Mon, 10 Feb 2025 20:57:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thao5-00000001Ppx-451e;
	Mon, 10 Feb 2025 20:55:07 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab744d5e567so945032866b.1;
        Mon, 10 Feb 2025 12:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220904; x=1739825704; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=;
        b=UV4sLjoNPqiJtvDAF1pCWKy/t5cMogCO+dAGQUQ0cq8hoM8MQlgGgdEpFV/07LUoga
         e+YVeAhhXiqy5JPprJfVvX6Z6lvqbfEOGG9fY1C0beWzYDF/DgxF3mODz015FFkA1cQ/
         W0XkxuJKjIeo8PVHeNVj/dL/iO4Sb+cUEwrsx/89erRTQo6U08xBrIYLqzbWtzeN+FDq
         r+Gb1XhuguTYvAZ6OzI8uFdm3AxDYDhX2R4g8o3TRLvQss3WlnSpsErtANw4wCKvnw2/
         6m97iwTFW/CEUV0EIWQMqtHKGS/zi/wjaYZ0SiUWr8TVQAkR+MVRsmAzgyOVyKdlh1kd
         /V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220904; x=1739825704;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpjZBk1tco5NPGp1mA5Zogy2Y/Xj4BgJWgEyk1N9n9c=;
        b=LrlBC3i+3c61Jg5dHLSd+eADDc+DSkbIfKjY1kfcaxtTdiHLa7KA/Nke92dTNbPpe5
         OK/x9JZNjSJl+29nIOlgYYu8eZN21RqdCiJIQ/oducEW/5oOiQwNowrRR5aPvPG1P0ea
         R9IYYE07w1W+4BDJrlOtsY1Xxr1fWNUlBBp902XTQjcdwrYlm9HQa21UGz5xKE8qUulM
         UYI+cezsLX0e7s1mZhYxXtHSIGA0EbGmb4AgWWwv61JllA5NKV8bY3MxccqC1OXR/zKm
         6toGVgF0MgBskNTEUv+C32q0/PX8qm6YjxFol+9m1cguHZjsFM1tCRs+UBM4N6XR+CLE
         JfLA==
X-Forwarded-Encrypted: i=1; AJvYcCU57nYnU5gl0J8JXdUReCisB+OeDAH1eZObHS76vrIpt+wjsJL29a/IzK7YbnfK9a/nEeI4QzyjHaGS8E8=@lists.infradead.org, AJvYcCWMKLk+WCumVcJn6zjhKW1060ZpNLOmI3LbcZOsP7mp7A5UFCFxX11Bd86zu+r6B1fr5+SZBTtTVUBgHmFED0W1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/GVpRKYLZ1uB6ZJzzhTSg6kVbQr6nU34D/Q80f5oTVVHkjgcq
	WYvJ7N+ZhNBGit/tilUkijLSJ4R+cabI7hDu8Q9XQZRmrgEu9xWo
X-Gm-Gg: ASbGnct69rTJWG9gPcmmFkToJIebPt3f5HHgocCMTd2rJtDrRR+rQuC3jz+TXXGF0/B
	4iJCbJ90IRk1ntWfQ3f6fHAZSXgMtRgiwneBc+PNuFmiqoB4qkQvF1qGQt6TyplIo3Wg4cu/zoj
	3Y+VPQC75eeMR2xGogFmRyKfGeBfIxYSPEo7aCEKebLHN1M9Xh5ezMCSDEXjluft+3ecQ1Y7J7M
	IAzmv60/uR9BHKwPuAkaOvV93I73z0Y69jwv7TiqbTm8LN3lZRi6fuNLO8SfuWmTqWSRdRQFlCI
	65XMLIP3bCSEfL5xw9G3HFD4pbl4SM7t
X-Google-Smtp-Source: AGHT+IFJYUVYcZgeTbbOIf2IE2QjryPq2pdJRg1RIOBNc7TQaHZymLDKrGCSZgTlknghtW+yN9uTHw==
X-Received: by 2002:a17:906:c109:b0:ab7:b9b5:60ff with SMTP id a640c23a62f3a-ab7daf01893mr82813066b.2.1739220903984;
        Mon, 10 Feb 2025 12:55:03 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cc737d81sm179019066b.176.2025.02.10.12.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:55:03 -0800 (PST)
Message-ID: <77c0db160bcaa7c2a68c04a0d33a561b2834f764.camel@gmail.com>
Subject: Re: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org
Date: Mon, 10 Feb 2025 21:55:01 +0100
In-Reply-To: <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <eoeyutuu4mrpsu7snkk5ll6kmm4344qsgbnncss6gerlcvvea7@usuf5v7w5ffp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_125506_013200_1579E7FD 
X-CRM114-Status: GOOD (  16.03  )
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

Hi Inochi!

On Mon, 2025-02-10 at 13:33 +0800, Inochi Amaoto wrote:
> > It would probably make sense that the whole series would go into SOC tr=
ee,
> > even though technically nothing prevents the reboot/reset driver to com=
e
> > in PM/reset tree. If everything would come together, `reboot` command w=
ould
> > work out of the box.
> >=20
> > [1] https://milkv.io/docs/duo/getting-started/duo-module-01
> > [2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
> > [3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v=
1.01/sg2000_trm_en.pdf
> >=20
>=20
> This reboot implentment across the RTC and 8051 domain, which is
> still a big problem to be upstreamed. This should be designed=20

Now I've got it. The problem is not in the reboot procedure, but
rather how to model this thing in the DT, because of all these
unrelated functions brought into two HW address spaces...

> carefully and needs further discussion. Adding these two syscon
> compatiable may be not a good idea and cause some problem. I invite
> Yixun to this talk and he may give some useful suggestions.
>=20
> At last, I prefer this goes to an separate patch series, and
> implement with rtc device.

--=20
Alexander Sverdlin.


