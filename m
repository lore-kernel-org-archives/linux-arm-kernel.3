Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A6AFD0066
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=; b=wu5lAfTDxGphxlhRa8bmj87G8w
	3wYaMbgqFR1rlQ0yU5mciUNBpKwQwjX6EKewnnoOWW6BDctoIpKCSZzVGjdsaGJwwU1uI3iFiFiGG
	84a7GrNaEFmhNkfZii/6gnPNbuDQAkYi38HvYu0uZaGzdBJBQHoRJq33UHbSmDjyMnxHfo7EF8AVu
	E0VewppWObgiF+ByBAUjojwXnYNSQm12Z19cqOTXwi2ul5s9sftwhJhg0Ap/bDelh/Rk4hwNh126r
	lGPtLcCvoGNx71hopEWz9bMBBkxhjVDlFI8l28Q2w0xD7Rz2qoEmAJgjWEQECbZCjtZnBpHK1nbmV
	cYntE6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhVP-0000000BZ09-37OX;
	Sun, 01 Mar 2026 14:10:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhVN-0000000BYzJ-1nfq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 14:10:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4830f029407so7741105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772374243; x=1772979043; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
        b=Vfk7rRycsuRI8YkZspp1zNZebUZSLWDev83FwjwcZz/VyCfnk7Fx+4xsTWU7o9rXs2
         mkLwX98xx50oJFYScKX9MEN0I1oTM7XhiP2Bh4VHirPvTXTtAh5T8RZAH7OMv/Ua3GCP
         rSDEuYY6XDgARiUg7PxABHYg2DLtM5+O1ha8Sx4XhEjANMploPuV3kAwO3CV4DETl2R6
         iZB7ccA1HeDp8lqV88PMqcuVm9U1lWvpR7Dt+QqwcBYFqAYwTLeSOShHkCiTMiDmHqfi
         vhQZOLZHBpjBJyOK3gCnhlAuFip4Q9Sqnc3TrHgV1d1OqLb/deb4nXwCpxAE1tO6gX1v
         5A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772374243; x=1772979043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
        b=XoF99tjaEIgcYl0YFiAxxsmkJuKVTpxjJbpOjlt5qfQN0MHCG+TRV6tyrD9GPZ5eM6
         /LsyYB0L6Fo6zkgfzj+HaDlc6CTAEwN7krhhNTHDAdef8Td7dV08aG3wm2hBdVZglyZr
         l9fFflbud1Jggm1uCLpDgmNgdExeZzdP+PQ+Edq5laOIvZ8iLw5odZulmvUzJrVOM0Tp
         4ikucrIZzc2XfQdEQgJeftumSSbw5AXk/FkZoRvww/t0pM3yGZZnd21kXmXx60N4xC3E
         Ktk7jhjywGtCpPaUgnd3EY0Qv9lLuKtzUtbN8ud37OTVi/HAfiAVC0nsToY4eIi3XVLP
         codQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKF6se3+QlCiLisMWcVqfkKtAOlLfpfHes6/iQCTDTR7/U7yVXKS30zKmIPcsIXucl9E8A6cNNpnn04KJ4Baib@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt+Wz8UpzPjuIKpzYJTkFhfTwBaiYszd4I1QDhysGmLNxQ0olx
	Gxpt7DFQwzrZdhoqUbD/II3dWU7WdMskqB+KQefSzIQfZ+XBrCmQeog2x8HgDg==
X-Gm-Gg: ATEYQzzarIdvO/Fumq72CswoJbt1OEmegsLc0I3BJQUane74bHdEHFb69IwGaXfA8Vr
	O4+mRWhO9EMQ5tGflJzgMRaGdKoASjRFSfZqnU5PQQNI1g5ezV4Opm/ZPKJ7S4FMYktOuKURsfa
	nS3scvivZCtqRAb5MbfKw7uUtXZMwxKRu2FuivEhmeytDFgxXLXAfStndRzLl1qluoMcHMG9Mw/
	7a2NoUCG8vYHA3N+5AX7lcLJVR+aKPAWLyGkTHEc+tx8B9zYRQw4LqdH/jKj3xMdbtVuiBvqQ5f
	AXLaNmdCpDimABZeYKFuq54NZCYDIUhZTqAglJDj+tfxHOTnOc1B4zUwYFd498br6q42FiudRZC
	kGaIEcME2mySXTQofdlOp+MnMar+Jlp5vT2gBgGfuV0FKMfnpG0AYdwfcN+RQWnXTJBeR1PFIXR
	Biq/0czLJQyi1q560Nq2c=
X-Received: by 2002:a05:600c:4e8a:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483c9bd9eaemr93243805e9.8.1772374243073;
        Sun, 01 Mar 2026 06:10:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77abdsm107413555e9.2.2026.03.01.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:10:42 -0800 (PST)
Date: Sun, 1 Mar 2026 16:10:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260301141039.muzcrt6cynilvpei@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_061045_473948_BE87B380 
X-CRM114-Status: GOOD (  29.42  )
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

On Sun, Mar 01, 2026 at 01:42:15PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 01, 2026 at 02:14:53AM +0200, Vladimir Oltean wrote:
> > On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> > > On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > > > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > > > The AI review for patch 7 says:
> > > > > 
> > > > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > > > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > > > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > > > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > > > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > > > >   before attempting calibration.
> > > > > 
> > > > >   Should this commit include:
> > > > > 
> > > > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > > > 
> > > > > which is _wrong_, this isn't a bug fix.  
> > > > 
> > > > Yes, that's what I thought but then I saw the other thread..
> > > 
> > > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > > and Vinod wants a tag :( What do we do? 
> > > 
> > > Could you, perhaps, send us a PR with this on top of Linus's tree 
> > > (a resolution of the inevitable conflict with net-next would be helpful
> > > too).
> > > 
> > > Or do we give up on the tag?
> > 
> > Actually, I think it's mainly me who wants a stable tag. I'm working on
> > a series for phy-next which will conflict with this hunk from Russell's
> > patch 1:
> 
> Is this because of the issues I raised with the quality of generic PHY
> API implementation by drivers?

I don't think the issue you are referring to is so much a "quality" one
as it is a "lack of requirements" one, but to answer - not necessarily.
Eventually I'll get to Ethernet Generic PHY interop too, but I saw as
first actionable step to clearly delineate what is PHY provider API from
what is PHY consumer API, in an attempt to stop PHY consumers from
poking inside struct phy.

To improve the interop situation, apart from patching drivers, I plan to
introduce a new CONFIG_GENERIC_PHY_EXPERIMENTAL (meaning: enable for
development, don't enable for production, but drivers required to work
with EXPERIMENTAL turned on) which would make a few changes:
- make the .validate() function pointer be a required dependency for
  .set_mode().
- call .validate() before calling .set_mode(), and reject the call if
  the mode and submode don't pass validation
- swap the power state before calling .set_mode(), and restore it
  afterwards

Some of these changes do need that consumer/provider API separation I
was talking about. For example, consumers should not look at the power
count of the PHY (some of them currently do; not to mention they do this
without proper locking). They should only concern themselves with
whether *they* powered the PHY up themselves.

