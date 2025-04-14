Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B866C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VX8a/yvVIobMpnRl8a6ZehZn3dZHFdJf7iaKYTSI3Nw=; b=W3XqXOxkyIySSLNytPERNUD76g
	rrCzBE6SNY7iKihmXxTIxX39lFXL+VfwRMi8/RboaO5iefpGJH4iCEQzPc1pEdxQYyyLH7+XzDKbJ
	p+c7v17V+Kd9lck7fAeFcMD5390wiuJlng8PBj7aLEdC63AmWGiCE3hi+MBqMF4jf0iIcR3gkrV+/
	CRocCKyaTTmK9dRpnglXHVWQbX1+9CDZIipSMLIiaAbWuBHNuW3LCOa/cGtY0adnoS1+OkUcfDgCo
	SIrUUqUHMoL2xJMqxe5a+BaGIHINH2O4ti6jc1kW1wRS2Sp2dQGtSYnK5u9Q3rtS82iZwgMqJ3+h/
	d8FthOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JSq-000000022R9-0o40;
	Mon, 14 Apr 2025 13:03:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JQz-0000000226c-0D9Y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Apr 2025 13:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VX8a/yvVIobMpnRl8a6ZehZn3dZHFdJf7iaKYTSI3Nw=; b=bnRPhj3o2yE65W3FvAFfApsLL5
	3QN+WUkhVW//bAs8GIA5rcUAl0T/ra1ONUW6FIxVH+FWKU1qJAYm7WQD4xWpHhAmb8f3cL8eXD+Pa
	utzgfP2LD/J8LyjyQFzGDPtfSphoUTxMCOogoOKCrEgHwGD3cMRwXyWlPgzcXRfnvS8xbXQnA5pPr
	2IL+QGq2mkvNRrYXbaqfBNTQNKB5jxFEirK5tHC8gkdU8MHA3JfF91oSnJCiXR7r1Y+0MEVcZtXQF
	gNKm0lxd1aYd0djw5MCRR+Z/+cddR1JAFEugMKPtMfO/Yq9lCZgz8Y2PqEvtCIavaB42XNi9WjzsO
	cX9awDfw==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4JQv-00000009gDK-1KjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:01:07 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53ED0tBe2062857
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 08:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744635655;
	bh=VX8a/yvVIobMpnRl8a6ZehZn3dZHFdJf7iaKYTSI3Nw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JG4xywC2mDpw8S6eXsJk0pcJbPrkdw1+4Am3wGY+xOZsTUmA9lvISe9h64MMGDsAk
	 UR7wYuXzsJtS5GXPWAziYI5ufrbwnoBkuHqY1hYiALh/lN0a3DlXrR71Ic2nnXTGiv
	 H3b6sEMD5uHL8kXUqHuzzR6sPOwOflVgoFHq18jc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53ED0tKH129700
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 08:00:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 08:00:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 08:00:54 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53ED0r0g024564;
	Mon, 14 Apr 2025 08:00:54 -0500
Date: Mon, 14 Apr 2025 18:30:53 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/2] J722S: DT Node cleanup for serdes0 and serdes1
Message-ID: <79ef7f50-22d5-4c40-ae28-02bf297ca79c@ti.com>
References: <20250412052712.927626-1-s-vadapalli@ti.com>
 <20250414120930.m7x7zfmyby22urpo@ultimate>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250414120930.m7x7zfmyby22urpo@ultimate>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_140105_750568_CEAAAE67 
X-CRM114-Status: GOOD (  23.03  )
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

On Mon, Apr 14, 2025 at 07:09:30AM -0500, Nishanth Menon wrote:

Hello Nishanth,

> On 10:57-20250412, Siddharth Vadapalli wrote:
> > Hello,
> > 
> > This series is based on the following series:
> > https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
> > Based on the discussion in the above series which disabled 'serdes_wiz0'
> > and 'serdes_wiz1' nodes in the SoC file and enabled them in the board
> > file, Udit pointed out that it wasn't necessary to disable 'serdes0' and
> > 'serdes1' in the SoC file anymore, since that is not a working
> > configuration - serdes_wizX enabled and serdesX disabled doesn't work.
> > 
> > Hence, this series aims to cleanup the serdesX nodes after the changes
> > made by the above series.
> > 
> > Regards,
> > Siddharth.
> > 
> > Siddharth Vadapalli (2):
> >   arm64: dts: ti: k3-j722s-main: don't disable serdes0 and serdes1
> >   arm64: dts: ti: k3-j722s-evm: drop redundant status within
> >     serdes0/serdes1
> > 
> >  arch/arm64/boot/dts/ti/k3-j722s-evm.dts   | 2 --
> >  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ----
> >  2 files changed, 6 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> 
> I do not understand the logic here. serdes cannot operate without wiz
> nodes, correct? why would we leave serdes on by default?

Yes, serdesX requires serdes_wizX, but at the same time, serdesX is the
child node of serdes_wizX. Therefore, without enabling serdes_wizX, we
cannot enable serdesX.

Prior to this series, but with the dependent series at:
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250408103606.3679505-1-s-vadapalli@ti.com/
applied, the nodes look like:

	serdes_wizX {
		...
		status = "disabled";

		serdesX {
			...
			status = "disabled";
		};
	};

The dependent series fixes 'serdes_wizX' by disabling it in the SoC file
k3-j722s-main.dtsi. But after the fix, we have a 'status = "disabled";'
within the serdesX node which isn't required since:
a) serdes_wizX enabled but serdesX disabled is non-functional and
unusable
b) serdes_wizX disabled in DT implies that serdesX is also disabled

Regards,
Siddharth.

