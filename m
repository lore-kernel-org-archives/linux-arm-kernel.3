Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52414C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XgLhebGOrPjpndKIk3O4PWv8zb8BOpN1xx0Y0zBAdl4=; b=U737qr9pPPHDyu
	oD1Pszb3oXsBzTPVVsR+7qIpk0HoE8APhGC6xI3j++R5I31AfLiNHsWWzQaMAfipfe1J+ij8jkIue
	F1LsQUC/VgVJf+P6DgMFh8hnCp9/zxtXlmxBDLYCzV8VSEyVz/NGVNmVchZ67jhbbjDEP0baqBLRz
	IOZMT1aUvxwIiVAfV69g5uM3rPWvtledm2mocx2jszYULSJeMYR/UKELh1o/zsjdkozyeEDOG1sHE
	5HcCLYcl/Rb4I/7/GqELRBk89CZbzqW8osrU0Le/MwnIN8/5IcscKHK9yse3q6V+d3gP8AOt1s9ZE
	tL8DPWFh5eAtPpXtuWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7R-00000004MQx-0cbt;
	Thu, 27 Aug 2026 16:38:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7N-00000004MQF-1aCk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:38:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFc3cY3921931
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XgLhebGOrPjpndKIk3O4PW
	v8zb8BOpN1xx0Y0zBAdl4=; b=kFmEosoGmPUGPAYYv7npWKg15PDaL7cveL5kkj
	bnMpS0ABsw0SC/sNknOKLbM0TEtIoMPyIrJZkqBmYcyRY7AtOqlOHwCT4CwwRX77
	c2/ggd3qDZqJTbSk+0uzPpHJ84vSKS1PphjfvvkyXgaGLrOxIiZdflUkYI4oL8z2
	jWdOU5LqcMKJtxAF4+GPLfBVW+Ag+1UUSUb9g+OH6vyUjIfDUq1WV+mLq/SzH3Py
	1AIjIl5+8dmQwFOblKV2CDCL8PBrClq7+pcwRn1ha0dGejvy42hVbfgdCJ5nkPGQ
	ToGhNyR8CTPHO6NqQmZD9lhRL9Qgi7JOo5WxPj6yH9Brg8zg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw0nh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ee1e335245so113275a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848699; x=1788453499; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XgLhebGOrPjpndKIk3O4PWv8zb8BOpN1xx0Y0zBAdl4=;
        b=jkN7drDHw+2+QDeCLwslzQRv6iM5XUUnIx/5cx1sqVgOC1cbPRjPPOTE9C5Jwgcx7h
         A6bxyqOzQtaluILiiGp1zGAM+m1UxRNTXnVwC5jKwVQSiUn+7EHSu5vfayR4eCyMRE/X
         baQEUhFlk4lzvq6gfPnPSbxs1krGNmnq00Dk5wqs3p5yqJrDdnOTAwNjz6F3qI9B4KB5
         /RauCwTGsGcc7Iw0MLykB/LklznF4YLWGoNczRVHd4Not7P6IcBzK91MF3ukL83jrVsn
         gIgzGVLozF4ms181s6Nb2TXNEM1CgG6G5SiBij0UZ06S3fV73Bx1pVvkblYYT/zPEmtJ
         ECOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848699; x=1788453499;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XgLhebGOrPjpndKIk3O4PWv8zb8BOpN1xx0Y0zBAdl4=;
        b=cjmGXwhE58J2+FaaX6pWZbJEeigMP9CJfp4/lyVQcX/PfJIqjrSxllMZY+EJyXky2z
         7mg2ywNmGuLqDozrP9L2TtNtmhWE3qnBIs0iBCfdizk2JNiEiXFc8H91loD5YDEBaqqz
         08vZuQxnc1j09xbSbyJpzAesqJI73b+zvEtT1e2d32YAe6NxSA4JpVItPErq2ctNl9Gc
         TBBJnzBuXSYRLVFEVLXEaQqHeuOJ5soypDRU9+FOnTji9US9BZrJMBfRxpIgK8q2x5Xe
         MJ8d2U8g6TN9oCuf/uVFok0pBe23Edr+hNrjiAfv63ts3/VHPhIqp6PYQfW93ubKj1+l
         s5FA==
X-Forwarded-Encrypted: i=1; AHgh+RqwRBIn1fhp7/Poh/wsWIaQzNh2LqZA/lO1/Q4H+Oxm0p2sWQC3RKqWt1mWPhkjWVy6HdskcZVtwzKAeoKUKA9y@lists.infradead.org
X-Gm-Message-State: AFuF++kuvPXfxc8Tsv3nBxpNZnNxPBwaLtx/0ZEJAzGZXCNy/aIiiL4w
	vFuKNoVwRWppIvkewaKG4h5JkaCEG6RnluLd0dAz+b6PziCKnRpfrDpNhyUXUaEKgeRfQeNOKXU
	VXbMxaAC6eKmct22VQJT7wWyyQ7bf3/r0hqHxx0TU1BT0VR6Rv6P6YdPEPnfZ49uITkfmLHrMnm
	sR3w==
X-Gm-Gg: AR+sD12rXBiW7b0ImO+w8efQDUYopiX9YZkCuYQSQjFxF9Wc80GhQlBZR9b81dr22e5
	nkPhZSXp9toboLDNBgB3jeNCJNm/41d6fWRcPAfwytv8GeL5iQ5cvlxrFGZwRtFRK6VJNq4Ofa2
	9Vebu7q3GkJoKtUqylQVjjwO77PLXtfy+8ycSpYuh0Jxp/MZKd3ZHMsyqcpXVEhYXA23BkGXCGi
	LKrbVV7bAG7yt8ZBLLQ4d8POhP5Op3KHFb1IYtNl0ag4tgxAD/2XXlx/8XoEk23OyepNgMAxLvE
	tLAmf4oVeSNhreA+j2//22tSRYTQJDzQqZ3DzEN0awtEmdjTGTfE3xdAJCgrMri8vtencRdzmqw
	FLoPaz0R4gdwzv78R1W+h6cBakRVHwjocOmPy0HFgZ/2FhDpVZAxZshVmkptbyNOePCeQaam4DV
	aoLhKlJgRtaq/ZReiDGinhMIg=
X-Received: by 2002:a05:6820:1c9e:b0:6b1:c1b5:7f96 with SMTP id 006d021491bc7-6b1c1b58a27mr263749eaf.14.1787848699098;
        Thu, 27 Aug 2026 09:38:19 -0700 (PDT)
X-Received: by 2002:a05:6820:1c9e:b0:6b1:c1b5:7f96 with SMTP id 006d021491bc7-6b1c1b58a27mr263650eaf.14.1787848698450;
        Thu, 27 Aug 2026 09:38:18 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:17 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [PATCH v4 00/15] Add initial support for Qualcomm Kuno SoC
Date: Thu, 27 Aug 2026 22:08:01 +0530
Message-Id: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOlnkGoC/33NQQ6CMBAF0KuYri2ZtljAlfcwLqAMWhWKHSAaw
 t0tuHGBbib5yZ/3R0boLRLbb0bmcbBkXRNCvN0wc8mbM3JbhswkSA0pZPzWN46TM5z6tnW+46L
 Mi1TqEqGoWHhrPVb2uZDH0ydTX1zRdLMzNy6WOudfy+Yg5t4ffhAc+A4BS4xzMIk8OKLo0ed34
 +o6CofNK4P8ckS84sjgKEiyJIsrqBL1w1FfjhQrjgqOyDTKQoFWOl1xpml6A56YQ1FZAQAA
X-Change-ID: 20260809-kuno-soc-support-1dab826de0bf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=7023;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=IuLBCG8fwivf7QD/EPSNHEsGg4a/dKCd3dCzYHyww5A=;
 b=6B8BxUlMPUMsylsRHyitMa2Od5NzIDaznMlx51zPqCnskxQq1AOXN9Rq2cA5EasT28/SZXnyU
 iIQVr+Htp39AP7H9U2SQA67oKpJF9KYlSBsxh3K6AjTcRH4PqFrofAH
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: xCPH7UEIDBcxGrTKpaQqga9Rssp-EmsY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+1oUuD7x7p4H
 gqxKlD+mcTdWen7qI+y5fOtS4cEfuy6ba3fsg2cN+k1LoWw7av6j7Flvm5tfXdXWc6yeWrG9z2/
 b3Vb+Ixo691DM7gSGvEig3dNr0+ThGg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX3wTVNj3ay5hA
 VabWeySYvupxnI33BV3sQZNDlopZNWg/ENseiiRVU6Pq9BjBgx2iuWDljPMVT/1j22WJAQ48sRI
 ceNVEVXzRy/PvqqzGgwP7Iusxa5xZva4smOP11z45kACBE3EQzlUzsZPIkD82mG8rHnhvz+4IhV
 ixMZWt8HAvNfmkcYSwxW/IG+ruROeN8u8bkLV9/D0ukmMrNo20Ob6El38YGz6e7lLY7656Xz2Kl
 gp/zW9gd+Ua3uEZY25YLEqMuhX6ruqohgPPstA9ehxUAt92zkqe3oFMg8OZrwvp7uDfHHxJwNCt
 e3CaIYiRr4wC2In2Jgqpyg3cg8Si6zzYJcxXxSNytmJvmOoNriF/bXkl6n6Q3uWnCOJHTzVcGHe
 2UlxkouVqdZWgB+ljfuH8a+zyENVcV+WtiuFrOHhjJ0UZV7/szuz0Rfz6rdbMmvK+1Z9rLokdnO
 9TQZnJ9KrzNcqtWK3og==
X-Proofpoint-ORIG-GUID: xCPH7UEIDBcxGrTKpaQqga9Rssp-EmsY
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a9067fb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8riaqLHWwNYsoh2d4OYA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093821_542721_87434DFF 
X-CRM114-Status: GOOD (  22.12  )
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

This series adds initial support for the Qualcomm Kuno SoC and the Kuno
IDP reference board.

Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
the essential SoC infrastructure required to boot to a serial console:

  - Global Clock Controller (GCC) and RPMh clock controller
  - RPMh power domains
  - Interconnect (NoC) provider
  - TLMM pin controller
  - PDC interrupt controller and SCM firmware interface
  - Devicetree for the SoC and the Kuno IDP board

The soc: qcom: geni-se patch allows the GENI serial engine driver to be
selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
depends on.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
Changes in v4:
- Addressed v3 review feedback:
  - Registered the interconnect NoC provider from an explicit
    core_initcall() instead of module_platform_driver(), matching the
    established qcom interconnect driver convention.
  - Replaced the NA mux-slot placeholder with _ across the pinctrl
    PINGROUP table, matching the upstream qcom pinctrl convention.
  - Added minItems: 1 to the interconnect binding clocks property so a
    single clock is valid (system-noc), and aligned the binding
    examples with the sdx75 labelled-node style.
  - Added GDSC power-domain support to the Kuno GCC: the binding now
    defines GDSC macros and the driver registers the EMAC0, PCIe and
    USB20 GDSCs, so #power-domain-cells has real backing providers.
  - Split the cpu-idle-states phandle list so each phandle is on its
    own line.
  - Collected Acked-by / Reviewed-by tags from v3.
- Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Changes in v3:
- Addressed v2 review feedback:
  - Reworked the interconnect binding clocks: dropped clock-names and
    replaced the flexible min/maxItems list with fixed per-compatible
    clocks (aggre-noc: 2, system-noc: 1), required where present and
    disallowed otherwise, matching the sdx75/glymur shape.
  - Made #power-domain-cells required on the Kuno GCC binding and
    declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
    is a power-domain provider (following qcom,sdx75-gcc); the driver's
    GDSC support will follow separately.
  - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
    a distinct qdss_cti_trig1_mire pin function (and allowed it in the
    TLMM binding enum), as the duplicate funcsel-2/3 entry left
    funcsel-3 unreachable.
  - Collected Acked-by / Reviewed-by tags from v2.
- Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Changes in v2:
- Addressed v1 review feedback:
  - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
  - Reworded dt-bindings commit messages to the "Document X for the
    Qualcomm Kuno SoC" one-liner form.
  - Canonicalized copyright headers on interconnect binding / driver /
    NoC ID header to the single-line Qualcomm Technologies form.
  - Dropped unused <linux/mod_devicetable.h> from the interconnect
    driver.
  - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
    driver.
  - Extended interconnect binding to optionally allow up to four QoS AHB
    clocks (matches sdx75/glymur shape).
  - Cleaned up brace/space style in gcc-kuno.c to match peer clock
    drivers.
  - Reworked initial DTS: moved idle-states / domain-idle-states inside
    cpus{}, wrapped fixed clocks in a clocks{} container with peer node
    names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
    stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
    idiom; the YAML example uses a named placeholder), dropped the
    RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
    no corner votes / no pm_runtime, so the reference was inert), and
    added a bootloader hand-off comment on the memory node.
  - Collected Acked-by / Reviewed-by tags from v1.
- Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/

---
Hardeep Sharma (15):
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs
      dt-bindings: power: rpmpd: Document Kuno RPMh power domains
      pmdomain: qcom: rpmhpd: Add power domains for Kuno
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      dt-bindings: interconnect: Add Qualcomm Kuno NoC
      interconnect: qcom: Add Kuno interconnect provider driver
      dt-bindings: pinctrl: qcom: Add Kuno TLMM
      pinctrl: qcom: Add Kuno pinctrl driver
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      clk: qcom: Add Global Clock Controller driver for Kuno
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      dt-bindings: arm: qcom: Document Kuno IDP board
      ARM: dts: qcom: Add initial device tree for Kuno SoC

 .../devicetree/bindings/arm/qcom-soc.yaml          |    4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      |  118 ++
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           |  110 ++
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |    1 +
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |   25 +
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              |  423 ++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   15 +
 drivers/clk/qcom/gcc-kuno.c                        | 1483 ++++++++++++++++++++
 drivers/interconnect/qcom/Kconfig                  |   13 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kuno.c                   |  988 +++++++++++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-kuno.c                |  801 +++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                     |   16 +
 drivers/soc/qcom/Kconfig                           |    1 -
 include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 ++
 include/dt-bindings/interconnect/qcom,kuno.h       |   89 ++
 26 files changed, 4270 insertions(+), 3 deletions(-)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260809-kuno-soc-support-1dab826de0bf

Best regards,
--  
Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>


