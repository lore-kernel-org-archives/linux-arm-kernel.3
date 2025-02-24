Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89101C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=; b=SbOj4b41g8NZIITvleaVtG/3/+
	EIq88E5tmP270L85h0LAnpmCIKoFJIKHrp/rMdVZGxSrWyBsJvf3S/EGd5BAoJD8tHQTm9V0EcEmq
	zB+raj9Q9mle8F0pIHr5M/wL6/FSPDekD6/o4jrMqEPjmZDvr/NgubZkcU9Ep/h+RC2C4Kj6N9SBQ
	IlJeP2Ydmw255CX1Kj2VD3qN0Oj7rDDwwqzWu/QB5bFAYc5D2nFkLhpY+rc/kGYdgACn7sowrZrsj
	psSpyjkBFfrOBN+EginwH9iuQ1XsKcMryR4/prMUzuM0/J33+/NziVt9yi88nxkRwQ0WEt1AJwvf3
	tgBBd6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVZz-0000000D6Cr-2v7z;
	Mon, 24 Feb 2025 10:20:51 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVRQ-0000000D4Cd-0Zkr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:12:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so7664147a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740391918; x=1740996718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=gbX9N1sKKWAZdg9AzFplvbGBcKlTq12qFoo9KTwaS4h27cCB/QrT5mc+lK8fP3zR/z
         SU8Cr/lRFmuMRYbPjD2ckcqQlgcLeekCZmtqcCR6sZG3WZgIuG3gN+ysrkHuvLNAxY2Y
         y57IIxfmQqEQHzKUWVynm4IzJ2mcXJOEk1qkXCKE+31y0zW4mRjQooTPYrUsoAg3m+n0
         ncpLzavXRcIgUNi5j4IUIbL57Ibktj7fW2l1239lAoiqyjIxZ4Jqzgpzm4k3KQmfV/hu
         Of6gpYNtZHtGy2arTAB6EMzsqIO4BsPoe7DMdTqrEd6/MiTIB3qZggihorvMIKL6htZ+
         a6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391918; x=1740996718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU8WACFROSgTLo9Ox03v99I3iVcvKceQqegZUMUwxvk=;
        b=Y90hJRo3rMDZHBgq3LVpoG4PAQHV91XC4Llxb8JWInur7v/QvGBB1HHJV3ipeqc5M7
         Stw1H/VGFdGMQX3d8a1LAfeI0r/0bq8iJby338ot/+V6XNlggFGA510L3fYn3iJP0Or8
         POswyNPowmvSXO6Y/7la7H3mAYSWKEX/p6yJt/MxZE91rOzDNV3bAbghBGsaaZz9Xnd7
         5G0vR/IHLcHd0QWFMxh5sYMzoxz6rpKaN8IONi1DCpznZdI2U9t/wr/isKDH+kBTEfBU
         RRRDHni0BmNrn53GP75FqPxYszUTRoBdNaJpFUV76GHl4ghi3R40EYR0qBDXRI59xDka
         tdwg==
X-Forwarded-Encrypted: i=1; AJvYcCULxk2jrQXS/ZYmz/JzG2Zfao8tNjlZyYP16G2ajSBiU6qyz94KEmTXGSPBHMtK7o33DcfS0U7tpAWhB2Q+tklT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/2vtAg4wzt8UaqWosnqOpvLFbK/ieno/PVTWvYgnlKtPMHN+c
	yiJStKTkZryOnM8CD3N39ze0f6w34Xq2oHnhuPO8crtJOrHwU/AE5C/y30L8qVE=
X-Gm-Gg: ASbGncuBI421EVMT7BbnYPvXUkobmCTPR0gyDNEv49ucm5nkE1SHvjFG1rkAUX6Zbzs
	fSkuwHqsdLdUXUalbqPi5dA9xrNPcysmcNmbOpqCaySz9KAJp5VfvrKLKx9ukSxZi7xoEQ6lIWS
	8KAssR3pF+EFVggxcQoiQVIzCDrvoXc3RJWlrNpeY6ZYds7c+h/MQ+cNUswCh2sugMd2CWubWzh
	lRSjNdk+juSPZFb9ezERj+xjnIjsjBvY2DmQvbpJ39/q6xRI2kaleJDzc9PwKfmLae/wnW47qak
	mtWmQWqitxW4pnvv0G0ZcWw=
X-Google-Smtp-Source: AGHT+IFBYGv39ku/WXgGCB6eZU2Nhkmme9NrVcRsypJZXftUwbVR6qfXWzvvkzePYp6cqUbaZIeE6g==
X-Received: by 2002:a05:6402:524b:b0:5de:50b4:b71f with SMTP id 4fb4d7f45d1cf-5e0a12baa86mr13103989a12.12.1740391918073;
        Mon, 24 Feb 2025 02:11:58 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709b4sm17963793a12.57.2025.02.24.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:11:56 -0800 (PST)
Date: Mon, 24 Feb 2025 12:11:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <Z7xF66TctF2wuoGj@linaro.org>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_021200_173433_91CDE5AB 
X-CRM114-Status: GOOD (  17.56  )
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

On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
> Some platforms initialize their eUSB2 to USB repeater in the previous
> stage bootloader and leave it in a working state for linux. Make the
> repeater optional in order to allow for reusing that state until
> proper repeater drivers are introduced.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 4e5914a76..dcc69c00a 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get regulator supplies\n");
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);

Maybe make it optional based on compatible or something?

>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> -- 
> 2.43.0
> 

