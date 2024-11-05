Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A400D12660
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agzLPwjtyIVcmji+qBbiwXvdNNXbwTGcuXy/vqd4v6s=; b=EktPXixmbQdQWKPQUvz+5gUM9a
	BCxgzx90FrQIdaXaIdHZs4/xtePkl3p2K8VaQD6xteBHFBTWmL/SZoa1C7+w0xzZbDsqk8YO5kg6l
	VgZ6rV2LMve/2gBpioRxwrLIHno0tItSTpMDqQjFkuGiZG0VzWbzUcXu5CG2i+o39n7omd0B0qBte
	luAVZPXOSMjGxobnzRw8E7w7U5JSQuUE5mCyvZ5x/I9hI+oMxZ/Bja81qMCZa90UWCU84ODOvCLgs
	+Zni9LUdaSLOa5BgTvb/p+F4FJIFtnD2Jqb46MoYWwxTrgwJdMXhkFmCM8ivaMzJJlm5DBI1UbG9+
	yQtGFjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EKE-0000000GETE-0lzV;
	Tue, 05 Nov 2024 07:50:06 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EG0-0000000GDra-0vRJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:45:45 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5135JP023435;
	Tue, 5 Nov 2024 08:45:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=agzLPwjtyIVcmji+qBbiwXvd
	NNXbwTGcuXy/vqd4v6s=; b=vobLQDZD2qNGcCFGeAPMOcHK1jX8XoKA7p8EXbY1
	K7TkP1GZ/Fzwiy/clo5SiJKmvNeb6qiX5w3W/3e6ZxBG5qODvF508afDzJqHD0tc
	LrZOPaZCFE1c5SaMzhYqES3dZrBn9vofv553ZFRnQS0xauUrqqIzPwRPjQqPDTwM
	2TFw89arm5o/X1LQUrsIa5ef3G6WKEr5GgMiCKtPDE37F6dV44I/iz6CCoH7ovF4
	WReqn0nR6pjMgPzFrpiKjDzG2XmdLvpaQS1IUYr85eACNf7eihE0WiTBETdLCZjE
	HzZrLAXv6VNCjPoCp3MgE4NBdxP1P3ov4vc1JBNSX2blBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rmc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:45:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA23B40047;
	Tue,  5 Nov 2024 08:44:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DA3824F7A7;
	Tue,  5 Nov 2024 08:43:23 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:43:22 +0100
Date: Tue, 5 Nov 2024 08:43:21 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 12/15] dt-bindings: media: addition of stm32mp25
 compatible of DCMIPP
Message-ID: <20241105074321.GB1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
 <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_234544_582724_B2A4A9E6 
X-CRM114-Status: GOOD (  19.92  )
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

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:41:59PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:14PM +0200, Alain Volmat wrote:
> > Addition of the stm32mp25 compatible for the DCMIPP.
> 
> "Add"
> See submitting patches.

Commit message corrected in the v2.

> 
> > The stm32mp25 distinguish with the stm32mp13 by the fact that:
> >  - supports also csi inputs in addition to parallel inputs
> >  - requires an addition csi clock to be present
> > 
> > The commit also adds access-controllers, an optional property that
> 
> "Add", see submitting patches.

Here as well.

> 
> > allows a peripheral to refer to one or more domain access controller(s).
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
> >  1 file changed, 47 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > index 87731f3ce7bd..bda28fef0b78 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > @@ -10,9 +10,40 @@ maintainers:
> >    - Hugues Fruchet <hugues.fruchet@foss.st.com>
> >    - Alain Volmat <alain.volmat@foss.st.com>
> >  
> > +allOf:
> 
> Please put allOf: like in example schema, so after required:.

Done in v2.

> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> 
> Best regards,
> Krzysztof
> 

