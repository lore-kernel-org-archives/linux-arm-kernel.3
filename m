Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEE0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6t37BQHYg5C29qODMPAidihVqNJ54EsapTzOiph9W0=; b=5EHasbca961hc3CKLTPvfteQfq
	lvj30tyPvs0vQXS36t/mbp/ak7I4Wl/SN/JZH2bl4o3bpW95O4aIpwxLHHMX1GcMb7j7EpuaP8wXZ
	Vhb9hp7AHLRuO3vCz73sYqVhQz0u1a8IZ5hHTA+tzSKgvB6uyLKlHDZNJKkFfhXSzCXaAjKWbJbLb
	8nPEVGKIHJAtgCbCn7Mk0RjmccSjg9SNlDKSNho4BpKxwicmMjoAREISh6gHjc8MKimTmnH4BEWJN
	6NfqJA6OH//WZXa3W2DbzZ+Ok0g5wHlowIfuokjYmO5I0wkn3TjJOeTAdBtmMWhwB1DYqazJNvFoy
	uRIZzTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkXw-0000000D6Hi-1p4s;
	Wed, 19 Feb 2025 13:55:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkWS-0000000D5lx-1kUL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 13:53:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-543cc81ddebso7005378e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739973234; x=1740578034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6t37BQHYg5C29qODMPAidihVqNJ54EsapTzOiph9W0=;
        b=Bcd+CZ0cv8ZWr5sbRDfBbBHUtucVImeTs/pVZ69CnLqjSyq4/zLxmQhfPuCi8uXFez
         WIBEuF8vOp4QC+SBkzfba2zAejW7lDAlIZeOYDSSNwW16/qkfA87cppHbnILW/E/5ksk
         W3y+kaBXaXmZ+o52UulVZv8wt7PCIBYr09Bap7FjZFQW9iboyLMTW4uOwNjb4M4Ku1OB
         9ZYxgKKwdlUaQMOyPt6qC1aNBAuXmLlJxxHyHmCqnWu26lBF2nUIeRx56RTyDotHAKff
         S39nfU3iJ2iHnVC8Ok+TzRZ82RzuVfjNQv1qufD0psCH7KSyGEROTnoqibrF7BxTHEDa
         4hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973234; x=1740578034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6t37BQHYg5C29qODMPAidihVqNJ54EsapTzOiph9W0=;
        b=uFsZJy5uKi/5ftXVt660tXZ+IxRBakIS7our4GHv4dQZJ6yxxfcJOsVvPMwOccMI8Q
         05BYiyNoopSbyfDFakhkuBx8UyRt4+RNl4mb07V+MUcs3j2Kf6N+PQsGB1+Xu/5ttreT
         J4QEI7HQ1a0sGHOsbej4gvdgPEIthDCtawC8HsuxEBKqJyNZLLTs3Ij+sIvU39f+L9PT
         U1wJ/0rrdVvM2EIIlslzEMTc80BzE9xWdcfaJyJixescp6cabVNghYWb9/xlX3WB/lib
         DX6FEpRkMDL/NqydCXu/WShhRZbsEsMcRTy+9qpkmwsBL50Uj4ePu3wa97q08r9K/2qV
         MFfg==
X-Forwarded-Encrypted: i=1; AJvYcCXTVc6iQASg6jnSxynxVDkVdLS0UCrfz3UcuzUQBkH1lrdLO8On+brpBjKMVLU5cI7OKUleqPxLl10JcJ2CLBM3@lists.infradead.org
X-Gm-Message-State: AOJu0YzxXWwAnH93jYZVAguiGEqPHhNQY6tlKycHoqbOzvEhjDgtZ71v
	Mb2KRZWW7eWKbmiA7eACnLC86jJn9IS1vy19gRIQ21+k44a/J8CEkpinGBojYEKyavT7yZ9WweJ
	XEAHQzP1BxSDs7G+cUHFgosvCt1A=
X-Gm-Gg: ASbGncs2URzuowY97mZvg2NB/CRSbBCkypQAB7JISmzXhl7NCRI5hvfRtyCLahIoNit
	MW5LTjJyEmd1G+XoFg1K41AY09rSprK+g96Ce06oRIFL7OnuFfQx0UOHhTUxDTjN5fD6nI744Zz
	mdGOxTeYcGdC6noUxJ4pCF2dzkU84=
X-Google-Smtp-Source: AGHT+IEfa6BU1Og4EYBhPdGzQ8AbNlSEs40TcyE4AyfYRci4Yh7JUHFGkcpocxJ2mslPN8Wgy1hRW5VA2U7L8Kutmic=
X-Received: by 2002:a05:6512:3b9e:b0:545:2f6e:32fa with SMTP id
 2adb3069b0e04-5452fe55430mr5275021e87.21.1739973234258; Wed, 19 Feb 2025
 05:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com> <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
In-Reply-To: <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 10:53:42 -0300
X-Gm-Features: AWEUYZkJFhBHdwEt5veSqP7xF0ysRoigYMPW5u1lRGmZYIM_SaXIS4HOYQ74S6A
Message-ID: <CAOMZO5AfsHqyo3a+hmfprOnNJEzMzC81GuzBxtrt_F9cHufAtg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Florin Leotescu <florin.leotescu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_055356_452684_7E21436E 
X-CRM114-Status: UNSURE (   9.13  )
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

On Wed, Feb 19, 2025 at 10:26=E2=80=AFAM <florin.leotescu@oss.nxp.com> wrot=
e:

> +description: |
> +  The driver implements support for Microchip EMC2301/2/3/5 PWM Fan Cont=
roller.
> +  The EMC2301 Fan Controller supports only one controlled PWM fan channe=
l.
> +  The EMC2305 Fan Controller supports up to 5 independently
> +  controlled PWM fan drives.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hwmon,emc2301

As Microchip is the manufacturer, this should be: microchip,emc2301

