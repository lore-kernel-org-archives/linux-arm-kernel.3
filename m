Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D76C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1Gfdy6wX1Dois06oRTY9AcANjqB6mdVSeX6UOHAiDQ=; b=kWeWz2YXiyHGDN5OCXXwV4Xui5
	zyvAFMUcY4AaezBKaTcB6LXetyVuhiDyIwPfx5x5w7lZtajAdoKoKatYsGVM1l4p/0ns1pCpmSLi5
	S5V8hourTOB4wftKC1/cEfHWo3tTaBO6C20JZMpFOS01TvbwBgghaQ2J45w+nwnY/POMbBsCqv0St
	gVQmdyGCqhU8F55BPpXEgayDMLh01am6l1Rr4evadoYJMh+34U2E4zcrQbu8bK6q4NPDmflNNMCl/
	Bl+lMW1kTxs63bCJIrc1w52wbJzwtRlmCpg/CYOoQi9TWe4+FyktG45wQXeAGcRCF7z/oKziglvf4
	fAQJX3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CYE-0000000DYhX-0EPi;
	Fri, 11 Apr 2025 11:28:02 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CRH-0000000DX2Q-1Nci
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:20:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKmTl2108601
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370448;
	bh=S1Gfdy6wX1Dois06oRTY9AcANjqB6mdVSeX6UOHAiDQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KevhDWZdZA6uilBNRXkbnGEGf2w9EjmXBxqlE+GGkLWBRc5v1LuWaS1i/VTK8bFIn
	 MEOt1i60rs380qvrGRWcefKvWco74KOfV9nFappT5z42WVzNOrsdiaZPQdEnX3t8+K
	 gZpUGpmSZw7O8D/FOrQ/Tey6ylpqwnRBoMDLChV0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKmgN026474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:20:48 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:20:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:20:47 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBKk3A081689;
	Fri, 11 Apr 2025 06:20:47 -0500
Date: Fri, 11 Apr 2025 16:50:46 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
        <rogerq@kernel.org>, <kishon@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to
 scm_conf region
Message-ID: <cb4907cd-9af1-46ef-855a-060f3d62726a@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
 <20250402113201.151195-5-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250402113201.151195-5-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042051_411199_699D4CBB 
X-CRM114-Status: GOOD (  11.32  )
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

On Wed, Apr 02, 2025 at 05:02:00PM +0530, Jayesh Choudhary wrote:
> From: Andrew Davis <afd@ti.com>
> 
> This region is used for controlling the function of the PCIe IP. It is
> compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
> the PCIe node.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> [j-choudhary@ti.com: Add changes to k3-am68-sk-base-board-pcie1-ep.dtso]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

