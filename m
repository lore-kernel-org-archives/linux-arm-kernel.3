Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9284C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 04:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTJ34juyqAHwoLk5x+rIDM1Ap9TP08Q7eCw87Fb5WxA=; b=MgVVzOLbun4KgdB1ZhhWGuZcgl
	C+aHuVor8CCv1OKyYXLQW04EOHGa34R/2Xx9BNzcvoqLbO+eQwjkf5UoKkRqSbPK98EzCe7EFqm7R
	7W6JxWDU+/UCwWItyaeQFzlNPhhILx7UcHNdjvoBipLO+mMpa96HYmGRs1fRbMSn3BxS5TmspxI9c
	MWTVep2+nydg2If2cLMvE5oTZ7Isj1nh78ffDv3Yxxcvpgq9sIJRPWFJ3eL8fWBStUJ/ORdP8InzT
	DmtUnMjN/Sup5tWNB5pt/BzP7SZoimObqV2TmMEPPFwFHYvDDFva9wQGhs1fK6Iur5KNPOUEYwrzk
	wEDboJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrlo-0000000HFmI-2vRL;
	Fri, 30 May 2025 04:55:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKrjf-0000000HFEl-3xkw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 04:52:53 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U4qlft2592111;
	Thu, 29 May 2025 23:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748580767;
	bh=ZTJ34juyqAHwoLk5x+rIDM1Ap9TP08Q7eCw87Fb5WxA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HZyCGBCurMCFyDuypzN2LQc5vtS/R3d5H5kztRAfLqvaeeWQw6KXe6Pz2IygULZRh
	 NwDLL8ZhpH2XtNzGTu+KBKRolT1N2D1reE+aklXnmtXgFCPK0jytss4fTKpd53NR/8
	 KKS/UDM5JvK7SSlmpZCFb0W6TgOHAGnRF70GQYok=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U4qleA578099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 23:52:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 23:52:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 23:52:47 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U4qkuW2554777;
	Thu, 29 May 2025 23:52:46 -0500
Date: Fri, 30 May 2025 10:22:45 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 01/13] arm64: dts: ti: k3-am625-beagleplay: Enable
 "cpsw3g" in the board file
Message-ID: <de244dbc-774c-465f-99a2-17d452085986@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
 <20250529133443.1252293-2-s-vadapalli@ti.com>
 <ec227d43-5e0b-4de5-9329-63aa2bffbd99@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec227d43-5e0b-4de5-9329-63aa2bffbd99@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_215252_068879_E0ADE77D 
X-CRM114-Status: GOOD (  15.15  )
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

On Thu, May 29, 2025 at 03:37:22PM +0200, Krzysztof Kozlowski wrote:
> On 29/05/2025 15:34, Siddharth Vadapalli wrote:
> > In preparation for disabling "cpsw3g" device-tree node in the SoC file,
> > namely "k3-am62-main.dtsi", enable it in the board file. The motivation
> > for this change is that of following the existing convention of disabling
> > nodes in the SoC file and only enabling the required ones in the board
> > file.
> 
> 
> That's not separate commit. You disable in DTSI and enable in DTS in the
> same one, to avoid any duplicated statuses like in this case (even if
> one is default).

I will squash the commits. Thank you for reviewing the patch.

Regards,
Siddharth.

