Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6F9CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGWR7Op0jGJB/hnyDRBm1VaEtVV6gV3pqYTKcigBXCc=; b=b3YGSdtAhDpDnEfVxKzsu8X6Hz
	mnF1KpFLnRRSVcvSKOnOm5kWo+zLbcvbGXjMbKRhDohnnktYHwF3b/hxdObsRJP/irRJuWC1A8snz
	tdLXcQXepzVK67POzk64af+My8I7EU9idaKvJdYyoCW5C/REMH6cRszo/ZMcEQZGH58yAaeNS9uYy
	cTbpy+PcjRTRxtKVllTUzeIKkGojIs4K8gAcF7zc8HbjfSB4APvnGT2gyB8N1rYLYHiQl8ls0GzJF
	8h/XNs37EyHhEH8tNGbFFhTIPwA7yEOUytkVVoAX/G7ovvyMVbBms9jbh5NobYntMiHYAZoEH84cL
	eOTdRYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jUi-0000000CpIh-2S1o;
	Fri, 03 Oct 2025 17:23:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jUg-0000000CpIG-1NVj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:22:59 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-71d601859f5so28522047b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759512177; x=1760116977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGWR7Op0jGJB/hnyDRBm1VaEtVV6gV3pqYTKcigBXCc=;
        b=RWOtgBVYBFdwe5+GkbwNLlGIK5zKewO3Eq/AbTvwQm5fQwiGsTO46RxYYnYPghp64t
         dncW1SSWYkNl89P9Czj30zUGgNMQWYDZELgk1zxUTYAepDhkNxz25F1wUzhcY3c6AKu6
         ukamzTyAfKRQTN4dkAFd6EIv7QyeLxduaTGa/ccQuLpNRCXN4Qs5hBPs/AQSmK0ipvgK
         ex463t9xoJ4E27Nn7682zKQN/YGrrZo88D4jBOP0Bx1+lDn+ZoFB+ENzbTMSxiXJWmp2
         6wpO86tgFGyczfvhKeXmiVffNf9WDmfa33gxBJ9x8+/qfZMTbHvBwxKrsSN01TnBHA7W
         yWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512177; x=1760116977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGWR7Op0jGJB/hnyDRBm1VaEtVV6gV3pqYTKcigBXCc=;
        b=UdNFdQRnhla4VPoFUzImbz9d3HDlq9fjAZLEA1XUe89Husb3agiTmH8FIWvurd9osf
         46A2kpaoLdSnutWqcr5YivNGMUNxge+PWq6PYe5dy1micn0SyGzg0kyS8rlQ2s6SbvA8
         0BI4u1JFHWPjiFXqS3bsQgiMtaAKA8jVTBbglRlvMws7Joc9W/hNm9SuBjw0B8mdv3BB
         FErc6+bCJd1w3sE3/ttyzDVwieZnsNO3lA3Qmij/PmM00t3eOFLD+jYM/vji8AlDRFMe
         q/0IvEGnm/HDnXPyC4CnCVbWTil4O8JeXQxvFERPzozBvgiof9kxYYm6+4SGvPWeb/cx
         jH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXJjKlzpktEd/DOxs84t2hjXgViHyhsB7dVnEW7mvAuNYIyQiikuRQ8oG1+/B0zm1gVDqfhnVsWCgHv/THEyepq@lists.infradead.org
X-Gm-Message-State: AOJu0YxoFShHsTsq6ODItvRDqcjpHmI6AQieMoSrYHF1ckXiqGEWiBC/
	ooRgnF/qTEjl73rGNEUbSkByvQUcE1rwxWH7LBjPAcsWBT+eZDi8cfIv3TxLiaUG0EcXNyw2oMk
	rzqrHv6oxZGwZYBLq6n6GiUUKn1OF4mulhspRbYfE3w==
X-Gm-Gg: ASbGncvaWmuZqET7ozbCsvc7FYZAbP6C2XUYD90/w9Ouy2LrgBErXN1bsV2Mxkxsn6G
	H5Yt54ydh4NZyIwLtVMkZFD+V5SKrOkjXtNFNGiH29/Vh8fyoJAVrOEW3p7KPt+GgA0jsVqjb5P
	Bje1hAEI1GGMis8OV6qbKTDelSQ23ZKYKIjZak01Nlf4sWaXkcDPQ1KUPNl2u+T0mq3/jOKeyrq
	OASfVcbzT/NEWEaqe8FUP5BAJ8pJFRl+uShhLqVXZko
X-Google-Smtp-Source: AGHT+IEaOvU8KB5Em4L2bWs/Xj/IkcvvxTcqZJWq4PxSiqWi8wXfy+Ft4q6LsFqAEYTMabgdZG5h7FcKPPHNINr43CI=
X-Received: by 2002:a05:690e:1c4:b0:636:d230:7d82 with SMTP id
 956f58d0204a3-63b9a0e08bdmr1960868d50.26.1759512176832; Fri, 03 Oct 2025
 10:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org> <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-1-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 12:22:46 -0500
X-Gm-Features: AS18NWBQR2ismkqxDcti8kjrNtnGND89e5O87aRDbFrbCUVqVqwZBLFSImHDwoE
Message-ID: <CAPLW+4=mVbXex9Sxm2oEq0j3RJ0_KtXRq2Ttt5cfQ_dxXTuhSA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: allow specifying read &
 write access tables for secure regmap
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_102258_374384_0710C671 
X-CRM114-Status: GOOD (  25.69  )
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

On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> Accessing non-existent PMU registers causes an SError, halting the
> system.
>
> regmap can help us with that by allowing to pass the list of valid
> registers as part of the config during creation. When this driver
> creates a new regmap itself rather than relying on
> syscon_node_to_regmap(), it's therefore easily possible to hook in
> custom access tables for valid read and write registers.
>
> Specifying access tables avoids SErrors for invalid registers and
> instead the regmap core can just return an error. Outside drivers, this
> is also helpful when using debugfs to access the regmap.
>
> Make it possible for drivers to specify read and write tables to be
> used on creation of the secure regmap.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 3 +++
>  drivers/soc/samsung/exynos-pmu.h | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyno=
s-pmu.c
> index 22c50ca2aa79bf1945255ee6cc7443d7309b2573..9f416de03610b1727d8cc7761=
6e5c87e2525cc69 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -635,6 +635,9 @@ static int exynos_pmu_probe(struct platform_device *p=
dev)
>                 pmu_regmcfg =3D regmap_smccfg;
>                 pmu_regmcfg.max_register =3D resource_size(res) -
>                                            pmu_regmcfg.reg_stride;
> +               pmu_regmcfg.wr_table =3D pmu_context->pmu_data->wr_table;
> +               pmu_regmcfg.rd_table =3D pmu_context->pmu_data->rd_table;
> +

Seems like pmu_regmcfg declaration can be pulled under this "if" scope
-- just a thought for future.

>                 /* Need physical address for SMC call */
>                 regmap =3D devm_regmap_init(dev, NULL,
>                                           (void *)(uintptr_t)res->start,
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exyno=
s-pmu.h
> index 0938bb4fe15f439e2d8bddeec51b6077e79a7e84..113149ed32c88a09b075be820=
50c26970e4c0620 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -27,6 +27,10 @@ struct exynos_pmu_data {
>         void (*pmu_init)(void);
>         void (*powerdown_conf)(enum sys_powerdown);
>         void (*powerdown_conf_extra)(enum sys_powerdown);
> +
> +       /* for the pmu_secure case */
> +       const struct regmap_access_table *rd_table;
> +       const struct regmap_access_table *wr_table;

Maybe it's worth to add #include <linux/regmap.h> in this header, or
at least forward declaration struct regmap_access_table?

Also, would be nice to have kernel-doc comment for struct
exynos_pmu_data at this point, but it might be out of scope for this
patch.

Other than those minor nitpicks -- LGTM:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  };
>
>  extern void __iomem *pmu_base_addr;
>
> --
> 2.51.0.618.g983fd99d29-goog
>
>

