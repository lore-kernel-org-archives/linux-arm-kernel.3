Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FFFC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 05:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL7rKUTQWHzPt0OWlfsDjec/OxS1CHnG4JHuLvAXp+E=; b=vhQK/Pow7c4ifdicmIB/D9uydY
	Rn7agLmaPjI+KJirmLFd8kbBNAGFtCdSM63DZpEjoNDcQr1i2qmTeObM+hlQb3lNq4IQEEOlUD04X
	2t7BtABF8CBsciK/YJUc+I5nkLMbk71nQLx+t7fiZJRot6Npb6OMC+lsMgec7g9epXo86oxkmHQFw
	RPOzgeJRLyHfcXlMGF1Soaz4Tfr4SWLCmsqcrA9+D98PTNDVfg/t6wRsOs0gEh0Nz4KBOHPkGFXoE
	022aMvs8reRO6TQ/23rNTwLJgMeU/rWnm8MEyo97yBO37T8W99iALtzjYUluEoQbWCoMet8b+LwVw
	kjdnHg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TXr-0000000FUIW-1Mjs;
	Sat, 12 Apr 2025 05:36:47 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3TUs-0000000FU2Z-0SoQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 05:33:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5XclW1614445
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Apr 2025 00:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744436018;
	bh=HL7rKUTQWHzPt0OWlfsDjec/OxS1CHnG4JHuLvAXp+E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CIC8k86K9V57lJlP9m9TPMXaJOizCeEcSt9p7TaAMpvpCtQdqdp+2PAbezOYSrqSX
	 hxJAOwFztUYQaSuYI8OxtR2xaDIN6EQGcq6av6CziDKdL2c4bfvCtf8z3OIeDdiCYs
	 EoknYeAmSVVgs64A4azQRGZoiNViczkzzzTfWx2c=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53C5XcKQ111783
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Apr 2025 00:33:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Apr 2025 00:33:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Apr 2025 00:33:37 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53C5XaW3128327;
	Sat, 12 Apr 2025 00:33:37 -0500
Date: Sat, 12 Apr 2025 11:03:36 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <rogerq@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j722s-main: Disable
 "serdes_wiz0" and "serdes_wiz1"
Message-ID: <4d9746fb-5145-4195-94ce-f4b40bc19d0a@ti.com>
References: <20250408103606.3679505-1-s-vadapalli@ti.com>
 <20250408103606.3679505-3-s-vadapalli@ti.com>
 <7b2f69ad-48aa-4aa9-be0e-f0edae272bdb@ti.com>
 <475a1ac1-abb1-4c6e-b5b2-3f1a3399d5c4@ti.com>
 <28f1e0b7-9947-43f3-9a47-f3c6ecd69b91@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <28f1e0b7-9947-43f3-9a47-f3c6ecd69b91@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_223342_244477_A25E49F9 
X-CRM114-Status: GOOD (  21.58  )
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

On Fri, Apr 11, 2025 at 09:22:00PM +0530, Kumar, Udit wrote:
> Hi
> 
> On 4/11/2025 7:47 PM, Siddharth Vadapalli wrote:
> > On Fri, Apr 11, 2025 at 07:31:52PM +0530, Kumar, Udit wrote:

[...]

> > > Since you are disabling parent node.
> > > 
> > > Do you still want to carry status = "disabled" in child nodes serdes0 and
> > > serdes1.
> > I could drop it, but then the patches will look something like:
> > 1) Patch 1: Same as the first patch in this series
> > 2) Patch 2: Current patch + Remove status = "disabled" within serdes0/1
> > 3) Patch 3: Removed redundant status = "okay" within serdes0/1 in
> >              k3-j722s-evm.dts
> > 
> > Updated Patch 2 and the new Patch 3 mentioned above aren't necessarily a
> > complete "Fix" and have other changes in addition to the "Fix". For that
> > reason, the changes associated with the updated patch 2 and the new patch 3
> > could be a separate series, unless you believe that they should go
> > together in the current series. Please let me know.
> 
> I don't see any use case where serdes_wiz0 is enabled and serdes0 is
> disabled.
> 
> So your comment 3) is valid. you can take this clean up in other series
> 
> 
> For now
> 
> Reviewed-by: Udit Kumar <u-kumar1@ti.com>

I have posted the cleanup series at:
https://lore.kernel.org/r/20250412052712.927626-1-s-vadapalli@ti.com/
The cleanup series applies on top of the current series.

Regards,
Siddharth.

