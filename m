Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B6AD6C281
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGT8AsS8Us1spIq9IkDtJaus5/uzjZbOrMzyLjeFCNQ=; b=mq8Rprew4KdHQygNSVxH1WV/5b
	017hI0KTHBoevjSVsarogtxHhhAnYE2mIIrH+vGxd6e2giKI+65iCtedLybu1JVlPsDAyb4X2y82a
	V5lFBI9DVzB1mplUI812tzK1eXaybRkyTisAYNaLyk6JmP2bMCffeM0GQR0AzYtEHfpdONIN+YEMs
	DIm9hq+2gg/gDS4lEX4t7nnarqHrvnmS0F1uv6c5q8zwJvHa7qryX7vbyIYQIsKkNChESJp6vp/og
	E/0pYkq4r1GNanti6xmlbzoe4nf4qEEdx5OD6P0guCxPgqO8GBlqFQ4sUudAPyCk9/0apJrX6kdkd
	H+G9rVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSkj-0000000DLmE-3dEG;
	Tue, 19 Nov 2024 18:15:05 +0000
Received: from mout.perfora.net ([74.208.4.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSjn-0000000DLbJ-1F1g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 18:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
	s=s1-ionos; t=1732040021; x=1732644821; i=parker@finest.io;
	bh=VGT8AsS8Us1spIq9IkDtJaus5/uzjZbOrMzyLjeFCNQ=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uONjaW2FblG/6peh9CrwJ8XfF2tDFqYzBm0/FVmh1cbgSJvIV2STyvLj609t1bSm
	 j7E/90mYpc6DFcdH5K9kuPE3fUdGViS6Cyl6s1yfiCoGy9nC4AC4TkMrLJAUGfjjL
	 3ot+Uio1KuKJL+Z/ZvUa3rTw6BIU3zYv+vqnDj2PdMsw5bMvTVF0s9ljozJwLRCYK
	 9kps61qMxknCaPTMQhBQQIpKxV0Kxu+q5zMTHlPhgS6ApViyesHEvdDvip9csBZZ5
	 RNhiHzIZMnFFRvQSWLWX6iiniXgWEvZNSZ/zqVjzvO6+UxgVk5O4HlvAX1sQ+0Z6z
	 pqMzG4BBklMvP2R+zg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1N95Jb-1tqap93LVv-017uyx; Tue, 19 Nov 2024 19:13:40 +0100
Date: Tue, 19 Nov 2024 13:13:36 -0500
From: Parker Newman <parker@finest.io>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paolo Abeni <pabeni@redhat.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <20241119131336.371af397.parker@finest.io>
In-Reply-To: <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
	<f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
	<ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
	<20241115135940.5f898781.parker@finest.io>
	<bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
	<20241118084400.35f4697a.parker@finest.io>
	<984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AtKqw0Z1I7mrrYJHxTfQz5F8hUNeBM14Cog+yV7Z7kBlruzLoEq
 52aV4ZlzIPc1OCm+IfwqymFQaKhYt2ZbqHTJJjIQtpu18McO2js+UUUqNozSyFiYvq1vMor
 j9qgYJ9/bNlYyTzSt2XcktTKgokGqx4GQXdAyJty1dbl52/eaXikcxB5rMLKxb3u1DoDau0
 uxB9RThgXBNB/H6oziE3g==
UI-OutboundReport: notjunk:1;M01:P0:GuLdzSAGVIo=;t3EYDXONAZMT2F7a5+doMXWtZjV
 cuPGr3pdRSaNEJ3lO0C0RnOVAEH+I4kv7Lt9MhqlfkkCa3ctc+Eru00Tvng2hrD7aEvbKEGR2
 Wxyg76vJ6IzKEaeRWP3H3PilJZHve7T0xqTYrl4X+RFBxF0FUOCgF0uVCOpxr05CLxuqxNEas
 VajBnbVq1GKwPOo2s/J0ZPsxei8RaO2/NhtbJXrgLf/V/EbYVkcs35rr5pRNmoKc1jsUL30rH
 IaLCS6xT3Dca9e8ZYpX37p1rpT2e8/SW3jqZLCRwHXVmYAbOZST1WD/1qEaDr32EPl8do+Pf5
 bhkB01vomsqhSSD2kGW+APTP3QA4z+Aqp0dYn3FbAr+ASMgt+PmghUV/CIcjnIrHPBj8Df/vz
 dCWIDSC8goGPB2aLNJDsjWNC1cLOk/Xyy0d3RDAJjiMA/uPMJWuw6yoLc7YTCZJS8JYlbgt3x
 m61c4e5SHkb3lafflPNLQEPo1FTEWpWu95VWbn4csRoo7XQT1IiOvdslMd58YVN1BSef89qeZ
 lq1sbzE9+tlg25Rwx9S+Gflbq/R9ZmIQw/c2Rmxqaed4CTVyFf5e68kln99SAMq6chzOpaDRe
 quTSx0TaDCaw0bgcavSAWYkcmgkAqk3o9WZh5huC+o70gGK/RQ1jgIw/7cHXdJCJDIory/dYH
 PCc+TioN+rhYatstwunHIshLdhPvLA06Pv5/+UoaoaRAe07nfdcvITa8EQvzi/y6d9WEjCHx/
 07d1BJrVCRQjXE+kBDRQ4+SaZ4M9Zc9yqrnc1Ofo5ii8rBGvcZ0o0ABKOh8S65HiZdboh2e4b
 IpA4NlLSNMrMLav9j14WctihV02FYT81m/4Y+QtzPNYTAqfOHznU1Z4E0I1KmubFto
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_101407_561850_6F163146 
X-CRM114-Status: GOOD (  27.58  )
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

On Tue, 19 Nov 2024 01:50:18 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > This is not a new dt property, the "iommus" property is an existing pr=
operty
> > that is parsed by the Nvidia implementation of the arm-smmu driver.
> >
> > Here is a snippet from the device tree:
> >
> > smmu_niso0: iommu@12000000 {
> >         compatible =3D "nvidia,tegra234-smmu", "nvidia,smmu-500";
> > ...
> > }
> >
> > /* MGBE0 */
> > ethernet@6800000 {
> > 	compatible =3D "nvidia,tegra234-mgbe";
> > ...
> > 	iommus =3D <&smmu_niso0 TEGRA234_SID_MGBE>;
> > ...
> > }
> >
> > /* MGBE1 */
> > ethernet@6900000 {
> > 	compatible =3D "nvidia,tegra234-mgbe";
> > ...
> > 	iommus =3D <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
> > ...
> > }
>
> What i was meaning does the nvidia,tegra234-mgbe binding allow iommus?
> I just checked, yes it does.
>
> > If the iommus property is missing completely from the MGBE's device tr=
ee node it
> > causes secure read/write errors which spam the kernel log and can caus=
e crashes.
> >
> > I can add the fallback in V2 with a warning if that is preferred.
>
> The fact it crashed makes me think it is optional. Any existing users
> must work, otherwise it would crash, and then be debugged. I guess you
> are pushing the usage further, and so have come across this condition.
>
> Is the iommus a SoC property, or a board property? If it is a SoC
> property, could you review all the SoC .dtsi files and fix up any
> which are missing the property?
>
> Adding a warning is O.K, but ideally the missing property should be
> added first.

I think there is some confusion here. I will try to summarize:
- Ihe iommu is supported by the Tegra SOC.
- The way the mgbe driver is written the iommu DT property is REQUIRED.
- "iommus" is a SOC DT property and is defined in tegra234.dtsi.
- The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
- There are no device tree changes required to to make this patch work.
- This patch works fine with existing device trees.

I will add the fallback however in case there is changes made to the iommu
subsystem in the future.

> The merge window is open now, so patches will need to wait two weeks.
>

Ok thanks, I will wait a couple weeks to resend.
Parker








