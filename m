Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E1CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1NX/w+RRXRMNKqZKOVFD80ajURS0nT9KzUnQ2eXmK8=; b=QbqBEoaawExBw2WvKOVYveBs3e
	YVaZWd8gz8PWc7AIzqJzBOghAcQAw3XTYTZ1KfDsSLDtwwKps2VLjzin1QOJDIWEJCHvJM4HtNcfA
	hFQpH0OfuHZtlzCAYBv28m9bZZVybWsqRoPTmUTrYl8YHLRH0rRHkyKjljPMOd+yJelhFUlqrIqjU
	rALxyxSZ85cpc8Qs+fvh6ExTlfodkjg/KWbjYU62vUfHDAE4fcf5SWfFbZpvmUihJRf51o5IXX/fd
	7ChG765PRggzjFv+gzpRkA0CSNh3fWPojXBFWQffD6tkJGSD2igAufGmJ7Z/NtunXoixqgyJQV76Q
	V4NkHu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfJQ-00000008Jnr-3bDm;
	Mon, 09 Dec 2024 15:04:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfIN-00000008Jd6-3Kfa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:03:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9A7JiR003763
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Dec 2024 15:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1NX/w+RRXRMNKqZKOVFD80ajURS0nT9KzUnQ2eXmK8=; b=jSFrKtRIpp/uh1HI
	1ZSMggM2zktXcxYeEg12mY5F5vZhV6xdyJWwngeTJFfhhvO7OjURTjDRlx5i8T7C
	QaNYPvfsEYVxy7MjWd1m+EL5J/r2ycVkakFH8xA8BHBK15Rhsm0sh03/hGNSSqS9
	6gFkhhN9OsgRXeCUejhs/vTxNlh3UVqQwsX2Vs9HPJxoBFS66+ie//XrPKbu0iIQ
	pS6bz6sfNjJMLtlkY5SlNyfLCPavVO5ALJtvbVFFxPaoscIH1WEBTSWUuFktmuc4
	oAUqopvQgikVlUkEhtOI9G079DqLTQ7It5ufNv5IKzMB9gMOFwqX03Lrtr9f0vqj
	MfSAQg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgn8r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:03:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8fd65c767so6871876d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756612; x=1734361412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1NX/w+RRXRMNKqZKOVFD80ajURS0nT9KzUnQ2eXmK8=;
        b=rvFbaD+a9oRuORhWqWFl03LkPeVq7mDyerBaiwviY+nnpFiWgzmUFp7bHIp4fmY1Vr
         JfCwAjPGg7JhfJtm+1eN1r2bvzt8u/wHOXQ7iT5J80+/Cz7mGh5lXFlv8UaX5gZn+pyh
         2qQtmirYXmcLtroPAn+rtRECAkvxZwMboBVY0ypqfXDxg+sfi3DGUFTKAsvwWTitr3rq
         dwGh223orpOkrmlKrmjD/kpT0K8LdVEPh/cFq+9V6f3D+iEVtFSEJ+iLeOQ9MT/+ZaAs
         LiKITua9LEiTVC6fh6jOxxfk5htce1VA4XSwpOMiqa82x+3j5gsb2t/lB8En6eYTPtoR
         s4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVbQ8IAZMk6h133vWaOvcJrm+XhrI6S5qal2G/1pPDnPHaBYLuTBKXTDJ9e4yUIgijl3SnszChzDEx4TWNMHV5F@lists.infradead.org
X-Gm-Message-State: AOJu0YwPBXvS1TytJRJBv7Z/pFrtCMQAvdpyzMig5HvoTDNN2aUNNAyA
	BZdB1enoPGNuWBrbZBlUiXMlYRbZbedOd3/4Fdk7jo6rfsYT4Vf6hUkub+F7eZbLx+QYsIH1juk
	H7tgEVGNqjjA+F0xigeD+toCvulUYLIOnflT68K535o9J0fgL8dLnCjfpfqKdO5ZM9vUw8jlMVA
	==
X-Gm-Gg: ASbGncsopD7wbqoj7lExz0l6PUqyE+o3ygljWz9JgCFREhkN9nMEe6v6so89HE3zAgW
	0C5IAy6mNChHG73xVtfIUQyxMEkca0ZWqYsB9MiCu4XmQMo5OwnDQvue/NRMtwV9dDsaqOVCUUd
	bcbEjks1y5mc3apnO+bEgcgP+CoSLGMf6q0a58ib9/d/NCoHd/1jmkikAlmXolibJT1oFHUllSL
	xpQ6oCDa5joC9Uby3/RN6jXgUVYPnddQZZwtNcrL+sjtGqJ5tZ3si3alXjN5k+Y3n/TbOqUTY0L
	qazNwEUENok1Sm1GbQjmpYFYCIxult4=
X-Received: by 2002:a05:620a:2909:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7b6bcb32067mr860496085a.10.1733756612386;
        Mon, 09 Dec 2024 07:03:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHP91iP55Oeu6qjVs4Q6wCz7SyJ+UWO9ki0Vk/JiuqKFG8xeOAuOXTb1bf9EcxOg8/+s23jtw==
X-Received: by 2002:a05:620a:2909:b0:7ac:b95b:7079 with SMTP id af79cd13be357-7b6bcb32067mr860493285a.10.1733756611833;
        Mon, 09 Dec 2024 07:03:31 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698e922dasm64701866b.84.2024.12.09.07.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:03:31 -0800 (PST)
Message-ID: <08440076-3c04-4bb1-b339-071b82d638d2@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 16:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BLyj_R82DsfhTjyqCXhXa6ppQvf84ZVZ
X-Proofpoint-ORIG-GUID: BLyj_R82DsfhTjyqCXhXa6ppQvf84ZVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=986 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_070335_956643_A6EE21C1 
X-CRM114-Status: GOOD (  20.51  )
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

On 9.12.2024 9:19 AM, Akhil P Oommen wrote:
> When kernel is booted in EL2, SECVID registers are accessible to the
> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> on Zap firmware. Also, we can't load a secure firmware without a
> hypervisor that supports it.
> 
> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> 
> 1. Gunyah (No KVM) - Loads zap shader based on DT
> 2. KVM in VHE - Skips zap shader load and programs SECVID register
> 3. KVM in nVHE - Loads zap shader based on DT
> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
> 	programs SECVID register
> 
> For (1) and (3) configuration, this patch doesn't have any impact.
> Driver loads secure firmware based on other existing hints.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +
> +#ifdef CONFIG_ARM64
> +	/*
> +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> +	 * to switch the secure mode to avoid the dependency on zap shader.
> +	 */
> +	if (is_kernel_in_hyp_mode())
> +		goto direct_switch;

So I suppose this would ideally be like hv_is_hyperv_initialized()
but for QHEE/Gunyah, which is not going to happen, as we have
millions of devices with old unupstreamable-ABI-Gunyah running..

This looks like the next best things then, so no objections, but..

[...]

> +	ret = a6xx_switch_secure_mode(gpu);
> +	if (!ret)

this should definitely be a if (ret)

Konrad

