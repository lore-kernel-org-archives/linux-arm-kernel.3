Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=; b=gmAXVaDu6sKFeZFIZGQhOQYvNI
	yg22Mz68scXkG7Wm/R83Zr6Ocyz9LycLiONbZC+nMr1t9ksJc6PpBZCOXiRUUZj6e8q5H4ltK5X9c
	rpZduRh8BoHHvRwI7VmswmTr5rxszpUwvbvnYluHhLuBeRLZWFYnZSh6acdVtq+A3b+ShDlx5Eo04
	dsPnymEehM2OqZ1poaEhSZGSWECiP75VwyMjdgxxt8F3eGxUKbakalr4x0jPSEw1+uiRXjR0v4Al+
	45wVQPIiTf1QVzA1xWfZEanBiYjxil1jKlnpCulYAm1xrewxYKjKxprQ8v4MRhb/WVMTvfvv60AR5
	l8IeTkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXyT-0000000H41C-0Z8E;
	Tue, 30 Jun 2026 12:54:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXyP-0000000H3za-4ACG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:53:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxpI1613392
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 12:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=; b=ST/5qwuLvYI61b2L
	UpVjJrRP+JQ5Y9H37FKkLLWmlCpJi79TR+4KctE6ShYDfIf5Ir5D78/ge2SUogEz
	zX/JPYOcsmGYVv+pzIhohF3p13DN2WMYDxsKpuiyzulfLy8ese4xPbqCwsfGXc6L
	GnqBCZ8SHuPg+EneWuHe9iChqRzjQA+hO2zson4PvJm64h6LBKL0Pn75jSuDiihx
	xLgeNKDoeX8+n//BoYePRYoF+cUeFUsGiKfaT2PJKHMg5ca/s2cyNbWckIGTH6Oo
	O0Ti2NIVZ0Q0XghZ2xUccljMx2FMDoIPLw/yI0zVvlfmV3BNGYZ+OxlLIsBcI57M
	mHmjjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuxts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 12:53:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1857417aso214871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824036; x=1783428836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=E6rQBq9rs+ySmQRrcXgp3Lyzh5e5oC5xk3bW6e7s1cc+5VEri1b/3rMk5QNj4i5chh
         t9bk2u3i3vhXa+seyYWZkK1+bC2mfpuNodvyX8HHCUbw2XEad3QF7MXzUTpN/TNuJvgO
         ZpCvz9nycJKrQgsfPtYBXbvojlGuXg5pRatUMs21yp2mdGZrHt/wBKCv8iZuZyNix1Em
         9p3dBuKymTuC4Tp9cEs2QiI08/kOOqB534gkIgpJy5pmujAhH34g+2RYU9K/A9kqD109
         BIVkNO8VBqSuavjgwb99fFnzSbUskm+HIPPFUk06FpV4SHF7zizSNaAnTlJVERxbD4YJ
         xyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824036; x=1783428836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVVydmB+F/Q3lIThr5N9q6SMGTOI2KZ6WWC0p9mrjOE=;
        b=TNyydk+ffjclLyoWrvmG7xCJSBcBROdmp/JvvoduxuoPptGiRzxttRo0bQpoZYiqqW
         mN5q5VnP/05zlvT5oQvNS940eh2g8mWqHxB3HzGCLsBiZI2UQOJhHJTUMWO/NMfQv6I9
         nsMdEF9CbYBkQAXO6rbpx7z3Q8df+KHp1KrRzkJYj6OZLXruvfKo0TNhbh/flBfqnrS+
         LAsFxxgjW1Z4NMPMRL42wqlLOjJLa3QymZDVhP5ckQdNZtE+9q7X4WGomuRYRpXxiVKc
         fIEMEG/9On2Xxkq1vo/w1D+n72D4H8LDXNMVjweVg6kPplF/HHgpWfPgZK2ZzEEyJhiP
         caxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RQ8PvcqFCzbsLRojbamtQxDU4LwQTyaRFGlYptsFEQ3hQt43s8rsDJBQD0lXEoe/FVWO1tWxZVL2jKdotCtPs@lists.infradead.org
X-Gm-Message-State: AOJu0YxL4iMi2nMDz9/Z0O6dJLtSif1ZUEeg/dM4Cy5rhF7qA8RzbSAy
	YGSjAMxD0/t8Zkriy95MPfc4R3NcXXPglHEyK455SiTjOUSXcPYMCapJl+XTgQpV8mYuH0PORDl
	m7lTnHdfTHn7k/aQaTJKNUwU2lnbvk2NZ6ntcr6sBSBWWKvPwqcVb+CLm2Xx/5Xc0uYesfYbYTb
	7qgA==
X-Gm-Gg: AfdE7cnH2NMcEchtRc/tC57+KLKvEqNk5o8m/h4bDttU35U1rx3/xYiGd+Y/7gTjXYD
	DQDTZtiF2ATlIqvjYfC365wUeyMfoiUQKjr6o+PQ1PyiWWXAr0wZST2k7Ymf1AnHbD1mvbCMibY
	CBmJV11h3jWd42L4ToNobN2DNpNXZTmBFbujHBwoS7xldst0tLLGn39RcNWcaK92lBSqzWsdbnn
	ZIpFscOqAmy3S/nKA2LQteUnKc+KG5g2un+Nhqt2ZAv9g4BvCy5+kFcbAtNN8lPua7HySa7NkBx
	bU7oOk+O5nFHfBDRlgiSJCbW38/psr2TA6kotXnTJhYzkIjItKhd+x7CHgb8uNTiMMPDtJS946Y
	9auyVzRfWEXrMxlcnc9BkOIU48QzTG7k4dfc=
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32761141cf.8.1782824036424;
        Tue, 30 Jun 2026 05:53:56 -0700 (PDT)
X-Received: by 2002:a05:622a:120f:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c10894a12mr32760741cf.8.1782824035970;
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm121297366b.3.2026.06.30.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:53:55 -0700 (PDT)
Message-ID: <a88201a7-0a00-48d8-97cd-300d6aa5fc88@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX4TDR7nn4ZM2B
 Xm3MDXzp0YGqHp74frXpfH0OSIzJ34Ugz24WXlUcx8j+nTx6YwqWFQSMJWQFgR4C61TsQ7XoHdh
 PKVbwHt9FBVWiTskPn3lleQ2yn05SrWLwZ5IfalxG3282m5WKOgmlOgMqW2J0o6aB62kx0aAlSB
 HW8wMcwAyT+xSLN5A4n9gFgf7HA/n95yngG7p16wHbgtcg4tYa5XB7F5Tz+FCA+lqc3CSDufB67
 1tXNZLPcYpy5Ee6Etnoxt1EBiILsUrCJV6ULcCpElJOvhzMNBSmFIObVsozMTFUy+joQHPWaob1
 +mkitePajvU9Ark0h4IITwhgLN2nA7EqzPRXIxyURu7Es7P74vLkHfslfHCecIeuvmYssmv9gEF
 XDVFlKRSop9Q4zhvuubXYAtunwh0TxTMbIRqB8wItoLu+TD/EJGTU9WRMxerRzf+moRCc6eB21U
 kthBsuvQ2i4S0nzkDdw==
X-Proofpoint-ORIG-GUID: 5iBHIxKJuWdFPMpZ7Ht2vBCr_3vl1XKs
X-Proofpoint-GUID: 5iBHIxKJuWdFPMpZ7Ht2vBCr_3vl1XKs
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43bc65 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=keZN38YVYYl-MFWHEpsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX0UoNtkKV2crj
 GAxebfZRUDgO+u5GpnRZ7SBsFLEEOvAaD6Qd26Qzbw4bUVxfeX0RNvCrqEATOAG8fYCxbiXUege
 jieSVW98i7Fnjfob/MsNL0POLzRNHyI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_055358_161581_0F7D9CAB 
X-CRM114-Status: GOOD (  13.36  )
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

On 6/30/26 12:36 PM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. The AMBA peripheral
> ID probing fails on this platform, so the device never probes.

An interested reader would immediately expect an answer to why that's
the case

> Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
> Dropping "arm,primecell" makes the device probe through the platform
> driver instead of the AMBA bus, which resolves the probe failure while
> keeping it an Aggregator TNOC that retains ATID functionality.

This describes OS behavior. Move your message towards the other
compatible not depending on reading that ID register.

Konrad

