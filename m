Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66788C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=; b=xSYSj4RApOKe/8g6z/dW78xc8g
	xQYQ+yRRWG32tMGJgL47jYnmjfLrePeYk0YJPOfpbb6vb1lCmpbQvNc9zUFA0YDMcJkCxL2REV1Mu
	pEKO0DBl87YBvjlH1r4mo3sFv2Qku+rZGa5PA3IdMXAmLyNbOMzISzQI9AV0rXWja7fzDlcp5v9p7
	wkTVAveZitYGCnhE+umoyjNaEg5jFDsHX0iu8tCWuDoOVljmd7i/6yqonMCw94poZknJobqTgNVoL
	5jTJ92s83/LAMtNOxYNIJTuR9eRZ/ihb13r7DtGkE0wzpRXAdxVo1jrNHgxxnxo7QKDIXbZUY8Yyk
	/K7TZdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWqr-00000004WrO-0mH6;
	Tue, 01 Jul 2025 09:00:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWmP-00000004VmU-0mvE;
	Tue, 01 Jul 2025 08:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=; b=X0UUIG4fDb2GEjtHCX0cX2/hLk
	PVjO61C3AI3SGUeHCX82ob+d2Qiq9459pcn/sJquSBV6HZ0Llk/pLcBo2HZFHA8XJhF/79mXLZBPl
	TLes6HGlAVANhcvbTgrcMTkQSvMducGqr2wL3nPbMXUrGGDP6bZSzkDGbPi6D8TTDKBB+kJL+zY97
	LRge/o1PiSZ/hjbZxdK4VnuTCLFRBZ1rdLZDmXYZ6oKda3ZzPGFI6vHnum2x7wI0n8T6T/v4EOiTr
	cPq5ZiIacrFeZAOE3mlqoLIRCNDGHQPMuSWzoBlpAqcNE2iyqKm7VBYmhdwFD6AaZE7X0p4PbzCvh
	z/6viRFw==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWmL-000000070Wt-2WUH;
	Tue, 01 Jul 2025 08:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751360128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXVLzTc0MYcUhCmNc0zoT8nYZniOsIwfRSdBoWAfmk8a3Ib7qya7A78A7WGWbO3ipKncfG9dW5CEW158AUEqcbE2qsA9COJ0UwsALbsbWmjN5K/hJwvRaZwAe9RHqOUmBm/M2TZvKyNdxNF8BA9YFBMxXyWxcYJR8pgaIzTuR5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751360128; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=; 
	b=gQw3TB5guJkE4ZVQQGU1sFnYxUQzpsv//xEYk08I//G0VWcODeMs+5dBnIC42r4LcrygQA8jvPNGvqMVSA79gw+Qw3Q8pQVaTbbasRLaKkoHEXsFZDSHMnUpeMa4Q1le++i5RAp3JaOq5Uxr3VXChZTz86XfUaFBLmLNQ4GrIM4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751360128;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=;
	b=JZ2VrbNaTm3OpMX0YVnCl55PmHvPYXyQnlT1ukmO0ND2/Ypap1INngGBZHGOIy+Z
	Y7Yqzpa2LmBdNATgtWoIQ6LdDI3X9HPN3BmCRqLdW/SHABuJ0QJ81S+TfdVGdNsit4H
	eJUEAJ0TIOr4/zbT5ChIQNTsWrhaHaEEdecBdfSY=
Received: by mx.zohomail.com with SMTPS id 1751360126517482.5342375792277;
	Tue, 1 Jul 2025 01:55:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
Date: Tue, 01 Jul 2025 10:55:21 +0200
Message-ID: <5039013.31r3eYUQgx@workhorse>
In-Reply-To: <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
 <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095550_095694_DC0238E3 
X-CRM114-Status: GOOD (  25.11  )
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

Hello,

On Tuesday, 1 July 2025 10:19:33 Central European Summer Time Diederik de Haas wrote:
> Hi,
> 
> On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
> > On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
> >> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
> >> > The ROCK 4D's actual DC input is 5V, and the schematic names it as being
> >> > 5V as well.
> >> >
> >> > Rename the regulator, and change the voltage it claims to be at.
> >> 
> >> Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
> >> sounds problematic ;-)
> >
> > This is basically "just" documentation, as the DT just describes
> > a fixed regulator (i.e. nothing software controllable). This just
> > changes a number in sysfs :)
> >
> > Note, that the 5V DCIN is a USB-C port, which does not do any PD
> > negotiation, but has the 5K1 resistors on the CC lines to "request"
> > 5V. If for whatever reason a higher voltage is applied (which does
> > not happen as long as the power is provided by anything remotely
> > following the USB specifications) there also is an over-voltage
> > protection chip. So it's not problematic :)
> 
> I was worried about and wondered why I/we did NOT receive reports about
> boards being fried. Good to know, thanks!
> 
> > OTOH adding a Fixes tag does not hurt ;)
> 
> Cheers,
>   Diederik
> 

to add to what Sebastian already said: I purposefully didn't include the
Fixes: tag because there is no functional change here. I don't think
cosmetic fixes are worth pulling into stable kernels unless they're a
dependency of a follow-up functional fix patch, which isn't the case
right now. If such a functional fix patch does emerge, it can explicitly
declare its dependence on this patch, or even have our robot overlords
figure it out itself.

In that sense, I do think a Fixes tag hurts, because it needlessly
adds to the patch queue of the stable kernel people, and it's worth
pointing out that while I claim this patch has no functional change,
that's always predicated on the understanding that it does not
unintentionally break anything. In this case the chance is essentially
zero though, but I won't bother re-rolling this for that tag alone.

Regards,
Nicolas Frattaroli



