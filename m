Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574CBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M9VBNshXRr/zeZayfHhf6pLw+VHfQ7XhNs8UL9FnqY=; b=ymtMQox7jfi0XTuph34WSgujs7
	IHpINR0lD0eb7Ki3RRZLzIEpP8GFVdBGM/W0BVGj3rY7JLvfclrqdOrt1anIMYrISisfw71/zgiDy
	KCzhWK3pgamIqEEns8qZ7Lbj9s+6v56WWoAa0etLCXqVhBDs3inYP+4On7KYTxx1U6eCBWBDcLAs8
	DpEXyy3asrz5nVxsPoIckY7szft34/hMAk56nc3NV/3WfUCKsV6aWbOwRrLt5jHjja67bxEiaLdUe
	bPEQI5cKkOyfDKShJUJkzPel6ktCfBCMEh6UTTrLis8un5JysPQlhbGoN+LHhsaVLWy8WUz/UDv8v
	YBXdcAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSZ9-0000000Aox2-3pmw;
	Thu, 17 Jul 2025 17:38:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSJl-0000000AmS5-2IYC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 17:22:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55a28be32eeso1119805e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752772968; x=1753377768; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1M9VBNshXRr/zeZayfHhf6pLw+VHfQ7XhNs8UL9FnqY=;
        b=iIW7FwvA2GeKutyPZZvuaHUglobt1SbwDdkr+x5pYcd8iaPHhfkDwXtqt+WtpCebUC
         /DX00/sOUa7HHM8g89BY2coDfLvjRUG0Gf1ocF58yZ39s3TR8pHI2+KWZ45goxaFh86M
         MSro1W8wawn2rqA7vcJiQPsTA8FX6pbc0OenT5+jujMrBkp3Bpz+9sZlZPWK5Hm88n2K
         xeB5ZH/NC5k1j7XiI1Mwu8Ml8lMUiKM1vUKlqcnnlN3KOqPRNx/brqIq48VC9uLrWOvU
         8TcXBHEJUk0NXYRv8v2ocEqARZcAJWCC3dYdpmSxcC4yIL2g6YSfD7E8HK7qshDCKRv7
         DrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772968; x=1753377768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1M9VBNshXRr/zeZayfHhf6pLw+VHfQ7XhNs8UL9FnqY=;
        b=hUN01FLRQvFsqUrhQMcMdqkdm2CqdQbbjF2tkS/chvZH7XV0PZ4HLlWATnSU2Sqpkt
         +c5NZBAvhZV3YdYXk7odaK4IgOe9WGZ5u8CVLLW3TVmncdjY2rVlUA+KsY56t+S1y4Tu
         UJOS8DhghvVUXX5msD0/EwJL0tccVvmmDojNwsGXHhFI7FeO3pfsxkPSTszIuiFy7ePv
         eowm0ZauC1noGM9CmRI8g/0qKJ0CAHHNbg+NHoXhPq6JQAXeaYiyE6TT5kAfEVhg/DMf
         8i55yvVItB7/s840zkxVOvqxC3P+DU4bNa0X81gXq49cQSYeVRoXlGSQc0kGCvHt2YnP
         lzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkgl9gR8KSg+R87dkma+EJ/BcHY8LMIdCZ8Y7DOYvI2vnzIA5wcMlICYdbWxGLr4Igt30sA/fUmbbi0KAwrB5/@lists.infradead.org
X-Gm-Message-State: AOJu0YwCXKHI+pz+LTH1MPwklPtIzbAHyfo+I3k3CKKwHjCLlFpLxYH/
	GrIFgyE8Ps8MpUyLXgxQ5TU/b0yG8RhTl553SGel8vsLJkYl2f03920R
X-Gm-Gg: ASbGnctnsmjVgOWJrzkMxZiCvYz4NdgS+HJL5VqN6S1VGx5hnz/dFZ9RtSjxghwr7pC
	E+dwobdhbIsy/Rbu5cK/NhiknzeuoiIGWGzGxn0B9IAsV9mVoscz+/5Rdh/afHYhJWrcUIT+eC7
	cM3CKXiSF8fH/qXMEdfYIrt5adXm09X1jox/c4CQq86GRz+nd99+77S3Ulbh9JRlY/TpdzTIJuE
	kygeUW6JPqZWiU9lcAn0QAKbRxoSxY4Z4WRx8mXfUSC8+SH/1KhBpAydT1rn/GKx+0bgltli/Bg
	fJKzd3RAo5yu4c9lVFZjxvtM2vU2a7lgGBHeqeqPj6HjZdkufvPX5Wp4ADN2+/CvuswrSCL8Qfu
	lc11iLnTV3dPPhI0mvzKgZL+3OCoPG5ux9CGKVycz
X-Google-Smtp-Source: AGHT+IEhgPNpF+RY7Hv5LcpAToSUDOepB85CikAQqsHl0t8s9Rr18M+5Pk7Yf+LwBrK6Q8QRUcK15A==
X-Received: by 2002:a05:6512:4017:b0:553:a64a:18b0 with SMTP id 2adb3069b0e04-55a2970ec7bmr1282403e87.42.1752772967348;
        Thu, 17 Jul 2025 10:22:47 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bcd48sm3119279e87.46.2025.07.17.10.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 10:22:46 -0700 (PDT)
Date: Thu, 17 Jul 2025 20:22:44 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: xgmac: Correct supported speed
 modes
Message-ID: <ae4b3iobvbdyyijkpqhh4xv32rnfql2nvzmlzvmfbluefecy7z@t5o42w4orpfi>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
 <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
 <74770df8-007a-45de-b77e-6aa491bbb2ae@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74770df8-007a-45de-b77e-6aa491bbb2ae@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_102249_590013_431A31B2 
X-CRM114-Status: GOOD (  40.67  )
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

On Thu, Jul 17, 2025 at 06:29:33PM +0530, G Thomas, Rohan wrote:
> Hi Serge,
> 
> Thanks for the review comments and the detailed explanation.
> 
> On 7/17/2025 5:17 PM, Serge Semin wrote:
> > On Tue, Jul 15, 2025 at 07:03:58PM +0530, G Thomas, Rohan wrote:

...

> > > 
> > > > 
> > > > What does XGMAC_HWFEAT_GMIISEL mean? That a SERDES style interface is
> > > > not being used? Could that be why Serge removed these speeds? He was
> > > > looking at systems with a SERDES, and they don't support slower
> > > > speeds?
> > > > 
> > > > 	Andrew
> > > As per the XGMAC databook ver 3.10a, GMIISEL bit of MAC_HW_Feature_0
> > > register indicates whether the XGMAC IP on the SOC is synthesized with
> > > DWCXG_GMII_SUPPORT. Specifically, it states:
> > > "1000/100/10 Mbps Support. This bit is set to 1 when the GMII Interface
> > > option is selected."
> > > 
> > > So yes, it’s likely that Serge was working with a SERDES interface which
> > > doesn't support 10/100Mbps speeds. Do you think it would be appropriate
> > > to add a check for this bit before enabling 10/100Mbps speeds?
> > 
> > DW XGMAC IP-core of v2.x and older don't support 10/100Mbps modes
> > neither in the XGMII nor in the GMII interfaces. That's why I dropped
> > the 10/100Mbps link capabilities retaining 1G, 2.5G and 10G speeds
> > only (the only speeds supported for DW XGMAC 1.20a/2.11a Tx in the
> > MAC_Tx_Configuration.SS register field). Although I should have
> > dropped the MAC_5000FD too since it has been supported since v3.0
> > IP-core version. My bad.(
> > 
> > Starting from DW XGMAC v3.00a IP-core the list of the supported speeds
> > has been extended to: 10/100Mbps (MII), 1G/2.5G (GMII), 2.5G/5G/10G
> > (XGMII). Thus the more appropriate fix here should take into account
> > the IP-core version. Like this:
> > 	if (dma_cap->mbps_1000 && MAC_Version.SNPSVER >= 0x30)
> > 		dma_cap->mbps_10_100 = 1;
> >  > Then you can use the mbps_1000 and mbps_10_100 flags to set the proper
> > MAC-capabilities to hw->link.caps in the dwxgmac2_setup() method. I
> > would have added the XGMII 2.5G/5G MAC-capabilities setting up to the
> > dwxgmac2_setup() method too for the v3.x IP-cores and newer.
> > 
> 
> Agreed. Will do in the next version.
> 
> Will ensure that mbps_10_100 is set only if SNPSVER >= 0x30 and will
> also conditionally enable 2.5G/5G MAC capabilities for IP versions
> v3.00a and above.
> 
> In the stmmac_dvr_probe() the setup() callback is invoked before
> hw_cap_support is populated. Given that, do you think it is sufficient
> to add these checks into the dwxgmac2_update_caps() instead?

Arrgh, I was looking at my local repo with a refactored hwif initialization
procedure which, amongst other things, implies the HW-features detection
performed in the setup methods.(
So in case of the vanilla STMMAC driver AFAICS there are three options
here:

1. Repeat what I did in my local repo and move the HW-features
detection procedure (calling the *_get_hw_feature() functions) to the
*_setup() methods. After that change you can use the retrieved
dma_cap-data to init the MAC capabilities exactly in sync to the
detected HW-features. But that must be thoroughly thought through
since there are Sun8i and Loongson MACs which provide their own HWIF
setup() methods (by means of plat_stmmacenet_data::setup()). So the
respective *_get_hw_feature() functions might need to be called in
these methods too (at least in the Loongson MACs setup() method).

2. Define new dwxgmac3_setup() method and thus a new entry in
stmmac_hw[]. Then dwxgmac2_setup() could be left with only 1G, 2.5G
and 10G MAC-capabilities declared, meanwhile dwxgmac3_setup() would
add all the DW XGMAC v3.00a MAC-capabilities. In this case you'd need
the dwxgmac2_update_caps() method defined anyway in order to filter
out the MAC-capabilities based on the
dma_features::{mbps_1000,mbps_10_100,half_duplex} flags state.

3. As you suggest indeed declare all the possible DW XGMAC
MAC-capabilities in the dwxgmac2_setup() method and then filter them
out in dwxgmac2_update_caps() based on the
dma_features::{mbps_1000,mbps_10_100,half_duplex} flags state and
IP-core version.

The later option seems the least code-invasive but implements a more
complex logic with declaring all the possible MAC-capabilities and
then filtering them out. Option two still implies filtering the
MAC-capabilities out but only from those specific for the particular
IP-core version. Finally option one is more complex to implement
implying the HWIF procedure refactoring with higher risks to break
things, but after it's done the setup() methods will turn to a more
useful procedures which could be used not only for the more exact
MAC-capabilities initialization but also for other
data/fields/callbacks setting up.

It's up to you and the maintainers to decide which solution would be
more appropriate.

-Serge(y)

> 
> > -Serge(y)
> > 
> > > 
> > > Best Regards,
> > > Rohan
> > > 
> 
> Best Regards,
> Rohan
> 

