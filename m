Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242B7CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlEJkGo4jbFcLLHgPauAsvkvtRdewAA4g7rPzfOb2+8=; b=QjG1FJ99gcQKvFjBdSa99VdrKO
	JQ0X5xDuRegiewAoa9HZiRpDgCIh9WtlDsAC0TYjM2YtVg6AWJHx5IsH9JjL6Q822Z7ddsBcmbUh7
	ZGSwQeN78Xnstvtx1EAR4apHthVqXTInH8vK7M02CXMtVq5LYtQaa2RvKPiSFXBXJOLaedHpcNiJK
	P1Y2XTM8bmbMmFnGOf8Jat1TS16K1OLYpu0udp4mTIZZk4K8lG7fPgHWYgh3cnLG20wNFM2rycV57
	3c3GvpK+nE8gBhFEXvZ+SNyYxCcsY+O0nLRfLZNeNBP9BNPKKKSsT0SeJWyleMsC+T1/HLhg/oiGy
	UsvkYmYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBByN-0000000H4H8-1QbI;
	Tue, 21 Oct 2025 13:00:19 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBByK-0000000H4El-159O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:00:17 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-7814273415cso45098587b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761051615; x=1761656415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlEJkGo4jbFcLLHgPauAsvkvtRdewAA4g7rPzfOb2+8=;
        b=wHe0pgn0xwk411S0Y/qTNR/RY9aiKfp0gFTJg9KtP/bYcHhhYAJH9uY6xxlyGnat6T
         w9lE3S66mDEdkcI8Ot1yucx4hdtCZlpDaAzoEtJHCxD/l0ehEdc0UDNG7WVuHFYuEIYW
         A+I8C4+iJ20txK+nDAPUatDmuEKhoXz6tcyAUvpKnqBFSEz2JgxUB9iV9oYwn0GrMPaZ
         xHXfwnqIFZ94oHiHO0PUE4wRC++hJRgPVmEg4JSAoQvA3qqtLA2Vd00QImu6cb0k5CiJ
         uGMU+gj5igByhlLfmq0MK5x4twI1nd8O454nfThhtMmlAC4O4hNhgwK58Bt8GsUyeMEE
         Ae6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051615; x=1761656415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlEJkGo4jbFcLLHgPauAsvkvtRdewAA4g7rPzfOb2+8=;
        b=uFVy2a2lO/OC3H4YiDxg3fmAI7Jm8vInFHfMQ4rwjP0jQVaJYKfX9I3r7111QJGPWJ
         L2Ed6ihsl2XnJEO2uuo+LW7yQm8kR8AUmR59SgF3J1L7H9w1z0GU5lPCMR0i40GBmv1+
         ZOqGEtI0Q2UMJRYbdIlYJrYxbeicSPY+yPWLkxQEDvP0RbNIZNkYgeUbMmTtegBevYa3
         dlUZ32iIVFyYfnKKPLAH/A3SfQkzkfsLcABOIJZi/NphAsPlf1R+K0m72qjf1xpZ65RB
         /NV9FezXB12bd0+fwXhRLkfjlTkleXrgbplAbg2KyCNRNkBrvsWcSO/nfrIBnPt85qSM
         r/Og==
X-Forwarded-Encrypted: i=1; AJvYcCWqqO2wK8psDhlraSmd+WHhpHAFarIGl6pJTQy3GDzbMjVgyPzIrf0tVawxBmCg6h/9UT+JaHOrXYCTPQne9iNf@lists.infradead.org
X-Gm-Message-State: AOJu0YxYyjt+KvEdZJ98PjJUdxIiFKUawr0IpKs3QhA0hDDNkWJI1ppn
	EKBc9MAD8S3cR40mYzKveXC9F03dGwP2x/RPH8/Z6p3TxHq3ZmSrSk62ExlDuIdMzoJwPsoPtGr
	vAvhAZIQiK+jFiEzz9QgbvJu3qtmSxGJ6BVcS9/XLvLet6gRcniiBKCM=
X-Gm-Gg: ASbGncuuD1R5nDSbNionrTPdksYGuqt4KtPy1KgeIB9hTN9cJUaKh7M1bMebmjM9B3z
	s4tSY9zyGVVZGT6myfBzyCRdrLlMzmkDT9QISlB0l7mUixOqtD1n/dyV5Md4yw3GR3TKtNy7PG9
	Oi2RBOyndYkl497VY9+tVtOoYKbGvbEzqBSMIU+hRbU/KipYCYW33lhcYaattoYOrd8wgz6DioC
	dGU1aU0tkVZaGS2xdQqc7WyNWXkmDqu/uUkYSvkgcSz1AmAT8HP4MjIhDc8F4fF69MN81j5
X-Google-Smtp-Source: AGHT+IH3Bsal993llg86W2aSSM1eiZS3yAmHYuPkrL2KcynJ1XAI6y+Y0IumRaTcK/qZuaGYZjT8+fHPq/Xs9WCQQDY=
X-Received: by 2002:a05:690e:2049:b0:63c:f5a7:406 with SMTP id
 956f58d0204a3-63e161f865emr9077055d50.58.1761051614403; Tue, 21 Oct 2025
 06:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org> <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-3-7b30797396e7@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 14:59:37 +0200
X-Gm-Features: AS18NWAWrX3EdOi49ik_edQ7hyw6I5dlqupwh8B2wvDucY-SMETDIx3Qc3I521g
Message-ID: <CAPDyKFqNEN_yfmGWZr=sC-W8-Drv7zn82WYa-y=v+Suk-JHvtQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] dt-bindings: soc: samsung: gs101-pmu: allow
 power domains as children
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_060016_328510_BB774617 
X-CRM114-Status: GOOD (  24.86  )
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

On Thu, 16 Oct 2025 at 17:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---
> Note: Ideally, the newly added properties (ranges, etc.) should only be
> 'required' if "^power-domain@[0-9a-f]+$" exists as a patternProperty,
> as they're needed only in that case. As-is, this patch now causes
> warnings for existing DTs as they don't specify the new properties (and
> they shouldn't need to). Only if DTs are updated to include
> power-domains, such an update should also add the new properties.
>
> I've not been able to come up with the correct schema syntax to achieve
> that. dependencies, dependentRequired, and dependentSchemas don't seem
> to support patterns. Similarly,
>   - if:
>       required:
>         - ...
>     then:
>       required:
>         - ...
>
> doesn't allow patterns in the 'if' block (or I didn't get the syntax
> right).
>
> Rob said in
> https://lore.kernel.org/all/20251010141357.GA219719-robh@kernel.org/
> that this is a known limitation in json-schema.
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 40 ++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index f7119e7a39a3fe0a0a23d1faa251d356f83ba501..a24390f6d2a54afe1aa84935e=
03f719a62f4fc8e 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -26,6 +26,14 @@ properties:
>    reg:
>      maxItems: 1
>
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -49,9 +57,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
>
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: Child node describing one power domain within the PMU
> +

I think we should specify the power-domain-cells too, along the lines
of the below.

'#power-domain-cells'
 const: 0


> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: google,gs101-pd
> +
>  required:
>    - compatible
>    - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
>    - google,pmu-intr-gen-syscon
>
>  additionalProperties: false
> @@ -61,6 +83,24 @@ examples:
>      system-controller@17460000 {
>          compatible =3D "google,gs101-pmu", "syscon";
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
> 2.51.0.788.g6d19910ace-goog
>

Kind regards
Uffe

