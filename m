Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF10C83F38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=; b=ZY9nvAh0TgFfyEkRq0ynlswokN
	DgoOtt6u++Sy1OHBxCVg4E3fou1iIJrDUoiNonEYympJKTodXMW0OMbVJDPgviv56bOUNB2Nl5SE2
	NXrfgVr16gtv7/rJ02dsuheBt2Pvnb384KD1Bmd4iNu4IBIm2SVp9Ocv07Mfe8VhZtnGzGqTptMOu
	9miHmMD1OpFKwt2stGoT/pTbd0km4Ua83A7w+xLKsO/0kF93IOzY1pTcMvONZjH2CGnmKW39B8f/Q
	K7lPVJ6kDOY1CQHXna0jZAY9EiL21AhCcSfn+ANLDqGs+GtuCTES31AvxHlJn3Duxis/s7n5DtFsJ
	4WnqXQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSJ2-0000000AmBT-1a2p;
	Thu, 17 Jul 2025 17:22:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPuh-0000000APu2-2dmR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:48:48 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso860839a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763727; x=1753368527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=LsbxWxtTs7HFcP01y5MNC9G2w85C2J5gxruPulR5peA+vvbEil8G+XVWR278knZfFT
         XtbOcxYWIAaez3BRsJ2Ji0N93xCqrNtDDUVoDeXRpqAZ2MFf5/jAvqHuyCq092MrI7B8
         YokJN8qv3kQRMIuwXT+Zq9OwsnHdHxHP9GVMX1ul5SpFuVEsXQeWW9krIbDRR6Z5GJt3
         JbJMyVSPZ7zj5x94cmMCHHk2pNJWFe1MSfzcPVAh3nXc6M2fA8TGhfvzIuNt02JQaB32
         dgzpcbCryCz9catOmZME8hSNk5L5APJR3Fdj7uvdvHPP7yR6I3/HtlWzT3GegF9OsK2V
         zMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763727; x=1753368527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=cFjWQ9GM6HVPzcZMzBfyt6gL4QMvfsuUdhZqpCFJX59ymub4Uwqu/FpjKJuTOxoN45
         IyQihWzy3nx+VQc7M22iSui0vpXz1m95NZ1Z5pR6Tqver+D/naeAOXkaHQAY9ylrzjiz
         TzkTsEsoXlTyDtOk1qwmA6w058ut/3LY4ChetEJPiL6BmU7DBFPJPoaUoogZ6vQIwuH4
         pJ61Pk/OYc8BzaHgdZbaUzQ9raF+JuNzFnNFtgreO1y6XZvXXOd+xYBVTG2ELobOeFZw
         ENTiCXcISZp39kmMlWJAeyhOletXGgeqIuBrDWoh1MiuwL8hJpQHu18P1xEd1FKDxwPj
         WZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7QVlaNzps/nWdhGmPrvl9IX3HEb1BihSyhiae/iD0u7VbtMag02f8fUctIhbxookWJifD1ld0m806JzqX+D4C@lists.infradead.org
X-Gm-Message-State: AOJu0YwHfx1q6sOkaQAxEvqL3lEGesqfXhlG1R7OWccvEU7JupWrPPGg
	HpAOxlFIApo4WaRyr7ylI9V/Hi5cmHoyjmAdiYD/qEWjJhLrBUECQa981Jiy8Q2liS0qQaMgHj5
	I5X4aCac=
X-Gm-Gg: ASbGncu15a7EkxSTwchCq7LeG12jNZW+2aFf5ltCgObuO2hBEBHjkcX/tL+TqHAapwp
	DFH8rn327HGbWTMKU/EDlqbeo0AJpdkV2I6nBecwg8+Tb80GZ+agi4h4IFlt4neG1GHcb8deVB+
	l5VL4BTN9hcYXISNNa8IaGMsjX/8ayLDIuzpeaTnYialDqLluDS/Yiz0/6gx/+4HbF3Abl/zxCU
	Es6D54xQ6gF+VZqe0irskhl4KwygR84Yu/2ooSQarrzkyxX/LppsM/1Wpbnr16zvSYLn5SN6Za1
	71Vs0bPfCgZpG3zjFwK/d3NIB8lW7ny0skDYG/OnaWPnNH6fU6udH+wl6s04NvwSvY1sjhC9Luk
	jNNSr80OnFFdIl9hVy02PXlBI
X-Google-Smtp-Source: AGHT+IHN4pdN+q1y537irHaqdVIJwMrH6auGVoGM+UN248YAGpQVjPDa0P891RmdfAyjRaEDEvnJPg==
X-Received: by 2002:a17:90b:3d05:b0:311:c1ec:7cfd with SMTP id 98e67ed59e1d1-31c9e76bb39mr9637297a91.26.1752763726789;
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm3578940a91.12.2025.07.17.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:48:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aHkNS51jgV5ulsNB@p14s>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_074847_669164_480F4049 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> > 
> [...] 
> > New warnings running 'make CHECK_DTBS=y for
> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> > a7123e857dfb@nxp.com:
> > 
> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> > scmi (arm,scmi): Unevaluated properties are not allowed
> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> > unexpected)
> 
> Same as replied in v3.
> This is because [1] is still not picked, not because of my patchset.

I won't move on this patchset until this is resolved.

> 
> [1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudeepholla/
> 
> Thanks,
> Peng.

