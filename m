Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DCAC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaIUReCTcoh94jk11jEfjg06go62dK/AeBJ/ZKOUjCc=; b=wGyijXNpibcivygIVBdmHRJWQi
	ZrkX+nmlRHQ9lqQ3QKYQneAcPrV03BQsMASTbiIJ41KyLwzHCX/pL4mKVy1PJWLCvos7dsvuExKN6
	GHpGmK7tQSS0f1E2ZlEa9dTycZpZ3jn65Q+mma7IQHgyrqe2sCU0O/zyLib0OuNyxxdOKFNwLUy8z
	J0D8IBmUjB13TzROFDmUIRAHBFk246zhLwLxjhf09kwwCs1ltkioKbWRlPlAI+Cf5vPTObY7zHIAE
	oiEBa+aQhvnNMwbHFICPESM/DunG7vWcePD9GY+RUf44OxJrTqtCIegCHCjZ381i+ncGLJ3CaZQ99
	Pjs6vsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Zb-000000069v9-10ad;
	Tue, 11 Mar 2025 15:31:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1Xw-000000069cU-0MFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:29:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BFTNKP1221695
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 10:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741706963;
	bh=WaIUReCTcoh94jk11jEfjg06go62dK/AeBJ/ZKOUjCc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=x3k55r90Ny5iSVvvY6DGis99lOaOFRjbcemB+DWEmOnmPme+Y4b0T6Je8gMsSvmK8
	 ZqAIkpn5zd47QXlKoJCDXXpya8b7T+Fzm9kAechpBUK8B2OTDTaoXNkwDMab2Q/KKl
	 KvL8p9j3QGyrHI7zkd4eqztaPIIqHfd4Oz/QYCqY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BFTNgY124191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 10:29:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 10:29:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 10:29:22 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BFTLT3014640;
	Tue, 11 Mar 2025 10:29:22 -0500
Date: Tue, 11 Mar 2025 20:59:21 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <rogerq@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250311152921.cwb7obw5bmlrhvsi@uda0492258>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
 <20250310210746.GA2377483@rocinante>
 <20250311051806.smcu4o4dxpngimth@uda0492258>
 <20250311072546.GA277060@rocinante>
 <20250311073216.ynw7rzmu36dwywij@uda0492258>
 <20250311152133.GC1381004@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311152133.GC1381004@rocinante>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082932_172296_A18BBFCF 
X-CRM114-Status: GOOD (  15.16  )
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

On Wed, Mar 12, 2025 at 12:21:33AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > No need to send a new version.
> > > 
> > > I will update the branch directly when I pull the patch.  Not to worry.
> > 
> > Thank you Krzysztof :)
> 
> Done.  Have a look at:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=01d04dcd6e80f63ca5e97324ec17c20553947e35
> 
> Let me know if there is anything else to update.

The changes look good to me. There seems to be a minor typo in the
commit message:
[kwilczynski: add a issing .linkdown_irq_regfield member set to

You probably meant "missing".

Thank you once again for fixing it without the need for a new patch.

Regards,
Siddharth.

