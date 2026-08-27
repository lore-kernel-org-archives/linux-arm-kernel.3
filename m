Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BFEC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=rwvBwrhtdoFQEC2uangloMDLNv
	JdYjTHNli5r9Oxs4Ug15ATf+sdTL904urBY9OTZ0XQlaiclbPJqH8b4AqBsPhT+KUGGDi5GRmWFwb
	WXZmRj8CIGW+oAk7mGJxrirhtK62FB+KIrrQ7sb5+mYPgLBXNHyftXq4ZzTzloZxoBnUbxeOyZbZv
	dQgr2BVS2guNGr7130pMkX5TPOuvzMst45MJUBkow8LWz6NbxDb7b3UQzsPkbFa5Ja+UGlCNQwdD1
	zVHbxPbNav+LoFOonhmQTDB/zd2nwpkBDv0AU1Z1fA7ABe1KHwXCG+WOhoVQuZt8VMsphFkR0ptKi
	xQRM062w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDo-00000004Ofv-1j9u;
	Thu, 27 Aug 2026 16:45:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdDc-00000004OZO-2PGo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:44:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbf5r3829412
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=kZInGT3ECVzaq4wJ
	7GaKlLA5q37fgPbHoGzEu4Mzmt4ATXsuzcwsi8TES9wCtD0j1eBYIgcivZQEoZpp
	Ve2iKcWNtUEzg7InLKOjjDMCuxN5NHN4JcoAC18N88LJ9tYPljPqmcw6WcHjt2nB
	smvuMotesHkm38LDuub+IxbwDW37/PGIMn3WagVIytlAxv1uhytou1C1H/fUyxm8
	xb9CBeZHGfoZO7QpG5vxwhhpLJkDreDDgvWTRZ+U8+XPw1bsIMbyaiPs5lDJHL5l
	V3yEw9B/+2eqDvrkcY9RorKG7jV5Q3OTioMJGsFgedg62K5FQGcDe21P54hKrznC
	822rRg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s9yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:44:47 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28d8d1b76so147783b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849087; x=1788453887; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=PZNCtjlTlyGza4D7vjMNjqKplqX4K7RcZ6NpJfHHogJv0CNFrNYGuk8HZfoLDGmihU
         SqC2io3ih5og5PpUxiFKVRSIiC7x5x2skKLqcc1DDf3EQGDr8Aqsq74QXI4+24/ge/tQ
         +5D55/Nx8DOr6a/02JdXyswMVSWZGYIMVUou41Zm482yIrTbmGX46aa5mtrIWqsf1+O+
         4fvmwD3IaGUQkcIHLYpUfY4TGlM2uWXp24iIaQk7FBcz/GCsZXJggNyVzgNSCyS79eeF
         MBduAo6Oom9CdNKMrw4BriJHTVEItJmCFxsqgzIOFRdCrvrWgPE/Gunj67Qcbl+9e930
         oNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849087; x=1788453887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=rW1+bug/LPF828ARMlO84/vlXcFJcXAGcc5NxFmaq5VAsrX6lX7LiAb7KMoFP0J6j6
         D048xbw6uo4bcxeUHWttlAAPooMophyNnHgQziNG5GXj/hi2RWKtKvWbPp0n6njo32zR
         ex9r0Zowb6Xrn+UmPuPc6ZWxo432U2fNw/dwVbIncn+dR+SJqxfy/lblIhdqssEAydYc
         U/g+3wPwtFUO3+cwheycRtQULaRt8c9RGrAIcZzW0lfyeYZ2WUK1rhLARgwG1GZ7zKUa
         Z5tn2PFP6ViVUAievXMQo0MKKzRvA8jqKtCQtxXX2NCP9QjiaZxVvrwEDbr1EVt0EY6k
         zsOA==
X-Forwarded-Encrypted: i=1; AHgh+RoGukZtDj4WUc+LiIE4AIgvCs2GLIMWCYNdEzpuDNQ88j1ChqsACnpZX/eqLUp8WkDTh6zJ82XbqKl5DSWfGMLM@lists.infradead.org
X-Gm-Message-State: AFuF++nKLCPKapgmqbzLjZL95lWXy+2sfe+m8tgkBaNcDo1wNiElTvoV
	UHgiK7DJhMVkaj606vUl2wSF3st1NplFzTA51cJBhmld2gbRshlejEnTmprTWl8rmXDTKbC9msY
	UqBHH6wdGFO9cYghHpxH9MzzCnmHNvhcKsdoHHixkcCpQEi9xFwxv9XV1E1/oI3tyqxcZ5I/wAN
	WKBA==
X-Gm-Gg: AR+sD13e5y/43eOrb3UpDX2UsorjhIf2KFuPmGFSu4yMH+QWLo2pOzmYmIsv2OIZFH1
	scn5qgJ2MM4wxoTu6NISUqxz+WoktNps9G2BVyfujvk4zqai01qtVxATBFCn7lZhL9JEQfkjKho
	G2uQRfYgMeOUzxWlz/sWY+75QK5NYwk7bwGo3gmi3JxUGn7LS1Uzw+r82/cgKF5FmvEvxF5W8Oj
	JSdzgIvzVYW505dGh16R6SKS8OTfbiCz18Tl9WhEV3RWgOglJT4EKaJdunUG3KKIB5Whs2X9TXv
	FTL5mWRjfYVa/gVXGuYJ2lKI4g1/dALtshCHRmXcMQ4BwGmJp8zblcTRuDow9lgBGtkEEVfAsqh
	AI7oE01WuNh43sXI46DGPal8dXRMSvfc=
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410533eaf.22.1787849087012;
        Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410471eaf.22.1787849086580;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a253d6e7sm5112145eaf.7.2026.08.27.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Message-ID: <67819cd4-013f-411f-8f5a-77df0e3a88df@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:14:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX8olRjmDkmKLW
 OeQ7jp1OMBsYws/JTYyBTOa2cJSJaQjGmupcJmKEemsKMcrHWqrMyifhz91THuXAWb/Gcra8yYr
 bda8RUhro+fjQ1gh7La8K2AtKuhiGmT6IIM/W4OZm2TrM+5u5pfSUTEtngy8BuPZ/ASCiwlHbZa
 f2ArWCXVQjitus1tM//8siiUxpNoZdgP1FpwY6UV71cWCmElbgvk74uyBzahCXNq0y2oqhDGSxD
 n7GoB/0c9kQ8U8Jemcp9ms99JVsRbdNCuTuVqN+CoNG7a7cUJfhqqxcu5Qi+OGSxfNHziV8rWGn
 kgRX/NhZZoQiFyjFo1Ii8zdtV8CL6CLbD8TDNOoi+LFEe8vBFsN6XQMg2SVE72L9I5F9ZjCY3jz
 R2qQG9JM0hss26XVsV/uqEox3U0b16md0FQNplQ2+uS30fwT3Gf78d52E5lLDM46t5yubuy8zP+
 pfGTsSEtyA73YkzfNTg==
X-Proofpoint-GUID: sBgm5h2Ak-q-ZvwEOV5LdSXCIY_FTeYq
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a90697f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qgGxlNUwWlbBUD903MA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: sBgm5h2Ak-q-ZvwEOV5LdSXCIY_FTeYq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX9gJkaTvu+tSr
 rMBfeEw2YYHLNw/OfWnNvkMRkz59m8M55uZQm/x/i2yloAZm32Q3YlSW2Fy1ArRAsGV7942XxX+
 HVPuHdOZVMNU0bPAl4Hs1XMWbVvE02k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094448_643935_9D069A85 
X-CRM114-Status: UNSURE (   9.21  )
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


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> drivers/interconnect/qcom/kuno.c

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma


