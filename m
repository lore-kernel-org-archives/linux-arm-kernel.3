Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CACFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=; b=mCifqNSYwXo9OY1oe6aOj2KUpD
	phZLkbpv3q25+7q1KWtyVTmoTPnA2EJWMQ4KbTsPI19iXnhAlPr6uBPSlWbafnFbrKhC9PCcqn/ZH
	VeSoovWbS4z8UJ2K6drvQEnuHJjY7K4N7V/RSltlwuk7p6PkUySbdeSVuYjYPFOt9GBcQXwu8hiv9
	p5MflkO4Q2LUFfQg6a1obE2Zsi39SjYbE0j3wSRgFnY8wFm8XohqzMVnamWMjCHAQH+1XKZUcjzam
	h7ZIL4wW85Z0Gkmi0KE5VP6LN+lRTKRn5GQqHMmMehKIlCVWXkKUVtahS1OAZdttNplchU9ARczbV
	s0j3cvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqBs-000000086jN-3zyW;
	Fri, 15 May 2026 10:54:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqBr-000000086iu-0C3n
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 10:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=; b=n8oF6+c77cZiuzL+bqC5eieXm0
	WuOIkjk4nzBkOsdK2Tr+JsWHkvlwIE/qsfdQ7pB3TttmO2V4fYJurLuye6+GhI1MfHXFJUY2m+4hi
	BqAQd87wVgC446JdYbzI5DqYc/CokKVTFlRf+EGMHz4hcHtJiGty9EYiV+ZBf5w7gP+UjXMeXHzGe
	ZAZ5LhlmHmp5Qx9CGCgDQPTEeOV/tMtK7Sic24VvCGstUdw4y6RvXLBkBWVK5lZxgCsV2cW0d8Egj
	vlayLivMjpNVhKNPS+ouIf6UdkFpzIIx145xIvQ4G1gvHLmUlBc0pMFHZLw9QnL2d3Na9lwBI+rRq
	Fk3Xou+w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqBn-00000004xqo-0GfF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:54:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5LpI9656082
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=; b=MFoy1cOXPtGvkye2
	9kaT1rre9BofxaNLweYPIrA9vBgHGpzOgHp+QeS1H9H/CULXiAOoq/taV1LxaIui
	rjWopT1wm/IqSFW+ey1yTHbrdMG1B1ACp9GuGcQ9MDDDcK75znZ6b5vEJeVyB4vN
	6u1EEgRrSl4dY0w4NZSGB4IqRANy3uHNMSBfLd3eT3GBMyj91v1qVJJRL7+Hwjcd
	Nj3QTEP+fWmCx0mX09HHqQnGVLVnLBaFaw5C01IcsEr8nY3KSrPB5puGy4sam64y
	pgPIY6zcbpZgfCxfas/nfrrhryo6gorKwxdw6wre4PX/5vODEtzEheqk9UUumrA3
	ntqqHQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptywe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:54:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9569deb349aso353751241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842480; x=1779447280; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=;
        b=CRlbRV5Zpg/x3QnkPxIMQIB9/T7h5e+uRwlFs+5qh73UUmUbVgd+dGEnIk3iviyoM4
         cJbD7zrtIkzo01ry6HCgo2YFfGuBTpkUHTzPkuVmqm08GLj0TFzE/KovXHlFLfYL3yW2
         y0QOJ1WIttLn1eS7dmPZmknkzuPVcrrvp5fhon/Gq9ud1OQyNqS5Kq1ddVGjUBGJojeX
         e9q0k5xENYEVNNzS5hEDklocQNU46A4qZ55MAJZiTbCrp81HIIb/piWaQzLRhHHjdlDc
         BkqzBLVbDkbftQW95/xU3lex6YK7t794ClQhVZtKMQxC3Wc090mwLjjDbI1wjOnT6tlV
         URoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842480; x=1779447280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu/ICIRwMvB9Zl2jHO5QRZoifsQ07TW+kX9mhHyrhDY=;
        b=iuM6OBrJnaB8xfGKwWceK9eKQhlP1BPmiyzOd9rAlcPzMJi1xnKC7KGQtEKF+zjcHx
         A43XoP3IFXTkZ5rog6fRkXqg9Za3znI3azcRLormDn0Jb2LUKX2VHdhb2Nu6xLJ/Yb/6
         ICZaKH5vLXRr+MrFqieVipRTx8Duj3x2Q17a9+P3HQFHJMsIkbbzZ3sCMJCk5O6Ugr7t
         /nLvKTEoebQdIFfFsUhZcIpVxUtounoFDLXkJNgaRzWIc0IflAHwuAcoMPyejXn4Qb45
         TMyH91cn1X3vKo3WMOPFMQqJh2vMjBIs0QsucR0B9gQhF1A3ew7/kRENKcYYwt4+70LV
         jQVw==
X-Forwarded-Encrypted: i=1; AFNElJ++wLADv19oLWSp0mwGk9Mf8te/e6JS9XCABMJApWcIzpKD/aEXzJc0HNCV2Uwib1ilbUsShgIflAc7HK4E04ro@lists.infradead.org
X-Gm-Message-State: AOJu0YxeNtMeHZUBEORSmmY5ZsceYHUcgNreCZNrBLjoR1XDSJ/WjJq6
	VVq38hElZMVWmdu59PNSnIQdYEGKMoYXLInucJGBUPYQcxTkOKnpM49XbVxd1sHGBgEY5GhLKfA
	FeGpCWSiT8K0vat9hq4hl2qj0ewvyCrTE/dt2BUh+l/q7KOQs1dUhAG+gs4U469HsPp/39dQ1Ty
	4CZw==
X-Gm-Gg: Acq92OHWJpdd7NA7V6zgrPB0rqEgR71T6KqIApOHckfk7osXMcT+kgBi3qhhs+lB+IQ
	+W6GxE4Z/kjjV3+LgO/yaif7xCqLdCNlNma/QVEUQIWJSSUeLQztqCWx6sS0D+bB7ysuQ/CYauQ
	nAokjNgkhiRS1JswgfKi/KrJue2YUkk5973Vd6Z/ZtJU8tVxYyjzmL7OW1annBeDjpylOqPHVVq
	psIi/FVCdrJs6ZwuY2JGV3n8iGEHBprdc0sDBoQH9kko4el2oGaBeZWpl1/pk31Bz1EraThUJI8
	kbdIfOuUxGX5eNfD+7QdpBFR3Gf6Uhmw6649gBoKAqJ0wLEI3w01SUKjArRxAKerYu6OAUSKYzP
	xHlWa+d3gqauO0obg1hhql/P7Zb763LpLwnJO4hechm+RU0MZNboQkFnn/ej/tJ5MVi7MEpC2zb
	SG9tViCPUkC+8PeA==
X-Received: by 2002:a67:f109:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-63a3ec8bb31mr438168137.3.1778842480179;
        Fri, 15 May 2026 03:54:40 -0700 (PDT)
X-Received: by 2002:a67:f109:0:b0:612:13af:f5de with SMTP id ada2fe7eead31-63a3ec8bb31mr438163137.3.1778842479785;
        Fri, 15 May 2026 03:54:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm212857866b.14.2026.05.15.03.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:54:38 -0700 (PDT)
Message-ID: <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G9RFM5a2HMutU2jauir4M9LvE3qtnuvo
X-Proofpoint-ORIG-GUID: G9RFM5a2HMutU2jauir4M9LvE3qtnuvo
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06fb71 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HltSbr2RFzsJciUvgNYA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX6WaOGHYl+E0i
 jc0dVCqiafRoIOVVqZAwVrK4o949QMb1GMLrjG3nUIgPqRn1t1bdyl11o7Ox16f3kgOaHqf+3wl
 DtcHCon76MdPKZogf88LnBGoSxCBnEKsK69jYLbj83xV3Yp5Q9lbWDeSZZ96D+8a7KGGbEfE0DT
 1vIlsgSgNM/0McYrRqLgsKtHfgFA0WPwH05a3rLE8LawOGeIHGlnuq6phoNmBJOCzFihKCATT02
 S18MyIKHgQIyCpaFm3H/oTGxj3656wWvcuA4qz3CG6nFXKWaPhkg4emE/2RwI7+pTzU9Yf0fQjo
 kuFkYPY7VTUpcxiV6ot4TjNxETlRmta/20N5A6HlE+B7aJ27AllYj8WMuJ+9PKzR2IivCtXX9qt
 eCs+cx+3bGx3xQKS9WTc4Fx7pBfnoIKFT4spBsexveqwhwOW+DceCIOIa6Juqt+EndBshlvHpfq
 TFqpa29Q+ECct60cJqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115444_087948_D388DEA9 
X-CRM114-Status: GOOD (  14.80  )
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

On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
> On 29/04/2026 11:23, Konrad Dybcio wrote:
>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>> basic or fundamental SoC feature: bandwidth management between internal
>>> SoC blocks.  SoC can boot without these, but power management or
>>> performance will be affected.  These drivers do not represent any sort
>>> of buses visible to the board designers/configurators, thus they should
>>> be always enabled, regardless how SoC is used in the final board.
>>>
>>> Kernel configuration should not ask users choice of drivers when that
>>> choice is obvious and known to the developers that answer should be
>>> 'yes' or 'module'.
>>
>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>> are required to boot (minus the OSM_L3 driver which is "only" highly
>> desired, so that your CPU's bus isn't heavily bottlenecked)
> 
> So the few of them should not be a module? That's what you want to say?

I'm saying that if you only want to shoot yourself in the foot and not
in the face, you can make them modules

But the L3 driver is required to make the caches run at a reasonable
speed, so that they don't bottleneck the rest of the system's mem
bandwidth

Konrad

