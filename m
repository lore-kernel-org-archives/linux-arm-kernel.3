Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC735C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1mCSdap8EpKqZ+b8GT203WeV+0ASGDGtnDxfJT8fAs=; b=RgDwQLnufZ/X/WTAroGAexyooM
	R3pYfj+RHz6x29bq077lFG8aoqvnkw89DrSm3oaTdm1Fvb/nAQs1rI/9XZAZ3bR+/S7bIU6TszfjS
	ABled2HRRxN5pCibOlB54Oc8AVHrWaREA9hRg5ZgAFL5lK5cHVnooQ8+mShzwKAo08RZGsncqReMM
	KUv9P36T6ciYthIESJH2BsDbKurHlTWIRlRWUiFZeatFn20daYnyo2cBIHSa59o0MBoh5Kfwpat8D
	L1lfczbKJQINzxuqqVLo33nm0JAG2FCs9Zmv4byzgVzkyVa0FrpOVNBLSO7ORgmPEgJEvKgUeG3Ms
	7SzxCSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2od3-000000041bv-0r1A;
	Sat, 05 Sep 2026 11:32:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2od1-000000041bl-1SW8;
	Sat, 05 Sep 2026 11:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E55460209;
	Sat,  5 Sep 2026 11:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383661F00A3D;
	Sat,  5 Sep 2026 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788607930;
	bh=u1mCSdap8EpKqZ+b8GT203WeV+0ASGDGtnDxfJT8fAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EI1FmdZQETscHvLCnLj3TD8ezP5sTSS0FaYeDegsBiKQEd93ERGxLuzIFoAqmkAxT
	 QVFYqZmzF2NfEN8L+y6m6ckPbreoexmSsO+1HDG8wxwIg/TcuKsYKqP/Sk0Yko1VnO
	 caGI/HV1rlAf59FK6aT+GM6UYEhyQC82iyil5fTI=
Date: Sat, 5 Sep 2026 13:30:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <2026090516-nutshell-handiness-37f9@gregkh>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
 <2026090430-botanist-ungodly-0299@gregkh>
 <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
 <2026090433-chair-tidings-5c99@gregkh>
 <apvQlBEgHOW9MCxN@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apvQlBEgHOW9MCxN@ashevche-desk.local>
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

On Sat, Sep 05, 2026 at 11:19:32AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 04, 2026 at 07:52:37PM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Sep 05, 2026 at 01:24:20AM +0800, Chen-Yu Tsai wrote:
> > > On Sat, Sep 5, 2026 at 12:47 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> > > > > |struct usb_port| and its matching container_of() macro should live in
> > > > > its own port.h, matching the split we have for .c files.
> > > >
> > > > Why?
> > > 
> > > This was requested by Andy. And to me it sort of made sense.
> > > 
> > > > > Move them as described. Also move usb_port_is_power_on(), since in the
> > > > > next change its |struct usb_hub *| parameter will be changed to
> > > > > |struct usb_port *|, and becomes a non-static function that only
> > > > > references |struct usb_port|.
> > > >
> > > > No, please don't do that unless you have a really good reason.
> > > 
> > > Which part? Move the code?
> > 
> > Please don't make a new .h file.
> > 
> > Moving the function might make sense on its own if you need it in a
> > different file later on, but do a move only, and then change things if
> > you really need to do that.
> 
> Isn't this file to break possible circular dependencies?

If so, that was not stated here at all...

