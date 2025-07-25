Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CECC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSkJyTrv6R3uiwv3q2J4zn3hDj1JQ7Rtyl+OeDRudNc=; b=zoULt6L+vjnV+KCuaP0xenjsPJ
	BfuBPzSaUcKdTcaGr3XY4IEkBRKF4glivJwSJsIKcUUjY9P8qORzbvBC0XeL5kgE6/beaKZOO9Vp+
	5D29m7f+JhFlclthw0RHlq/z4e6ZtFlduGJT6V5XwNL7uJnp/GZL+V0zTND5E3LoV0PcL/udUjXRt
	Y8jinho9yXCajjRkF6t5p4MufsKsI+fBqqFRlwUy0Xw7QPejr0K6UsqF5+41UpwAy+Q0gMom+b0Dr
	y0K7kgkElw5StgEvx4x9+di8HH6Bjd4OUo9JniGCLCI0XUucVzcln/EiR4UuRLW4WLNO7+sSTf5IN
	l7ubX3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJEh-00000009zU9-0Z8I;
	Fri, 25 Jul 2025 14:17:23 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJCD-00000009z4R-1WDR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 14:14:50 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4456319a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753452886; x=1754057686; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSkJyTrv6R3uiwv3q2J4zn3hDj1JQ7Rtyl+OeDRudNc=;
        b=zXUbuIweWQnB8flsbq767XStTTXIeEcCLRVhFf2mL4AiNfveOa14LbFPoviDuCpRp4
         kEivow62/AtkZBk4DKPRp6u1pZWq5EMhWD/VBm/dupOJwjJrUSCnPHxJ85HARFU3lUSS
         ZMwDmQIf7mQwpy8DYQGI26bHhv5gewegaKra87zBo7/KgGZ2zdXroooIBmlZryprAF4d
         /NyrN+brzivu2OF2c3EYh01132wms+PwGwsNW3+srI/mfwHV8oH7WY4oReeEJsNlfXA+
         zX/JFs0PoR3tl48ICg6WINiDeAkESaVuFMChMxbqoQMJj1uWGx4wFw0/YIbBuaG+DaHd
         sPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452886; x=1754057686;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iSkJyTrv6R3uiwv3q2J4zn3hDj1JQ7Rtyl+OeDRudNc=;
        b=QoyOBrDQ2j1g9REOYnZ3ydR1296KNxt94CPMynnjT9xRGl91OvkVtiDoaGGaWRQGPu
         prI5CJp4ivWMq0skeEFIh1XBGWVL8k8g7hFh6bg2BYFQFWPI1a+ftytiU6JI5m/VXu/b
         mbX5u0OMAOtNUcJfB2MkRI2RrZJCqw116LiqakCGsSjTGE3S+mTPIWJeGRT4hT+d/2HO
         0Xh4owr5hNHnDerXtgC2Tycg0Yx8XuxlPSW4+A8GGhqvc4aRgAVrXtpVbaex806piPXJ
         N0Fre1t2g9Tg2OsOD8gqdKuUssVoxo7+x2XrCpex7/LYBxdFciWYqRkmc+mrt14bDq2Y
         OmLA==
X-Forwarded-Encrypted: i=1; AJvYcCXTM6OpVNJAZGkCmafNzTljhMI+z58JVYXmi9sr5u0/fCDDWKywjfBhgoXo7BBLrj41FxILrGP0iPTr8lgu2AkR@lists.infradead.org
X-Gm-Message-State: AOJu0YwfonJtAzIqmA0W+nYsjgEuQg+TDbveo3umGptfzXMZ4V8Cqm9d
	TNddgKlPIYLitarTE2tEDqcAuF/lJjlPvRv3HIxGXHV+mZM3OmQGsuCGWuG8Rps+H3s=
X-Gm-Gg: ASbGncu+F+DElo96CI0GEMqiEdnOI2BRFJbby2jATfi/FHU8vxunDVdWqYcxX8tnn7j
	KbvOODEU1l203j84lq0EqX7iJrFVTHy1aWcfYoDMAGq9FOc1Dhugwn6AhLrfNuUtIQfZAj1WnVv
	ezRscLZqmmPB0XYvZT0FAtn5C3Ggs6e7w98qdSNVlHyaEf+veu5pb+KYzK3aXw9SS0REpfJYGiu
	Zd2jN2hjp8TCmqTaQJ3hFDwZt2q+1IUWpUQY4piYkUL48eA7IellHiuPFL3pUKAYeaI4oGQj2VX
	BHxGbbKQbBaEYkTcCeLl9IXMXD50UgZPVzKrMqyWpOP749HuKBGQlGOTXBA6GCkdEBpzDg6iodF
	MlrnJfr6qOAAHfTnHtqHzM6AS/4Cg59YfjXl4OCj5wJqs3KTz37H4Sfh2misdz3ih+IQ=
X-Google-Smtp-Source: AGHT+IGz463msOz8qJcurxvgKtRb5VKMVkS2t8llkd59+2lECxEEVtdl6gBW3cfbqM7OYO38KYCWFg==
X-Received: by 2002:a05:6402:3595:b0:604:e440:1d0b with SMTP id 4fb4d7f45d1cf-614f1a88810mr1744941a12.4.1753452885513;
        Fri, 25 Jul 2025 07:14:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614d907a40csm1635236a12.15.2025.07.25.07.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 07:14:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 16:14:44 +0200
Message-Id: <DBL766O111UP.1IBG5Q30DCEQS@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 06/14] dt-bindings: mailbox: qcom-ipcc: document the
 SM7635 Inter-Processor Communication Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-6-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-6-d9cd322eac1b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_071449_413790_9BE721FB 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Jassi,

On Wed Jun 25, 2025 at 11:23 AM CEST, Luca Weiss wrote:
> Document the Inter-Processor Communication Controller on the SM7635 Platf=
orm.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

I see you picked up this patch[0], but "qcom,sm7635-ipcc" should be
dropped. Only "qcom,milos-ipcc" from v2 should land.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3D872798f61d8bfea857e54aa17baa7b0d3ee24b65

Regards
Luca

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f69c0ec5d19d3dd726a42d86f8a77433267fdf28..6e86ec36a82254ebd73c3067d=
e495795c36c6bee 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -34,6 +34,7 @@ properties:
>            - qcom,sdx75-ipcc
>            - qcom,sm6350-ipcc
>            - qcom,sm6375-ipcc
> +          - qcom,sm7635-ipcc
>            - qcom,sm8250-ipcc
>            - qcom,sm8350-ipcc
>            - qcom,sm8450-ipcc


