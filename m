Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1CFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7l1aqdorv8dNx2XXvch+nk0kVc1JB63/bFJ2ZS4jLGw=; b=vCEe7B1I+psZwhDqr3Bpryg47o
	dXTo4zDLFfsnr2MrwrKsM1t6kCYWiLg2A4HgIvycoNXx1q5USH3E7YZ0AI1oxeuZ8aS9O3ZkmRPw3
	C040Jaxu84re8WTD9R35CmYNzzcLSend4WKT9aTQqoYP5DDwKDKbKZgxqAALfQCg6uNyxYzQVfYfk
	O966YGrKKr6p59zJpmbWcrtTAP5u/vsovYVkGARDKonJDD/Gil9lhbDnLfROMMh7yHdSoi3J9GMWA
	6/FIN+ypj+c93y4GOi5fMm0lxaImCOzqZOhY9mv3xN0WFrz8vthmkOx4TpE6CD9XRRQWvG+TApvbX
	vd/cf0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGlU-00000009Pra-2VD3;
	Mon, 13 Jul 2026 13:32:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGlR-00000009Pq6-2FLR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:32:07 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so4377817a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783949523; x=1784554323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l1aqdorv8dNx2XXvch+nk0kVc1JB63/bFJ2ZS4jLGw=;
        b=e6gx+f6HQW1LbHXxszF57jC31MfaTKYNhTpLqZYbV0bjYtchYBBFBFgnx3YSD3l3t/
         B8EBhUeuhkqz+J4dFyTE38WCG+grX/I9CvkwciJe5kiAbLg2PYDtX9Gm87nYLHQa70g9
         2GTk8Z8vC94vwAMp4IccQn98lgo+gTLmMnEhMB5GEPVu1ewkluMuPkzn0Ec6j5QHLZr5
         1Ya+5e1wEnDfjakHC3XSg89de5ohf3ErnWHs+cPAnVo3r2Ad+fYGPiwjaOAoiyeByfed
         S3cxT0pKk24jYTICBI+1wEVDkaHyHdhcaJ4XKTqCwUFLCz6WOLSL/dInMR2gHGB/kk+B
         +MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949523; x=1784554323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l1aqdorv8dNx2XXvch+nk0kVc1JB63/bFJ2ZS4jLGw=;
        b=adpEsCGrPLGV6/Wt/D0fezRywdrWGM9ph5S+V3VsDzWfk57zDIg7G/o70+aszv4UoS
         p7r509UcUTIiU0FwfSB3q1cvWKP/eSKOBYbVxjdcZybyD2vpp3hSOmPqanfPrnLeU7Y9
         YP1561c0hW3dXG1JGDI6/VsulpEOAGOW8Tz1pDW9P6Uyh/giLAJezFZ5ijkNgTtv5B9O
         SnmgjOf21oKMUg5MXUJTPnHbwd1GOcHTo/TdKR6j3n9HnyebRoHveokX6SJP12mMAigS
         FYG4Ba6KCl1CJO1/bgXVgjYHOkbKsubQw399C01gbvsNzjwLyuSwUELeqzuzRlHGkOdp
         G1Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Sl993krg3tncoI603CYzEr0c56TESUYGYOEY6DBsYLC+f9DDCDKxCVl1uyeUnAGUslZMS6e5FJ6MceFDIFpi@lists.infradead.org
X-Gm-Message-State: AOJu0YwEjd1d2uPa28uq/cxxIQ3V1j7a5goVeUCcRjUfB4xikABVc/AW
	/Qqh+PWKDGKp2K83IKY/fs4ty72OgfWqxKziXzLErpU2zniJwvSU+wuj
X-Gm-Gg: AfdE7ck7rg9kz1otB89Skovw7QJbod5kLsFUZy1bdj2gBUog+8yjQGTgChhrVRAvQlW
	+MEoia8sWckenWuXkv1l/ofr/sG3EYn10gPIOcZZfi6DP3tm1FcDzXWuxxpTdn1pKjgLaTQG4RS
	hHRW4U6JqEmQbUECDWPgdl2P3nVmg0ifID6iA9eylNRwuVWbz5nA/c9ufXiF8uDivIwkRVILRmf
	Qm2mJOCfgcTn396RCxbDFu/1EzThsG+mPj9aO3AnfnfxbuctibqFWxUjcQLsHpdC1292XfezGgR
	VZNfhn9lSPjggeLJs9Joz8QWe3pSPVuQJsKtE6uEbgjdebwken1ubRsFSVQHLPFcq3ShG2+RiLZ
	54wmalf9U2W49wcjWveZtxwPtJDKPKXTbS53KGZqkZmUz4TbwRIGYYyxeZ5Z6ssEYGDRxLJB5tt
	tjZSk14fl4DTmoomOij4VQ0wokNgQeRt7uN1fEdXwWu2ngcl74FlKs9Isbaxz0H69u
X-Received: by 2002:a05:6402:40c5:b0:69c:eca:3bd1 with SMTP id 4fb4d7f45d1cf-69c5f102cbemr3782153a12.24.1783949523149;
        Mon, 13 Jul 2026 06:32:03 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd8971sm14840303a12.5.2026.07.13.06.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:32:02 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:32:00 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
Message-ID: <alTo0KGWAixkK0i8@Lord-Beerus.station>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
 <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_063205_589740_624E1F48 
X-CRM114-Status: GOOD (  13.10  )
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

On Mon, Jul 13, 2026 at 04:02:34PM +0530, Vignesh Raghavendra wrote:
> >  
> >  &cpsw3g_mdio {
> > @@ -159,9 +169,9 @@ &cpsw3g_mdio {
> >  	cpsw3g_phy0: ethernet-phy@4 {
> >  		compatible = "ethernet-phy-id0283.bc30";
> >  		reg = <4>;
> > -		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> > -		reset-assert-us = <10000>;
> > -		reset-deassert-us = <100000>;
> 
> So are the reset delays no longer required? Or they taken care of
> somewhere else?
> 
> > +		bootph-all;
> > +		enet-phy-lane-no-swap;
> > +		vdd-supply = <&reg_eth_phy_vdd>;
> >  	};
> >  };
> >  
> 
> -- 
> Regards
> Vignesh
> https://ti.com/opensource
> 

Hi Vignesh,

No, because this GPIO actually is not used as a PHY reset.

After reviewing the hardware, it turned out that this signal is a
board-level enable signal required for the PHY to operate, rather than
a reset line.
The previous reset-assert-us and reset-deassert-us values were
associated with the incorrect modelling of this GPIO as a reset, and
are not longer needed.

Thank you!

Best Regards,
Stefano

