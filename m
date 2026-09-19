Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE10C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcAJll7X17ecZHyWjiodeOU2tRzl5yWie6oYHDQAd28=; b=C32bJS0ZoVneZDSq3Bk9ihppxK
	A+LaDAEipAh02KXzPYbLAu5xC8B9MWdM4SXwI/PPygkZRyk/s0plwSy0tWIhACthgdVUm2/49uXXJ
	MK55IyN2wsqEgmHqojh7b+1O8T2JFVHoUwmu/P1hqBKfw7ZQPZTXnmvYzbAFAEquSOGptcqWYBYEr
	SQIRXRgqGiPilfP45JKN1vAyzAkBlJwzNDWxqPHBkCv3Ys2elmQPER2wsrDw+0g3xb9hQjH+7EHAQ
	iD/45Y73eiUaDJ7qdWBSmoZ4pVVyQ00NqZEfIFHIq/F1QsmfRTOeaGVTLGoTCFIjkqgBHYXLMw7Tm
	rElu2JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jsR-0000000FpNM-2HKJ;
	Sat, 19 Sep 2026 01:28:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7js9-0000000FpHD-2x4K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:28:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68INw6RQ2740147;
	Sat, 19 Sep 2026 01:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcAJll7X17ecZHyWjiodeOU2tRzl5yWie6oYHDQAd28=; b=coleZC86BoOz15yY
	+TBa47naBrlO7WQ5ShFOPvNHPSUrxg3spAh86bNLdj9cSOFxAMh5LrRfh6jOj4A0
	LQGZug0pSODPh6YBMDBjIRjFCYEPTw4UoD4CPlSLvcZ0eqli2YmTCs6UC08IxZdF
	ac7RE7rEgl9AKToXHHsivXZdgpNoJLgETjSBtBpnf1zFAmqdE4aoOMEqgY/tJmMa
	LDaene/KNMhHioq8YwphKG5LQEyOhklNMUBskC2MO7hSRph29FsHx5GPM+RYUF1x
	CjldzMwgdsuf4z9nXj9s7Oe0Vf/6gu8Mx9tpAGNxQqNKV7bKQG1UWasJX6mXeOQS
	NtHDyA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hvbetx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:52 +0000 (GMT)
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68J1Rpks3476836
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:51 GMT
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 15F8724DD4;
	Fri, 18 Sep 2026 18:27:51 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
In-Reply-To: <20260912083611.2513845-4-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-4-suzuki.poulose@arm.com>
Date: Fri, 18 Sep 2026 18:27:45 -0700
Message-Id: <178978126541.2352296.3884730681319176394.b4-review@b4>
X-Mailer: b4 0.17-dev
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfXznEwOG6A9dXb
 elrs47/k1sAktCfrAcsyZ5DdByM53TT1etFuT7vRaYyR2VBV6vd5eOCOTp/SbnrsN3m83xcg9Pk
 ueWBpibPNLfkbZg8nYeBn4DMK070wBE=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aade518 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=n7Zw24x8dnK-RwIuUpUA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfX7gHVvqtux9XQ
 pf0iLlpZvsL5F81YBtkfd4gkXKqQyN2DdwSs4KY/uouNHWCY7CTHRJ9uGXtILVpZd6WbfpWb4Kp
 xHgRZZMkR356pj1FMc7KLiL/lzBkQLMEdW9s+Rewwv3WNKb5y4f/NQDVDjhRUhVclnUr74WhAfP
 IAAxs6Ewg6c9uUz023CEfWseQxIKlGfHDAyBd4GFnh1lTGMeFZzqZmLbVqHYXKNVbnAqqyhgWC1
 DHcDCMXo8urwTn0qUoYpeOSCOAN/JG9TwpO7uE4wCkrDZbn4rCFovBnzHoCV0/vKIUZUdknoaln
 vXZYpnYKaL/aLKjphS63mQbyeybn4x1AEqS5QPFgZPgotdrnL5sbGVvsxHMMneymiJjeb/iICs8
 7zWVOuH8dlFqvdJ/PUbhP/7yqPXHx4lvPkEJcYOmVQk09HtqqNNio1dDRMi/wHc0e16rtjg4nES
 PU2mJxXGl9r8KqmFyew==
X-Proofpoint-ORIG-GUID: dp-_0wQcOKiEpvID9dPpBsmR1PFXOWot
X-Proofpoint-GUID: dp-_0wQcOKiEpvID9dPpBsmR1PFXOWot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_07,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609190016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_182809_863153_08FB9519 
X-CRM114-Status: GOOD (  21.72  )
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

> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

One trivial but looks like it is getting quite a few changes from
Gavin's comments so no tags yet.

Jonathan

> @@ -98,6 +117,62 @@ static int rmi_read_features(void)
>  	return 0;
>  }
>  
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;
> +	struct rmm_config *config;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;
> +	}
> +
> +	free_page((unsigned long)config);

Maybe some __free() magic is applicable here - would let you just
return in the error path above making for tidier flow and get
rid of need to assign ret above.

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

