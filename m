Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF49CA9ECC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=; b=zNbyl06/0FTZEmz9IZAeh9otiI
	be0+27wh9nTz6KDZqMzljNQEv6OQfJWsMukbttNnkRBB0cr6uXHLsm15rTdBR3AFrfXaxwj7Yn3/n
	8ZiOO5YVltSEgHZfarxzuRcBO863bnOagjI+6mSJx4HeKC+Hb0VH/UUrOqWu+XjnBK2F3uVHbRGZA
	trvYl08Tvp8xoxn83jKfgATU7Nmz6odzABI4102Ogrb8GktGYeYMA20h7YSt3Li19saLoV9qDhe1F
	zqhTNNNi2NQck6ScbVSoCMbF4cNhJXUwdUNuxnZTWxj8bVs4ijJ1bZ326TOhWOI2PxNEs7XTP4BrU
	o5HV5toA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Uq-00000009PB0-0oRx;
	Sun, 11 Oct 2026 20:50:16 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0Um-00000009PAE-161F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 20:50:14 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-67583c777abso1146707d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 13:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791751811; cv=none;
        d=google.com; s=arc-20260327;
        b=Z/qohzbVELDf4/54cmIq0lnfjtFW7gbZAANpUljJ0+J9WDRAwsvPKyRSFQTuFgdI2V
         BP6ZdlfyrlgbdVFTOPNTPbckzZzIS/PnislTGMLJTYtQjB3SvZL69fZ5aoOmCFPfiDMy
         KHHL7rKyG9jxZ0b6xiGf/f+qnD8Wu4/OW44fJWrH2yxeI8km55NabyyPrMwKKHj2zNiK
         742KOlKFPYv3Xq67KMCqkgKeM2a7f1gef/2VSA7c2q1Yjy5c2p/3tR57C5d3Qnn8CRQN
         0KMkadMjljk/FXDy00nAp4o59gPeJc0x6Sb2N+TeH6bkXFRcu/OPYs7N+G7t2Ylv8Vsd
         9r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        fh=O5/1YtYz9yDQhpNRoif1rkUCGAJulWlOMaALBpLDgX0=;
        b=lINr8Y9mOo7S1/DQFw4Zk8sExzgLJUhtGhaaKYCGrac+UcetgplJmS9gkvIk2ykEM3
         gjaTdKw6YyiZxs5P0TtqYjvmRCqO57mDA8smvQAJSwgCotGZlsMgO9OJtqWf2gFiN69n
         mnwWcumCvh+HX+NozZ36kdW+zy7Vfnv4G26njApHS98E9ZBA1hUf1/maSnfPMOdZnDG9
         L7sGJH0JQsJBvxAFxdJDJH1J19f0ha3W9OudaxIOeuVBlMFoXMUQjQkixLrYCOYsSwP+
         qOntvq1bIfwwUpgWuGSmZYR13F4rbHzfEUVJjTQ26/keLgZAEYO7jNSMKykngXt9hIwQ
         UBzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791751811; x=1792356611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=Bq5cTdhCAW0nwTkmwNwdyNIonGixsxVYds2eTeGdQ2XxJW2Us7r7ki0uQpkLARrLsQ
         73w2gEaaQrqA2PE7K/4bgvuyipHDWWonovr/kyHWsxTxxrIWHsTCaCBiCPsne/Ox073e
         mtTRXQHxdz4blkf5hTNK6w5asjVYGKd6C65FkD71e5IYX1Aa0WynwKtm/BoEAsygEd5J
         EIQ9dYjSWr4dNdxN+lcq0XD6A3RZJKZaGH+a19ZML04NnUmBCrBcKWhk48lqRaNbQ92u
         1DY0Fopwm4v7QtGegoxLEN/ABEUjOAIL5XXHb2Ivu5AYWJWVgibUmdU0wktNo7qKU6+R
         gdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751811; x=1792356611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc3F184YUjrOopP/BvFd/ZpML46lL0W1tVVXp9Yb9rU=;
        b=u3esq6P+SlJ3eycJPHwfnn70UIe+6XDb4vW6wsXG6m1fqOsHS8iNg/vNCWS82LB6UF
         oRsZj/Y4DK9vi24saWBvw/f4wU6aAeeMDKadNyG8C3oSWtab2uTCMYcw2w96ekBEIIuq
         YmuWpifnMcHqgN73gKX4NiMDGwgzJ4GyEEs7aU+aNVAZbzYotjYvq+GbvBOqe25TfR/G
         eWKzP6q1Tfc7U6vXO1rxXnFJpCYsdEVpoGm/C/UUoinsa56+FzoreDEyfbFZEeIp71Oo
         f4IOcvu2KqzfWWx9cgiwTDs5ohuvHzJiYIuG64xndtJaI56Wllpm0mpapCVeWgXlsoEQ
         +bIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbIyZfD2eUTF2ZSc93FuN59era/G+e1e5RhRkjLvyJYdre6Ld2IHIy8VVsNwRIFWEU6C4kpaGbITC01jnLzjiC@lists.infradead.org
X-Gm-Message-State: AFq9FYIH5LLLswes/OX/kEeMynNti23aqV0vOku4hVrEqH4n+3fpxH9Y
	ZSFHx8+fplDxhLulFbvqeXb8nWOkMRS6+n4Akd9+lHf/i9Q2NViPgtC3bD565oKOjdQrmbm2e7E
	5ioV65XeCPaTvYq4c+/Bcp78ezZUbW3c=
X-Gm-Gg: AYBFou2cZygmOT/ieh2Uem6xrHSTxYBf8uv0dzyUaE+OrNLgnC7vd70Mj3FpxhF3g+g
	bbKc8HFVE4Jdf5Vu2Yuun1IJ6m2kYTDI0Cr5wa3BMuqV6S8KRN6c5ZQJjCe7n4TouBI+a6MSv5n
	F5insaVPkRZ4q+RDMCMVadwlFe5J/l8Tssg44m/1JV/Qgzn42FG+7aNE7may1nyKD0DuVxsdnUc
	z0ZdLXRyNcVA5jxXJmX1LaErwtrfI4De355InXbAzlWR/ryLoFDT+dZOV+O5X4V+woyr2tZBYFg
	vmYnzQYbKf1dyzaMSG6hcd+731zmyhmkndi+yRRxuVSr5E1W+aHYDNz/VKTeRuA2eyUoYp8tF4g
	CKrSvt1iYlhS1
X-Received: by 2002:a05:690e:144a:b0:672:bd30:83bd with SMTP id
 956f58d0204a3-679369c2fbdmr2874224d50.49.1791751810698; Sun, 11 Oct 2026
 13:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com> <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 22:49:59 +0200
X-Gm-Features: AclHuK_PzKBu8m_ohCyUp7PhTYe_NgQTHs4WyLsmyGpLktVRlcmdBIs7NzTNljY
Message-ID: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_135012_314192_16616EC0 
X-CRM114-Status: GOOD (  10.24  )
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

Thank you for your patch!

On Sun, Oct 11, 2026 at 8:31=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:
[...]
> +&eth_mac {
> +       reg =3D <0x34 0x6>;
> +};
Question to Neil: should the eth_mac node be moved from meson-gx.dtsi
to meson-gxbb-odroidc2.dts?
Odroid-C2 would be the only board using it and u-boot seems to derive
MAC from SoC chip ID/serial number instead of reading it from eFuse
(so I'm not sure about the status of MAC address in eFuse on most
boards).

