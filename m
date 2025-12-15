Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A06D5B868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=; b=j61zemV6jSWvkbnQlemsFJyXla
	H5wW1/t809AmdNavuKz0QwqDHPa/rekqM1RNEfc3nV2wEdQ21vXQrm0xL4PLqJeRGWJ5dwj6UadW0
	Iy+7fmPNyTDxGrc4rOxBHm05tnR4p8a3ykWlKuGGzwm6lKRMbxe6jxUbbzsbgS3CXYsXOF8SDSgm5
	/wFxt+ezWu1D7/cgKU/43CTtVVBYczRckJQ6n5RCNvAc3iz3dDEpYoEz2EPynfdmQ9qcoqrzIg6VQ
	Kfy3Bn0phQ4Kf4R5bILGU1DG36IhjY3E2JgKB8UHouJG/mDsneFPXnukITyP1J1EpmhdyVcs64/fh
	mvQ1F3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEuZ-00000004DLc-1pv4;
	Mon, 15 Dec 2025 20:11:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVEuU-00000004DKa-1taa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 20:11:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477632b0621so28032805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 12:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765829468; x=1766434268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
        b=uEfev6AIYeOzR+J0nKqQX/6hx/7hyWfDwNHN7+ZKgmxIJHIwMgO2b8LQyv2katgshd
         V8RMcSwq30XKfNrPDsjrX2HtTsAQ4gc3BRk6JVtx6E5y9Kh7/oNDav/RlXLKSxlxZLRM
         wywyZErTG5gFQ8NJqlBt5Lr073Ia9pJadordWXymMsGS8+Nik5RwTAGitCtPFHcjrTyj
         sAlqG1sV7q2jBmrWi5dnsxb3lbzexxoX5n/LAtBXsIKSjmdZmUcgoScVMVJilLzxovfj
         bjlmnL6CF5YPjQ+LCVXHB1bNMkM2HtsWJQCTD7BeZ6AbR1CDiDNEMFRABPp0isJD4w34
         GNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765829468; x=1766434268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVHWp8cheEcClOBV4c/zxK94NkQEphirpcQRQ+Yuj0w=;
        b=NgUZdBAYubTK7odjv25wtIYHdg83H9s3VcJFdW5iezgJbBPWsmCVWZHYyUgTGGS37B
         STFY1rSA8u5TJPlkDFmcpY26nuvFsRQ5LpnLLtg7GtG4Rq0mJNE0qtMhuNiE4g0xc9/y
         Lan39QutNzQxujniKu1JkKLdfG9aiOZTFVDMLHOx83HATXj8fOkrm5yWd+3HCej0aLbf
         XL591a7aJkZTFP1EPPnv3ReSSdzCRDwXnLqSIlzsw4iGl0uf/ZX2QHPjYGUgTD6K0DgA
         bhSOm70uU9ep3xEDlwt6h217QhpCbHPL1QGZ8Th9Migck8ndGLRu9F40cFXN8EaFnfJP
         fSgg==
X-Forwarded-Encrypted: i=1; AJvYcCXgCmu8zhYlSSh/jnb5hNNJkBdwWYwEI+uJ5QKMbfNKcA56Gy7ubTYNHUb4hbg0nMvWrA74C6EJpN2PmdIx2FA9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2vgBS4RDo4PbF/L3vzpzIPy8jMIusJoGblDHBRuspS35Qy4Dt
	moDpIkU1fAYSSbZqKaOVTj1RLsTDvgoIeiSZZguXAcEde5jh2nN8T50re3Cn6+QfBPI=
X-Gm-Gg: AY/fxX6Z+2cGEsek/0F4Lexlkqj8V2Df7JnGQnrYbx0SKQOhDdJUSRkM4jY6EFRyXRa
	ARQuCY5TtqaXgH45EWO07wuWw31/ooZOEqJYTKveviz4NhC8uXXyL6pMbyg04rQsmV+NEeDa6E6
	dN1ChurqUTVmvciqCGZgr7f0l0MGRNDg2kty4URorCW5EoWUIHMXYVtv4IuzWm08q3xSjC4duBy
	buWH2zAe5flXkwNEFZbipL7Brh9YnuRVsHUlvZH5OAThtWuBQ4TR49hRQL7sjKRvG8u6poTg8G2
	mj6AbDKazJrIG8kI9xhqjBfSn+UVa2h9whbiS4kA9tWY0yuZhiQqbPX58d0EE0gN19/n4BbOj8f
	MEoXzkJ2OVb6ctYiAD6RjXud7Utu1EoKEH61cjNInpw0HfxcWn8ZR2NuUVtxsniz0Ihtrenrs1O
	iCozEcsrhqMHrnX63n
X-Google-Smtp-Source: AGHT+IFzTdgd8HuBCRpheWEKJMhw6vXCy8KxXaScp0+GwrnVXW68cCuyCfDLEuzw7wX+ZV30A2XRQg==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47a8f9046fcmr137755605e9.20.1765829468100;
        Mon, 15 Dec 2025 12:11:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ace61sm200864155e9.7.2025.12.15.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 12:11:07 -0800 (PST)
Date: Mon, 15 Dec 2025 23:11:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH v2 0/4] s32g: Use a syscon for GPR
Message-ID: <aUBrV2_Iv4oTPkC4@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_121110_923324_BB7B3A6A 
X-CRM114-Status: GOOD (  38.06  )
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

On Mon, Dec 15, 2025 at 02:28:43PM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 09:33:54PM +0300, Dan Carpenter wrote:
> > On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> > > On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > > > The s32g devices have a GPR register region which holds a number of
> > > > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > > > anything from there and we just add a line to the device tree to
> > > > access that GMAC_0_CTRL_STS register:
> > > >
> > > >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> > > >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > >
> > > > We still have to maintain backwards compatibility to this format,
> > > > of course, but it would be better to access these through a syscon.
> > > > First of all, putting all the registers together is more organized
> > > > and shows how the hardware actually is implemented.  Secondly, in
> > > > some versions of this chipset those registers can only be accessed
> > > > via SCMI, if the registers aren't grouped together each driver will
> > > > have to create a whole lot of if then statements to access it via
> > > > IOMEM or via SCMI,
> > >
> > > Does SCMI work as regmap? syscon look likes simple, but missed abstract
> > > in overall.
> > >
> >
> > The SCMI part of this is pretty complicated and needs discussion.  It
> > might be that it requires a vendor extension.  Right now, the out of
> > tree code uses a nvmem vendor extension but that probably won't get
> > merged upstream.
> >
> > But in theory, it's fairly simple, you can write a regmap driver and
> > register it as a syscon and everything that was accessing nxp,phy-sel
> > accesses the same register but over SCMI.
> 
> nxp,phy-sel is not standard API. Driver access raw register value. such
> as write 1 to offset 0x100.
> 
> After change to SCMI, which may mapped to difference command. Even change
> to other SOC, value and offset also need be changed. It is not standilzed
> as what you expected.

We're writing to an offset in a syscon.  Right now the device tree
says that the syscon is an MMIO syscon.  But for SCMI devices we
would point the phandle to a custom syscon.  The phandle and the offset
would stay the same, but how the syscon is implemented would change.

> 
> >
> > > You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> > >
> > > regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> > >
> >
> > You can use have an MMIO syscon, or you can create a custom driver
> > and register it as a syscon using of_syscon_register_regmap().
> 
> My means is that it is not necessary to create nxp,phy-sel, especially
> there already have <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 

Right now the out of tree dwmac-s32cc.c driver does something like
this:

    89          if (gmac->use_nvmem) {
    90                  ret = write_nvmem_cell(gmac->dev, "gmac_phy_intf_sel", intf_sel);
    91                  if (ret)
    92                          return ret;
    93          } else {
    94                  writel(intf_sel, gmac->ctrl_sts);
    95          }

Which is quite complicated, but with a syscon, then it's just:

	regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);

Even without SCMI, the hardware has all these registers grouped together
it just feels cleaner to group them together in the device tree as well.

regards,
dan carpenter


