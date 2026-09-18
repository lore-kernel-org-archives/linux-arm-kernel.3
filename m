Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A80DC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JT85z7VBQuVxTsS2FhpPNP1G7Luj+25ReTRMe0j4Eo=; b=TOHlj2csCxESjnLogbn76Z15Dc
	7BhDA5EtjtuHqWcaEe5ZZdzvHU/QzlR7w+0CyulhcX6d75NqtlDxjBqk7YvSxvPB4Ow/wk2ssVjU5
	fWVnBgiNw4N9PCHokj1a8eaUPE8N1tD4YhbdFXQj+Q9RqWn2BWbUMu7IDXavvZlaD+x84fnBq8rJw
	dUFSFcgOg3A/jY1imWYtNgXLAxPy6gdHeFFbSc4c41BhS2D31euMHj4E7CgwikLJbCZmTv+wFd98a
	hnP7GkUaAMB6ipnP3EgzZ1IeUeL11fPSBdv2wHa3Dz/SdUL1U9s/FkYMLCcZXcN+V4tFvpI4R0Db3
	ydLvhanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YwQ-0000000Ecvy-1qK3;
	Fri, 18 Sep 2026 13:47:50 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YwN-0000000Ecuv-2RzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:47:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D990A50C5;
	Fri, 18 Sep 2026 15:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789739263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6JT85z7VBQuVxTsS2FhpPNP1G7Luj+25ReTRMe0j4Eo=;
	b=nEjX0kLYWLtbkvv3h8Ih+GECcXAr10XaBlncO0DDvSlF+B6im55NTRoUMtVAI0M0M5nZcq
	D1uuysQ1Kxv0pNFVz0uD1FTFLLEVdmwn3a25a0s9I5v3MqxAbwrvqSEMQdDfhoxVmn2q87
	dQJEsepuf4GSzehM7WdaW8bhjEsI5twEG27B+iK0khs1s2kjGfLao3sZICR+a98diDUEnp
	r19TtwjbaOTFKxwFjac/5i9qiLaJv0ur+Uxlx2rKGeG1SL3PD0T6ZoqSQOJyOVba233vjo
	edlujib3h22l5mofpgk5GFQLFhc8S3AWOSxNEdeot00bJsDMqy8kfkLBloqpKg==
Date: Fri, 18 Sep 2026 15:47:32 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?ISO-8859-1?Q?Alexis_Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net_v4_5/7=5D_net=3A_stmmac=3A_dwmac4=3A_Use?=
 =?US-ASCII?Q?_the_correct_bufzise_when_the_len_is_exactly_8K?=
User-Agent: Thunderbird for Android
In-Reply-To: <fd937877-306e-48c1-8b14-e8dc62986420@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com> <20260917215339.2022523-6-maxime.chevallier@bootlin.com> <4b3c26c482ac1d26f39b53fea072e4d1@tipi-net.de> <fd937877-306e-48c1-8b14-e8dc62986420@bootlin.com>
Message-ID: <DB73CA16-1F9F-4680-A7BD-B5E043F3A20A@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064747_780949_D3A2A04E 
X-CRM114-Status: GOOD (  15.03  )
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



On September 18, 2026 2:45:10 PM GMT+02:00, Maxime Chevallier <maxime=2Ech=
evallier@bootlin=2Ecom> wrote:
>
>
>On 9/18/26 14:25, Nicolai Buchwitz wrote:
>> Hi Maxime
>>=20
>> On 17=2E9=2E2026 23:53, Maxime Chevallier wrote:
>>> DMA bufsize selection isn't made on the MTU but the actual frame lengt=
h,
>>> so including the L2 header=2E On DWMAC4, if the len is exactly BUF_SIZ=
E_8KiB,
>>> the next larger size is incorrectly selected=2E
>>>
>>> Lets fix the comparison and while at it, rename the parameter from len
>>> to mtu=2E
>>=20
>> Isn't it "[=2E=2E=2E] from mtu to len"?
>
>:(
>
>Bah, if respin is required I'll fix this
>
>>>
>>> Fixes: c3efed5ad1b0 ("net: stmmac: Enable dwmac4 jumbo frame more than=
 8KiB")=2E
>>> Signed-off-by: Maxime Chevallier <maxime=2Echevallier@bootlin=2Ecom>
>>> ---
>>> =C2=A0drivers/net/ethernet/stmicro/stmmac/dwmac4_descs=2Ec | 4 ++--
>>> =C2=A0drivers/net/ethernet/stmicro/stmmac/hwif=2Eh=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>> =C2=A0drivers/net/ethernet/stmicro/stmmac/ring_mode=2Ec=C2=A0=C2=A0=C2=
=A0 | 4 ++--
>>> =C2=A03 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs=2Ec b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac4_descs=2Ec
>>> index 2994df41ec2c=2E=2Ec6a8f8d73501 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs=2Ec
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs=2Ec
>>> @@ -474,11 +474,11 @@ static void dwmac4_set_sarc(struct dma_desc *p, =
u32 sarc_type)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sarc_type))=
;
>>> =C2=A0}
>>>
>>> -static int set_16kib_bfsize(int mtu)
>>> +static int set_16kib_bfsize(int len)
>>> =C2=A0{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>
>>> -=C2=A0=C2=A0=C2=A0 if (unlikely(mtu >=3D BUF_SIZE_8KiB))
>>> +=C2=A0=C2=A0=C2=A0 if (unlikely(len > BUF_SIZE_8KiB))
>>=20
>> Should we drop set_16kib_bfsize() instead?
>>=20
>> After 6/7 it looks to me like the same test as the first branch of
>> stmmac_set_bfsize()=2E The caller ends up there anyway when it returns =
0
>> and chain_mode_ops doesn't have it at all=2E
>
>True yeah :) however maybe we can wait for this to be merged and have the
>cleanup in net-next ?
>
>Sashiko is getting crazy with the "pre-existing issues" everytime we touc=
h
>stmmac, cleanups are long overdue and this could be included in there :(
>

Totally fine with me=2E Maybe the commit message can be fixed up on merge?=
=20

>Maxime
>
>
FWIW

Reviewed-by: Nicolai Buchwitz <nb@tipi-net=2Ede>

