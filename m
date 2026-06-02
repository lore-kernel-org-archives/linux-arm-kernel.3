Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C5ACD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wuW/Yokzii57HXL/z3H+3SCKWh40lWXglHNdQClPAg=; b=rg91jWw8gYc0+ZzreN33FSf0IF
	Gp//IAWQwIQMoF3AkSz0Tt9EkhXprS0r9TdKAVKvcCjBCJW1IhaMjLuwI7kYs7NUc1/BR+EFDmJV7
	99yjFspQLOvpo0q1KiH1JH4dbre3L3GJA/+9Pu619Matm069yJ3LhABKX4XozKy8BPJyPTQIxrgg6
	LF5UdFc/0VAMt43SMsEzxQdvGMiuNLc7abi80E5NkM++Ntq7QxRWebhoRAa9K/6ACywlK8TFqbVAr
	7L+qDJhchzElK4ZO3DXFCD2pj5PfAuTbQI9is4pPOUnuYL4512Ah5pU+IeL4t7Y95Bpna38D6TMfB
	taWMW9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURhI-0000000DPRg-2yu8;
	Tue, 02 Jun 2026 16:10:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURhG-0000000DPRH-2LsE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:10:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EE3lh3303188
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Jun 2026 16:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wuW/Yokzii57HXL/z3H+3SCKWh40lWXglHNdQClPAg=; b=CrsBW21DYrzUoj39
	LSZG/g+HQ1czUCOfiW5AI9AgHw5zw6fjbd6pvyuNSmPbPF08VGO3D1slcgqznn9a
	3SINRsyYzPGI7e8cMXT9AT5N7LgsWlK+7YgQb0AGS7Dm3SicCXfcBxXY5/ss2+EC
	TSSqL5ZcyEIZaWXiG+daLy1ibhnuWr7zGH7J7s4pJE0SK9LOhH8siUV35CzuGYbk
	HEtAqlGgieVJErm0WSJVwESs3f0Tq/qgRupknT+S/Vm75Z3MdT5P8qdEgegp5KAC
	joxuomMDVECFRAKY1rJB13gE0gYslRkJhxFA0PtWxoZRbS8QudVOJ4gTzZUPO8Ze
	kGl5NQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18j3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 16:10:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8141bso1083668241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780416629; x=1781021429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wuW/Yokzii57HXL/z3H+3SCKWh40lWXglHNdQClPAg=;
        b=EA7VYUHOyzVriRageNdL1wFvyYTMKcTmSeOW7I3aPutwM5r9ihuA7xc/kdyxeCtJHF
         AqiH3FRjaJlJ2deKRTaFb1Cy2PKeAkP/VZDMtSwL29TBwLZJpLBY5okPrLplW4sqZVuZ
         sW7FWdVMxK7FBxUwYiYhs9/5Vxhr8j4emdCyf0OQalDLdmBLq4OpH2g2Wd/4RPkb8jN/
         IT+v9teLecAsDF25Auo5x/tN00HDLl5FkIySEEDdoNTajwujkqTew/4qazuYyoE5IybD
         mEsIRER0Tprq9PDbZ7IxrNPRsfb6VyZaCEs+cQruWmTTWh7189CGhtyNKSCQZK0dy80Q
         QHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780416629; x=1781021429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wuW/Yokzii57HXL/z3H+3SCKWh40lWXglHNdQClPAg=;
        b=fgIBBrTIzY31ByFf2pinnMhXiKFfoFuI/ZXkpKPjJE7JaHEuZMXFzMOiaqQ3jwijbt
         oXdkz9xNw81o+6ntN9T5dSc5obeXoZLxmlRISEyvgb3Y+wEiSv/i+WOLiTBNq9gddf1Q
         BMrxBdMPzrRpCahxL+fBcsEbuF7V1rIF4Hn9Irw+Q3bjGcMGIDSHWnGLAwIADrAIa9bQ
         8uZt7KNn2luDm0ZaihI8xZ0fnN/SYnJqobAg5AKXYiXYd9+4XNn157wWDxk28nLTR1cw
         JDHOSTBW5DJ+fVz4ojR/i+G6h4EYgoCM0dsdNeEttqsVBam/Cf2DcPlN2epM4xXUZB09
         40rg==
X-Forwarded-Encrypted: i=1; AFNElJ/PCkfIzFygL4bmUEvll3g2gy1E+cwNdPjai6N838sf04epVKioZAsyGXOA0MergSpKQWGGV151kH88ABVAksS4@lists.infradead.org
X-Gm-Message-State: AOJu0YzH+wtzarQZ9E2UtEb5Xi8V58Kxln/DycmrZrw9f/X8IWww1e47
	78cVRVlm4LfLUHM7iGIJ2FH4iFJz3qxu6mzT/zdZh8kXZE+nEAVWf1eqEcIjF3oKWHpRJgoD229
	G6RK3OkzRBYAy/9Wq2WbkdYGUa7ImSxIwmI2MaqwquIUwnHVqrWqhHfrj6xWuLBpQoLC9/OI54I
	dL2A==
X-Gm-Gg: Acq92OEoRHOyxb3EcDy3/FPXe1apfIGa6NXhVxLsAn7uKyQGp0gSAG8MUI/6aA+GSQC
	DR+kzcv4Da4cEdsweu3LpwbLOmudjSMtPlW8gKF5f8NqY39/me20RkCGUCI7ExD46sTECm9OAta
	RiRcsJahIUL5cm2X1I+jBvUKqS7CK0i55+CAqvg0h97mPj/gSU5tTukFEl0Aotwb3P6Vp4Ea7O5
	SmNfwYozkjUalYkS5nJma37DoauMUtycJogwStarYZHNRkl5aJ2i5DfetUX4B6APNjQ/tveLGPv
	spOxzbxZ1mNp4fzNHgxpFUlI2bqCGRnqkO+/tAvUOk+20xf4Mxn9txEjLf8N9/Jly3g6PLQTdJ9
	Xpl1IBA++J8+QuaFfJ1+x584nRfFugD+qfH2NxLvay12pulA+6sTk3BELr65A46wTU3QzJrmfcD
	xq
X-Received: by 2002:a05:6122:1984:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6974e7e80mr582311e0c.13.1780416628891;
        Tue, 02 Jun 2026 09:10:28 -0700 (PDT)
X-Received: by 2002:a05:6122:1984:b0:5a1:de02:b177 with SMTP id 71dfb90a1353d-5a6974e7e80mr582191e0c.13.1780416628462;
        Tue, 02 Jun 2026 09:10:28 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e37851sm80264715e9.13.2026.06.02.09.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 09:10:27 -0700 (PDT)
Message-ID: <13afc706-2513-4fd5-9e5a-50c4307508a2@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 18:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/17] arm64: Use EL2 virtual timer when running VHE
To: Marc Zyngier <maz@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ge Gordon <gordon.ge@bst.ai>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>,
        =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
 <eleanor.lin@realtek.com>,
        Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Simek <michal.simek@amd.com>
References: <20260523140242.586031-1-maz@kernel.org>
 <8633z5ugzi.wl-maz@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <8633z5ugzi.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1f0075 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=0vUytTvmGukYalHcjhgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE1NSBTYWx0ZWRfX+ygfyjBoTaRV
 F/fRIlUH36wMxWhaOEe3z1RsM6eT4XkuvHEftM1V4anlGS0kXLCdQ4yaZezLxRCfOsP3LHm8IwF
 zkLl6fO3AaMk/hR1RmxEkzB/zShp9iGCa7vBmN7pUZfWM6oOkBICotExyMkSjVWaa2grgqoPd6Q
 6XbZHcUbGDr4AEl9IutMlEVIHMl6ycSN850/BTF+XI0yQDhdtGSX6vh++gQOkds6tpgycPnmTl8
 E807RFT/kIAbXFqiPV2OtkPgZ929RwK1Gf9xuASvQlr3XuDrkn/Sj0ZUj1OAoXmIhmBl8SkLQ2P
 45E9R3kUwFFYfv+7dILLbTiFWNpZ8dSICKZK1RHW4zJOAcKDXquoMIDtgmjyRBKdqUkOBv6k2TC
 V8fubBUkdTDwyaNFx6aK3DrFynqlDvACxqvS0AsQ1KuC/GT7j+BDM9RmMcLedR/r2S9WBufnxnk
 OIzT6+A4c+s7BTrZkgQ==
X-Proofpoint-GUID: F3T40F8IOoq2sOFyvYpmHw9PBhPJvkeB
X-Proofpoint-ORIG-GUID: F3T40F8IOoq2sOFyvYpmHw9PBhPJvkeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_091030_801545_72B7CF75 
X-CRM114-Status: GOOD (  17.46  )
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

On 6/2/26 16:58, Marc Zyngier wrote:
> On Sat, 23 May 2026 15:02:25 +0100,
> Marc Zyngier <maz@kernel.org> wrote:
>>
>> This is the third version of the series initially posted at [1],
>> which
>>
>> - updates the ACPI GTDT parsing to deal the v3 layout and the EL2
>>    virtual timer,
>> - moves the architected timer driver to use it when running VHE,
>> - fixes a number of DTs to reflect the reality of the HW.
>>
>> This results in significant performance uplift in deeper nested virt
>> scenarios, at no overhead to the host.
>>
>> Patches based on -rc3, tested on Amlogic SM1, QC X1E, Ampere Altra,
>> and Apple M2, as well as KVM NV guests.
> 
> [...]
> 
> Daniel, can you please pick the first 3 patches? Or would you rather
> have them routed via the arm64 tree?

I'll pick them up

Thanks

