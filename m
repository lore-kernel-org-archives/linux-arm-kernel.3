Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4920FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZhOmEpDhm76SJPq5OYpOzDDF0g2lT4rBhjCoTGHE34=; b=ziJoaqvBTHKPd4ENOVphwsXXRx
	jKp7Wxfujc4ujY2voZKMlbEAdLdm8kOlMAwrtiv1Q9NpfCV3apIlHuwjxQLSRa5V1NtzOAYQovSEz
	Yni3YaPfdkTmGKkThnSoW+Ayboasi0PHjK2clS3g/coy2u9c+IzD3vbkBhA9xG3c96JR4cc1ugX5L
	btrmx1yVG6rhUGoLV+b1x7E63F8m9Em2ZKauVSEBaTaqrnZPMgPrqQq16nhs8T2rez2RfS+g0eOpX
	IVSF2oXdyduqo4tgDalAE6E+O21fIszxqptt0t+mBK1NAp95u36Ex77VF+stWZynJnENWqG7Xc2LN
	BHZmlPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoBH-000000084Xq-3QYv;
	Wed, 05 Mar 2025 12:48:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpo8V-000000083rO-2yVK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:46:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223594b3c6dso117136335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178766; x=1741783566; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZhOmEpDhm76SJPq5OYpOzDDF0g2lT4rBhjCoTGHE34=;
        b=lCYuQR0RhdkQZwbmtyT8urphPoOnZ9TYLG2qJHqyggctfdE3V5XeT3lzBYMBXNcg/l
         VjYVw84y/Lg22mrFPy+aTRG8cETL1f64qn5Q1YtRD2+PMVk9yXPnoy63jlKs960UiAct
         vpIkX6L12Ob6xwTy2ZtGcshMufrPfppMlG0U7FBKBldQg6sjXrWsjm3QwIaeetUS2/p1
         cV96k+Om1r0uRnUtR9r6zfcjSCL8TbI1MGX7UkHsa7Zi6gkliSOje2ZPdHQOIO6yBnjt
         kdKXVBRQf0AUBUsbAAjSynyVpI3DOxJKbQDnEc0052+gAMklibZuOmNVh19d+EqhjD13
         Hmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178766; x=1741783566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZhOmEpDhm76SJPq5OYpOzDDF0g2lT4rBhjCoTGHE34=;
        b=W4EEmgDqKuqLjKLUHzIvLtSHcLHIoTLlIHdOzlREIlCr9sDme/k14NOh2cAjRnvuhV
         kjB+z1Ck4VbXrUUEKLC0vXtdlkdtKKLKVjzPwIyGVLIUzVpf5eWO2VJE9bfpI1IjW0Sy
         w9+wdWM9uMKUFa6Bm3+uTp2818kRycomgxw3O6ftKbmbP8NIxhbQhskCWkYyY/j5PtI1
         cvmVBDMauUxgrb4MQdtK/9WczDFwQ4KgZFhTEZb+5bowL+/hu87OA389Lwr89Qx6Tf3H
         taslE3xvOR2fxUVDL1Unla2AGRlkwZKfF2bqHdCFoTuXeZ6ev9HnlrLWSifN1T1bfsTC
         rDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc+QVrM65JPBRjfe5fbJhvKKFu25igrF8SFp4MeenNGwJs6Do/EoUJlZ0RkiEcKfjTAsdB7ssUXJrwW3N5Ncmf@lists.infradead.org
X-Gm-Message-State: AOJu0YyGAt9Td1YDfV3ZRq8NyvOwOmpG6Lg7LvEP9tBnHcaNLzElVh1N
	q9vQQB2TkEHwQ/9zJwHD4zwpCLwhu1xgp6eaJBAopHu6YwFrZs61PmvODCmXj/dQvMwLi47jaZj
	rGk0aj6zl3sPH+8DD1HmNCRX4WZg=
X-Gm-Gg: ASbGncswKvqunu8yO/SOwn5ts4n+Zuf+MHS4OMs5KuvQZlB0L06BpvUVxUAxsjZRDKX
	0G0EMtcgshhMR0oIifVsc+3Vs4p9s7weP42jtu597tEQaviX3lyjnrrRvdVKgQgDg9AlT6qRJL2
	/QJFdV8MZCF5mzX2qQHR5+Wvs=
X-Google-Smtp-Source: AGHT+IHdwW4hQa2cLPlWYrU5ue4mWciZc0p5rQqeJ2JBGI1XN4w7WGoKToi7KE7C9eD7Ld4Askkac6qqdMHiE8X06ik=
X-Received: by 2002:a17:902:ebc1:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-223f9a457bemr25544855ad.19.1741178766361; Wed, 05 Mar 2025
 04:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-2-florin.leotescu@oss.nxp.com> <Z8cp1xoIXT8lgD8T@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8cp1xoIXT8lgD8T@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Mar 2025 14:47:45 +0200
X-Gm-Features: AQ5f1Jq_yZI7Qka024KvL_NkiadJQvrOZEyL3YURWLhpyxIxGw7rSu6jJaSDwjY
Message-ID: <CAEnQRZCT4vfFBApv+C3Wp17Fk0-Rwx36h4eCTTygaXFYFipEGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Microchip emc2305 yaml schema
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_044607_750771_44515A57 
X-CRM114-Status: GOOD (  25.65  )
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

Hello Frank, Conor, Krzysztof,

Thanks a lot for your comments and help.

In this initial patchseries we only add minimal OF support and
introduce a minimal binding.

> How did you pickup the maintainer entry?

We got the author of the first commit for
See 0d8400c5a2ce ("hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based=
")

> If only one reg You can go through trivial-devices.yaml

This is not a trivial device as we will add some specific properties
with our next patches
(e.g polarity etc)

> Missing descriptions of the fans, no?
> missing $ref to fan-controller schema.

Do we need to add this now? As this is only the minimal binding
support. We want to add that
in a follow up patch when we go into specifics.

> The emc2301 label here can be dropped, it is not used.

Will fix.

> The nodename should be "fan-controller", not pwm here I guess.

Sure, will fix.

On Tue, Mar 4, 2025 at 6:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Mar 04, 2025 at 06:21:34PM +0200, florin.leotescu@oss.nxp.com wro=
te:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> >
> > Introduce yaml schema for Microchip emc2305 pwm fan controller.
> >
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > ---
> >  .../bindings/hwmon/microchip,emc2305.yaml     | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,e=
mc2305.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.=
yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..cac0075a65bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 SMBus compliant PWM fan controller
> > +
> > +maintainers:
> > +  - Michael Shych <michaelsh@nvidia.com>
>
> who is it? look like not Microchip and hwmon maintainer.
>
> > +
> > +description: |
>
> Needn't |
>
> > +  Microchip EMC2301/2/3/5 pwm controller which supports up
> > +  to five programmable fan control circuits
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microchip,emc2301
> > +      - microchip,emc2302
> > +      - microchip,emc2303
> > +      - microchip,emc2305
>
> According to your driver code look like all compatible with microchip,emc=
2301
>
> oneOf:
>   - enum:
>       - microchip,emc2301
>   - items:
>       - enum:
>           - microchip,emc2302
>           - microchip,emc2303
>           - microchip,emc2305
>       - const: microchip,emc2301
>
> So your driver just need one "microchip,emc2301" compatible string.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        emc2301: pwm@2f {
> > +            compatible =3D "microchip,emc2301";
> > +            reg =3D <0x2f>;
>
> If only one reg:
> You can go through trivial-devices.yaml
>
> Frank
>
> > +        };
> > +    };
> > --
> > 2.34.1
> >
>

