Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD4C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=; b=HZO664IXxRbm7JlZEX5stwiCwJ
	x5o+lMjRSlfRXD8zfJTpqOr3/dVnvP4hwh2IKsBhlK9hjNoURM0xkZAZ4eQv6LOU6OXsMdcisDVmu
	/VV2OwpJWfYR6MzFB2PuNWPW1hOEHmcWki2gW/W4iMFk3ctOqoukXtgGqeyf5Us+Nu3AoBd/iUT+w
	YmUKxrwEi54nIkGiry+IW1R/5NASpSv/muaRZ9JLLTUa2NsiJ1SW1gtVp340z2sP33wXjmYkZ4bJw
	L2t3vYmOlCw2YwnsuKb2hRw8nfpzovRu5fr97tluaWooCE5vtWBOy16NDOB7zM8p1/yw73lBGdyip
	CW0bYqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C1i-0000000AunR-3rvW;
	Wed, 09 Sep 2026 06:43:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C1f-0000000Aumu-2uPc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 06:43:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgAHu129691
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 06:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=; b=AwrWLGVP94aUuV3K
	Hdare4o4nEt5w3hZb7m0fFUhfo8DINdyHhP9UvThc2mu1L+0VljvKVP6hqw92ubx
	pyI/YyWWSm8IKhGDQmHnfQSppP7H7KMD0eJwzWaGD7AhRYt1ehn9CYRbe9qo+Fjz
	R9NInUrtLnrHrQtx80Mjwun+LeIyQQpAsBRkQPt1F/qfJWLMq+saFbja4lSZ0f3T
	gkx9Xtu00KRlC4/Gk+vXPkFLkeoewwC/3uV1u+cexSj2frXS4QK7JJzXm4X4WZdN
	5qoeFcF6SSqAfqU4WTkcVmUcKTpvno4sbtm3bxPobXCEe4ZMm9Ex3v/2zVnEnhgN
	/7uPLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk4d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 06:43:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso8101062a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 23:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788936197; x=1789540997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=;
        b=jb+0XEQ5fdlDxEq/plA79wqD7lrUud/xEko2LN3lrILd77MVD3GINkazIJFz2B3mJz
         3CaRb5199JQfyZVxMNBaeGbZCy1UHd5ebN6aXZIIkC60zf6Nf0kkhdQiNwb7GJY+Y9mB
         fe1Tvr4NdtGyzRBEeI8qcV9Gw4T6kO9DUWasjeJE/JVLjYuXE+nJx9k3lqYu3ie/+ona
         SBhuu7X303O69CcGk4ESujqVIJmqF2Eajt0iljIVUN1ov9fqO2gjI9RqpqkfAHZNKMr9
         3PK8Sdu1JhqoykHgDrnojk/9hTto6TkJ7wA7W6VkoTBRXKcjvBjx5uCY73fkNNMdw/Wd
         TTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936197; x=1789540997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gSncg/waZOalwozhN7BaaqXJIs1BmymYB48sb8DdCY=;
        b=FfBBrVcnbBWMki0K00XS9Z3NPoBvEZjfSnhnxDCsAiYo//KXNEnBSay4DPT7nuARwY
         lnisYW6mc+sn70QrY+gkcATE5Kw5WAQL2Sv7CyaTY2lq+W0yNe/5gQJJlSLocHnFe0r8
         F0ZTcBbbpEPaLLy0bS6h/vRKcGDOAIcVbwQpm1qv1+53dnAaQI2ew1hh7L2lolW7FoHc
         AF8Lj635WQH6lMSFh+eAgVIxWljUlUZKJtvsnKSHqHlJIXS8sF70jPnN04UNZ8x2TL7P
         xGLazqo7+MRNuFjLgPU75mJDyqaWnzn5T5GJeKx+Q4ESeGBKcl8nLwHTSwxKeF/nfRDG
         A8qg==
X-Forwarded-Encrypted: i=1; AKwUvByVFvKygMmXjBTzCJmuQ7vzPgFD4trTeT7nAJsDGobj9M4X76cwhSl6iTnufNZXXTpz0ZNmh+dhERLvn+9vE2ps@lists.infradead.org
X-Gm-Message-State: AFuF++mk7Yl8CJTt4+IkyzsOxGKRz4ueqYsffojCBvbXM0a6VX/ntRyW
	86NDJuyGxCCml1nv3OSgPxaxFqIU3jqoTLO/5zEPewR2VjRa92bPLp3SUVRPRlP7w2M1sh2aXRX
	Fp8RWT2a3eoxgXOpxxAgisd7jS9kHGITIMnepsroOTZJWEUvjbw8S8E5N8lKOCLUWmDVz2WxJfz
	fxrePi6/JT7Q==
X-Gm-Gg: AYBFou34jP1V2PbvaUx8LUymGgDo9xQoUa/pEjNJtyUlaSAcr2lCzOIQwA4pgd1fMfp
	ZmZVokfXZScnfkBS5p32aGtfG/ZRhBESk4ulO1jUH8LgrHVwYMw13NFWH51Dtko+hw6rmIyMoUk
	37PDQfrGfA4BrRI1pMBo6Y4KrLvGwAz0EVWTvlaq3n4SwDu1GDe70J422SAMYxZY5745znBd6ti
	jl0i+JFhqPD7UDuc056tN0l3FmRz803tR0xhaGzu//8nfOdvvnAmS700ItLccxSnE95RUTB/Fi9
	elmv3EghaKhPUks9HplNc7/If5lfxFA2ckHWPHneZZVVjFTHnnpi9QEHhvKxyYlJ9BpDYi62R/i
	EIbMx/ucR3k57s7zWJNBWNo/7XmDwZTEeNKGVFPfPNoK0YlOltfwV+CnlxyLZpsRU4HV9lX54jX
	vZzPul8nf+n238XyLDGz/cFw==
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr49609290a91.4.1788936196531;
        Tue, 08 Sep 2026 23:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr49609246a91.4.1788936195929;
        Tue, 08 Sep 2026 23:43:15 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm39523941eec.0.2026.09.08.23.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 23:43:15 -0700 (PDT)
Message-ID: <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:13:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfX7BkRFTBfdaxf
 zOvc3BnWvK2byRwdVy8oiSic4fBO7cQ/oiT2HRaOwfIs4FVP/5zZ17AuNmZoLnn53D2w56OW0aR
 boZaDbHLFylOC1BHBBNW1P+Pb72W5LETjK1wW7aXscuyXMbH3OuZwK6GcWgs0YMFQM6+ZiRakBC
 trBDj+UKFr6MaO5aEc3Y/4uK3SHrTO6ziNdaHfRTBwW6c+CXlB4+9lyxRwlauh9hWht+qxrWFd0
 VD5ocD/75fa2Mn7mlg/rVdbJczkM6Da/JxTyjxKeNMEBhzamefYLSYiKNEX7yEY8OjD+ZwZ0+WF
 np0mOVPm+ioAoEtlGrDQeCQbnCve6paDVoQr4btvJTjOAgeX6Py0HX52rWcWQGZgHfuBE+33AV7
 ZH3xCNBG+fhvXbuNFBr1ynfT9co8AghxDOSlkNY+w00o+0usBYpdU+CB9ClfCvBzWoEbMsTcURj
 4MsRsOonOHNA7zz9/9A==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa10005 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sism7-CWozsur6xqZRkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-ORIG-GUID: tzc02nhryUMSoWlrRGMbYLRYOrgHWiU7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3NCBTYWx0ZWRfX5PJuBdIhCUU5
 2iK0lc53L4a8oN4W23ye+cThdPniybdR+H+QJIJ5D7K7webO5OtyvZqU6J+2u+cm343C8R0Mfdg
 L4ItP1ahyS+xzJKl/5rVM2fhqr9ARmM=
X-Proofpoint-GUID: tzc02nhryUMSoWlrRGMbYLRYOrgHWiU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_234319_856168_E9C571A3 
X-CRM114-Status: GOOD (  30.61  )
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


On 8/27/2026 11:21 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>    - Global Clock Controller (GCC) and RPMh clock controller
>    - RPMh power domains
>    - Interconnect (NoC) provider
>    - TLMM pin controller
>    - PDC interrupt controller and SCM firmware interface
>    - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>    (added in v4), so like the other Qualcomm GCC drivers it must select
>    QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>    (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
>    -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/
>
> Changes in v4:
> - Addressed v3 review feedback:
>    - Registered the interconnect NoC provider from an explicit
>      core_initcall() instead of module_platform_driver(), matching the
>      established qcom interconnect driver convention.
>    - Replaced the NA mux-slot placeholder with _ across the pinctrl
>      PINGROUP table, matching the upstream qcom pinctrl convention.
>    - Added minItems: 1 to the interconnect binding clocks property so a
>      single clock is valid (system-noc), and aligned the binding
>      examples with the sdx75 labelled-node style.
>    - Added GDSC power-domain support to the Kuno GCC: the binding now
>      defines GDSC macros and the driver registers the EMAC0, PCIe and
>      USB20 GDSCs, so #power-domain-cells has real backing providers.
>    - Split the cpu-idle-states phandle list so each phandle is on its
>      own line.
>    - Collected Acked-by / Reviewed-by tags from v3.
> - Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/
>
> Changes in v3:
> - Addressed v2 review feedback:
>    - Reworked the interconnect binding clocks: dropped clock-names and
>      replaced the flexible min/maxItems list with fixed per-compatible
>      clocks (aggre-noc: 2, system-noc: 1), required where present and
>      disallowed otherwise, matching the sdx75/glymur shape.
>    - Made #power-domain-cells required on the Kuno GCC binding and
>      declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
>      is a power-domain provider (following qcom,sdx75-gcc); the driver's
>      GDSC support will follow separately.
>    - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
>      a distinct qdss_cti_trig1_mire pin function (and allowed it in the
>      TLMM binding enum), as the duplicate funcsel-2/3 entry left
>      funcsel-3 unreachable.
>    - Collected Acked-by / Reviewed-by tags from v2.
> - Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/
>
> Changes in v2:
> - Addressed v1 review feedback:
>    - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
>    - Reworded dt-bindings commit messages to the "Document X for the
>      Qualcomm Kuno SoC" one-liner form.
>    - Canonicalized copyright headers on interconnect binding / driver /
>      NoC ID header to the single-line Qualcomm Technologies form.
>    - Dropped unused <linux/mod_devicetable.h> from the interconnect
>      driver.
>    - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
>      driver.
>    - Extended interconnect binding to optionally allow up to four QoS AHB
>      clocks (matches sdx75/glymur shape).
>    - Cleaned up brace/space style in gcc-kuno.c to match peer clock
>      drivers.
>    - Reworked initial DTS: moved idle-states / domain-idle-states inside
>      cpus{}, wrapped fixed clocks in a clocks{} container with peer node
>      names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
>      stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
>      idiom; the YAML example uses a named placeholder), dropped the
>      RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
>      no corner votes / no pm_runtime, so the reference was inert), and
>      added a bootloader hand-off comment on the memory node.
>    - Collected Acked-by / Reviewed-by tags from v1.
> - Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
>
> ---
> Hardeep Sharma (15):
>        soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
>        dt-bindings: power: rpmpd: Document Kuno RPMh power domains
>        pmdomain: qcom: rpmhpd: Add power domains for Kuno
>        dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>        clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>        dt-bindings: interconnect: Add Qualcomm Kuno NoC
>        interconnect: qcom: Add Kuno interconnect provider driver
>        dt-bindings: pinctrl: qcom: Add Kuno TLMM
>        pinctrl: qcom: Add Kuno pinctrl driver
>        dt-bindings: clock: qcom: Add Kuno Global Clock Controller
>        clk: qcom: Add Global Clock Controller driver for Kuno
>        dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
>        dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
>        dt-bindings: arm: qcom: Document Kuno IDP board
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
>   Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
>   .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
>   .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>   .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 ++
>   .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
>   .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
>   .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
>   arch/arm/boot/dts/qcom/Makefile                    |    1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
>   drivers/clk/qcom/Kconfig                           |   11 +
>   drivers/clk/qcom/Makefile                          |    1 +
>   drivers/clk/qcom/clk-rpmh.c                        |   15 +
>   drivers/clk/qcom/gcc-kuno.c                        | 1483 ++++++++++++++++++++
>   drivers/interconnect/qcom/Kconfig                  |   13 +
>   drivers/interconnect/qcom/Makefile                 |    2 +
>   drivers/interconnect/qcom/kuno.c                   |  988 +++++++++++++
>   drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
>   drivers/pinctrl/qcom/Makefile                      |    1 +
>   drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
>   drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
>   drivers/soc/qcom/Kconfig                           |    1 -
>   include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 ++
>   include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
>   26 files changed, 4271 insertions(+), 3 deletions(-)
> ---
> base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Several patches from the series have already been picked up and applied
through their respective subsystem trees.

The remaining patches listed below are ready to be picked up as well:

  [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
  [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect provider driver
  [PATCH v5 14/15] dt-bindings: arm: qcom: Document Kuno IDP board

Since the majority of the series has already been applied, I would
appreciate it if the remaining patches could also be considered for
inclusion.

Please let me know if there are any outstanding concerns or additional
changes required from my side.

Thank you for your time and review.

Best Wishes,
Hardeep Sharma


