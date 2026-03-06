Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B0FCB611
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=; b=Ux8IWrjsbwJL4Zd8k6z+1yFvPU
	ADrcdw5g4RTWSlgAoUgkaw4SrRpFGYPz+aAkdDJYDEsYmAuZH2lHVKceUtVWF0uiNLDHsXmE2AHdN
	lL5OpHHsMRkvSzSGaGZOVNHLFrPSnxxX/S+MXLv59Aj4KzfhbuE54xa3avDILDtmbZ8uVVNBj6cYA
	wiX1Yeh8XxTuItWTH20WhDeVWYsVwXNtH69eet4nOcW2zBOcNNykA7vVH0Z71ZDPhGFCfNM3uThqw
	AvW1Jqgl7tYEIhgyXGcI5VRR3+M1xFLV6jgf5TAsQu1yuj0M8v3qbqhVCy8DnCDmvxyD4uQQxQ2rd
	KUgDFXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWqw-00000003zuQ-2X8T;
	Fri, 06 Mar 2026 15:12:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWqt-00000003ztT-3BWg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:12:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so789577a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809950; cv=none;
        d=google.com; s=arc-20240605;
        b=hBqVdvdj6EpwtsGW4QQUvplAkvo7m2r0q79veD6HkQp91I2J78mz0MOFbVF7h3U2L8
         eYhXwNi6lpRhMfMrAHKgr+f6uafP6oRP0orzhVQ0/YpYJDRs1SUFOHHSxdoPCqoAHfGe
         ZD2yx/9Soa54t2+LdUnvazELMRDBPM960fjW4wP7W4CQWgmTdYqZ3Ijh2oUS53vqm/H/
         u9Eld2IXaDutwsqYHUz3zQjK5dop/9i5T1v720dP56RyTaRFfvsBneZ2cCul3AXEtAfQ
         8Pnqb5eHqXxlkDPV2zXRjh1rX0Vys4AQ1yZodyXIXENiAI8NCvGHcEsYXQcOOGsTPgEb
         aJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        fh=hNMunYXxAlFJrNsG2OJGGSukPac+yDJwL9J098nOlIk=;
        b=Vkh8gvVPoy5dZI4kMNa1/1MmmVBGxlQSnyCMU0uEMI0c5/Dfb1Sjm7Mv+ptUaPNhTh
         13i9WQSeFgwqUbNT0QreA97/iHUGqLsoeNo9veB8ikI5i73H6WkQyG1TZ61tu84/9GJM
         M6j2rUXG/ohLv/Wq9t2ZY8/ljnUIEua+Y3H+Kg3467s4vDf61h2xsU2rqHYTNG5dsUky
         GVUKu5Ik4umsD07YeFaK02fJkXEpCh0fBZusnUb5vBUXN03ktMJTK9s2PCq97rKe/vKY
         mjaRlyCluupSkGsZCvwJniAKFdR+w3BMVqgBakOwuOJNrKM1opgVYAXLJLS4yNGDLxC9
         pIew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809950; x=1773414750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        b=ML9xMqh8WAmIPuzTZuQbNyShNIatym8BVcfdMZtVX8H+hNilqOLJj6w0x9zfrb5Df6
         W+w4wiB/kYqrVK470D4sHD+u4rpQ3r3uXoSspQz560CcRg4gdjr7y1QO2QRyzR4ioEbG
         nbcBLDOW8aJ+c9pT49UiFk86tXJvex+QhtAYN/wu33HLHMm27PBisVxNTfcHc3UzHIms
         vz+Vx6tw7giGH5rymGsnyFjW3jIgy7BWlP9JwHmUEEpE1+mG6rf1MLetBhV03YdDnuf3
         Wp6FuODCTJdP43JpxK58UgfNV3LUkKbb7p9goKYOLV3LQBdj0ugyfcDHku6u3eSOHMAV
         kS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809950; x=1773414750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVem0P0AdsDnzJHzIyaxJZEVpAJaMe9yOv2rf1iAdzg=;
        b=ZT1iseyd0V1tkiUf/Oy/wlc1+yvjBRT19Gwcwd6cxBQwgItltQxc7uZnsWys0ORyeS
         NdzKrA/9vM8xzjL7ks70jifhcEmKHGA8bKMWFrMbc/ZkQhiWo6+hg5mSCGy4tuflUD3J
         IiosfnEbKijJIIX1coTvieyxt/xz0oBLKk9FoBQILi1ARs8XUQat95Nxatizz2697Xcx
         KkNA5mfwQD0dCVmQrSLzBXFhRvuv5nPlaev5JFcGSZj2XelIakz9LyPtwH34tzMY7fG0
         kBZNdo2i2xQi1g5EigH73H/DFdKUvl5ZSgkN2lRW85LCdF73ALuDPPa9LS/ODO/Jt1+F
         gVCw==
X-Forwarded-Encrypted: i=1; AJvYcCV/RMM3G7zXaKU5cAm8FBFA33tB27GtcMb3lyyFYzKpqVTHxsRBLUpZhItdOg4sXh+1BCV4QgIwqrDX4+Owycl6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/+7H1WufhKD4Ckd5OOj+3lSQ6/nXvGSuqghy+nC9tvBCdhK4
	QBt0Ww3kKkIKHg9+kdQRkUCb0VPGCWkhzpTch4Q7AmQtsX2aY4P17iIEkySBxSfeURJ1Lmlb9lu
	r+ibKJgWwQ+mGBlsJTHd4UZ/1tPwmxr4Qel0/wR54NA==
X-Gm-Gg: ATEYQzzgMNBFu/TpXgNjjzrKkQqQ2I5RiOP8WrpF0WwyfRTzrCxSZjaNx5GuxJKz0z6
	gP81XTFjvccW5HqNQF/kJJs73zSra0FdCugAJuFXBGeshCsf9aMI2pOBv5wXCjq/wQQNY3y6pk+
	GBc96/fnzroSppfF5Km5fphp4uUzIg/a6nRvMj4BUlh1paDZs8gNAYsWW+RxIVmjn6fiJneL+O2
	f4+Io8y8SbOdRLlej6WbCsWabDaGjut7oi7+7zHYZbPYfLJSGQWVGoLyqegWYNVph+tuo0nFomx
	pI2pLO6qfeNfW3bCamGcJL3Sgh3CcxlHF2IDaS+aKA==
X-Received: by 2002:a05:6402:3487:b0:660:b913:faa with SMTP id
 4fb4d7f45d1cf-6619d464e36mr1481328a12.7.1772809948849; Fri, 06 Mar 2026
 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 15:12:17 +0000
X-Gm-Features: AaiRm50bC_Zr0ksut70Q7jUwSUCXTU_SK0a7CwA46Jn7HCchhyT2HfXFov7-djc
Message-ID: <CADrjBPpiFR-T5SgnOAgt9U279esUYkdVn21Yy2TQnMvrd3VNUA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow power
 domains as children
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_071231_829595_F7DCF656 
X-CRM114-Status: GOOD (  20.47  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v7:
> - really be consistent with quoting (Krzysztof)
> - drop invalid tested-by tag (Krzysztof)
>
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
>
> Note:
> Because the properties added are 'required', this commit breaks DT
> validation of the existing DT for Pixel 6, but a) that's simply because
> the DT is incomplete and b) a DT update will be posted once the binding
> is accepted.
> It is not possible to write the binding such that it supports old
> (incomplete) DTs in addition to the full version, but as per above
> it's not required to keep supporting old DTs.
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index a06bd8ec3c20..dfe6f87e5949 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -16,6 +16,14 @@ properties:
>    reg:
>      maxItems: 1
>
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -39,9 +47,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
>
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: Child node describing one power domain within the PMU
> +
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: google,gs101-pd
> +
>  required:
>    - compatible
>    - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
>    - google,pmu-intr-gen-syscon
>
>  additionalProperties: false
> @@ -51,6 +73,25 @@ examples:
>      system-controller@17460000 {
>          compatible =3D "google,gs101-pmu";
>          reg =3D <0x17460000 0x10000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges;
>
>          google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;
> +
> +        pd_g3d: power-domain@1e00 {
> +            compatible =3D "google,gs101-pd";
> +            reg =3D <0x1e00 0x80>;
> +            #power-domain-cells =3D <0>;
> +            label =3D "g3d";
> +            samsung,dtzpc =3D <&pd_g3d>;
> +        };
> +
> +        power-domain@2000 {
> +            compatible =3D "google,gs101-pd";
> +            reg =3D <0x2000 0x80>;
> +            #power-domain-cells =3D <0>;
> +            power-domains =3D <&pd_g3d>;
> +            label =3D "embedded_g3d";
> +        };
>      };
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

