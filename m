Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA86CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=; b=uJfvd8SmipOuOleIOM2SJCiVlU
	f3A7WrAD1xzJ9AvOQb5Ftf4cbL5dEu69v+2D6+/kS+KQeLbe2ySi27dN7LL1/SAdncinHE5Q50UXr
	7VOCsIqlqqO7dFMZ36xT1p6vd2kSzgbxGuZ8J4nC5TxwIcqJaO6pkpz8yvt05vjFLF+UuSop7ZxEf
	+DEX3g4Dv82pFk79laik240QP3hwah+xkbhgqZUOHCAN4OxpQmghFV4dLFADtNjkRXXds/wMvbtcF
	BRuy/OE32hngi69Oo4bUzD8pqpjz40VmhKuTZzn3quM6ONzJjM8EZqE5iBAPvbNi1gj+MbtYNkPIz
	sZKjUkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQhN-0000000HVnV-1KsM;
	Tue, 02 Sep 2025 13:05:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP6r-0000000Gu4o-0mrm;
	Tue, 02 Sep 2025 11:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756812213; x=1788348213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=;
  b=hiElTAQwOHcfYbfktIyM8BWMdQrxwvGfRS4axH5QF6286ldUzCoej00V
   EkHQqstHZa6aDPuIm/EVrHF8QJbMlGx61mLNitCU6XtDiKdXquauLAYXR
   PDKrQ9AnN/zgr3ttRwgnfXp/O7i55ayTX/cs7nDfHE8z5bvmcOCskEHuL
   F1xiGTf92kMg8hg2R2fbLj56szzy322OsgyC1x+Gy6q12AurYXmeJ1QL/
   P5mYbc8vOy5zk7uS9X+i/QtzPKKbac2dNEvbAD/tAKxmSO2di/YOX6gP4
   hfbNhYaswBY46z/z7puqW/4ZzOL11H0ycSTRrI+Mni9g/A5DC5tMbn4gm
   g==;
X-CSE-ConnectionGUID: /InFAUSAQBiDzQYzAB7Jhg==
X-CSE-MsgGUID: iRlDMovyTvqnQs9GRWqNCw==
X-IronPort-AV: E=Sophos;i="6.18,230,1751234400"; 
   d="scan'208";a="46028589"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Sep 2025 13:23:27 +0200
X-CheckPoint: {68B6D3AF-1E-410E8DD8-CEA8F0F8}
X-MAIL-CPID: 9CBDA58469C4256730D2998464D30FAE_3
X-Control-Analysis: str=0001.0A002111.68B6D3AC.0013,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05936164002;
	Tue,  2 Sep 2025 13:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756812203;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p/8ygFbEgtNV5wSQi1SEP1xqS2pYIN9T58TZ8hpdiH4=;
	b=R/6snUputxLjudPp2/0ad8T64Y4pm5GRb2KwnfMLVCp5LfZpqNekWLfHOny1No/XlzPB4I
	c+SEfmmfitLnJoO3RRVkFhB/t4V+lJn2Zd70ncslVuUh8X6VEp9c7av5zZbRmb8Fisgwmm
	XUXzDRq18/YnHkNkKGehYejfRuPbCoLa0GinSKWFcFDrPwM7Kny/NALHrmtXiS+1IYe9Le
	vBYpeQUA05O04JYpo9C+yr3kSmo6+Q1fsdKUM2xfiWYKaQ8dZLHlb26XucxMwh/4hdITDM
	t5NBsVIOX+V0NMqPPKbQ6ZgDMt1lfiqHpcc10nsVc8309/JGAWgCozg6jcGYtQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>,
 Krzysztof =?utf-8?B?SGHFgmFzYQ==?= <khalasa@piap.pl>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
Date: Tue, 02 Sep 2025 13:23:20 +0200
Message-ID: <5921855.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <m31popxjqk.fsf@t19.piap.pl>
References: <175308758352.3134829.9472501038683860006@localhost>
 <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
 <m31popxjqk.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_042333_722569_35E1C19D 
X-CRM114-Status: GOOD (  13.94  )
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

Am Dienstag, 2. September 2025, 11:54:27 CEST schrieb Krzysztof Ha=C5=82asa:
> Hi,
>=20
> summary:
>=20
> I've done a few additional tests and it seems the MEDIA_AXI clock is the
> problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
> produces no errors.
> MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
> (register address errors while reading and writing from/to ISP MI
> (memory interface) registers, only on the secondary ISP (isp1), and
> generally only while streaming data from the ISP).
>=20
> What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.
>=20
> According to both datasheets (industrial and commercial), MEDIA_AXI
> is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
> All my hardware is setup for overdrive mode, though (two manufacturers,
> both using the same PMIC setup).
>=20
> Since no hardware in the official Linux kernel tree (DT) uses the second
> ISP... Should we just add a warning to the imx8mp.dtsi and be done with
> it?
> Out of tree hardware using isp1 (csi1) obviously exists.

There is also [1] which addresses normal mode and clock limits. I don't know
if there is any progress.

Best regards
Alexander

[1] https://lore.kernel.org/all/20250218-imx8m-clk-v4-2-b7697dc2dcd0@pengut=
ronix.de/


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



