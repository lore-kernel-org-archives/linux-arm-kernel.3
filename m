Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F44C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffIKS9eIZBW9eHffar0JS6ZNloX70WPCmRPw4t2LjDs=; b=tCQlPA4O9+OINDsv1ZLCKBHSyJ
	BbZsGv7FjNPfez4N6sCoszQCtsYw+ofi/oe8hcRqG3r8Tr+xBAqjbA/9OMP1xp4JkQvnqlaBk2Kfh
	SF3DNEJL9pqSvHdy9/rySKGgd5ctClxQ8sb5aEKMSsQPP2Uf4dpOBFzaJHg2g+D+dRUeXE8bRV9QR
	NH7s6/hRcoT3ILRo/rXdcnmC2ZmkiOC6+UkJdVxh+Xry7ja/N6PHiHXxnpHoaguOtCZ+LM4Djhk0Z
	klq0IWchonDcry3DfD0JQdfGd3jwDgPXdVgXRkIuS0hCEWmgMZXQrTo1mrXsJ7dRJzayGoCrPstzx
	gbP3QOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CUd-0000000DXlJ-2u2R;
	Fri, 11 Apr 2025 11:24:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CQx-0000000DWph-2KrL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 11:20:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKRY91426685
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370427;
	bh=ffIKS9eIZBW9eHffar0JS6ZNloX70WPCmRPw4t2LjDs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZZqO4s/cri/1sGu/Vijf+eEvQACHTIlfmtD1vBV0V2JSuHDSetnnwsmQj7RwTHPhA
	 d828Eb4N6GBeExZO5tMhyhcGd8+ylXABzJncDc8+Q8SkrFPBJPDfs13DW00JCzvpVG
	 BJX/Y4bIQCiJUN9OXTJ4UMage3MXyUVrPsy7Bw+A=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBKRYY028526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:20:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:20:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:20:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBKPGx081393;
	Fri, 11 Apr 2025 06:20:26 -0500
Date: Fri, 11 Apr 2025 16:50:25 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
        <rogerq@kernel.org>, <kishon@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/5] arm64: dts: ti: k3-j721e: Add PCIe ctrl node to
 scm_conf region
Message-ID: <a6c6542d-cbe5-4476-8d2f-eaa5268bcb0b@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
 <20250402113201.151195-3-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250402113201.151195-3-j-choudhary@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_042031_687510_48E084B1 
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

On Wed, Apr 02, 2025 at 05:01:58PM +0530, Jayesh Choudhary wrote:
> From: Andrew Davis <afd@ti.com>
> 
> This region is used for controlling the function of the PCIe IP. It is
> compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
> the PCIe nodes.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> [j-choudhary@ti.com: Add changes to k3-j721e-evm-pcie1-ep.dtso]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

