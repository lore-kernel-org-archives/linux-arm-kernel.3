Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D399C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=sAbBtnxwuHQJ/DwRDAV9Wx1asM
	oMTPycfZUEdAVJhdkIgmf2Xmf5diyTzZRAOCjmg39AlqTjmseAyEThhmDrvdWM8QvdUIIAF/08u9o
	OnTOhYTxz2/1hb5MzmPN/+a6Miv+yKpNKrwfzO2PBb7u/2nK2LUz/+SJH0kWdgaoYFiBYTydAhS+l
	bsNq4AEzcm8PCSfbFrnfak53GA00D2qlPg0w/W0JsYgpf/hRoO9LGi2rMXQzqrtmSwvBhgv/sQkB+
	K1cH9bn+xIOJtvkHo+1HbU2NqRQYTz0z7j7UqFUochJP1jBa9M/oAbexCFSSZQakrnSFAPhWf+Zx2
	Nlafm+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxLA-00000006DPa-3t0T;
	Mon, 17 Aug 2026 13:25:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxL8-00000006DO3-0jrR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:25:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5vYN2008459
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=fMmMMqJBlYjCqfMd
	HyqpcJy5MgaoCPvIDypo2cWJ0Z350/W9xqJhAhDtiyLM7eEhOj6UQlvFA7TElTcj
	gqh9WlRQVL+6HWl4YFkxx8toHwa3JY9EX9+GHkQWeBzdv2jTvfE2EY6BXQGiFoZx
	n5DjkHjikTuOzPpfhRRLTWWov80K290qsqd4POpSctGs8awR0cenQDIu1Zufdp6u
	XfhHKnHXjYT4tC+XJ/tuQSUzDroyAfqusVYB/UNnpt9Gy19vFempvGPPZAFa2LB4
	zYOJ5s8rclBHmRuLEfjO6SAjy4SXZ0I//lH5SgpTBMul2zzHJC7RNRxSwHNXGhem
	gWrpZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h33v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:25:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so2015911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973121; x=1787577921; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=MF+gPvUHmqPDDJXgpRMeOS2oMW1N9Kdl/o9wbAq284MT2q/n2rRG4+LlpFtSqw3tPG
         FRweIM/zSS24Q4U1qzZCp7iSY0MCJu/MUDEdHs4nPkta4uiHwkU8wQhKTmNmKFJU+uOH
         KBr5M2irEdfgy9O40F9mYHy3Kp++eoLjB/nwFb6FG1m7Zmp82zawYLzDLjX54Ouo+a5w
         ElqO9xrmQJhaf+ftb2gdDcehKq/WAL2k+5JiKm2s+m6wySO8LgXRW3TCXVSxeSjzX9Lb
         n+B6CWNk2aqDK98c9rgR4W/fyWTf8uYyv1Excmr2fo/rSaR3dis9+RTt9BcZVNmJqBL6
         6DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973121; x=1787577921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=h6VTiG6LwUlz4xqB8e0dj+AHOerkHe3JtoF1OjGQM0F836aEGbZkzFzNzms6dntRA7
         1ps0iVI707Z3QNjPldqWkGRJ2WRyQyKBM8vX94PxzuIoczolYo4x1cflE3mbyfs/4GxW
         TqPeonOGN2f+xD6MdK01hbPQAerlPj9mX0r66W4jksYyzfpe41Xva5fojizviKH3N+bv
         SwwQ+KYeeNSKjJyaRJ1Vsr9a3wc5M1ZL2bxdOdTBADa7E7QBvyVBa6MMO+m201VarSuA
         CkgpFmpb6MKcM4Cq56ltcDor/B7CIZf20eqUlSd5bLsFzJpCQHWW6RDAkh0aBFQ6MsU+
         N3FQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxybNc/22bzSYiWDDxLh06UMr3RyfZ+mYkEyuQiCVlHRZT+qgpz+gHdzG9G+jd9YSs+t7FSWvD15Zz6YbGKDGc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9nzJZNOXmBPsXs0J/EPzD2Ke8XWrYSPmTnbvd4TZrClL5YdUr
	Z87wVQ24ISuG/KI5N9Ra2aj2PUZ8zzxx0ryK142seiM9s8cQ+jMNDCtV6AkqfWS+C6JFr3xYCk2
	8/YRXnQzfX6nsdBkZHorbDzOVTMAsGPq69QsG8WTBHvPK9AswUB9VebM3sc2JZzDFoLDmOpkhY5
	ChaQ==
X-Gm-Gg: AR+sD11mAtXJ0bcQRK2DiVIy0fl9F4BPB4YgOBDy329M0Dq+D2wmXBXbRIqroi8p7H7
	5DAU+TIQLV5c/j2xykS28yBZ7ZQd/y/F0on8t6oTW2iqv1P0Cz8v5f5UQsyipfjhtiOkcA8NbYu
	AU42lFi0bRxOPREIOZclppgf2MkbwJ0Us6Ppi+mg4/CIazC1kRUizrggbZtcnIFt6hVmWMSo5j/
	gr4DyqKJw3U07IKA+Bai3GX33OZsWOR4NKjJDWszS4XXXj2NWDs2fdcBssZmfXdOdgOaryQgOFF
	2OjkBP4togfTxqIgo/rq/trYxAsq64O17va2g/1CpUSUf8eMttPD1gjVZ/RJAr9otcZgsD2LmhL
	j/5Sn9f18IIJeksvmGZn9kBHj
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072551cf.3.1786973120249;
        Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072121cf.3.1786973119817;
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97936sm29266066b.43.2026.08.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Message-ID: <57af0ad2-2afb-4951-b17c-918e9ed08ef2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hFu99jMJFIuYGNm6SMEqPr5T8oYSZIj7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX+9UWajpcjShW
 Ri3dWH9rw2OHxplkdYGX35RlhAXgqVovo5lhOQMJsLzdn3wUizSwwGzeearo/qvOjNwGaGYcKL0
 3faorlWWM6M0xQoWM6GzgApzw3bub9Q=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a830bc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hFu99jMJFIuYGNm6SMEqPr5T8oYSZIj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX8Y59IPbcpwQR
 00agAl2pFVBAsg3GZuRCG/f8jGOaeWfxiCE2SlrmhcAme8FpfGWyIACkkBxHUd1hhjbFUC0XAXp
 RshxBc2HnNe2tZmrVYMcEDQMp7UYIAIg3mCeGIMpG/y8VH5FEBYMrHtC2S3c8Cr7gkjDkeXAXTc
 YuQwZFTRZSrIKa6XOdf3YCxPdrAPjse0jk5Qa8mtX6kJNYnc4gGpcMxmiyeV+rNsHMta+/g6TAd
 ccKc2cKGlmKXSnkUwbt8N87TkBgydQuJO+b+0jRBHsi3gjAcI/5Tk9XMPnnIFZJmsbZZzUMfTsn
 putHcL6OBGNMB6+pf4+CH4+PscnxqEbedYjXb8aQP26Qlywnile4ai3SquN90xjNLLpJO2ihXk1
 B2AhkqUsNmaZk+5uRb7BKrpayHVWSjt9lJK3yNkA4vn3wSnugdSsmeu5AUL9e3BfUX4nEAf0dFd
 07YZ/sGk+AwYxLmDkqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_062522_332701_CA5210E5 
X-CRM114-Status: GOOD (  11.32  )
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

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

