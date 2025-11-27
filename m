Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29960D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUO1z9qwbt9OCCzyz5bCMm+KUuBCR4sEqoSJH822mh0=; b=zJ3SYrsRy5Ezusxk9FpzoChyGN
	pFx+v8Czi0DGSa1OU0ngiYDE6XF0lQSNulwxsU/9ekR6x42s/Y29eNAob4fPfiyTJV1IQG0wX8feb
	XJ0xzAxw283ESz9yX18zwzn5QbUTL1NMkZi6xs3zE+4kxxAe4FG3AWDeEhhHMMH+/5Gvzue5W2Umk
	jA+kaJJX1dhnqKcwzolCoCF5jNCdVolaFe2HfHD9guq+tF18QqS9Ltxr2nVlA1u+nyy9bObXuBRRQ
	+HHwQt3I+om0LQXuAPbUXjU4uf9H9SkBL2ImjUJHmBCsonWqnnqGebg70Sn6zBNlcHxTIgP6q8zxH
	0n/ZpM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYCv-0000000GHRf-10ub;
	Thu, 27 Nov 2025 09:22:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYCs-0000000GHQU-0PBu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DD987C16A17;
	Thu, 27 Nov 2025 09:22:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE8DB6068C;
	Thu, 27 Nov 2025 09:22:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20965102F260E;
	Thu, 27 Nov 2025 10:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764235344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LUO1z9qwbt9OCCzyz5bCMm+KUuBCR4sEqoSJH822mh0=;
	b=eqhjdvXZnUp9AmLT5/lJ7M6Z4Pq+LxgKF4WrneIblNx6/isXh+q272Pc5de5vlJP67QIod
	DFU8sAzqbvx7hYfQIAbxZVtXu5ur9wHEeKdpDjlOODOwNrqUFrd3NmrdHOyDFH08bQws28
	0oLC85B8sKuwjnU33G0LkCCYE42UpG3pbGxxAUin2woUQAZxEkAGHk0HQgTVF5nClGO32d
	16vRV1tKmrJLnQ1GKHdAQLyB0ZtTKbK6YgHVIn3JqX/QN3dtxuQjA8uddrokH/SyRy3IqM
	sauT/xOWlNe3hehmB09YO5g+IYyiYJ4hsc4uYwaNdNjVN4EZhQAykkYYebXKnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 10:22:18 +0100
Message-Id: <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
In-Reply-To: <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012230_332639_025ED41B 
X-CRM114-Status: GOOD (  13.70  )
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

Hi Th=C3=A9o,

thanks for reviewing this series!

On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
[...]
>> The problem was observed on a Radxa Rock Pi S board, which can only be
>> powered by the only USB-C connector. That connector is the only one usab=
le
>
> "which can only be powered by the only USB-C connector"
> double "only" makes it a super exclusive connector!

Hehe, indeed! :-)

>> The code already checks for !rport->suspended, so add a guard for VBUS a=
s
>> well to avoid a disconnection when a cable is connected.
>
> Your commit message was clear but I was missing one key point: what
> rport->suspended means. It isn't what I first thought. Instead it means
> phy is powered off. Naming is bad but unrelated to your series. Maybe
> add a comment to your commit message like the following?
>
>   The code already checks for !rport->suspended (PHY is powered on), ...

You are right. I have added a slightly longer text:

  The code already checks for !rport->suspended (which, somewhat
  counter-intuitively, means the PHY is powered on), ...

Still worth your Reviewed-by?

I fixed the other issues you have reported, for patch 2 as well.

I also added the Cc: stable@vger.kernel.org line, which I noticed being
missing.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

