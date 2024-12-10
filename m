Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA14E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsJfbxvRKPhkYD3Gu1Y0Uqfw2QFPw3+5Ki1aYCTWF7o=; b=r/gQUfj6ca5cU9V197z3dMfF37
	CGa/p8xiPE5FAn5Hg23+8ZXCkik7y0pQ0lZ1mut2xkhyW871iUHdblShp/CfjfNTHu0Pdz4hLDQNq
	MJ/yy4Qq1yduqFnHSJ6TIoAqInbJOqnhnLZFpTwIj/6PT3AULOEsEEKht7KSSf56C8eUyDEiP2IK7
	Pf11s7LkUGC/dMlEnNppDJphSIMpiyDZ4avBoU4VVBIivdxgKHOoOjVR5hAMuUwJ9btWdL6lYlr52
	KrB+VCF+hPLjyyq9Tas59fLeOE5WW8JDCYKhq2ffLh14IASwrUG7ErkPgsG9m328oDUeYuBA7ZStB
	WeHI6WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKy0M-0000000BF0c-1rqG;
	Tue, 10 Dec 2024 11:02:14 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxxv-0000000BEbI-1xx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:59:45 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA67gMM032248;
	Tue, 10 Dec 2024 11:59:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YsJfbxvRKPhkYD3Gu1Y0Uqfw2QFPw3+5Ki1aYCTWF7o=; b=hzZQix6ZzR2cRc2a
	Yxh+Fw5/aUCb5N7ysP3gws6H++zlJottB4m/MNK7beWQq2IRun6E0FrNjprKn6nB
	lzGpYOrentJRtU2XTumE90hurYDu/nE2JBwliyeuS5GMv7JMQaYLEptCutsbzivT
	Vv/ep4xEPWcsQGeGDoelVfoNNzd5O9l8mZUmBaBiidBZIX1sfVyHs559mn54NLCh
	7tR04ROk3yJOHnAs1YjK8x6SkgnOROe8F6VX1x7xxR6OEJTJOeikxbCKYkLAX3BY
	oz4//BKehs7gjksYcxOUUE87St+CVjQUBuEr4WcUjseu+CjqcOh3TUI/1tL6ZBKO
	VvO8uA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43cek1v78g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 11:59:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C79104004F;
	Tue, 10 Dec 2024 11:58:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 500382444A0;
	Tue, 10 Dec 2024 11:58:06 +0100 (CET)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Dec
 2024 11:58:06 +0100
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Tue, 10 Dec 2024 11:58:06 +0100
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Thread-Topic: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Thread-Index: AQHbRapDJ7ccjxlxv0mHV7BZdhy65bLdr4SAgAA7caGAAEGOAIABK5nx
Date: Tue, 10 Dec 2024 10:58:05 +0000
Message-ID: <80ea462fbe044781bb4b1e7a80ab8b80@foss.st.com>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-2-etienne.carriere@foss.st.com>
 <Z1bHgf_4qqZgSnDt@bogus>
 <22ff786d1e034169be21ef7dc32c4a3a@foss.st.com>,<Z1cwTWQWamv3lywB@pluto>
In-Reply-To: <Z1cwTWQWamv3lywB@pluto>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_025943_838695_FFE87C92 
X-CRM114-Status: GOOD (  33.75  )
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

On Monday, December 9, 2024, Cristian Marussi wrote:
> On Mon, Dec 09, 2024 at 01:48:48PM +0000, Etienne CARRIERE - foss wrote:
> > On Monday, December 9, 2024, Sudeep Holla wrote:
> > > On Tue, Dec 03, 2024 at 06:39:07PM +0100, Etienne Carriere wrote:
> > > > Remove limitation of 16 clock rates max for discrete clock rates
> > > > description when the SCMI firmware supports SCMI Clock protocol v2.=
0
> > > > or later.
> > > >
> > > > Driver clk-scmi.c is only interested in the min and max clock rates=
.
> > > > Get these by querying the first and last discrete rates with SCMI
> > > > clock protocol message ID CLOCK_DESCRIBE_RATES since the SCMI
> > > > specification v2.0 and later states that rates enumerated by this
> > > > command are to be enumerated in "numeric ascending order" [1].
> > > >
> > > > Preserve the implementation that queries all discrete rates (16 rat=
es
> > > > max) to support SCMI firmware built on SCMI specification v1.0 [2]
> > > > where SCMI Clock protocol v1.0 does not explicitly require rates
> > > > described with CLOCK_DESCRIBE_RATES to be in ascending order.
> > > >
> > > > Link: https://developer.arm.com/documentation/den0056 [1]
> > > > Link: https://developer.arm.com/documentation/den0056/a [2]
> > > > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > > > ---
>=20
> Hi,
>=20
> > >
> > > [...]
> > >
> > > > +
> > > > +static int scmi_clock_get_rates_bound(const struct scmi_protocol_h=
andle *ph,
> > > > +                                   u32 clk_id, struct scmi_clock_i=
nfo *clk)
> > > > +{
> > >
> > > This new function seem to have unwraped the scmi_iterator_ops(namely
> > > prepare_message, update_state and process_response instead of reusing=
 them.
> > > Can you please explain why it wasn't possible to reuse them ?
> >
> > Since we're interested here only in min and max rates, let's query the
> > first and last rates only. This can save a bit of useless transactions =
between
> > agent and firmware in case there are many clocks with somewhat large
> > the discrete rate lists.
> >
> > I though using the iterator for this specific case would add a bit more
> > complexity: it's expected to iterate (st->desc_index incremented from t=
he
> > common scmi_iterator_run() function) whereas here I propose to send
> > only 2 messages.
>=20
> Yes, indeed the core iterator helpers are meant to issue a 'full scan'
> retrievieng all the resources that are returned while handling in a
> common way the underlying machinery common to all messages that, like
> DESCRIBE_RATES, could possibly return their results in chunks as a
> multi-part reply...
>=20
> ...having said that I can certainly extend the iterators to be configurab=
le
> enough to fit this new usecase and retrieve only the desired part of the
> 'scan' so that can be used for this kind of max/min query or for the
> bisection case.
>=20
> I would avoid to re-introduce ad-hoc code to handle these new usecases
> that do not fit into the existing iterator logic, since iterators
> were introduced to remove duplication and unify under common
> methods...and this new iterator scenario seems to me that has already 2
> usecases and certainly more protocol could want to perform similar 'lazy
> partial queries' in the future, so I'd prefer to address this in a more
> general way upfront if possible...I will think about it and post somethin=
g
> next week in the form of some new iterator extensions, if it's fine for y=
ou.
>=20

Hi Cristian,
Thanks for looking at this. Any help here is very welcome.

BR,
Etienne


> Thanks,
> Cristian
>=20

