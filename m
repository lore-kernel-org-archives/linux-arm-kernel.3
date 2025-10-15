Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B9DCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bis6a1wlF8kYaFqIpcDHDYpUVxg0GoC2tnUOAX6rrV8=; b=HcXCPmjcBgGCzIH2Xukqn19qLc
	mZYVtxMn8mEkJ5Ta4GVSAZvcXu3LhWx9eTuDUKpY2HBwHhAJS/cdMyjyhxrjnRtNNoJ/JZKX/qHIg
	jF9nKK6ZXrBEPsmc5g5JsaIHONAnr+85YzS+697vIHGh8oIstnC0nwjJAT6IX+cPSDLbvtlBoAcQv
	6t6TuHIPuCj8QE/o5wHfVrWVUXuyQ50fvZVTIXtVhSHJF5RwIxeifpol2f6e19FCGFnzr4cPeuKGM
	/BBzUpRVfWtO6I96eTbuejFIrzH8Yu2UJQPCHOm3sBA+DKUjKLY/2uYO4oHQ+/LYagriAznnCZ+Cr
	LrYKyl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zUk-00000001P1e-27gQ;
	Wed, 15 Oct 2025 11:16:38 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zUi-00000001P0v-0x2s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:16:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FBGXeH1740850;
	Wed, 15 Oct 2025 06:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760526993;
	bh=Bis6a1wlF8kYaFqIpcDHDYpUVxg0GoC2tnUOAX6rrV8=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=UoDvdrNEXNBiVaAnqEefl7YcpzHKMHjAEoqNksiEgnRsyyd8OtBcFi7ZlBnGTtMc5
	 ESkd+x/bhid6WFpm1aPLvlaTgZKHX+WxIWJ7ga3+eRWzX8ub2DEXemYQ+U7wJiyKJZ
	 TJ18MXo39HAj0+s7vXlWyP7xq9VqOthwLQj1vgi0=
Received: from DFLE202.ent.ti.com (dfle202.ent.ti.com [10.64.6.60])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FBGXx31181400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 06:16:33 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 06:16:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 06:16:33 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FBGTHc1811397;
	Wed, 15 Oct 2025 06:16:30 -0500
Message-ID: <f815e16805a5a7f7a04dc3158addbbd364447d36.camel@ti.com>
Subject: Re: [PATCH v3 0/5] TI-K3-DTS: Cleanup CPSW DT Nodes
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Dominik Haller <d.haller@phytec.de>
CC: "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
        "kristo@kernel.org" <kristo@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "srk@ti.com" <srk@ti.com>, "s-vadapalli@ti.com" <s-vadapalli@ti.com>
Date: Wed, 15 Oct 2025 16:46:36 +0530
In-Reply-To: <1b2b23293b01cec8161bc749bb864b18b3d41678.camel@ti.com>
References: <20251014125349.3408784-1-s-vadapalli@ti.com>
		 <df6acbfe5d30956ed66e2768fa595c36d2ebe98a.camel@phytec.de>
	 <1b2b23293b01cec8161bc749bb864b18b3d41678.camel@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_041636_352875_A839941B 
X-CRM114-Status: GOOD (  18.82  )
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

On Wed, 2025-10-15 at 10:28 +0530, Siddharth Vadapalli wrote:
> On Tue, 2025-10-14 at 17:07 +0000, Dominik Haller wrote:
> > On Di, 2025-10-14 at 18:23 +0530, Siddharth Vadapalli wrote:
> > > Hello,
> > >=20
> > > This series cleans up the CPSW Device-tree nodes by updating the SoC
> > > and
> > > board files to keep CPSW disabled in the SoC files and enable it only
> > > in
> > > the board files.
> > >=20
> > > The following is a summary of the SoCs, CPSW instance and the Boards
> > > that
> > > this series affects:
> > Hello Siddharth,
> >=20
> > please also enable cpsw3g in our k3-am62-phycore-som.dtsi and mcu_cpsw
> > in our k3-am68-phyboard-izar.dts.
> > Unless I'm missing some other patches you're turning off ethernet on
> > those two both platforms too.
>=20
> Thank you for pointing it out. I will include them and post the v4 series=
.

I have implemented the feedback and have posted the v4 series at:
https://lore.kernel.org/r/20251015111344.3639415-1-s-vadapalli@ti.com/

Regards,
Siddharth.

