Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB59DC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PbXgpy653QuN9OMNnOctsYngJs/w/ZaXQ7o33MdbVQ=; b=i0WWlIpZuKEB82Yl6bXGJg1Dmn
	4ceCNTeXoR5sKDlt/63TrMcQJ2Z0hDjvWc8HGNaviWI3Qv4fu/8qpiId8AlMe3zPtaXIr/f6sEpcD
	Md1HXEfaKrMSyfqfR3lNuR4GRMURRDlI+jDbQp4dEe321qu8b0zvWKdmscKUZXosvu6RCxSrCj340
	Q7xHSFwjYLDiPZ1SsY/ds/ZdOO5TrKIfqr/P2onKaOCCj0j5hermKtxYsvK2sfuJq2ZponZwk7jcU
	gwXieVAc5XxHwG4PKCSR7a6Unf4kzeKogzqr5TIqbWXFSr7m/k7Ba7Gj729Ax4S5/gV+lXk3EQkwi
	TRSmgyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p0f-0000000G1WY-0R8t;
	Sat, 19 Sep 2026 06:57:17 +0000
Received: from relay.yourmailgateway.de ([188.68.63.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p0b-0000000G1Vd-1WbR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:57:15 +0000
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hn0fT5GN9z4Hxr;
	Sat, 19 Sep 2026 08:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789801025;
	bh=45MegNFsAtWYZexybcxxREXKZcERntxf2K3y+Plbqwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U/CB9llWNSX1S9/H1CeQaSFueCxQ7sLv0IYESdRM5+9dlWxE366shfod4dIM71S2x
	 FWGB/buUtdsU18ZfaUlORZ8Sihx2tJuDp9hNTgbTCvwo8dJoyBDpZIoe36NRFX9hgs
	 YhoUwtz2AjdhEuo387ng5Qn2YfFIQH5aMMGU9eOsr3sFY/GItlvuBSTBVvqATv6rlC
	 iV9pZsGYpY6h63uL1svqQAPNA3efL+tQpbduO8G4G8oowwJTQ8Qme7I5EEM24iaAfC
	 0V1+U/m5JRtRry1IBIFmNK3+iZ1H+eWrETQaLG7UuA4lN4waVfdqMJGA3roSClErkd
	 VF/kj0rhM5lyw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hn0fT4Xccz4HxW;
	Sat, 19 Sep 2026 08:57:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hn0fR751Sz8tg2;
	Sat, 19 Sep 2026 08:57:03 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 24A405FA32;
	Sat, 19 Sep 2026 08:57:03 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <344d9e26-769e-4551-9dba-f48ccbd6793b@leemhuis.info>
Date: Sat, 19 Sep 2026 08:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: imx6: Keep Root Port MSI capability also for i.MX6Q
To: Bjorn Helgaas <helgaas@kernel.org>, Soeren Moch <smoch@web.de>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, stable@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, Lucas Stach
 <l.stach@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918230015.GA1205610@bhelgaas>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260918230015.GA1205610@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178980102368.147768.7933732274283946620@mxe9fb.netcup.net>
X-NC-CID: sWpGcjgseDQL8M6+YmxU2Mdbf5E3igADS7Oh7gQWPZPo/0Cxv9Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235713_861136_41FA6FCF 
X-CRM114-Status: GOOD (  24.97  )
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

On 9/19/26 01:00, Bjorn Helgaas wrote:
> [+cc Thorsten, possible regzbot confusion?]
> 
> On Mon, Apr 27, 2026 at 01:58:04PM +0200, Soeren Moch wrote:
>> Also on the NXP i.MX6Q chipset MSIs from the endpoints won't be received by
>> the iMSI-RX MSI controller if the Root Port MSI capability is disabled.
>>
>> Even though the Root Port MSIs won't be received by the iMSI-RX controller
>> due to design, this chipset has some weird hardware bug that prevents
>> the endpoint MSIs from reaching when the Root Port MSI capability is
>> disabled.
>>
>> Hence, always keep the Root Port MSI capability for this chipset.
>>
>> Note that by keeping Root Port MSI capability, Root Port MSIs such as AER,
>> PME and others won't be received by default. So users need to use
>> workarounds such as passing 'pcie_pme=nomsi' cmdline param.
>>
>> Fixes: 3a4e8302e72f ("PCI: imx6: Keep Root Port MSI capability with iMSI-RX to work around hardware bug")
>> Cc: <stable@vger.kernel.org> # 7.0.x
>> Signed-off-by: Soeren Moch <smoch@web.de>
> 
> This thread is still listed as a regression:
> https://linux-regtracking.leemhuis.info/regzbot/regression/lore/20260427115804.134231-1-smoch@web.de/

My fault, afaics; sorry.

> But I *think* it's been resolved by:
> 
>   b4bee12ebecc ("PCI: imx6: Keep i.MX6 Root Port MSI/MSI-X Capabilities with iMSI-RX to work around hardware bug")> 
> Can you confirm?
>
> Maybe regzbot is confused by the fact that the regression was first
> attributed to 3a4e8302e72f, and then later attributed to
> f5cd8a929c825?

The main problem is something different: Sometimes one commit causes
multiple issues that in rare cases might even be reported by the same
person -- and regzbot needs to keep them and fixes for them apart. Which
is why it is cautions and will only auto-close a tracked regressions
when a Link:/Closes: tags points to what regzbot considers the report,
as Linus demands those anyway. And b4bee12ebeccfc didn't to that. No
problem, happens all the time, normally I notice these things and tell
regzbot manually. And I kinda did when I noticed that a fix was in the
works, but then the subject of the fix changed later -- and I missed that.

These things happen and in a ideal world regzbot should be little more
gentle and likely auto-close tracked regressions when a Fixes: tag
combined with a Reported-by: or Tested-by: matches. That is kinda on the
todo list, but not near the top (wait for by LPC talk). Anyway, thx for
mentioning it and let me update regzbot:

#regzbot fix: b4bee12ebecc

Ciao, Thorsten
>> ---
>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>> Cc: Richard Zhu <hongxing.zhu@nxp.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: Frank Li <Frank.Li@nxp.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: linux-pci@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>>
>> Tested on a tbs2910 board [1]
>> [1] arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
>> ---
>>  drivers/pci/controller/dwc/pci-imx6.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index 6d6a1688e7eb..3d461bdef967 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1865,7 +1865,8 @@ static const struct imx_pcie_drvdata drvdata[] = {
>>  		.flags = IMX_PCIE_FLAG_IMX_PHY |
>>  			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>>  			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
>> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
>> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
>> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>>  		.dbi_length = 0x200,
>>  		.gpr = "fsl,imx6q-iomuxc-gpr",
>>  		.ltssm_off = IOMUXC_GPR12,
>> -- 
>> 2.43.0
>>


