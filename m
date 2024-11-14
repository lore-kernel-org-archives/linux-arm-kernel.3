Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325D7D637CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 01:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obuIBdB2NoaG6KPGEovIWmvnS4F0qNHmuyEWMF7tCV0=; b=ByXoq6vFGXFbXWmFVdnr/X5iBZ
	I+EzzrO+B3vt7Rolkkr7ktOFKOwBU97+VvT3FWHfiG2Uci5KbO3oENGSl9s/r9LBSVQG0y2MdoK4g
	Nam/IOqQ5Yzn/x9mLSrK+W5vNidRa2UyoNAHMqG0IPLVi9PbIKc7RWicKsQCpX2jlWkv6HbQFijA7
	QymWSHYqODLF04/XPnuLjo+FarVpZw5mnckggcBFK8jZxAli5+lOq4z7tPQ2InrvSCr/yU0lahm0+
	Nw0SAYFMx7p2TjzpD1DfOf1R6dwZXS3/hZ3mEpYsT4N9dptqayG0UN5CWGuRwOYF5dU2XMpOilupt
	qHTyz7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBOPJ-00000008PY0-3IQR;
	Thu, 14 Nov 2024 01:12:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBONW-00000008PN8-0upF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 01:10:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1QHt015403;
	Thu, 14 Nov 2024 01:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=obuIBdB2NoaG6KPGEovIWmvn
	S4F0qNHmuyEWMF7tCV0=; b=InB1XjjteKgpdjXLYnvUB21rnx0QXPw+XxlDbETw
	14igKMWkZcgDrzUXVDCJh5nZWiQmJ35R1hqsDjaridlIC1Wkk/f7W/7L53uVDmJb
	ewICNqtUp1UKLvD1neHsK7n3d79dLCNfCi+oitFx3zk5+Sym75BCaUCUKn4mfTa0
	z4QZVXzi4ZKamabKtzQvDqtR3ko7ruX+6fko0BroqkSisPzxjkNj4ckVqZC8PucH
	ogvyS1yEfkMHU2qdG3jT5jXdP6hX9+f1vzAOaPFlu0ipBDySQ9nFIjIWM8asOket
	0tBe5AnTi4J+qOsHZTTfux6fMVxN9yWynoNBkCzfAd0C9g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsf329ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 01:10:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE1APhQ026065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 01:10:25 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 17:10:24 -0800
Date: Wed, 13 Nov 2024 17:10:24 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
To: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UgSLmlzclwyVXv8aYsOX0I0nUglVNwrA
X-Proofpoint-GUID: UgSLmlzclwyVXv8aYsOX0I0nUglVNwrA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_171034_304181_6B89DF82 
X-CRM114-Status: GOOD (  20.70  )
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

On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> CPU_SUSPEND instead. Inform Linux about that.
> Please see the commit messages for a more detailed explanation.
> 
> This is effectively a more educated follow-up to [1].
> 
> The ultimate goal is to stop making Linux think that certain states
> only concern cores/clusters, and consequently setting
> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> NVMe, see related discussion over at [2]) can make informed decisions
> about assuming the power state of the device they govern.
> 
> If this series gets green light, I'll push a follow-up one that wires
> up said sleep state on Qualcomm SoCs across the board.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20231227-topic-psci_fw_sus-v1-0-6910add70bf3@linaro.org/
> [2] https://lore.kernel.org/linux-nvme/20241024-topic-nvmequirk-v1-1-51249999d409@oss.qualcomm.com/
> 

I got a bit confused, but I think I might've pieced it together. Konrad
wants to support s2ram (not clear why) on Qualcomm SoCs from 2015-2023.
On these SoCs, PSCI_SYSTEM_SUSPEND (s2ram) isn't supported but doing
s2idle gets you the same effect. You'd like s2ram to work, so you
provide a way to replace the PSCI_SYSTEM_SUSPEND param with
(effectively) the CPU_SUSPEND command. If this is the wrong
understanding, please correct me.

Could patch 2 be sent separately? I think it seems fine without the
rest of the series.

I'm not sure why you'd like to support s2ram. Is it *only* that you'd
like to be able to set pm_set_supend/resume_via_firmware()? I hope this
doesn't sound silly: what if you register a platform_s2idle_ops for the
relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?

- Elliot


