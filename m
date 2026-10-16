Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B84CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W68fWyUt0RqgzohdtV/Be5eCqN0axXdNamgwFcm1kWg=; b=eaI/oMY2iO1zgugtahy1saoR8g
	CD50iDRkCHtI+asnR2xavarfEUTmONjaHFCgqWGi3926uh0w+fe9svisRx8oZSY5p2reA8Y1KqYsu
	gRDA3zGjmB7ownEo/HTyQTZxsc1h9M17OB1/lTmxJtn34BJrSeoMGaSfY4EOPDHKM4HA5CKR2AbYk
	p77mkQW/5EeC6zLWeSEgsbHgrQDZ+XDQ/ZcsYlw1FvUYIGm4mCwvqPgL3Rgzc0v3O0Pz4w33IKRJS
	vfFN0qvZSReRZdYqf3sMMkny9hUZhT0jPt7kdRbA1zdct5kX5RVeWx1QCNMagV00KRy+KOW/V/oUB
	wJIBJeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhoV-000000031VZ-2ycV;
	Fri, 16 Oct 2026 13:17:35 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhoS-000000031V7-49uZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:17:34 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4EB131400098
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:17:31 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 16 Oct 2026 09:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792156648;
	 x=1792243048; bh=W68fWyUt0RqgzohdtV/Be5eCqN0axXdNamgwFcm1kWg=; b=
	Zl/DdgPPJEHSBxcFPz4ZC06k6gpE4Gcuq/B5qE+9f+8l076MhCKuRRJwgMkf1QMI
	Z0yy1TfzIHZmvRxQ1zuuyqowLV7GkLDQlgSbx1MLiz21V7UlnbIQ4whj8oO3lhN/
	YkXdkrNw82didVE8loVmbS2GC6R49YuE84fdrYdGzEtUgpYqT1PkiA0x8pJUq0aP
	kMxdAaSc++E2QSPIdTaUajnAc/fSK3vTBCywJWisDIiQsK0S541/0foYCgYxqU6K
	XA+cM0/9Xj5FXPPS/+hkaFtEHtRArh/Ga0SQ8hEy9L6A8JUxFcBBLV3Nyeqj3BEW
	g5+WthFjmdk8B4rV01Smvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792156648; x=
	1792243048; bh=W68fWyUt0RqgzohdtV/Be5eCqN0axXdNamgwFcm1kWg=; b=c
	cvG3SZpHtQxs4NT5HMWUR31SOzXLYX86IAo8Y9R6fgMQQ8IpLrQTUqttPjqMV4Hu
	AYTo8ifTMO5F6B2UUkp7UOKAteJaou9CdfYA3+8a7FRXdecM4SIg+cNgt0PuDTQh
	Q7/IlxxTm5bYJXPoplSinKJWxf/3dyCq3tzlk7Vcp0IQrTwBukQfJK8pK6VHW4vn
	eZj4mMeaa7KSwihWipBRT4fxwRuNHLEGhJA/GgGVBqQFI1kRtC2+jXImgnlMfIoN
	zJoMYiMfDWdErEjB74eCfsD98G4tgFkywMOiHOWYDaRLZRj6HxMpzTId1zTiqo6/
	MdZDPCB6e2H4+DSkajp9A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792156648; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Yvoah0Ln53O2+drGNQMjphCf95UtUDNIPZskNj1BC0lrXah
	uAYhQoedfMJ+EIa7jponL2jX6BUtlAsBIRCNiaaq9zPiWK9NJVxuuyGbq31nIUwc
	GWPgGErzJs03ZUO2Zh7GGhGySmxDPHwbz1hGMje4hDRlnBzdafaimrinjgp1cWYS
	3taHqDJOnvhp4iYM7sCJb6oQMdUC97vt6Caf0DMxsSI5sRXN5TAFKgo0XcGjzZac
	kP7469Ml276HNqN+1HQIYHqRAPWOXyToLGs7UpH+PY+cooT0cmBoA4jJVpOsYRmH
	4QC/tyQR3u8HXM2ugozNBK55rTnm8+L7O3PWjiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GJg7u/ORzO4WgLlQXUweuEi2kkGgedegRGXMGcZssAg=:972BnS86W6QOavz34L61+TBk0DmhvqVC2zFod9PkusY=;
X-ME-Sender: <xms:4yPSauoiu4jENIqFZ-abIR6-tkOQWHHD1gvMLv5Q7R-7eYzFjBPYvA>
    <xme:4yPSanftUlBSEMlSLvifhnBOpdJelZ8fi6pj_-eDnRpmPNWtlys3K9_K-d6MlX6mV
    c8b950iS2QzGNjS_MPhc8oZ7YAhAj4ILgGA7271oemlC0JvUx0bWLo3>
X-ME-Proxy-Cause: dmFkZTGPmXvGMY0yIONbWQUWjnk+A+PreQlAAykNq5ZIAcOQxkwSM5UmMl3pv0nTtKClj+
    Emxqw5/hrqYNd+5+UzkdOL3q7KEKQHioxgqCo4dN4+0WuCrUNvZvzn1sMTXw1pJ7cMiQ5t
    02gUayOCdQM+CjoVj1UUWaMI6GrUK/qt5YD7pcTjLCL65ieF3MitObr5YkcTPmamJlIfyf
    0Sn7+OLVegmgwivxqtTiJoRD3euOb5q48xVrUIOSmaB+q13akV2DpPLKv0JdJdueToanMq
    MRXQxBVezouhVc/OR/Q6JgbfhPUSm3/9tmrt1oFtQo9J74ztHCT4yS1Jd72v6fY8FsN3DJ
    AfMKWEzwORYKI5ZvJxRldZ/F6zjEiF87SBOcljLZ6tv3f/UVAWlBUJbwOQ3+SBGa/9oQhX
    VZLz/CLJgh5EFqyjK61lOB1VyVEF7mG0XLrGXKvkZ+4C3Eak/MZj8ajky6Q2aAfZTBapO1
    f3zI7gvv5VsHd66WFuMbTZvAvavI4y0PK5ajgkOzxIDGg/Y2rghER3zqLsO8HHdr4ZmGGr
    iroT9I53X1aQn8U14NPpSZqwKY1Yr1BB2J2nxlPcvLsO2HOEy2J97xUiGYSN8u0DCypfnn
    4apYg8VoEnV+ou9tOE6G7UTD1FCZRxCf0vkYQ6n+Np4sOe7LDiRu9Vsufp6g
X-ME-Proxy: <xmx:5SPSau1TAi1iCv3D22MRhB1fFr79mAcrte93UnkbdkXq3X0eW1W0kA>
    <xmx:5SPSavUvWYhNO57jV0FKTRztemXAqG3Om2yGjE5uP5Wu28mhEh8gog>
    <xmx:5SPSagPNOdJV4DCMVqqqKmKxVKUzBDwE44OqwqFvSVUL8Grlpp2IqA>
    <xmx:5SPSai3PdQDthJO1rR213LIHaje5f_6yvKraBlQkjyze4cfwL8aYFg>
    <xmx:6CPSaltb81-tFSENaVCMTFkfkMCKpS7-Iybc8SFjMcUL6moLhn_OyUEI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 85D0332A008F; Fri, 16 Oct 2026 09:17:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0hUf3a_Z_uw
Date: Fri, 16 Oct 2026 15:14:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-Id: <033a1d9f-f8cd-4097-a8f6-da01494eff34@app.fastmail.com>
In-Reply-To: <20261016130328.1037616-2-arnd@kernel.org>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <20261016130328.1037616-2-arnd@kernel.org>
Subject: Re: [PATCH 2/2] [v2] serial: 8250: remove obsolete and broken PORT_RSA support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_061733_486373_CB4584E9 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 16, 2026, at 14:59, Arnd Bergmann wrote:
> Link: 
> http://translate.google.com/translate?hl=en&sl=ja&u=http://www.iodata.jp/products/network/rsadv2s.htm
> Link: 
> https://lore.kernel.org/all/1309211120-2803-6-git-send-email-arnd@arndb.de/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: rebased my own patch after 15 years
> ---
>  drivers/tty/serial/8250/8250.h          |  17 --
>  drivers/tty/serial/8250/8250_core.c     |   6 -
>  drivers/tty/serial/8250/8250_platform.c |   4 -
>  drivers/tty/serial/8250/8250_port.c     |   8 -
>  drivers/tty/serial/8250/8250_rsa.c      | 209 ------------------------
>  drivers/tty/serial/8250/Kconfig         |  11 --
>  include/uapi/linux/serial_reg.h         |  51 ------

I had this one in my testing tree for several years but it
looks like I lost the necessary Makefile change, and
the corresponding change to drivers/tty/serial/sunsu.c.

    Arnd

