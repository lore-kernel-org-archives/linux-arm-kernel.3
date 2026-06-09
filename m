Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C231CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=; b=cRGlxP1RlGjXEBH1w34eXNvgjk
	JTqJlwQq0p/OL6+VGephZs9oPPPTO9+kFKA4+ipv7+Up7/5IzzrMlBJUId0Ot/q17iipZDQV2wUlG
	La3Zrdj9A/a3kY6WbokBkSJqGh2QH9QyFcViEmIYoobfksQhri6uXQO9/sR9pCoCuFSU0G6TSZWyl
	WC1DW2KXO3GIhH9rVib0tHiDL8C7cEtmAYXFnFTemt6cRGSnJAuqomhCDnxRywO6aLwoHJydWmmfi
	fDP/r5tDp5aGV98M9chKp+HLFGuMwvLWvozE3kDBpdYKQItg0Vmqz2btHFG+S/Bxn1HJX/L4GSMhK
	z1+X5HlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsZc-00000005BJi-07j6;
	Tue, 09 Jun 2026 09:16:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsZZ-00000005BJE-17om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:16:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqXN2001533
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 09:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=; b=gsycXEnY+gGlSHSG
	44GbfRCLFUTs8Ocv60TdGtX3LrCLh+W/978alP4D99a6prBr3mL6rPPyg2Bw6i9i
	z+vvAMkG14gJngkEHj4fo3Yn8868hIZz+FNeRic4WI2Wz3oLDOjcSdhx+sbjfyMs
	nq6MdWrZbolfNuJQHUyyLG5BmHYcB301th6HVeBwUCgxxhBcmoHfBnbcgJE8lqD9
	+xg306g+ZLnRqcKsQHTyZIXyZ7Ji1c16RncXanlCBO3M3KmGcGHBPEranIZQd+3I
	PELwtSoV0mfaL6x08GWhmNMvjtj2Tqx90T2/sz5jLC1B2/xraNOT3GdstAD253LU
	sBYh3A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rhx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:16:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51787404d3eso94786741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996595; x=1781601395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=BbM0iUsVTrvGkWMz8NYap3yfCBSHACzWRIk1H61SQwUHLGhhB+8PqqlknSbiYl8L8Q
         J9L2qcZDr607/GrxTnJEAfZ8Av4F2y5dYxCqvmHiHPF0XLaJAYvmjumAYkrhSN0Cw07G
         R9ZZDKAQb1gg4bafgD4IYaKQnG3Q3HqW1HZqMQub03DNkq8RWxW5lnI8/IudVVI+pLYe
         PzEKo0+/WQD75H6DfCK4qdqn8oeYDl/v7f4uwrPc3OVnu4GzU7TRrIcmqKonF8+LwiPQ
         aj0UN0LMd/V7KKOjVI12ucZyKqQeafrRmr8tOMyy/ymnXN8OlcZL9aKGpHZ/CT7hpLFD
         VB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996595; x=1781601395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OWNRlfBgWHU0YDJT3pveKgimyyr6c63+7FmfgNT8RX4=;
        b=NpDpMvA+JeEaAbxygpnEZ/ROPMgVIvcjTJkZMKEHrlTNSQPc7R7vxzCjwVE8iGB+DI
         uIugf2Y7lu/zmXQ3825wPuGHTBfRR+5HNEf1oqMIPAipkaiFFt2ImJKwHMNOHLIOQgbF
         2KpcXNufpwl9fpLuMlXeFdNAaxPFkz1XWyR6R1zF0w+MuthlFgOF0QkY6w9wZngXcy6w
         c6nqDLFteWCIodFPOjR/B7iTzYQrrJWJZA3EUM4rqWuNxH4inQYLoJlPjIUunkY4IJTa
         hhVlbrJVJLy8dZALWdYiTN9JB7t1vwOkSwng9pm0i62TVYep0SoJZM617rQxoD9DZ5W7
         p2rw==
X-Forwarded-Encrypted: i=1; AFNElJ8uwyQ7bNQnTAXLbmV/dAgFXwQA4ECjFIJTU06W5zce00MsoQuM/pOd/Tu3jriFToZkWnvrZtaEFto0BU3/6OH0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx87G+pF77/chnYetysdJKgltbp6VQTpd2lVZoDrD1UwNYWZt1k
	tpZ2mtSmPyOMcF2cduMJAPEk6alybDCjay5tzBHkcufx4WMpqOyxkmlhUlKA3robiwU7B9JyFN9
	8Q2+LAq/jc6+64Tp/VQfayjoEfpy2u0nACYFCr/1R83Ut+qPHvjeArJBdzAfAp1a5rWzVVa2Oyi
	8HKg==
X-Gm-Gg: Acq92OF4HOZot2qFxmsmMfthIWmZA92MKQzREY5uCXMgSeXBCcOrnllullP4Xf1SRnZ
	IsjXtczv4tKB87LlRj1KQqEqfaoe+DCZkowax+6gsJlZ/8TKuXwq8hLlKbW2/o9eAoUPCPNF5H9
	OQU+ZergYnnbkwrhdqtp3+fMvt39amjfqEfhoP/RcUEHRih08qxPoQ2vOSw0ysKXF4Rkl1noMHC
	EYRMkI2+tV1w+ji3Kk2V/SmeS7tNCbu9+soKSV9+HUuJi5wjhv9FzelRMlOK1h20jvUhzalwola
	UPRiZsmd6RFCh5J0vwb5bwo4KRyNfL6DamND9KksIPl9sRELTyyPDi2ThEhVeCZqxpomAfizglY
	eDl/UVsx8Fv7AJpLySPnmYwo7hL/UAvLM/7GVuaMkcs4PRO2XLGpxsLk=
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272600231cf.33.1780996595050;
        Tue, 09 Jun 2026 02:16:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr272599901cf.33.1780996594578;
        Tue, 09 Jun 2026 02:16:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm60912430f8f.9.2026.06.09.02.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:16:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Date: Tue,  9 Jun 2026 12:16:18 +0300
Message-ID: <178099655221.2098924.12939836605538533758.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: G-7ZgA5haImYVVRoM0Aw4nW9GfY7zzBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX97c8xyJ1/ReJ
 z1jYDF6YcE9Qkl11BQzCQqSl404EzIZdeAV7IUTgAaw4e15PLrAIfknnWB6V885EKpM9VZ/iHUz
 JHjjz8Emn9QiI2N/LAYdACkCzdxJa30umMExghSwNPSEO/KjF4mQS5D+JbmoCwmnR/2Tg2eZVhU
 KaAAWMyJr2adLiJSuluZ+zKI91ZErvMsVl4cm6+hjtV4uOECYMDU0ARVnaO8OJlBKVN30S4ghvV
 qBIqbPFa66ZdX6qtJO6iyOL+oNLmIDr9Oo8vB3MEHRUygWdAoIiuZqUQRoU/Q8pU+F0Gey9HBO5
 ojWEBwoikgnIdo+eHgrhYmLmkGLllPevES5NLuvMj3uLjzUJa2KO22GRl9NPslPlKD9pnmdhQxk
 YSZekGMvK2lLL2uUzgUL8fiD88hrp5xioB586SBuRcdJxQEsvpAG+YHnaz7PISehombelxBgVfF
 xVs76aGAVJXR6cu83zQ==
X-Proofpoint-GUID: G-7ZgA5haImYVVRoM0Aw4nW9GfY7zzBa
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27d9f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_021637_427103_42B1FFEE 
X-CRM114-Status: GOOD (  14.06  )
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


On Thu, 04 Jun 2026 21:48:01 +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add audio PLL debugfs for K-divider control
      commit: b3dcc8c608fbb6352bd94932ba935f2078c9090d

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

