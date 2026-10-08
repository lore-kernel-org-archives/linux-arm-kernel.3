Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220A1CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 03:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=; b=srZ4WusCXMb6iU0zI1W3DITeZb
	NmKV+GybuabnbAegiq+PMS717ai/4TuEqseIUFybMj0gS2flF3rUyLvTcDo6aLP0JiqHA0g2sG/qu
	uE/t4DKMd8oTpvImXmBsNyPGUobLCphrp4wxwc12ejGnlpVMQogMngBNgnSOgtrVl8XOsim+k4M9G
	wcCx0bsjdtzYDiPZNAKdEvL+XGG8/2gKp/CIrlRKB4O8spZLmKw674O8xUXkjrieqTjyiOo+yuPt9
	ukXES30GaYN7ByOA3dHEPOWUBwtU3PtWWQOchOwjbka98R0IOeV6pYEijAYhAcSYJhhzTDwm24f6j
	d88o+VWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeYD-00000003Qx2-2ccY;
	Thu, 08 Oct 2026 03:12:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeYB-00000003Qwg-0jwL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 03:12:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hxlY4187039
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 03:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=; b=Abzp8AzMlJ8HqrHS
	VYfpRrZ9HLQMguIYr/P9L+X89UScB4PEiua6NADStsqmDAQXNtFXeuOLs8cnZG0U
	Ai99UjvuASNO8FRrb0jFobuICsJdghp7sI5Jpr4TqtdyMPAwVY+wbbRih0hKz1XS
	ZyUEMr5pPQ2PDbI9Jq2QVUSFN0vSAZElCB5v7kefROYozxT136GAoZl5GGvm7ime
	ZcViKFZ7SCeZumYB1zw8lFBMqVSOb89jqbyF1imMR8u8wAb6xjjr88Mrp19i0Dcj
	AiGkqT3+UsnKZGrswrhqCtw59H+tTdu1vPgOGyipyLMDgJ/1uNcUcKBsFd05TnuK
	aQR89A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe30t1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:12:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so3569953c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 20:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791429124; x=1792033924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=Brnx1XFfY/C1/W/FY9oh/gZA9mszN/rNRyH+2tzTrNO9DSVvzj/mcRg6dNa9mflZUv
         ChX+QQM4hCdcqtQiIAzAFjJP761UgG6xqr8KwCxfOz+BpXvan/zSFINeLepsjDYx0Me4
         MaaAE/vGrjFhPGgIq/02X0AJH/GGQVHmwhi2t3HbSQQOz+XFzcxByIwgcX5hsIyvz9E2
         QnUn1MRv++Y0848sUGpfpdyxZJLKE2QLbVpRgYIkl3L1Jaqsqm0eErs1/jIthLMKS631
         5Cx+z+dxq1k4ib9OrtEiTHpOZTbqMY82psiix5phwGrJfJ4CoPcev7HJlWQG1LSHka+z
         kIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429124; x=1792033924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=PVjnL6oail8p8TvJoIoYDoEtcpR5YzeMx0r0ocRYUI80N39eH9MPRWKRP12kNgqV7y
         tOAvW/v8JGzcxZsFgDwUikEhb0UaH4obTjQMBkhCVvf21AJu2qnydZImxQ5Q9BvNMids
         Gtp4g0ckRkx1LNpwlgWeF/B7ly2mirD+4TYV1p0A7C7Wp1NYNiBWdmmdvkb0G8hNXWCy
         628zkxKqTxzwAGIfidE539YWlzFCXJnADIhsA+yTbVMAlZ7mPc49uYcp/75hBY9FFUZU
         eamiz2ze2bLwhqW5xX0agEy6WpBVKDbZxNsoJVmH6I0BW2T7E9dfbhMpAezzCzgq5QR+
         KlLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLB/CJ6AO8e7XTpyCF/3f/RQ++ORe43LNGHSBX+FGTePA46MUU6z+8DS7qSz9qEFsAnE8i8guP1LyJrXC2LVL1@lists.infradead.org
X-Gm-Message-State: AFuF++nSC1uYeWSicEl0r0kw/XTBM8GMA6JSTFckDIDGhS+U19plh3Yj
	OjN1BVBWlumFSIwSdxV6RhzoRHFQw+WYcipcisF675rXhZ+ltEeQ5DfMuUaU2b1h+m8evE2gvYg
	hsGeHRZAWOs+1A11nc5dopt31nW9FAGkZXY8wwtFfnpnAlaJuU4v7okD7kSPdtwgf3+hePQTTFI
	QbXQ==
X-Gm-Gg: AYBFou1o+ZRSMhD1S/k7tUXbNexxvJ+NYHC+GvYs0cylxhh8rjz/1s1KBIIE/IgiSlE
	5Tykod9povq0cflZgkHCsQnmCB9LCvWDtKiDhbh6ZAOW/ZSDBCbVkGbDNK9qPvlCKnIbxvY2Q3e
	MwZor/GyTFtLm0k1/KIQHt25xIcrthPNutU4mG6SH4QRTDF20+e9Xi8CEJr8ngM3Y2ps8RdMX2C
	i/hrIdcf6PWlVKZFjD9GhWu6l6dS1Ry32rov5TeRT85/L0nTtzNvo8JGN1l1/UNWu6+aeK/Npjz
	ZXIQ5T4LxeQoaUsKPs2Lpvc1Vx7CYTFrg+kmQAhm0WAUXrmbjS+q1K2BPWr6WAt04xerdEDREet
	iBicjKytiG2mED0pMeRWpXfAoBG1BckBfn3lv0ZDpSWtmtLt4Sx0pbvA7jX65iiZxdDEn2AEIKg
	MembjFOEldilaufAIzbBg=
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109298c88.14.1791429124177;
        Wed, 07 Oct 2026 20:12:04 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109240c88.14.1791429123253;
        Wed, 07 Oct 2026 20:12:03 -0700 (PDT)
Received: from [10.79.117.82] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm5057986c88.7.2026.10.07.20.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 20:12:02 -0700 (PDT)
Message-ID: <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:41:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfXzOyhS3e1+Iu5
 kdMvl64Ecy+uZHFwFbq1D79a2SKvOV3UenheRduSKP+2C+ZvJkhAu/K0eoRBzd+sDWQot3vFKUf
 KUrz9awUyIBAaCc8zOV8EIeYiva+KsCL82irBS+x2tVpcVf/fFzWZHzl6PFIgIFjUvosTqqefqX
 BK69fyAESLAKim/RrGLonmhvHBrWwfdGyWqp+ZlqnS+4cvOtQBVV1GQl+/l4elqDL2gz/mkDtcS
 JINVOKmmrH3gcWOPO4QIXmekX+eALWge41b9a772cXUMXBHpnkl4XzgWF1pUsiM7LlDEUMowXeL
 h0Osz9gJZZsbbrpXQlTRxFQwT8qp00s7o/5Q0h4dfA46IBLSUqOjqBgxpxCwbNqD+Mdhxv5fR78
 OSqxnp3DLSHvTEOi9E4mkIxQNJ1LjKVm1G3nXf6vH9YNB8WV9GiFUo2/IWwIcnc3VofITnO85MK
 AbLU2ZQEYy8biWTlzdQ==
X-Proofpoint-ORIG-GUID: Iyi--gjcnu-1YB-tugyoLsBjfRGJ92DQ
X-Proofpoint-GUID: Iyi--gjcnu-1YB-tugyoLsBjfRGJ92DQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfX0XUaakK0ZUkx
 gUIX9niKaqY6a8ax0jZ1rgeA286Lh7mpcPfxZ3cH5LEwoDMMY48PSccVMkIxlW3r/ia+FEFOm9m
 eSRrUprPVD8Nq9svuFfrDAt4PqfmGbU=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac70a05 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gpu_kyyjuvhznk9Z_CEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_201207_240833_2082DB04 
X-CRM114-Status: GOOD (  34.83  )
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


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v7:
> - Addressed v6 review feedback:
>    - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
>      QUP wrapper binding.
>    - Switched the QUP wrapper to one address/size cell with an empty
>      ranges, instead of the explicit 32-bit window.
> - Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/
>
> Changes in v6:
> - Rebased on next-20260928. The rest of the series has been applied,
>    so only the devicetree patch remains.
> - Addressed v5 review feedback:
>    - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
>      that all PDC-routed wakeup GPIOs can wake the system.
>    - Added wakeup-parent = <&pdc> to the TLMM node.
>    - Replaced the explicit soc ranges with an empty ranges and named the
>      node soc, matching the other 32-bit Qualcomm SoCs.
>    - Widened the QUP wrapper ranges to cover the whole 32-bit address
>      space instead of a 16 MiB window.
> - Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/
>
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
> Hardeep Sharma (2):
>        dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
>   4 files changed, 472 insertions(+), 2 deletions(-)
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Both of the following patches are ready to be picked:

[PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and 
size cells
[PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC

Could you please pick them ?

Thank you for your review and support.

Best Wishes

Hardeep Sharma


