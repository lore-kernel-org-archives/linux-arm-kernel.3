Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77E3C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=; b=1HUD0q9DqR5HRcDrmTNPe0mVWQ
	fn/vVJElSGiOj1zT7lYgvP9YzKvkGfRc+m5Z6DJ381aKXAGfvjJi4tD8up2XfJ213k8ZGm8Mn1U1q
	olGNGuMImEU+KdLw4vUgx+tb/T5oMta52NxP/btjXDFyHbfsuRGiyRGfwwNfhTjTQv6dhhRElTIm2
	A7g4M14JAunF2q6/OunnYOoxMG//PkzC+3x8WJTBUbcYM5cS8cFSSNyKC36NkuQCgX7ElYRomSY4h
	WSusnm7nI7t9nlcJNOa6UVhDaWkTrUG/Ot50/IS6rOzLJnyjinfLi98EWkJoWVJTYV1XUEI38/U/V
	8CQD7/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3YT-00000001CKm-1adb;
	Thu, 08 May 2025 15:53:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2G6-00000000vRU-3BSq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:29:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DaDov009212
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 May 2025 14:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=; b=djN4lqYb4H0wJPQb
	K4O5bAJWtsSJsQCa4f6s4FobiXgYyW5Hg+NLhQwSa1OaNpB9wJemiy+SiP+tUhpY
	WKQp2BkM8Xv1WuUZwd/e11HMvOdT9VFL1AorrRfl7W9TxDDxvM8T2TobbhGEv+qk
	dA7fIi5jp1xOo+v3eNpYndMyrRNA5285CnsYMJfKIKQCXQ+eGpkH9PnH/wCiSX62
	iUvhPOPRwZDtvgEuUBqXLOvOTVrgS+6sLvi1ajrdsvnIAsjEF+iJbUfM4noUE3wP
	DF/VY/7/VTlVFaX6NAVT33pyl37kG+c2uCStfuY7E7FSQIV0kpzWH5guSmeUY4mT
	gUHmlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpesjdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 14:29:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766654b0c3so2952241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714597; x=1747319397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/cgkTnxyg5jfdY6+Lyq4L5THEEwjAJtINqyd81Steg=;
        b=mjUt25j2zANvtSdp193SAiLdOmPGRIwi0pUz7nmaaJlqwmlpmJV1ftV7QWuEyCs8ZE
         08UnmQVp/qe1ysOwhDxyWI73o91c57Ty5n3vzvMF8fAJxQC+P0HUQ1sWDqUS4QxG3kT4
         wz2YFzj1vqFM5FYsYdj7rwdWBhzEuwNpJhf1X9TmWoGs0+TlJBxxS65LXxqq99ZgRJlY
         k4ByCDapzawBwK9IG6SKXAYZZiqBoMehjd7i4+Vd9AXRDjz3fuzUcz0T5uzQC3AqsFZP
         cEBJCEYtJJVn3JikEyR7cuLM5SvaJBCz81lJt8lz3OJnFx7F/bPY/yvV5W6Ce/M4BdeL
         GQhA==
X-Forwarded-Encrypted: i=1; AJvYcCUdGRO5cr3XXm6tUBG4WmJRqjQud51ndVU/QxSWlFrqQJBBPgVTbeK+VJ7D69Q6Cr7hXHEZyyhhRSzU4hH6Mjd0@lists.infradead.org
X-Gm-Message-State: AOJu0YytGTzczt67PbkgyDqdCxbrsQr2JinajkAsBYMMhoEzIIv2G6dP
	Gb6bksuQUT+6TH54+0qvfP/U0Z1RczxPgrTUL0Y9Cln9FSmnqLgVfOgi43i3btgrchKPGXLCNmP
	LrqIfAyMgK1sFZq742AUe5+ZJKVuKH2TCm+4jc3T+AuuiYT+4lwmkc/wwMrY1v21TtxvwvTrkWj
	ndDElV8Q==
X-Gm-Gg: ASbGncvVxn60l3OBCKFGM0+/EhOjrQyq/2a3RvJmj5OWK/LXppkKp6DZfkdZ52wY/Wd
	pmprWyYvhlPFeB7HmiYvpe4UYD+pftwOOSxJCLJHwwDcppwDb3Smh65k8aj027GkPw1UMiACkLE
	bYuHjdyv6QQMPcuYW5wQwS5ITev2XAWfNYIHwqN2FTpELwYgRMh3FxfPGCiEw/3RKvnPrBRHH9u
	miQN07+sawwcGN4jfV/m0Cxt4o3Yrs0tDjZC5s3HhuRKos6sZTeFOiW0xtTfROQKHe7dsBTJWAc
	LB3waMlYsvLY6d1KRnGPrPrEu/jjaa854l1ocqiWGvtH+N+HoxHppfTB5gpAolsjKf8=
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434991685a.14.1746714596767;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfaVl8OObnjHQhd/SJGAsLqOH3DFL4CG4ytZ/Pzo30OjRSwoRvlTataNc/c/g5GA7RSzbphQ==
X-Received: by 2002:a05:620a:390a:b0:7c3:c406:ec10 with SMTP id af79cd13be357-7caf741a8f3mr434989785a.14.1746714596360;
        Thu, 08 May 2025 07:29:56 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781cffdsm11366152a12.46.2025.05.08.07.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:29:55 -0700 (PDT)
Message-ID: <7123afc3-ab67-43f7-b346-bdc336481992@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8226-motorola-falcon: add clocks,
 power-domain to simpleFB
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cdb6915bf40c055c77a0beb2f49c20458adf7481.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNCBTYWx0ZWRfXywEj/AKgyChA
 QUjzCmkuScQOYwp6CaEMosw6A+xYYjGokNuX7Kjw5bp+NGjhKuFi7CBUzva8w6a3cydVQN/0mKw
 n9COYCoqR84AaMD4QXzrG0Wu2ChDWHdf7OWb0YI49W/2ZpEo7coTTFUAUiDi2EVsV0tQ3Cf+1U7
 gBoQYk82RtixRfRZs6DsoHtfUmqwVt/gw6LYADNUSFTtJEP9zd9DvcOkxkL8ixzG/p/y33AB9QD
 iJhsSQ1RchTtGkSepwwy9GuN0CI9i6d2mSuAfc2ZMRRboeJYgalbyAZgOkbYpARPQqx7ZSHRlPd
 ZXERgDIqqIgknimazZTZQCqT7zawJy8v2jyiDcUIAhFvcwvtxx/PwYoxyqu0G4oLGSKw7Q4lSl3
 6hmDVfwI2ZR3Ieucdw1xmoikPwAZsJTIDPWhiXl3JhnAgkZxd8g55B5n/0zQm9ZkbOFmgNr1
X-Proofpoint-ORIG-GUID: mGYSxy3bVsaeSrh93fKI4s6Wh9HcPKnf
X-Proofpoint-GUID: mGYSxy3bVsaeSrh93fKI4s6Wh9HcPKnf
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681cbfe5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uq1pj42CD5qt1GRQKNoA:9 a=QEXdDO2ut3YA:10 a=8aNmnrDM0H8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=713 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072958_917689_2B5DF10E 
X-CRM114-Status: UNSURE (   9.84  )
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

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> Makes the display work without clk_ignore_unused and pd_ignore_unused.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

