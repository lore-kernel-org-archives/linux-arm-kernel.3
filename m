Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11CCCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=; b=Dpc3yXg87imrrvCkC6wApPvN7W
	8rZm+mVofNbESEHMmDDi7U6+Mb2B4wqpNjZKcrcXOhrq2EJcWuHcfc2HJeShYlDIfid3rofxQ8o9K
	VW/YtZeO3o9rGt+uPgZP9vjTX96zQrMIdbdxLwg6IbFq63QZ8YKf1dxptRiTMCqnb52QqEHOgLEAv
	BXGIPpc+rGquRmVxX+lghF7Rr2w1vhtveGvC41Xz9tfqh1AytL7z3PTbuyHlYQ2+O2dKgnqIQHmTW
	0UV1bXAW5M3dELsLDSNUIo1wPSfRyDUbLcVAs2kIFWiJhrj+0QQreB10QKeHRJ67SAzpD0tlaiHlc
	bZgqpNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBiKv-00000004peZ-1Ol3;
	Wed, 30 Sep 2026 00:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBiKu-00000004peH-0obK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 00:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=; b=IkwAK3MZEf/mYEzFG7boyZ9cIt
	XU/XEIc0CnGV8c8am1EhAGTSA2EN+fUgtAZCURpObmyJ5W9yJjOMpn/Vr9zLMdth9/OQBxk4SMkMF
	ctD7r/nUqnsTGHmL0GdnxllL28hsMERX7f9KhA/IA/EcrVVmpnIEzhYCYYMh6JYPbPfC9HyQ4nCYW
	BTVtFqoFBIwagzBAU2EqM2vbHG+wflkNHJZRk7DJV3Yhat5HVPhW68mkPo2U3K+cjZYEDQJkhrLXr
	G171pTyJcftSvV6hghPP/pMUI5kfTIydKdV07fDxmgxCM/PeNRVJzO8jH46Lj12Ghcg9+nnxNEU5S
	xeVXdSVQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBiKq-00000003DHr-3PPK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 00:38:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPe6j2250067
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DihlMyvHEyVrVer9hDXtw89b
	IAPj1z5S1SGkXU3ZFzU=; b=a5CGJ63sjO8ovHEMsXAudd/im6jBlkmBPClNu3/A
	3DUskr40A0eTyQkOcUh/Qvn2KJ/9P8JF2DOHpoySV5rmce3213gAGsfFPfYctJqN
	ck8RXSvaGxPSc88VpB/6g6v4xePBeD7hqrslAwaXG8HyW0f9kscfOK+fO3Cnp0il
	iw1LBbaH09sPHRJhBqkQWIIX2rV/IouRt0JHAew80kEHFeEhsRpPv8nl2MY2qJvB
	I2RYLgM8BJ4D7EFq+ryaNsHt/jzGuOEI3jmHote/9Wue4mVPlC8nD43zVNfm6c8M
	jFQW/g9La5zqpIVvFL2sP5Alm1lxkKdHgrSvXSL1xvI8Cg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3gest-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:38:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so1342120c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 17:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790728688; x=1791333488; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=;
        b=OMdy6iwVBFA6VOtb2aggTtgwXG+DtIqcRGbYM6M3mTIdSGGrX4Hq2XJIC2PWpa7P7o
         oOud1WL5JyAyTD43le1REtew29uwYMygyIuhl3eVK8zyJA7mZ7aDxRoF/GWUMjlkWqJ+
         KN1KSOsoeavevoE8FQBRpxhZ2fW1Dp8nfsMwUU7x2w0I9hhNsrGYvHfAy0MhIBEzOgau
         bxbFrzJwBK8LBNhSbeDG92U1Hs/7JbvH5pJe8ydqAeKL7zfx052H9QGaHzm51ZjSC6WA
         KXK5WZh0UDFc91SuxUgYlGjuTlEWVo0Kxbt/B+hkX48EMO+YDh7M8++pfl6BBeL4KtCD
         NwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790728688; x=1791333488;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DihlMyvHEyVrVer9hDXtw89bIAPj1z5S1SGkXU3ZFzU=;
        b=aGfXDpRm5dEQHadEe7aLWeMlCPp8qCm45iP2k7dzepBngdSwzmGJ6F5F5LRdgPwTYV
         m3YatoAvPbD4fPcS8MWzbI/eOUEpBAtCoPg2cS4KFIW0O/RVujYIvrBgyqZ90uxCSXd3
         ULE61UUNRiPJNcLuqPAF6tZt4lcaFG1rWhiKdYOmlHcwCw73VoyKixJuoW58j56FQ2ov
         vxeOC5jGwYWVQCqk6i4Ran6KPapP/R7Rnqhikzz8DLBosmT5Axh/qoXxl3gPQEz5gniF
         JlIE2vUqAQ50+arTY7xn35edeI2a7AxzIikywu25dGeoJDI2d/e0wBHO3k67jIOwLZ8P
         2rQg==
X-Forwarded-Encrypted: i=1; AKwUvBzL4ErP9x8ettS31tmL78QhVrpDneM/gZsm86TCeaVKTFbhugyDXUUwPb0iCdDzgGmTZkKSBn9ytgLMhV9y8t/P@lists.infradead.org
X-Gm-Message-State: AFuF++mXwiSi80Q8fAgJrwkF81ugd8QvNzod3qWpB4c2f7oBSvzat+OU
	bI9VDGLYxX4ra1qez4zhBlQMv/slHFcGnwTHv35+3alIXIURKL4ol2778zJZ0mcRnmij+jjf1ns
	tqy9B7igNhZSzyeQncUYxhLO8f2yKb/4UX6wBRz12VHyJbhP4F7L95v5GWXfAY9UV/4muOSnty4
	FzcA==
X-Gm-Gg: AYBFou2yR2tzloqFDVmj8sJySFK/e7DovJhoYI0v9hZE3YBLWNNHQRcjxtA/5Lkpeec
	GC/ZQbblfWHPJ8DrTm+ipfdkWx1y8oaKmth31h3IOAHRKCfyilAZqZf2bAs1x6G0wId9f+68r26
	ysvmtek10Z8nspg7Hn/2j5qmKRx1oZdQCYyyaT+zJj8Jj9oQP+EVyOk0T69tJk/oMJqFTCqLdzA
	bZYkTuP7lkh3M0XEMgoGUT7J7joXqhGZJD+ZiTrbh1q2d2RELkyWXYBaC5k7ZqIg8/J6Ox1gsa/
	8cH3QUjHFy2FyIUhlHLBJHEzPmKep3u9bEU2XfoUHie/3i1VWLkOm9NakPCXpau+rHesoXCidYn
	X44l9RsVonpOe/jZa8HTkecxFR8yCscxQBDcZ4QIo+XERGUDr
X-Received: by 2002:a05:7022:f401:b0:143:868a:20c1 with SMTP id a92af1059eb24-14ca00a17c2mr1398053c88.46.1790728687764;
        Tue, 29 Sep 2026 17:38:07 -0700 (PDT)
X-Received: by 2002:a05:7022:f401:b0:143:868a:20c1 with SMTP id a92af1059eb24-14ca00a17c2mr1397989c88.46.1790728686996;
        Tue, 29 Sep 2026 17:38:06 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55d41sm1917754c88.1.2026.09.29.17.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:38:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:38:04 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
Message-ID: <arxZ7BAya5ntRi6t@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
 <art5m5QPXAOAvkvW@red-moon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <art5m5QPXAOAvkvW@red-moon>
X-Proofpoint-ORIG-GUID: 2O0OrhX_qnzU4b0jvbMJhh5jLQvpJ-oI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAwMSBTYWx0ZWRfX06qj4KVhEK+b
 xzQJUf0b8H+kOi1DqYtvxW2P4Z1kxIdexVTl0RTh+UjoHFnTAFn8ENBWlMxPFCEoeTmqQUez2s4
 RqEB1/r8jZUOubo08doPz1/AmwCNqBTxKE9PKMWI8JszRU6PGxLSUECp2WEvhYPL23QtrxjlWT/
 cLTqOj337JohNA5dMEq519aGR4YnyZ7ABjdMs0TDOci5GYWB8LKIFy0aqPo+3T4Rx6xMsWdWlL7
 DO54aOYgCiUpMh7uCqNIX2edB+IhSWsXKWFWUZZrM/F1ILQwWcL1Hifsq5NcGiMZDYWw7MsFN8P
 ylfDXEDUfO+VdisuMoc6NKtZPhDdxI8NXFgMXSTwDCG3Lsr2ogXc5mihqgB0ejg614gON27U2ti
 /tVwFN3i3hw4YCdh4cNs/V0dKDwLDqpr2CNIffuHEBHEe9FM/pP/so8qR6d6RwAn6srFu6iq7wt
 h9jN5+CMdcaINwHNSrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAwMSBTYWx0ZWRfXyl9PRHabnvdV
 QRqoiUSJ30uVwZrBRFJM4ZyjBkxuRxmmB7rfLid37C5YUn2QQvq7wZRieMrhdwD4x94XkPlG/PN
 I7qi60gtfQ1WDRnMtUWiXeJzVfJhJFE=
X-Proofpoint-GUID: 2O0OrhX_qnzU4b0jvbMJhh5jLQvpJ-oI
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abc59f0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p-kz3MFidYKym44KqwAA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_013813_375870_93C572A2 
X-CRM114-Status: GOOD (  39.44  )
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

On Tue, Sep 29, 2026 at 10:40:59AM +0200, Lorenzo Pieralisi wrote:
> On Mon, Sep 28, 2026 at 04:24:18PM -0700, Ashok Raj wrote:
> > 
> > On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> > > To describe and map GSIs for firmware nodes created out of ACPI static
> > > table entries in a uniform way it is required to define some standard
> > > properties and attach them to ACPI static fwnode as secondary nodes.
> > > 
> > > Define properties names to describe GSIs and their trigger-mode/polarity,
> > > and implement an irq_get() callback for static fwnodes so that core code
> > > can retrieve and map IRQs for ACPI static fwnodes in standard manner.
> > > 
> > > An empty stub for property_read_string_array() is also added, so that
> > > the fwnode_irq_get_byname() interface falls back (through
> > > fwnode_property_read_string_array()) to the secondary
> > > fwnode to grab the "interrupt-names" property.
> > > 
> > > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > Cc: Bartosz Golaszewski <brgl@kernel.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > ---
> > >  drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/acpi.h    |  4 +++
> > >  2 files changed, 72 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> > > index 8ee5a1f0eb48..c609100c08db 100644
> > > --- a/drivers/acpi/property.c
> > > +++ b/drivers/acpi/property.c
> > > @@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
> > >  
> > >  DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
> > >  DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
> > > -const struct fwnode_operations acpi_static_fwnode_ops;
> > > +
> > > +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> > > +						  const char *propname,
> > > +						  unsigned int index, u32 *value)
> > > +{
> > > +	u32 *values;
> > > +	int ret, count;
> > > +
> > > +	count = fwnode_property_count_u32(fwnode, propname);
> > > +	if (count < 0)
> > > +		return count;
> > > +
> > > +	if (index >= count)
> > > +		return -ENOENT;
> > > +
> > > +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> > > +	if (!values)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> > > +	if (!ret)
> > > +		*value = values[index];
> > > +
> > 
> > You lookup with a propname, and then qualify with and index? is it
> > possible to have the different index but same propname? 
> 
> What is the question :) ? It is to retrieve a property value at a specific
> index.

Gah... I'm wondering what was my question as well :-)

See below: acpi_static_fwnode_irq_get() calls this read_string_array() multiple
times from within the same function.. 

Sorry for the terse message, apologies.
> 
> > Alternately you can send the list to caller and they can use the ones
> > they need?
> > 
> > 
> > > +	kfree(values);
> > > +	return ret;
> > > +}
> > > +
> > > +static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
> > > +						const char *propname,
> > > +						const char **val, size_t nval)
> > > +{
> > > +	/* Route string handling to secondary software nodes */
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
> > > +				      unsigned int index)
> > > +{
> > > +	u32 gsi, trigger, polarity;
> > > +	int ret;
> > > +
> > > +	if (!fwnode->secondary)
> > > +		return -ENODEV;
> > > +
> > > +	fwnode = fwnode->secondary;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
> > > +						index, &gsi);
> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
> > > +						index, &trigger);
> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > > +
> > > +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> > > +						index, &polarity);

For each of the above calls for read_u32_prop_index() the allocation,
copy a value and does free it. 

Instead you could read the whole array, and just get each value and
discard it once? 

> > > +	if (ret)
> > > +		return ret == -ENOENT ? -ENXIO : ret;
> > 
> > Consolidate return to one place? 
> 
> Yes it can (and trigger and polarity can be just one property "flags", FWIW),
> if we agree that's what will do, which I doubt.
> 
> Thanks,
> Lorenzo

-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc

