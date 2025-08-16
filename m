Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3EFCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 17:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+5JiFhhalBPjoGGIh6ZSZXsJU98iPlc8m9JpyheZsA=; b=gYCR7QlAGHx+IA0aaiUds2y2/7
	GAZX9fsKnKVvws1heg7dsiuGEnnvc+3YyXWnAG1KKJGkXnsHULRwds6oLcA4DBA9ZTNCRBA5LzLU+
	HhbDxN9l5P1wfiszVJd6EM3/oF8gdM5XD0K6CiBPiXPRDpzmV/vxpElt0Wadjp3wco8l1FOsl0Qr5
	NG3H+7pJkPYKTcU62PtiDptxItjsZctAxjnVYuZ/Qe5TMAsSU89eJ/rCpbuTJbrU1Eh8Y5Lxg9fdr
	Je3lRH5G3hvBI4AbJP4Pmg3Wj/tJuaP3SMcFTVXpjYEZCfjY3YVUtuaKnke56geXxDZFWhoUP3JZI
	e1v3Gz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKl9-000000051rw-1Bld;
	Sat, 16 Aug 2025 17:32:03 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unKiX-000000051aa-3FEI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 17:29:22 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e93498d41a1so34442276.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755365361; x=1755970161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5JiFhhalBPjoGGIh6ZSZXsJU98iPlc8m9JpyheZsA=;
        b=wMgOvcVDNNAaLrTCsOknBKn+ChrJYa+yWGhvNMy7JiT2+KOPe0ECzuWOej1TEL9rcw
         9n5XGIIQGL82xal+hBNTbzRwKMneh6XR+RFdz+RM6rCei8DupmP/T+lnwwgDbiTViTIx
         l1YlZae2ehmTg4t4j4ceeBb7Gl7AEgCyNQapOXi1RY6+pEvSsCXiT2hJkeuYov3RwYgy
         +GQUnXIrtSxBKhi4bec5k7uBIorV3LIkjs+xSTLhJLu64aBVS9JwdpPEv12AeRrAz52X
         sQ3X7UKbDyBxZq35OFcgNlMsVDFfEC4KcvpBpZLEM08Tgv727WISdqMKKLN+ZkfV42GN
         FBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755365361; x=1755970161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5JiFhhalBPjoGGIh6ZSZXsJU98iPlc8m9JpyheZsA=;
        b=S63LATciNBiV4syhUG7spXWYdO8aBbgAxBri6WupEu0sIXyZWkadBMW5754zTXMaF+
         og/AjcrWLcEZlA43aCsdBWodPXA5YNOwgRtK6Aba0RQ0kEdv6fgEmSuAXVhuMinxwF4E
         VR7A+wviW6t6WFG/q7Ml/3Y+OjBOP33HbIUvOaxHTvJiOUe7MttNTgiSRqYdlEe+dulB
         hD6OaOuyRMIqdM7NmVHazK/u7BHFeDoSXHhexMMgwwJLRMe78HW4tmIuU+5Jt21lFRUS
         EA5qD4Q3Tn3WAVahto2IhN/BWC024IAI7I8bg28fqK5mYC8xV0OiEIDti2hdDM0eGNhB
         FfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1t8jrqYA1xCqgrkXs9Ospqn2Zo+cv/2bXo+xX8kavYXvBHX8KDKt0LPDih+NhobeIkH2CYck/vDQKb2LcA8Gn@lists.infradead.org
X-Gm-Message-State: AOJu0YzNUC4m58Z8TQ/aIOLI6asw15NMoqXUP+y/TRSq/fKMxBZFKITH
	VaU+XJ9SZ6AmphaKfXGQE1+Nu9cH6Gbj3uNoN+onI9+C3IgbE011pRhJTDJKYe4VNq8T+OdGE6m
	9oiovoYojIX1WTKm1BzUrKTnqXqU6djskitGZKCThOA==
X-Gm-Gg: ASbGnctSS/Eyv3BJ0Mx2o8bKyjqCjyhZ1t6KRz9sKktkRybxa1N1BUtcrXJ5v7ezD81
	k07W2xaGgsYwd9uUa1+FSTXzcZby4MyShslJwflY7L6tjDS0R4lubCqtIDtygFjVMk5QdycMQSi
	PrQjxP+tY/8IGsAakRmTljd+gP4/AzqZ9FEBsvDoyVjTaCG6WqcR7oyFzAcgMJz2YOlT0EWZ2WT
	0D+BGwou7KKY06/
X-Google-Smtp-Source: AGHT+IFKBARxb/1Lma7PB89ED/9p/HJkaU8vopGLHCicm28KuK1UNdWyaBAVqg1jULjq8b+Am2EYtjOBcHLlU/v8Sbs=
X-Received: by 2002:a05:6902:1388:b0:e93:21fa:9945 with SMTP id
 3f1490d57ef6-e93324ba44emr7765313276.38.1755365360807; Sat, 16 Aug 2025
 10:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 16 Aug 2025 12:29:10 -0500
X-Gm-Features: Ac12FXzpvr6khCWsphPS4E5tM2OfJSpyb2n9DVhgj-nq125n0IzPALBV0Zd32A8
Message-ID: <CAPLW+4mjOmi4BM2zOPcR6GH=4ngA3FisotqFXXGAbHOghQ4x8g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses,
 except spi
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_102921_815411_B541B258 
X-CRM114-Status: GOOD (  22.41  )
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

On Fri, Aug 15, 2025 at 2:05=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Hey, folks!
>
> This patchset adds serial busses, implemented in usi, for exynos2200.
> It's missing spi, due to me having troubles with reads when testing.
> Serial_0/1 have not been included in the patchset, as it seems like
> they're encapsulated in usi blocks, but are the only implemented
> protocol and/or do not have a dedicated register for setting other
> protocols in a sysreg. That'd at least require patches in the usi
> driver and bindings to add support for.
>
> About the naming convention for usi nodes, I've chosen to keep the
> downstream one instead of relabelling all to avoid confusion when
> cross-referencing the vendor DT and to keep consistency with clock
> names. They're labelled the same in the bootloader too.
>
> Best regards,
> Ivaylo
>
> Changes in v3:
> - drop the serial_0/1 patch

Why did you decide to drop it? As I understand, having a serial
console enabled can be quite valuable for this platform bring up. If
you don't know how to add the related USI node -- it's ok, can be done
later, as soon as the serial works without it.

> - add r-b tags from Sam
> - increase the size of all syscon to 0x10000 and not 0x3000
> - change description of last patch to be more meaningful regarding the
> usiN and usiN_i2c mess
> - s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention
>
> Changes in v2:
> - add a patch that switches address and size cells to 1 in /soc
> - adjust all new nodes to define reg props with 2 cells in total instead =
of 4
>
> Ivaylo Ivanov (4):
>   arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
>   arm64: dts: exynos2200: use 32-bit address space for /soc
>   arm64: dts: exynos2200: increase the size of all syscons
>   arm64: dts: exynos2200: define all usi nodes
>
>  .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
>  2 files changed, 1398 insertions(+), 37 deletions(-)
>
> --
> 2.43.0
>
>

