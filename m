Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA9E7DF16
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8nmJNYA2lQjU4+qs8oOjHrg0i1hA4xuDHcHJv4bmlI=; b=aTAOjmlC4bvQAMj71nO24abJIE
	1HW2PC4DQ238wwmsQ/7Jpl17FynLBgw9AxifR/r505nfQHYAgniF/yjF967L9aG5mhgi+mTW3ai+j
	NKG9kqlQgk7MSLGFSwrm0hNYW8j8f+xl678HPHrmzyVf6hILhQYWP6WUUYSeGB8lK3wxtAw+plQp2
	g3sF0Gol95sOua+VvVrCGMe1vsYIZDEN/Kn19d/cfnQjvCHwfLhd4FUyj4P/LKoxUAHUAn6OT6Qov
	Z4ujQgY8Du3S/8B9XMX++LX+ez+Fq53u04OFGRRoy3HVahwEVdTSJWkpwls6uwK764+yrblxpB7xU
	Hy/sJDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyLM-00000005P2A-4Aqn;
	Mon, 02 Feb 2026 18:08:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyLK-00000005P1R-18bO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:08:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso26565a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 10:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770055688; cv=none;
        d=google.com; s=arc-20240605;
        b=UI6zRqQ0OaA21+IWABVcXpvQDYVvxPYaRHQOvxbf46mCgWjTLYPMxQik4josX79K3V
         Bv5pxGnDiGbL/xAUJsXEcK4J3c6gW9WONgVcDf50vTlHd0SLcWKQXZb/Mkx46fgzzrLO
         bKa+rCqIF2zLyNMxpyYs/M9WX5pIKfFlcSqE2SE5U3bcpr4pu6nokmPYBQntxUWCerwK
         Wf5N1A9+aK9vngKTX2obZfK+LMiAqvROvsBEBrZmpzz6dphEe8LOtIf2PE6eLf8oJpN2
         F23s/Kv+ELhus7cLhila+bIX4Mga5THz9GZUxcDCIo1kt6saUR0CXxLSLaCdyOna8WHp
         ai+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F8nmJNYA2lQjU4+qs8oOjHrg0i1hA4xuDHcHJv4bmlI=;
        fh=VlcKaJfj0AgDNHwbg8QW8wUl4ShGniAzrzdxPK2mRHQ=;
        b=HzzKtqFmxXBoUWugFHtq+ZXMToA9Be0wTnwLR8srjThw9YcB6RWsPNbt3T8Uwcblby
         qy4JkUW8SsifBPfwjHgKkxHDhdnpR9OhjF+6DP7buVMKs/J2zzwUcJARdp9n+XCdVTrb
         7Y61Fo9f+IjPLZHh5gJ8MwyY2iG0m/BtUs+OFtmiSrzRijmErTiMQY2flyC7uBOperyA
         UAl+3Mi6CRbs2Tgr0yfIL0YPVGjSFnLiQ44WMQbXOgzlY4lnWGZln2gSPzLQoQxs81Fj
         2w/kO0I6ZH+fyQoVbfVOy2y8WGUp1p0t44wQIA3fjclk7V4o3MUZ6ql++i0SbgL91ImA
         zlWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770055688; x=1770660488; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F8nmJNYA2lQjU4+qs8oOjHrg0i1hA4xuDHcHJv4bmlI=;
        b=molvdKyd/IjpTkkQ1iw/MwmAYJDgP+NH/VnkEjPwUwCkPh7UnIfdjZRZ7sSCnIRpcn
         dHwROVXkSdBA6WqbNyNZnRGuz+0v+mgUZqLyuFgr95DZqe6gj5RsRvMbFdNAqL/6/9Mr
         hZt7i5NzvMW/FlUZfGP79c5f7lthZgJZVuLcj0YR3iMtlnzAT7Uv24wfhWl+9ltIeqVy
         4+atPQ0OemfuZ9wpijKlZPRLfznx5Jptek/8ckHCkwP8/WR00z3h/d4jtOqSlM6rvEot
         hYfklmAC9JY5SGpDjCTz8Q+4f//D5uCusBGKZ5Y8b7olMMrKjYUQn1d1rh3xLca8agxs
         z4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055688; x=1770660488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8nmJNYA2lQjU4+qs8oOjHrg0i1hA4xuDHcHJv4bmlI=;
        b=msOZbKSWK5/DYKpWrpgZpG06lEydfa8Je2q0fgk4evoksP3C3f5vW3MkWxtHPcu1/p
         dNW7p+2e5YZOReNj24QaZKxuTZ3ZMNzc2G+TGJOBY3PSdem8lHGehn37eduQV1a5H+r9
         9NrWNTi1qzsmcrOjLzdc1z+ULFBYd1n0Q76gzbkIDdqK5M33m12uqJlguqtPwXB/H+8f
         KiqWqzmdkWu1XNo2FIQVn9ly7OuZisoeNGfigGXqcM6MDi0AzWGCoBAVO+nfSSs7kQ1v
         vKSmVEFsfiE+zQJ+reNwdNfYuSf8urvR00DtRK1RdnDWRL87Ad4JQPZpICn8WecFLpJ+
         a+hw==
X-Forwarded-Encrypted: i=1; AJvYcCXdYkK4IgxzcG+2rqOqJPWqzXcL/rpy7hfsTI2CfYUKYrrOkQv+QnrPZwKhLgFL8pd5GARLB91HglK1EZg6+Snb@lists.infradead.org
X-Gm-Message-State: AOJu0YyfXmBlCpphpBGH3bm5nWT4wysgTsfOJludVoy2SLC2ewh8x/n6
	1uqXvzAyXqybJ2tDvAkdxo9b6J/R27qeKHSh7YhX6s4RHtyTqiDf1s2BTyKMLXqj7xiXOvws+0B
	Mj7E5glQYlzhcjjuhy9a0eDQI0an7HaA=
X-Gm-Gg: AZuq6aIGEr2q6Zie+hyPLIz6CLp0BO1KBWKyQozgQkrNF62UzU7Pc3HiUSxe1zdy9U/
	TO7OONCypN8o2kmKqzqfS0LJw5z2vIDWbXmSTWNi253TzgjFUkzbm7WecwMZ8nT9jJ4sP2WV8nM
	4WArQn68ccRi+LA74GCnaBEx9hRyT9UY1BwY+ioWfASgWsd07q7M8a9cxoTbw+lTLljqxT3ZRgk
	STnVlaAvhe0XV52y1cwgPz0r3oHNOutuTGYnLt7zUHnUAJDEv2+bsei+hhq0GPjoCo=
X-Received: by 2002:a05:6402:1a53:b0:62f:9091:ff30 with SMTP id
 4fb4d7f45d1cf-659327eb130mr152714a12.3.1770055687927; Mon, 02 Feb 2026
 10:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20240809073610.2517-1-linux.amoon@gmail.com> <aXtpg0V_sifQEWHJ@grimm-nixos-ssd-2>
 <aXyHITrZ89Mmn8_J@ryzen> <aYB2IVdh_kth1wtn@ryzen>
In-Reply-To: <aYB2IVdh_kth1wtn@ryzen>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 2 Feb 2026 23:37:50 +0530
X-Gm-Features: AZwV_QiGldhVnV5gsPLLz7K7IUZirLvxF_bXbz8XfJgEu77Yy7zS1U4IFVWDkH8
Message-ID: <CANAwSgQtWifFNFe-rK7s9VCPJ68A7LSP+va2zZWr8W+vgZOjYw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
To: Niklas Cassel <cassel@kernel.org>
Cc: Grimmauld <grimmauld@grimmauld.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_100810_404091_BD92D3C5 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Niklas

On Mon, 2 Feb 2026 at 15:32, Niklas Cassel <cassel@kernel.org> wrote:
>
> On Fri, Jan 30, 2026 at 11:25:37AM +0100, Niklas Cassel wrote:
> > Note that I've built the network PHY driver that phylib wants to load
> > (CONFIG_REALTEK_PHY=y) as built-in. As long as the PHY driver is built
> > as built-in, I don't think that the problem the modules code is warning
> > about can happen. (But I also don't understand why it is trying to load
> > a module when the driver is built as built-in in the first place...)
>
> FWIW, the reason why PHYLIB tries to load the module even though it is built
> as built-in (i.e. is already loaded) is explained by the following comment:
> https://github.com/torvalds/linux/blob/v6.19-rc8/drivers/net/phy/phy_device.c#L852-L855
>
Yes, I have gone through the history of changes.

>
> Kind regards,
> Niklas
Thanks
-Anand

