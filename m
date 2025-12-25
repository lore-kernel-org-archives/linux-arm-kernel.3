Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41631E7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 18:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=; b=a0TsSFpQyfFsPSg68cKdntZldY
	G155B4RqjJZ14gpaofXCc7nm4qcMttkvIJazX2jzEfYyG4cRgHA4JP2YPew7mlRaTS6Lqt7nBYAmb
	q9s9sZMisXckfrJO9Y16TdGbfYcI+AYrWcBNm41ReArXOj1gAmuOxgB9xvIcxytbouMTJe+KkdMe4
	AOXr3R8/kxj7lJKQ4Y1pgZqRXqOUPiMNGOL6P41vJM0FkstwXmqSZRdl3tDbke4vxLiTNyQ1uxyms
	1DrbHWbqDaeq+oRObfPiulRZlgVFUWafSmBSkz9ALN5t3HAs6IcVegh3ZKlB8nyWkjBlgzH4vqSHc
	PQaF4rlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYq2J-00000000bZv-193c;
	Thu, 25 Dec 2025 18:26:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYq2G-00000000bZa-1kTF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 18:26:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso8600150a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766687162; x=1767291962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=exqQGgD8EVn0qOl/JGEhchAVD/xjx9Ustwjyo+qXN5nTJB2rBUt1DztuJopFU781Qp
         OFnSqkeHSbIzQWhW6MeH9zkwLkP47zik8pkdvo9t5rk8PFEMfPA3qzohzcnC6GICqr7N
         oRlKvekkTXAqBEMLq8hK5If6ot2XQ7oQvUo/f2Awlrj1jzEblwxAp06Sc3rcNvDCoY/g
         n9BVaVX3i1rFK/2K1R+E6y406nSUGk7dl+qKAUnPBW+QkLilHYNDaM7LpIhq1MGoy4O5
         cZXcy6eTK/xhhqolUiMbJY2D1TptwZxFfLw9PAizJg064Anp2fzE29hlgNVxrxGWlBkR
         vWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766687162; x=1767291962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRS4iPJtbrzdg81ZX6d4fTat/ANIV4w3CMAdVITNz0Y=;
        b=mbnS4T9N4MTodawM7B5vCfZ4S554ZcYAGdcm0M745Y8A0igv+tIAZPdvMt4StLN749
         njNuEGnMMUVVrIYKIw/6GcIfWRh8NnkXW0xZEXSWKeHleft76dC54UHxoTteHYlK/7Zt
         71JgK8B8SSOs6J0BltOBwUsmhkdX7sBixcyVZvqpuN9R0t3IZgII1S9kQA62bCjOVCT3
         Z7q+b0+WbOkh5hR9Fgfsyriw2aqyDUBGSbFeI63twD7ibTmBO/bz61k7Va2xnjPotgQo
         h7vXCQ/hopz14o0x72+SQDGUOpYJ0wBy3l56VNYoqRiiwNZOabwR4UVvKG4xWBOTvFOe
         uuEg==
X-Forwarded-Encrypted: i=1; AJvYcCVBSe3uDbUbEqiwXZ6MTqi23ZZpKbQ0V48s0eldU0WGednOlgbblGXywOQOJv4MER1XJMS5hVVsTZIy5nx/AmMo@lists.infradead.org
X-Gm-Message-State: AOJu0YwLpdL1Au7Ge6+U8qVRRRlGBOF+cO1Ozqt2r2VAvqdxuoKCIqQx
	4LlaegTS2La00iAICCrn2Q+XfVj8ui8Rm2I0aKF+6XdUgncHl0bLVwD3
X-Gm-Gg: AY/fxX4dFhlbPcJQFyMmjkcqPjZWBJFkP9Y+pa60gEr4L46CISV6oavhAZ+4CoZLWt1
	aOizIpTZUaAc+53ZwoLHfJEvd3ultgMFm8ldiFSoxChLhP9rsecHz3/laq7m1kEt6QVGqDbMBT7
	1YKqlLl56v/3Zu9UnIjVR50EbfdtT7hXP43FEUfXq2mFUGpDUJYiw9vHwoGJO7YeUFvvkOIrmqW
	mvgkfX1LD0pi3W1lx1e5CgtfAuFfgtzQTLhH3eXUc9+dEH5IrSYqGf9iIo8xeFu5fK8dQ+9lUXa
	5SvZZpeg5QmpT2TOqlh0b/umoV73IcnJ944rzNTz4IEoTZSQfSZELLZv2nca/0GPk/1iN2OQnJ8
	ohFHCFr3pjUkOi9ETtbL29LB2ObAx5UxNr86qi4JjW4Ui3kIrOpYCoExwEfiJnchGjVE3g1iIKf
	9BRE0PkMCHsf0yTyR33LzTbYVEssPKDM/m
X-Google-Smtp-Source: AGHT+IET7IQnJW9NBpb65OlItl1guG9woVszRJ+kZSW9RdHnKQccOHSFq/Loyd3FgIyi5fOFPYZV2g==
X-Received: by 2002:a05:6402:1ed5:b0:641:966d:82ba with SMTP id 4fb4d7f45d1cf-64b8e944ef3mr17759280a12.1.1766687162003;
        Thu, 25 Dec 2025 10:26:02 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b372esm20774242a12.32.2025.12.25.10.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:26:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: sun4i-a10-video-engine: Add interconnect
 properties
Date: Thu, 25 Dec 2025 19:25:57 +0100
Message-ID: <5967161.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251225103616.3203473-2-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_102604_468227_CAB61566 
X-CRM114-Status: UNSURE (   8.82  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:12 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The Allwinner video engine sits behind the MBUS that is represented as
> an interconnect.
>=20
> Make sure that the interconnect properties are valid in the binding.
>=20
> Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-vide=
o-engine: Add R40 compatible")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



