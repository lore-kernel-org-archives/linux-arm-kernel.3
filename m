Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2776CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=; b=gMP74ZwtTefdgZeLlE8niSGpAZ
	XIY0GeRdvfdAPmiuAazvPIEob0QVZyWrbOXiPWkLyX8gnnf8kHTDKpvNWgEWlH6Zh152PdMfXIz0Q
	0FqAwBc1hJEe5dqVYKxBA86GCRxlfZWIswTaFbsONuyLTcsAy6Arb3hZIQNmxvuYy9S2jzsNwIyED
	SipUxkAZfOCub77B5y1+UemxFyEF5Q2LxvuTk+hpA60YCgpIZ424HXuq7RFEDkxxYQzEz+1UzZQIk
	1qOfxyVRSf8b/jiTbaOfmd6Z5KImM3xDnVKJs+l/MoXzpwjF0fcpH5TcZRyuG5DRJLNgKL5bItcFm
	Jv+IHHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuxw-0000000HVUA-228L;
	Tue, 06 Oct 2026 02:31:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuxu-0000000HVTo-1LMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 02:31:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMiid2359536
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 02:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=; b=CVCAWw+AyTsKgWXq
	CVaauYtPO7l1TE6gSfRVI6dhxqbXQ2yF7IRc3+yGX1py/yiuIf4fONJF3Knv7BNO
	/Ty46zJ9qkMzHAK8lslBsU6m97P0H3+DAIBLB/JEQLRspKlBTM84NWVkmYx83e7s
	4A0nUcXcg0UyUKp+IWblxyo2H0Ur+hTHgzCFqIKlVR86DHWqTrSDHA0IYm+ALHCi
	xEirXP/xTFPiiE2FOLxbFPCsuBbM4KRPZTMMymD3Dk4TvlLeuCLVWLEto4jo7tno
	bocvAniXWRlnrvKu31plOWutVA257DoVsh0f95eDfsGHuVtmiYA6VK0i9fKnCQwq
	oOPx5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1ns7xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 02:31:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3282d5302ffso3157052eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791253896; x=1791858696; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=;
        b=EVMinmRAVvnIro6A6r9YdA/rWCca/C0mytXVTCVCzL2Z4vmxCgpOJX+W7bk1N5KF5X
         E6SR/tM3RCK/fIWq/XM3a+73tvx1SVQuy26A1MWOTCo00i+3+YW7mOKxV+nw19HTS37m
         0Q5vfblrt0Q/iT4DlqJb5bRkFGwgB4UOopfoDJ+QEdvwMKecS8grgY18nzseyXNIBL3V
         p3iaZ5OrXA08eJpAN3BN45lDMIav7gDZXkuOpb3wgWfqsDRfpts20ftJLcJj58a7DCw/
         37HXM3aPPbvbCq8uJQnKnoTcB5h/j0i5KaupPYdHelCW0jpDI0u6iQTBtGQbOHBiQyp9
         B1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253896; x=1791858696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fjs+GNqcv3sJDficPbMQez+LEUHLUpWw5RlxFrCKcqA=;
        b=sGxFiNVXF0rTlf4sNDoiYO9PZWNOJvu5HNCX/weFGM1gMM2BsYaskkH155kQAT1f1b
         GmTgxbVN4i67SkcMvhbNpefScPLN/4XvFUVJ/j79gL/pRPkSFpjGH76m38WI1XQFt4oU
         sGh2tlCOjheT9XVFC/MdHvA8XqPz6Euepi7Ofd7bP2J1J9Vfne6lc3JUOd6udCmBTHMj
         pviParODYj4a7mluYWIxBJQoh6EUhs+Mu6XmgbhbRUR1a74QyBcdgCPJMBAsiNYHmTYa
         R+sYjdVOlvm+MIkP0y5HEBrOJij10lD89Urn7SowoN4fODs+l5p2GJukltjnls3mw6xU
         kaXA==
X-Forwarded-Encrypted: i=1; AKwUvBx9B8VCqwGD2zmXCWpDH3eoDDHUnwSvcTlpCtQYlVoW1TDhAeOvJK8bSR0VIClEMyd3WrBJ8pps6NhaPRdz56oH@lists.infradead.org
X-Gm-Message-State: AFq9FYKPM7GlIdMKlSULsDdfE6+LLi6lT4V//27YtXTmb5wlwCx4Y2hJ
	dVJ2tglZKyr6pOSj/5F8OuCvv7i2fWjXtlgRFiOMM5YtMomkcBBigYXDgX8+0KDbOhAEIP6cIAE
	coNCPuef8OpMTmy3iPhnloONHefo15USQGC+ITF8PHSXyG79bnYxVw2y2XHoBW7Px+m7ZRaponu
	c3vItajIQMiw==
X-Gm-Gg: AYBFou143DzODDyTxZiDX1Qc921YMdhkBbshGUpDe9G/e7ofQ9EkEXlhk12vxZ9lEUs
	E1IOO2MW9gPC2Pnl1CmIILeAlqv7rd3ZjNnPZ2fMxZafloQGjAe8F3bDw9J72kdhrhtpvj7uRbu
	r67JyDUVY1+T2ViDaZ6mkuut1UsPcNHYwSDw0/ysGtdmtDnBJWoEwZScxuyN+IQKgim0Xz1Jcuo
	gCH2tLAsWIX+0qewfY9//oxgLsG0AKt9tZisO5K8wEh5FFMxNKelG+QlH5ygGax6H5gIQ1B24xu
	7wqPWnbCNQpllRPlBVA86oyVNxVJr03xk0BC1afHVpoMKNgIBM9Ow8xhpLPqbT1f9CLtCYMVcx0
	TwfCSfwLEco8nCfu8Psm6JTnhvZ9qAHXACTUfz86VtB9yoI0tHWmH8Ibryk78i8aNPfy22MlAhk
	l8QktbED2I/WivtZxlqAg=
X-Received: by 2002:a05:693c:4144:10b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-35145183c08mr1845856eec.12.1791253895727;
        Mon, 05 Oct 2026 19:31:35 -0700 (PDT)
X-Received: by 2002:a05:693c:4144:10b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-35145183c08mr1845830eec.12.1791253895124;
        Mon, 05 Oct 2026 19:31:35 -0700 (PDT)
Received: from [10.79.117.82] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146b16846sm5026968eec.28.2026.10.05.19.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:31:34 -0700 (PDT)
Message-ID: <1dc1d165-cfc9-43c1-9764-55005a6fd1de@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 08:01:29 +0530
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwOSBTYWx0ZWRfXwou1gF/q2KCY
 aDvrfjqYFFwmg65tEAO0DgfQJu2Z8Z+Fjdo8DwZBzArXZhelr3zH2UBhI1CBOUgxISJpDEqPtku
 FdPEi8F1Cq1KMNXqnJ9ZxUyq3PZNNf4=
X-Proofpoint-ORIG-GUID: 0w_I4XhpJw46R-oU1DEyMawtotylGQZf
X-Proofpoint-GUID: 0w_I4XhpJw46R-oU1DEyMawtotylGQZf
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac45d88 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gpu_kyyjuvhznk9Z_CEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwOSBTYWx0ZWRfXz82GRFcGmpGW
 M+wp6qJsW5tdMl9mQeVW4Fph8vKSToEZ04inToceuZbo9YnLcnq4HpAmo/AM1hTrxQxYXn6bQ+7
 IJfxhnkCWBJM8a/cIDZKg/pDvsQ3mJBbayaktmMrvZHDKnKLODghMn0SvJKz1xAy0Cdjib0uRLJ
 FT0HXU9doBB7myRMHGJj9M4ykDijYt3kkFmA7dMtXfASnX8p/apac+mdM3/7BPwmFWSkYEI5OSV
 1A/twW0j97MlPYFKaoACocj01Bn/UkSfKh5nh8n7HFpUsx1QHAVxz9Y5zSrEuPu3w4BlCBUwvFu
 QbBYQbNMOQyPuDd2HqEuQ9QkLC0gaeGwMo+dRjuTLOSJW+dqs/wjvyX7b3ZWuYzACoi6R3drSg0
 rryhFR/2Zc0YQTsUtvnlvxKhR/e9a1JXKFVnj+pz7tS/Bi4exmOL+hPmSeczTZI7pPnOSAHJeI+
 Ir+KKDhEw6p3soT5y7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_193138_376948_3E61ED5D 
X-CRM114-Status: GOOD (  34.92  )
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

Hope you are doing well.

Could you please take a look at the following patch?

[PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and 
size cells

https://lore.kernel.org/all/20260929-kuno-soc-support-v7-1-530f62dc4020@oss.qualcomm.com/

The DTS patch is ready to be picked up and applied. However, it depends 
on the DT-binding patch, which still requires review before the DTS 
change can be picked.

Your review of the DT-binding patch would be greatly appreciated to help 
move the series forward.

Best Wishes
Hardeep Sharma


