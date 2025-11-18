Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C3DCED260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=; b=Uyn37CoOxFoX/q5mkwhTSll9eS
	RWLydAgXAfahbZz+QbwVaZ59fkjurzO+G1GlgnDwKViGBhi49+qGiZ0NJOAgyr9FMDD3WkNlVg+5v
	YFfqBZ6Rwu0KJblkvzZaeBaX4BSNo/HbQpB6ESN/QBusm/99bzUQVEAcCbruJBn51LGtOLnVKa4xw
	edNSEW1zvYbycYVHVkDuw2ZpQtBDhiAzRwKYKG6qlWPFcpcbOwjyonenUzRbfMKAj+ERNmMpJAMjS
	/rJb9qafKPUOtiDqF5LLoCVOgmqeKvQvDh+vek53jTxkbqOnf9DTvHL4OWDdXIEwbBw6dVsQNGAqG
	yCJ2ntog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIeh-00000000DLz-2Ne2;
	Tue, 18 Nov 2025 10:09:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIee-00000000DKy-2wee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:09:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rrI02665538
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=; b=GzmP8zWb6LZ+TQYq
	2YlKVJKFLi6qZA9tSJfMbgKW3CE5waFIrbAsCTuu6eIScK00r33Pv233EF/Fk8Ay
	w3qTpZ+PkhXLgVtpU6kaRSZbgRJs/kylg8B5HejSwP6W2hBmhk7Hc1vKrJGZQ0Id
	7yXn2grV5te3qPGf2XFw9jSu4XSAZzgAM83S8WeMQj2U7KeJf7+wgnD3oNKmVfcc
	dlWxyJR64rI+CPrnwT4JtkHTrGClgLj2RxUo8dRBvqeXYHnaXTJDBWAhx8ePvJMd
	nJEwc3QXWs+JFonu7sDhJCo8sQHNr2bDRmiugJV9b8Qziw0tETjFFGNfXcx3lzch
	5d+unw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk81ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:09:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso7308111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460583; x=1764065383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
        b=FZyrZGWvIoZmulrNGaGsYXCRDHHtm4IPoV6sl2w0ix1VHG1KpNKhnVPIpnwOCp/Xfn
         4d+6oAV421CbNpfvEw/6L725s2K+f6ajbF38JTCW5weetzIdX9p2tYIindmW9Ij9U3ss
         gb8NfuRxdLe3xFSNXigQ+F8cVMFx2eDQb/nYilqBWoom8QYvIwmW4ZB3qzIm634TZcXN
         ncUB86a5yySMSHs9+GA6VprO/odgs6MswyMEoQiebBLOZlFj3kPG2ANbQ3+r1tPVq0Pu
         /+4j5VUVMLZjTNpZSSAQ92+9rdYxemVJD/WVhDl+rHQWcGFzJ8HOXkQYhiIUOZWfKNX6
         ZYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460583; x=1764065383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpA86malWsoC8khMUULp/bosX8u9eRqCjiBugIRYxnY=;
        b=oCkKXssZbVnUrkXLaiEVdX5QRJdCggvuqjAKJ/gDjHGFxk4LHCzEy51UHyyaI8myKx
         QykvSPSbtQbuVmcwRdPs7B0NHVNgLcdZo3bxdpLi1idcETHIn3wrA873cl85FbaeQ2k8
         jBtSI6BoDk6X+sSB8NSs/602/oYCovkTv4GWXo92e82cVpqQghfkK6moTks2nHNKiXl9
         5a7Q1ZrWo2a8oqeBlwU6NVam2SaC1VR0y86EjBQ2PFdGm+kYClaML6VFgkjFAOVB3/yR
         kRaI1wseNoavatnKWk065CtpkTp05roR6wJEUYwi9gOyAzzwUdX6QCAA+SRVDGniIcEb
         xBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXfiK7b0hy23Mk8YFSuyTQZfgrWaaBIAAQfuuyHKn7yNIfJxYq64EN58/3M2f9ENgo5kr//s7dKHdDox6uWuT7@lists.infradead.org
X-Gm-Message-State: AOJu0YxCix9C1PChg7lqpWk7OzoVCZMsoeT79qM3WtyGyEwwsXDCuQh7
	SUCndSb6RrHty251TJZWpn/UCw8n7gmJfnuimh3v95eg5Fx8oGMHy2/vKZfBX+xZJPmeQdtlAYV
	w4jLsSiAFONCb0xOWJ1eVyLBx8geR2V/xpr4QDoBFOfYH7d+YZ5uYqlli1jnUHbLupJFzQb+Lyh
	565g==
X-Gm-Gg: ASbGncsjQw94DYwmiXNe16mHwoCzN83L/H7TO3An4dEYFNWkf06JQKmGV2sTnHRegde
	i1fEwAu3i/NH9gktzv99mYwVI9z7XfV3MwE/BN7dTsxgft/uVlaW9S+WEOgMhbV7HCVBiLryl3P
	evSh0JkQTMV0bfMYLln+FO4KP7gyzCGN+iweVQ1Se9srrQzv5MGVIvlO5zmg/IObsbxixnwQdXu
	QD4e3mdpCON2k6oaXktjql7VPDsV1tby2+3Tc2lcMEvD2Y8QoZ7JncBEcnrGwUTKV9IdHcnS4BI
	PMIIfSzL4yTSeLglcnr3D7Wx8hLDLfXU3skLQJNf2O7LqFuuj8cd3nMd9CPezSwV5SM2hipWPnu
	Tx5xOZI0eFqLHNcAQhvb8/hVCFvfpgovEGCu5m7bfwcQcdOT8IcXGTxiqXExSPmFJ55A=
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr148537301cf.7.1763460582659;
        Tue, 18 Nov 2025 02:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN59Q61Eb2CNlYDxQpBWVtF5VFujGxsR5/ckcEtaIq+KMFxkfUpWv8DK6msTFYM50HKOrU6g==
X-Received: by 2002:a05:622a:10a:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4edf2087991mr148537121cf.7.1763460582152;
        Tue, 18 Nov 2025 02:09:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm1306025766b.30.2025.11.18.02.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:09:41 -0800 (PST)
Message-ID: <0167a373-79e2-49f7-a765-d3a770ff2395@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fgf6ACED4uhXLzCJsQBM11IigzNbg4KM
X-Proofpoint-GUID: fgf6ACED4uhXLzCJsQBM11IigzNbg4KM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MCBTYWx0ZWRfXzSIOOTO8gywz
 WcYRZD2HwsXXtked5eBugLEcsrtmEaqb1dpSDuLmU6qZTocK2QrtRzjipownhs0mntdL48CWjZG
 Dw8jVyE/meqE2oFcQD3Qc+zMGFLaGRkzylNelsVRo0gEWVgXTjPa6O/mtA8xUHtxXHhuAjp31r/
 Uzb/UHU/6NjuieqrZJGmofKoG6MZl1twAVnRZb+Hxqdgmnr8oHmGiSMRcuyA7sC3CNzY6l06Fy9
 acTVNjN0nelu7WehNq5yBd2wIORAuKHz5rsnF3Nog++hNGZnlTsB0H7tlaGmEc60r6ALYEcSKp9
 bLFP1ii6D/47nU9zrvExFiQJUKvE1bwOkdaRqmIyfyqtKVbB/MUgBc9CF9ega5J19zYsiaGU39w
 iZoqU/HkcKiAPqstmAjdD7tRrMze+A==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c45e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MwKg9OkWFYoYUW3DDnkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_020944_865444_FA4D5AB0 
X-CRM114-Status: GOOD (  10.36  )
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
> range. So, use gmu_write() routines to write to this register.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

