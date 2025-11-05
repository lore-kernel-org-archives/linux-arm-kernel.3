Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBB4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WgVh/W2QDlWrUEp2DhJYyH+fmgYqOSSyNzgizd879Q=; b=TACSinfjsvA66pVFEZwA3yacAf
	vnA4/2yYGwOFH1XdBImxHpq7M1h/TiRDkeRlrH2EUgB4hWG+8yqoNAUrJoCAS7PsmNu7xz1c3Ap+L
	E6TRUB1efoQR2X4G9Cy/X/aanvb3ZxoDxiaqz6cMzvUEEhuWVNhfhKOiOsbcYLIJPN5j4ES+4xVnx
	osPPa8abOu1XiTb6XoYA7yWQP3UC4pD+UKKgkinKfyRG/YBzqZFfclc6sLnrcjkZBPwlv2ntGjKir
	SbsQIsjLksZVZVQsQnSZjvcHEMcy5IOqk1a9l2v8+9cyl3QW+AZx3VpIlpVm5Dc0E8vW13Ljoc4kL
	jZiTwwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjiE-0000000ELmO-06Z1;
	Wed, 05 Nov 2025 20:02:34 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjiA-0000000ELlA-3HiD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 20:02:32 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-3c9859913d0so224049fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 12:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372949; x=1762977749; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2WgVh/W2QDlWrUEp2DhJYyH+fmgYqOSSyNzgizd879Q=;
        b=dYjHKasdA3i0K2V/k5Au2FYiA4QFHeucsyRYRm2k1kVDJl7ctRGXMvbehDYzwkkwvf
         tg7YnKBHtiKMGlq4ZgATh+t8CLOeSVBDlFeSajYGegfDYYOVt8YwdK4oG+wjMwakGX28
         8om40A+if2uv5B/FKAaou+MP35/Jref6X/Yyrd+6UHKCZDy5wsff8VihLIMyGIl3VHRY
         u+Z7inh9WnXIhLh/5T0yLg2tmSWvXm/iX71KU4NxsXSvbrS25I9eLRwK4MY+Lu4Jbcc/
         8zBmEX6YaLiZqgj3uixY+37UhD12FIvgK4PC1AkQoWh4URhbgsK0Zw6Srwpn16NDoN6H
         2Wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372949; x=1762977749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WgVh/W2QDlWrUEp2DhJYyH+fmgYqOSSyNzgizd879Q=;
        b=u9iylxUuUwlRbkKpuao6O0La9ZuPhU4tz0E6hi4sVzD4rF5FXjO372FCRacwsjjUaP
         5vPwCNcaG9F3ZcFmnF/W0USTDkwwpwOOnuM5FthT7yfozmcfZ7EZQoNC6xqbWLmQYo3d
         Q+4/uXjH35qgwP7JbihG5p6v0M8p/4Qqr4YMre4ZBjfo4frRB+YDZYzSIkvFEyT2Sgaj
         MCCpb3l8y/09bnmE1LUvCWDo7SbS7Rw1/oZiakH867Ab3fgD3IeCcWGWn0H412gOICJn
         kMgCORsT47Z8o26X5WjfCOTzEIECraNk/3I7AqjU2Uv2lLC5mxu4+lUZXglH/2ORGLW9
         iuYw==
X-Forwarded-Encrypted: i=1; AJvYcCVPVv7lGigUx92zrisFvh3rcw0/xTdgolGuxmXZm7Egm0zyjFUU+zJFVAN/F8PbtuSD0C+opPnW0MhUtkn4MJKs@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5Alt9HWgafkgsy4zjlKk2i7HesMFi4APzOTZqxZJDN5ftVok
	+OmNoKT/3STwW5bTweqlZs1apc50IjJ//mFbtJof6UnLP+68/zqZ4FEq
X-Gm-Gg: ASbGncu7ddt6tsY8VFLFXkwbYIETBzOqRo2+rVTRMszRdfHkpLUzoA8elLP8IZ7aQwR
	VWMDu+8JfYSo/Gf9tZQ5fULXUx1OESJzXqXDWWFIIXOzI3asewEcTqBJINceemJA0KpLyiyETG4
	i63iF6EGnKviaG3ApWeENVwgBVcGK718jZPjTaS9Fh8nWkddMNccOKonOxmPcieLd+T15S/8xsW
	Fm3QILAvZhMQV7o76YKMWVc+FrftcytwBNFiVyoPM5zVCB0DjF+o2xFREQ4dSg+VvrK9ejm5msu
	iwtwhwqRfpk4rgf9ieCgpT+uXNC/AFF5NgqSM+8dYmlvDe5f8zqtTP6OTa522P4gBN1BLqcfmQX
	TQMmpn5VENnF44o0sHhh3/mw18Ish9RrSSqbM0F+yCtTx0NsyXcxu9RlRVZ7BILA=
X-Google-Smtp-Source: AGHT+IGSwk5bgvA4Oe45ToOFpKJoB2+FDTxvWYOBhAfgVYBhwy6jRCcKmE2cTHy1t1Zs4TzsM6oc1g==
X-Received: by 2002:a05:6870:80d2:b0:319:be1e:9dce with SMTP id 586e51a60fabf-3e198e539f7mr2033360fac.5.1762372949003;
        Wed, 05 Nov 2025 12:02:29 -0800 (PST)
Received: from geday ([2804:7f2:800b:2ebb::dead:c001])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e30ab3f772sm53209fac.20.2025.11.05.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:02:28 -0800 (PST)
Date: Wed, 5 Nov 2025 17:02:21 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aQutTbzS8rfW-Esm@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_120230_822210_FD392F34 
X-CRM114-Status: GOOD (  16.78  )
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

On Wed, Nov 05, 2025 at 04:56:36PM +0800, Shawn Lin wrote:
> 在 2025/11/05 星期三 16:18, Geraldo Nascimento 写道:
> > 
> > Hi Shawn, glad to hear from you.
> > 
> > Perhaps the following change is better? It resolves the issue
> > without the added complication of open drain. After you questioned
> > if open drain is actually part of the spec, I remembered that
> > GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
> > so I decided to test with just GPIO_SINGLE_ENDED and it works.
> 
> 
> Does that work for you too?
> 
> &pcie0 {
> 	ep-gpios = <&gpio0 RK_PB4 GPIO_ACTIVE_HIGH>;
>   	num-lanes = <4>;
> -	pinctrl-0 = <&pcie_clkreqnb_cpm>;
> +	pinctrl-0 = <&pcie_clkreqnb_cpm>, <&pcie_perst>;
>   	pinctrl-names = "default";
>   	vpcie0v9-supply = <&vcca_0v9>;	/* VCC_0V9_S0 */
>   	vpcie1v8-supply = <&vcca_1v8>;	/* VCC_1V8_S0 */
> @@ -408,6 +408,10 @@ pcie {
>   		pcie_pwr: pcie-pwr {
>   			rockchip,pins = <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
>   		};
> +		pcie_perst: pcie-perst {
> +			rockchip,pins = <0 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
>   	};

Hi Shawn,

No, that does not work.

I believe the pull-up mux became needed because I was forcing open drain
on PERST#.

Thanks,
Geraldo Nascimento

