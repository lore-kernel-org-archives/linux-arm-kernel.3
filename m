Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uMuw9n5pwbOi9ibO0Djym5GMms0Of0kx57oeDZ/s/s=; b=GhjId6GRuyLJlGNFGyeNdOxiJJ
	AsXqjCwEDejmZsrgvVOYfxmHcsxnl3rWqGqSci4Yda63hNa5xTUNgKJSWI93yywc6xhEvgDN63Fy9
	mHvsaC33wc8Z9Zsi81S59wWGl54qgtom1RooZpSfBE9SfaLXN++0EGAukrNoX70JxqCNkkstqbfD6
	tAmyHlRD7hhdGUjDOPjXukDXbbzz0fZJRtyOfEUAwvGcGY04akTWcceOE4SE6hX2bMekSlKna/qik
	6etlAcGdgLSzWJt53l0yK7d44CDpTsXNJK0HGW4nC/Nlpj0jfo5iappm45BlFqu/AOVniNZSW94Cz
	MQru/oMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qjt-00000006ERp-2niv;
	Thu, 09 Oct 2025 13:31:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qjr-00000006EQp-09kg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:31:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b2e0513433bso157451466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760016681; x=1760621481; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4uMuw9n5pwbOi9ibO0Djym5GMms0Of0kx57oeDZ/s/s=;
        b=PrGhPTC26hmX/vgGmdw5gLpr9hEjDAwiKZRFTq59AILfWxRJYr9fHgAEOtN+Ckq4cy
         FHh4XOeMUE9Fr0IdvntQz8IaK4Lm20qXQ8CJ4w8wsQ1qrLbwkVK0foImHXg+HKjQHqG5
         s4v3ADCfIXSOkg/+DcyL30cmYiy7ML2cVFcmeTKhElwe2QHbvXqIT+qSQRhX3q3irrNt
         JsfHVcbHUvCVZ/UVfrEBA/nv2taaoX1pGp4mL4O4rsKZezU7vv3UcXmnWh8bT4IsPsHb
         M5gTDCG+4fPMWUZA0a+D+R86phSTjNczCICSoeixtXrSSHK0n0bI1haNH8FMTsm0uhJc
         znYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016681; x=1760621481;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uMuw9n5pwbOi9ibO0Djym5GMms0Of0kx57oeDZ/s/s=;
        b=IkCDWVhonax6X0UwDxGd9oI+pJwydBQ9cCRzUEEPi+Fervwi4Z0TnAryd4Xj5sFQju
         ikgIk2PEj8gw129griOUDnzBlArtfZFz9L5ivDqEbpnzgAEOAxPf0ybdqakmP+saF5j4
         KL49K4YUrSJrLKLdQndQywqv+OWw7jqcfokRKg7yiaFCzyUWnmIwGiHaaC04YMVq0Y2G
         +s1atMHBmxGS6jbW9y+Ty3mV7AQA5cwKe2Fw2XZ91YC/d0JCLHwUjStwU1b/rm/Q4unY
         y8uecv7fgGGbvaNwtp/+0O6D5WvLsvzI05C7CVJgdkD7DLH+VAuOSQlMUtwaRG7H5E/i
         ENiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmABzIWTrxw2B36+8XG1vbpe7OdKDKIhMnIxxSVtR5ChfXLyVRU7VMcArP7NQKvQ3XiXSy6f5OiPKE685Ruifn@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4Ozs6TrPf9sy/6U1AgNTZIrtTJ+1aL6LxayIWg/PdjmIoCSp
	SB9RvAYsWiToNqM9d7Wq/EdqBBUZ4ilMw9mHqfrr9U4Mo4A6ASwdhlR9svq7u/J1tmk=
X-Gm-Gg: ASbGncstb+TgW2snGyJnwsFc9cTIr3eXOdm71jEZIoL19jPrO0lKXii5LzKTT3d3zAh
	gvzoS3lf3aRw6cU0FNkSMy6fzFecgjovoaUKPCvhUUkVsnR/g+ZlKgjywT/ff+asD/kUixtV8EN
	DyxM+K0RSYyntQGY/0NRhN5MNen7yEpQf54xbiK1gz1DqiBb5hu5omvh+KU5ao/XJxmmzhXbHPd
	SMXu0o5IfQHll7fE6EUpTtYluMOPB3IiTiyiG1+QHtqPbFlI518D+ZklFId1xboXxtJFK6Furyz
	flAuHxj3EviYWzZDI+wp+I03cmyCVKzbPgWwfwvj6UVmvrpKcU/SY+4vCHHsJLpPj/RqSAuNzQE
	l09/VsjBZxmvRUqP8FbMJiBgtx6cjXZK/E/gCCioo1R4PDYMAyOLGDg==
X-Google-Smtp-Source: AGHT+IEnaDw79r99A3B3756aMdxT7SHXjMqW6rLoG3x0RAXtUbJZNUbfM/vMx/v7BA9OApMfoCnFYg==
X-Received: by 2002:a17:907:9720:b0:b4b:dd7e:65f8 with SMTP id a640c23a62f3a-b50aaa9bbe9mr879682766b.25.1760016681115;
        Thu, 09 Oct 2025 06:31:21 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ebbsm1905425766b.7.2025.10.09.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:31:20 -0700 (PDT)
Message-ID: <9d4ccadf76ccfff1a8b5f572b8aa190e2dc40c29.camel@linaro.org>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Date: Thu, 09 Oct 2025 14:31:19 +0100
In-Reply-To: <5df18f42-b567-4d27-9e12-29723af40d6e@kernel.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
	 <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
	 <5df18f42-b567-4d27-9e12-29723af40d6e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_063123_080910_423393E7 
X-CRM114-Status: GOOD (  12.34  )
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

On Thu, 2025-10-09 at 09:13 +0900, Krzysztof Kozlowski wrote:
> On 07/10/2025 01:43, Andr=C3=A9 Draszik wrote:
> > Convert to using devm_kstrdup_const() so as to simplify cleanup during
> > error handling.
>=20
>=20
> This is either a fix (then describe the fixed issue and add Fixed tag)
> or you change the logic, not only simplify.
>=20
> Previously on of_genpd_add_provider_simple() the memory was not
> kfree_const. Now it will be.

Indeed it's a fix after all - While the driver doesn't allow unbind,
I added this patch due to the followup patches that add potential error
returns during probe, but somehow missed an already-existing error
return after this call.

Thanks Krzysztof!

