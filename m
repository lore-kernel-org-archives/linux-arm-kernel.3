Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4FCCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=; b=q/c6DRsjvs+2Qsxab/oOgjGRcC
	4bcrYh3hZJuAFJ/Wl4TKvFiWJ0YCZaRxrNxK1eFLV25bVRChd8Yt3NuC+NeY5nYywqfvSPkA37Sc5
	qFcmjgAFceyaToJ+la+UqvxHPsz+VWlSNmvtaTz2hV14PGJs9HHkUV49jC6bKwdx+Pcr3Mtm8MgL8
	HVMPbGrKFLxo+ZV0PdZLW1VoCW7OnJdaPqlbpMTZO0GNIid6PuEiJ3UJ3AgImAFgxQGfOmlqn1QI+
	qVvBHqTS5l5mAgXGNggFg2Q8G/hgO4U99Yy8qoWXoicw8B+JRBVd132C7pK0flyRIyOAWMcN2Pz6S
	xIiGeNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzfH-0000000GDWH-2bci;
	Mon, 17 Nov 2025 13:53:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzfF-0000000GDVh-1rmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:53:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBwJGD3040293
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=; b=mFtFuGK1MCuVmr12
	f9haVzaVKOz32O1RSgy/Q2GSQLp0IWB6W1rgvDBTRR86RSit5e/+gL7U9Xf4xY8P
	PpvZb8gQE910myLphQRL2OWHai4slaABAa+akYYX6cdEGm0iZinbzoeouP3lFqwB
	FiE7ADx79zOF4EWoLQio/1MMQ/F9Ipft88DUbf8M2q+dpOgrluXfim46yIfXD+Vl
	LGgURcg40mLjKu/qRRbcCHsAuhQRpz/dcSqa8Vl0cBZ6skK2SqI7rHe9TqHvZr9m
	RYZdThUlTtssyPSjrI4YTIolsb6e73tn3hD+UU+sLtYBVCq7O/CxnI8efXt0ataz
	og8aZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh04wpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:53:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927183so1720161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 05:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763387583; x=1763992383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
        b=avJCkq3q1OioN/bZtiw2CYbBV0Z3qgFXW5wbdq3UV97Bh52/oDrZmfoXQVWLfna9jM
         dL1W5wzlCBXDKkGdDQD+KLbsH2g9cedkh3A4pF1y3cxVtTkuvV0iYhMtNyeOx5/calnp
         KiLJNVL3kdgljkpUD2z1pfpoLJk4E068NVzJqxXZOwbv+HECZOGZvxjsWsQMx6GHBpJd
         DYAGVpv5ztctI2pi6/8YlNT0MOePNfWtWgnsxgDXitiXxxj+WmOCQBlS4oGp+KyFZM4f
         UnpruSfJS9X1jPqxOkPvmX/Ugf2KWeRXM8ZgsT6bVxF9FoyFbY5mpEZKMk5FJ0qo9rdu
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763387583; x=1763992383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yi+BdGPgnrk+oNWxD1uiFb+dRMmL82ThS7ds7IVksSw=;
        b=KyfEKmzmgRjkU4U4bfuCIQUpqOwkjHpGTyLyZwFYdXVhcWiVCU5gjtgQQI1ULmDmdo
         Upou4Gf6fxvUMLTZL6x4oq9zzCHHuEORIIxLpmd8WhTE/cUfKPr6D0UVqrRYlUHE8CHb
         a9S8rRTfqcGmRB4Hfi8SWwqxpavxqpXM9mJtTv4I6pZ86DXQ+TeV1JGed1SNklkOejeW
         6ZL73us1G999qEKfm/rL4ZcbvVZgPakl2Og8sfrzK/T9TkYdZ50wAHv6E6tiXoMTRasP
         wW36EP3GF48+FQaXrRh162muHnAC1AcwvlnALb0CzlBkFe2kUZfL/FSc4i9fcX6lrPXN
         d2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2KmCgSLDYykHnvRe4ohSkmznAdSUT5p1e0hwLY2sTj9lVFJxMI/VPwDeKBUa9tRh2a1RPdTrWxoVzemD3u49X@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn4glX3fCKO5vsRNw0akPUpPsIntuq9zf0Fob/PVUz7P9Vv9DF
	vMUrSMtksoXgdD17Jt/d/vhHycO8pkcny9mlkc5KHYVcoesPvv5Zi0r2T/ojgZPEXfCuJWIuT3r
	Y9UDCbN4tEXXMnA0y+g+MErrD6UpMzhh3dreGr3Gr4K5Fs+2XoUyyxSSambwlYymF7+aV1QbOBO
	tvrQ==
X-Gm-Gg: ASbGnctqhKENa7isdpdf4uvrjHE5ClX2Jck+g64jlzk/BR+xuQ3HSgZXEJcIRqBP9Qw
	eRNyd5ruQRz+vCjMNBpzSpGBUswL6kqD4lIUY7Ozu2xoorBlyv64RTGHzuI6y+q64beE5owxYaB
	UV1KuvERuk3VbqDsz2P2uT+IJGXSLzcKJVSZH64mSIOLINgkMSPDL+my6cFMFtKCFKHHcJNEcxm
	alhrk0yK9KCA96uDY5JPmrt5ThyTNGgK1kJ7lj/lIBuHrS7hF2sg0e1k7TCP+HsLasfQtVwYrj3
	YJ+UIMHt4EA4PguqDcKV+dRXbQZgF8tpfY8PS6Nlkn0YI0EEm97oKx9nC4Oy5HppOt+hhyLkUnu
	gsQALAp7T99iIlgozIyjgWu/mf/F/oLBNUOlKDjFOnDn4mb+4GDpNzZLF
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr73608931cf.11.1763387583510;
        Mon, 17 Nov 2025 05:53:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP6/ieJt0wbfNJVaOx0h7m7+0k3hS0h1MhOub3nCOiBuEQbZ7V+KAM8rQUI0q8j+iY7BfrDw==
X-Received: by 2002:ac8:6f08:0:b0:4ee:1063:d0f3 with SMTP id d75a77b69052e-4ee1063d7d8mr73608341cf.11.1763387582843;
        Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad43dfsm1089481766b.20.2025.11.17.05.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:53:02 -0800 (PST)
Message-ID: <73c3de56-5c60-492f-8b1a-209b5b06e7e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
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
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W9U1lBWk c=1 sm=1 tr=0 ts=691b28c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ws8SwQwlQu7ULn3ZA60A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: R2lPMeMWlzE9aIcC_NMHnsU-fBavBnwK
X-Proofpoint-ORIG-GUID: R2lPMeMWlzE9aIcC_NMHnsU-fBavBnwK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOCBTYWx0ZWRfXyyw0t0Fip1Q8
 KsG9k91BydcSd6qtSmGje5AerqeeHmaO4KpmAkaFFc5wKhSZ0xzvyOe9dwcztj56FRBT89esdVJ
 2fBoD7gJmkUVfD9GgKnlB9TPOxDmmV5vTGjSpJNdCpzF04G82uE/EWW2kkid6lTkDvdBcYaA2dV
 agk6s+tt0db2Ovg04thXJDhWtMxdTUZeY7qTO2MZaplAy+x7gipQnHh7KnkE9A0wysZ3TUw9XlQ
 gluZfYXmpDqsTh6XTgz/8pvu8/pTuQMOUKwOusOYFSF8J7WLdwC1Go9coP9yMYTDxGFIJhJcTcW
 bU7MhuMhKaiBrdUZCxBB5VyWt1q/mqDXhMcGPYZI9NEzrN6bsds//Z23+p6+7ynO5tqP9xrUEwk
 6gq7Yc6P9jhjq9YK2BRBItIpfo+pYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_055305_605383_60FEABB8 
X-CRM114-Status: GOOD (  12.17  )
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

On 11/14/25 12:28 AM, Akhil P Oommen wrote:
> Correct the register offset and enable this workaround for all A7x
> and newer GPUs to match the recommendation. Also, downstream does this
> w/a after moving the fence to allow mode. So do the same.
> 
> Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

