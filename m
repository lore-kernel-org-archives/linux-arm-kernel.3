Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36234CF31AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOjKGZlnAXgjmbnxI7QvaAPBMson5j4nh4MkPbAPAEs=; b=NzKIGg9aGqfYC1sCKCJkaKDm7o
	aicA7ewLIlpJYB5VUgSZlr4O3Ate6Go3CEH2smJS/fc0Sb+T/8T83NnG89fyV/XsYXQxoSEGsTrZ0
	8ypPHI0vODfOuNSHu6BiFbNSoSSmDM4/L203eQ32L4dVdChoEVxcHI4g0Sa6TC8F35mvuLTnXngVx
	L17NUaOH7AvHJgVpUHPvDa/Ce8k+fu6aBY67gn+4dv943OE0IeZhQTK3tpxkdAdaqTEqemmcGGRhR
	SgNZgZ+Ai+gjk6sD1vpOUVtHi9f3Zsy45niRuPNA008Kb+NRAH4xpd0fRPE4/Fu4XS4KLiDLRKUBi
	dyQF8G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgTh-000000032c9-0CRs;
	Wed, 19 Nov 2025 11:36:01 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgTe-000000032bE-1WrG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:35:59 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-37b996f6b28so61666441fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 03:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763552155; x=1764156955; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOjKGZlnAXgjmbnxI7QvaAPBMson5j4nh4MkPbAPAEs=;
        b=Y3T5/DweI9rOJGDgcO7unfiRndapxgXxFfksOOmvuabLPsBjN5erAO6LOuHsRNS+rs
         SCI2kRuhS4TdmV7PhKQ7LAJh6krXkLzXz5kkV9WtGIX14vJXawCIc8Oz/Yfv2xK9UTmd
         00o6fmIt48BNhDKaxZu3JR76rKoYricAuWBnbBPJepFhAqK9dZJT3HVhCJjdclGNU96l
         dpJpYfOvJsHp8rqqG9kGLAeqWcIjt1BZ1nVy1LEk4ZBDW6wCuzOK7SoKrPei+xzvT58v
         5CpTTcOI6W46gXkGBdi7Zkm2vjSKFDAR2s5k8jxu9EQVb6mhSxdk27M0dIwOMVy1XOd0
         1ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552155; x=1764156955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOjKGZlnAXgjmbnxI7QvaAPBMson5j4nh4MkPbAPAEs=;
        b=ChGrvVXbP52WoewPLSsyM+M42OUyWjICTQ7zCu5s4wNUxiV23rJSuEZmoO4lFfNI2V
         pWeO3XJG5yiWIT9nj+lW1U2ChNxi30pknT7Uy6KrUX6YqW//Elqd14qFj/ytSRABRp48
         Wq5LAulBDOf9K9z0NaW6e1K92eE+Lc4tX09HybfpTW6solgQB3W3JQP5T5h5TshSLqb9
         /MBj3KvLrgGUj9jWPpffvgGLeduG7qtkFDZr6JXsbb69pqf8zY6HDdgu4p5EbGoKcZ3P
         +6IuA4B2FscP2Y6cRQt/h+xRYypGNQ2CO2vyFhxswvSskEKXkelkNV353QFNxSGUTTcA
         svVA==
X-Forwarded-Encrypted: i=1; AJvYcCXahqw9SK7E7/Y7lJAhOmXbfX5Gbnj87OADsDU/66G/d4iF9KqslFNRDPPMC4QXApOm7oCe8P4hC1F4xRqnqaiG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaixy7R929b497osBvzpEqEUPvkEUgXEllmbHUwbWnH6NVMf2v
	fGI21wZzvA572ub+BcY9BBaS7iH9msssly1ZzHIT2SdjmS3Vz3Sxtm2iTsBKz1mGQlG1bxpIMiJ
	fJddPh75MpPWhYFuTx4s4sNtzfi2K+rg=
X-Gm-Gg: ASbGncsr8LRKr87+SNVsdUtdPSMsOTBCUSAjLmDW7X4CbDEdvnfBJRHtR94ykYAC919
	PLbQPb5vWQ6VxKl0jnt9I1kKnYYgXZE90crwFK7sxkuaInqC5JGQVv7LYyUIQH9czcN8VYx8GkR
	t/DBEq0JynYr10l8ZcX402gj+yT0pEwAM3q1dAEZ8uu5xkSc73P9y4lXlkzgRoFZiq5P4pFx1m+
	vOGSZhF0Q17e7NDkHQvBSJ4uvP8i9epu6mLHrYwnmAPNRqGPUXXWJ7Ply+PZYyNjk95YQ==
X-Google-Smtp-Source: AGHT+IGLB87l3c6YQaMAVvCIZHa9Iaw20ytZFxmWh7hR2zupdPWm65PeLgAMP+NHumhl01ckY9NXDPo9Y80ggn2lAT0=
X-Received: by 2002:a05:651c:20c6:b0:36d:4e3b:f1e3 with SMTP id
 38308e7fff4ca-37babb619famr41318181fa.13.1763552155407; Wed, 19 Nov 2025
 03:35:55 -0800 (PST)
MIME-Version: 1.0
References: <cf6e08dfdfbf1c540685d12388baab1326f95d2c.1762165324.git.xakep.amatop@gmail.com>
 <176307584246.496508.12079514999315183214.b4-ty@sntech.de>
In-Reply-To: <176307584246.496508.12079514999315183214.b4-ty@sntech.de>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Nov 2025 13:35:43 +0200
X-Gm-Features: AWmQ_bneNTA_MoPN6LwNuV_BB7nADqcezocvI0r4IOjj8wtQr6qn-bFxwXAym-o
Message-ID: <CAGeoDV_R8GBSs9qjY4772ymU=LsLiP=LTTx2-4uBLkB2PAuVhQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V
 regulator voltage
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Muhammed Efe Cetin <efectn@6tel.net>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_033558_442153_475F6F90 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, Nov 14, 2025 at 1:18=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
>
> On Mon, 03 Nov 2025 12:27:40 +0200, Mykola Kvach wrote:
> > The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V rail
> > for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
> > regulator-min/max-microvolt to 1800000 (1.8 V). Correct both to 3300000
> > (3.3 V) to match the rail name, the PCIe/M.2 power requirement, and the
> > actual hardware wiring on Orange Pi 5.
> >
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
>       commit: b5414520793e68d266fdd97a84989d9831156aad
>
> Please start new threads when sending version x+1 and don't append
> that new patch to the old thread (less confusing for tooling like b4).

Got it, thanks for the explanation.

>
> Best regards,
> --
> Heiko Stuebner <heiko@sntech.de>

Best regards,
Mykola

