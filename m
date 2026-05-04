Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68904FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=; b=tqmCUgsXO7/gjblE3thZtH8mrE
	YAsYpzu03TZC66Go6AUNRNaoV76hDxzPwJfXAU4TNEJyca/uwPDolDcBgcqUWTPQ1r11JO6tcAPXr
	JUkRkccd1tq4T5YFYKPolfaVO5d+ZV5gerfTBfi3RfgM89bAVAzA34V8tBmQEj7EaHD5nyyppHIer
	UPbLwaVo29UzgonnyiG0BdT1pIprrNUNCxyYeyjbso67IK/wWGsfzEA1+E8l4VczOizCSxIejHw1f
	3qavq1nU68Zpxa+SPKpzNUKuFOUo22Xx+jeIO//H4JKIGhCeDXFaq0rL9in9geulTUHO3OBWMNcKR
	AvJxCmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnO5-0000000CZKu-27eO;
	Mon, 04 May 2026 07:06:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnO2-0000000CZKK-3C79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:06:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D65c3479848
	for <linux-arm-kernel@lists.infradead.org>; Mon, 4 May 2026 07:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=; b=f7L2ScIlzgUsnpyR
	VfiAY+btzU06ihT9wy6Bci1LzEHY7s61RGfpJ53JPMrFVFHpQVYR0oH/oBskIZ/8
	25xCyzCnD/cRUoXJOeGts5uvW/GmGxo5aUwYCkgiwW38Sjqu6IoUAEETcNX1Hzg9
	1YJw0HrXG/7OYfbWR1rOfgSsgILeAPMSewfoADdhDSt0uklFxOYgokZW5kS1f25K
	n3vybFNrOew5sK58srARoN8cQ8hGiNb153gQ2HCizr5h2IJQmiu8fVE95XDvcpye
	A0DLHw+Vup9CbRNvAB16k+rvDmRWXr64APNXIxpTjx/1wizdOLnB+Oht5LNYFGwG
	Y/leVA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3mnx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:06:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso2804404a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 00:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777878396; x=1778483196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=;
        b=KK2TMbEV/RaMe2HktH3Klbs9suyKwb2Z65z1sqqJqhbHcC0zHa4euaH7ciGLhBlOGy
         xUqW+WJh3UAg6svivHPFP7TO0zEGoccGOz0U1ZMnu7dWqzUw5wX40cHOWa/pnXZ0ydLC
         PG0SIspM4t48faIpFOEUxasKWsRTAyglSMizacnG9w57Q2IX56DD0m9+AOJ/6uoPHc+5
         x0AXFfWboCBfe4Fx2saXbXuZpB+8e+/viZoevTDiy8cdWW3U90dfvL5YQHMj5gRpECJX
         AhohQPDi5MhhtlbV7fgihtCLUy/hQoHl9Jqli+W/bEi3JtrSt24OejMYwtjJbpg+g2pb
         aQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878396; x=1778483196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCWGn2uzwamB2rWwC+/Q9KFgMXFAeWM7XXqwwI7+OpQ=;
        b=QhN4uSrGOwX+rz6dJ0sAiooufPRmzkUf8ZGoMJH9G9+H+Qf7X3XteX2b8wqNxO3xdE
         dpHHRWNIhC6g6KQu/ZnysHA8RjaVUP8wAwKQsLQIgp/KVH7XOdugN3jI4yKy47DzXz1/
         76lXMIQ4DvswriA9POYMZpDrO6Fh1hC4wvERh6r+pkIyk6FYqlZE1YHgoQmWxTjeAt1S
         xOWoPVStPqkA2zDAZwEJbx+aBe3u7h5WmDwv2Mjbfq7ZP0aorSNKmWTMFMLBLxCDa84i
         G4s1RbTYjHKpCB+Oz8LRGmsXxkHr4HldnHkfMH+fkcuLCinStoUeEq4lX+aW2sC5ZtF9
         2qfg==
X-Forwarded-Encrypted: i=1; AFNElJ+7HTHMJOIXYqM3ZT8HEBM8hFUS9Goo3JqrdDod26C7ZLYJc1r1Ffsm8/mm7kAgLJRLgK+u4IRtBrbwd2/1lz2a@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq02rnTzjXC19a2k9BHQncllESbUlt1k5BupUUyFTFmreXimSu
	Xy+ygb/qRY/fcp4Y+TsarAEdIQwYaxgaFJcv6pt/jotkHpmGSNA1eopy7PPHK7FVowhZuC1f0hO
	i/CcS86m5yATTMgxtnPPsDQ3428rkTl9zaEgMXBBtWizzJJ7T5nY6f5a4FhBLDg5gteyCdak2IA
	QWpg==
X-Gm-Gg: AeBDievBOWfyVchYqXE60mMx01B4crWZ2BjWB6oljHtkomx31L22PGPF+suo+/SYhbA
	PImh5hZxnUWZy7qm9nQRXE87zLJmfsHKfp6OSV5h/sMbY9LCzHyXeU4oO77cUQKTrkwDoAmHi/x
	8rwqVjQ71iaw9xH6/9yJMm6IhXmBZJ9aMa0S+FkBKeEbf9aSlGGwrzd+Nv9K2mWK+6c+q3ey2Dq
	or+J8JSkFaXF0BHci937I3MufqvYO8k+psRHUk7MD5x0yNpVnPI3BoyFgu39J0IV5TaDa7oz/Mw
	fYCSsSeFmgOMUcml5MwuNWJV9M01RVTYDbKc5UOPwFHxIi49FAV8Z6SjRzUuKrJyitJTvhGs4lp
	tI6BtyMcLEDTAJCm0LfwudGESjj2PAvHjk9pm7RsvWWCZgghb/jMu2y/iChG+zL/cpg==
X-Received: by 2002:a17:90b:35cf:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-3650ce8ef42mr8906526a91.18.1777878396364;
        Mon, 04 May 2026 00:06:36 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-3650ce8ef42mr8906494a91.18.1777878395886;
        Mon, 04 May 2026 00:06:35 -0700 (PDT)
Received: from [10.92.193.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm12883779a91.9.2026.05.04.00.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:06:35 -0700 (PDT)
Message-ID: <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:36:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
 <20260504041407.289464-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260504041407.289464-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NCBTYWx0ZWRfXzFFb8Ue1brue
 0RoxgnIoq1d56wam/7A71OkwzvXagmCHzmOhC3n7ddJGlKIknPARU4aAYW2+aN4f5hYnV77qMVy
 YTnis1UQEgdZxjWPdacRDgPyChZ0yzmHJwdlS+CBbtgAU5gGcPmrf+RbsZIA5U6fnyVsWGVBg4g
 3uXEAnd1dEeHgKVJOPfi9KJwTvbFlt/OyVdk0lZo1VLEU80gtmfsz1h1L3+w8N8q46EvkCaPYEd
 zhaM6+3d06e7cBJNXub65FTqlSeitkZJRzhBukkEQCEWHYbtZwCrB1sx8YbgQDRrAlzVCDeJtR9
 7ptZ1o/zkhR/89iojd33jjc22YTNHD7QvapXC4lPiiO6bf4biI8G/nrB0naDYPQ4TRL4AkHhwv8
 qETj2Vl5Clf2H470Kmg5ACvt92cUEhX/opnTSXOcE31TYcwpK+DQ6Z5LqL14TM6d/qjnab1ZSed
 sheL98t0zfduIYynuww==
X-Proofpoint-GUID: BAHqppQTOZPtoqznLzuRSb0fNd7p_Rm-
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f8457d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oJpzRAQ81oZ_FtZBIQYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: BAHqppQTOZPtoqznLzuRSb0fNd7p_Rm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_000638_859585_02863CA5 
X-CRM114-Status: GOOD (  19.47  )
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



On 5/4/2026 9:44 AM, Steev Klimaszewski wrote:
> On Sun, May 3, 2026 at 10:37 PM Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> wrote:
>>> v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
>>> and unfortunately, the machine does not seem to get to a point where I can even
>>> get logs from it.  Do you know what I might be missing?  I have *not* attempted
>>> to remove the nvme drive and boot off USB to test it.
>> This series, will not have any impact on the boot, this series comes in to the
>> picture only in case
>> of suspend and resume. can you share your platform details and kernel you are
>> booting with.
> Oddly, it seems to, because if I simply go back to v4, the system boots.  I'm
> using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
> https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v5
> applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other information
> is needed.
Hi Steev,

I made mistake in re basing the code, can you try below and see if that fixes
your issue.
I will send this in next patch series.

--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1327,7 +1327,7 @@ static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct
dw_pcie *pci)
        struct qcom_pcie *pcie = to_qcom_pcie(pci);
        u32 val;

-       if (pcie->cfg->ops->ltssm_enable)
+       if (pcie->cfg->ops->get_ltssm)
                return pcie->cfg->ops->get_ltssm(pcie);
 
- Krishna Chaitanya.
>> - Krishna Chaitanya.
>>> -- steev


