Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAEAC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=; b=rXTvjGw65e46sgRxWlycQHgkFE
	34d9l5j+MqKX6Ju1wGrhx1svBna+UMK4TF9FAGwc6PKu4YtzwvOb+AdprytIMDe30cY8wrTQzW4m0
	cQkWpFawysNrKOtgNUe3bz0STjTTqLrB1C+9oV/wxCsHhzah14C3HaFQAHDI4ZDO3a00wcJDlP4Fz
	kLMgCRhBSwU9/2Eu8lOq88zTPYEJfoahBQ0ku3BQjUmgYtYEH7CEeeljEz+SazTGCrrs/iGYRRwh+
	wzZl38w7ENa6dAqRPwr94eeQE7q88uMT9OW+a94o/DskscuhXiG4cWZcCF7thgL1ZdYUD/aHxJnQo
	5OuogFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBij-00000004p7F-1ErQ;
	Mon, 16 Jun 2025 15:26:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9WK-00000004Tf2-2443
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:05:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2352400344aso38745555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750079103; x=1750683903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=Hz+cakkmkByeH1FHYd4YpSXLIES/bD+vLoZ0wbFeIw39plCg7GVhTx+z5BMr8Y8aG9
         qFnt8TEAu4OoJCAKZIRhFkiBAaRlI0nCNZMuDdUFgEzot4w+LdG1MaI8xOHuoNo53DdR
         t8BKRKc6dczMx4WyXDISHxxIE/0MBqZoitT8tjsyTOD/vQHvgl9GYINOfNUtTAhl7mON
         k5Wok5ddyTXkIjvUF3J55dhKquEnlyWZ4BUG8MhLKiHCsVGK6OGU5qCVa2IkBm8m0F9l
         cqdjamUMzVdgRq6jdn2j3hwMAMf/5dzvyN906rgZfCRCsrMPM4Of/ujMjs9sMuc2PWgM
         vzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079103; x=1750683903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUTXDzJTms5RZMMJbgvvc42mrXG+pZ1XuTEHVE/rMMo=;
        b=FMosZiL4ibLN+N0HIE/nm8jsvpRqpyWuFX47x1bALCfi97lSjsw5j7BuwXAdVzbGdX
         PqFLaPOBDgRwfqgrZmmMOcxiz1em14hOh9HxQCRHPKjaAoVebZDxgmAw6Y2124GSNuIP
         V+JKHr5th903A1V1zFL8czK8CO21nIeg43KSS2P+wfJQWwb7ksxqTuPC22/sCL7RWO8+
         M3yiWiFkF3+VZWJnD6BWDHueRFS0vY8W3egO8K0vT7KhqDdvH3D8vfJP+1CP2EvnM2nq
         eN00mj2Qft85QqaxDKqMqB7hjoDqlIGTTOn9JkLYD38ca8duJuibxK44m6qNJ6fey5lV
         iFNw==
X-Forwarded-Encrypted: i=1; AJvYcCUhUHBsnObRRP533WG9akGwN3ZuM4wkcrTTpJvv6aWHZbGQg0Y9vKahHLDzr2yMAB2MC/AMPyx0cXqG9Fa+TByd@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ8lilP/jMFQ9qcG2B4aW4obtZ5UbFn58TgNBLhN2M/oMveuJ0
	8HEzCeT/g9ypHZiNAPpRv1y6VEWfHMgZIRP7PupTCQEt8iDBd9kKNUlFEOgZIqws7P8OB8msadp
	bZq7tOqOm1kN3ZKL7VXjTrttqp8rKlYk=
X-Gm-Gg: ASbGncuNf9H60kJXWOURB/lxQGzEh4V5QEmi+h60Io0mpQV9cnwRo7CXi8/BYxdnwjg
	kIUDP0KMOPWm41hGo7ci/fQlpv9BzdhbwrZ6f6L2wWUyHeuk9TtACKoHvYcUSrQMlvtx3+fgG9Y
	qz8wT9J0fCL+112Bm2h3vjNo9vfbo/uvuJAWFj0f0k
X-Google-Smtp-Source: AGHT+IGIA/B2yzj9kVtPTV819XunUr+pzfOmCuEtfwePf361QYYolQtgx4s3tdeFt0KKKXYZVrT1BQRfBwQae0le85A=
X-Received: by 2002:a17:902:ce91:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-2366afe7bfdmr139261545ad.14.1750079103282; Mon, 16 Jun 2025
 06:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com> <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 16:07:02 +0300
X-Gm-Features: AX0GCFsHX-yp69BTpUbkYuCgM8eD072u2RLLllJxgon-4nc2mIU3mnAX1gZC5_Q
Message-ID: <CAEnQRZCQj5b9GSb=i2cTn4YKtAsQPTwJ6DkiqaZjmrmboim-8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_060504_537549_B54D4A8D 
X-CRM114-Status: GOOD (  20.65  )
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

On Fri, Jun 6, 2025 at 4:57=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> i.MX95 has a System Manager(SM) core runs the System Control Management
> Interface(SCMI) firmware. Vendor extenions are implemented in the
> firmware, Logical Machine Management(LMM) protocol to manage
> Logical Machines and CPU protocol to manage cores. The documentation
> could be found in file drivers/firmware/arm_scmi/vendors/imx/imx95.rst.
>
> Add below to support i.MX95
>  - compatible string for i.MX95 M7
>  - fsl,lmm-id to indicate the LMM ID of M7 LM
>  - fsl,cpu-id to indicate the CPU ID of M7
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..a3ffab60df52be6f1d7cf4846=
ca5ba1c40f03bde 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,7 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7
>
>    clocks:
>      maxItems: 1
> @@ -68,6 +69,12 @@ properties:
>        Indicate whether need to load the default firmware and start the r=
emote
>        processor automatically.
>
> +  fsl,cpu-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the CPU ID of the remote processor
> +      in SoC which supports System Manager
> +
>    fsl,entry-address:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -78,6 +85,12 @@ properties:
>      description:
>        Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bi=
t.
>
> +  fsl,lmm-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This property is to specify the Logical Machine ID of the remote p=
rocessor
> +      in SoC which supports System Manager
> +
>    fsl,resource-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -114,6 +127,20 @@ allOf:
>        properties:
>          power-domains: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx95-cm7
> +    then:
> +      required:
> +        - fsl,lmm-id
> +        - fsl,cpu-id
> +    else:
> +      properties:
> +        fsl,lmm-id: false
> +        fsl,cpu-id: false

Hi Peng,

Can you remind me why do we need the else branch here?

I mean if the compatible is not fsl,imx95-cm7 then the properties
fsl,lmm-id and fsl,cpu-id are not required and I think that's fine.

