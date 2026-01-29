Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D809D61015
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5jH8Rxdp+tEZoB9l9fTv6AucC1v6C8I9T+8Tw0hHlg=; b=4T/mNe+oNFgA1mi3chtjtzgIus
	wlYECF0LqKDfFT3dkt8oLAV7Ial04/Box49VtQkGtIAJziIN9p/wVNVBZKVcAOqkIRZ9e7lcvcA+c
	OgsF+TpQnieyYmtQsu4E1hOd3StPCDj0aJijFbKmU+pkwPTAtMsquLiRQKmS3qbqVuxto4eUO9bxP
	jRLTWzXvQOuKJGD5NSDfe3Lu1DzxZ8cS61V1123Fp+zRBT0XbXkm2zEAt7WhJ3EINj0AC2v9skDOe
	SeX/XUc8ezLGAl+MTr5djseJLGGjfnkFWZrrRc1dAkF5a630PAizcnCnkJpYLBnXqEBFX54UidJLM
	I60N8BZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRfH-0000000083Z-1rA4;
	Thu, 29 Jan 2026 13:02:27 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRfE-0000000082O-3eyk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 13:02:26 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso1710615a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769691742; cv=none;
        d=google.com; s=arc-20240605;
        b=iYS2uj1taO6dz3eg3yJ1vnVHfu8MCMZY0J1BEm3suIyy+y9cnK3Wmkb7TqZQjujGl6
         Hb6ejGCIKOPGso63WBK65LDDOW6dBJ6lhSWYI4GG9QXqA94Xj6HaLIBR586SGSVZusD1
         f7aWF5Ys2X+gjr5+TU43M09/n8iIBtnsa+y7vUWgIBNMtO6DXJ9mqvluO0SMaLrpnZMp
         824IjJ7k37iyKxyDlKkiMyrOL0QvgmYje3E1VferTqH1QW54N+Alm4O5b5I7tU+S0ZOF
         XR09g0R+eayEgLllpot3LuLWt8Sx/Bd3uVK2A7CK4ox+SCaoB78v7CQSPkA67Vya0DnM
         jf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o5jH8Rxdp+tEZoB9l9fTv6AucC1v6C8I9T+8Tw0hHlg=;
        fh=arzLjuK3JTavabrZDFmQvh3Mtty7XjFwX020k7ipCPU=;
        b=GvL5bbVaGjRPKs+UxHpPM394utiunUOHBdpuE2nT8lxbdlvhmwRflFMNRNsMwBX0Zr
         /lRpF5GQ7NAOJtPXuiWE76eTCbvh4Pg/2nVSYenJ/gnsjXKGXq3McdkYtV7XvtQzTgc5
         c8YsTxV4/+4aX0AIlCGnwuCQFDR652iJYQpFW0a+dIK/AnLCppVxJ/RCnxyRd0vRrhRj
         jzkUUAfySemyCTJgiQ9z8aeZh50+PG3pI4w9mzdi1EJJ5dYSr0nRzU1jyGqVDqqWcTtP
         +t7kWN6ph4FYNv2WzZcmknAFALqlxpMOxQXFSBrjd6DNrxIFzNwGTTSuXR1z3SgDZ0iC
         EUwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769691742; x=1770296542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o5jH8Rxdp+tEZoB9l9fTv6AucC1v6C8I9T+8Tw0hHlg=;
        b=tVSNkobbzD9L/IZe0n/+KgQVFf91Xk69sPBeAHhDfGHP3LGza6EE5mTFRL08NODL8I
         Lepk1/qrKaNn4paJj7qkGTtkDjWZspn20x9P4uwrfwFDhWgpswI/pPSVyr7EF6o2neu1
         VomTke+NhAc+jqs43S6DLkjSTKflZhCwPfi3Z0rhiMyQcgT28GAQzIBlsInVoXc9tojA
         +iGOFpqcX7eyPPic/eIbs/1oFVrvWR17yOAZHMf0H+DTM11VIAjMaN1rvu9ge4GwhUTe
         TjzEtZsoLGO4rNq44hwlGBY1J1fP4PaeY0DbuLIpOvyjBMEnZNEEucJfJsCLI5Owy8BV
         6icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769691742; x=1770296542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5jH8Rxdp+tEZoB9l9fTv6AucC1v6C8I9T+8Tw0hHlg=;
        b=l3DsViN0oJOmLv42EHCarI7hev7jGf+k13oLssO/hLxI5nt7wIFPW/5Ds7zkUBn5dd
         WwIR7ErQgxRPYvvxASV552Oys+6IFF8dtYqae2DEuTd+pYPMMWdPpOl9EDbCUjCP5B8c
         I69yUMxGCuazmkSWWrp/tB8ihZYbi4FC9iAO1ZOvobzWY3BT0pFfde/H4RjjAoov04BP
         vBev7ni/I1xnck9S1l+SEY1DvNjoj3IOGw9gqvSUanA3l628dYMUBJ/xJS/OeOhGsPS0
         IaiFFvlr31rOYi9CQnHWYR3OG+mskKlC1h6GzROxN/ST81Z2C1S53rPGFJdoVbqsk1QT
         +wjA==
X-Forwarded-Encrypted: i=1; AJvYcCU9AqPx/mgc3wFibI29JW3rIpHobXbkfYBYm5QoH+ul46yVuqBDfSzwInXOxJpwGhqUDbISZLeFtW+aJoYDNw/I@lists.infradead.org
X-Gm-Message-State: AOJu0YwWYc/gCYSOC1a3CqHjHMXdFwM4z/VjS6YM53Y3xWa+Y4xPH3Lo
	8c7RRL9Ct80pmYoSl2z2PKlCXF2WXh4df7yyAgV8k5iwwWJMOBZRVwmBUatyoHZdRzxcT19x20b
	r/RNx9WCcUzPLWDZV0Sb6NfqCqqkT0Y9rW5TakgwZ5Q==
X-Gm-Gg: AZuq6aKXam5PsX2A+sUPqor+1m/mJZsZnXG5kQ/dmCsd7WzBFUAFxDCRlpffhRzR+p+
	cSPAx9n0y89qt9UM+lQp0ZQQIRb6B/ZI/MDtf/CPqxA49YReqFBoMZG9+VT7CMo5rb3YeYxQ6yu
	vbf7O8Q7XWU6mON3SgpzD+GSe2yiEtOeQlv2IV2NojeI3a+8PktZsMuA3soVvivEP0cf2U56O/m
	T93xQ68Fdx/hcjYX9qJFZrGzgqyfgxQ+ezZJFBF7kFzTDoC/cJo4DtQLyUpEw831yjRZ0dxoeMv
	K8ByrJOVKp00f5EobFVeNy80
X-Received: by 2002:a05:6402:40d6:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-658a5f8cfdamr6437778a12.0.1769691742347; Thu, 29 Jan 2026
 05:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org> <aXtB0QcVOkE_hhny@shell.armlinux.org.uk>
In-Reply-To: <aXtB0QcVOkE_hhny@shell.armlinux.org.uk>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 29 Jan 2026 14:02:09 +0100
X-Gm-Features: AZwV_QgTBsEbqAq2XkLUgo22OQOD7HpGZIhc6Tp00c8M0BIdl_pPusc1NHtuBUU
Message-ID: <CAKfTPtAg201wXU_LuO-Y0M8k6ew8-vhKsjoHzJ1sxqp3Pn=wVQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com, 
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com, Ionut.Vicovan@nxp.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, Frank.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_050224_931372_EFB1C9B6 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, 29 Jan 2026 at 12:17, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jan 26, 2026 at 10:21:57AM +0100, Vincent Guittot wrote:
> > +/*
> > + * Until now, there is no generic way to describe and set PCIe clock mode.
> > + * PCIe controller uses the default CRNS = 0 mode.
> > + */
> > +enum pcie_phy_mode {
> > +     CRNS = 0, /* Common Reference Clock, No Spread Spectrum */
> > +     CRSS = 1, /* Common Reference Clock, Spread Spectrum */
> > +     SRNS = 2, /* Separate Reference Clock, No Spread Spectrum */
> > +     SRIS = 3  /* Separate Reference Clock, Spread Spectrum */
> > +};
>
> So this is a PCIe thing. If it's part of the driver's API, then it
> should be common and not driver-private.
>
> > +static inline bool is_pcie_phy_mode_valid(int mode)
> > +{
> > +     switch (mode) {
> > +     case CRNS:
> > +     case CRSS:
> > +     case SRNS:
> > +     case SRIS:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
>
> This checks that the submode is one of the PCIe private modes that this
> driver wants to see.
>
> > +
> > +static int s32g_serdes_phy_set_mode_ext(struct phy *p,
> > +                                     enum phy_mode mode, int submode)
> > +{
> > +     struct s32g_serdes *serdes = phy_get_drvdata(p);
> > +
> > +     if (mode == PHY_MODE_PCIE)
> > +             return -EINVAL;
> > +
> > +     if (!is_pcie_phy_mode_valid(submode))
> > +             return -EINVAL;
>
> This checks for the PCIe submode, but notice the test immediately
> above. PCIE mode is being rejected. So, this driver supports
> everything else but PCIe.
>
> That doesn't seem right.

It's a mistake

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

