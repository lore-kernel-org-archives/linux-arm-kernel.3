Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8741E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTrjZtnsr0f8sYU+43fbvMOXAZ9kPaU3gQvDVsaA/9M=; b=eVnRb9MayzzSQDEXcb1WvoOEx8
	q/1vsuiWh+Ybsjp8P1OfR61FErgfSva9jH7QKX7Ef9Ohpx01Z6Ze1JcZfNvAPoQYiHUICweH6la9X
	BFWlIoZXdKo5s4UUaMt7Tka9QPrkJJoP/3YFuF8adojMLmBCw5XQcF3BdaoIw6pDONw9S+8iBkqBt
	lHZDeO/MgIFoZUSi8hR62EkDMaPEgqvKLkCe286OEhLC0tDZI7ZM928VCz6w9nMWLoqCtP6qUHA5Z
	F61jF9ddJ2knrOcP3XJ/3sveqmqYs95qkpvDr1Xf6S9mX6HDpwOpmRvL/YSKFPhQyCmgdRuqTcqsS
	x4z56B6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdhY-00000007wz7-2BmR;
	Mon, 09 Dec 2024 13:21:28 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdPH-00000007qfN-2eiu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:02:37 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9D2B0A004434;
	Mon, 9 Dec 2024 14:02:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bTrjZtnsr0f8sYU+43fbvMOXAZ9kPaU3gQvDVsaA/9M=; b=FqALfb43wGHL81wT
	c4sIcZ3284A8HcGlizDub3eGdJI8khgK0mEGqyFwYGeDTYn3qgpc26nj7UDDSG0J
	/kMOq/ERgjkq9Egw4Ll+Z1CUjx2U7+p6faLuYmvb4I3H+KoS/B8CZu2AhUq1xu0W
	ILS7InWxhyISlTcQM8tBo77iVdjQvstw8mKYwU+30jP+8T2utV+fD3jvKU7nbcwj
	sLQfTIG0u4pFilSQQRCOnFrPZ1ti9RSAB9/KwEi6MZ3YNpWf/JRc3eFy7MxLV4mV
	/9hJ3Wi/e+gXm2ab9kxK3i6tJmC086S5/OoTBV90PCGLqiK9DmHB9T7glFnys+om
	Bmt39w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43cek1qts4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 14:02:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 460C840047;
	Mon,  9 Dec 2024 14:01:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FC71277BFD;
	Mon,  9 Dec 2024 13:59:58 +0100 (CET)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 13:59:58 +0100
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Mon, 9 Dec 2024 13:59:58 +0100
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Cristian
 Marussi" <cristian.marussi@arm.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Thread-Topic: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Thread-Index: AQHbRapDtK1zP5F5+E+8H5T6eqOTIbLdsy4AgAAr30s=
Date: Mon, 9 Dec 2024 12:59:58 +0000
Message-ID: <ed164b6704ab4086b2fb22ae51658f31@foss.st.com>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>,<Z1bKlOeHJFHpe9ZU@bogus>
In-Reply-To: <Z1bKlOeHJFHpe9ZU@bogus>
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
X-CRM114-CacheID: sfid-20241209_050236_143987_D7ECBDF9 
X-CRM114-Status: GOOD (  33.62  )
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

Hello Sudeep,

 On Monday, December 9, 2024 11:46 AM, Sudeep Holla wrote:=20
> On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> > Implement clock round_rate operation for SCMI clocks that describe a
> > discrete rates list. Bisect into the supported rates when using SCMI
> > message CLOCK_DESCRIBE_RATES to optimize SCMI communication transfers.
>=20
> Let me stop here and try to understand the requirement here. So you do
> communicate with the firmware to arrive at this round_rate ? Does the
> list of discreet clock rates changes at the run-time that enables the
> need for it. Or will the initial list just include max and min ?

I don't expect the list to change at run-time. The initial list is
expected to describe all supported rates. But because this list may
be big, I don't think arm_scmi/clock.c driver should store the full list
of all supported rates for each of the SCMI clocks. It would cost to
much memory. Therefore I propose to query it at runtime, when
needed, and bisect to lower the number of required transactions
between the agent and the firmware.

>=20
> > Parse the rate list array when the target rate fit in the bounds
> > of the command response for simplicity.
> >
>=20
> I don't understand what you mean by this.

I meant here that we bisect into supported rates when communicating
with the firmware but once the firmware response provides list portion
when target rate fits into, we just scan into that array instead of bisecti=
ng
into. We could also bisect into that array but it is likely quite small
(<128 byte in existing SCMI transport drivers) and that would add a bit
more code for no much gain IMHO.


>=20
> > If so some reason the sequence fails or if the SCMI driver has no
> > round_rate SCMI clock handler, then fallback to the legacy strategy tha=
t
> > returned the target rate value.
> >
>=20
> Hmm, so we perform some extra dance but we are okay to fallback to defaul=
t.
> I am more confused.

Here, I propose to preserve the exiting sequence in clk/clk-scmi.c in case
arm_scmi/clock.c does not implement this new round_rate SCMI clock=20
operation (it can be the case if these 2 drivers are .ko modules, not
well known built-in drivers).

>=20
> > Operation handle scmi_clk_determine_rate() is change to get the effecti=
ve
> > supported rounded rate when there is no clock re-parenting operation
> > supported. Otherwise, preserve the implementation that assumed any
> > clock rate could be obtained.
> >
>=20
> OK, no I think I am getting some idea. Is this case where the parent has
> changed and the describe rates can give a different result at run-time.

This does not deal with whether parent has changed or not. I would expect
the same request sent multiple times to provide the very same result. But
as I said above, I don't think arm_scmi/clock.c should consume a possibly
large array of memory to store all supported rate each of the SCMI clocks
(that describe discrete rates).

An alternate way could be to add an SCMI Clock protocol command in the
spec allowing agent to query a closest supported rate, in 1 shot. Maybe
this new command could return both rounded rate and the SCMI parent
clock needed to reach that rounded rate, better fitting clk_determine_rate(=
)
expectations.

>=20
> I need to re-read the part of the spec, but we may need some clarity so
> that this implementation is not vendor specific. I am yet to understand t=
his
> fully. I just need to make sure spec covers this aspect and anything we
> add here is generic solution.
>=20
> I would like to avoid this extra query if not required which you seem to
> have made an attempt but I just want to be thorough and make sure that's
> what we need w.r.t the specification.

Sure, I indeed prefer clear and robust implementation in the long term,
being the one I propose here or another one.

Regards,
Etienne

>=20
> --
> Regards,
> Sudeep
>=20

