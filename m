Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85311CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoyLUTFu/l3yoOpGw3lzvm9MjMkR2yyprPZj7j8euak=; b=ZE8ZXfqkZDBIhxR47tt1E1Bxo+
	fmwNYu+ONiPSy/hvY0GnQdHZtyFlVeOQEpbBCZ1QWwWHkJ1G17p+zGAkc/yCKB7JtmZ9+5nHyg3ML
	8RvwiyAx6JoqL25m38ia4z+YvFq1Z1Ym8AvVAv0NloG1KnaIXmwxOUh3pgaIW+k2/ECd1pk6odJV/
	dSDhUU6Q1gdNi5U0kL/JAfks4sfypwBEHDHXQZWOtrePapHCEy8HjN8T0N37OjowS5YlXKcP77bWH
	pZLzeIDSJER1glYlAv8Ul6M6mGtf0xNGMAAAt2HQFSb0sO10XIcyv2VI07U/ax+OdPt+WBZa0D1DH
	64gXpBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKht-00000001rud-2xAn;
	Mon, 28 Sep 2026 23:24:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKhr-00000001ruC-0U3H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 23:24:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SM8RX52878689
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XoyLUTFu/l3yoOpGw3lzvm9M
	jMkR2yyprPZj7j8euak=; b=cTQDzq6I4HSX4ZlHAeNmAhCMCdOj/sWlmJ7m1FL9
	eNWTMYNT15kB3c6fyTFITtUVfYylaXv3/vwHJ0s5izVAAfvlFCxeqvkUKscJ+B5M
	Nv3FWa9hd+hTqwhfOB1OZewjA78nzZUc8z21ljPsIOLAmfP5qZ2pW8NJjcDENs7w
	QaHSWzQvPF36T418WLedYkct63UBEk6VGSy3QGfz7dVujvQ1xH3ZcM/KMbmy2kOr
	zRrucUvqJF+g157DuiopDTpV13bZjL6GEsPu1s5MNihFFkc+26HBkZ/UJZgS99Lo
	Z8ZKBhcT0qdh0H21Sa/B0b5pbRXXH18n8PCQCJtWBrjfYA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4r75h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:24:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so5164814eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790637862; x=1791242662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XoyLUTFu/l3yoOpGw3lzvm9MjMkR2yyprPZj7j8euak=;
        b=erR8kT7MvtVRu2M4m5VVkl10WZVKRNzvrcjHIGmJNHaKDY5KRE74wNSka+IJmDQvUE
         F7UBmTAcQVIsP4+tIoJijoySf9PdbZJzkX1ERzCOmIa2d3f4qT/oMZhGblejBpd2zYc5
         X/UG/eGueiUhkig5p7VwrnXJA0EnxG7/3yjLAucqI4agXwEbBtQKoYSBvR+N8NkokWEK
         LM9btM+mmnc1gsk9bOvF3A+1hlgw/81IXqJWAmFgNNgVgzIAUdNkd/0BmmTTNfy2+q9I
         bcM8JXiFd0r/kc8cbC6sEZeBpiDgVgpd22HByHn7QA0YmJr1Kx2EPVYg60aLNosmI95t
         FpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637862; x=1791242662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoyLUTFu/l3yoOpGw3lzvm9MjMkR2yyprPZj7j8euak=;
        b=B8+F3S+qpbUNgVUsi/r3s5SJjk4wdnvirF9J0LWxIZdaTjRsa1WwwvimyKSVNDV1H4
         WaBQhBBPMzCMv/821RoCIIJYIFu1E6wby6IXEN8RMtbJfTLzksqVvJv4Cr2EB8WnGl0d
         ucxhRifjVssuBSrWfJvf+DQ88ThdTs3Z/+c5ZzSAosT7nCJr0iWt7e1ByHZllU37v/VD
         eueGYEOeXNH/qfxNyCXLt0pqWZ6Wkt+VwteJBtXEe2Su0r1eZjeVDXXjW/jI7ge7a9Wp
         iStb5Ep4AOK4C0H3+9UuZJfga8mQIPFsM7NPzwn5TVmFO8/F9torgQ8XTgm9sdJdrKf+
         v9AA==
X-Forwarded-Encrypted: i=1; AKwUvBxIuWGKRvPtJmUR7psx5u6hDhr+/CWv7+pz/re0cBhoE1/cdNW67qQRi1yOSKV2pIb2MnwN7BxAqSWaPi+wuAKT@lists.infradead.org
X-Gm-Message-State: AFuF++kjJHBjRA1tlIKS9v4F1RxTQT9RNLlcWObXLF704pTmuaVTIZeS
	MDVhgMqW+CMQGkVElHrP/GgL1YTTosbVjWC8YDWCukurq5IJzIyRWuw8Ar4M2Q8sWpwCTtsUyyB
	fPJilGwFmDIiuKyooCrauJ11BsvWg3r9L92OExUmepMeYwx8Qkb1xsGP7H5mcJNvMjQZRn0d8Ks
	6q7g==
X-Gm-Gg: AYBFou1TQKhpAEzcdF/V+dRam2d9+Gc1UTBkX3ERHWeAIWZJcaF/38RYa2s95+nE9s+
	mFqVXdmCdII59mp4MAXoJ/VcM7wL6o3B3AFdnM6lRP4D5KpbLk0fB3malZeZvR9ylGRjmtDCJnx
	6afl8INUZhrdWNiV0gHR8uFWyCCNC3VS2rmeESUiaOYwXCgnLK+WCYSXMlxMyLyshxu+I2Vm9fu
	g7TNHztA2/hqvC8FXepBo1bAUxtXW5PE5pg5/SJ43qKa0dFSwOKf6PIHtoOoSoC1Qc5LfuZT+Nt
	81LxNG1PWkmVcw2S2lY7dm5CXXdx68jI3yeQ7I+cBZKiqdJ/To4APeHdZIwnFx82HkoSejXyrzZ
	9LG7XXBB+r5RuRtZl25vs/wUdSBkUKe3+MjL0hIuLm2kBac2V
X-Received: by 2002:a05:7300:a987:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34271a8dd5emr14957238eec.21.1790637861600;
        Mon, 28 Sep 2026 16:24:21 -0700 (PDT)
X-Received: by 2002:a05:7300:a987:b0:33b:fc68:9790 with SMTP id 5a478bee46e88-34271a8dd5emr14957189eec.21.1790637860989;
        Mon, 28 Sep 2026 16:24:20 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341459234a1sm30024130eec.24.2026.09.28.16.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:24:20 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:24:18 -0700
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
Message-ID: <arr3IhF0bwN4uzUP@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA5MyBTYWx0ZWRfXwCS0FKTdQ3Xd
 bJ+ZfYtvtOErR6EzQPf+/sq1Eg02oGwRAxlYk4JtQZEXhMDSPphNh9L52aef4/JkjtdlXq/NlMr
 +t56sfOgqzej85CcvpNvhMcWMYoroos=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abaf726 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=MiKnSkdogZtXdNbqYk4A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA5MyBTYWx0ZWRfX901hfFVtN4N0
 W0P3A7A7tMhxeLOsSmYR3Wbn/rcNbvkQsZRvcbRVeE9VQbWTQFZm/+XIAd1haED/OM/Lm+Dfguw
 IXqUiEjAMJoUgfOKBI7Y2DpulVfaUrANZJoeLiRsXK7E9uWsaYIn1bcMac67u3ShNZfvtDhgIpD
 eF/mOrsoskIryHQ4U8OHczflimVnoEb4Eo2M4hCwP0MOo0jASD58I7NxS9zCyn7cD0gRsGF0QCZ
 2WqsUuwy/Hn+9veH8qmQXFky1C9Ytko6J60mRUga2rxkN6Cbbj9xGMtWcxL1XQIoCyjyTzm+Foy
 QvKpwdnBY9CNaC62n2wbsJYO4GYDSLTql194aCeWnhoyi8QaYkgpUMyopnRueMb7RoU/VSN2uJr
 M6f8e3mOyGu0WumvdIjEzEOsiXtv3JvHg4mkjILq/of78jnoTwB3l2YywMRTdXw9Yht292tBbdK
 jP4No6HDV9s/0t89Jjw==
X-Proofpoint-GUID: RkhX__sJ2sptYoHGHIT59MXnxSxesxpq
X-Proofpoint-ORIG-GUID: RkhX__sJ2sptYoHGHIT59MXnxSxesxpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162423_182543_813D04FF 
X-CRM114-Status: GOOD (  28.06  )
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


On Fri, Sep 25, 2026 at 09:48:01AM +0200, Lorenzo Pieralisi wrote:
> To describe and map GSIs for firmware nodes created out of ACPI static
> table entries in a uniform way it is required to define some standard
> properties and attach them to ACPI static fwnode as secondary nodes.
> 
> Define properties names to describe GSIs and their trigger-mode/polarity,
> and implement an irq_get() callback for static fwnodes so that core code
> can retrieve and map IRQs for ACPI static fwnodes in standard manner.
> 
> An empty stub for property_read_string_array() is also added, so that
> the fwnode_irq_get_byname() interface falls back (through
> fwnode_property_read_string_array()) to the secondary
> fwnode to grab the "interrupt-names" property.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> ---
>  drivers/acpi/property.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/acpi.h    |  4 +++
>  2 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> index 8ee5a1f0eb48..c609100c08db 100644
> --- a/drivers/acpi/property.c
> +++ b/drivers/acpi/property.c
> @@ -1766,7 +1766,74 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
>  
>  DECLARE_ACPI_FWNODE_OPS(acpi_device_fwnode_ops);
>  DECLARE_ACPI_FWNODE_OPS(acpi_data_fwnode_ops);
> -const struct fwnode_operations acpi_static_fwnode_ops;
> +
> +static int acpi_static_fwnode_read_u32_prop_index(const struct fwnode_handle *fwnode,
> +						  const char *propname,
> +						  unsigned int index, u32 *value)
> +{
> +	u32 *values;
> +	int ret, count;
> +
> +	count = fwnode_property_count_u32(fwnode, propname);
> +	if (count < 0)
> +		return count;
> +
> +	if (index >= count)
> +		return -ENOENT;
> +
> +	values = kcalloc(count, sizeof(*values), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
> +	ret = fwnode_property_read_u32_array(fwnode, propname, values, count);
> +	if (!ret)
> +		*value = values[index];
> +

You lookup with a propname, and then qualify with and index? is it
possible to have the different index but same propname? 

Alternately you can send the list to caller and they can use the ones
they need?


> +	kfree(values);
> +	return ret;
> +}
> +
> +static int acpi_static_fwnode_read_string_array(const struct fwnode_handle *fwnode,
> +						const char *propname,
> +						const char **val, size_t nval)
> +{
> +	/* Route string handling to secondary software nodes */
> +	return -EINVAL;
> +}
> +
> +static int acpi_static_fwnode_irq_get(const struct fwnode_handle *fwnode,
> +				      unsigned int index)
> +{
> +	u32 gsi, trigger, polarity;
> +	int ret;
> +
> +	if (!fwnode->secondary)
> +		return -ENODEV;
> +
> +	fwnode = fwnode->secondary;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI,
> +						index, &gsi);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_TRIGGER,
> +						index, &trigger);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;
> +
> +	ret = acpi_static_fwnode_read_u32_prop_index(fwnode, ACPI_IRQ_PROP_GSI_POLARITY,
> +						index, &polarity);
> +	if (ret)
> +		return ret == -ENOENT ? -ENXIO : ret;

Consolidate return to one place? 


-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc

