Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C64C36001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EXV+liqXecF19/95E6X4B8HYwLOUANKAp4Chr+5IZE=; b=yG+SVgRiqZ5G3dxtlPn6gqqeZu
	qrpCamLYC5IPIvsqqN/o3apb7pYUcYb+qIRc6lxtV+Jr99XLrP+ZHRFlrP7rb3fnn1NRbU8o8F4CA
	jawCGihWOEPPZ3Q4THz0EVOuNHw+ncugShlsJzMPabRCEuU/fjZ5gBe5OMuTwo2pVZew9wbiri4AB
	DOEZV0gvJCiwjpygHdF+1sc0f5+SdW3Oav7QQx5lFm1EvQciT1inGDbj2pBlcZ7nXl+xZZm/+5rXw
	216PD4ueHFuLwFY1bLXCq/GYIdAppV2RYfIYFLKL3IA3L/Yc4NbMhjmJ23vlD+fpYzPQd9+5AqMPc
	inev8urA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmRp-0000000Gbbr-0LGe;
	Sat, 22 Mar 2025 00:10:45 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmP9-0000000GbNf-35xj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 00:08:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22409077c06so33755825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742602079; x=1743206879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EXV+liqXecF19/95E6X4B8HYwLOUANKAp4Chr+5IZE=;
        b=cU37evhIHF6NNVsMoDMOrKBMPSgJopyW9kbzWEo3N0D5VZr6TNL0SGI4K6fbhmaH2Z
         6Vhe4V8v4iDTrt3HpaOOp6L6OuXO7s0AeI+enFmL9FxJZXBJhiFoKzbywPJqmC9FvbJs
         ufqf62QGGEbDhNm9APfmkesoXd2ZjMWqHPEjJ0p/T75qTDj/RcGzJ12wWZS090XvMvHC
         Fb5ESzhFPDZ/+G+ZJ7UYuYyKj2Qn/cvzdG0hc4nLg3Y12BHHAIlxoKP+JFTko8T731hT
         O6uJIm9PIeHqWh/cejAnXgFv351QrD4JtzRdG0f3y7eWAPoymKdhAEEwu0etH0dEK37F
         274A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742602079; x=1743206879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EXV+liqXecF19/95E6X4B8HYwLOUANKAp4Chr+5IZE=;
        b=GBHhOCJi40R/SQ/xbyLMGiiPS/EO2jlWLm2oPlUt0ynQ4W20rvTpDDuaNE4slfvp6H
         76Eqc6+9Id2cCfV986i88SUEs6RE3WzVz7wKGM/t1r7NPWDMII/nvjOeT2NWFV9eozSD
         s1mb5V0gDT5fCy42Dog6Qh3QieX8ZtF+eMt3cAiWI4fb0n6XhSZU54VFirHhnFFUieCr
         wm4FR1CUx6BMzzt3eyE9JarLMTSirgV3jNadXRsM4jY0QnOy0w8Tg59YN9k9UoZvEifA
         LFqmVYU7DouiebbmHa7PL5ytRFibB/T0M7E90UZGbcQbxknWmmiHkMZh2plqiLCN/rlP
         MTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnVOQqaZ/Irzp0/5kKvgLk86cvyEkr96N3k8ahQZHRD1jGhyeN6uVAhK1LFWnCiwxIIvsU5MxZifBWmIWusDJl@lists.infradead.org
X-Gm-Message-State: AOJu0YyTIPcDppvNTeEkKOtxxEUcYO9qQOf6/AaVklf4GAiNtq5yHIXE
	E9lX1so0m7FeCn37G+IrSeBRmGiL1+rou10ERH37S94frNe5zQIJ
X-Gm-Gg: ASbGncuB22c70jujLNzqiDS6yjuv9pNptTO8mt/gYOkZAbKr8SMO0fSqZG1bHjSa8YR
	fRN3akhql0yYoazThMckyyTP0ZJ2N5gNz3jgbS8Mrrfwz0g5XKwas0frXtcGZZqYBuXInVGZ0mU
	i1lx7554o0xYdA5ItMruUfTz27mkQHDR7WGXZ6zY5ED80L7KOFFTXkjt+itUW2yNc4ruYjzvx5S
	cuHDuchWPuAqFRmdiErrYnzhntbIfBZOG/qzsx/wqEQbYTmwuB1Uf240NUvevFxTiD1eDMPl+Sw
	2LY84HjQF4pFCKBBLIhd7a6X2ZetRf+HGI7H8Aab3JBbYcyMEBFmiJUmnQ==
X-Google-Smtp-Source: AGHT+IFG3IzHoUnF4Irysf7rShLOoFBmDOITsQx3iVCYXu5PXAFkhXgqbngY+idRPjClaq9zGMWhOw==
X-Received: by 2002:a17:903:32c3:b0:224:1774:1ecd with SMTP id d9443c01a7336-22780c5599amr67690555ad.4.1742602078632;
        Fri, 21 Mar 2025 17:07:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811bd143sm23906575ad.150.2025.03.21.17.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:07:58 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:07:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 3/3] hwmon: emc2305: Use
 devm_thermal_of_cooling_device_register
Message-ID: <f9982a05-5104-426d-b9ac-de4b5c4d465e@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-4-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-4-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_170759_775304_E0A13A9B 
X-CRM114-Status: GOOD (  10.38  )
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

On Fri, Mar 21, 2025 at 04:33:08PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Prepare the emc2305 driver to use configuration from Device Tree nodes.
> Switch to devm_thermal_of_cooling_device_register to simplify the
> cleanup procedure, allowing the removal of emc2305_unset_tz and
> emc2305_remove, which are no longer needed.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

