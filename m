Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320C7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=; b=ECE1Z+c5bmiYZFATICbUusfmK+
	zT1NsschqjNv/exXgtvaRPJZixRh0yJ5fCCgFOdeyMqVUIBqPisbxBDV0LNrNH1O87QuxKpf13Gb/
	ZGGVGWb4XSkoFcGrPLZvNYzc6G+NRDww6sTn3EZUwkceONf/h9tI1llv5QtfYPkfhpqfZ5QsZxIyr
	IZmlg+2BA/zhzW+9PJhvyWyxAja2Dmx/TVD2eD57E0wkSyBFNwXz4gtQl4BR8ksxB3vlnKltG9fjt
	pbr7O6xmj8yru7RiKCcZMz9ZYFGfKtiuOW8JjfivVyhbnGQY/q4hrU+0hqc5gFiLQTIdxjc53ufKS
	drcq3MgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQJ-00000002u8Z-0q1e;
	Wed, 22 Oct 2025 12:58:39 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQG-00000002u7i-1NQM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:58:37 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6360397e8c7so6925435d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761137915; x=1761742715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=;
        b=gtuia/PVmE3dPtabCubMfjsFrT6eSoS6KjX8PJPaqCLFEemNwfgSj0dHqvSSSTwrkQ
         OHhCP3IhMp2NCAI2t42MjK/XfRqN409MzwiwjBSDfm9abiobJ6d+upt8ZhVWedP5Uaia
         gRf3PtklpeDrJRlbr/1qxFz/nDiTje/9sQPvpq2KwEDD5xmRr2ICvZpMGKP4DSJwoXFt
         /WHirjv1c2N0GI5EzV9b5QjRddBaKLD6MXJHVJRLDMazcBKhDcgGlrC01GXvvCyaMQEZ
         Z/Ra2NSmepKgk3v+iudTm2fsdQ/em2Uyn0TQmoNKn45qwVd7gZXupEOL/3lyH9jT7yyV
         Xi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137915; x=1761742715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjG53ExIK1WFjeDIAAZczTfr0kaW2lHML1A9qjZU6Y8=;
        b=jRboUWoxEwhaFm5pq1FhZko/V+dfh9R7YkmSnzIJoJsJZ0Q5bOMfHt5C8VwZq742Le
         K0CawtQrJ9HiPWXYHBWOYBf9lqQRq2F6bdJPe40WBkb/Nrv6ES6GlSXypH0n8FzJKcHO
         wxjtcCdADkcgqI8uPlIFDPhXprwEFk+VFcAqICkuuH+dyIFe/h6AYXePL5MDWp1xXQB9
         TvkS0daYJfybLrEU64D9Obd8KHQU3CoxuCpopMZicObM39z2PAe2XXXPBWXhU+NSQNjO
         jW1K31wxJnXyD4R0ycMPaxrPbgugSBnuHUETbRRUdEngsgAw/HVhIwibsU6Swf4t0STz
         wxnA==
X-Forwarded-Encrypted: i=1; AJvYcCXp1oOzPlSwW44GlW/DyLE+D3dTzvR3Bv+lljpSUMgTpHa2wgWNXjFMwhtOcHKybqkqlcQkvrW7k21TDfWzPAz5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1L4G5f+N+CbqI4O+wD0LhchjE9mXlyMxgLIe6x559ZzMTcRBD
	r4D98K7j2R7y5dljCoFW/G+WDG1H5xXrG+wKDquA+DLhgg658282WVWx35wOeGuK9GydPL6eTmt
	12d0YFMAWqbi8oBEwUdw+V/S7+3Q5if1aYq2Imm6N1A==
X-Gm-Gg: ASbGncuOqT3sFIyE+RF5cTCmYDV9NsCnXr1UI+mxv++BRxX5JDCDmk4Pr0eolpp5IaH
	HCmp2Iia34PaD4XmhoLOOLFrM7HXD6A8h3KTRN9plEI7BGYln0nEeU6VUvIBI6Reys95UZoJtFn
	1JTYjnBiy1UWJ0Oohmcu6Kh3hxUvrgArH6hUFHePxqzlosfne/J7aAULMfMte5ZOHTHutzhk832
	94zZ8DnqH2BN4XS+k0gHYZ1LQzb0K99RSUl5dwhkumoknwhc/Eti5YvVTRb3exi/VSD8SDx
X-Google-Smtp-Source: AGHT+IEpKfqQAP/glDCUgAVJgatRBUGG4LJgEA2qJzeL/hKIAfZyo7XzIeJETd/S1CbVK1X+8E38/575DImRXb9n0+g=
X-Received: by 2002:a05:690e:4182:b0:63c:da95:21a4 with SMTP id
 956f58d0204a3-63e161b6c8bmr15719971d50.25.1761137915143; Wed, 22 Oct 2025
 05:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250925143122.39796-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 14:57:59 +0200
X-Gm-Features: AS18NWBK_6SEKp0LPrIDEzZP10EAnrhsIWSa5DHPeYttYjGzKLOmquHgZnWl3Xc
Message-ID: <CAPDyKFq9oxUfdfF-TOGLgi7b4aYay40H-VaEq-s=C3F2eVOBVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pmdomain: mediatek: Add HWVoter and MT8196 Support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, nfraprado@collabora.com, fshao@chromium.org, 
	y.oudjana@protonmail.com, wenst@chromium.org, mandyjh.liu@mediatek.com, 
	mbrugger@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_055836_397072_1D5FB8AD 
X-CRM114-Status: GOOD (  23.29  )
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

On Thu, 25 Sept 2025 at 16:31, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The initial series [1] was refactoring the bus protection regmap retrieval,
> adding modem power sequences and support for the RTFF hardware found in newer
> generation MediaTek SoCs - and adding support for Hardware Voter, HWCCF Infra
> power on, and MT8196 domains.
>
> That series was doing a bit too much in one shot, and then a discussion about
> the whole Hardware Voter started, so I decided to split that in two parts:
> one dedicated only to the refactoring, modem and RTFF [2], and one that only
> introduces MT8196-specific parts.
>
> Since the refactoring series [2] was merged upstream and the Hardware Voter
> discussion came to an agreement on how to proceed (resulting in all of the
> MT8196 clock drivers being also merged upstream), it is now time to send
> the final piece of the Power Domains (MTCMOS) support for the MediaTek
> Kompanio Ultra (MT8196) SoC.
>
> So - this series finally adds support for handling the Hardware Voter type
> of power domains in the MT8196 SoC, for secure infracfg power control, and
> for all of the power domains found in the MT8196 SoC - using all of the
> newly introduced support (HWV, RTFF, etc).
>
> This series was tested on multiple MT8196 Chromebooks now for more than 3
> months, and works just great; the last test was performed on the Collabora
> MediaTek integration kernel tree based on next-20250909.
>
> P.S.: This is a v2 because the initial series ([1] v1) contained patches
>       that I am sending in this series.
>
> [1]: https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com/
> [2]: https://lore.kernel.org/all/CAPDyKFoe9=4KgOsPUX6FOE+yPxdUqAxRec5yKY2h6uFOeUvvDQ@mail.gmail.com/
>
> AngeloGioacchino Del Regno (5):
>   dt-bindings: power: Add support for MT8196 power controllers
>   pmdomain: mediatek: Add support for Hardware Voter power domains
>   pmdomain: mediatek: Add support for secure HWCCF infra power on
>   pmdomain: mediatek: Add support for MT8196 SCPSYS power domains
>   pmdomain: mediatek: Add support for MT8196 HFRPSYS power domains
>
>  .../power/mediatek,power-controller.yaml      |   4 +
>  drivers/pmdomain/mediatek/mt8196-pm-domains.h | 625 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 305 ++++++++-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  49 +-
>  .../dt-bindings/power/mediatek,mt8196-power.h |  58 ++
>  5 files changed, 1012 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8196-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8196-power.h
>
> --
> 2.51.0
>

The series applied for next, thanks!

Kind regards
Uffe

