Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=; b=IqiuXB9mg8ZkCuC2gHvL6dcO8b
	0/gS0noqrrkJwhHTMgQQCevsLwkQaqWEubsK2xNYAvSTgVmqrdb5KKuN8rywuntKFGWsu354PSzEF
	aPhYfr4Q7F8abPk9kXgef/6VtJK3bVWNgD1xEQv1m7P1IZ90dISibvGmD3fB4s8IGxLAcpdzcRvOh
	3Mq2YxT3F8uasmNh/5lSPTjZseizWPbnYyRxFnZygQqBhQtNLqjcEbl3tZTIQkKhTsPC8xKcMscOk
	mj93z92wPxOCqvZJYfbEZuE9RC45GAXpeFB0Bd+AGynAqLd+tsqcok5l5tsoUjBZ3VfdTt7X+N2E/
	/b8k9TMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Co-00000007rpa-19c2;
	Wed, 29 Jul 2026 12:16:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Cm-00000007rou-0KES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:16:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBlrlT1512062
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=; b=jGmy5Xinb2xSD5pU
	kHsjiX+IZWn51oCYB4Ppb1FYqIy/oeen87suhLwu5Sg+VL6rlCk9VM0YMmDBNp+s
	8rzFlH6B/5sJlruWHdm2vF5PJGPQ8g+sqYoI4MMUj+3x6xl5Zurw5jrJN8XR0tPf
	uKFxDzS+xx8CYJi3DGNPHJqCTpqBLbZ6DJfBXRHc1yW8ctg6yOS/yZJc07a//Skj
	O+EVAGfhlavIZQvVKhNQPP83+RoWapp3IBI4F0A5kWHS6hA4sLil7zaWYoBBL36l
	31yCkPRzQT6/H69w88ZwElwuLcmpJxSYPa3x/JekTsGiWqCFJZhVS8EzK0U7uupk
	4wt/Yw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy903f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 12:16:11 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e8723ae1so60808a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 05:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327370; x=1785932170; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=;
        b=PXZd7HYBn9hhJBElsHNLI60C695w6nRTbqdq/eM/FA9B+yw+HZwW97ld6b4MZtmWry
         n+Dn2RcaTbWcZd7zqyCgwyYM6QaQNCp6H+RbtENSEG+yDOO60oM9RLAW/Lnmb6GUS55X
         EaYi1KpNSMT5516oQhst7EpXWLa0PH5QxpP3ZizkaELf4wxE0dZG1sxWmdwjajXrJXPx
         +LL4S9RwoznzR+i+4HooHB6p9R/u39rrgs7sg/2NQTSFAAGA/hRddtrgJy8syuURnWCS
         aQd46Evil1B3yQqUrOWwCKPruKFDEyrynH1QDyCHz3EABW/HzytsyC2W1uckHyf5rcKg
         DLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327370; x=1785932170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBY6SqO9XgmLQLXW4MSm3F34QI/WpVUcAR/jeWmBW24=;
        b=MCuT/0djNsrwaijeGsD7y7hkHFIRrhA38zKXIeI9Q3tZtg9CwnqNONiIRL5TXiSaiV
         AOXzoi9IaHTQ/vC8F1nV3Tcd0ch7wJMTyXpRTSwKPj8n1EKY/Y8iDjNIJG4GM/4BHbtu
         njOYDhzjPKeP5zMeIlrp7gngu9T1pC2SyYadj2e9XlYceFqpUloARGGWV3SWvdGK0LlP
         tjWzJNdbHD8vIu4t1NwC42gVorihRFZ/N/Cq22JlJbWLy4t3igBA0H426ierHMn2K+Nu
         5kdftSYegBCmvfhcWVoBgpt0/EDuJoI9QotaB/dR68R4WejvqBCbeFoG1ZgaOvM13dLW
         B8Ww==
X-Forwarded-Encrypted: i=1; AHgh+Rqv04+U+eZRxKEP9yEfJuE5wpbUazgH0Pogmh9S/q+42DX1Z6+KFfxyOWw004Xl6fxKQMfwWDwgF1PvPYLQRHk4@lists.infradead.org
X-Gm-Message-State: AOJu0YxIr+ax9rs7NC7VF8BySWRfnsE7sh5TOeDYlqy1qo7Of9tL3eQU
	fPjlaKwtmOvRM1NqPyBp0ddQJQusINpLGpUbE6CU0JF5VJKp+tNY5jsacVY7OjqEn6IlpevayDE
	KDpqQWWy2S1kJaNQc9xTTTmPAnWVEriQLCYfMW/NYjGMZHRda3NbcY980VIUMpn/cod2xTNOW9I
	DZAA==
X-Gm-Gg: AR+sD13r3lGQ8uKJgeBTGcf5iElG84Jt//sRWSIpL/o416FkrNGzJArGYAncpq5N5CM
	tHRAo+LfhBcLgJHgG4IfAqGxAIAN6pz1HypnpYLW+pZf4uVkWwb2qc/LaJqGgYJnedWIFMUUYIo
	3u4cCI3wzCbPKiJmlkskSdc0RkvFa5OhcMRpc0AV4/aG+FA6ATz2IGThup77wYcJuSp/vYaiIjs
	1+H0yWBEoXD15+MVNOQEvd0aqUeJ+N1NXLGb/q4RdqTrdwHgOBFM07JfRKzVFB71nY4LpEKIOfZ
	LO4ziKOYCgnj+hOlLUgUECVE2XWb+oMrWWG7tJbiAnMfutQuJanOQSG8GiGb9OuVYjCzB7KduuP
	aABYK5Dtn6s0icxtwV5mWNw+w
X-Received: by 2002:a05:6830:67fb:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7effee11f80mr3115998a34.1.1785327370598;
        Wed, 29 Jul 2026 05:16:10 -0700 (PDT)
X-Received: by 2002:a05:6830:67fb:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7effee11f80mr3115972a34.1.1785327370182;
        Wed, 29 Jul 2026 05:16:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be3a33sm768977a12.10.2026.07.29.05.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:16:09 -0700 (PDT)
Message-ID: <0ef4c658-be67-4df5-af56-ba1517700985@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: eliza: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-8-64379dbebd7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX56Nvbz9WVGC0
 FKeSxEAW+R2nEkmREc1PBZSHra7kUsLEUfQo5GYloHoDVWrTJLgvJXykFmtsB4ftZaRjLN1BQ9e
 W971Tlfo3QyfvWIBbro4XpiOyDT2foA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfXx1YSy8DGMRp8
 L4aTtYGaKZyjC61TbmKB/Y7ZYcfT7/P+Q5Kv16P6Xj++QhSBt+TuBsifQMrjGA3Y54J9Vw5mwHW
 b38G5pHPWqNmCE0Zy/qAkwTn0xN4/+gps/eHHYP2j6cU5VN+ODXXjLW6MwwdRlJYLXnYrN0GRNL
 GlyRtnQq12jIpkyT5MjL161lVAnS1fdwFKCdKJd7w3FrMcY37UOr7NSrf91wLnF/qtjAmbsj86Z
 qAmQvwW5xZ/cyxo8vdCyNWJiNI6JWAD29sZ8SZobjo9+tZTwyfzGYQvA4cIITzYljbtvomJwOBm
 h006ZLW1RawLsChSOoFdqNGa4yY6QXnEwuNlteWjbFMq7KgStlzUMUyJaHGhw6jebFyelE/NLj3
 m1bQwxrP9XDGEqwU1r1sko9xEbp2a+fTOxpKBgiyogROtFjhu2mtt7NX90hU70GS+2+1bMtGTKV
 Tn0HA0YhVKNYRn5OXNw==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a69ef0b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: PS6Z_FHKdODFeILvOzlXPrvF8vMuCKfv
X-Proofpoint-ORIG-GUID: PS6Z_FHKdODFeILvOzlXPrvF8vMuCKfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_051612_120768_426A60AD 
X-CRM114-Status: GOOD (  10.95  )
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

On 7/17/26 10:41 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling the GPU speed
> when it reaches 95°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

