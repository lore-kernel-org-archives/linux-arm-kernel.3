Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50199C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuUq8mguFO6sLJSPQrGeQH4ydhRWN/v9sVC+eP4AT9E=; b=wXWMozu9YfUB3R3bGBUjjh9c2z
	NLjrr8JkJ4qA+3gUE4NM96eGnmNpB0QAP5eP8g63X+jGwneEafuwE6c+OszEjasQ0YwWQOjcVbZXw
	Vmfaf+S+b3WV6bkblTtChO63KxD186T2QeWUfHjui6frJLGCQLQuGKmGA2kAzdoHgARql5Az4ETjm
	U/RHlq1EdOIyMAnw21CEIxySNT7ACBJcLexD6bqsp1iAszP+FyOVkY07WCXOgS2kNlpGEW7W086ff
	P2mwJ7djklUH8VXIAumNdQt8m4pgLxXnPgceet+F8eFqSLdrciYtLCwd80RRayxM7uvGylZhFShkf
	wVGtHLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxZ-00000000SHd-36TX;
	Thu, 03 Sep 2026 19:18:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CxW-00000000SCt-3PsJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 19:18:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G39KC927741;
	Thu, 3 Sep 2026 19:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuUq8mguFO6sLJSPQrGeQH4ydhRWN/v9sVC+eP4AT9E=; b=Taqf1a8l203TciQi
	Mf6LaWlXioF2COO4/cyg9tIYblmAtr8xN54KdCcFGyc/nVCZuR/wJA1LVxGtiCpp
	HGYZ5sGhjWb2QKGs+JHMnsCWnvaa3vklSqsTv80UXN+QyuPKkmayYmLuIPXfEzBI
	CfdZI2VM/dDzVsj3Li27cImlvSHEqwzM/GA+5BrMpiOKT/TTQQxualwvqHvMo2Ca
	HzBvMLYPw69i29HJ1ROQjk5Ixek5Z47V0YBmEUnqvWoiaVA3w/++A8YnTWRJYdQi
	tRXG/2yl5wTj+qxxRRCpityxwjPMVETmYDJUj2H7Gc0VUMLRv/Bnk1RPkEPgTRQK
	CosXTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx2f6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:36 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 683JIZNC3196761;
	Thu, 3 Sep 2026 19:18:36 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 683JIZL53196769
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 19:18:35 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 6DDD024D04;
	Thu,  3 Sep 2026 12:18:35 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 09/13] iommu/arm-smmu-v3: Support PRI Page Request
 in arm_smmu_handle_ppr()
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <0fe5f381aae307045e4cab97f8000c575f34a9ee.1788222486.git.nicolinc@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
 <0fe5f381aae307045e4cab97f8000c575f34a9ee.1788222486.git.nicolinc@nvidia.com>
Date: Thu, 03 Sep 2026 12:18:33 -0700
Message-Id: <178846311318.1308030.15663048615954357081.b4-review@b4>
X-Mailer: b4 0.16.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: LdRGoQbMkBz-lhR_fg1mO4jR-c-bmGBD
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a99c80c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Ikd4Dj_1AAAA:8
 a=EUspDBNiAAAA:8 a=amhe_TGd7ORvjM4qMqsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LdRGoQbMkBz-lhR_fg1mO4jR-c-bmGBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfX3YKp9GTau1vl
 u7gna7v9euaTnMnas83EBguVRy8s5NXy7tZsemy7wLgD6BEj1ucU8WVCXYj8UDx00Exc+i54pBr
 HRpb7lkGSwnnBBFCTSkMfP2fDcubKvioLeIjIFhBee+W7eLTl1Pghlj5zbGu+9z5Q9F7+t5RZbu
 2AjDX3XQdwJP633yqLeJBk1K5k2/N36KDjt8PTFlsZjSD/RU/Ny1YVF7Pens66iEQgLvrP69EO1
 xKQEF4fZPNBtiG+enFBvmeP/hv91pvp09llhZ5zHWEBFVYgrFO2cRX3nKoSAcNOfkeAzkZKz5fc
 3CFm8c852cSPP6gSwIKkqU/UAhEnuQ+96JNB48bvRH1XJyG6eGzJE3MdmU/yfIdIuj0r9LsJ6/L
 gxBy5z2goYXrH82x7zHR5p1y7FGT0f+yrumj0PSFNoicm5fIIw66j0oCHzbx6YKyvngM/4FClk8
 uMx47hGJ9s/Lmi27YFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2OCBTYWx0ZWRfXybYP7MREm6AP
 pLUOtDa5xzceMmWv5peThYNtfqygF1CIKOfS8KQaeadY5XLjOEhq8tnsC1Q+8jaf/XrQXYOGaGm
 5jSb7Q+2Ur5ja7LTMsj9Zpl5C/ZxSrY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_121850_989700_406C5DAF 
X-CRM114-Status: GOOD (  20.74  )
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

> Now, arm_smmu_page_response() can issue CMDQ_OP_PRI_RESP for page requests
> from the IOPF infrastructure. Forward PRI requests from the priq into the
> IOPF infrastructure for PRI-enabled masters by building an iopf_fault from
> the priq entry and calling iommu_report_device_fault().
> 
> For an unrecognised StreamID or a master without master->pri_enabled, fall
> through to the existing "unexpected PRI request" log + LAST-page DENY path
> to release the credit per the PCIe PRI spec. Merge its two info prints in

Either don't bother mentioning pcie spec explicitly or expand that
to a useful reference - so section number, section title.

> the path into one single ratelimited line, as a malfunctioning device can
> spam unrecognised requests and easily flood the kernel log.
> 
> Discard any PASID Stop Marker (LRW = 0b100) prior to the fault report and
> the DENY fallback both, because a Stop Marker does not expect a response.
> The IOPF infrastructure requires the driver to discard it, as per the doc
> at iommu_report_device_fault(). This also matches the intel-iommu code.
> 
> Note that master->pri_enabled will only be set by a later change, once all
> the PRI paths are ready.
> 
> On PRIQ overflow, partial requests stored via report_partial_fault() whose
> LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> iopf_queue_discard_partial(), matching intel-iommu's handling. Do it after
> the queue is fully drained, since the visible entries all precede the loss
> point: a group whose LAST-page entry is still in the queue gets assembled
> before the discard, rather than losing its stored partials to it. Nor can
> a new arrival race against the discard, since an active overflow inhibits
> new entries from being written to the PRI queue (IHI0070 8.1), up until a
> final CONS write acknowledges it.

Kind of a general comment.  I'm guessing AI assisted heavily in these.
Whilst I haven't found much that definitely doesn't belong in a patch
description, they do end up rather more verbose than ideal.  Maybe
poke it to be more terse in English language choices at least?

> 
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

This looks fine to me, but running low on time today and
I didn't check all the flags etc, so no tag.

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

