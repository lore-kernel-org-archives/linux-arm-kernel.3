Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ECBC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=; b=TUupmDLH6muGxw3QYG0SyBBUEF
	C9N+OM4Nta0TLy4cM6RfGpZgI2EwyFds/sMy3WRUjezAm0KDyVJNiFMCHFfsfvXfNNic7AI6vH773
	eijmFwDd5TaVhXG8Y+vPqypGK+pe0KlLA7TelbeSH5oPljvIKEL6ODo6JjObL+fmUDNZ9XqeiP30d
	2eGbgsVCJV/2WkV9oElalSMeiL2CqbWDcYEKFb09jEjonvISD2SnDhvzFxv8cB+XoRsjCpQIyIoOu
	n2ycMvJPg/aE3eDKKeO33K0FoyaLtvesb03PY3P/mEcfhQc9/6rf4ahWn28XumUCqH9uHbyq4y2GE
	LdhI62FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVsR-00000001gHj-2hKN;
	Sat, 14 Jun 2025 18:45:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVqG-00000001g0f-3Cok
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 18:43:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EIUePr011636
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 18:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=; b=E4BOk5zds0DrD8NF
	shEEzA0umYdl0+l2QQoDtHcBw3muKjC9CdF0eGWK2JNLFxH+WubblyadPNBhyJDt
	pdj9Gee4bbCTyNCIlObEgpXkd7ae/0BTqpnVCZO3Lfg+SK3uhS8vvoWziYgusxa+
	AuIiZnsYaItRG+Bt+CubgkgVNA5IuJUqElDU9TdWnFjjt3Ay5s+kVdp3iQefFfX4
	NqnCqEKE6ZAA6hwZMQRhN948mAJzLL9KTH6DGyLD3iCANdTsO0kLGUGTATNwArcs
	AuVbw/3v8ac2hLPzkgBQSO6Z3HDhsqFdkZOOOmUYkmgR13zR9ZbL9JPWArBm5Qjs
	vN4WOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcrvwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 18:42:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5b3aac5bfso8181981cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Jun 2025 11:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926577; x=1750531377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iLwHJ8QhRIGYKyF4YaLlo9Wwe+HrqcTZDg4UUvCSfuU=;
        b=iJZ1+JtuCSuipS8dxk1quaTkSJ1t1DJhPVmcmQO6tisasYwhywImNhOG4DNTizw51A
         fiE4I+d/SBSvclmw6p98WW1l+wgZfJ+oJ4xvHossKwneMcJFwr3CPUdONQ26pNS0ktzr
         HoPP4mYkeA+XCCKxFP+FecA3GXYc84ra7pPhEuN2wOq47NCNFIOIL/6+ShtwIukCaGIo
         cP/oWhL41WVoDNmUdj+2+6V9tbCqMb/n0Pmwq36bepVcIBDG81MilY30ybgv+gC5yekT
         pBLJm3e2+kK1ZsYeciI6X4iBpUcuuh7wYq/qxk9rbZhCGXhzKiyLLpsyumsUtHYiDRD5
         +GCQ==
X-Gm-Message-State: AOJu0YxbqF+8nLmapgtk97/DTzhFZcpdibR8TMTIYqrAralUZVCs2rk0
	u0/XWzO8c1G91DN5iZ+zdh1XrOA4OKn18MW46Ef1TS1SZzdnUEic/S0Ojv4PisOkuW6RVLNqJx5
	4/4CYG2WqqwklW9O5rugZmS4wtuijq6xyKbHGSbLww8DWQ0Ri6XB9qH1VxkvzMzVgzGVhNDMCkZ
	6WGQ==
X-Gm-Gg: ASbGnctMlP72soqYDINlSPipqOJapzqioh9THfAkgf2mdhN65HPKIzZUWQHeoOvLoai
	mjgcXAH2XRuP9OaWkKueE8iT/97NHTUiILpbkgK7BL/5VhMkptDALJDeSRDWK0YwayXbiCp4+xY
	M3TkZSqJAWYVCiXzIuo68XcmykpbDCm8jaxEd3jCI3/YpQMvySGM6JPeGtJNfjIAHljCfnj3jqZ
	s1TRLmGWYM+unuHe9IW3DrpiEbMJLX2iWKbjZ0k8Eds1htIsy1s26S+1AMRciYiTAyr6VPNuNHo
	wdcLLMCE49f+tQz8Ns5/Q8kpVNg38Gep3ltKZuYETEp08qdlGRMKhAt30cWssHiEoQc1YVM8LRC
	LiZ4=
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id d75a77b69052e-4a73c568fd6mr22438881cf.4.1749926577326;
        Sat, 14 Jun 2025 11:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkYi18BH9yEJbdfQSZZnPYYS236AqGcoTRf5C7tWQLhoDTwPCEtKNQkvCzqxnaF0WVubY/jQ==
X-Received: by 2002:ac8:5d0f:0:b0:4a6:f809:85d6 with SMTP id d75a77b69052e-4a73c568fd6mr22438731cf.4.1749926576868;
        Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6090063ff9asm293673a12.21.2025.06.14.11.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:42:56 -0700 (PDT)
Message-ID: <29f1de05-0e55-42b2-9bf3-894bf4f07808@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
 <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NyBTYWx0ZWRfX/Gvx3XhEJChI
 7zRHrQkc8wFfD0H7M8MfTr7Z3FQHDeg6fI0XYCfAtWBWlDmFcznAg2I/aWKU/fmqgtT/zsJ5ttc
 tyujG/eTPaIHUP+pSLB8E8poa1Vk0E2tYZ4MsSjN9yDUuEuflFhGA6c+R45wn2IeScCKGMlEtV8
 gnyupDDEkshrA9Vx/oDtaerztRGmIZvK+4kKNrUnFbIFg4xIYoO/9IqBatByL7tJ9sMRo/D/4Qy
 H4TCKsys3aOHNGw1PO7aOt59Me1pPpmLZu/7yLbBzRmbs6uAGVDfCwFddZdvD6te9gWZvpM18jV
 lH5PA/CDqXj8ZFQw8cW++IETNjfrWoJ4fcxw3FK4o4whlKJQh4ua/yZjvvPqV+QHfPwq8Bz+wrf
 HX8NKXRSNjKsaLJlon7BYXpucZYqwuWp4xDWQATiGY7NK5Ni0HfIY9NR/yr6Qvm+90TqRY7U
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684dc2b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=phG8Y4mLfM-ETw-KuG4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fUv9CAD3ZEU25RT2eKM4mW4GV8leZlJt
X-Proofpoint-GUID: fUv9CAD3ZEU25RT2eKM4mW4GV8leZlJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_114300_808971_C2DC573C 
X-CRM114-Status: GOOD (  22.38  )
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

On 6/12/25 11:19 PM, Akhil P Oommen wrote:
> On 6/12/2025 5:32 PM, Jens Glathe wrote:
>> On 6/11/25 13:15, Akhil P Oommen wrote:
>>
>>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>>> version). X1-45 is a smaller version of X1-85 with lower core count and
>>> smaller memories. From UMD perspective, this is similar to "FD735"
>>> present in Mesa.
>>>
>> Hi Akhil,
>>
>> when loading the driver (still without firmware files) I'm getting a
>> speedbin warning:
>>
>> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
>> missing support for speed-bin: 233. Some OPPs may not be supported by
>> hardware
>>
>> I've seen that there is a table for speed bins, this one is not there.
>> Tested on a Lenovo ThinkBook 16 G7 QOY.
> 
> Hi Jens,
> 
> Could you please try the below patch?
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2db748ce7df5..7748f92919b8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
>                         { 0,   0 },
>                         { 294, 1 },
>                         { 263, 2 },
> -                       { 141, 3 },
> +                       { 233, 3 },
> +                       { 141, 4 },
>                 ),
>         }
>  };
> 
> With this, you should see 1107Mhz as the GPU Fmax.

I see your dt entry takes care of bins 0..=4.. this oversight worries
me a bit - are these values above (post change) all in sync with what
you entered into DT?

I'm not saying they necessarily aren't, but I want to avoid
inconsistencies

Konrad

