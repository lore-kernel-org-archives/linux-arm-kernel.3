Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5419CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 06:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8g5pUjqXjI6+5JJnXG+Jl0sm/ZYbm+i72Gn1zQnsOo=; b=yLTHdfuUjBBoUdR4vGOEINgeCp
	WoWY73P2AtqlPaAH3OWt1WBiHwrErfXv0S0HY2c64IP7pnJ1b1vYvFGopJviUttn69DF7DNi2oKH6
	ff3hKIH0noyxDj85gnr4yxTNaH0ZmDnNVw/axJibj1MzZ8W+4KHE02HXjqSQs3vTi6o8nH9k/x8Kv
	Sk9S1kNUmkhtG32exngD8JwSDApMUxpkb5grwq+P1kNvx9azbRnWxwMj5/7nAx+VTsrVittQ1oOmS
	ASfJ0ym8/bI5vPlQQT7VppmWKyLzReM/1jpOEf+/RU7VMBTIWj8jKeUelTX1AZTjOg4/NUTLcUo1B
	u4grMksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF4p1-000000077O9-0OhT;
	Sat, 01 Nov 2025 06:10:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF4ow-000000077NN-42wC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 06:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8968B40BBC;
	Sat,  1 Nov 2025 06:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE9DC4CEF1;
	Sat,  1 Nov 2025 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761977434;
	bh=j+Yfr5cijQdjT2ruVKtXGnYQcWJxGCeRrDvfu1qPzdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dNU64AAzHqsFhm0VugFNVN5YzL5HHeuCzK8H1H/2yKASkNrk59jV6glQQT9H772P3
	 5P7sYd0dYCZNy2Crzpc7GjL0Ozv4XJk7Loh/9ZKT6mSTIn28XCkhDdi0nfiTlVKlMb
	 VEj3CKxcG0/8EfIQC9FHQMgYKvsDHmVqCdTUT6b8=
Date: Sat, 1 Nov 2025 07:10:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025110128-jailhouse-situated-22b1@gregkh>
References: <20251017233459.2409975-1-royluo@google.com>
 <20251017233459.2409975-3-royluo@google.com>
 <20251030011659.bmgdry3wwf4kgjwv@synopsys.com>
 <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zupgxPYXCqew1548uwGx7=9u0b5oCwaXfP7F=FmqMR7a5bDw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_231039_439447_0CF63AB6 
X-CRM114-Status: GOOD (  11.81  )
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

On Fri, Oct 31, 2025 at 05:49:28PM -0700, Roy Luo wrote:
> > > +         dr_role != DWC3_GCTL_PRTCAP_HOST) {
> > > +             dev_warn(google->dev, "spurious pme irq %d, hibernation %d, dr_role %u\n",
> > > +                      irq, google->is_hibernation, dr_role);
> >
> > Should we limit this print and do we need this to be dev_warn? It may be
> > noisy wouldn't it.
> 
> Ack, will make it WARN_ONCE in the next version.

So you really want to panic your system if this happens (remember, the
HUGE majority of Linux systems run with panic-on-warn enabled)?

Please do not, handle the issue, dump a message to the log if you really
need to, and move on, don't crash.

thanks,

greg k-h

