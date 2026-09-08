Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58B7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Miv8sjNJdTG6Gu0+wUlQ27sQKF6CmSEymk2ANPK2DPg=; b=i3nOqpMIiQfn+9g9KkGiEm88kA
	4Wqr+vjwzi9ivDQKT4NqJxWDAz6/yVIuxlqq4WP/l/LmcC8OgAUdlnj/p7ZEia2ZVHhse2HMVi769
	eDoK8c2bEOcnHEzsGgrLGlo+w9MgAa3XAJ89Rci/86ud2N03uFy0gNqXbcoP9Bh2MOJtJsopdr2sY
	BHPfZMviLgC/OX3ZFwQVRtr8/QvZa+5OfG/6sip9vyHDwzIH7mgcRSp2Cdy3D8z+JlXF7EJhnGlk4
	2pQrWOgjnK3yUX/Tqa4C+R34XAC7S41ZGtsN0dSgSqR413JBhlCp2/B66/5ivE2+BNfRF2OFu6/G5
	woUyR8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x0J-00000009IXw-274B;
	Tue, 08 Sep 2026 14:40:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3x0F-00000009IWz-1w6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 14:40:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482ea739de2so3221385f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878449; x=1789483249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Miv8sjNJdTG6Gu0+wUlQ27sQKF6CmSEymk2ANPK2DPg=;
        b=HPycdrGtydCnceO+RPqPTRQxhckjww04rDd7Jo2vvnLy2vTkhZCIN9le9/2OUBlvSi
         JGavPPozUIHgIRIKu4xw80oMGS73iMVbKL7+GWIt6ryXEpgGISaaBkqlAo7PBwzbMWwn
         Hsn7zGRrAXZCy5gxH02OprMWX7UW9icV7YEMmf9nPDcT5e/hrUIQmBvIpLAWwD2c83K6
         iNuCWr5fLFSWBq3+TZj/Wz3VYUBm+vDla7Q2pmmKm21XKIXx/Mb7r4bYh59BdciIB4Lx
         06+Ym9TbJTIo3Y6JQJFgEnJlYTaKCocEio7uhBjW0Tig67CByQX4jwo5ejo6tvEOhHRk
         69sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878449; x=1789483249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Miv8sjNJdTG6Gu0+wUlQ27sQKF6CmSEymk2ANPK2DPg=;
        b=i/Q2Hc9snI3bHHKZCrNIHHoagYJw+qDZhjuMv/wsENDu5URRVwTwrflhj942hv4pO6
         oUlw2jo3EqX4x8AHne2qVTk9PXqvgzqU4uk7VvjFuQc9bIkfixeJ1Pd+UPqM9i4Ugp2v
         1GquGk5g1IdDiNXxbqSsYQR4L/knT7GtPnUBZVNBV1rGf8FrNMCju6+CIW8oMdXNIFOV
         QC9FnPj2bBIVJrw9Ty9+kiPadt+RYUx3PurF8HlWAus0RL88zM9fEsaowXj/ELQ5DzPE
         qLAigyOKmZpp4apzwx/VzpgdtX1H5Qo1BuleL42kOmXPKrmJPP2YncVPVD2/lmrr3B8j
         3sNw==
X-Forwarded-Encrypted: i=1; AKwUvBxlgag3Wva7cKV2pEYYhEBCyFU5b0bEDYTxCTZgSP6EdTw1PiqdjRB5VuQaMFhwhMNzN6Rs0uySFmbIEafITS0Q@lists.infradead.org
X-Gm-Message-State: AFuF++mAuGc1TPsyVxoSm50YGssUY8QFtzW1Z4LhBSmD1LhhlvEFBbdD
	PvEcMF9dDxeX7jytdC3ZhXT0VrfLpjqY45bjj3kZ8OtXssYOIWMxDEPh
X-Gm-Gg: AYBFou3zG1EVAdjYRm81aRvk7YQ/Xc0jFi1a0kc858aUpxYYVqpFRmMGK7rlIEcRMsm
	kj10ctG2gP01E92AtUD0JDUTsj/wc6JguNl/IY8numoXm6NYBPKTi3W6a1Ayp6lHASEjTQIfDSy
	3LctCAgHuNv9l/HmuVQ0WQmcKJp/Oc4KqDpl7y7rxzb1+O/gL+rsvi7XFIu7nJUvFMnNPfZ2YOh
	wsq+SzDgVgnq5IBXERn+d2jIHqO6kwRd977IA2I3sVy4x9Lm6b4uPiJiHZBayOrZZpbw1EDBqeX
	pRKW59MzDSmrb9Naxd6yRc+q9n0anSmsiuF0Fg8aFSr749d5K+1SW4qvep9TUYorEtYXJ7H4O6e
	60hWn7FCdBcRdzcsU0l7M44PtcQLz/mp5ZyQ1FX+RDLwuoW3uxD4gL1ei1EpxW6iCrurnU3cLPF
	6c0cEBO3rXAQtwg49h5muyJc+RIJfYjjzCbLx57hsfnCgG009760UEpwY/oEX6/TQ09CPAF7h/t
	ZFTEoG401T2aDeu2igkclfsUDLo+cCDS6xM
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr23543135f8f.14.1788878449028;
        Tue, 08 Sep 2026 07:40:49 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm39338196f8f.10.2026.09.08.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <6aa01e70.ebbd881c.32bd35.196e@mx.google.com>
X-Google-Original-Message-ID: <aqAebOgm5w4VILoS@Ansuel-XPS.>
Date: Tue, 8 Sep 2026 16:40:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_074051_533622_DDB20AEC 
X-CRM114-Status: GOOD (  42.64  )
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

On Tue, Sep 01, 2026 at 10:29:15AM +0200, Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
> 
> At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
> 
> ---
> First the PCS fwnode:
> 
> The concept is to implement a producer-consumer API similar to other
> subsystem like clock or PHY.
> 
> That seems to be the best solution to the problem as PCS driver needs
> to be detached from phylink and implement a simple way to provide a
> PCS while maintaining support for probe defer or driver removal.
> 
> To keep the implementation simple, the PCS driver devs needs some
> collaboration to correctly implement this. This is O.K. as helper
> to correctly implement this are provided hence it's really a matter
> of following a pattern to correct follow removal of a PCS driver.
> 
> A PCS provider have to implement and call fwnode_pcs_add_provider() in
> probe function and define an xlate function to define how the PCS
> should be provided based on the requested interface and phandle spec
> defined in fwnode (based on the #pcs-cells)
> 
> fwnode_pcs_get() is provided to provide a specific PCS declared in
> fwnode at index.
> 
> A simple xlate function is provided for simple single PCS
> implementation, fwnode_pcs_simple_xlate.
> 
> A PCS provider on driver removal must call fwnode_pcs_del_provider()
> to delete itself as a provider.
> 
> ---
> Second PCS handling in phylink:
> 
> We have the PCS problem for the only reason that in initial
> implementation, we permitted way too much flexibility to MAC driver
> and things started to deviate. At times we couldn't think SoC
> would start to put PCS outside the MAC hence it was OK to assume
> they would live in the same driver. With the introduction of
> 10g in more consumer devices, we are observing a rapid growth
> of this pattern with multiple PCS external to MAC.
> 
> To put a stop on this, the only solution is to give back to phylink
> control on PCS handling and enforce more robust supported interface
> definition from both MAC and PCS side.
> 
> It's suggested to read patch 0003 of this series for more info, here
> a brief explaination of the idea:
> 
> This series introduce handling of PCS in phylink and try to deprecate
> .mac_select_pcs.
> 
> Phylink now might contain a linked list of available PCS and
> those will be used for PCS selection on phylink_major_config.
> 
> MAC driver needs to define pcs_interfaces mask in phylink_config
> for every interface that needs a dedicated PCS.
> 
> These PCS needs to be provided to phylink at phylink_create time
> by setting the .fill_available_pcs and .num_possible_pcs in phylink_config.
> Helpers to parse PCS from fwnode are provided
> fwnode_phylink_pcs_count() that will return the count of PCS entries
> described in the firmware node and fwnode_phylink_pcs_parse() that will
> fill a preallocated array of PCS pointer with the actual available PCS
> (ignoring the one that still needs to be probed).
> 
> phylink_create() will fill the internal PCS list with the passed
> array of PCS. phylink_major_config and other user of .mac_select_pcs
> are adapted to make use of this new PCS list.
> 
> The supported interface value is also moved internally to phylink
> struct. This is to handle late removal and addition of PCS.
> (the bonus effect to this is giving phylink a clear idea of what
> is actually supported by the MAC and his constraint with PCS)
> 
> The supported interface mask in phylink is done by OR the
> supported_interfaces in phylink_config with every PCS in PCS list.
> 
> PCS removal is supported by forcing a mac_config, refresh the
> supported interfaces and run a phy_resolve().
> 
> PCS late addition is supported by introducing a global notifier
> for PCS provider. If a phylink have the pcs_interfaces mask not
> zero, it's registered to this notifier.
> 
> PCS provider will emit a global PCS add event to signal any
> interface that a new PCS might be available.
> 
> The function will then check if the PCS is related to the MAC
> fwnode and add it accordingly.
> 
> A user for this new implementation is provided as an Airoha PCS
> driver. This was also tested downstream with the IPQ95xx QCOM SoC
> and with the help of Daniel also on the various Mediatek MT7988
> SoC with both SFP cage implementation and DSA attached.
> 
> Lots of tests were done with driver unbind/bind and with interface
> up/down also by adding print to make sure major_config_fail gets
> correctly triggered and reset once the PCS comes back.
> 
> The dedicated commits have longer description on the implementation
> so it's suggested to also check there for additional info.
> 
> It's worth to mention that OpenWrt is currently using this on
> Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
> already ported in staging tree for testing.
> 

Any news of this? I feel this version is now very mature and wonder if an
human review is possible or any feedback of any needed change to make any
progress?

-- 
	Ansuel

