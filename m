Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50129C624CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=; b=r35CP+UcEwbgT3+y7nS/aLxw91
	HQa1tQfiGfVy1o406lVD+GgR7EGNlC5W4gpXr0tVbrqrdQ5Pu6nW6eQnsgsEITr8fIZVXS4zw5d8Q
	4Kc6PxwgQCR9U8uahIsyU2QpELbfIj6GMTTmjzLGdcRLh8mYQGpJHvfiJ12H+jl8BHivw7yZ2f50v
	o1dpiFwOgOz32eJkuec/giECGdLQ8n2wflLNfp2KIcdHLYs+/udWu97sXH8sqGRBLHt3J3orU2aMq
	Jot3GB9CPyCtcL3hk8v4RW4O6d3URfnuast4+Klr9kkCyjm73kV2lwj8MmyRGYsyA01B8y6GDdYR+
	GABFL3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NBi-0000000Bna8-2VP6;
	Tue, 01 Sep 2026 12:02:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NA2-0000000BlC1-1geN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 12:00:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJUrn1641773
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 12:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iXGlLDwHtFCPNeY7LA/k6nku
	L3mth9v8r6iZQj6mK18=; b=dGnJr/ZxZMEl07qYTJXS3W1m75CsCaLCDOBkh2z1
	neV9pt9HryvhFXz5KjibWJxqtkR/Jt74Cwm7C/cfmfx17r7g8+FtTg75jct8Z1nH
	SALFcItaHveyOSTrWC8cWn1fEVtu00y4TAs6tZMhtKh/qk2Y8hUwtd1iPXeOSr4Z
	Jy7SGMnBNFcsM7JCjDT5+7GMGFa3uHfdZEKjtAt6oqz9C4mxvmMEYGm6yDa/Bcif
	yHKqcuSRK8BWnNeMLq1UvOrqHISBB102AamsC95mSH69VeJKTDfVlB3AvHws69x4
	HFg4Ha7kBUWRCFfhir8NIkX7gTA5U97rUMQsvaLQ7oDlPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tfdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:00:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce8ad8002so68162236d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264016; x=1788868816; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=Y45AUwStSqYggX+AnfBCiWJ53fO9fZLbuhtaphjY6I5cfTb3nwHKRhhNVAFLGEUElK
         vHLRzI4k+ruAa6l0HTQ0mr7Rrc1ncr98psyJwDRzTdhgBZswIhluZPPY6fGNx3caf7Z/
         6H0qIlrBwM4MVEnZQttzE6IGD4DSaxfKbtsAi2M4RWE7/bPUAOgQN8w6ZIPY4KmvGlRa
         grSH0BYcGYHMQ7uoV5xx48A5H2PKszAqvT8oLPxzWrM+Qf4V171r2FL3bsGLGGAjKtrW
         QL3JNrVLV1/AVahS+vUjd/kh1AqlTdOinwvZoj3GwtzDXQsm6GuTjCIiPZKCiZisBTn8
         43pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264016; x=1788868816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXGlLDwHtFCPNeY7LA/k6nkuL3mth9v8r6iZQj6mK18=;
        b=pRQhXJ7yGSi6vVdA+DC7TgfufGkcZopGV+IJ+5JcMHsY4pE0M0SBIBuqf+3m3GtcuL
         ovL+Ls6E3zudEpB+BIjVvcVp9MAtd1ufnGLfW12yZMgqa5zkhY+OSiQY/egPESWDrVHL
         RL9NcFH+eSCKDGEeQsInBfEBZvB4+ZaFGy++rlzhHtjbyk+UIAouwm6E/fkGPvJqJs82
         5GABQJB53nCaCXCIYgDc+u+G/ZEDSXVH+ZzxvljckkEjobDnUX/AvdVslV0OvBSlgHaB
         7Lz7q4UVK1VIhjAo5A0k1cuKs5+BymTt8y+8sqdAdS7m945DkGp6HDUzjkuVXA1arg2x
         VC7g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/VWjJcBzJMqvx/NHLl0k1SDiFqv7ojno2ku/cvxgT7+d9T/jRwyuUVMlrNnpCMal/7+2HvyNrzlYIKdHJjCNC@lists.infradead.org
X-Gm-Message-State: AFuF++kypRkuvnq6BgeN6DjdeQsRS/o2xtPxYGBgMABPFJEEHKThXBMM
	q7KCi9QEsh/OEBnJbe/aKKb0bZXNvUEr3jIWVdQ2vNCzkAhvJb3hW96j9EyHeWHOHca3bG5EmoE
	TiyvLQoq4iDp5VqDItxuw+i3w4ZiEJM8Ja48/3MWYmq1jc3rkjtF7dJMBDOr1oNXrEROaC7L5hp
	CXUQ==
X-Gm-Gg: AR+sD11ufZ7SE5ifGrO/1W2pWqcny73weZI8dpuHi2R1ex03yiKxWTImXy6ogl9x5IX
	6VJ6ipX7OYhLBJFY8FemFnOB3e6rD1TmhNATu0PkuLrCeWv49Q8K+0ba0Bxgxz4PXMG0izzEauK
	FVsVf4LiB8V1hEMVrJ1ZNt6cHLHAFo0aK+B04QsU2cLZok+yGzEhQ1y4M5emAvlZnMDFnQ2z6SA
	P1Ob/d5NiNOxSwupQf6Kt3eC/Dmt+C90jTcmqA6L9xsgRUgSJ1NaUg79xUgaKIU/8xXWsP93SDw
	yq0nMG3pOX6UUKvpCZIzDgT9Q0l3FLf4eow7SNoj9Yfq0GbdK+OlLWX8IvBosriHdUrqvbBRzxy
	RUgqbWXX1gSiUWA==
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536584185a.3.1788264016253;
        Tue, 01 Sep 2026 05:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3536559485a.3.1788264015261;
        Tue, 01 Sep 2026 05:00:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e687sm4664913f8f.34.2026.09.01.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:00:13 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:00:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] cpuidle: psci: Move initialization a bit earlier
 in the boot sequence
Message-ID: <fuc24y6pvanwxxxan66pgwlshcwz23kiujk4s56vlflr2zm3zg@7tgx545sqlvm>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
 <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901111441.122436-6-ulf.hansson@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96be51 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tsJcdtOPNZE9NDYWY0sA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfX680qd5aqy+v4
 D0nQDzcqBwyGCwj3vQ5V+uGJ/B61Mu2RySls8s9YdcEFXVjyV40ydhT5NrmZGUKLRt1z6KJbjYo
 z355Oo7PRLxq0qCGzB///OK+6dSPciti6j0XcVAUbAl7IibLG4ZaBBRC8rgOCsO61OQQID/K+L3
 0MVRNT8tDAewMyVbqmrn965pekSWOaOFuQX2c+TghaoSVwhlJTemHMbrVUD9IxI2+OfSssdAYs/
 NFuWlThjsBACERULrn9/yaKX0bW2i1VrrMx2OPJtgv9WfQh6x6nf7skHs3V+MH8Rpnv5jAiao0Z
 zhXoZlRRFYUjuzhAv3qKWm1P+PVNU2toN1VZO+IQoDjN0cvufGPrW1DIhFmCATZFjsQmr8Uzn5G
 jaT9CZciGWYjbHAe1FtQd+BqeZy9nnotQdXD2aiIUT0FXhtGghe+kaYIagOOsQg2cN4qF5/CEZW
 Ef4IIzzEcfzPIUrGAPg==
X-Proofpoint-ORIG-GUID: iaCVcQq1KvsMhka_F1YGbhq9FuEOU-WO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNiBTYWx0ZWRfX2HtAx1vlAiT2
 bZzXuP0lwFJIkQceradWZ8WNYpPf3VRhdREP2dgyaeI/KVbfrU3TIjs213d3qev9q6zJ7gsRW3b
 1Zk7RphIt7IQyZvQSeqQF25VHIZ3aqo=
X-Proofpoint-GUID: iaCVcQq1KvsMhka_F1YGbhq9FuEOU-WO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_050018_502830_5375C5B7 
X-CRM114-Status: GOOD (  15.48  )
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

On 26-09-01 13:14:08, Ulf Hansson wrote:
> When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
> it's of great benefit to attach the CPU devices to their CPU PM domains as
> soon as possible, as other non-CPU devices sharing the same PM domains
> depends on it to allow their devices to be probed.
> 
> Let's therefore move to a subsys_initcall, which should be soon enough
> after the cpuidle-psci-domain have initialized the PM domain topology.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

