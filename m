Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2268CFD0060
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=; b=4pfnkVpNw+1m6SjIZ2Swik+KS0
	Ez4yf/V1UarAur2chciOPEi7S7bnMUnzr11z1VVGGj/+FgCMmmLs0laVbI/0oiGqXbPrNPR1olRpU
	fj+gdxGXOteqlKjeZ2pZqLPJkwYJXboNw/4yeOvIC19qlH2jiJ8XALIWTpYf6NZh/SOOar7N0DUlm
	QnRniLum/ig9twN4Tor9i4zShKEO3o9VU+B+FdlqlXc2IcqMUmV0PhtOyJdDj5h4OZiLB8dnX92YL
	3GBXv9m2FboUy6X45GjzDkvq+MWeoZk4qO86RX201QQVAdy4RNC5owHUnu4obXfP05MwQ5Hjfnnhu
	k24w1vBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfb6-0000000B5h1-3mT3;
	Sun, 01 Mar 2026 12:08:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwfb4-0000000B5gC-0E5W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 12:08:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so3401805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 04:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772366908; x=1772971708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
        b=fqzByw+elwzJEQ1clgBUeCQ6C3WanXYYDAAqJ7uUyoer81/U70uZ9mcGyiaCUa36ts
         IWj9Rk1bh8qEgOxTuw2j+gsYWwbVpsNSKVXWZdF10kl67/qD8WgRGjryCHeKA6D3OudT
         CzQO5LNf7EDCCbeC4ZMl72lJK1qpaeI0c5/DJ0P6g2RWhtefwJfOurPzsjhjIb57VIJH
         Em+mAfvzxR55tH/gMTEFgIUzhsWYJ2n2Jj5eb2Jy7+hK9c2ulfsT7+emhPDcIIWx48kd
         K8y6KbbibD/fkXBjZuk2jwlUwr8gEQ4guzIr796LvlS9RbCQyuGCsS2nZjDuS0fjVc2l
         3Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772366908; x=1772971708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
        b=herSbodc/P+J37TKbATGsVP+xzpl1JP8XaraCjxVVu2a5Gy3Ta3sZuPA5YCJse/Hnd
         /n7M06O/IAi7ex/vEZqybLtF4/vR0Tet5Dz2IqGNBplsV0lDniv5ndog2FujiEY9fhso
         2byWTvcFM106co8XBPXMkGLDZ3KJ6Is0xKLd1TkEVQwAaH1SdTaFIekgdlbm1zx/M2+d
         +WePCyLKOTgEeIAdXB7bU2RwzghJwJVtb09KwWWSNe3/3w2xfCV2wD9vIQrjYxZ0SHT8
         DQPB/ogLALJx1Mok09/rlVlBQKiadyiLDN2ro5WyaEdUgmpEln+3Tn05VvMy/YuPWFXA
         0JAA==
X-Forwarded-Encrypted: i=1; AJvYcCWme4fgeTwsi55yGYMIkBx6Mc24d5Q7CchAv2HIQlHBQI5rFuXqurEFIYE6jnUXCStcI4rVUn0Szxhc30jDP/Yi@lists.infradead.org
X-Gm-Message-State: AOJu0Yykf+TuAoZAPccSi4bNdJLM8fz/VZtD+lpzuYVmsyzSEYiwJwMT
	4uEZ3GTR1vG0mASAl2G8zEk8NY2D8T8scKac7M8N2NpfZcPkoK/5FH36
X-Gm-Gg: ATEYQzztJ6Ti0zNajawIrmK7aAZo+pQJQC9LGKIMLv2hgoN+rB6+WM6hr0MhhNrLyBF
	fC6BMpHCwPalf73nECl7IwOI04jO0NRcmoZs8/EzspyDh0yMwIFn4aeWari7Z8dyQJ8mw3PMiHN
	9I/zEOKGeMAiKLT8dfkTPqYL2y/V99zvq+uDA/T5vHGV/REdiJMpbvwUqW04C3il4QIa71Tp1j4
	tmrfdCNJMr1XesCb1eqIUkXw0QWCplA5QgTk0AzrNNsIgDZJaczxW6TBJWHNT7pXpxTGGFWYOvi
	8qFArrAw/jTZ3XqSkaIZrEbr7vmUHqY4mJcpj5nusiysF/o87deWxsvJIA1A5jfs0KS+jk0i1e+
	jp+Yvobc1iwZwAz+IA4aDVKtA4OBbC/ZfkyLBagTTpgcCT/MwZCQWQv3ZYg3OTKoz2Cy+xm0W3R
	5l2G9dl9oCc5KfkvdDjtw=
X-Received: by 2002:a05:600c:828c:b0:47e:e20e:bbbc with SMTP id 5b1f17b1804b1-483c9ba6db4mr86494875e9.1.1772366907868;
        Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm363973255e9.9.2026.03.01.04.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Date: Sun, 1 Mar 2026 14:08:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <20260301120824.ot53bhv7z7kn5lfd@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <20260228163229.1024f263@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228163229.1024f263@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_040830_106986_0A7CD891 
X-CRM114-Status: GOOD (  26.53  )
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

On Sat, Feb 28, 2026 at 04:32:29PM -0800, Jakub Kicinski wrote:
> > I'm working on a series for phy-next which will conflict with this 
> > hunk from Russell's patch 1:
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > index 5b1c82459c12..4ea3dce7719f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/ethtool.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/phy.h>
> >  #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> 
> That's not too bad.. if that's the extent of the conflict (which is
> probably hard to predict at rc2?) we could let linux-next handle it. 

Yeah, I can't predict the future beyond that.

> Of course assuming Vinod is okay with us merging Russell's entire
> series.
> 
> > If there's no other way to provide a stable tag other than on v7.0-rc1
> > (like for example a snapshot of current net-next/main), which I didn't
> > know wouldn't be possible, then I think going with the route of fewer/
> > more trivial merge conflicts makes sense.
> 
> To be clear, it's only about having a common ancestor, I wasn't actually
> planning on making y'all a tag. I'd just apply the series on top of
> v7.0-rc1 and merge them in. Then anyone can tag the relevant commit 
> in net-next or use as a base for their own work.
> 
> I haven't looked how bad the conflict would be if Russell's work was
> rebased on Linus's tree. If the delta is not too bad, and we can just
> resolve the merge conflict when pulling it into net-next. That's
> probably the cleanest.

I don't think applying the current series on top of v7.0-rc1 would be a
good idea. It depends upon this series in a very non-trivial way,
basically building upon it:
https://patchwork.kernel.org/project/netdevbpf/list/?series=1056390&state=*

For example, that previous series introduces ethqos_mac_finish_serdes()
- absent in v7.0-rc1 - and this series modifies it (in current net-next/main,
it is calling phy_set_speed(), and after this series, it is calling
phy_set_mode_ext()).

By comparison, the merge conflict with me renaming <linux/phy/phy.h>
would be smaller.

> I don't recall us ever making a "dirty tag" on net-next which would
> propagate few 100s of netdev patches into someone else's tree :S
> IDK how Linus would react. It's the least good option IMO.

Just for my curiosity, what difference would it make to him?

