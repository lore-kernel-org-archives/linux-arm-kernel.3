Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB61C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rP0jvIe50D9VMNBI5Koq/QnFNW7rOKsTaV7j4xp9Y8U=; b=EM4SP9rcS2MQxKyFgmimpqnczy
	2E3/4OomtqrO2lHlE8nKUOpiOgeA1eMhiR1X6xrSbFeAM7qskJmdEdfaprV7AjQNO8rwmy9YPnynd
	QVkuXs6JMbfPvYeGr1fx8Kc0YpCe7JdTo8kQkLCR5oRrhO6OxiSvl5vFM82aNPGikLQbQ+8o8Er8b
	4LOzmElblf9i20APVPMVmtRBkK8UgcTT1gKUlIAoMqsKUC7v4Wxkmuqc57iqeoolCdIN1Iaq781cf
	p79shAJxilFsPt7UxX1od7yMY65noMZAf0RwQUnYUKocqf9BIzLhv8dwmua+nuf4csPQckcVpeJAS
	Aqm6tWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YBH-00000002xNX-3F7W;
	Fri, 04 Sep 2026 17:58:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2YBG-00000002xNC-1Lkc;
	Fri, 04 Sep 2026 17:58:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF5E416A2;
	Fri,  4 Sep 2026 17:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49421F00A3D;
	Fri,  4 Sep 2026 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788544705;
	bh=rP0jvIe50D9VMNBI5Koq/QnFNW7rOKsTaV7j4xp9Y8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vVcWPcqG1059ybsmrz21hgN6wQuwVgT6uzFHmLEnROtsmnN/CAYwVKSDtG9lGAiEU
	 tkd1yZrHUaZHJ3eumLByHfJe9TNCknpujWUJKGpAWuMus+fTvh1G7TZqTS6TzxZoq+
	 MFxyhH9d1b8/dxyRr8Dhs80vd4pcoiD8qcdKqe90=
Date: Fri, 4 Sep 2026 19:52:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Message-ID: <2026090433-chair-tidings-5c99@gregkh>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
 <2026090430-botanist-ungodly-0299@gregkh>
 <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65MSxL+r+wqMjPKVSh9aS1gkn8og6oBinSXDdipnoOyCQ@mail.gmail.com>
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

On Sat, Sep 05, 2026 at 01:24:20AM +0800, Chen-Yu Tsai wrote:
> On Sat, Sep 5, 2026 at 12:47 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> > > |struct usb_port| and its matching container_of() macro should live in
> > > its own port.h, matching the split we have for .c files.
> >
> > Why?
> 
> This was requested by Andy. And to me it sort of made sense.
> 
> > > Move them as described. Also move usb_port_is_power_on(), since in the
> > > next change its |struct usb_hub *| parameter will be changed to
> > > |struct usb_port *|, and becomes a non-static function that only
> > > references |struct usb_port|.
> >
> > No, please don't do that unless you have a really good reason.
> 
> Which part? Move the code?

Please don't make a new .h file.

Moving the function might make sense on its own if you need it in a
different file later on, but do a move only, and then change things if
you really need to do that.

thanks,

greg k-h

