Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658B0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xebSVH9btvoOA5wd7jjkFogUQ3KfJvU2qpvSEydg5Yc=; b=5Bid+5Gpl97D9FlONHn30bs8LX
	KoqGDlB/FC+T7kVwhg5Wj0YQqcHVq/XGQdCC0X1msqm5fQgaSGumJiQdVjLc1Jz228s9nkm0uCTkq
	LiES+Un18AA9v3Z9IsWcOB/W3tQ936hVnRY+sK3XjDyxIOodVaM3ASxJ0fABIS3l5pmlOE4GhFwox
	SHy9sR0nA0BKAquKeYR+VbV/Sn77v7f1mgxCdDdppc5ysFm+FNcIDSXgsK5JCZHvSYfV0V39Il2k1
	ZC9Pox42S5j/pqABIHgPh8/KbenkCcIsUqfPYkEAufw3OGJEeXd3iqc9AKQULMNEiRnc65n+uf4Qi
	IevRbpWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLiM-00000005CN6-3mtg;
	Thu, 02 Jul 2026 18:00:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLiK-00000005CLt-2HWC;
	Thu, 02 Jul 2026 18:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xebSVH9btvoOA5wd7jjkFogUQ3KfJvU2qpvSEydg5Yc=; b=Eskz2zrsAbkrle95IzFL6WFPYp
	vzn1wrAtXWwesXNsY8DQ6r1kiiuT9A9+DV5hhILJE/ps4aaDJ1Gi8+h6lU54Qr0wxF50SUu3ar2R4
	dIKbvO1KKyEoyJvW7xVkbL+GZnKjEewoBjNGrWgvVKLEjKxQq10zMdcZC02VOjJgIIPlZIb1N8Hiu
	JzXUv1WAgEfK6+Xf8Cbeceqzcxfkk03qW43BZ5Qmx15pzN5Q9LO0B6/awajLOwQoCONl9bsdrNS5e
	jOJ/VamA0aB47VHoHD566MtaJ3gdB6MrwoSTmgUl8X5o7VYBZWgWzxwsFHNZxGd6AIlrfGUqsgaDW
	B+rHYTrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 0/2] rockchip: Fix devices suspend freeze on RK3568/RK3566
Date: Thu, 02 Jul 2026 20:00:32 +0200
Message-ID: <9647226.A5hrfCrGMc@phil>
In-Reply-To: <20260624192726.781864-1-jonas@kwiboo.se>
References: <20260624192726.781864-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_110040_586307_4856B747 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Jonas,

Am Mittwoch, 24. Juni 2026, 21:27:23 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Jonas Karlman:
> This series fixes a system freeze during suspend in ohci_suspend() due
> to clk_usbphy1_480m not being enabled when EHCI/OHCI registers are
> accessed on e.g. a Raxa ROCK 3C board.
>=20
> Following pm_test modes work on my ROCK 3C with the missing usbphy clk
> refs added:
>=20
>   echo N > /sys/module/printk/parameters/console_suspend
>=20
>   echo devices > /sys/power/pm_test
>   echo platform > /sys/power/pm_test
>   echo processors > /sys/power/pm_test
>   echo core > /sys/power/pm_test
>=20
>   echo mem > /sys/power/state
>=20
> Changes in v2:
> - Include rockchip,rk3588-ehci in the EHCI constraint
> - Make clocks prop required for EHCI and OHCI
> - Collect t-b tag
>=20
> Jonas Karlman (2):
>   dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI

it seems I wasn't in Cc for the first patch, so can't know if and when
that gets/got applied.

Also I think I remember Greg preferring not having to split apart patch
series', so I think the binding patch might be better off standing alone.


Heiko




