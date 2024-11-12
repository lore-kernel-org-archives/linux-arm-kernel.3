Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1227D42B8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx6WlsK2fZMPFhtORJjI3/ozgfAC2dAHqSCd0My8CXQ=; b=tNPm88USR3a4SJv10nDu1cz6xk
	bBHIz949W/26cfhUAjKKhrGdlHCZWYrGF2mrKfk2/V4zV3agcZ/WEOUCc8CptgVzsagxYyY78yamt
	WyB9Kh4Te9pZ/LaaQWCYVncZqzHl+96f9Yt6X/ZG6Ua8afkVrGZ3+AVi4HDbBxCjztCZbiA/2RC8p
	4VCLo6e6J6s+TSXCwmEfCQaGzoB8bdBmiZLXILhZhsR7I7Q8skDIouU921zrUbAvI3BaItN00i07/
	XjDKLAJn0pi0UmXDS6NdxegLzeyu3vN522fWg3JbdNfsosfaeAt9Tbtrxrrx0SdAGsJZLLqaRBvjm
	7lZrObcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsAk-00000003oVm-46vx;
	Tue, 12 Nov 2024 14:47:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs1U-00000003mNB-2kJh;
	Tue, 12 Nov 2024 14:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EB31A41C62;
	Tue, 12 Nov 2024 14:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614C8C4CED6;
	Tue, 12 Nov 2024 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422259;
	bh=yW75lJPp4kqCgCVPMkIbHw2p/49v6BgJKGW8dcF7ODw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g10uLWKnMoNs8UBqNHWcGrgdFo2m2PeXfTpO5UC9XQTIoFUcEsj3IY5u3+5ybgzCp
	 GwHzpvY8kxER14I30jltzkbfM01s2SLLvSrUoc9ZCd81AKxJJnXSmBsnD0D5lJwwYZ
	 4ynd1xeQEFia4kPiBk92ofykCyf7yp3dsojpsHWkEdIoFEbNCjGUJ/n2IKjkflaHPq
	 8V+c3lMxepIlwBUy1XOERaOsQSwogtCCJNZGs7mXLIbzmpGbS3qUEEgKVrCF1b4S4z
	 9rAnGcwHL6gUWUkKPNh67Tkg42dJENV5bwX7Y1I/T5STRR7Qe0qREvnIBoBc0vO2Qb
	 FTnqEQxf40XFA==
Date: Tue, 12 Nov 2024 14:37:32 +0000
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
Message-ID: <20241112143732.GG8552@google.com>
References: <20241107114712.538976-1-heiko@sntech.de>
 <20241107114712.538976-2-heiko@sntech.de>
 <nycvar.YFH.7.76.2411071358210.20286@cbobk.fhfr.pm>
 <4934964.GXAFRqVoOG@diego>
 <nycvar.YFH.7.76.2411071534110.20286@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2411071534110.20286@cbobk.fhfr.pm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063740_777135_F5CEC20F 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, 07 Nov 2024, Jiri Kosina wrote:

> On Thu, 7 Nov 2024, Heiko Stübner wrote:
> 
> > This change was more or less a surprise find, because I wanted to make
> > the platform_data pointer in the mfd_cell struct const and this the hid
> > sensor hub stood out as doing something strange ;-) .
> > 
> > So patch 2 of this series actually depends on this change to not cause
> > build errors.
> 
> Ah, right.
> 
> > But seeing that we're after -rc6 alredy, I would assume the brunt of the 
> > mcu series might need to wait after 6.13-rc1 anyway - but I guess that 
> > depends on how Lee sees things ;-) .
> 
> OK, I am keeping my hands off it for the time being.

I can take it now with an Ack.

-- 
Lee Jones [李琼斯]

