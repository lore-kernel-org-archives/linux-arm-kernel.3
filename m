Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB3CC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lCT7OHY4qkgiQFGYQKA7CZbAkqwj5/9Vf4jfYRxp2w=; b=BCDGQQ2N0pkqs2RnVWlG3q8Jja
	ZtoHdemhKTmhQka/f4W2wYf1ZgtoC7BKL2UXodLaFtbtQzVmn9AulBnfAMu6OyPLzG9/JCL6eVqdz
	4Jp20/04WStnsXDnDhpeTFrGsZmIU6rRH9k9lzW1f0K2RxryV70hpMpiblBdHlTUvloLBstXSG7Vq
	szFJqfFw9CH3RYn2IT9Wt/B+GQ+mBHGgMkSLIJCM8Q7qDktbegKLKJlKgDDGwfbStiPkgF9H00R7O
	/SH6OtPL+gs0HjhEBf5ENmIEiLL4po4ym6PUbBxwVOffDC4UmXGrBDvPKWT+MK2vR/LT8Amkksd7m
	qo87O23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4uw-00000000ytN-1hNz;
	Thu, 22 May 2025 12:20:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4sU-00000000ya8-2hfw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 12:18:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7qZG8000896
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lCT7OHY4qkgiQFGYQKA7CZb
	Akqwj5/9Vf4jfYRxp2w=; b=Aa9YyTqcmPha0q2DghHt2xtcU5SYpTQI+wn9JyNC
	TPmR/lWZKU1zGBkKvQl+rzqe05qy4HRdAZV+B3kZWUl4/udXyyDvY6/aJQyp5E9c
	PnvR/TqDIzEEHZj1YqRBOaYT8HaTg/C8PrY7Y9Cw179AUBE8TUvX63Onr2SovWxr
	6IEi+hF8cnpPoswawlLp1ruya8hMT4vsx/Rh8Ai/+QZVJWnDpk6FtY79pkseUoPc
	IPCL9eZHPBgHBaff/H9WiXFv/HAegnUtXq8jI2RrCFcxiKs360OkUIBxn+JMsXcj
	zVWU1JPyA2bUkkZpw68CKKht2EwzNIimJnvyVObqibnkxg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tmmha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 12:18:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73e0094706bso10906213b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916302; x=1748521102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCT7OHY4qkgiQFGYQKA7CZbAkqwj5/9Vf4jfYRxp2w=;
        b=AXSemhRbTAcoo4L+n3cs5SIOIRSv8li+gKE/sJedGwtQapxucJ92r+1BQtu4NUcQLZ
         tFmPkMDfD2qQQKQ3zNouUX8EIZM2haUFbwI9ev7BcPqvDOfDAclFaTGwaBr1GaxZf0p6
         fSGQYwYbAA7QaB59mAwwC3uMhUQoa7ANAmRcPmp5ND/TemKBWWZ9xFp3DrsNmVWfKZLa
         prN2bU4ZzZlpUod3VQUkoGfV3wJPCsajcqCNggPWq7GU8+eFjpLwNI4r9Ftvxh4Wl4kL
         qFQstaf2NFqyDoYfbFdp5+0G6X00o7eogrHhRpr76p7TB0Cb4Gqm1UZQ/hOkLusVYtNV
         7Epw==
X-Forwarded-Encrypted: i=1; AJvYcCVRW7RUL89gu8uu2b4gdiSduT1Q6KP/jABT3hALpbaTk0luO695Qw7lZHZzpfcRDjs9rRb0mORFuuVldLtb4pMB@lists.infradead.org
X-Gm-Message-State: AOJu0YyjrWQN1dZTMpjMoQXhHMFZMSwsIv7k2Ns8CoR7ZbcczuB6QWkS
	LewPGRL4pA/ilFkblH/aXDZlxG6bh19iRi4jbzDg8OMLDJFtExCjN6/x5RUY6Q/mJPUx20vPIKS
	G6hZMO4ay+m3ljZ60zGhqi6rR0Au/ePicMHqeMoc9QcO61MSMp/7ThkvVjpdOukgf8hTsa+69H2
	mLAlNY2BZ8YwwHSTmbJwN7Z++wYwCUTjvPp1JUYl9XDRIgIFEFPqHETJPvYsYA
X-Gm-Gg: ASbGncuKb7d7lcAVlOAMaBXLxhcWC774Z7rEbOlZxSnGzW8BHe+T0ZC1hPeHiN1kFEm
	+q4nMDcMPWZjTzeRcuKX/w1B8DxtkFhukV1w7DG50rkHbBrUMjFKlbxEJQ5VbWreaSdutbjpV6s
	BneL57Lps=
X-Received: by 2002:a05:6a00:3e14:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-742a97a7195mr33409410b3a.1.1747916302296;
        Thu, 22 May 2025 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVCBtSXCGrxGhOjYPLWJ1Pge+L+iUp5ZhWbLEtsrjwBVC47icKDyLQuongy1ue5r0NbqFAbpPouL6VSBeNM0U=
X-Received: by 2002:a17:902:e885:b0:22d:b2c9:7fd7 with SMTP id
 d9443c01a7336-231d43bda66mr369410555ad.21.1747916291391; Thu, 22 May 2025
 05:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org> <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
In-Reply-To: <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:18:00 +0300
X-Gm-Features: AX0GCFsGEs3QorxIOmjt3hRGNqdEtBYgdaIA34L_R3JHBLbT-M4cKvdAgLWPMNM
Message-ID: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f1610 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=aPcUfg5sKJd9qEyIwccA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TRV0d4BfEF6PMRc2f1Fq0nPoMFjAAODI
X-Proofpoint-GUID: TRV0d4BfEF6PMRc2f1Fq0nPoMFjAAODI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX++1bCBECZ+R0
 VZy4NA7MdjuaWAtTatLh2WEWWRJqOVpB3L4W3opIh6O8Gck0TB/PJggQMgh2WjF9Xl8wj49F2sR
 jQlT0LSeLESJkDL1CKVzYPDJc/yeKwL5Z5amGYB1a9YKC3EmPe7RGFyVD6SZA9ELgYOpX4I8fhz
 AIlWYSjp60XSQxcXAHyrQpp5vFrzBsDJ+RZ6D6vFTVYw3fi7t1nsuAHuTJ5tBS5lttJM6y/adIO
 +61//D+xcVdDrnaxsJEg81d/bj+8m+cu/GACZTMo0OatJUMld/OM9HpdcAhdZTd8Obsf6f5/xcG
 DrMaZRbn/AePKrKUr6pZyIKpZ+GdkFI6SAeRlH7XNCPFyZ94ItwbCeQjV6lJuqmYvP3azTujStv
 XwKBqrFc4jd4LTVk/NMIw6f7NnoIrHwgBuERF5UNvZH5OhDWyUHlIUyVW0/ZiB9cuV/SwgSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=621 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_051826_799118_794B6765 
X-CRM114-Status: GOOD (  13.22  )
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

On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 08:49, Abel Vesa wrote:
> > On 25-04-21 15:00:13, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> >
> > Nitpick: Drop the double space from the beginning of each phrase.
>
> Sorry, but why? That's a correct grammar.


Being absolutely nitpicky, this depends on the country. In some cases
(US) typography settled on using double space after full-stop. In
other cases it's a normal space.


-- 
With best wishes
Dmitry

