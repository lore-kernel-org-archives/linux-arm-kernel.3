Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846DD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=; b=lp9Q/KiAoF8QMJEnYCVS4pWYp7
	GZpW35pViF9LpmN53OCvcdZVCOeA9028l/IqPxk777Lhoxp/s0ym4kBqJP867glgQX2LC67x4mn8Y
	CJtPuuoNKCEQFyZITlRpSuzAx80dk9IOlPu0hpvX7lH/rQxXS4tJCIGgHn1x0UKlx5tDXfXjkSeXc
	LcJUYDjxKak2Y7aehEnB4kkaPJggZisc+5Re+8pJUMbrcIjFetKZKUvmZEXGAzuaqSHppVCShKPJc
	57ivCKGN2lhY5l1CPQVjDcFzQPeMVcn/LYP/lT6umfOZTG0nU4Acj87LWGHlX29hXH5nSoqXk3vO4
	/dAlJ7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ44H-0000000420O-3mWV;
	Mon, 01 Dec 2025 13:35:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ44E-000000041yT-36qS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:35:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxTIf349146
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Dec 2025 13:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=; b=c2B6F0tFjcrU9BYT
	a0r1Ayf+l2wd9/lm03szYYU5V46n0Hnurl62hO6470Vec56G0gQq+4bziEN/J0FQ
	QB+Me7IsTSwDgOyUgWbkyTd/QenUfVOc3juvb5OiJdb39Gy+ZxpGXo7c/l5hCwa1
	Qu7AMk/JkF9VPbdsmkqgkqoXU8Hlz6JVtQYBIR1mDYDSiqy1grdgYGiUraL8lXm7
	eh/hAGhJITR4wOtigTrQhadCsXa7xyV0SWMaqPTwYG5cp1+D8HHrtj7qiNFTU2r9
	j1PZoIg/brkw6zGai+wXViJa6R87LAIla+QzDAvcgfkaXBf3PPL6it0DINHN3Jg6
	gBvS6A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re0dbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 13:35:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5e1fde1f025so422847137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764596149; x=1765200949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
        b=BpZW/XemgHxAHUaPHKPgG8aLt+cM+r9LjlN4k0JawQHaztjXTbDJEBJkKAFmwF1YSq
         50JtPNcprrmTanGXeRMHsjp/tPeE/Nj6Q3Rk93ryP3/z+d8DhPC/Sq1VzUj3eYQWp43E
         b6SzjT5azHSDHq0PQoGP2lAFCH23HCnchVnj1KV3C6mL/cqg9EbRNWrz0c5QWPXY6HC9
         OrDoRmdqDEp7bN2H3wEGrPqmsDtVEHZ1Yd9ZaUrMRcDW4RcuDNv+YkTYq+bNWSnuLGB0
         6FnonFUYxaTuW/NjXBJMsgEq9asrXWINGekyljFx65+OuoQL6o71oQ2b1cAhWW22xVZa
         6khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596149; x=1765200949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGBpbvKiOlzvOmnX0NTD3FcdMyguWjR0JGOboZ7NqVA=;
        b=GbluZU87dMBXhM7RWJWp6aN4SqrIStYYEyBAGgTbKV2ZabIlpRQxAp1SOxTA05VfB6
         8kyROkdrethf/rvevswxTQQlCCK7ybRT2RSHa1f+b8Oo30FLrM4Hpgdo89jdC2tm5a4C
         LOZmCtZR/HU5pi7pnK/PXgWxAhFyPVoNkzoRX8LdskNz+trywi8GIT5Rr1OLZ1OgvRi8
         4SaZbug9CzEFrvaEcmBpjDLP4oYuNVbpCisBKzWLas/XN9pTHMoRRBMHtnG2QpwExO9S
         u2J2DWuZYIOIdplVxahdSU4uH5+lNkOsZkvErO1To+wjBc41sDo9/pmHlsM5UvkVfi3e
         JDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe4LmYGLR3GHuwMEfxnOhS0j5jRTZWvGQIxGWI7sNkeWeisDMuT3AULIRjJq1EcqF0etut3xaX3613Ie88Yr99@lists.infradead.org
X-Gm-Message-State: AOJu0YwsfdwDBEZVEyaxaPJWw+ho9vQ5PhHzUx3EdrR+4W5mPd191Jzf
	RPBu71CQWka4Qro+bx0JAzk3xOo9UxQYpbEGP/iDflnSMHRHbICgImAGEsDfWLrslBuVRo44C6s
	jJSf5BtSsSceLIbdEUdSva28zP7Ma/JIHnl5y+VhU+/dUnZMzrMSfYvfpuLchTkd6BMo8pigYup
	8f1Q==
X-Gm-Gg: ASbGnctSuwprcPs1O0KNusDVz1iKvnkCFVjrIf10L5dzQ3JT+Qu5rE3KCAqUPXNfavO
	f/4EUpzOsxWs99nPjTew6xBYISGAShAJY6Fak8tuVea1KNvw4iagv19WrrxJbaBlMIk7YvsPtgn
	5az6MlVTHrZadN0+evF9ArXKUxOX3rKxEC9v8Iw0t6jh2gYJsspkonSkCG6dwzrURFgkTeRUzpz
	b81DAJ98yqxDU9D830moCHV7IPkAEFhUkBgh2qei2EgtY0Z0o3omdo2X89HUtIwxdayZqgWvfuQ
	r77ctLNtxbnAMijj8RR35aMQmnoRpdYCUVJh3FfMIYG9OhYiITR9u+c2nGnw2PfygMoIpOhjjIx
	UXMu3R708pL42MkifsNX6dzArYGq8FFCeQGCTTMR+WPUBXDuld8ZyHdbFQY9onblf5cE=
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr7410337137.7.1764596149129;
        Mon, 01 Dec 2025 05:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIEwD4EDN19spY8zdgqRbNhH3BpetN0hw22bq4r1xGtt1Ytiy1Dj8is8Rgsg4LEhNka2bT7g==
X-Received: by 2002:a05:6102:5e84:b0:5db:36c1:17bd with SMTP id ada2fe7eead31-5e1de56cb5emr7410299137.7.1764596148634;
        Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035af1sm12781918a12.16.2025.12.01.05.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:35:48 -0800 (PST)
Message-ID: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfXygY91GbV+pCC
 TQNuOO8h2f7qf8oTXX5HlKQXogXZbjq9I46dUCEzmIux/LxlU5weJymjqWuO0TtuBMMkd2/4oUf
 pcT9OB2mIQrTV8v0LXoHWRVVNkLgeTiAthtNVkztMLMkD28BxRszIcOQ499pNTTDJsxX/DIevRX
 8Ki70rMqYGiqZlcuRI2wqWj8ifnq9q7gFpHc4Lq0RvUaqboXW8AHtBuSJoetvHEO7/T3NIliojY
 naimvJUC5m1CjAbGMRtceT4ghZfKOXdkVN8ycr/AyhjZ/P3BE9V51DR6zwNodQrTpT2mOFh4o9M
 zHQwh2L1Od93m0TRlpG4n22OZiFRRAjSPWoILCSZq6O3qx433eyZi76koWT8yVNkFLLnaKUcyg3
 57QaJTBKtZ7+0VfJwDRG4Sanm8eLOg==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d99b5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=qKhk4BsYAtMBMWEJztUA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uZOFNWktxaWWhJDbM4yrdHPUX8u6HKGH
X-Proofpoint-GUID: uZOFNWktxaWWhJDbM4yrdHPUX8u6HKGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_053550_904770_D4A9E905 
X-CRM114-Status: GOOD (  11.04  )
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

On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

The last two regions still happen not to exist

https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

Konrad



