Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B628AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/Owhr//HyiKIqL7/U5rQbAgBbQdC2z3Ac5xKTuO6zs=; b=HIChLypbrzzry2yZac8J2HYE1Q
	8cQ/Vdou4HanYvJckYCjBPdB4s+GKhW4blHi1WRqyFiPRIj1By+FBQ4OyVfe1oKZwO+cI4IfxcFy5
	gVq+38UdGj89gnvFydgaZSMIB+bdZzF3qKSie8Q+UugW0vewV+eP552SiT0crPIXbV0hCaSKwe/d5
	ic31t+8fCERPA+hvnxuhJUbaiOBkhykJvUyUucdb+wqE5NxSqdEQMsM03LHBKANfNwRR6587y4rs5
	8h8Pz3haRstTPVc8fdHyM0uHYTvxy6RSxJ6Ovue3zfj9vGER2nj+rnI+NL8/TDHctZoyfA/oM8L8d
	PXtC2aOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVtB-00000008ZHM-2U8Y;
	Wed, 08 Jan 2025 13:14:25 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVSH-00000008Tp3-2wcm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:46:39 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S7TW008396;
	Wed, 8 Jan 2025 13:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=k/Owhr//HyiKIqL7/U5rQbAg
	BbQdC2z3Ac5xKTuO6zs=; b=u+222eb6IRU84rOdobLv4zvXbz9vCeYzMO/OV/NT
	Z1w+sXnsAJoRJeR53GkDlCRiiDhAbZIt5F2QU91gKvzgvD04NfOUObaMvf0p1Wdv
	3en+DH04GTdWX82bzf2HmN97+B+pvaonsbur68tyZAt56P8QF3KGUMKXiDFtpGrw
	Ml/N0zVkDZFbKOutfjSrSFoQOUYE5wgXoOd4FCGiYI5DP4Z4OdYY2bqrhR4c2UWy
	EjDacST5H03g6pFev/AXpgVJdAEKndj4RNAsRzeDRQLkZbjpeAmX9uoeN9I6wA+A
	ZUYKeNfGl5d2xSeNP9PEmTwLD8NJyyhOxaUENOLdrvvByA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441m7t9gj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:46:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2403440044;
	Wed,  8 Jan 2025 13:45:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 591DE262B18;
	Wed,  8 Jan 2025 13:42:12 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 13:42:11 +0100
Date: Wed, 8 Jan 2025 13:42:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Conor Dooley <conor@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <20250108124206.GA153605@gnbcxd0016.gnb.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
 <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
 <20241218-yelling-palm-da676b67afb9@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241218-yelling-palm-da676b67afb9@spud>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_044638_016378_06BC20E9 
X-CRM114-Status: GOOD (  14.25  )
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

Hi Conor,

On Wed, Dec 18, 2024 at 06:25:11PM +0000, Conor Dooley wrote:
> On Tue, Dec 17, 2024 at 09:12:55PM +0000, Sakari Ailus wrote:
> > Hi Conor,
> > 
> > On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> > > On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > > > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > > > D-PHY.
> > > 
> > > > Remove the bus-type property from the example.
> > > 
> > > Why? What's there to gain from the example being (seemingly?) less
> > > comprehensive?
> > 
> > As the device has D-PHY, other options are excluded. I.e. that property is
> > redundant for this device.
> 
> That should be mentioned in the commit message.

Ok, I'll push a v2 with that commit message fixed.

Alain



