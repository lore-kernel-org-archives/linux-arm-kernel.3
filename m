Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699D0CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=; b=IzqIe0aD15ZWqIi0yeBZ1oIQSA
	EdqOXOcNirpPQCqCt36iB9a+nV+4p0oKaoihaCkb4RKsACUixfQAc2OvleS0jUbejdaDR1GlpgeOi
	fZbzbWmZ6waaO+HrD7l/rXUpziyNGec0H2fc4icTETfcLnfFQVBP08BTE6mdBTz166b3IKp7lO3t7
	2hGiTk0BFaKSaK6tES5zAPphTkplrOS6vRf126HyItHyCgEH3exQmZOXb+JzI2/zTqs9SdGDLLBXB
	CIrq+5CX9WLQs8CJ/brvSdRixxqjSdZN6zAIvA4F0TEmlFNdhOjJLSzMjnfZP7lUay3fsm7pRRlcu
	c+cRseNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzEc-00000006B8E-2C6l;
	Tue, 23 Jun 2026 11:24:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzEY-00000006B6b-2ukD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:24:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsZ7t3925884
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=; b=IPq+qeqyGUNGovDQ
	kx+2aD87MN+8HoH31PFrPKnPqz0xDKddnVrv3hNBiid/6r9CP6VFhM8b8+6APgZo
	SrogivjLXUDuuJ7fhKFK2DFoyqpsOvdWLQMoE+RB/c4V/qoHR7To9a2DUjEEOefE
	SFzyRO/R6bzxW2133BJa7mvgF/Svb2AGRLaW6TFrfumCdk39N8bl0Fxi6/0AvCYt
	VSPi5BWiU0bGbqI+or6T3hHsH5FmRyzAMi/yovf8RRxQ8sQvOu5iXnF5FTzFPrTO
	sJQsDmdJ6kk9w/Ox0EAz5Nw8gqwVQaG6azyN9APhO9PNclxB/RWUgx6f8o66u1GA
	11Wbhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjj23q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:24:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517bdeceb54so2190731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213840; x=1782818640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=VxYL5dPm2wDDA62p/afUQJW5+mBBboK+yNqKrIiqFEOl9DAodCNoqU9ZqAKnCuPCH/
         nDw3KUdjjmFsHWtqGBVQk4lMrzu2rvItxfG0f1VA9bpWVsCVcWZ/1ofGhAdIfxa3p/eJ
         CWdGg0K5hsDrfVJ4bP3gd/c6iTPu8touewtLc29u65QNwtwv22TObW/n454HepVlGtcU
         Rpl8wxgh5wa0ZwU3+KGq8tBl+D3qrjP8/aXZHZBvjSnU183/xOyBjk6kR4WElztkd8BN
         NPhXGmLI6/Q8XwBSWQYDvoRzcw7D5LnyVo+ll8x/Oy9//ExqonSIAm7WRJ5pPQDe7qVI
         C2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213840; x=1782818640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6etKF2hMA6eJILaUAeJ2b1krMb/CeFYqY1FdlDkm5dg=;
        b=dhj4Jswuhph7YLWOe8xNRu67iS6K07Z/FDRBhD8NHzGQ6daUajc8G6wG4l7+XGSCBf
         GWt8aorFQlIwtM/2IXFyeDdZCwT4EUeFawKjFYVFnzbZHSFW432AGE+qFPd9tMks4A7N
         QFWdgKK01se/F5YksXb3OGWx2aSiS0vN6AK9l0JvUsSJLf/x9LCmC7GfIF0bddB8L8h0
         3EssZtVqZCs3vLlUmPlHaIRaMpNh3BFvFNzzUhmk8kkdkEM04hn7veE8hcf4INorWHws
         Mg5PT9FzSOTW8lY0mK/cjfO70jsUAwI/+EXd78pc27g3tIVCAmxcKgbdlFimt6C9kiQC
         6FtQ==
X-Forwarded-Encrypted: i=1; AFNElJ97KQUjvjLQVx0PAyJYrrvDgM1uZi/6lq1OzomP+7DD2tqQeZKXer3jhLnfQAUhtCM2hP5A9rTiP9nnq3Nyjd2C@lists.infradead.org
X-Gm-Message-State: AOJu0YxzTQGwYBFY7zYeEdk11GAIXllEeN/x12y8NZrChbd4HH0zo1WT
	zHhINIXeW6XCr9vKKvzojNC620d70BDYqmLVXGn7X8aHoGEWRCvZEuuNqD0n0ZrhhpRyzHdfdkG
	dviPx3KYQK4YzoBPBOhtdlQPkx39n1KiWGncLhQ+4EM4TFrYVqpjOVrMbxKkyGQnPn9o/RprJEc
	/dxg==
X-Gm-Gg: AfdE7clP9BDp2tZLOSr+hLVZbJ28y6LYku9gIN2iR6OH95I+hzHKewd88ucjff1nqRa
	w0SbMrbGnbOZp3mIRLFLhUJsgJPYfCUjak/bLzVuzuBUiz64bgdG5vYaiLZwsWUrHgjbTKFZew7
	SldndU4JqiT+sHkdkoTTQQjgzM2b/w9l3XhXxQEs9v5ZIWJS478JlHSba5lTjwx+CvxSBKejzLO
	I3oS7ywtBCzmKWOpu++CHHyXzOWQNOyUusLvX1A9X9oVX8W7aaewITX0HN8EEv0CIbeFlUHNkCT
	fPHyUzf0650o3SmFWyDjL5e+H8eWGl3y5OkV+gQdFabNTTlSiJTP6q8yMdNzeRDGauRvef/pa/S
	Hg+Av8PiB02ZqyctfKLmTziydP6z+kFBbgsI=
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531959285a.0.1782213840077;
        Tue, 23 Jun 2026 04:24:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-921805433f2mr1531955485a.0.1782213839581;
        Tue, 23 Jun 2026 04:23:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm493667266b.24.2026.06.23.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:58 -0700 (PDT)
Message-ID: <dfc8686a-55ee-466a-a1c7-af069b849e43@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX6fxokp6ZYBpb
 6ch1Y9ZRxznUSh4Q4QQThoBjreU5T74Y+rIvaMHSsUVS9mfSp2vlri3hRln38TB4S/l7nGNbcoQ
 1xata0e+5v0NAYYX9vUWP+lfcx/f8iM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX+4Nc+Iw7r5bO
 PoE2imK1Xa/GhMbzDVmyOEeP0V/MSIxl/hcNzl2a2nzpBd+v0D9GJNQHshxoCJ09OCxHIAN/SvM
 Rvl1pQe9CRftyB6Sy8xNOl5e25xrtNPcyctLT37gXBXnG0Hzn6UXx7df5n/dhwkMZXxCG3PZeUr
 4CQdTzm5qoS/xnV+NxwUpmAjiPHs3yLRDP50ocMWTTYRWuctPYcuWtiiaI9Lh5XUCtrMhT7YamO
 sQ5kL53jkTtmy6n4FFE+d2qYwPC1DEJV2k6NYpyI6+nm2Mi1oB8fODVIMwg5g8FyNQ+VIBSGHNi
 HVmPaTlg7Eha0lTTC0nUDc/YbBsvV1kj2Xb/nAl838/lRqL/8CW6wQj+qaT9Sr8U7+VDGL7ZAa1
 nny1ev8UbxmvNp/2Lhyw2Rn97tAkTA==
X-Proofpoint-GUID: bB3LaoraqKbMpCsGWns8UeAiGaRo0zfA
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a6cd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KCxn9JDMVLvDjnwYN8EA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bB3LaoraqKbMpCsGWns8UeAiGaRo0zfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_042402_850860_D8D0E66C 
X-CRM114-Status: GOOD (  13.06  )
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

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Add the compatible for the MDSS client on the Snapdragon 8 Gen 1 so it
> can be properly configured by the IOMMU driver.
> 
> Otherwise, there is an unhandled context fault.

"because the framebuffer is already configured in UEFI"

> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

