Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F828C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ/4qxzis310JPKxwHfUD3sy7Z1En+4L5qdqwXsp4Gc=; b=elB7Ic0JKDzoN+zaRfQJKXnLCA
	EzRNABpdAmsSatEA9tg4vA+pd+WEh21DRhPpy1eCUYnvDrYiGdZlm1fwRC9TMElGmK2E1qM921iqH
	1LksnVQziGCIge0aVf4B35RmuAslo3pvGfT2PfSVRMEcFNHYqSQeXWm6Ppu21zDohBeBE6CWahdPR
	FQvVS98tqBIrtlhWrY12czq/EJd8rI3TOyaWBvcg83KyXCwfPQXssgSyh+K7nJUbfJSOOyXxTSBqB
	2/6McYMs1LMFt88BNSC2SM6m9AkOW698WL1uJiilmkyRvo4fwT1CkIgtZZsgh0sAOZUsOoSzBCPJ/
	Em9QgTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9hs-00000001mYB-08v8;
	Mon, 03 Mar 2025 17:35:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp9en-00000001li2-3VZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 17:32:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so2048299a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023164; x=1741627964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ/4qxzis310JPKxwHfUD3sy7Z1En+4L5qdqwXsp4Gc=;
        b=vofObaMiVpOcOTZWKU4YT86kGwd94EdatZyKUlPu1YFkAN3sYXhNkscwKnDRrNpgrQ
         gVZbq9SZsavX05FIeXlPEFbKABQgME3v2l1i+9ItGiiJhdoK9It7fvmn7RmwpI1xUAUa
         mJ5Qp9FjwViRw5yZoo6fYigbr2ujO2GWq19dhAf6TzNwBhOzswGZjk1cs8YRoBNHZAw9
         BP8HMXUmCFpcrA/MMF6MoqvEnt0huWKStkgRuJJX7dWXXJYX3JD/CzaBoUaM6z9a2HOR
         lK+vB22MZOoEvPQcuPfo8xh/vhrR6Xe1UDiE0l763WaGMHWhqMO0iMWeDDc940TyGtG0
         Mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023164; x=1741627964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ/4qxzis310JPKxwHfUD3sy7Z1En+4L5qdqwXsp4Gc=;
        b=Idz6RMpnfVfMFSC+sN+xXzRt1Vo0AFfWqITEZId9E0xnDqRCr2jF+tfNRbjEv3nnXf
         OuSlSBuknWzeia9OykRv/OcUJovunjRFSrT095s6quTZ5F51jVAE8ARM4/piSo6sM+rB
         Mj2h/wRmcqo+fp2HxCf7Xt+VicsgvWkJk8tDksVLpNTt+PJtinJC9aQw4OEX7/R2oGSf
         mRnLpu/VG0rpoZB6kGYsGozCb5TV+ndxTkmLQb2dtYloEHaICkibVteNYxBwvIij4jiq
         nelTLGHT/BkAcu+3eizZKEJ3GUr2fG/HTVmj2NxWNKjCMjTrLvBNZrpk8qAfOdZTf4w8
         jjFw==
X-Forwarded-Encrypted: i=1; AJvYcCVgpF0G9s+6Tvolsfa2a6V4qfMYRGf8qmaGcDFKIE/3aNPvZCEY/B+oto5UDpsS6RsweAUoRpRD1UuJI1lUOBw3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy57bGCeTlCVtCgyur28w4FRr4BMtSOsXVa6vxihBYZoo8Pdwa4
	O5DdSp3T0GjxssVYU5TMw6gdasVxhAOMrjUnKlvsm5WkEMvSa2/4ZGlbTyC7JFtlWIuQepJln4X
	5
X-Gm-Gg: ASbGncuXj6ZcnGpL9Xw2CGiXOhQJa97M1a+AbMji80CQW5KmRw8PEzFzDqEsijXC6dE
	oi/Ffq7zZpMDhlt2MmoU6fRixVC8uEZ6waRPfVUaVejqe3gws+FrcNEHfKjNSKwqqPpXIzEUFjo
	hi7zOY18ImMqsqvVjaf+/V5lC36MJiA7BPgVihgQUsyRLkEnjxGbWA3vx4wq1GF8jGjhEJVEuHY
	69Z+xUPuXPERoLeLMUpImsSDTJWDm0NXvK8D5a/U16nhK/e0enfUbA/+brhJyFVH01M3nK5XMNj
	UTOQYJ/N3/J1dKfsu07I29pW19DSkJk9b9N7yWmbMA==
X-Google-Smtp-Source: AGHT+IFplOERSX9U+E9Rz8azUp8fETio6bPVPJ+92Yo7dBFoDZjtI8Gwjb0JWHGO53dujJ5eWDY9Fg==
X-Received: by 2002:a05:6402:3506:b0:5e4:d401:590a with SMTP id 4fb4d7f45d1cf-5e4d6ad4209mr13888763a12.4.1741023164183;
        Mon, 03 Mar 2025 09:32:44 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4cc6b2daasm6666153a12.25.2025.03.03.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:32:42 -0800 (PST)
Date: Mon, 3 Mar 2025 19:32:40 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-ID: <Z8XnuIIfDFykrKH8@linaro.org>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
 <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174102306220.2928950.8878245519332562153.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_093245_876195_F5D05D55 
X-CRM114-Status: GOOD (  14.78  )
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

On 25-03-03 19:31:02, Abel Vesa wrote:
> 
> On Tue, 18 Feb 2025 19:26:40 +0100, Ahmad Fatoum wrote:
> > Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
> > configures some clocks at frequencies that are only validated for
> > overdrive mode, i.e., when VDD_SOC is 950 mV.
> > 
> > For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
> > 850 mV though to reduce heat generation and power usage. For this to work,
> > clock rates need to adhere to the limits of the nominal drive mode.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] dt-bindings: clock: imx8m: document nominal/overdrive properties
>       commit: d5992f1af1550a9e11e42cfa2ca1ad2a1b7fd7f3
> [2/6] arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>       (no commit info)
> [3/6] arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>       (no commit info)
> [4/6] arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
>       (no commit info)
> [5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
>       (no commit info)
> [6/6] clk: imx8mp: inform CCF of maximum frequency of clocks
>       commit: 06a61b5cb6a8638fa8823cd09b17233b29696fa2

Applied only patches 1 and 6.

My b4 setup messed up. Sorry.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

