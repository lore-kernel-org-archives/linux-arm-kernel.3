Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4470C982E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr/qoa0sDlgWepv1yFUGASuUApy87SNqzJHn7531YD4=; b=VwygTrzkNtp6tIR4b7dGi6TY7Q
	cK9hToa/TAxzdqozEVFl39TtkCXqwbsO6hoGXwSJ/2TIPeuBUn6lp4V80U+regEpLwdxcQ1wbI8QL
	LSJH7bw5+cpx3eubnWe1W5l/bXt5PEc9UjXwUecZhgzt2Vkh0B+H4zcBIQB3Rq1kakgm1XSN+/HKW
	fFwf1WrOn3dafCbs851Kje0kXpPzEL/x4QTlStzKlFDQDSwvMXH9iytii6DgOXXMmGGqzSgSkZINs
	BpAMZcK+pcxaYEtfQXkZP3fl7mRAM532nQO8pugSZHlooWXJbFqF+iKwSIoKbQ5rn7xJK33myvqD9
	XSsG6CYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jsS-0000000FpOg-0dks;
	Sat, 19 Sep 2026 01:28:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jsB-0000000FpId-2ehe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:28:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68INw6RR2740147;
	Sat, 19 Sep 2026 01:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cr/qoa0sDlgWepv1yFUGASuUApy87SNqzJHn7531YD4=; b=dwg3dnXuqUBTMBWB
	1J/dpqkJNX3WBcw6uwWN3RieckAmX+Hs+ZrjpP9hNa8sdc/MFUJOB8BAVVLp+/aG
	lUGLjT870EFKIxahsWfWM9KPNY36sBBvOxNdbRTYvb2Pun8tQZ3Ea86vzZeNlPQW
	gFWpb8x2YDgiS/YRKpwCrqdOhCpPHIAyI57I1J8ExbiXWJ5oCtVaY4qh7Yr855CS
	eX0tiUzeniY7+oNK9N/pHdAaO723cuMQGOiVI+TJVoLiFkYr0TUqjbNcnf6rE1ZT
	EvKKnMh+QpVJ96sf69zUOpHTAQwLnSvvpYtqxMrlDR5gjbxXP56Jp7ygu/I7wyn4
	rEuRvQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hvbety-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:52 +0000 (GMT)
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTPS id 68J1RpwN3483931
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 19 Sep 2026 01:27:51 GMT
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 1C3C424DF9;
	Fri, 18 Sep 2026 18:27:51 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 7/7] firmware: arm_rmm: Add wrappers for Realm
 related RMI commands
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
In-Reply-To: <20260912083611.2513845-8-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-8-suzuki.poulose@arm.com>
Date: Fri, 18 Sep 2026 18:27:45 -0700
Message-Id: <178978126543.2352296.6917799344044957375.b4-review@b4>
X-Mailer: b4 0.17-dev
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfXyktYp53sjxb8
 sQAj3oI38AegSyFmNXh2jIEckjISg0EC7odeWkBuG3hwpFXJ0GR4QyiCn9XdRD9RjJKudWfMS7b
 rws7ghPoB5DBSRPm9bEUxoG+eIOUoCQ=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aade518 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=IJVdKelJPJ4dxn_WyZIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDAxNiBTYWx0ZWRfX68om1iBpuJ2z
 vkUkZnJuovzvOeWd6fdilIqGSx2OiPqhS27KIX5Byz66aiVQ/S4EKBag0f3WRI4TA2zXv62IOx4
 EQzwwSGm2MuB1SBhi2QDOmmGqGf8URb3Hh+V2UgjVc02sp+8FkRVnfWCbQsSXe0rFaCrJy5dknI
 OsIqKe1qjnRkBSBbFD/WFN2jKxE/XMTlYWf6MOK7h+3Q1lLzH5I5ewkIy/rbtvedGgDowkx97cI
 0ig4z/hhA9dMaUXGcXMffDgWpzUQDqxMWQ1L6w3C81W0sN2i9hZqBcUPCM3ikRt74LLZCYRnKks
 Obh0TjAGtvS3rM4VzvH1aRbrsOFvwyjbYTskv7qkNJGeAxxLOCiX5tAO9f/KwqsUMZAAYlzH39S
 bdmkYMe+KLe2Nivv/bUqnDEOeC+V+a/czvDUOpmv300Egkc/LPqcQ6WlyrXZZGugrv/XR4UWEd6
 /9bxPLJuroNHx8ca1RA==
X-Proofpoint-ORIG-GUID: XjJu7fT-9rrGarPvdiGVr6Xo-IfVZ7UE
X-Proofpoint-GUID: XjJu7fT-9rrGarPvdiGVr6Xo-IfVZ7UE
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
X-CRM114-CacheID: sfid-20260918_182811_843330_46D2D9DE 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

> Introduce wrappers for the RMI functions needed for creating and
> managing realm guests. This will be used by the KVM to manage the
> Realms
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Wrapper tastic.

With the tweaks Gavin and Alper called out already
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

