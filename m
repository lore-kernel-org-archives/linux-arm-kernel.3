Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D33C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=; b=nld37ml4N+dLCw4dzWsvQW/xtg
	d+MCRLPYxtDxCh/SDL7PkAS//Tn5Q/U0ONDp0XKz23b/45NFFbDLnH9Q0+6JCJxCYbvwT7sOnltQu
	ukiPHaAeL4a6ebSQUBLHNZLkFKRDM94W07D5wbyfKGZ45oxf1NhESin6d0B0AQWiXJlmU6Mm5zK46
	x1+hdFFTTBEz2rMg9MQG95sINjstEOonTLN4RJNVyE4bIxaQuZZ3pSRsV21/h+fYrZqizn3FUEEdK
	T4vSdbNJA+p20yNgOctahRlT6KVmTdOeLktBr9e9Crsmlm+JLYUCK9oVeMLHGzSzCbMX2+fL3NaaW
	14+VCq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogF2-0000000577N-2c5v;
	Tue, 28 Jul 2026 11:45:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogEi-0000000573M-1WuC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:44:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHVE42777614
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=; b=XoKn5Nq2UwFWmGvi
	1+fg/dE/t/nkXYXNR7Nc+yVnIKhyQmQ/NM6M7SNdltr7/bRVF2/2cMU9VgDPEQs/
	NZyiN8t64y2I4IHcQVTnB3v92LlByKkOYptyp84DZoCgKBkZO6DJIRm14O0dEFwG
	3CYow3eQyXguL2Ilvh0+xN1tHdKZmwF7iybuYcgKxsWsYWdIy5GoS2FODBGMcCOt
	A3u7ckTbz0OCrHEx1MP6ncn0951yJgH7ApIbpykXkKU4G1iU/z3p/8KqH7sLRwDb
	B3y7b2gmRvQByixGMZZXJ+jZ5tkEzF9tRdSZ+tYa6be8i+k/XTBXiunBQ5cLMKSn
	5L8CkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgc5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:44:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso16471291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239079; x=1785843879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=DIhAHKfubozGRfHGYVXfsaFhB4ZonZDZDLpAEsY2NMQ9lGinxnv6xEJIIRP9dD1T65
         AcPP7GGPLm6YEAQClQ06LS17tSsJgg002Hg8IgSuyruk5swswfgPRH8KktHjPG5Qj/iy
         xqrFtSCmv2BI+Wbb19XR20N6AWwUchiQpibj+c1Smr9bcbQCqumCa3EL/pNQJ4puZdYx
         6LUb1EDlUdaClCYLER8r0QGpubYSkC3ijKfN0uelxxINXv2xAALkf/iZK2BE/xZ/vEGY
         biK4g+HAKtzR3nzikRzAtqhiIDRb48OyWTyhCLfSN4Shf6SAm7CKr+2g1DlDj5btJ9QP
         YuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239079; x=1785843879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=UVEkxCU7Mtlx/xFbiS3592wvvlRYr8O83EV5XzC0Oye/POEAUh7UBZC7zmk8kN1u12
         6Fi3KCQwc6pkRh0z+BAPpS01gJoQdiYOWlQrzFcThaXsDZfyuVylXyUqRoTe69lgL+tE
         0fzl/LO7A52MJofcPF+2UVmCKftSVwTV+sn0f3ZDrsA4GlZj52zLVzWeNJ9TdKxw7PUy
         tT0vxKtPoNK96UtJkaFt0Tbau+cfN4jtcz8tvyD9Mk5t28bCKHU0B6GfHHwL3NVZiA0S
         djRATTpI1/o6o5VdplbJ5/azYZDuwc2SCb5Y9qMboZKKyPtAt0x0p7ttfRvJTHMLEVu/
         cSKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMzj9CoxcM4yly5ZnuHWcT8oPsVWn5mku3FgzucUgeknOqvjr0rSFFybsU7IpLHhWg7JtywDq6v695GjxocJk9@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXoC3WJcP7jgv2wSl9V1yvu41TpoO+O04OhGJ6OZTUDMBRDot
	WsOsDoYGrPveRPRRuj/uFV07tR0bR5YA3l0uSNZJHlIkw5bSAO4VWTdKwl4PU38FS60QRGoyj2f
	5NJD41VcEeHNivQc/k/N1fF1w+bv6Cdx6i8VGe235DB4QOb/ZDmmSeIq89UjboEkxdVlk1ofzSr
	KMUg==
X-Gm-Gg: AR+sD12p2nCu5DfGrDHXLveWngxAbG4Yjf8yY3Bixgc2dGPDBwdV5ELQ3bphHFPFm/8
	UO9vqFzijRKibz4lP//RHluOYwgymqJCHGqgKRQDZIT0AZWdMClssvJnB+Doyw296ez/ffogci5
	Xuk86AoF1vIi5nFrTzKGqmzL9/dicQ+xnfBgCZqeD7APwQMAlzo+3Co2sciA6dgPFzuFUmfhla3
	DrCeFkhpQAT8a9hdsO1GOeILfKfXfprxsAIJ3acSKaPltMaKFvB6LaweWEPggPGHbZ041hVas6j
	yK5qLsiY2qysCKjYdivpVxXyPBa9RQom1V829VN6MMrpIwo9kxqcK14S7WNENpfxdwESuEhhFZK
	AzkUfF+1iv5YKaVvqibpzeFZ4DdI=
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16401021cf.79.1785239078536;
        Tue, 28 Jul 2026 04:44:38 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16400061cf.79.1785239077097;
        Tue, 28 Jul 2026 04:44:37 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
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
Date: Tue, 28 Jul 2026 14:44:11 +0300
Message-ID: <178523892596.3206426.181670345541616200.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX/ObZ8brBpMKh
 xc4IMMnNIkUKtT8cg2GruQp28CjyqNA3DulYy6xKBbNRlWPmsf2LFZPLqkXd2E6putyZiGpcHZT
 dn1L1+4zJwvG5QDEJm5cACo8fzq9IQw=
X-Proofpoint-ORIG-GUID: Dkkj7_svA3ZSiVDGz8yRzJC6mRCa7HnF
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689627 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Dkkj7_svA3ZSiVDGz8yRzJC6mRCa7HnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX/F3OP3x3ttY2
 osANnHCOYvfQggNf5KbAP4Q4Xyhr7PgDqfEm74I8i+FxBPkl1QipoluKFwkN+6n4K0Xv9yD8+pv
 wH/YZOVnlVSe5FtAte4ctn6dWo0RSc8/5gXfkfE1fyKX9Ibl8tRpUc01Vi6ybHShrPlDCIDTeG+
 7WTfCvXDxHBPscgC6CGTJktQMd9PxoL6gyHqu5uh/nip0AZLyFJ1yoUYoGZrK1VET6G/dGR2+sL
 8CNlWLeDTTv2unbfQDtWEIzLeyrZRqylMHVb90FTdSGjY71Jy4ChHnmcc4Kf3wKM+4IXR1nszx1
 DD6cH6Kub0YGKK5KDVR3MxeKXfVvjcZxEbSOmPZgWCwecluQc9GeW0QtNhDJ5niyRsw2Zxir2VP
 BGdP309VTj7p+LcbPqns7TnK9kZt6Q3KD6tSrFkp9usrPqWKz6cvPqsQlwmpmoHyVgbEhDZAaB1
 0Mt7Lr+XXRJEtHoozDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_044440_407859_103A42D9 
X-CRM114-Status: GOOD (  14.21  )
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
      commit: 468238ced6c39dd4927392f16cedcde5f27cd0ef

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

