Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B7C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=; b=d16RKY7FPawrhP9qqi6TA2nXQk
	5GA+O/aVwLtC6/5w2fpaqushlBN4O00MJlyPpfvcfEUmpv0KwfAHmdvvf20C5l/bU7tjeY2RgVmnP
	5pFVouUpUMDPR23zfGSBtpSKmezCWgBhDNTnFx9LuDm/RU5ZNe4t2FLqafayDzc9to+0OVBo4bRH3
	Bprw1StW6k5pCW1Xm0ezSXLp4rzZjqYqG09ZOaxjSmoNxgcXrskRHEZMqyLWiMQHMYNUPhS/D6o63
	CsqBVaFeRcrYW6hlMHGbOEkksLrUBqsTMgGyWt7NtjMtie+VcWyqhC58C5yyykQ4OW4jvBahMJYOE
	pLZl1srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5m4q-00000001lw2-2zJh;
	Sun, 13 Sep 2026 15:25:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5m4n-00000001lvg-278i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:25:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE17JK2305278
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=; b=UClpXggNDGnUoju4
	8s7pg2DMW+aMyZIUBvoIm3xqhEDNuIZ4G7sd4CZmdYMnHd9zDSUsG5sjzuWrZDYg
	qcVEOykNpnfBaM7ZnrgJiKY4L2LJZCYnSRsf7WlQ/j0Qy1Mq+Li9c58BMLT5crGK
	p24eMVk9QrUCvPcDchUlxN5jCfOie3h0kC2kYxMJblMD7ubKLtio4iDmTlsw66xg
	cyLXq+/xwyLLBs+OnBgqkVROVXdGzl0r8tcDDDGFaQ0xLcMvAt9PNDekthiXMMql
	YhphqN8MA4xiN0Yy9MKDIVHK6ojMwvU5xHfOmCySmeQzZyAhh/cX9+QiEU3mjX0F
	jwC9Vw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkkkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:25:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso3221941a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789313103; x=1789917903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=CTUYP4q0qszG9bdGpldsUtjL0yBASmAik3YylXGLvtp9p33bAXfGmfIC5aA6q4tUh4
         QHE0Zk9U3IBEkg7kcJxm0Tq26inJ17IXr3SVfP9pMtShDJXlOXrAZODc0hnG5fit46xJ
         O2HH59sDhxDPzXxldo0eRpPxy9C/K7n0lQmC/2Kz/7iwLin+nsJ+6Zlc8/UPfzujRhqz
         BgragHhRbc5+dT+KCUEV+X+dvMQkOhQYnjGau6jJLZad7fcKdu/7vCeWYRGlBonmMzg8
         iN7CXJ243D5TpVG3GbBamEkoOVpmGXHeiHMfJlrEWdRiK60rMOQVTpew/ZhR/XITTQ8P
         IkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313103; x=1789917903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=oXK2wauR2pm8Au2qD8cubz5yEmxY2jQJpop3p5xi61zO4RnR1bSPkOLxR0zOY3+8Ix
         a72oRzDdNrPVfti3XGYST79Jhn84uSbST/y3BHqClE5fXs60D7WJ2lI0jnH8wjVFWu/y
         JUDOt2s1K0BMHLJb6oFi+WKs0UhAaSqLD/P02jICtg3UHZUSnTDfqurl8LYe/gURboO8
         Ady7FxDoXQVOZda6wR+tsv4svxeWDZYV1PTIz0G0XMjTVvrZcLJtsxbWmm2NMzagwR0b
         Nid74ZLd1yNe0P4HZdaXJdWxuqSSFXW8Iq3p81bQMtWGrceaFUxkgY06XlFwayfDDevh
         6tQA==
X-Forwarded-Encrypted: i=1; AKwUvBwEAy+dLBd7UvT5biCLkLQwRlh3NC4mD1huxFFWLo3zhIBZH1l4Z/nNLhP0qzQ5RDEAsWszkR22LdH1Zlu8FdBu@lists.infradead.org
X-Gm-Message-State: AFuF++nKA0ax4Ulos1NDMoi5MR3NDAkd15jvi59JZaL1WqQw/N2y8wW9
	wrcwpZojlHeCQ4hwHFc4P6mH0Rg2R3g7Ff336jHI/O4ug4oishu99FEC8BVUVv2ZrEGwtMstVAW
	s6yLAxmYDU+KozDoIbdo3NyMhvIJYHfGGWsoAK9Vx9mHESVWB5J0/13E+QvL+wUzt6+XjDOeSba
	lM/Q==
X-Gm-Gg: AYBFou3y8duCpsU3aO6bPUBGCuF1r7VUN2x0sZDM0GaSFM1LAZR1KXS/Ist5MQkBr2n
	UkUJwLHwPZGoGSWH7974V87VNvExFeFjRF6A1D6qWnTh+6Kdce12OVp/5/2m8jBtdaw1bXwxB95
	RJ9lxFikb7byK3xBvquiroH73+GhBNC3BzUSLO/cYYe1VahUKVZyQTp/fm+C/dDP3I9VcBbDtuW
	FPFDfzzQTz1BFTD7JyXnRq1/qs4APpviQtlzEvJnWvZNmnWQ0/LmNa8oSaOEq88fJA03I8rszOv
	g6HMDlgWc5ElnOn+5dWXYmK0Ye1yPaqwnOAsmuqsksATCv1+0wZQXdTRbTYl8Ij2WcO0MWLY80Q
	bPEiyI9N88i5J8Vv0vwJGYTeRkQ5CCZMRRvU=
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011605637.17.1789313103237;
        Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011548637.17.1789313102860;
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.232.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm19916161eec.13.2026.09.13.08.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Message-ID: <9345454b-4e31-4224-980c-0066c912252b@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:54:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <20260803140222.GA3188037-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803140222.GA3188037-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfX708PSyT4+oPE
 BxJV+zAdyQeT/N8bJzjRyscgij0FU+q9A1UTrNs1CwfliqVpM6ngN8/m3fQSTKc/ervImuHgOE7
 qy9VujQQiEcVfqU+A848thpQDokgAdjsymwg3oS7WXDJfs7e8DjjUVW62CgSLYX+dLfhoUXm2rN
 n/D6tOBGBGBXfu0tYn7Ks3HM86CG/kAdKITGsjuMSszMG892cMufHKnNFMeAleqxA/fVaoG2F+x
 bggFMr0J5Xy8vfCL/1mZpE+QDKSVvdZUFeDL6mgrFt1tvsodyMGX9P3y0JlYYxQgXgOjmzkMAyU
 AU1jDcjEXEuRjnH9N2PiF5Zg+Fonkv7F+Ttu4EjfMZYSXTBEAFIf/zo+/F7rwx4dYjWA0NIfTSQ
 T8baUjWZXLu9DvGikX6GfeYzcAE0FQV4EiSxfSWOdJa7+LvHbJ2XYaU7SifDrDkt863T8Wtn9SA
 5g59ZyfWy6eAHXJyUOw==
X-Proofpoint-ORIG-GUID: zvQUhKjUlQBxyHL-BuuHnL6yUnO9-X1m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfX32x+m4tnbZ6A
 TpLppwDKJJA24FygppIjE1KJsTS1CroOTNfes9w63kds1Y8HncKQWVNXMiXdgvD2cPcp7PcIR2o
 xOT90wVDhX5grmh6W8t4JuIpJvTP+eQ=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa6c050 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ExSUBmHX20r5BGnuCy1yUw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=q4JZvQwPHRNDhfj5UpAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: zvQUhKjUlQBxyHL-BuuHnL6yUnO9-X1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_082505_691889_B6F12DBB 
X-CRM114-Status: GOOD (  14.55  )
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



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.

[snip..]

>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

just wanted to check on this.
we have a max of arm,psci-1.0 defined in compatible.
SYSTEM_RESET2 is already being used in some cases with "arm,psci-1.0".
how should this be handled here?

thanks,
Shivendra

