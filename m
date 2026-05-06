Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0868CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=; b=db6MZbROIRCE7VFDTMSJAhhzp2
	AJExWTRHyChH86nqTKIkoGFSh4fQGnE5sGIND+Xfx/gcnUXobR6XGzcf/wVDMBJlyi8C44W8suSU/
	CZafbwguMjtL32NPBfoB6026x9Uf43znkFtkR46m8jo41G48kiPY7KWP39Tc61zeBAXswt0BTHyG7
	SOJvJu0B4VY6z8knpjybW9nyaHYU1w3h30vsFpjEIkwpqGq1eHhnVY/LP11qHljoj5bVwR4mf9LBi
	3KZtr5afrc+P+AeDASai0cPPWhyAB6AqFO4dJNqwpDa8jCYRhTazGBRupo/tfKotHv4CHKOhoA07K
	nXG6Vqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaQX-00000000cjU-3IQA;
	Wed, 06 May 2026 11:28:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaQW-00000000cie-0dDI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:28:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466aqKb248341
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=; b=kKF+OFjOj0ly2Gqg
	hOV2AQlQtPG896p5oCmC1Pg0znphnzTUjMdFriP7jVFiD7r5xGKO/u1cpXqREjN2
	S4ZkZdQrKXc/bhEfGZl/jJiUETw4cbymRaOJnlX/yYOVZT012teCdFhhayF6Xbe1
	KKTIcaJqXWhB5/rogJ9HiEIWBr1Ir+JMMvB9JWvi/t+6Yt1+5uDDx6q5l0ZxX/MB
	vH0uK7z+VScbMiQhOiCZswXcfDVqfAlgzvJ7iYJNQ7d2dJ5yPfj21BozJ7iwrk1P
	Ls6K4SZL8+8MPz6Z/pRmgCgV/11gX7BABZWpPaifjrTnTGr0mdSO8RNDCMBfJpDz
	oL9ilw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyjq447y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:28:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514551d5f2aso39967551cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778066906; x=1778671706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=XndRTuVXfyRCX7GWL4pSCTv0uQrc6VVyHPzWJUN5ZqEnGIxFCv87ZFEqcp+CF8dkjo
         hOqHKNH1WTSGpBHBatMhIvhtn0Z5Axi7OS0UMEJul+mspXopFXag7XHLcFo7vgWJrASn
         YdxH/oH+g9CYwQqciG3Sc+8VzpXrNO18X1T4DVVfjObG0A/x5lr3Qoo84xHYxWgDCO8n
         VrUpmC59GtwjPxxUa9GRVwb/sPPAgtlmucGXHRQ+wp+4xqHE9QC+SAa3SMUY6dxlxQP0
         jHFRebReLnNAgfojOIKtULt2TPh1X5fdT/hU+Kzx4eeJt7L2jv6Q2QimaazQ0z5UWxaG
         hQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066906; x=1778671706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIVvCag5+qHTXfZfw4sjt+95kJffxAurMP3XU4MOgXI=;
        b=ME96+b5n89Kaaua1eITX244PX1TpxrUAzbK/JHpngFC3gz2hkO8mhAvECoYpG8YfmE
         QsHG1+3zic/ANyBgo5SWdUVk/RJCVeDzYs5CimnRZN+3U+fJBCxdNkS3olSs9cwQ83+C
         S2up0zNEmDYvbw0xWczGY8BTgIrPCRxDxsZ9Ghv5C296oLzHHkZAukbMaL6dafqp4bf/
         3ViJBAHExkKT82CzMsJcWRQR7dhVdFteUlXm5CMo9/OW6vrOSgVMYUme70gmIovlJRkA
         zgTKrSl0d1L7WcRqZ/cKDk7QFsaQ4vTovvvCQmIYsZJG5wxxjC9Oj+cFyhCB5MShdRTm
         okyg==
X-Forwarded-Encrypted: i=1; AFNElJ8x7UVHaIFTsR7kSR9GYqEhkWm7VpcfU/HetWtJEnezsV1+0z1H3S6AjyTMImVth+jInWf8+/ykcLSYalbMa09L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1K11NtHgoy1pWCHBiRMiwAQb+CXNJp5/nMSs7o9/DiD6VjAe4
	tntRFvIPO4/TcZjrl1INsgzTCGeJ7wcjopKCIbLq1R6jLEF+YiQgJoFxDMJXmbrs0kUotf/JPn0
	hrUb0+/yoC53Ts5XAUYXBpM2G6AWlHelLkAg+9/eLHX4QTmVK+8B2ZptZXm/KzHdajZ5Rf7UCqT
	kfqw==
X-Gm-Gg: AeBDieu3x06YECWjDZJ2SVc6xWrPcEonqOVEI7WAZGwdtZsu1xGK+floFrU9OC8BXMG
	Ji7FsnCHyIbqXr0h6gEG6hqr1L0mAlsgEArcd2bQqC32BO7AVZ7IyVk67RUN2ixtO5nfPvwHhLq
	FZhKbQLqICDXElQ/8CKGzhfVkuy7PS142Y7fSqjQiADmUqgYTlgLD4JFunYkX6W2PIIVE8RblST
	pkwGlIkEqT3KBmPqWxsD2BqX6LA7tusBEk6hKwqdukopiRhg1OFkjlyffea8JU8BOnqI7I/g4pM
	/5+/dbTzzaoWtd55UEXNLeyBC5vfgeIP4F4f4/ssFmVXzkitOVxS39Lr5Cgcfah51h7pwSuJ3vg
	bShUZsuyFtDvoRppN3eR83r51+uGo2RALuis3scRx+xcbOeukW2SyJjBtDa9traEr/IyvqgMpzV
	pxgEJUoAnLSK+rAhGPVp8=
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43427391cf.57.1778066905707;
        Wed, 06 May 2026 04:28:25 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50f:c26d:f314 with SMTP id d75a77b69052e-514621df688mr43425951cf.57.1778066903771;
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48c04sm12287193f8f.15.2026.05.06.04.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:28:23 -0700 (PDT)
Message-ID: <9ca77795-ebd2-4157-9e74-1fa1001e750b@oss.qualcomm.com>
Date: Wed, 6 May 2026 13:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Andre Przywara <andre.przywara@arm.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MYxcfZ/f c=1 sm=1 tr=0 ts=69fb25da cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=I7hbHXdXhLuFcQShn1MA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExMiBTYWx0ZWRfX/hEz6nHUwIbT
 d6zUZe+CGHLVJ66ITuIkwCQFLJkLwygY0RXHOtdx05b6Lj986KO9O4pAMU8HHTTt4y52ktU/Iqh
 K9Z34S/ybWjXicZDr3HSqsmgZroJDbJ+UVLOek0HaQHv0KAoxkUcpJ5vbXbD2qeK7cei4CNkwFj
 iTKGRIBcLgLpgnE+VA9hFvv4pbE/4Mtov4d6mwxT58K39ODep88JD4vJDAE0GYPPisRLk7ta8cy
 j13YJeHTSU75BBd1gcLohBfoIoGkOzgdBheyZBspkkcOKYbGqDl2G5m/j6mMwVxB36r5degIDMl
 hA88Ba0LKCSQv5tCHyNQOkl8Gw7149Fk+k3/LuLgzdKvEcJJfr0KHhT4Z/kY8fK8djMekiGyGMJ
 7bcp0rfXEVn6i8qFE9GABvOOJEJKgUXuZwGKVknrjasvECAV+MSZ10hhvuKCJPfrP9/31hflE4N
 Z7FlG3Er90qjXemRdrw==
X-Proofpoint-GUID: 6GtuGDamUpKSBVexDjJaBZITZqu1D6Yq
X-Proofpoint-ORIG-GUID: 6GtuGDamUpKSBVexDjJaBZITZqu1D6Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_042828_311659_F88F7B96 
X-CRM114-Status: GOOD (  14.34  )
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

On 4/28/26 18:26, Michal Piekos wrote:
> Add support for Allwinner D1 high speed timer in sun5i hstimer driver
> and describe corresponding nodes in dts for H616 and T113-S3 SoC's.
> 
> D1 and H616 uses same model as existing driver except register shift
> compared to older variants.
> 
> Added register layout abstraction in the driver, extended the binding
> with new compatibles and wired up dts nodes for T113-S3 and H616 which
> uses D1 as fallback compatible.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---

Applied patches 1 and 2

Thanks

