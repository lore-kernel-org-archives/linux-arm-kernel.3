Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFBDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=; b=3XY1GOpNU3sUZQf61g2j9DR4HV
	Vmk3X+eNOu18XjhTVQQpF1tWl1Af4MWJ3ueRV//rQby8rvdQPFizDay/FjjVuXVgP2MswS01MClsH
	Rp+ycV+TYBvwPD9PPwiReU2nlJzvEBGjbfu77WW/8X8h6ExYygLVmcHriDZhPhYsS3+WQG7L8QFDu
	Ce8aMMIccveZbYrPwDIi7J+aJy4Vu90mFCdgra4lkBbci3Vq0yjXMUzc/1QbF86eUSukGHeUtrUZg
	wFRRzhSoY/N8dSdH9ybdPjE6S4r3QPjPEC0qVHQbjsAGu1Cwoiv1yzmFM175/EhsNTRcolMgaH7xA
	WwNkcnqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K2x-0000000BJPj-0Ha9;
	Tue, 01 Sep 2026 08:40:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K2u-0000000BJOs-1tyO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788252043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=;
	b=WolvEQqgrmyRh9Y19tZ9ClUFP6CxXVcIX9Q6EV6iZAbtydcpPP37djnGvaRvfyaexIavl9
	9W2EbaUyjIyIOUybV/CXhKNNkgQFceXoJWjzGMCdqiSn+JGBFChLruY9Zh4IIumNp3jd6H
	0Na8TKFaMuijFyEQ611n2aISBP2VWGM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-9gXo74xpNiCCXNCn-AauJw-1; Tue, 01 Sept 2026 04:40:39 -0400
X-MC-Unique: 9gXo74xpNiCCXNCn-AauJw-1
X-Mimecast-MFC-AGG-ID: 9gXo74xpNiCCXNCn-AauJw_1788252038
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cced8309bso4976425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252038; x=1788856838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=;
        b=SMZe3SOgIfZ5o6oc7XijCMoEwExAdvohIDMk4YjZir4Do1r4PMm3p3mxLCKQtxPaSl
         HU58TD6lEvmiaZY1FCSPh5LnbvhZkI3eIHVvIlzMO0SCeD4ai8sycejNm8QE/rqB1evx
         hO9DsVIE8ftlpGnLaRx4rbGlpvo4wlREtsZfRd1xI0RxFgft3coN/ssSm/cG6g7LwMQW
         CSfDDK/35O+kTHqj0tSTsOfu7+Mh7TDd4CADIK1jr/AhzHZD6m4VrY0hwIaR1ZXm1MjH
         63P1bbizJPijF6Dp6x/BO6F0KFjNJtldgnYTM4qDCmWYm7JQn+OD7OEklSCJqJsSLGJQ
         ROJg==
X-Forwarded-Encrypted: i=1; AHgh+RrcZ3USnsZfYgE4HjZwvpFK/Vl3cKZ/+x9/i+klYEGNU+QlduITeBJuU7J/tFPvkX9tkd8rQsVFlRgE7sZBfs+w@lists.infradead.org
X-Gm-Message-State: AFuF++l8MxMRNbFen7+HPqj/YM4kopOIg2xDtscWcDzgzZSa2xIo8WQR
	DE2lU8wE+zoEZPc5nigL8iLjVHng00XkngdRtCxR2cueXsNthEpn+trSEpCopohUEHr9+ntuVYU
	fGxXTlwX2UDyzF6L5iCx4KYBLxGoyQCqHT17ET/mu2iL2gcxWZT2EBVqp/uw7hVdrZnEFsD7VMH
	X6
X-Gm-Gg: AR+sD13i1Ya+8QN/7X90wda3jSwvP2dTyzosgTuF0MESvegkFdU49lYIHHVu2yO3CQl
	Nyat1RrtQpiahGu+cSL8BmzKCes1oGozNr/9wubJDX7ID0UTCX5IOYKUESdYGi5meQ+FJhoUIvI
	ftJW3xDHB4n0770ounzEB2uMubFd5k63is0FlWQm9lQ9wqCxrCSYBkeGLMmKDRrJ+Uympl0xnxr
	XH0Qi/jhdq9DsMLOEacmXmj4TShPqCzygv9NaPgr3T4xQQof+ACFRZg6GJohNp2+kIICizI1xaC
	NEFcKBN0ttVaNOYuO5apL2zy3gFBIEdNHnpvVDrkfLAF0lRSeTyx7UMbCEKCoFrrlzy+I+puej8
	nw9H73PuyjAdTSde1zAqJFG1moCL1fxa715VcC6n4UtqqWQXaenAsBBm3yeb8HIH7f8oE9BrQdw
	==
X-Received: by 2002:a05:600c:1c13:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cdf2b179amr60516665e9.8.1788252038362;
        Tue, 01 Sep 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:a05:600c:1c13:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cdf2b179amr60515525e9.8.1788252037895;
        Tue, 01 Sep 2026 01:40:37 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm6966555e9.13.2026.09.01.01.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:40:36 -0700 (PDT)
Message-ID: <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
Date: Tue, 1 Sep 2026 10:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to
 fix EEE support
To: Aleksei Sviridkin <f@lex.la>, "Chester A . Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827211652.63504-1-f@lex.la>
 <20260827211652.63504-2-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260827211652.63504-2-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VBWXQd7ZlbpPghQtCsHGcznMqxq5wZkY64QZd2wgVRg_1788252038
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014044_566053_08E9AB9B 
X-CRM114-Status: GOOD (  19.66  )
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



On 8/27/26 11:16 PM, Aleksei Sviridkin wrote:
> phylink_create() decides once and for all that a MAC supports managed
> EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
> lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.
> 
> So ever since the conversion to phylink managed EEE, ethtool has
> answered "Not supported" on every mt753x port, and phy_disable_eee()
> has locked userspace out of turning EEE on. That undoes what
> commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
> switch on all boards") arranged: EEE off by default, but reachable
> with ethtool.
> 
> Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
> SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
> PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
> unvalidated rather than known unsupported: MediaTek's SDK driver sets
> the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
> wakeup timers is undocumented with the port clock at 2.5 times the
> rate.
> 
> LPI stays off until userspace enables it, but the EEE advertisement of
> a PHY that advertises it out of reset comes back, since phylink stops
> force-clearing it.
> 
> Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> 
> Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
> MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
> PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
> alone cannot tell them apart. MT7531's internal PHYs keep the
> advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
> empty, so EEE stays fully off there.
> 
> Two pre-existing things this patch makes live, neither addressed here:
> 
> - The unit of LPI_THRESH is still unspecified, as the comment above
>   lpi_timer_default says. ethtool now reports 30 for a switch port
>   against 1000 for the SoC MAC, which is a driver constant already in
>   microseconds, and mtk_eth_soc treats a structurally identical field
>   as milliseconds. Does anyone have the datasheet answer?

Clashiko complains about the above:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827211652.63504-1-f%40lex.la

@Andrew: WDYT?

/P


