Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AD3E63F36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bT2fiqRkjI9axK4fJtClgUV/TJc6YLz7YhqPHByH0kk=; b=bjNe7do3Zdiq/PXi5AlHqLw/34
	BSYVisI2QpQnEcLamxVs68930uzvSRc6dgFnDqmoRXlvsvSZDElEn6o8IR/eEcO8DWnSI/ZoJ9Zv1
	pPMbNd3iTdhhVRnvguJKAAVOu0z4rieGGLcUySBgYt8/TwzZ9JiDy6dCkKPxOABB6DnBTXcr8ZvGj
	aYGWG2L8R03ykgbNTKtLLcwO26W0XgCnvTj5gfXdz/dE9a2Ir0Y3O7TQ2MTFGXlr3CeZC02/QAMez
	aDRnJ8HtSERRm+nozuLPnqZX89ghZNQXzQ7aDiYRjn1CF4SV6bCkN/w5ul3KpKKYJWkOKfkkRbb0U
	1Wwp920Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2Hl-000000075h8-0Cyb;
	Mon, 16 Feb 2026 17:21:25 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs2Hh-000000075g9-3D6p;
	Mon, 16 Feb 2026 17:21:23 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1771262476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bT2fiqRkjI9axK4fJtClgUV/TJc6YLz7YhqPHByH0kk=;
	b=cjOgiwYl2zixY+bjimSYCRXIK8VH45q1zpZ1bCPWBn6AL3obFgYyxLF/iACRf63TTAktFJ
	AEPwW/vgIDKy/zZwcOJ8dAr9pFBaV7VzA5IMFMD02K3WfN2dAHj8VDBdyzAVYBwdwFv896
	xbeNmH0OqheYp6HHoLu25WAtADiCWSZOj/ajeIZyJt4H85EYm1UzPuGfk6pe+Bl+TcSk/t
	h1JmbrHDLXfjIeoKWwFmhoJmcf/yF7TtQCAdk4+u5+joiz80eZ1Qnm2FmwfVcVHRpPALy6
	R06ZFyGXSo09DlUZpFifiVeEfgTcum63vNhsQldwCRxfARIGMEDAncFyEq5m8Q==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 18:21:13 +0100
Message-Id: <DGGK56T574F0.TJSLQL9P1SM@cknow-tech.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, "Andrew Lunn"
 <andrew@lunn.ch>
Cc: "Yao Zi" <me@ziyao.cc>, "Heiko Stuebner" <heiko@sntech.de>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <netdev@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: Problematic understanding of phy-mode in Rockchip DWMAC driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
References: <aY9s5PXP4zZ7R6fa@pie> <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
 <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
 <aZDGsJNLZIty0242@shell.armlinux.org.uk>
 <a4aebacc-c273-4e42-97ff-0cdd88d771dd@lunn.ch>
 <aZMxKdkl2Qa7e1WU@shell.armlinux.org.uk>
In-Reply-To: <aZMxKdkl2Qa7e1WU@shell.armlinux.org.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_092122_440711_5173E430 
X-CRM114-Status: GOOD (  12.45  )
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

On Mon Feb 16, 2026 at 4:00 PM CET, Russell King (Oracle) wrote:
> On Mon, Feb 16, 2026 at 02:57:48AM +0100, Andrew Lunn wrote:
>> On Sat, Feb 14, 2026 at 07:02:08PM +0000, Russell King (Oracle) wrote:
>> > On Sat, Feb 14, 2026 at 05:50:15PM +0100, Andrew Lunn wrote:
>> > > Rockchip have recently started adding support for a new version, and
>> > > appear to of listened to what we have been saying. So it could be th=
e
>> > > next generation of chips get this correct.
>> >=20
>> > Have you seen any proposed code from Rockchip for their new scheme?
>>=20
>> There was a patch, including a rather odd formulae to convert register
>> value to delay. I gave some feedback, but it has been silence
>> afterwards.
>
> Searching lore's netdev archive doesn't seem to bring anything up.

https://patch.msgid.link/b25d6eb2-e105-4060-86fa-c1a06396ca92@lunn.ch/

