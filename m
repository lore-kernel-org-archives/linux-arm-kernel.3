Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7C8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=; b=1ens0jXyBB7DNaQeP7X3nBSbkj
	1gRR4aXRTlwkS6xlVhcgC153zmNEeMbifcmoYgFZB+IYZgRB0wtqlsIOtZ5xGDjjSIeWnu1RmUCYa
	v7zvnGPOp77ivH+EWJ/oFpJ+QamStql0CVMFU/2TEoKthg5fdLdWNK6j9tYbrlagElvcGRZB0kVcS
	Hbn1QOghD5WCOCXwIVJfELUTz7mO+loVg0czoYpk9jPnbz7m/6Pi6hBr0JjWouagcwmOuC5K5byBO
	tRgfAzBy2uCKbPGjmjZQFanP6IGeLcdFi6DKvk1OHE1mBdmOGIDOFyHHr36/y6QAoV1023mmBS6SU
	2IujxbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxs1-00000006nUh-02Kj;
	Wed, 30 Sep 2026 17:13:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxrz-00000006nU4-1Kdf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=; b=ZrTpgbPio/bd4P7+9/4anpdqqZ
	8yK5T1a0a5GIIx2c6cIkgnK1sUcSrwrq+JPjLGSpZqti0uozS1yDtX4tf6SqfiYYlAYt3MDfwOA/W
	BhcCJClfVoh8kSx+0OqGUeSs0zkCIL54ohoQZQW88jB9IXxlyLyWeJ5PKow4Fvvt/Z1Bk6T+cOep7
	k9Er8DaGjJG1N4MvmZmfo9yyZx+vlmsEfK6LIuu1TT1lNY1xctUU9xlRViY35hyJbahV+o513swPk
	+Hhu/XXBoFSVLVQVgAXeWj80JXXMGF+koDO54xfQqwmhvBzv3iCcp8/V36dJi/ALeIiEXknXTnpHs
	3TpkkO9A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBxrw-000000047lp-0n89
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:13:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE03Q32970672
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=; b=T9GCeUXwxuB0S8FV
	7hamSltKIsDOypIJKVts7D13C1aYuJU0nUA6dP6NsWPFldrG4eCrcR/nd7Z42sCT
	Lw12RNy7k1N8b3kpBkyO2NS1wWHfCL5fPDoJ2dv8yX+uY+WHW+GynCYA/KDdK2QM
	a1b+IM+8jUAgSgMukGkHma/7gQzfXoOngSV5Xw9eH+caoEKmUZgWXlels+OM4IU+
	XDRkoymieASsHv5V6DZbcruNx15kSRrdfrTo86Dd2FEf28+nLiBSqhbh2D9JF20U
	7Y2Pa+ML8Qc5HUaowjQ2Hbz9bidKsJzoi3e/4rqmt/bMlb6ANn4+yZVGfPG407Od
	Qj8dkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhem2jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:13:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso9095550a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788399; x=1791393199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=QniW7JYhiGNuRjn16YPOzEMzqpF1z3+FY+YQaToaz+lw8ovu2krtRNnhhsgwh6Ax/n
         qwdn1aOXe726U3+TlCzeRBZCP4dj3CJ5TRF0WgEuUQj1HltUNbSFqEdSDZx4vvP60tXe
         iarEHtQ/3yEddiVqwKpu4yEySQL9TTySvdmgsQid7qjb7dkAeaz50VeKNZ7e0Gd1r462
         OP8fcicl4IYUAVrQJzxudJcH61pYbHWX9g1khA/6RUSNSaAXuomy6y2IxxFXSEHHvAHn
         6AyF+74WkcJWpop+YV09Q+iGNvDV9TpmMM8jIvX67QIp6O477bjEmXuPhoP7uX5ekwNA
         Ij8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788399; x=1791393199;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIlPm6pWDwXvYMREQpH7upT+sWXfZsWEKBokElxA+N4=;
        b=pILC8Xf0qd3GqMNCx4/e3qfd9dZ1NjZsAHHxg/VgpWgTEYC7oWCMa/6OngQNRB9pDZ
         oeEejqqEAocs71x9xXslGzBdIVNyHFEXmahOpxJ8INKjRIyEdxV3CX2hjMWH1yc+CJGp
         SY5y6aSA5l2Gi4WhpWpf0NXWJ11Jon/U4ZKp/p/e8iwdiNjqIkPBHaFiayM8bmM9tA+y
         xJRxDxzYlgTFbH8HiiZT5yULO492TXltkhMFMzIBnD7P4xXOwZzWyJwENLXr/eonimi3
         OE1hEocKxS0nSpkhzmLBeSRYHaXeztOszWHaflozy+YnH7GNr2v1PPxFcOFr1t+1t5zA
         3vwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPjhGieAIVcuF8UVg51h1CAH4pdZZjtYgSlVzRElDxV/urZfW/bty5Sr/Qihr+lzWIiXrokQdzR1w7S8Dj0i5T@lists.infradead.org
X-Gm-Message-State: AFq9FYK8AAr/5MURXPoNmRzpWRwhlCEOd/sIkXKtaJ+qOBqIwa01zsfn
	9vVj2+I/yyrvTXSS9Dai7hXhHMawtivP36u4Bnn7fXZC/idMzC5/+8atLLru2l2HaZ+Xdjevg44
	G+dk/x51Bfq1tbQdr3CEG3h+baMhoYPya7ZqzwM8ZzuePEI1uGpn9ch42e8DHEvrc3+VWgYELUs
	MH2A==
X-Gm-Gg: AYBFou1kcG0T50vT+V73AW7LvTySaX4qb5XwZDFExYpx8S3yzRuCkMwWIIRuL0NvyEO
	GGU+3sksXlDVFSzUuvFlgBJ4sBPWJvTE9MPAekuzUscpabZtlpX7FWvPRI2UMnoqCsMtVZg3oaZ
	PPeTiCFyJTl6PNYqqWVBMlJF+x010QAklnzd02HOtt3CKJvcqqJHM/ckusAC8j6EIt6Nn05oaBv
	NSEBvi1xEJYz5R1pOwqz/GcotBLyFyWxQPkHK2OTNPsd6WWMLTXyar/mP4mccnw3neNziE2T5KF
	E/w96e8XijzJJNZ0igMIQyXfWu91M+uRh7BcGXZdecUSLPL9vuBCee1gwuItOyNskK4ipXVqZJl
	11QqpRq/9ZZ7hq7a7Z7csVrbx+NnPh2u9IETZwWNgmJH+ZrJNlc7CixU=
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778302a91.55.1790788398662;
        Wed, 30 Sep 2026 10:13:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8e:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4d1913daemr1778192a91.55.1790788396385;
        Wed, 30 Sep 2026 10:13:16 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm199420a91.13.2026.09.30.10.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:13:15 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:13:08 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier
 <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas
 Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun
 Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van
 Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <20260930101308.00002fb5@oss.qualcomm.com>
In-Reply-To: <arqSqcoWAkhy-8do@red-moon>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
	<20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
	<arZDwutoadki7tiZ@ashevche-desk.local>
	<arZNL9BnTGK0Klwc@red-moon>
	<arZS4vwxps01dGb7@ashevche-desk.local>
	<arqSqcoWAkhy-8do@red-moon>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a4xG9RYEf1BHlw5plFvT2M74K5q2x-a6
X-Proofpoint-ORIG-GUID: a4xG9RYEf1BHlw5plFvT2M74K5q2x-a6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXyHdS3GS56nkd
 LDJDNwsgav5fF1ucpGEDt+wi9myGu7o7LAmbnG8bnmBuXMfwCSLLu1xFcXpCbi8piAdLxC28knK
 AUsKUvwRrrkc/CXu80eBX+HpmyPywu5uk1o6RzIaVPI7hm2myRcPGWt5BdiewtRgtlUxKmp9uJ+
 vRJ/S67lnhx1W85pj6+1nwcFoVoqWxDdGiMW20JS0vXGDZLuhR9TWH/P/6HItTBAmoYuUzdFMhd
 FvPYdqwOrk7Fe7KHK8Q+d9rnsjlANAPCZgaLYToBelQyDs4XTiFKmTGut4GvWjeLgorCH6jS6ND
 IkQ5NWQhuvQXkbPGNVpYUrrULFXlR5xHWqpLcuiWajiBeJQ1Ys91JGx0rSEpc41EV+9AlFUqnsd
 aP6TAC2EVnerC4d32FZ77XTlKXH+AjIkXEbC62DhlLo17vIEx/RpNF+CJ7RC3JpgBZtI5YxOt4X
 1e5UIo7ZS4lwfcWdZaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXyUrEor9GDcTH
 MMmtEcw7t9DSEUpSPzi/TUgwRB3VKl2LfNzzOAyeurOjYSwid2oh9bu2MEuucjZITIJO52bl7uh
 5ipNFvVnk6a1gQJKJHBJ5dZ6rAzYMqg=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd432f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=u08uBHW3MJJG4PD1gAcA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_181324_526260_558A2B7B 
X-CRM114-Status: GOOD (  49.42  )
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

On Mon, 28 Sep 2026 18:15:37 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On Fri, Sep 25, 2026 at 01:54:26PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 25, 2026 at 12:30:07PM +0200, Lorenzo Pieralisi wrote:  
> > > On Fri, Sep 25, 2026 at 12:49:54PM +0300, Andy Shevchenko wrote:  
> > > > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:  
> > 
> > ...
> >   
> > > > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > > > +						  const char *propname,
> > > > > +						  unsigned int index, u32 *value)
> > > > > +{
> > > > > +	u32 *values;
> > > > > +	int ret, count;
> > > > > +
> > > > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > > > +	if (count < 0)
> > > > > +		return count;
> > > > > +
> > > > > +	if (index >= count)
> > > > > +		return -ENOENT;
> > > > > +
> > > > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > > > +	if (!values)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > > > +	if (!ret)
> > > > > +		*value = values[index];  
> > > > 
> > > > Use standard pattern, id est
> > > > 
> > > > 	if (ret)
> > > > 		...
> > > >   
> > > > > +	kfree(values);  
> > > > 
> > > > You want to use __free()
> > > >   
> > > > > +	return ret;
> > > > > +}  
> > > > 
> > > > I believe the whole approach is suboptimal, if you wish get indexed value (but why?)  
> > > 
> > > Why what (that's what the irq_get() interface requires ?) I agree it is
> > > suboptimal - the whole point of the series is an RFC on using properties
> > > to store GSI number/flags, then how to read them we will optimize it
> > > when/if we agree that's the approach to be taken.  
> > 
> > Why to have indexed APIs. The callers usually do not want a single item from an
> > array, they want all of them or a big pile (exception is the array of strings,
> > but we have matching functions for that).
> > 
> > As per approach, this patch is against device property and I don't think we are
> > going to agree on the approach taken in *this* patch.  
> 
> Coming back to this, what is needed here is a way to stash the GSI number,
> flags and name in stardard storage (like OF nodes IRQ properties, ACPI objects
> _CRS, etc).
> 
> To give you some background, I thought about adding an array of:
> 
> GSI [number, flags, name]
> 
> to the ACPI static fwnode itself. Then basically the irq_get() API has got
> all the information it needs from the primary fwnode; while doing that I
> thought that this might have been a bit like reinventing software nodes
> (granted, software node properties are ways more general that what I suggest
> above and I don't expect any other property to be ever added to static fwnodes)
> that's why I put together the series as it is, precisely to understand what's
> best.
> 
> When you say "against device property", what do you mean precisely ?
> 
> I suppose you mean that this approach goes against software node properties
> usage guidelines ?

For what it's worth I like it.  Clean (ish) solution for a messy problem.
May well be some details that can be done differently though.

Just to provide a counter point to Andy :)

Jonathan


> 
> Anyway, again, it is just to provide some context, we are talking about
> a bunch of platform devices, it is nice to have a generic solution but
> it has to be simple enough too given its scope, I understand very well
> your concern with this approach as-is - it is there to find a way
> forward together and show what the problem is.
> 
> Thanks,
> Lorenzo
> 
> > > > it needs to be retrieved as that in the guts of ACPI. Allocating memory for the whole
> > > > array to retrieve a single element is simply wrong.  
> > 
> > ...
> >   
> > > > > +#define ACPI_IRQ_PROP_GSI		"linux,acpi-gsi"
> > > > > +#define ACPI_IRQ_PROP_GSI_TRIGGER	"linux,acpi-gsi-trigger"
> > > > > +#define ACPI_IRQ_PROP_GSI_POLARITY	"linux,acpi-gsi-polarity"  
> > > > 
> > > > Oh... This sounds like a big ugly hack.  
> > > 
> > > That does not help much I am afraid.
> > > 
> > > What's a ugly hack ? Property names ? Using properties for this purpose ?  
> > 
> > Yes, properties started with "linux," for some core functionality.
> > Yes, using properties for this also doesn't sound right. I think the problem
> > here is in the table specifications or somewhere that deep. That's why we
> > ended up in this series.
> >   
> > > Again, it is an RFC for this specific reason and I mentioned that in the
> > > cover letter, thank you for your inputs.  
> > 
> > And here we have a discussion started :-)
> > 
> > P.S. Looks like I was too quick to jump into this thread. I will wait for
> > others to share their view on all this.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 


