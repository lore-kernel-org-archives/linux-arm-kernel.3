Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F09EFCE5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/oY6Lj6y92CrkHBsRn24dqJ3yooac2+GrQjHYegtCQ=; b=DASylnpF/D7AGKLs08cHLFFas1
	vt2clj65SHmRBelmUwapnPHSQrLn1NUVu2d8z5JIzQxcKxSTX8fCFQFnL1M7T79dYedfPxMYBkjZi
	Mf9KxCWl6S+5ayaP9YII3BAo4UM0FjeKk8V10GSwkP1CjWTVwzWScOfswsDLAgDbBroiAFQJMSeXD
	TVr6/wez7lIcBBAbJqf2dkA+LkGS4fZQCYW5eaXDSndFKZwhq3ReTzQP23ucfXLXDA7YIraVoCcvF
	ID8woG1q1Kz3PiXqygLJFEqhYnw3s6g2+cEopcrZwj7gwvFD5q7gQ7rYO1DIuz1iPZjPJ2EAgt3hA
	pWd5KMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzhp-00000000sBS-273C;
	Thu, 05 Mar 2026 03:48:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzhm-00000000sB5-0qiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:48:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-482f454be5bso78171885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772682532; x=1773287332; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/oY6Lj6y92CrkHBsRn24dqJ3yooac2+GrQjHYegtCQ=;
        b=rBRSh2lCOX5EfW7MbGZ3o2ysvlbl0BWv5Fw+kKxs1pcoZ6mKjNTalvs8KsK4/ITAhY
         AeqTd76frOTBeNBYaBmJ0jPL4yZoLGIaB+aX9w/3ojfvXKtTTuTTGB1Pw2jWTDgnFJUV
         I4A1B48nM9ZxPNoieXHmQhGW5hOyLTtRdcCkoRb9kPf3Bwb+ptKwQAkTksTIuX9kDPj+
         aLfl7vly5brYArlB5AkY6pZ5j17OZ4yZGIQa2sikJ1iUD7yI3aHrRZPJDit5z2gvTRjU
         JVwcmLUzCzlQ2vHq4fntpgYfACWppG4knifdKFEdO4DMJJqrot+GHy4x6MZc2k48/YXn
         hotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682532; x=1773287332;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/oY6Lj6y92CrkHBsRn24dqJ3yooac2+GrQjHYegtCQ=;
        b=idbu6FsExIbZxm1pHMkUkWniESHsGp1+Uqp4JUKT0GwojWQerSiTIWeA/WE4mRDW4/
         ak8T+IAyQer/Wd2CiT8ZDMMO3HVI6JK21UarlNOub6H3K0ZqhFPtZf6btyv51tV6o7hs
         VCrU5kNPFxAvgBCE7uHiyJH0HXxnI3Vi5h6MVr7Bfm5fi2YCmw3n+F1D8L3AdIDn+yb3
         s+akYF9pPgDdgEVQVpRF5pL7G9tP3Yo9nC6FBd6Rwt1MGp290iIe9PGfKf2w4VDLk1t/
         6OePQcaHYGyG3QarMdcqpz4L7S45NmmIoYiGSVFr9JDjpZa/iUODOqyZlKcTWGifnfPU
         S7gw==
X-Forwarded-Encrypted: i=1; AJvYcCU+GtuuV5rdIe6fF0VIQ6chnvzva5XfYfAxbKTXPv6J1D138HF5kHc2PEQBI5wx87Omv1DkgE57Qj2UrGJ7V3CW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/p5D4ksS8qfdLY7F6wTGavCEXOex2P/dpKLnSbLnOTtvnJlU
	Mz56O51wm1Ar4cwxWBt2c6EeLVZRX1a5nKEcNyD4qMIYtnluuSwmCDsapvWfED6QQRo=
X-Gm-Gg: ATEYQzz8vXy7snEEyYFCO8r9cL9zr29i2ZI8YDYGsk829MRPQVcpqBOAwGskmCmO0a3
	+/rnGZdzZhPJddT+nrFEjqFEdEPwHta0Q1cY4QmeLK00aH+G3QGaPeFk7O1GXwXBWkGrPVLZVvk
	ukZL6baLjI6eS7F9ohE1WoCRghGaWH7uMPcC8DRSHTnjoiU3BmqRU1fpTtVnhnXT+uYnzXLNf65
	K3qjmmIjUsknlUfABcDcrX2t2Nmd0WmA5F0lK4QCLh0CXlC6up/lDO6CwiLj9BYt7Njrmxoi8pf
	huh4t/0g8PDJoncYkGpdgmksoEQo2AClDwT3SYG/ATiNQgqMo972huW9jlAZKdUilUqf5FaZwZ8
	VvaIcSUJWKCZHfqEsGLIw4a7ervCM60Ur0fDtFxGXKiMe0/dJ1WPiTwvYR8Se8A0UFdN7O6lN+I
	5vXQ9fXGsFOLD+b6cmdCaSAoRz838eml8XsTYI3ThPRWx1mbJZot6Pn5YpN2R2EemTxEUYFtvW/
	ZtwLnJlEYovVyCtgA==
X-Received: by 2002:a05:600c:a08b:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4851eea3fd6mr10898135e9.15.1772682531768;
        Wed, 04 Mar 2026 19:48:51 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7406:79df:b00c:2c64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae02a8sm16711195e9.5.2026.03.04.19.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 19:48:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 03:48:49 +0000
Message-Id: <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_194854_280689_77039A42 
X-CRM114-Status: GOOD (  23.00  )
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

Hi Tudor,

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware.
>
> While the TMU is a standard memory-mapped IP block, on this platform

this ^^

> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 67 ++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-t=
op.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b09e1ff5d89194b570810a042=
c75836ca2e53950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Google GS101 TMU is a thermal sensor block that supports both dire=
ct
> +  register-level access and firmware-mediated management via the ACPM
> +  (Alive Clock and Power Manager) firmware.
> +
> +  On this platform, the hardware is managed in a hybrid fashion. The
> +  Application Processor (AP) maintains direct memory-mapped access
> +  exclusively to the interrupt pending registers to identify thermal
> +  events. All other functional aspects - including sensor
> +  initialization, threshold configuration, and temperature acquisition
> +  - are handled by the ACPM firmware. The AP coordinates these
> +  operations through the ACPM IPC protocol.

Is it Google TMU hardware block or Exynos/Samsung TMU block?

My understanding at this point is that ACPM interface, ACPM protocols, etc
appeared on Samsung SoCs before gs101 (maybe even before initial SCMI
prototyping). It looks like ACPM firmware, communication via mailboxes,
TMU channel, dealing with TMU behing ACPM, etc are actually a standard
Samsung Exynos architectural feature, rather than a Google-specific
implementation. I can't say though what was the first chipset where it
was implemented.

Given that this is a Samsung design that predates the gs101, would it
make sense to use more generic name for this binding to reflect that
it is Exynos-derived? That would save us from generalizing things later
(if it happens, and I hope it happens).
I was thinking that name for this schema could be smth like:
samsung,acpm-tmu.yaml or samsung,exynos-acpm-tmu.yaml or whatever works.

Thanks,
Alexey


