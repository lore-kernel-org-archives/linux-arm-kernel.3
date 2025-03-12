Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D504C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiJA8cEstxgkTU1mTKMy0JGKZ+R8iGVjaXw2iJxWSRI=; b=C0foCTUVATXBytNgCK6sXxedLB
	meCSERg5bQ3J3AeWKP5Wy3aKqn5gzaknWSgj/ntdWqkImp65tYHyovyGStHeOwlSS7da0OIjxUKYh
	Ex/sa3RROa652lzdsR8xhj0YeC3QpKUs+C68M1ogIck8MkIZSstHavgjun/4xSRcLRHvzeZsUagxK
	zorIugvrXvRI5qnp7tcDj5dkpZqqDgmervhYtU1UxL9OW8QZjSczrKxtXuyY3IEu2oGKD6zeHEW7x
	ow39JbKPh4OdqNosAmHzVW+lE+E21JIPX9PrV0mpP232ZEOg2W27NTQO8C2rOXXGqMuBE5CiPD22t
	v8JMABqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL8v-00000008OWB-17SD;
	Wed, 12 Mar 2025 12:25:01 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKDT-00000008FUM-0Gdu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:40 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6feafc707d3so60891827b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778738; x=1742383538; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CiJA8cEstxgkTU1mTKMy0JGKZ+R8iGVjaXw2iJxWSRI=;
        b=NtNULrKqyd0/tiR1ikQeFHZNJf50i/iixgif7T/FF2fXc6gGj2ekI1f0dP7zG1kf7a
         1c8+JvOVcH1q+YxaQi1gzQDVPWnH8Np8JjMHH6+c8zzxuK9lk1crJ4gTvky9YK6QgEZH
         0u8aqkCRaDSNCfcptx+/grBbj3FqlNVvoSgvcvHsXUjZ1zR1yie6Vjjj9glZAK77+KHo
         d7r0Hrlvt71HhBNP36KVZZpwP5U6iEZGmEKNiaXLSSESIhcwe3yuM528HkWy+8g2nFO2
         LO2iphfJtbGjoNj8GEZkH+Ngfv1bzQ4eQA3k6MLZFNZb/dF7/mRFZl4GtKQBsJLWbnYW
         sGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778738; x=1742383538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiJA8cEstxgkTU1mTKMy0JGKZ+R8iGVjaXw2iJxWSRI=;
        b=vA379w5qBnEcfdR7ztU3a/hafIM8/2KYCFVCOoyqE3Vf7tQDrRfyqCxOUHFvQNwaQL
         2VtKdm8ZAVgVZauda4fboDtiAvkD4lQbrU4HbaopiMd22Y4wk0Sy+dH9JXDaWmTtQE1t
         k5cwZ0P9PZwgesEYGRz2Lpbtc/oG3jpkY4fFKsEUXxny50HbOlaPKUr5rnJbDkkOTi7r
         v+Hz4Eb2uA3Kb/opIT4RXS5zkTOO7iZJ1eFiTmAhFUyeE3ZXm1yHb/G3gNM6RgCkfbca
         wWzF7yTfLHHWujgQjaSJbiZhNlIGtAs9TnKiU7TiUWeE8ys/1zEuMO65+FxjDmVAmjvc
         z3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVcn80srKwfT+qD5ZMz7rJLKjM3MK8fsAOJs2lpodeeTevlzUMh1c2x7Q/M2goDvkyNKduSUlklCVbLIMC8Uuo4@lists.infradead.org
X-Gm-Message-State: AOJu0YzxjCckqdCVUoaCNqLXsQwBgEICmVI2X2ciIBgN/Jt7KX3UszhX
	4Fe7o7X4AM6gjDpeqfF1C/E1WWQo1RgJNCDP14iPk6F4q2b8kKj9/ljro0Ygjto4VSXqduM9+vY
	TzkBeeqc+IkRjFcgPMp4q42cx9amvqs/M/9Tn/w==
X-Gm-Gg: ASbGncvHo1p6Nh/E+Oy5MZN15UWc9A0d3BFQXxLGTX9nzYevrhmDCDuLUSU0AQgmueW
	3+Q/S1QrPUrIEuCNtYo1XGyoCv+exSmkVcqJnzUED4AUO0vrHBfuRbbx5gVYUXIVOjaKx3ps3Rn
	5M92jvP+GLrLkHtQ41OjawEUa3ekk=
X-Google-Smtp-Source: AGHT+IFsXLs0G0P0sl4PUE6UPS3JqqtQHaqryQbTsh+V2XVD4bcZpoq0lGo1l4XslguvHjeCee00G9KHRf+J4fl/2ps=
X-Received: by 2002:a05:690c:4b13:b0:6fd:33a5:59a with SMTP id
 00721157ae682-6ff091eaa41mr105598827b3.18.1741778737979; Wed, 12 Mar 2025
 04:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250307005712.16828-1-andre.przywara@arm.com> <20250307005712.16828-3-andre.przywara@arm.com>
In-Reply-To: <20250307005712.16828-3-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:25:02 +0100
X-Gm-Features: AQ5f1JpRnOY3arJkwpPqmP24JF8uLy0s3IwIKNA_9eLVMdzcVYtTB4PX7y_pSng
Message-ID: <CAPDyKFoFesrcYPDNDsvU_mLdkTGE2=7TCFrYkdFW3bp_0fLSMg@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: mmc: sunxi: add compatible strings
 for Allwinner A523
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042539_110966_72496691 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, 7 Mar 2025 at 01:57, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner A523 uses the same MMC IP as the D1.
>
> Introduce the new specific compatible strings, and use them with
> fallbacks to the D1 strings.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 8e4c77b7e4ab9..9f3b1edacaa02 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -50,10 +50,14 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-emmc
>                - allwinner,sun50i-h616-emmc
> +              - allwinner,sun55i-a523-emmc
>            - const: allwinner,sun50i-a100-emmc
>        - items:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
> +      - items:
> +          - const: allwinner,sun55i-a523-mmc
> +          - const: allwinner,sun20i-d1-mmc
>
>    reg:
>      maxItems: 1
> --
> 2.46.3
>

