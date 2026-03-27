Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1426810ED656
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaGGyxbboUWbNRQh4DMx/1UTewJHiTmhd3WDIqx4e44=; b=TxneZfoXER5oSKR+1dMr7J4j2d
	plx0hFB2tbEEFvcdspFxb5BqSANNU0elR7cde61zm3jisml7bseVk7rQiFcpqJfIh6TK2A96d4eem
	bXGoDf0na6jW+8fL3VRiNTe0/ZdSVocAoU7hjmuai+AmZRZKk0oYtPodWtpbzGI9dLq6+IG/osQxR
	vNkYfpDAyxP5xgbaL1ptLm9Pm/v7+ugWc2J6818/bqIvaDQsjMya4wrUmZ39DDzC/ckRucD78BUnB
	JrWRkXKT0DJGkPXfVJMT3EkqrfF344JvrACWURv7O3NxEeLkVaTX6ep3ntEY+PaAFYukIaJ5CiXOp
	qDU/SCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64Kt-000000079Nj-3r2r;
	Fri, 27 Mar 2026 10:22:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64Ks-000000079NA-0vVv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:22:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wFZP1710610
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AaGGyxbboUWbNRQh4DMx/1UTewJHiTmhd3WDIqx4e44=; b=buQWzk5Xti7pz2+m
	cv/YG+3wFJ37ZX5xz9kk0hlGJVL8W14b4avQbx6lbUvjPJZaSet8yphnf1zlOIZf
	MU6+sGewsQ529sPnuUrqrseLIETXhYJ0T8vPHpeLVFezO/S+MhjHI5ANwHir3Si4
	wIfUPSltrWZpoDgSivgoVP5R73S29DBVqgBxnJYsolImySzKVbzK2jYpwcfWL4dE
	ws4AzAy/orca9mWkDb6Mi7ToXl9CuYeBrfU0aTpDziDvnqeSlHV1Ht+rH0lhYELf
	LUV+erOrb9gTv01vYNqKmflpzU/9XopciKvC6mjTjHrFyO1vFGMKOj1NxB8mfWi5
	IjQ0fA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjjnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:22:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so33528731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606956; x=1775211756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaGGyxbboUWbNRQh4DMx/1UTewJHiTmhd3WDIqx4e44=;
        b=fxrDra4Eh3I+7Umqr04zQfOIwcjCF3GHY0v4FWDExLXYBw0mtGTzxws0JyvGI7yyQ/
         gYPB2jXKmp3rdreZkOY4brpuqdvHauVyTcdagAJ5zlPE5L3LMmMzJrjaaOWyj6zMMLiC
         A8D48/7lP8X3d03sEuKrP3W09/MC1tIjIz/lKhzZzVKRiOIhX70lowWbdJRmGp38hSkE
         KGO+uzE5vuv9UIBQ+FqHNzFK78ekPBOHhOslBXuJ+rzzM3v9esDTYhCskVP3lorJFnR5
         mKpPbwJkcxWBqEc7d+aKxAr2reyEWKMWfCa6zpzCJV5sLDrLpmVPhnUBuo9n52lkcoEG
         bMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606956; x=1775211756;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaGGyxbboUWbNRQh4DMx/1UTewJHiTmhd3WDIqx4e44=;
        b=Z+A1f87Y8xiAwoNByg8KcOR4aAXKBtjqGrGQGloI3cF7De6aai3Bo4AkHFjFFyi69F
         6GfbTo4pwfEng5ekqW/TuQQcSt2S2nO9LpYM3mFwhWO2cBr1PYW2DrEilLb0dKeOCStL
         kel8khRrVdPX/dHvsxxuAnVX8FmJgrgazjpTm6W6Gl9K4u2MJyCHj3YCtdM72+yQDNZ3
         B9FPUHBTtz7wKicF0sLCZXPs3Tuc4t7Uv+Jk9k0smFnnpUHOOtFKtW3cORnYTsrA9KLC
         rE+H4SXBzLa1zVD68hWXXpWFHXw9+9M8pzQcqjDdFwDDv22trY5zlnY0Y7ivGBznHpbJ
         Oc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOVeg5ZV1s2KO7C7uKWiQE/hJl/T7CAP/wawJ2ldNAsAvtrVVgbunF9vJscOMjyoq8NsPNO9JsJSwSmj4uSKIR@lists.infradead.org
X-Gm-Message-State: AOJu0YySan0rKc0qN+WC95MBhXTcbGLee+Q4EtILqPgNaADqmgz9QTQx
	HbzyR6N4M54N05Hwp+ZQGIOdQRTwCF4ApKaRu20WNQc07kJpFDxO9ZvoSNLdVLuQRz874s/s2ov
	kFllgCOSFjiJWPrUkiVbUgnTtjV8+YNGu5RpbyTVafzD9AauJUUWSbzfd4wCEo+m74PwiMFfIjs
	JAORI7Axu+7Q==
X-Gm-Gg: ATEYQzz9WajFFZx8i+9/2IV26cUlT18HO+Vh2YPWXy8YRgIluU+UwjUKZHlLzcHd/oZ
	AstenT5t+zZeP+it+9yrNFEXW5bIkElXO+5/jhCdrZRwsvkRwAGqIhJs1OgBcMySz5UtSXJGkRs
	ybDEhWKxRyHdCto+GG1NbyfDKvUyfC3zjAC+l30YCC3hk+hf2axVzdNuNVei6/1FbNCH2JztGAk
	rD/Ia/7hHTADpcBAssyGgxRYsQvXiXqH3KfKEH6VuYo8UFFt0sM9B+hQ4+zCHfKKk9vBFFkBrgh
	PWghhCiNFNNBAfMuCyR4vNCFuumQ8kTn22r+UoSBDSNJqmCbG6L5g3lQt51JHk/KjrNDke56b3u
	mfDrlh7w/IRUERbTgNSf/ddCyLboRAZUptq4Luin7Qjn/fME0
X-Received: by 2002:a05:622a:610:b0:50b:37ff:727e with SMTP id d75a77b69052e-50ba3919f7cmr23270661cf.44.1774606956094;
        Fri, 27 Mar 2026 03:22:36 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:50b:37ff:727e with SMTP id d75a77b69052e-50ba3919f7cmr23270481cf.44.1774606955664;
        Fri, 27 Mar 2026 03:22:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm81553135e9.6.2026.03.27.03.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:22:34 -0700 (PDT)
Message-ID: <55875ef5-7959-454e-b071-c9f5c6f87bc0@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 11:22:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable pinctrl/gpio/pcie for CIX
 Sky1 SoC
To: Peter Chen <peter.chen@cixtech.com>, arnd@arndb.de
Cc: geert+renesas@glider.be, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
        Yunseong Kim <ysk@kzalloc.com>
References: <20260327095652.3793688-1-peter.chen@cixtech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260327095652.3793688-1-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BHKwY93IXd01zJhwbvxN2PtQZaGPAtNh
X-Proofpoint-ORIG-GUID: BHKwY93IXd01zJhwbvxN2PtQZaGPAtNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NSBTYWx0ZWRfX8DVOzNM75gE9
 XaBvgeMUqZpKU16ceeLj2cX90TugM/O98Isb7eV24irST93te/b7jt/OEMTgpfBBoB1WNUL0JtY
 fvaR+abgrDOBK1aYIZw9t1OPdSP5asEFQ5q/MNM3a5JlLmoRQvudJeJa+lcVeBnYdXudzjDYBQ7
 NIi2JRIoX4mJkacVFUbxOhMRGOVw+5F6Gbey6H7FG7jYozn7ArLJtVDrCVaw9SNGLpaOrYht9J8
 IuEGXUlsi7+NjqiH9RWeSZNENfrfuB1rmJkahS2RMFE3xCupkNnVAEVfBHNPFZ7gAUb4Es7koAl
 NPakjmKGFYAsufp/G4crvRdN4O3A5bDSJeOD/7dAqnFaAVf42Z6DlazloxCoU7UeHf6vdL4XMjj
 o12T9mMBRu4q7ducj8b+5UaJvmAAuk74CXV2pk0Zi8STXW6FgXHFUCEoFBVGFb63fid7XnaYAGE
 wfNvyvZUwqCnGnnKzfQ==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c65a6d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NnS2SFvM3NOujAl3Oc4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_032238_264330_E7642028 
X-CRM114-Status: GOOD (  12.61  )
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

On 27/03/2026 10:56, Peter Chen wrote:
> Pinctrl, PCIe, and GPIO device are used at Radxa Orion O6 board.
> - Pinctrl is the base for peripheral IP and peripheral device.
> - PCIe NVMe is needed for Debian boot.

I don't see NVMe there, only PCI controller.

> - GPIO is added due to Debian bug report[1].

Rationale must be here, not in external references - this explicitly
requested in submitting patches.

This entire Debian reference does not really matter. It is enough to
explain what hardware you are enabling it for, so the board, its
contents, and SoC.

This is as simple as - does board use it or not? Does SoC with this
board has it or not?


Best regards,
Krzysztof

