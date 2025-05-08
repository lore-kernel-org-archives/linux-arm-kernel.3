Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77048C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3r7ePGaJL6m3bPjH+zRgwXHBgtp/XvvGiT+rsycxqik=; b=sP1uykiWjZTGy+V+GTwsIF1c3B
	2YyeyYN5Zw3hoIQLSksDi2DFGYCXQoOnMpEalD7Pcg6ofBpCk9furs3jV3NimTP36UD+611h86hFW
	PtyW3DTcwN35tSgnSA6qsSqXELhJb0xU8t+VWlVpGpqPdecw9af6uMyCZ3Z/fwRilVMByFNfdD+hY
	uWM9WB2+ozr1djVriTRqyYhDQbhrUsrPmmiLzyheCyJBjkgf+q3YGPl5NKyOz5lenmqcWWmDnbbdk
	0B1bCUwCNr9l5fKrLo/zszSmPneeBRWaZJ+L1C4EAcLpFsAfCTaeJ4YrD/wUwrK9mta1WjWJC7xxq
	jgCum+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD18x-00000000jQ5-0x5H;
	Thu, 08 May 2025 13:18:31 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD15W-00000000j8p-48lS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:15:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548DEsGO1869654
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 08:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746710095;
	bh=3r7ePGaJL6m3bPjH+zRgwXHBgtp/XvvGiT+rsycxqik=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=J+n2yeVBacSVKBiN2jJ5qhJxdmECwPKlctLR8CYgDJ4zkTsBnhuUWON5k7Kx3MbNY
	 XXZFc0fT73EFIHROthgsa0nL7/7gRHJcY9k85hA6GnPEbo2WNJ0q5IQfrLzd6Z243y
	 NOFZyZHA9/u84oXcJFkXQA2927jcM2NcLWwnHn9g=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548DEsB5121853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 08:14:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 08:14:54 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 08:14:54 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548DEsI9077292;
	Thu, 8 May 2025 08:14:54 -0500
Date: Thu, 8 May 2025 08:14:54 -0500
From: Bryan Brattlof <bb@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <20250508131454.z7ihjlcxdlglypew@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
 <20250508-splendid-rapid-sawfish-f1ee18@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250508-splendid-rapid-sawfish-f1ee18@kuoka>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_061459_120460_7A6812BC 
X-CRM114-Status: GOOD (  21.30  )
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

On May  8, 2025 thus sayeth Krzysztof Kozlowski:
> On Wed, May 07, 2025 at 10:09:19PM GMT, Bryan Brattlof wrote:
> > Add the binding for TI's AM62L family of devices.
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> > Changes in v1:
> >  - separated out devicetree bindings
> > ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>

My apologies the last version I assumed the Un-Acked[0] comment was a 
request to remove any trailers I picked up from you. I can add them back 
to this patch if you wish

~Bryan

[0] https://lore.kernel.org/all/f189ec8e-88fc-491f-8552-e1e5d0b7cde7@kernel.org/

