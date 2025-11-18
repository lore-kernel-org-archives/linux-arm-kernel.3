Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B346DCED265
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=; b=Y0rILZZqH8hnhwcyI/OFWELh+C
	06PnsErEwjT2pN+iWuD2XLq9PfbyIlqxQxHaTXJfisFL5INHA458vcSUiQ5uPAATn3fehHyset4uT
	YgjkwxffWMlZy81Qhw6XQE5cfGZmDBS0oPlofmdrevwXjkEmO6cQpuVY1qr6RPg0oRC1M5byGU/pE
	L++/DwkujEokKUFDytAM1+Nn3ubO8HqeT0mNdwkKS0dDOLwiRl9nXsqvWIO9raIALXIMXdDjmGQSw
	H7SCtELxFskMLAU0fxgFHDvfvqsuzcKLS7zrNXiwsLPrWkEZKegaAQB2rCeySMUFzBXcXqm4XXqTL
	3WeSdw5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIfu-00000000DcS-1Wjd;
	Tue, 18 Nov 2025 10:11:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIfr-00000000Dbc-3E9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:11:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rq2l2665281
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=; b=LSqQmsbILJ6n/45d
	G0PmH/9BOI69YrXMtodKs6YirqaoZ8Gg0l3TzZVzCW7VyWa9cwY9blv3gIih+Tpd
	daIM8z7QH2SlY9PJCt1Kl8GFtG5O5pLqGeAUiVAPLzYtKCW3v8kzgWsnIqc2bIED
	NYzMp/HVm1/uekJyJkPS1pNYPLG776nJpT+r1VUy5RzKUvV9/yuf9JrRqYtq6Fse
	5LhZmd1l6aox+BCReTwv5pDOKpRNiWl5kmfQQm07HbY9W81nWZ1ry1rAorUlGAsL
	BIN3oXSErPUb5nMlS6gLTiESr/eMSv1o6RoGFrd3wo8Gww25hRjum2wbT5VLslk2
	p8xjVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8209-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:10:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so13871621cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460658; x=1764065458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
        b=dfePz4YGJvPe444IMcR7JiAcLj7YebzS1F42IxDi80apchQ/GFKF/83/NxNWL1QkxM
         Knl2sQsROCg4pJIpc7m3iH8/3N1FrmAPkhRzneCviVOZShHMM2i1DaMrqxbE9N3b0cbW
         uhnxsELPElK+oglmI5neg6gX+NRGYX4HKnBY9S5WmuoePTbGRqj/DnvxznYFJtweWuW/
         zC3wJGuI+2Gfln1XedewRn3hai2FFH9xbg46DrHXGKy1I7TeLHURrM6o0SC9BZSZYZnQ
         9xRXabtH6o2GnRIbX3zFahVpdLlYV81+EJ9xXmN+4k0xcu/g82hYM6u0Lq8rVM16xcIP
         QJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460658; x=1764065458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U02eh9bqJE1p9hqnUKH0dgcb2ZclOzx3BYb9xwfCu5g=;
        b=I6QbxLB0FpRQ0sj+VJWJUaMkAyXU4wMQKanQC22F12D2L9Mjrj761/ZGLh40rQrBTr
         jRxHGONXz1EOzxFfFV1r3Brl9Qxi87NMdqWGIDDt6cFZDA+FWhk5JWeSt7pf9Nfter16
         gYdNDeZx2EG5LSLD/MDKlpawVg42zoYK7cJvPPkcnIrB5MFO9tnDhzD6fxxhPW9G1AhZ
         XCbRVnAciZjmNcCuMFKCME8N9R4CxXlaDHanw6gZ5jfTfyC0o4zcYwZnjz4/wwOWUPQ9
         s/VGmw64jSUixcULnzyuiHTpMejtQHuMgYhPKwY/OiV44Vtm99Nggh6sfnItUnB36JCx
         /aDA==
X-Forwarded-Encrypted: i=1; AJvYcCVNUpIXJtacRXEWKfrxB8+pUb7/P4t/Bm3TOWPTf/KpaLoe5p3QSk0yYpJ5Dy31CKDCYVmPVzIxdDZHyQG+OITK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhZwpW9zC5Vgc8EpJCJ+O82wQj0wDDiBWBdYh6rnsLZEN3t82Z
	/EHi4q0MdA84A4V67zveztx/qRmSAA1scjolKwevbVb3g5Gztv8tGUOuw0iKgIXwfEyJZh/jHDs
	z63e+hmpTqQJTk54fq733c2lgRU40kYDOfntp8sXdx+y513ChgdnfgRuPSyumxsMaKSvVMfNWve
	1pfA==
X-Gm-Gg: ASbGncuNMWSruqXGpdNi0tU+kd4k3bVZQbp/GCe1DEXfsWxNkCgIsTMMlxXt0XuYUam
	ZjMK3zKdV3rbVF0MWKxkiWh5SL2s5OdF3ZdR5uOT5PIK+zMAI0s8fvqTzIqjwXbxmfEhZ2IrENe
	CF38W116sEmuGoRMlsEMHy9s1z9p+DQllzIg8zDwycr1gdPrQ/akasHwQpJOJQL6EggfvdnRyFn
	AML+u0o5fFhdZLGyqeCZcC37tR0rmU5dzhixVzpB1cq9xoFYyl3GTKfmW6JvosZ1zAbiOfy69Wd
	PHDZKr4NRAeOGhQciMXGJE3AOozenFtd8nQ1/eBG3gN3vAkEdIiwbJDSuAdU4k6yMLDIR9YU3Rt
	RE1aWgx8vLtkaHjKbui5cc0FhkWFANz7cyvTtto5233JmrdBVstBgB3E9NjeJmykccVY=
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ee3182237fmr20160381cf.10.1763460658066;
        Tue, 18 Nov 2025 02:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz4Ftkem+yYtF3nOBOFFpkdhV6ZE7GbZunxdHTdiyocnrRN9QBCgvxmaVDrzMTewaoOz9MgQ==
X-Received: by 2002:a05:622a:20c:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ee3182237fmr20159971cf.10.1763460657671;
        Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-644f13ff4d4sm2997956a12.12.2025.11.18.02.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:10:57 -0800 (PST)
Message-ID: <1c438a94-fc9d-4322-918c-b6ec1a4cc5a0@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
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
        devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T2_P0yCeJBkUwsFhn7dqCB4_7DO1KgxN
X-Proofpoint-GUID: T2_P0yCeJBkUwsFhn7dqCB4_7DO1KgxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX/Fb4YLNazZq/
 LObkE4dzcDpkQlLHEPDuAdy9RYJ4kaH5M2cjmSSMrn8qvdPfUNcpqu7OduiCgu9nPlvmVK+yJjM
 9EpKtnxHTFXdQHZsm7/Ycr/M+U57AWWSuMFPxPrGM9bUWk4ckmWgMrzQ32xeKYGVxbBez4aAYFM
 ulg+QCdeO5IgU12HAfSy9vVq0GsIZg/no6q5vy0Pdlp4WrIqlVWZXHexGeD5wNpbg6VXwYKjGs7
 qFWb4TIPN8hd7l2fbWw3Dlw3laKRaf6Q/pMzr/mga+yrGN2RE68MHcQWKg8066KUlLa4MD8CYjs
 ccnEMW04o5n7SAqDx/3P1muvOJoIjxhcDKr7zL8AcfG6HJb2vn296WeKkahb/+SVAxuUm8/ENlf
 KZXg2TmbRhLWajHe8rQ2/sD0fw2lbA==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c4632 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GtNZTxoBlHEkV55hDasA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_021059_932043_C6888814 
X-CRM114-Status: GOOD (  11.22  )
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
> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
> in Raytracing related workloads. Add support for loading the AQE firmware
> and initialize the necessary registers.
> 
> Since AQE engine has dependency on preemption context records, expose
> Raytracing support to userspace only when preemption is enabled.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

