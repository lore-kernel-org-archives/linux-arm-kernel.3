Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C88C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUzQnHUphnbfFgIY49ERlZzZ414PTUWI3wMK+KFf1L8=; b=U1ry8FbptvC4rYXb5uhr4D/7uK
	eXVJQfTRZL1jPBCZoJDCXAs0yziw3BaRPMEm8ySQFfGOmvgGGY4FIuCPsdMbk7Tagqy6Bye3aIOD9
	vvRbbmZCxP4QP5uWvE6OlycucAvbAXtRUxUgj9r6m9OxUCRda0sJkEg1Qe/daZ0scooeFGKBXrLDL
	yfL+EJKvUttoPeUTvKMJRj0OM8UjCnhzhjWTTNSKBlBKkF4SoasqizSRiRu+ijqPhH5ePirmMLrbP
	eSEIfoeL60jVafXtkNZIsum0a6A6tEUi6hVRRlooX213GATTMQOsVgmMDtBmmoUYIfAdrbQ1YDx1X
	Zf/p65Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOMr-0000000ADdH-094W;
	Thu, 17 Jul 2025 13:09:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN5A-0000000A0fm-03ck
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 11:47:25 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54b10594812so853264e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 04:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752752842; x=1753357642; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUzQnHUphnbfFgIY49ERlZzZ414PTUWI3wMK+KFf1L8=;
        b=MgJk4m8Q4yA+l/gZjevarej168HKyh7wQmLKFV2HhUzF4PuhD1I24bsGRkr1uPZ7Sd
         UJKgPtR0Y2AneBtNflTTI6FCmx0WuY25Mwdxy+LsCU/ngU1mid9ZyFV34Kf/IJ0FvhIY
         LoOWW3RDyjMhap2W6tgbfBnwtPq3zgn6TA4ORx5zMGpA8rm+9qSZlgHHm7IqPLnu8zFZ
         cRXu8LqmnwPP6JUZQvYoBMNhbHup4eYbj+92PQK/uIqp3lTtebURRQJx8Fhvq8pHOEcB
         9iWswAtqjVsv81tHI0SdXmtNVLMN2iwn412qZ/HDTGCrvmju2jXoQ4MJu7orE/vM8LxF
         RO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752752842; x=1753357642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUzQnHUphnbfFgIY49ERlZzZ414PTUWI3wMK+KFf1L8=;
        b=SIpeiZHx6xp00Y5iqFOgkQlTta9ERBS3xKdN4S3+QxFn0tc39zXn8mqdXDkieJuT5j
         whkLXaGDpKglR2S1FFkKFYmDpv1IPtrGoj+bsmMp0DM2KN2/iF8riWU9a2J9v/HtpmfW
         fyCyFpI1mxEWyzvnM++3435Ss6k4/+VmeiS7CWBC7pKygqrqQYmWybWNhVZu3bUsFI9S
         kydEgOK2gAxVg9BxIn1dx0sTO/D3RzgTIQyjOPPNonQQHPQDFeBfUfKI/yApbgozTJgG
         S5oy30RKkQeZNpW89daFjnP19M5uoColyaD8r0xbUZxJurE33gukeFtGBzRjFydU82uN
         JI0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+o/umlci8oSWzlIwAlztYGzmZG8zObsZbWVl6k3qmTvNeAi/NoUZHPu++LJNF1he0+76ss5lx8NfNsll+OU8n@lists.infradead.org
X-Gm-Message-State: AOJu0YxrmCO14QN056yDZ/xg/n1F4R+yl/t7H2uTobQx6dImEwFl3pxW
	s/wXyJ5buVXhzPzNriyaaDdqFxOh2L7aeRjvsK/p0SQMb1K3ILpvPIdQ
X-Gm-Gg: ASbGnctbSQlPSILkom3T76J9Mt6RsYAIuqY/4NlYoB5G0Sis0zI71Gyyv2d6RdzL0X5
	RPDBudlnFDY1cOBchHD2Kp+/GG8wfSyKTipUzKNkubSbnDiyJGW/MktJuXPZwfZ9BERbJaCMYfZ
	5Dy/wdPwEXuhMRArlN23wiULrcdl8haAaM5P7nLSX1EY8X7Dl+nT0lrLt4olMReVhNTP3Zx1Qtq
	VmM8eTlNqXV9oC9XIDFDZfO366LzRwroNYdT5QWDn7HgpxGr3cIwxXDzui7I6SoTWqyHnO79B5z
	iH4zJrpjjnZusab0RAsUzGp0dvWYuP/Xsmwcx13pYxUKcf1kaGEQUaAa9qHxNekUo8zFI+Ii5ei
	AtsZ6n60eyiIqZ/anQDvkDOxFHpF18A==
X-Google-Smtp-Source: AGHT+IEeUss8ZBlPkHLakvGxJF2K58yDRc8vQWOCbMdXUi501yCOkwF9vYWrYBaVVUbMnozeWCQi6Q==
X-Received: by 2002:a05:6512:33c1:b0:553:d910:9340 with SMTP id 2adb3069b0e04-55a23f72cf3mr1951594e87.46.1752752841436;
        Thu, 17 Jul 2025 04:47:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bca2asm3021540e87.29.2025.07.17.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:47:20 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:47:14 +0300
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
Message-ID: <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_044724_052045_A11794DE 
X-CRM114-Status: GOOD (  31.52  )
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

On Tue, Jul 15, 2025 at 07:03:58PM +0530, G Thomas, Rohan wrote:
> Hi Andrew,
> 
> Thanks for reviewing the patch.
> 
> On 7/14/2025 7:12 PM, Andrew Lunn wrote:
> > On Mon, Jul 14, 2025 at 03:59:18PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > 
> > > Correct supported speed modes as per the XGMAC databook.
> > > Commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific
> > > MAC capabilities") removes support for 10M, 100M and
> > > 1000HD. 1000HD is not supported by XGMAC IP, but it does
> > > support 10M and 100M FD mode, and it also supports 10M and
> > > 100M HD mode if the HDSEL bit is set in the MAC_HW_FEATURE0
> > > reg. This commit adds support for 10M and 100M speed modes
> > > for XGMAC IP.
> > 
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> > > @@ -405,6 +405,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
> > >   	dma_cap->sma_mdio = (hw_cap & XGMAC_HWFEAT_SMASEL) >> 5;
> > >   	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
> > >   	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
> > > +	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
> > 
> > The commit message does not mention this change.
> 
> Agreed. Will do in the next version.
> 
> > 
> > What does XGMAC_HWFEAT_GMIISEL mean? That a SERDES style interface is
> > not being used? Could that be why Serge removed these speeds? He was
> > looking at systems with a SERDES, and they don't support slower
> > speeds?
> > 
> > 	Andrew
> As per the XGMAC databook ver 3.10a, GMIISEL bit of MAC_HW_Feature_0
> register indicates whether the XGMAC IP on the SOC is synthesized with
> DWCXG_GMII_SUPPORT. Specifically, it states:
> "1000/100/10 Mbps Support. This bit is set to 1 when the GMII Interface
> option is selected."
> 
> So yes, it’s likely that Serge was working with a SERDES interface which
> doesn't support 10/100Mbps speeds. Do you think it would be appropriate
> to add a check for this bit before enabling 10/100Mbps speeds?

DW XGMAC IP-core of v2.x and older don't support 10/100Mbps modes
neither in the XGMII nor in the GMII interfaces. That's why I dropped
the 10/100Mbps link capabilities retaining 1G, 2.5G and 10G speeds
only (the only speeds supported for DW XGMAC 1.20a/2.11a Tx in the
MAC_Tx_Configuration.SS register field). Although I should have
dropped the MAC_5000FD too since it has been supported since v3.0
IP-core version. My bad.(

Starting from DW XGMAC v3.00a IP-core the list of the supported speeds
has been extended to: 10/100Mbps (MII), 1G/2.5G (GMII), 2.5G/5G/10G
(XGMII). Thus the more appropriate fix here should take into account
the IP-core version. Like this:
	if (dma_cap->mbps_1000 && MAC_Version.SNPSVER >= 0x30)
		dma_cap->mbps_10_100 = 1;

Then you can use the mbps_1000 and mbps_10_100 flags to set the proper
MAC-capabilities to hw->link.caps in the dwxgmac2_setup() method. I
would have added the XGMII 2.5G/5G MAC-capabilities setting up to the
dwxgmac2_setup() method too for the v3.x IP-cores and newer.

-Serge(y)

> 
> Best Regards,
> Rohan
> 

