Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D3CF30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/3ao61LTSp6jCCF+e+2SF+gp23jwVu9a+x2K0Dcxpg=; b=O+fefsrhA8272KAZIXeBnxmtdn
	u/iKyrQ1mCSO27GWhm8kFxKAemhfAv8ecEtTeOeFeH7huHIY6BCdKWNiH3jcpao6BkpRHlDww5QNz
	kal0f/af2wZPgl1/fY0bEyj9K9OXmsOaoBgcYrHZjR7UrmePM2AyVOjXp+cWfBMvdNKLBwZ8n8ytW
	TdxfS/QN2NEbUSunrO9YoxU0Vc3JOesAeV2aVmvUy0MaiBD4WSHDjMX0Haa5QZ6GdgCe9h/f2dlHe
	IK3eTiHqGKLyFZsJh/z9NjlU/rf155YhKJJs/dwFSu/P+p7pxhn9JGUQAaRprO2pWjKrW67iuvwjV
	YNfVy0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8P8-00000001qft-3XSi;
	Thu, 05 Mar 2026 13:06:14 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8P6-00000001qf6-3d1g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:06:13 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c7384f5a9cdso602064a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715972; x=1773320772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/3ao61LTSp6jCCF+e+2SF+gp23jwVu9a+x2K0Dcxpg=;
        b=DiDpwyjCBj4umiG/wBGKziMMftmCk3qcmkL1M13HojRVsFr3/FYKIPFfO3oFo8tMSf
         ghR7I9TQBp2Q514bf6ROEZa1gjmYkh8J2pa60u3f1hhwXgBC8QtC7Aco8385OwZrhbiX
         5EAtXqTHNvOO6iCtQ+ZKQmsVZWhHTwyFrsrn4bzf5BdmFUWklBKhr/3dx466Ht5q9WkI
         /sjgXMe+GreDlYvlX2HbbObgvrRX61X7SIoLO/fAN7/TxXF5476nPK7jnyrmOOqnAsgq
         CSIWP/8iNt8S3l6SI2qd4xBFmC8ShYAJqTTC4IRAIDsPOCOs2oF7yl1cKoqnRUaWed1u
         ZK7g==
X-Forwarded-Encrypted: i=1; AJvYcCVi5oJKrCYEZE/ugqyt98+ByfOAs0laIEMBLmOBzbG91OqlkdpFXjR/EoCyID2tfHWKa6f5R0NwDRiqIFgY9BWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGndHg9CEErLty/O/09Kq6/WCyVUkbOmaNrtxLCJzbbsqL1Qn7
	NQLUwuGSaJkBRQ8RbN+0v/Jw+Nais2bUk8StfAFADIfM+UZnTmrZVW+j
X-Gm-Gg: ATEYQzxptql0eFm5bi2+vt5IbO6MYL1or5PXjFhUYK7oypxfB8wOMCVPxQqrLwRIdTb
	lCtPDZDtc10W+wGOHOK0/rKNlMXbmCpJMD+4UVF6NedCYSatCHKiU/WVKLWhj77va9IJ6Vs7Xgw
	gqamdOxBRT9fHpobeyZ9gyrh+rZeKItEsOaTHqfFSaA+lANBJU8Pj8ieqitYtakUYu/XbHgvfHB
	EiDrBGGGak7i0vcaL6L3wWaaSd5t9IxjPRJldU5zh5JY6rhVWV6Wta639SArvCMv0G9IpU/Ge1p
	eRrbHCXF4G3d5cOaLduuDZOHAd2CsqbLmgNwePUpHI/fcWR6LRwBo4qCOZj6aUOZFBBHBkFND8f
	Feol2xviBC7L6TIz7YlJDPuYnCqi6le2aG9Iz6mx5OSOWp9DACajQJ5eCmkZT6A0pry8BnjZPDr
	PDR12EZldTgpIKbbOvpg999pRDXR6D2w+G/DNBs3A1QXQeUmlW99TPSJPwsggjc3XAaLTNVg8P8
	Txc6MkH2SusUcyikaexKiOJcOpIym5MhEfTyPsqdjOb8BFe6vY=
X-Received: by 2002:a17:902:f68a:b0:295:560a:e499 with SMTP id d9443c01a7336-2ae6a9cd41cmr53596975ad.5.1772715971749;
        Thu, 05 Mar 2026 05:06:11 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d19559csm154128355ad.5.2026.03.05.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:06:10 -0800 (PST)
Date: Thu, 5 Mar 2026 22:06:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130609.GB1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123843.i47asdrjychwlgdt@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_050612_894778_F70F0655 
X-CRM114-Status: GOOD (  12.14  )
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

Hello,

> > > K:    \b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > > K:    \bphy_(?:create|remove)_lookup\b
> > > K:    \bphy_(?:get|set)?_drvdata\b
> > > K:    \b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > > K:    \bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > > K:    \bphy_(?:init|exit|power_(?:on|off))\b
> > > K:    \bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > > K:    \bphy_(?:reset|configure|validate|calibrate)\b
> > > K:    \bphy_notify_(?:connect|disconnect|state)\b
> > > K:    (?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > > K:    (?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> > 
> > What about
> > 
> >   F:    drivers/*/*phy*
> > 
> > or something along these lines.
> > 
> >         Krzysztof
> 
> I don't understand your suggestion. Is it meant as a replacement for the
> keyword regexes? Your file pattern matches on:

I was thinking more along the lines of using wildcards, the F: was just an
example.

[...]

> There are a lot of false positives, and a lot of false negatives.

Yeah, the "catch-all", for lack of better word, will not work here.

	Krzysztof

