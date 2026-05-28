Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE8CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jhtv5gfHMhMDDRGWAxzr1d+I0IvsgpMKf5TSuP9K5us=; b=gBszUDXEc7z7yrywzFne9/ABt1
	RRZOOatnFbaSQSrGiQnraUgYpXjX5wyHsf5GaWsDTUw6tKVqoxJM+5lz/zRT0uURYv0sKElrVDJ8p
	mVlOFikOnY1LDltcx7o47t8Bc1ayMHElpwSEC0UrwmRf7RWPGD2cODEF4zDhdBy7xZpqh+TnohaI+
	lqkNYDdeY/B2W3c5tJGscPil+Y3LWmAwEjoIjfnqxdvyjM4I60k3AK9SavRmEIwLDZ+FlXKm+phZD
	T8WjgjJgDe+3KAPznpubuseUGWwH/OtKsSsEk80s83XNmVGcyBeh1WOxxVlomGq+/9E0la07PAM7I
	lISN4Uqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWDw-00000005PHZ-3vdR;
	Thu, 28 May 2026 08:36:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWDw-00000005PH1-1A7T
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 May 2026 08:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:References:MIME-Version:In-Reply-To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jhtv5gfHMhMDDRGWAxzr1d+I0IvsgpMKf5TSuP9K5us=; b=oFzlduZWyfJ15dqg0i7dUP/bL9
	noY5Q7utUC29ZEVXcPOSvz2UszMnCeeVQq9Hl6S0OnlnmNFe+uo4O0nRNlQGFzyYlMKhya/9CQnfv
	8NSFDv/CEUABe1vXtwbBSvbJWGUXnzhpnL7RbLQ1eggP0d5kJBnPalpiIUKJB2AvBuWMxljeqnXQL
	FKyTnSb9P8ky0rYGQ9N6qtioIECW1OQCtzlb/3xm5YvKVaPz5Q3YzphKF6hf+aRN5I/ztNZLGNk05
	LRTO97FuOfe4NpTFJH7dZ/BGqPpDuql9h6uJzNFSIf9WNJz/hrhulffV18VrTUHyaFThj4efWkXRI
	mjyS0G5w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWDr-0000000FqnR-2ona
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:36:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 347B944D7C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B72F1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957370;
	bh=Jhtv5gfHMhMDDRGWAxzr1d+I0IvsgpMKf5TSuP9K5us=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VFNaXUBJ0I6dWCgSi4X6uquLZRc6uD2cheJlY0GPnVygZId6+xB41Jc+WheBTpwfT
	 ByQ1uFkmt4r8QayZ8u+4l84wV5bp6DbqYpOpMHH3h4jjOfIvCOK3brITCXf+AxvEPw
	 CwGUI5gCmYoo5ZP5M0bHShcZgFHl7vf49cJFu2gvgR9ue+tN6HYCyuFxuB3trWkwT+
	 5634ej4meY9PsxqpyYp+mR1bqoPFCjKOm84BcbbdIpiqJ2gTzpNU69XoJst80a0gJa
	 xILfdwI/KQcs2o5Cn2rcRGxaxLwvPsb54G8RGaFrXSpquyDgjc839sns123iuSaO/x
	 WcgiGwK6ozdmg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so14844582e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 01:36:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9xOJCytO51E17SqJLoBu08jErOU5haf8Kx3Glw7kfMk/QmKVeDNKQpNo7jVyMKyFVqj0bmzwMOSvKMpt6/1hNZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyixDLB4Nm3DmK00b56dDLRo1027hQREHpHJrhHLvuT4xqpNHt+
	uv0OLwXpA8bcVMAfcGEHgIFnG6P3RcFd4kWGBU6GVLwJ79cdesg1BmZUsdhdH8DO/QO3t8CKhKN
	ZncdAmu1DZd5zvXpZL0gucY9lXk0PBOSo/PQn5XJ0tQ==
X-Received: by 2002:a05:6512:682:b0:5a4:301:b92 with SMTP id
 2adb3069b0e04-5aa323daee7mr6994841e87.33.1779957368708; Thu, 28 May 2026
 01:36:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:36:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:36:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026052710-flagship-unsmooth-ce82@gregkh>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <2026052710-flagship-unsmooth-ce82@gregkh>
Date: Thu, 28 May 2026 04:36:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
X-Gm-Features: AVHnY4LBp1nsLqjfLxLqbZp_YoBQEjH0FEHfrkmt_Ac8CfZjzB49fTtbI51YibQ
Message-ID: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_093612_422686_0BAE1490 
X-CRM114-Status: GOOD (  25.94  )
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

On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:

...

>>
>> However this seems to completely decouple the power sequencing from the
>> USB core. Take the USB A connector for example, it was recently added to
>> the onboard USB devices driver. However the connector has a device node
>> that is not a child node of any USB host controller or hub; it is connected
>> through OF graph. At the same time, since it typically sits at the top
>> level of the device tree, a platform device is directly created and the
>> driver subsequently binds to that device. This is totally different from
>> how the hub and other directly connected onboard USB devices work. In
>> the onboard device case, the device node is a child node of the USB hub
>> or controller, and the corresponding platform device only gets created
>> when the USB hub driver probes, thereby sort of tying it into the USB
>> device topology.
>
> Hm, did we mess this up?  If so, we can always change it if you think
> this should be done differently.
>
> Hubs should be dealing with the power issues for their ports, so maybe
> rethinking this might be wise.  I'm just loath to add hardware-specific
> hacks to the hub common code for obvious reasons.  Anything we can do to
> pull it out to a separate driver is best so it doesn't affect the 99% of
> the users that don't have that crazy hardware :)
>

IIUC what we discussed with Chen-Yu yesterday, the only thing that needs to be
done in the USB hub driver is attaching the port firmware nodes (if present) to
the port devices we instantiate. The rest can be handled elsewhere.

Chen-Yu: correct me if I'm wrong.

Bartosz

