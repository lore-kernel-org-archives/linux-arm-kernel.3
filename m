Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F9C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBTM9WY09lm/gGdZhulr7/dP5G3uqnfHYWiy8iUJ1N4=; b=XlZjNjRnkQBfMC4lxYAeYMloOV
	cuB4RKFT+jxyGuyNelqHUBDjAWV0CoBGx3uOn9OuIxEp/6XC9wGg2oq8tUJVymT1WBX0//D6/KZVa
	M5Um0ITy/N7Yc75Um1kkKDDM+4ejXZoLxLf8ii+0xP1Isn9b20kVSI3RzKE4hvSWLlsgTmViUJaY7
	Ofgm7yk+Kjg2H/UrNYwY2V8wFr8bSLKEHiUw/2PkWfqNZvol96p0yQFNk0XEK2kxHJOg7/C5S29uE
	jCTIl/L8E6aSLVXF0aiMkebUJ93RQ4X/4HYB0fyPHg/RieQC/HdIhexYR7w28MQGnEcQ/EmthNBk+
	N7ceU5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhq-00000009rwK-027n;
	Tue, 29 Apr 2025 14:13:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jlG-00000009byf-2fST
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KBTM9WY09lm/gGdZhulr7/dP5G3uqnfHYWiy8iUJ1N4=; b=QFX4yuvX1zRa4CIYmRWU/cmmEz
	WTDbw2LKPt2P+RVmTFBKHTj7IrZ9XS7N8NuL9wGewWpOKE5G35gi9qQ/zyZr3rSsYLB7e+hXTaVQe
	B6ubsQxEpj+qvBt69NhacSsIOLBKntsVdx1fBLc0Na2P26UcFGFGdMxtC4PdqkBIHLto+CTLYHv+y
	M8wNiMcu3OWhEd+FfHTTeRyAF7qdoOI3OqmrXxzs8Xpf9kpFeFuL5vgXJrZlBDbIAFuL34C3Tl1v4
	XEFRfayuJlLo1EFq1FOJhGJ02/qxCv/naF1Q+k5sg9PyUz5vx8SA/XF3F+WTvI+qwWnMNE8Ri7HIz
	OpJN0qOA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jlD-0000000DJZm-3uHX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KBTM9WY09lm/gGdZhulr7/dP5G3uqnfHYWiy8iUJ1N4=; b=SkZtFKRBDYSjtCqVbzOhcQEuRj
	DWyy1aTiVIPrrCWaBx6JUhx9WKbn3kEKxrlq7I9x/KVZ1HuLvhkN1sL/+Z0ziDpGobC1e/avHvFAC
	psMCCdKOBLmsghcs3mywZeA3U6QJA7FBD12XTQa0tvtrNQ3osLdKcoOXs9/Fv47Zw9+E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9jkn-00Avy8-8E; Tue, 29 Apr 2025 14:08:01 +0200
Date: Tue, 29 Apr 2025 14:08:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <d00838cc-5035-463b-9932-491c708dc7ac@lunn.ch>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <aAaafd8LZ3Ks-AoT@shell.armlinux.org.uk>
 <a53b5f22-d603-4b7d-9765-a1fc8571614d@lunn.ch>
 <aAe2NFFrcXDice2Z@shell.armlinux.org.uk>
 <fdc02e46e4906ba92b562f8d2516901adc85659b.camel@ew.tq-group.com>
 <9b9fc5d0-e973-4f4f-8dd5-d3896bf29093@lunn.ch>
 <b75c6a2cf10e2acf878c38f8ca2ff46708a2c0a1.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b75c6a2cf10e2acf878c38f8ca2ff46708a2c0a1.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130828_101151_C4FB1748 
X-CRM114-Status: GOOD (  21.80  )
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

On Tue, Apr 29, 2025 at 09:24:49AM +0200, Matthias Schiffer wrote:
> On Mon, 2025-04-28 at 16:08 +0200, Andrew Lunn wrote:
> > 
> > > > However, with the yaml stuff, if that is basically becoming "DT
> > > > specification" then it needs to be clearly defined what each value
> > > > actually means for the system, and not this vague airy-fairy thing
> > > > we have now.
> > 
> >  
> > > I agree with Russell that it seems preferable to make it unambiguous whether
> > > delays are added on the MAC or PHY side, in particular for fine-tuning. If
> > > anything is left to the implementation, we should make the range of acceptable
> > > driver behavior very clear in the documentation.
> > 
> > I think we should try the "Informative" route first, see what the DT
> > Maintainers think when we describe in detail how Linux interprets
> > these values.
> 
> Oh, we should not be Linux-specific. We should describe in detail how *any OS*
> must interpret values.

There is two things here. One is related to delays on the PCB. Those
are OS agnostic and clearly you are describing hardware. But once you
get to implementing the delay in the MAC or the PHY, it is policy if
the PHY does it, or the MAC does it. Different OSes can have different
policy. We cannot force other OSes to do the same as Linux.
 
I drafted some text last night. I need to review it because i often
make typos, and then i will post it.

	Andrew

