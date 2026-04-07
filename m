Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE554FEEF24
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=; b=F2e3ms/cYLnBhlROVIAsQJYB4u
	OHvnFipstvjKxeHmdA1LftD+lKS2uJPI8k1FYBKliAslTo5Bv4+5cI8GRhhXZY52lZJafejCVsCM4
	+4uEUWoA2axDCpFMdH0ZAJKr5PVv7J6DnOdV4VpzuoT62X8TMiM4Lm2WB7G/gVYasnBfVFQOjujV1
	298juAQ+YCFn1TQG+mA/rrHInqO3Kl/fsUYe8ly2qVxsfOVQcP0F8vdbXEs0Ca+PHbydIAXNAEyIT
	oB9EdtZcTqvbgYVKJo9EmSgNxuLXbjAFtd8GJoU/aBx7sIS9v8etNAwhmTZcBRqZGYqClcM7F0xT4
	oQozYRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4ZP-00000006Mvl-1clz;
	Tue, 07 Apr 2026 11:26:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4ZM-00000006MvH-3a4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:26:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376oiti493369
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 11:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=; b=Qk9SYJLPmcSiobdx
	DDdpEomgeGQBmOYkdDskTWYut20jMe+eqh/qNYcj+pTIC5UneXAFr0sPG7HCzJRS
	fwRTUueOrhZDTq/96dNT0cUYQfYtI1qCnyeKPysuuj7qH/Znyy/J6KiuZk3pvSD/
	B0iwKlvIHB+tQWGKJFBxAn8TUJ/8RMWT5v7Bm7F84xyS4p86AMbIdol7WNPQ1SEN
	QqCzEKA6nb3lcPlo/JcgYxKIYtQmIo5cg+7WYd5sc8d6q8zqFnSOV4xnSJh3e5Ce
	2ammEG1tXFAd9wKJqTR+n6yxnnGVduTRaDR6QhDsjtLu1+yXPyRa+PXQsdust7nx
	M9Mx5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8te9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:26:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f59c9bd28so15430446d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561167; x=1776165967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=XaL0etmDxb+R21i3Zh8xLg0bz6m8sqYLGkZwlXQX2BoZQzTNeG6KBuhNrmUP3OJB97
         xsc69oPrdRgqKReBKrU/puli3JuyBoYld6R1u2Ih8ju0GX+WxeO7uTZpnSccazC//Tnn
         MFRuyH7c6qn6W72jS/OSSAgc8SUk0Rroxo9Z2ga17MDDCZMjxhF3oScuAZivGj2hXFTB
         Y1J9ViSsuMSgMamzrkTjelORC7FKUQWmWqq978JJxeWd4/KDUHcwflPyXgrcPKdtns4V
         fmK+RHcfT2OAuqgTY3xk101KetEWbvXV3LRYYKftNtd+KkkIkYhSUX+qQ5YB6zBWWxGK
         xJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561167; x=1776165967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aXd8HT5b40tGbD461q6/FXJuEZ6/7PBRmqsBkcdEEY=;
        b=Uxmg26r4Y/R2icJccgO0UmkRONxwE7GxHFsC88CeoAzZEx+JQ/03RsWP7vwnpBNIKp
         xto8aSc6kJKB/yGk0p+2QXv/BOXONILi889/4nl/EZqy6FwONzanjvU/nyJWMwf0InUJ
         xwobODY7ux7beBVdhyCtm/eR4ZM5syU9AGpr9p2QoXXNza+r82XNkv6JkWPev9EkJX8Q
         mNSPVaD0+Lslt/wVTd7/NYjTznLqNvgiTviGzz0c2MrMWaG4GiJUVIltlzvv4jeqGuTc
         GoNMwJtnbC+q5t0U39iFK3F7s5+0kb+gHuP4kksgjJxv+zBbYlh4AhTTobAvLFrELKrd
         9D5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8q8lAUU4WtO/Mpb3X2iUVmgW/d7y2V+nzBmg7S4lTsWTlnq5DKskgZZdVmPTJSuHeH7j9HL+Vyo6GVm/pIToJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh4qUyk6mSHmzxdVwfVKkNIkA7EboFRCllhDyPgIs/1Ixy5Smp
	sU8d20ri6ECkPwIcSZsFcbEBYkIKf4IjmHcDTEr4cqPzQVVEVR7CR1/cYIXh/y5MXuhlV3N4YDM
	abYLoVe6g3biAHVkS7ykNjRp0ok34TpH0rGnX4RdmmVG8Q3fXhRVOmKwqO1d2Og7RgQp1vD0us8
	GaZw==
X-Gm-Gg: AeBDietUJ2lEyjm+B+vqdTPbTZSHVSrHBOa5GiA1zW2EDyZHrIOyDjAVrnuqYh012eF
	p0my52HBxdB8vicSSBTmHE39K4GYRkTOAMVjQZ9R4oXAcBAoMEzkzxbHOrj1cITYfm6t+WLQA8S
	ouyc44jaKgpITHMdtFw+JcxBI9WQdcDd8Czj+sxK3Xl4AGbgiphKgneYFj+NlSRA1ZGJg4li09V
	lTYD2JEIRS7LQnHMkqkankSilPS2hp8epPr5fCxh+LivBkEvQrZYZZrJ3dmvOb5iu/RXr3CmO+r
	R5gXSfvTmtczELx+voN81std2t9mtZQm5axXvNLuyQZcewuqqkV9KnaU7Hq7jvmFvjw/RsDyx4m
	rUyi2sUtD6LVbRvm5kf+Kzx5JY7q9H+N7NmXkmXKwGUOAg5EBqil42dsyasspe4f0dah/NuOO73
	Yeupc=
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190561086d6.1.1775561167335;
        Tue, 07 Apr 2026 04:26:07 -0700 (PDT)
X-Received: by 2002:a05:6214:20ac:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a701aeb01fmr190560776d6.1.1775561166945;
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm558375166b.30.2026.04.07.04.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:26:06 -0700 (PDT)
Message-ID: <11b683e6-aca6-42d2-8993-b9aae39ae44b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable
 mdss1 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-4-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MN5VShUYqwXE86OMaqJsk4i4aNTLFmvM
X-Proofpoint-ORIG-GUID: MN5VShUYqwXE86OMaqJsk4i4aNTLFmvM
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4e9d0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fOsgxGAhkaL6H6YktGQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX8+Ob+rsSuRSX
 DVoGa3Qi6zu95Go7GJtIy1Ebjhs3glbO0DF136qmscC929uglb06ccfYH0swuhQdi1xWIFs4Qep
 COpOr6c+X9xOrkRDRvEavqJiVLeY6A7OuKdWE65nQXxKPnF+qoc5VmieBmTHUaN/wI2rtIdRmEq
 rKlet1uq7cy3rO3Ogxg/qF9YffwYuV/aM1EN12z+bw+DcAOD3v/V3SyapAkX5Q3sMJRW4oqkUZM
 HbatPnApLaf7hQAtynXw6eVW5ByiuREfujDxlugIKFOKKEFTwKFM34tM+4zNlQCC8eVT68O7UYf
 ybIeaNSPXIDoJ2LheX+WekjlliN0Y6AlP3hbmdH8YSifc/HMHrAjjM6ehQjrMOv/N0xBTy60z3i
 fjmPoWI5yofPfIUxhu/X8PUbY23XERsU4zVEbXggYFchHCzwgQCftF1nmj4ETSakzorx37bkP7z
 dMzKzuSCOYxqRnzKIfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_042609_016852_0EDF6B8E 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> Enable DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to eDP2
> and eDP3.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

