Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D419EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlN6IyiJ/OgnXKmxIrpCcmQHjlG8YYnBfZ1dOEx+GcM=; b=CaGZTbQhU6WPQMna7nbyO2vA7g
	hbHyNvtN/hxdMBvvkZBIGKuKNrVuiDbLfV2EKs8+tFicNsLb8P1tORePNmZzaDdNxG5GIpTcSEtQ3
	wAPPaaDyZ1iNiozsJPzQcX98WGW2uingV2sN3PIPFbgEJwxQ6RIAM+IEjqVJWKceJoVVIhCaQv4o9
	EGVUdT9co7S+62UY1whxI4jXmRGHERcHhUFAoNVDZADGI5iQeiRmACQvaDpgZoKT7rs5U+61CczFf
	dc3Zs58FR+9inU/usnS1dM9jo8MqGba+xgEYGnZpbByf7pZ1zNufXH/nTtPESgKBJk/HE3xQAhVt6
	l8x6TQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLfm-0000000Enln-3Q0C;
	Wed, 11 Dec 2024 12:18:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLei-0000000EnfB-3XJT;
	Wed, 11 Dec 2024 12:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E7D25C48EC;
	Wed, 11 Dec 2024 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62825C4CED2;
	Wed, 11 Dec 2024 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919447;
	bh=pxxMBZqrH7x/gS7Fl8JT4cHNQ825NZlShGPRQdbliHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exmfa/dWUJQdqssDCvd4IXqfV2xh+VVg8htJAWrMhISPUmite/i8jN5/G6n+em1sg
	 iNzEivin+e1cVizPcwrdU0vePxvbltw5ADNWnE+ZJJqiyuj/fNq6l2P3tp9W3r4GG0
	 9E4NrB6iS5o44mDf1axfIcBfOfKT/0/iMCEqsZISd/jIJVpAGZkpqltWwuT4QtyWQh
	 tXLYnQHY4+ycSHLV4p31MClhab0cdtMhVhn8apJZ/OnUq3L/yLd6LQmW6kf+zw2cL+
	 35YrQMExjH6A385RY7HICJPPAy8GuYl2JHSiu0O018XzxC+mUvnNXWFyLYQ8BQKBoh
	 S3udlbhc36vEA==
Date: Wed, 11 Dec 2024 12:17:18 +0000
From: Lee Jones <lee@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, jic23@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, pavel@ucw.cz, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v9 1/9] HID: hid-sensor-hub: don't use stale
 platform-data on remove
Message-ID: <20241211120844.GD7139@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
 <20241107114712.538976-2-heiko@sntech.de>
 <nycvar.YFH.7.76.2411071358210.20286@cbobk.fhfr.pm>
 <4934964.GXAFRqVoOG@diego>
 <nycvar.YFH.7.76.2411071534110.20286@cbobk.fhfr.pm>
 <20241112143732.GG8552@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112143732.GG8552@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_041728_922913_E861ED1F 
X-CRM114-Status: GOOD (  14.38  )
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

On Tue, 12 Nov 2024, Lee Jones wrote:

> On Thu, 07 Nov 2024, Jiri Kosina wrote:
> 
> > On Thu, 7 Nov 2024, Heiko Stübner wrote:
> > 
> > > This change was more or less a surprise find, because I wanted to make
> > > the platform_data pointer in the mfd_cell struct const and this the hid
> > > sensor hub stood out as doing something strange ;-) .
> > > 
> > > So patch 2 of this series actually depends on this change to not cause
> > > build errors.
> > 
> > Ah, right.
> > 
> > > But seeing that we're after -rc6 alredy, I would assume the brunt of the 
> > > mcu series might need to wait after 6.13-rc1 anyway - but I guess that 
> > > depends on how Lee sees things ;-) .
> > 
> > OK, I am keeping my hands off it for the time being.
> 
> I can take it now with an Ack.

Looking to apply this set now.

Ack please.

-- 
Lee Jones [李琼斯]

