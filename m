Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB08C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmEokH++yRwcBwWlKo0t6cwFvtc6C94Yt4h2XzEjbmU=; b=44cOrnskIf8I4VIimovxSy04z7
	Px6AwslWzi+KrhgY0/Gstet1QrLINMK60/FVifc03+ZmjFlJw0eoGa8MnEmpB7SKgSV3BRl4jIohj
	mLEm+ZU+jnelYj0TPDRvWi8AkDELWUhfLSeLCHcysXvPKgqWkIIzxfHruoOR0onyIB5S9b3loIsaT
	6PQEz2c0KVBVW5R5E9Zw1P5eDm4JVs7WBmSXDzhIqAyN6s7Bk8Ks6yfpMh0UE9QIuua2MXhDB6AW5
	eibS26LgZWY/M+btYY+3Bq6AtW96rUyd8c+aG5qM7jNvvXz9ymw6zDmlitGJLmOtbiLjnidg0oUWW
	4LInWuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jsR-0000000FpNr-3SGI;
	Sat, 19 Sep 2026 01:28:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7js9-0000000FpHC-26bU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:28:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J0Jgaj2182706;
	Sat, 19 Sep 2026 01:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmEokH++yRwcBwWlKo0t6cwFvtc6C94Yt4h2XzEjbmU=; b=Okj1BylPpj1HIvqN
	IY4hpvtiD9jmjRtD18BsChRd2jt62zQ0Cdcbcv0WKaZp6jGuC4DE58aznqcdKBEp
	tUK5tdHE2Do79ZcmRaupcvQ4fvtQt4RIA92YBstU20BOCLBf22D1sv3gQ24HsL8S
	zyMhAYpdzWzgrn00x+rYZjrHiwYS4KjKuQVoMkjApOm3KCeYQaH+6jbDDGQH9Qca
	YWqbgqAzkSb6csivtWHCdXcp5RNcifk0z6rF3UmVbjE2uw0MZ1KKI0MPIF38eppC
	GF+sZaGfQNpYi5dYEIzBtsxMr+uyxTbQsY9jAjvQiUt2ijQuqUeFS+uoO0Cxb1iT
	MlKBDg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnr51d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:51 +0000 (GMT)
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68J1RpOD3460797
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:51 GMT
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 1432924CDD;
	Fri, 18 Sep 2026 18:27:51 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 2/7] firmware: arm_rmm: Check for RMI support at
 init
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
In-Reply-To: <20260912083611.2513845-3-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-3-suzuki.poulose@arm.com>
Date: Fri, 18 Sep 2026 18:27:45 -0700
Message-Id: <178978126541.2352296.3637463397103730192.b4-review@b4>
X-Mailer: b4 0.17-dev
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aade518 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=fwO9cvh01lKeBat_3SIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfX8+NvaUsVIw2D
 6np2PAPzBDNPfPLuLmHFh9KqokgPPaDsXYY+ingQ4cugGtpVFLclgifP2APyVuGSY7HW5X6U0ep
 F8d06u/gjX4T6xW/0wml2t3ywHThmmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfX+WvYSF/JVCd+
 cEfAqbwrgTh1EPZLoU0mGnjP6XX4VDAweqXq5v/H9Zuy5bIlJQ8Y3cRceymPo8hNGg8rvXP62vC
 QreFBHo0dyHJsCS+In8SOXeEubXyuRdCayWwADYIOzypnmL1DmVaOT7f3Sj32d6BcVpFC8/fHxV
 E9pXdQ3mJQtbQlV+JX+3ryaqS23ls6jBvZRYQawefI1gTYUTwl/fR95ebMC74R7BK/zPcSohkWx
 HiVWaBpTO7dWetbkZdxn0StjDD4C+ac64bZuFY2rjTRT3GVZDQ4NI+WYe2IOGAnT1Lq1LK5WYMH
 FEdwG2T+lQ1jkf9cluRuKYTe63yzS7RbIu1rM9n39qR8Is+adpmPEYofmSIVKkb1hFfi/JUmVfR
 JLYDANcKxmVlfgMUJ56z12IKw5Oi6g4m0rkLzpLjp7w9wZ0B///HTD1XTrn3qhYaeyJjCcjwLoa
 +XlDAUQjHQ+ZvFZD+bA==
X-Proofpoint-ORIG-GUID: ZLs6Xbddowb1c3a90KA2fibWzYHLB6i6
X-Proofpoint-GUID: ZLs6Xbddowb1c3a90KA2fibWzYHLB6i6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_07,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_182809_659503_02F7E102 
X-CRM114-Status: GOOD (  17.37  )
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

> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.

Can we have a small comment here on why the default is y

It's a big thing to opt into by default.  Feels like defconfig
material maybe but not in the Kconfig defaults unless I'm missing
something.


> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
> new file mode 100644
> index 000000000000..82724ee23186
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Kconfig
> @@ -0,0 +1,26 @@
> +
> +config ARCH_SUPPORTS_RMM
> +	bool
> +
> +config ARM_RMM_RMI
> +	bool "Realm Management Interface (RMI) Support"
> +	depends on ARCH_SUPPORTS_RMM
> +	default y
Really? Why?

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

