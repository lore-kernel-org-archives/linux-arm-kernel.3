Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8417FD39008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=; b=ZWQb7XqssvrotMOclpPNqel0T8
	dNac9KnhdPaI6lpR1kst3Il7PHNNPeobuDDDNrXvzJXAn+YS9rwYDYYNqyJWX5VBJEqT8tWMW8N55
	g3cHtpRkIoT2/FqaFjV84vfIcIOIMX2Y0dQWoLGjr0LlRpVQCSF4+HkJUoMM5bml06MIm7EsJJDk8
	maEU3AmljRZuQIV6Meq+lIfyzlV2butggVuzrJ4PLW3o3Ox5RTx9DQjMzEzWeUWxbTtEpvum1Y0ar
	WLyH5GCHBudiYgt5OMars4zlNZKxaSS/jBzMUAMVHrE+WDlyGvNhv9wyrGiGK/KMDqOgsRlWQbAT9
	X1+ANqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg68z-0000000APkC-1sfZ;
	Wed, 14 Jan 2026 19:03:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg68x-0000000APj8-09cQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 19:03:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64b9cb95009so13523a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 11:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768417377; x=1769022177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
        b=HM7+H4p0wvgK7GmDRY3Z3BIlK2ex3a+82VPAPqMJ6t8T3YXcW6kkK6cazQS5fEiU28
         qLt3SyJiqURYJKmi0BiHyVh1Dmq+lm2ALXu9q+Eu8Dn/A/uIUuVwCszDR8TJl8iN85+Q
         coXlMGM/fAdjxGNTVDObXnzyKJwbuLRmtXF9zRJK3L6MGFt0f0TiSVfhudJHKYXCPm0N
         c60N/ZSHA7x9XaTnuUz+gyrsQugu0pDHMRML7hvLOrVBKwMfJ2jJz1iDJpLzA6HwzTvn
         pdIymv9km1l/Cwi+cm8nfkMcMEyKtzhbob1TORMqwysWKsUYgXc8UGz5Cf7wNgl2u7Bc
         PLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768417377; x=1769022177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqOxMcid/peC1Iie6lTLw8C1UUftl4S8ZikbVgEoS64=;
        b=vxUE9VwyAfk4h3ZAq7CVY5Qi9wX1Oi/vxJnleathdx7/1zDM7eMp8eNshCDDX+IdAj
         t276xWQocIwuTP5AFIykh4j7QWQXzICHmyFUoI0Q6DLlzezuJjGsAQwj6uStLeECTYQG
         mNWBtg4x9aVOqxaf9cCiUdirH+krPnOC3mmXjv/haCP11/dCLlFTdmVRGOhHgTMERSgN
         u1CMyxf6KoFDCQFi9ocmg9M6M3gEmb1Pgel+29O8mPyJiFyW9M9praaM35jNJc+EyRSI
         0KD8xnZWfLZaWOP2FrUFA46494T9F4S0npPERDirAOr5VyE1ZK5wGq0c4lVU2QgNSgzU
         xCiA==
X-Forwarded-Encrypted: i=1; AJvYcCWfl4h69C4yJ581erUSJJfzkUJjJuC3UN9YqTuPW1Cr3gVvNDq478OmxAnD1G9xkm7QuKNiD5ShgVWUc9W4NURE@lists.infradead.org
X-Gm-Message-State: AOJu0YzWKQPoVCRL9KWY5yCosxVMyg6XDlhebJC7qxRQ8kaWfXwwLTji
	tlCSnlUDqpXmEQX9uMuzKEd3qn8GGU9UlMtaSBuuPbhoKpvqPidZ8SzK
X-Gm-Gg: AY/fxX6+/2eepqR2Jj+JKxPmEjv8CtXM5lxwylxtumd0e1bOqOqktu8Sb9WC+ECTRBs
	imHL6XayQAyQWmVkCa28NPCC0OMPF7d8qleAfQb21rc9I/X/YMvuJe08NT50lznG5Kw9itUQ7ln
	FHo3J8s46pimdzOPqJlE3UvJDfc3OnlXE4poEjaHt1KxmVphCy7klZr1PWiNw9QQwHObwZ81Ow0
	LKnS4w+LE6gdzdRiHdsKnCYsnXJ2/Xi2LKnLeLmm7pK8CNFogAL3zvDNi8WnQH7PVcTk/RpX5Rp
	rSC2sdHhOTFGLXqvjbUP24A4Ocr4vLf4FflTnEQOuLt2r6OzajyYz4y+lWvEZiZyTT6ghmkmfFl
	uFXLRZDi/jwyu9zpYMPj2WWJsCtQ6088t+wwxvBoi6z5cKh11cNpWPV6MsIlQ/uP93yMyyt5BO0
	ejwlQ=
X-Received: by 2002:a05:6402:34d3:b0:64b:5a76:792b with SMTP id 4fb4d7f45d1cf-653ec459a3cmr1649376a12.3.1768417377014;
        Wed, 14 Jan 2026 11:02:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d703:5400:9b39:8144:8a26:667e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65411877591sm391335a12.5.2026.01.14.11.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:02:56 -0800 (PST)
Date: Wed, 14 Jan 2026 21:02:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <20260114190253.ttrookxubevt7aku@skbuf>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
 <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_110259_095196_FBCBD618 
X-CRM114-Status: GOOD (  19.69  )
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

On Wed, Jan 14, 2026 at 06:55:34PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > > using SGMII, 1000BASE-X and 2500BASE-X.
> > > 
> > > Add an implementation of the .set_mode() method, which can be used
> > > instead of or as well as the .set_speed() method. The Ethernet
> > > interface modes mentioned above all have a fixed data rate, so
> > > setting the mode is sufficient to fully specify the operating
> > > parameters.
> > > 
> > > Add an implementation of the .validate() method, which will be
> > > necessary to allow discovery of the SerDes capabilities for platform
> > > independent SerDes support in the stmmac netowrk driver.
> > 
> > s/netowrk/network/
> > 
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > 
> > Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> According to patchwork (I forgot the RFC tag on the patches) it needs
> linux/phy.h included. Plesae let me know if you'd like me to retain
> your r-b. Thanks.

Ah, ok, I thought that the SPEED_* macros are also phylib-specific like
PHY_INTERFACE_MODE_*, and hence, the phylib header would already be included,
but it seems the SPEED_* macros are provided by include/uapi/linux/ethtool.h.
Go figure...

Please keep the review tag.

