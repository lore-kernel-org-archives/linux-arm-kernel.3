Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A5C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpnAPb+szKsxLDLw8+sBnpML2P+PlPUb+adSl0ccDVc=; b=l2apc18OramyXl9Fozw+QuJVj/
	bG6xvD/RkC5+u924N1/jBxjA7U3hx4nRpw5E/JJxXEOdCBZ6jKHll6iunflKp66nLw56R9sypmKdb
	sv0sw4lMIlTqeKU6OggTjMufw8bL1ePtwmkHhWk1h/65xBD4yQ5QffoLtNPY2A8oDm1R1fbZmfjix
	cAN+Cdi3DOdNqG+y+OfMDvhwxy0Ztx9W/HGPE7d2hnXQ9gh+2vi8Fcipl690XWHiIF0B9Wcoc6bf+
	3VlsEKhUspX8AYS2mJ0CPdK2GgomeFFWlCicDYfzWLaTbGGlq5FdNI8EMKR1YeKI954GNU1yF0cv1
	SamLRj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4oB-00000008dqU-1kEj;
	Tue, 21 Jul 2026 07:22:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4o6-00000008dob-3Rs8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784618543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpnAPb+szKsxLDLw8+sBnpML2P+PlPUb+adSl0ccDVc=;
	b=NzbQXgP4SwXUnfIMz8zw8NTbBqP0RrnL489w9b8ZGO+tGzamFk6Y1CS9la1E8dFS1a4YP7
	7VL5I1YSAdQHOn2wzU4Ty36b3gEUJSW4gYgxw7uy8roeScMm2BoGd8bIeCrvT91JyXxw87
	CxVzU6usvJXTcc0WCZkZtefIYJXM+58=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-FHiAWlYxNaCjR4gk1_dwuw-1; Tue, 21 Jul 2026 03:22:22 -0400
X-MC-Unique: FHiAWlYxNaCjR4gk1_dwuw-1
X-Mimecast-MFC-AGG-ID: FHiAWlYxNaCjR4gk1_dwuw_1784618541
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f70d735a4so1957684f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618541; x=1785223341;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpnAPb+szKsxLDLw8+sBnpML2P+PlPUb+adSl0ccDVc=;
        b=JkN70c3nEcbK22zFc/2dIwQH71ECRLYng59U9NjPawEbjL1eTBO+wygTsAVhfXwCCx
         wRyoe1HWURU0ysxL+Q/qpzXo8IEYK/jJ1XcsrdcBhCEcHiWRZsn7WM9ENE1N6brjWs2H
         GlgKuJ1UATrDrDVpV0QSB+UbqG+ieZPrszb/ns+gYgBVIcCbVJNoqzs2w2Dd69LGllNt
         CC/k7hL2I2d1C5qcqeMcLDzayDY1IBVIyUs59J36pPhY3TKE7apx1CMLwAwaU1+b6Coi
         7aPSCBiIv7CeeRCzKljcQESXKk3fJx2WZC+lgyo9YGWQ2ft++gs15VJUyAB9YrbI+HG0
         hJGA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1xy9rRiiN7RTjEKDY3IN/YulrhRPKuwlDq51xpWuMWccK08vJNc69jKzKMg/rpOeBR3OsroK0qjd7+77HSIBm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv035/tlodly3kI2XoDIbwHplxX207woHkgT+Nqglyrx620Ggh
	IEH9PyBEuYdwAyKsYJLsLNWQog2Ix/XyW6aH3QhPutdcfgTTE1LHdvLLcDu7J/Nu4Joxe1EM0fc
	Rh3hbu7KRLLMMXRyFaCp6ytcMZ6ubjEoHiSw0KxBwOzKNW0iVLn70qgtIMDS1fYu1/zjMVPKYpN
	aV
X-Gm-Gg: AR+sD13baUgkFeruVJUD1KJ8RpqWG2w7MeZ218yju1DWkrftvmlCNpqpyFImWdsedax
	yreSgOIbEYSqxi+d1gPIEr9hK8/Nl23ehjupk0L0txCZqT9nd+gzlLObOklZ84Jbcnt4s/y6o+1
	4BuLD5Sh+rt5ZFGSC6pK+thZYRD+7gqGO7xriAycG6GS5qqD4bVgSwv7NZv2WNTHBNKz8J1XKF9
	fzOTDXRuWqzj1c+ZIkEp0aMrHkZn2Eh685qaiDIAWRiVLeVOhsWRRl7OHO0XKC3Gay5NVjQADzl
	DtQCsf7zWZBjd3C1uv7Jm3JXmRZIe40xzoTdpaKPzdfoy3E3OvK216ma0iFCJaWeYysxHNNe2wL
	LPmDjPbJrXXhzPffThbIujbTXMz8XcYbFsJD3NwkBOLfxTeRlV+djp+eKQeYfLz9E76IAM+oE4M
	5pJw==
X-Received: by 2002:a05:6000:1842:b0:47f:7067:395b with SMTP id ffacd0b85a97d-47f706739camr13726473f8f.10.1784618541071;
        Tue, 21 Jul 2026 00:22:21 -0700 (PDT)
X-Received: by 2002:a05:6000:1842:b0:47f:7067:395b with SMTP id ffacd0b85a97d-47f706739camr13726429f8f.10.1784618540671;
        Tue, 21 Jul 2026 00:22:20 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7f55sm32452689f8f.18.2026.07.21.00.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 00:22:19 -0700 (PDT)
Message-ID: <d3ce71f6-042c-4a5c-a4b4-8efbb451a449@redhat.com>
Date: Tue, 21 Jul 2026 09:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 0/4] net: stmmac: eic7700: add eth1 variant
 support and update delay bindings
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maxime.chevallier@bootlin.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com, horms@kernel.org
References: <20260707064033.1265-1-lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260707064033.1265-1-lizhi2@eswincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R1DEJkqBJ7ek2Gj-fWlkYX2RiRJSC6xdmFt6kJ9UG8s_1784618541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_002226_942672_4BAA8F1A 
X-CRM114-Status: GOOD (  15.61  )
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

On 7/7/26 8:40 AM, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> This series updates Ethernet support for the ESWIN EIC7700 SoC,
> including support for the eth1 MAC variant.
> 
> The series includes DT binding updates and stmmac glue driver updates
> for the EIC7700 Ethernet controller.
> 
> The changes include:
>   - Update the tx-internal-delay-ps binding property from a fixed enum
>     list to a range-based definition, and make it optional with the
>     corresponding driver update.
> 
>   - Add support for the EIC7700 eth1 MAC variant, which has
>     silicon-specific RX sampling behavior and TX timing characteristics.
>     A dedicated compatible string is introduced for this hardware variant,
>     and the driver applies the required RX clock inversion handling and
>     timing adjustments.
> 
> Due to silicon characteristics, the eth1 interface has a fixed TX
> internal delay of approximately 2 ns and an RX sampling skew of 4-5 ns
> that cannot be compensated solely by standard RGMII delay settings.
> The binding models the effective TX delay range of this variant, while
> the driver handles the required hardware-specific timing configuration.
> 
> Only the DT bindings and driver patches are included in this series. The
> DTS changes are intentionally omitted for the following reasons:
>   - The HSP bus infrastructure is being introduced by Pinkesh Vaghela's
>     DT series [0], currently under review.
>   - The HSPCRG clock/reset series [1] provides additional infrastructure
>     for the HSP subsystem.
> 
> Once these dependencies are merged, a follow-up DT series will enable
> Ethernet, USB, eMMC, and SD across the HSP bus.
> 
> Reference:
>   [0] https://lore.kernel.org/lkml/20260706081055.1126275-1-pinkesh.vaghela@einfochips.com/
>   [1] https://lore.kernel.org/all/20260605060730.1605-1-dongxuyang@eswincomputing.com/
Applied, thanks!

/P


