Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BAEC55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=; b=GmIFBo2Xs01+XVRaLBLEhuL/zd
	/aDQPiE40hZttSGYWfODzewqRqFtf1EX9r35L/9vO+WH3BK5BcVCNa0FQbSvZGFX6hoDW9W01TDZZ
	BBrTBmiYV/qeCqT72HFXgxiqQKfM5mjW6LciIqenc3CkBuUEinhGqU6Z2ZRzIbim9nZa/ISKlQ/iJ
	LPkVkoE2iL+t7EprDi4SNal4o2SEz1Oti4P//Apxmdw+E1M9OwoLrAvWXhaqDVmHwuQGdj8Y07vaz
	Iqt1ZdYzsCnj0nDT++3RaGV9xuH5gpDN9UPLqZmWxKyaETpWo0Rxgt3EovQQnm4kPnkL+LJPH9vmU
	T+foGHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAqu-0000000EkW4-3H8m;
	Sat, 01 Aug 2026 14:38:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqAqr-0000000EkVc-3iwd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 14:38:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CaYj52779747
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 14:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=; b=hK8LDr+SRkOhbSW7
	vSDoG7P9N2lD6sIrNQn9A9cEX/1dybe6Ci7eRTBQs6zveNYwMVGvMv/RHidjs65I
	8mWaUTN5zNj0aqYuTH6JXACN0VsW8AQLOrskp2HLXO/vSQD/BXfD6ShGKSyAVmwp
	2rDfpM2tAXKkVvsVxthmHAHcK7/w5FMeytaPgp5OSGuUzBdAELhXDd1xourWYyrQ
	N5nUmrQKl4gOOr6U2QrV1KnMHB6Vp2PDbt3AsUQSongAXYjP7Y1irE/OoIr5t/1p
	jb80V7LDgE1/c9maTTo11kBb3R/iSSm3NvSnb9EFxP7HiR9tVgDPvDj/YHr29RjD
	ckB6UQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs96691p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:38:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4615486a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785595091; x=1786199891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=N5tRIK24LE5F6qrefPOT9qRVVHgMXCvFD7qlW62f0IUPrmHtOLyM3etKtyoioBgQlk
         OpDTrSbCLsErAlZsgJBbkOUtizHsu2MYof29Utum+6MuUDx86Rxw1fUZtuRwgf73sKiH
         IN1Vxc5pAhvi0lZSD4pqrRrubFCxYa3T4dCFHCNYqnUWVU5QfDCsaA/ZvjWkT3QfIEZ2
         s+dak/hfrPqDWEl3XhBsoinDOkngSsOCz2LseH5IE0+InsOvj/zV9ts0xfc00zE7OsD1
         MHm8AAf/R915Blr62mlGAou3mdyMryZh8bC+QyY9342o/d8bAMytl/Yg1LM9h6+YCCG6
         BTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785595091; x=1786199891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/L4uhhrLRFVggnOJ2orfdgP8HbdbkXZiarCIpcSztA=;
        b=OtRq27Ir1qErETj51veiDyEXxU8hIsGMuweljmimjujMje+CRMj4X9rYmwEN7t8tHu
         RleHJU0/187zgChHDIcx4lITeCUgg6YBeoXIbcOF6+rVZk5YaogcTUHoCQzdfPxvVOMp
         R/Oup7FL138nOBrJ4zSOWMkykRHfoW6txBhR/pJZ45Jn61jyUgraztMlpzIhQOp8nnJ7
         tBxm2RaKomGvqUZxkCm3dh2OvhvRL63En5QZJL3B+3LZTnkhbl0VPLeNNq2nFUXFgANj
         cJY1GStsDRS6IBrBi028XT4fv24bYLooVD2I3cumJpZa4yGNzYwE9jxIIHc53dDtOddS
         ohtg==
X-Forwarded-Encrypted: i=1; AHgh+RreU8EDznKX/L3zcZ4j5AtrjWUbHR8Ow0cyCLWqIGTSsTdm3FvYImr8ibgHcVPfXi3i/k+VQqjVv8u7ate7giGl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3l3e/ThwQvsHmONMvzfyNAJPiVpg4C4+BuW9cEuCOAJS8om6E
	leKpwo2kyNNIUazGyzRq+Dt1aRZa9MHPV0tln9yCD/BKLxqkcKKrhHSgybowGtXX34qHu3IC4Fo
	HiNAiOMLqZfc0qxCQuv7cXmV/SC8eUhNPISYRI6Wtk9MWz/hLKxD8QL2GgX22cQUiE6OJGzmmOc
	HYPQ==
X-Gm-Gg: AR+sD10GQbowDluOLM1ntTZGHCwxvHFzh2Yih49w7lo3HvRMoPk0gDk3+PUv8N7fJwE
	Tkk65VgorTPfdrdOSxZ5dTIB6IWfwmCnUhGwdZpLMqj2EvWb06xRk6AEpd9yAZC1qHjkWOPZOJe
	BmCeI30hfoU0HwR2/ho2Mj8mpn5hy161+vNMzjTSRMYXlKYK2vIV4ei7lTxJYJIXc1zzd0v4uvY
	A4hrcGEKtwahWxVNEQUXpwBU7BEz3OrZFanNmpIqrvZYHD+lvXZl2xHYl/F9hryyIRv40/bfMUa
	OGDuBq4D2MAajHAb7Sz5L79Af8CdWQnrf6jkIOeymVutlE6vAh4iWe6wVHrWyJaHNjKOMec/tlm
	gX7qc3YwMnrLCpYdwYKqL/9Oy4asz
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201963a91.1.1785595091058;
        Sat, 01 Aug 2026 07:38:11 -0700 (PDT)
X-Received: by 2002:a17:90b:524b:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-38fbc3e7da9mr3201939a91.1.1785595090607;
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.28.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm18557144eec.6.2026.08.01.07.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 07:38:10 -0700 (PDT)
Message-ID: <3391eff7-9b68-445e-93df-b18906ac1619@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 20:08:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8kZb7fH2uG023Xz-24CPsmCyFIGspOFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfX/opVl+xhHabp
 e1jhKclDWYUp7Wat1N526t5ffkwZuldWmaOwryxQzZlOd7/jnWtbZB4WKRH/Ux4ADAcP9rMJbz7
 oAd1kA1uvjQXubonBYZaMDGXiewMuP4f2dZwclZVS3rtDQyLiKk3iXeYI5AHGRMZXsRbJPHfPdM
 q/xnTc9NV0U9Yhpwu0dLJZ8XcywaOcTImv7G8PyVuNfwEjjwlff3bmRnCZH8apYSg/LFrf1rzml
 5KsJyfzY67nVr9nzlvbgOnE7QZT81uaP04GT0fI6a4Zn4r2lyfs4ykDSRwgCkPiG/VZW6EeyRIS
 fmR4Alcw1PslATkXCwLAR6eWvyiENkFB/9z7TxitvCX5UQWroVG2uEJ/g9j755NMHBTKl4e5dZX
 kSa38lqx7QsaPtdfXPtdqSoA+9ejI/K40WL/8oaraLAqfigPSC+uQKhZce7uupOLsyRL+VVDKVt
 XJDFm44exF1Ml1zpJ9A==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6e04d3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=+2nu5FKjU1rLS1pfaWnYQA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ETOcCGdCUUXvB5ZO3A4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 8kZb7fH2uG023Xz-24CPsmCyFIGspOFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDExNyBTYWx0ZWRfX2+22XZs3PHfR
 /8uuBbD4x5CBQFWlpPjV/I9sEnOdhpIzTpDr5gjuLZuyNjX/AJK0QSHFAmXUTY3msfp/i9u9TGy
 NjPjOdS8YKVHCuegMf465Fsbpd7HX7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_073814_058752_943DA50C 
X-CRM114-Status: GOOD (  14.76  )
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



On 8/1/2026 1:15 AM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> Fixes: 97255eedd690 ("clk: qcom: camcc-glymur: Add camera clock controller driver")
> Fixes: f9580bafd39c ("clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC")
> Fixes: 92aae35f667c ("clk: qcom: camcc: Add support for camera clock controller for Kaanapali")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/cambistmclkcc-kaanapali.c | 7 +++++++
>  drivers/clk/qcom/cambistmclkcc-sm8750.c    | 7 +++++++
>  drivers/clk/qcom/camcc-glymur.c            | 7 +++++++
>  3 files changed, 21 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


