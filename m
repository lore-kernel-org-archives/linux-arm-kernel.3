Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D05E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApqDR59Bz5QrChxrwP0ZQ76X6NNQKG7JHxhDlDsT6xg=; b=kpN6htdJI9oKVKt44FhNiJOk7/
	f+lrZCfuSlaCtfll6SEed6NPpRug1keHQJUu1x9Jsb9Juc1+ento8IdYAL2Pb3FdozaL7OQ2cpvwX
	YRQ/Hcs+pxoznOKX8ygrazITgVAO1QJ++0PJ525yyFkGqlXXahpdydcBqOqUB6iz1bqRXfQ2wDoZ0
	sSH1lMI6kSCUwQbDzZsecImYg+iKZpXdLgabJLNXKiZ5M6NFPzQeP9hOtHLjoFuEWX+PCU3eySx6w
	Y7si7l4nBPPwkOcZBqY9yrBgf9w/drlJRTTl9Pqhz9LXbCCtzGY+mUfUuZqRYWnXapJCaFJUrWIHl
	mmfvhA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeHD-00000008725-0PFV;
	Mon, 09 Dec 2024 13:58:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKe9E-000000084oh-3rSK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:50:06 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9B746e014441;
	Mon, 9 Dec 2024 14:49:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ApqDR59Bz5QrChxrwP0ZQ76X6NNQKG7JHxhDlDsT6xg=; b=7ms22kXMThn6fbqu
	Pj2D32hgbWhnMDZPVblSImuZilEYvndYQRO1UaFtORMRtiw+8MFbl56IyRITe/wP
	1GRl/wWnhOgFRiJvweVAwGoGbUAPapi0fIACBsr7ZwAUeNmMh+gMFLyEpz0pZ2xG
	ffHlCD2TqihEzkbk2oHGTZN/5su4S7PjrDbNxkuRmP5KVmVRgqVxB6TcHmL/GTdW
	iPc1tX3Dt8EHfepoeYZBizZQVS2FfcdLiZQn/4RyzS1fXrLHy2dUrKpx7hJXgM3g
	shS1JQ8KxC8EAX+7sB3UjvsWIUdamGoeEYhYgEK/Lir86b9QUEy/KtriK1aAVvdq
	ObI89w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccc8r42t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 14:49:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E61F40053;
	Mon,  9 Dec 2024 14:48:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 078CD27C4C1;
	Mon,  9 Dec 2024 14:48:49 +0100 (CET)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 14:48:48 +0100
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Mon, 9 Dec 2024 14:48:48 +0100
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
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Thread-Topic: [PATCH v2 1/2] firmware: arm_scmi: get only min/max clock rates
Thread-Index: AQHbRapDJ7ccjxlxv0mHV7BZdhy65bLdr4SAgAA7caE=
Date: Mon, 9 Dec 2024 13:48:48 +0000
Message-ID: <22ff786d1e034169be21ef7dc32c4a3a@foss.st.com>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-2-etienne.carriere@foss.st.com>,<Z1bHgf_4qqZgSnDt@bogus>
In-Reply-To: <Z1bHgf_4qqZgSnDt@bogus>
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
X-CRM114-CacheID: sfid-20241209_055005_240607_11FC5771 
X-CRM114-Status: GOOD (  19.44  )
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

On Monday, December 9, 2024, Sudeep Holla wrote:
> On Tue, Dec 03, 2024 at 06:39:07PM +0100, Etienne Carriere wrote:
> > Remove limitation of 16 clock rates max for discrete clock rates
> > description when the SCMI firmware supports SCMI Clock protocol v2.0
> > or later.
> >
> > Driver clk-scmi.c is only interested in the min and max clock rates.
> > Get these by querying the first and last discrete rates with SCMI
> > clock protocol message ID CLOCK_DESCRIBE_RATES since the SCMI
> > specification v2.0 and later states that rates enumerated by this
> > command are to be enumerated in "numeric ascending order" [1].
> >
> > Preserve the implementation that queries all discrete rates (16 rates
> > max) to support SCMI firmware built on SCMI specification v1.0 [2]
> > where SCMI Clock protocol v1.0 does not explicitly require rates
> > described with CLOCK_DESCRIBE_RATES to be in ascending order.
> >
> > Link: https://developer.arm.com/documentation/den0056 [1]
> > Link: https://developer.arm.com/documentation/den0056/a [2]
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > ---
>=20
> [...]
>=20
> > +
> > +static int scmi_clock_get_rates_bound(const struct scmi_protocol_handl=
e *ph,
> > +                                   u32 clk_id, struct scmi_clock_info =
*clk)
> > +{
>=20
> This new function seem to have unwraped the scmi_iterator_ops(namely
> prepare_message, update_state and process_response instead of reusing the=
m.
> Can you please explain why it wasn't possible to reuse them ?

Since we're interested here only in min and max rates, let's query the
first and last rates only. This can save a bit of useless transactions betw=
een
agent and firmware in case there are many clocks with somewhat large
the discrete rate lists.

I though using the iterator for this specific case would add a bit more
complexity: it's expected to iterate (st->desc_index incremented from the
common scmi_iterator_run() function) whereas here I propose to send
only 2 messages.

BR,
Etienne

>=20
> --
> Regards,
> Sudeep
>=

