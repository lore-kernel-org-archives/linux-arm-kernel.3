Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E545CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=; b=dYz9meUcaykIyERLACW6w3ki8v
	HR5jCz2qKePJdiepx+LfffhPQvu6XjPs1QEmocHXDuqVCSNIcwVVBwIpZ+FZ+0qWZkfAZt3vTYhtY
	1sEwW3W2Jxid9OxD7Evo64aMffdKv8eNr/JPV3wlsGxDcPVHWVNiWT+to733FnRfmOwZ5HqEv8y2O
	K1InB9B0YTg383wyKl21+xoSWJYYMTEBtW13Gv63XiBfbiF97PfJlmi7yZtYjdDd8mq/3+WY0GlbU
	F5iYxi/Zq1IvtWasZTmyj39etDWOLGCV6GQj6fLNshmhHxpodzRwB1BLad5sQWvft1WkUmfwt572E
	pw50VFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNdd-00000007ozF-3JwR;
	Wed, 24 Jun 2026 13:27:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNda-00000007oyA-2Lye
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:27:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANaac2869057
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=; b=jj9UF+e7mcyHkFry
	G3OBA+CFbOXZpeODwFJOJ/iYYBEaq1Rkz4ksQ5+BlATv/X2A01uy6WrUku6VTL9j
	LJTNb4l5Mzg3t0WPHqQ251e73x4gPCL8eqSMMCz/WiW5QodeJg9/zSjx9uaIO/Hg
	bv+fr8F2RvYv//SNCYdv5jMCF0jg5TaDfpgSi0uSO4SgLWBsf2dDv8x6I8wi/Q1q
	RDN/rq4Ljpm9XGNjF0twuHdLy/AOQ2HpryCWCKSloa2CFKa/anuJyutmCTuFVJ/U
	lgFIVXIYfgRcC0z3k8McLSkP3oFC+nLczf0+Owp0YJ7NodBgPcyhRZhboZB2cGKE
	yp0k0w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq1bns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 13:27:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966ca0f25a4so22432241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307648; x=1782912448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=KeoeJBIyjKrU481NOURf+aXYKXU2Nq20BnpL4pH/m4Fa+J6iQwN9zJFEwPYqVkraZ1
         jur3ytPDB+YTADvHclkvKTIihv0V7Z1CHNeMma63vGthoHg8XzlzphmCX1yz7CQRlpFR
         euMDQysWjanQulWc6TY83SXCHtEEAuYVW/b/V5yS+H8OlEAsloQaISqEPDnUn0JXCEiT
         6U3QsXs/6JMthd52y4oF7O+bAdn+lluP1ilj0VXmliX/dtcUEdWVhPVSc6PWd3rEXnx2
         uYJk/5NdC6/xDounUmYbuSTvzAMeiFe6UrIw9mrsTR4Gm6UOj1HI9UA7dLg5GG/U2HQb
         D1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307648; x=1782912448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duZC2OscGpXHWodWPKD380KuNFM1k4kZJoKhzMl1xZA=;
        b=anBtBNTAel4uv8nhekWsYOt0luryUDRCTzbB200PC9gsoO+Ntod0RyMmRtEifnc33D
         AXoqavVy8ut4ilVcRATrC5OccRpobbRStVvAn/Bkyv1uz/Rkm+3VwpzsPMSAieOm2y0f
         LjfWChUqtLQQ7YPXRo3xcvW3ex3Om8XdlG7So6J94Z/aEC1lzOhrNAm38G4Xy+bUN+ti
         4jPL9Vjo1XIgrMQvsLzndwORfseMx4rT6oWY9hrr2nPzZXlcySfQrheTuvWj0GTFFoxs
         qf+Des0gz3p29J9It8/wa/RO/6Cj+UBHXhuofFB/RQDJKcMyv82wKT+3LBBG/aB5svHU
         MhAw==
X-Forwarded-Encrypted: i=1; AHgh+Rpmr/cFK91hfzOgbZmz2BXOWgggqCr+S9+SCRAOaZRDGgkHZaA1cl3aoo9Yp9J86pxaOggSj6nI/eRMGHaF3z6n@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9Awla8OKYxBOBIv6pwxW/Ct07+oyuSbA0ZN5iT7KPRjWgwKy
	LMRTQk2XlF00bYBhxU0Svnk8HoUTVArvw5dfp65A9A8KYVxTpoZBlrfOAuxKJDtRhlom7Ho6g8/
	ahTRDDRMGCouGLP4wTs4V9ztD3D9YCHiNuexvc2hWNlSCzy22D3j96aELrb2paPzQjKzn6E6HJe
	IoqA==
X-Gm-Gg: AfdE7cnmHr7wb2kjKfpt1D24yzVqqSo6k01gdq5ngbs6i1QsarqyZcdBdh1Nr/YnsMi
	JKOTKF43yqhzE7LByrLmSIFyGxfR4eBuSYIPxidqSImFU8VOCPpuUZKHZS5V97EbBXmP8sah99u
	Sm5vvYo6WJCemnVdYh8l55ESuOQin2F9qa6liWZcjHGsAKGmDzdwO7kwHUNKk9hPwzPKj8PnQtG
	tvvCntjeO03k+X4+NtmyjMHkYZ7L/K8wl53Lo4qPkNiJjvS6wlXo98DcdO+mzFQPB2xMlmdVWxN
	LGX1eFoZ/pF5L8rQkiwG3U21D1C+5knSJhnIE4axCVBXJmBA29w4bx8NaWIQ0KR9Xex8f/EEUuF
	Y9gZRnSpxX+pslQzXc7A/sZau060MLu8SFOg=
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096152137.2.1782307647843;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:633:7c8:37aa with SMTP id ada2fe7eead31-72f3834069amr2096129137.2.1782307647443;
        Wed, 24 Jun 2026 06:27:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161595csm666209666b.62.2026.06.24.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:27:26 -0700 (PDT)
Message-ID: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX1N+uU4wdXvcz
 jZ0uxlpyowIa2tN7dwHGLZF/mq/zSFfjlGWu17R/M5ftZKHs8E9+ikmDb1xYvAQY6fOH1O8BlCS
 Xep77QtN/CrF2/2+23p+U+6SQXFnpg4=
X-Proofpoint-GUID: kdBbTrlmrSxG5QiMOZR4tOLBdjT2UgZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX2MIQRAiCJy2I
 gg9StK1QzjzdccMaOLJIWUp/MCvNT7vP9Qh94S6r2Fbpu5uzY3WuP9dOzAWeuTgslrCvVfPcoaa
 oQM3uguV5RBgBi/hGNUH93C4DmJe2B+UyiyrlCHbk6ZBeq9JsJ/N+533zRLJI1HiyFww4QwNZXL
 zu18+RFpWA0XLU3N2z6nU56tyQandxjF1+RY+/hjXDrD6J5qICESG4Jai4NK6HCS6Arb6oC5Dyj
 mpzfUtM0hmdOM7HzKqcRZk8yL3q/CHf9KQXml2xXQAQ6eI0BqVTCq/KsVH9tN0K+oc4hUGD+jWy
 SLFeMbDOL/J8RZ0fK8PLub0mu8uZsWbBEmXQWVyFgmhXXQ3bTEguWcMRHYxg+OvpHtqwdz1vjY7
 Dj6Bnih2jeIzTTMv7RCavKwST8hv3Q==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bdb40 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=0WHfKmQBZMWu5BVM930A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: kdBbTrlmrSxG5QiMOZR4tOLBdjT2UgZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_062730_750583_BDA41A78 
X-CRM114-Status: GOOD (  11.31  )
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

On 6/24/26 11:49 AM, Jie Gan wrote:
> The AMBA bus attempts to read the CID/PID of a device before invoking
> its probe function if the arm,primecell-periphid property is absent.
> This causes a deferred probe issue for the TraceNoC device, as the
> CID/PID cannot be read from the periphid register.

Why does it probe defer?

And is this required for all TNOC devices?

Konrad

