Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92303C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=; b=PUtesAGQXFRdCTBj38HUH8h2Ty
	uVnykxvAiz3WsuU72ak+U/scqZCICg917xuw92GpsiYLtxOhTUAyCG/hoa4j86iHxlKrgxsKI/R9g
	5TC+2+EPmt2lWMwNAo+9BeAg5nobCe9B9xBw4es4JeQTGedaYSlXW18rSh+EgtH9MUNJFUyXfU8A3
	8fLfDbcvTA00DOYeNDbRZPeL34uGNW7Ay2/AOhNTuLmLQU0TRAfbRToykqQxNRbL0fcRzqMMaQvzj
	DJhrFTo2gGn5oBuqoxEhLdqhc+3WMbBNWUjhMVL2S/8vLe8ZU0WimL8wo2B9JoiP9gvq3NhoKktqB
	h0eRenLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHeu-00000002pxu-3HpO;
	Wed, 26 Aug 2026 17:43:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHer-00000002pxQ-27wW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:43:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGurOC1008162
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=; b=B5+v/VQaiHiUGVJ/
	D9meusciCNg/PXztul72dxRaxJjdanPJWyaEFkPs3HEDqjVXSyP/EF8i3JdQ9ky/
	o5Ir5fHG8V4LU3bWIg6BjkAuSxsmMfE7fdF3O+qeusAySK5qtCRmFwwbY5gLpjt9
	0pO2uZB6pebRArB0QWhDNUBKufR2qPCl1n41l7NBFKc9ZBpkkcvoRwW77fCme7gQ
	fFEtJK4cfRhc8Go3j6f46GaQxJb/xRbl6Oz20vQ9b8659/ijfdcsToBlVTrWqAq3
	SABRTl6f5pxQ8SrJHHiLrIzbNHSy8F9ik3HGMsGw1TpIDBMXAVQTImanKg0Z8ix5
	QmqJnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxb14r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 17:43:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso2129616a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787766208; x=1788371008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=;
        b=azb/t/EquYt2pC3/SXCmEkXGB5QKseNmacxSMWQaxteHiWhyMQf9M6gppJvSvwY45W
         eJpeQ9tVK7YR2mvjP5an6Ma6QPagB3zkw5Dc5JXs5O2Pw/qrIjhfvDcPvAoLSt4zEh32
         RVGYmHffUAGBNLbPp05aAlMO+73wsvZDPLc/0gO1UNRKa4tke0/NGylPOc0h/+dvt6dE
         NF0frn4Pj/Mt1BQFkIrAZTe4W8a7cfiZYNfVskB86W0Aaxv1CmjTh+qZX5p/3JC8wLhF
         es7hWlnNI5PypyEitdIwWrRAchTomeJF0JlwvrBQFbCTKk21YOrpusEuqwVLNaymTAyW
         DlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766208; x=1788371008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V9WI5J1uTR3UjfvxVm6sCyRfn9y1gV4JDAQn1epUkk=;
        b=ewWGSZSmryV1jK2/Iv/SZAEdUZPhM/sJjcTgY7vEuqNdTIzpp6ZKq+OMAm96NQm5/w
         WzZjyg1E2zW790Yq2rnJTpeTVzuNvvR8VpnnmQQYzdRKXee5lIOZakOqwvml3o9knrM/
         4wvSURMFaPBYP6I9WeZpQUVAPmQm+sD7WNt4R3yComjos6eZva8CJ8B31c/2xpMaUjTr
         FnmXW4u+DlEICZZcXLXzQg/zqWZSJZf+bmcpkydyP6Oi/n73UAs8IlhnvUgH4lieb5gu
         WOgVDhK0lbn6YiH/1uAXYnBYw1o7TtisQvEku5yweMJFkBdkKCUlQJhf4ATnMaSSMS0h
         eJvg==
X-Forwarded-Encrypted: i=1; AHgh+RpAga7fQzMbtsrfkUpEVWN7729/6AdmLe0W5zbe5eetjTLEaxa+lFa6dmeO1h3ea3IDSFd2SGUOwHyK+6yaWFn0@lists.infradead.org
X-Gm-Message-State: AFuF++n/JP90+q3z4AunxF6AWdqwyGiBu04EoqfhyP/cvA9vXgj4bNx0
	ZW4keeAK07GdvPhxtpTVnZE5hVuZkTJ/jz0/9OBP1LVTVNsXQd161LHsj/1eBoPxG2KXQVC/YTm
	wvt+nJ5+Mu6o27ajOJSWHecoLytXdL2Y8hOro59qv6rIHB1Ng5NIUUwb+BRVHpypRe6S/fIlcau
	b53w==
X-Gm-Gg: AR+sD10LpDKanH4QPUzhyIyAqyZoMYhEMBryLQzJLVSV4mhIVYhapt7gRpiv+h8NRDR
	lezMQDZl0Vy9W/2VKmoqUwAgHdtERPy/dnQjj93n8vhpU2vbMp1qrvEKbliI3McFtR4H0TNWy2R
	vrmRBQ/KwJfG9+U9q4rRTg/D5/M898zvl49NI0RYNq+6ydFLQwyHuztXfXk/5nz3ciy8OCB+U85
	c4GjwfsnjyVhPiorP0WTRVvVYQ520p9qd8KYZ4t2tZgJeDdfYa8TWaKwJ0J763J7Dtn61iZpHLZ
	oi5xgBKNC9p1aQunMMSYHgnfzhuLISVHfaKeMh0TampEAJ7HcOX6B8mxW6cE+PI92V8RZxJHFGd
	VrWLojlwoJr2wUFpyZGPDhwmYTEROwikRCVOKzZ15KBjJY91BC2CKbU0LDkkU/ydZOPCEutrKeO
	2CcqnWAQy0CerjjsT9mQ==
X-Received: by 2002:a17:90b:5544:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3966d403489mr18578279a91.11.1787766208193;
        Wed, 26 Aug 2026 10:43:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5544:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-3966d403489mr18578189a91.11.1787766207732;
        Wed, 26 Aug 2026 10:43:27 -0700 (PDT)
Received: from [10.50.45.102] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm8950241a91.9.2026.08.26.10.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:43:26 -0700 (PDT)
Message-ID: <913fd0bb-6257-48f8-9f04-7df3d44c201e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 23:13:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20260807105451.3728284-13-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8f25c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=3NjWhugmwSPu7QgOpREA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: L1V-psLyz9SsjDk7DU5T4piXZbN4tOmi
X-Proofpoint-ORIG-GUID: L1V-psLyz9SsjDk7DU5T4piXZbN4tOmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX4cuSRLj9tdXg
 TDavWI74rr+fadDzAhrQmG91tlK7pgKGofdaBw1zc9aFcDstVvCmqMqRhZKxviguhPDXvYBcMXq
 t7jqCEJw2NJHe8X1TYeLc6hYNITSxqiROYjWVgN+G9gWX9ATsy4+4C+46dTjDmGx06O6AXc9nY8
 mWT3dARnf18iF6Zvq2t2OSGgO1cCekIEVKNhzmKy/9kyLqCZ30pM7xRRF02VUCfbwQDtcX1WTvi
 uyzD9J0BcTpdmgunlO2uMR5JKP+gvtTYs0y29tB1TLql5LWT389T4RZG1Xm7ciKBBUzsl3HDGuU
 Q5+2emKqVt6RVOTX2QbxZD2uIV7BW8cfobHkctdjdHeKeRtlRkx4xTYHa6xrw7esrEiRCs+ELES
 3yh/STPNtjD1kOl3qUNXYfPqA8hUiPLHGi14xrwK4MVG+CGmUNqlNlnEW+u2A6zrk7xPBG/xfWS
 5whXxcjm3V07soEMvHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0OCBTYWx0ZWRfX2BxjvNNOZOnQ
 I6yL102zjWPqn8B3+ATs9m9hvsb+ImoIbd7oMD18ZB+V2trzX0T4DkMjLAZTkLfpfyzaMNtmrdP
 YVBlUkLPop0Ba1+KIppATxDlSMUC7rk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_104329_559655_2FCE687E 
X-CRM114-Status: GOOD (  19.79  )
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



On 8/7/2026 4:24 PM, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> 
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Ritwick Sharma <ritwick.sharma@arm.com> # on Arm AGI CPU
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Tested-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c  | 112 +++++++++++++++++++++++++++++++-
>   drivers/resctrl/mpam_fb.c       |  41 ++++++++++++
>   drivers/resctrl/mpam_internal.h |   2 +
>   3 files changed, 153 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 4b1382fce2be..4d3f13044b43 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


