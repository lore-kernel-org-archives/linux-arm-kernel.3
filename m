Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D1CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 05:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=; b=nI4C6SOe/0P//lUkca9ZPapkVM
	U46ph0YRBHtua5mrU7ehOkiLZXj196Zzyx1eVYFPpiEiNElut5wH2AuP87ALsyuq43k4/IL6wp3ff
	R1H+fCdgDKpqy20LOidjYJHI0dC2EN9RdJw+W+uUDL5c8kDDJTMf6U0f2Qa7HrJPe13nhPb2ISifd
	HlXSBzzv8IBSgypBiDE0hTUusURBM9raYxPzTM2aKtQW8xYDhldQ2i6HVR9VcJCyg/EX2Jvx6Okrp
	QuqmHd2m391dEcOL0XWQV8hYMwQQmKov0OoRoQnx5grpZ70HXonv+k9x7U9Yg4rDrhE26QBNc+q8Z
	LK+oOunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEWM-0000000GSRV-41Xw;
	Thu, 16 Jul 2026 05:20:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEWK-0000000GSR6-0SMo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 05:20:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wIuv1451566
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=; b=FE1B6bDXCuo+U2C+
	5PO2tZX74zZx29UHWHvilD3Wy2kPQscA97d77bTF3ZZt38AorzSUArCk3JRcTseK
	pEQsAeRl/Y1kXu+3kBVL2Bpr9QNLBBW8gp+Dr3VGI2HRrpMk0nebQA+nsQnqiSr7
	f9yjBZgqIhzNUMHufaY/mwT4Lj18xYd06w0x/1+XA/WYdPldGGftZJx9MdhXiulJ
	fu1DQTZHqoozAvfaTGF0xxZWNclruyWecK12HAecbzeWN1wHf4yQvdVeTwJlst4d
	cN60soCiI+L9nmGlvR7AuMzcZT40T3eEh2zy8j3mD54qjQ3JHCiTbjNH4/WBFMHT
	XU+2Fg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnyar4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:20:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so120396265ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784179225; x=1784784025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=KhfhQzZoGSFMx63KaPuPo5PpsfjvwaNwiOV/HyxUVifoCXweqhL7ZlasKuEW6PVDsv
         U7c++j4gYUnzZbbKNB0oBTi/UYNaTXIcvOC1eKcPUxUqSM2cOol/5/OjxEVTkZZrDiDI
         w/fJvuYv91iAV8XP3q3Dytwv93h3Lems4lX0zMCbGGm3cE4dfIlIJIrvqn9fGVPRYA0z
         PYnprb3nN+eCVxKzCbjjDeCrPBA/wEAgD14OJILmj57JOiQ+uLRAyIyYg1YcuI56VbzB
         ZAPdZYZcdn8rBTiVHJWOQ++tYMk6hrI6pbDME32Rv7DImHgDwI5HU5L9vYdKwRVRWkxi
         8YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179225; x=1784784025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=DNkwN+Fu9fY7DZapOgA7AKDJAur56wTZngoEcUDMn6HVQ+ffdNEX5Vuomi21U2kyWU
         ZgXb2UKUB4idxOT0H/oiwojymFQk40aHKS7B5VufGeWVFsGdofa9bOzOxMohYYpUv3w7
         7xYhsSdfNckmJyI+NJ418SvNr+DFK/n3f8O3r1dmzx3y8Tp4uXaOifiQplWvJyGN4E43
         vIsi3MUOdMO05TzT4d3yRB2Rbv0LfDeXfxbne7uaJncnrLh68QuWCoHms1Ll/x4zF7WE
         fldou7DIslShk5fWHPV2FtVBth68vDyCueRXAuXZS5tUVagJXMdawQw+P0uYPO6xFSrG
         MLlA==
X-Forwarded-Encrypted: i=1; AHgh+RpOS4VIOMwi4iapZmmVk97DOhZhkYX668fGH9flySEPJwploHmkIYOFmLh1O9UkAmlSmyDUr+eUpL5vTGBIn5ZT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy0jY6QiQGoFbDa1Bwx7wLiSfu0NeBp5ZUMkIIwMv86buDS3df
	x1Q6eesvr8wxCcY9hfonNc2bEeogcLvOZ9CI/HNCZBIBGOdCI1XpmAVegyUVrhdOYe4PG8I5YUB
	v5rfvCGge9p8oVAUQeAS8SClwVOWaRrhUz5WxX/Ki17EKvavKy1kdZfkAbrE3Y3O5Q0/hEBSOyP
	mBkA==
X-Gm-Gg: AfdE7clu7sghjh/58nCfpzv2sa9nTxlcAz9bwek4QcT8tGdMcGYdPIUKYhZ70r9Wl5X
	7jlHYkv1vkbc2TwCgoI7e1K5E6e31Pt52DfTQDQ6l3rL4jpn9ORywnItJPQhFaLR9Kd97DIXC3L
	slpSeQlBMYQPHVVWZneDxi++VF6EaZhSLfMsCxJTwO5pNPfVp/+UHssze9C0T6uIQChjYZ6OXPM
	ydeJyNEv9wCYoSx4xea8XQz0uRsKn1KkkIMz9XXjRFREIA4CzdAEBH+nPIwfOEIIVlHSZd4NQPo
	D5j5LCV9a2VJ8VMWzrRmVrCVv8G8uimoJDPLKX3OoVUy3QsGeiWwouEPxXTLw7RMYL9KKQXZZNj
	hN2ybyYhQaUAa4lsHF0uI4irYE7A=
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113452275ad.26.1784179225229;
        Wed, 15 Jul 2026 22:20:25 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113451855ad.26.1784179224793;
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1072eacbsm13535555ad.80.2026.07.15.22.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Message-ID: <cf144d43-907f-42b9-a877-3f54d1da088a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:50:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
 <alYq2J6hd06g9XyC@monoceros>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <alYq2J6hd06g9XyC@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX+g5HFAfhVdJ9
 sVs2WdYLmQx3z3I+qTLZi0mBCdiQyKQB9QqxCnJ4AefyuxeOrQ4yOPgugiEUkjgVGHsCLCnFGE/
 PBCYgiGxcy7JqjGfTwycYpSxvlKvae8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX98ML8c6ZdlD9
 iyJoeErqdxCJaodrjPNZ+mdCy7oLOjC/Sj0kIXnsmoMq1VRc0NKedbNtTHBvS8PAhF6588sSTeW
 gIfMvsvKCmXC4xMWerRkL71FFNvHGIvDi6Tq5Zq5euRfZN0ft90WEKx6MnJJPie39+C/CM+Hjn3
 ACYc819RsQ8pg32NjRk+anPPMylPFRVADpxuij6mUdbuoR2mXuo839u3LXTfI85UAJs955X8P/3
 aLqXrx7Srom+RYeV5j2fNMb6OpwkvFtvxLWBDZypO/xH40Pg8bN3ML53SjOubPPrR+h9BA4cCSo
 x+czRoMfxBBImXyAOS43pNTSCLWBdyolHZTtWYo6A5mURZfS8WYsdKd3EXRQZHMYNuXgLIMK003
 QA/ImxCKFulMJ6yVMVDtAZgUmQrUhDN+Y06g7tgRnbGfn9IDETVk579NenZh9QGN1W/aCZRKsM+
 avNq2t2FRs0cb6wdQaw==
X-Proofpoint-ORIG-GUID: b1KUbiW1Pm4NWD5WoOxAk_xAUEbrI_DM
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a586a1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=GXRrvyA9IJ52Cl4LVy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: b1KUbiW1Pm4NWD5WoOxAk_xAUEbrI_DM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_222028_296012_AEBEA49E 
X-CRM114-Status: GOOD (  10.12  )
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



On 7/14/2026 5:57 PM, Uwe Kleine-König wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide of_device_id and
> drop the include for <linux/mod_devicetable.h>. The latter header is
> going away soon.


Yeah, it was missed cleaning up.

-- 
Thanks,
Taniya Das


