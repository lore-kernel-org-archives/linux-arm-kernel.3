Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0868ACD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0wwZAToO4X4O0TnP19EW/j+ovK4f+GpWzKJzDTpukM=; b=ckh2GA91S4dAtGBkNslEAEKC4V
	pr53IdzZCq2Qs9ISm4CLpLvm8Muyv2GlLTVLZbnbA9NWEPS5jIajD9bbGZvYWYhGFeNCXuHF8NE55
	E0znYNHBdoA8dbZizK5EPeTPOWQegxq8Yt50KaNfKAED/RKFwsKsfQHEVEnmZj+27+BIVF9qzeetG
	BS2R0fVgd+hx9uxTdH2LKI/inI22wu6X4HtCKigLZ2EsGb0Xut9pkdcLkBBYJIBF1Gfu5/rQtFsAp
	s3mE169kskyFRHKTKJ2S7vFvHBupyfwhLEDeZU1iXfrx6tSexICtWuwwWEjvWvhBmZAiUFTs9xT77
	63ewosYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMwR-0000000CvfJ-03c1;
	Mon, 11 May 2026 09:28:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMwO-0000000CveX-2FkB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:28:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4FT1258466
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0wwZAToO4X4O0TnP19EW/j+ovK4f+GpWzKJzDTpukM=; b=P8VcXflmlbOa985M
	L7mLh3gXv/kBUZusiatluySfV9+9a3Uz3wFLh1fhd0CNNpRVrsr62OlDsBn6zX6I
	Au+tJcW2qN2TBNA5NdIZd0CIBdMMVKtQLvnMZ5yIFgUVY1gIAeCmieN4lcfXyVHJ
	00grixdM7x8BRSl8fapKfSXkUS+foOz2GnbrYvhSqYIV9inWjd5QghCPsROG4hL0
	txR9TKohtmMl+YEy8x2NqnAwYL0jGWLhWz3ZbOE7mJ82HQItD96RbMjwox6X7ZEh
	CpT6Lqc4aAEF7n8vlg9IxuqQf+nVja3iBoVLGitcb4ivrsOgkfg5RyIg6NwhW1YP
	BqKjIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag20ghv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:28:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso45579285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778491722; x=1779096522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0wwZAToO4X4O0TnP19EW/j+ovK4f+GpWzKJzDTpukM=;
        b=TBsE25E8XsG5kENC68qNPO65YAJBLH6qOccVFkiEhSSWRSPeEqM2r7IZPMLeLb2f92
         fYr3QFdnVdhMUWy7fR/BvOYmFoJbqKSeTE5wOkj/Q+ZuH3xUYuO6vVyrSKwNgL+N/Wap
         3VY4MtJc+XiDpv3w4L9WM3OPtv3gQPsd5WvdgYtx992CklUyoy7sTtDaNyacu6Ol0qUy
         4a1VZC7LApob/N3JNjBYQ597HGyMXieCWCFdhGQGMOxQ8EoMwmjkGauSxFjeybzTdmIU
         K6a51P+2gQ8wDFLWC9pA89Hb5bLcI9rtJLaxcR0SL1UIto7zYT9SGHGmEJo23AEMmkHO
         SRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491722; x=1779096522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0wwZAToO4X4O0TnP19EW/j+ovK4f+GpWzKJzDTpukM=;
        b=XraUCOsyRBnXQcArZGbqzSRSI5QOCyXTpv+LKDyGREE42lefNK39bh2F3KNLmz+v1s
         zO1nCehGs1bFn8ZH4k0txUWjmV0T4r3HTOBcfXgsKBloyIEn52JEfv9swRjfYBBMuW5C
         XyBMbBFPCtZNnstswHy0TIBFZospcBV8//YAJNW4PKmqsyoMQQuxHAslKoskfzgJ9tvB
         MYd/ow9o6IB4dBLejwyAyUwjFPuFaNGwYBXRV2Fp+6KIQtJq7yN3UwSwW8in2aOXKq/9
         NC5L/dIh2EK8UrBq/QO/RQTH6TuFCU/hWCQVdoqxGmsiS6P1YdhGkJqbSIN1w13K/O2d
         STsA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ufq98faWsMIIadPF/37etcowsn8quCd5SEKErfHTDaiNcDZ6a85Jt0A6sCvXu8hZ2D8LtFVF5v2U+zeCYuJyp@lists.infradead.org
X-Gm-Message-State: AOJu0YyiXxa3rxg7hFl72rEHrTf8r0pnbp6n6YvMyMvAW4sCeXAoP9+w
	A8rH66xz3baOUbY9zJxq4UqP4OORTbU9Zwi/D9hplipG1YZu15Qcn1e5uqsBQUhbdlxd9qQPBSp
	tLHcziGl/lSW2rl3iK/E/v1jS5p0HlzNb+S7njXXVhXhybwKEBkawMNs5tW7j5vzNA8I1vH7Pwn
	J9zA==
X-Gm-Gg: Acq92OHsGcndcjlnzqhaG+2/2csRzzXj3pavVjTMgy5jR51zNicQT+xGoMpxP207/5w
	+JJCUGy1LQ+mX+yA2yUlBbdvTUCoX5Tw+roljDHEjfTOIg0lyes+mnuSNPKFjwGPQVUp7h9DkTS
	IYcK/ziuY+y7Y6gDHD0lxmefRxYH4yYxpNVw13wlt57tJue+tXv5mQw4ZqPFgV2a4F+rYhyVPvg
	/xmyLd2hfWak+YmQaIV7cTDcxES/TC9nqiPxh8ZwU2fUAzhMC+a/CdnHd+7rO9FScrw8pIbiqpF
	95brYUl1/wEonCZvBSlAk7faIILtDEZlVdv6k4PqW8dIJcuffjFvM2ALxa1QnM2tpk4cy+/406/
	3KJhbp10LQvls0J6BL1OZWoUkeAfduUsCIteGPU2xGowWf1TdyhpZTrnvSpm/+y/CtMWuMqWBdl
	5Wst0yes9F3A==
X-Received: by 2002:a17:903:11c7:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bcac76c3c9mr58794915ad.24.1778491722331;
        Mon, 11 May 2026 02:28:42 -0700 (PDT)
X-Received: by 2002:a17:903:11c7:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2bcac76c3c9mr58794675ad.24.1778491721794;
        Mon, 11 May 2026 02:28:41 -0700 (PDT)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d4050dsm92991665ad.31.2026.05.11.02.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:28:41 -0700 (PDT)
Message-ID: <eefdc953-a127-41b9-afba-a07cf5d5734a@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:28:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix source not disabled on idr_alloc_u32
 failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
References: <20260511-fix-coresight-sysfs-enable-issue-v1-1-1b3829748171@oss.qualcomm.com>
 <20260511092446.GJ3778514@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260511092446.GJ3778514@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sAjNtG016lCDEb-_o5zsPDcL8zRRI9m5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMyBTYWx0ZWRfX4p2A8tjDyUOB
 XyaCecFgApSOmL7adKWuduq1BwrfFpQXq3Gnq6dykn8yANNbWS0Iqjs+LAQF/fAK1grBOj7pf/N
 wdaJWP4/ayTWy8jaHb0C7NAKY4ATTCJttm8WtGVPhJziAM2jB+ELrqJWP9lnQGURnNdd0P7TQ6X
 /PHDFIIOkl7Yx8PVdZwQ5UlIauuFxthF13UmIgdDMaRSs7tAmMt68D2tjc2EhstLB4P0TpxWHRm
 iXSk2Y9XYGeFxzFV8aBivINj9u51CK2eeHpWr3Nr+tNE6m0k6pEClluQvvzz+/H9OtDOIDp9Flb
 +ZOufMCNsAbTXpr42JRBdi+1JqoCvLq5DioSyntOy9xA/fClIqoKKr2TTG/bmtWa/XAfDUoHPFR
 igCByyDeXCwEG3sN++yBv7eUQhV4uKhP6inCGGWaw26ShNDAke7H7PNH+lb8MCAobWH/9DF4ABc
 uaqOnmsgEFuAEbcJh3A==
X-Proofpoint-GUID: sAjNtG016lCDEb-_o5zsPDcL8zRRI9m5
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01a14b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=oEJAsnpY_whPMBELc84A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022844_735691_F470CA29 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Leo,

On 5/11/2026 5:24 PM, Leo Yan wrote:
> On Mon, May 11, 2026 at 05:04:44PM +0800, Jie Gan wrote:
>> In coresight_enable_sysfs(), for non-CPU sources (SOFTWARE, TPDM,
>> OTHERS), the source device is enabled via coresight_enable_source_sysfs()
>> before idr_alloc_u32() maps the path. If idr_alloc_u32() fails, the
>> original code jumped directly to err_source, which only calls
>> coresight_disable_path() and coresight_release_path(). The source device
>> was left enabled with an incremented refcnt but no path tracked for it,
>> leaving the device in an inconsistent state.
>>
>> Disable the source before jumping to err_source so the enable and path
>> operations are fully unwound.
>>
>> Fixes: 1f5149c7751c ("coresight: Move all sysfs code to sysfs file")
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> 
> Actually I have noticed this. Since my PM series will remove IDR things,
> and I don't think anyone really hit idr alloc error, this is why I
> didn't send fix for this.
> 
> Anyway, this is a reasonable fix. I will send out my PM series later
> in today, I will pick this patch into my series and rebase on it, hope
> this is easier for all of us.

Well noted. Please feel free to pick it into your series.

Thanks,
Jie

> 
> Thanks,
> Leo


