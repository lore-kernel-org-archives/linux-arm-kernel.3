Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02063CD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=; b=uFE5Rx37wNP4IUBsTU9W2Q/WEd
	asPT9D1GJRKzlCP0agy7mezDgg4VdxXmIbY0mIHo9W1XHnPTnFT7l8Wt0sdwoOh1/hQ4kugOdSotA
	OPgOHiVgO67elDWxvgw+FHqHE9YvR6dXnkUCcC9lihUbSB3bK0+CAGaKwjn0SYhGNlf8ejpOTvwQm
	sPhNsqLjzk2OdZYkxLoCROXPk8mI8J6gguZUz0gfYVcC9d6O+myzxLI88/vVdUGauxxfVwUueEqZF
	ITJ7AvKGFsre2lXh8U2znMemBedNVH4jzyJX5nQELhGmMEP4vWdzIeEekiRpAB0iEwvacAPGTLSW4
	pUuu/mGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq1I-00000004scf-1fd7;
	Tue, 09 Jun 2026 06:33:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq1F-00000004sbq-1WlL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:33:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wjGZ1515308
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 06:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+jE/Whj3i3oRJqpHpCb6TGC
	x3wC4S9R9qh5+UO2Lzo=; b=BExGUfqiz9OhmgpdNx42og25ntWqoKIRs8q5qc7G
	O94UCRivT/rkqKSrw6Ai25Po2dLAhEwORSwO+zmtJcypFwJdt7hniCavd/4NVU7u
	6lALESpaQ9hq2M/cDW6/KyjcDsagJRzf8guD1DiEwG1YlT7yB/VNmMX1IpSHvnu6
	GUZq2n0dCDrOEx0jJU5MnrRfjTt4Jw2uebG9F41tB++mI201eRHLo9VqIUApHTSc
	Uqifw8+t3bwM8XfAUzKbkSE3oQUSFVoOuTvP3tcPVfaM7knSYi7vVDHDWzOO1Ioh
	EGCqRT7TIkmO/yjdqcNHmmXhDXUfBVsnzO8BrvgZ0sVLmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enwsvcaj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:33:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51775f7b2afso114409751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986780; x=1781591580; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=NJSvcgXrt2GewvvSfO117VXGW9i2EnfGsSW320EIhbWIU0HQhZLSTq0TBbE8SWLo4o
         Fe23pOgmR+YQIgdK25c+uKc3cqh5pJtSt0TBdF98lNdl9NU0tIw5RTKH9c4Kw1bAfcuB
         kNlDebmdAZLFwtu2kYfm4c1tERaS0vKdEvTnGmVAe3RR85JrrSxfRGZ617HaUGJgpYtQ
         H0ESgdvtm16nu8OJ3V6eRfZq3BrAUgGmnIl6IWu8lS4yCBSXuC8YQJTd0MraGVIcFa5j
         WLnjwlsLR1nXOmSa55dxfEt/K7PGuEsmoCAvkaZtk8QhzaQr4F3dxUx+/tD7eBZ0WOPq
         gopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986780; x=1781591580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=jCYQ4pAh/zVYZjCYfr7rzU3J8ZWZGZYNF74bqd/glBjMnEIULYxw4PsodwLvulcHSH
         LAHEsryyClFPoF1SRn93qljZUYHFTac39jbaLlrvqlFc2WbuxZTdmnGF+ATENCG2NOxX
         WrJ16qoXCfmZBhO5pjUd3DQjdn02GOP59nt6ZCckcv6MbDmnmZoW3mZpNKiUGRTrQN1b
         MsREOmEF3TNqNaJFdWQjSVszOeIASnGSOnIwv4zs+S8lTF4JMKKHzp38Sl65Z2SEzmEW
         smESfv3asR7xq4dOcrWWM73436y5B7Tj3eOP7x027XH8B9GMOMdzFJZDPzc2UUyUjdhG
         UIDA==
X-Forwarded-Encrypted: i=1; AFNElJ+1eyPkgB4Cu/AsgkjDYG+MpCb3BtrNO584JgJSmosAbOhoYxIkufRuhLa9DZmXbZIJ2a45M0V7Zcbj+RelVUvz@lists.infradead.org
X-Gm-Message-State: AOJu0YxaglXVXYb7VDtMMrz2alZ/8ji0jNbZarn5FOMDGTLQLEz8U9HA
	k+BjVBniyvtyAp89EfG/t3nZ7sxqIBeR2lFmFVjCt/s1ADsOagmrohe17vd53GXbeVwZbso5BT5
	+4ehccqA6eXbThhF1k8akCCd/9lYJ4RBNXjaXQFuD025wqMFpFtRZQAwpCyCVadateTN94u7frb
	0Q4Q==
X-Gm-Gg: Acq92OGBr5DGKkgFm2z5Lxl658EDx/EIHXbbjb7etzEFhA9igHdfrQQqZnsYVRJAM+u
	j5D9mw0QlUsAJy/bpVc+FLOF/N43NNznaHAR3pgfkhsWe/vfydAMoP16FbtwiS8V7xelyVSA9Jl
	aYWLLfNZowfu2d6cD8lzFQrdkcK5sym+N9SbhTmE3cNRhDiwwPfHYaI4MsUduteP8h6D4GZfL5u
	E8FfhIRdNq3aZxA4dPSWgOGB71VmXLYPgEaWJlWRoCjsDLvECQIzGtsJCN1xovG7i+9D016uTxm
	/Uy8nLk1IwG/K3Dx+MX1LJiW7AKBT2u7yBzUo7jOZHzrOBE5Fz+SPR4hxW+vNuDke9XF/LHZnEw
	LPQ/RVTF8faVvM2CLLoy6VWZW/k4pbj3A27IzKv0lLls=
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930361cf.12.1780986779567;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930171cf.12.1780986779034;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm58306473f8f.21.2026.06.08.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:58 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <5keeetqnhquzvwtpll6gb2sikg6ic2qziuxkpgqg6qzi6q525x@u2taew4tbtbp>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
X-Proofpoint-GUID: 7nRfQAVOUxJ3v_fbC5IkxglSAUitosDv
X-Proofpoint-ORIG-GUID: 7nRfQAVOUxJ3v_fbC5IkxglSAUitosDv
X-Authority-Analysis: v=2.4 cv=dIaWXuZb c=1 sm=1 tr=0 ts=6a27b39c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=zgkfINwa37qCbUsG4WUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX4bGQDIfxfN2t
 8sNWb+AHNrRG42Qg1JEw59s4P19TWezG0l3gR5g+tpgnKj0n3v5F4iSrT8ws6+WMXG/554b7C9T
 riwiXmR52qlaHP8bNxsjbZPtJCv5CfkkDZhG3Bb1EZUN1WDrLed4CqMIiPpW50DVOqd02DoMmLv
 apZ1ilHBx0i5aze4EQGU69XBVEeVCc+vEI5+mNmpTMyTcp9aK+WZ2/AGymOsNbm3r9IXipTly0W
 F75J+6IJiYWEfeRg1Eq7e9ZpRYbRdQOv9SIswW5uK3IdThak6XUKg8TJPG4QIB/nbiQjtJWo9bn
 i9RLP3ev4HPtwKz9KAkYAZUMuNG3TuoRZ1QnKHQ4reg7ny6l456USoxjQ87VRZ56PkuE0LtXp8b
 47XJs3SMsZJ007Wt5kjXw+AANIDvrHfVFiU+G7n2Vmg+Z9wdc88DikD0dQ+3Qfu0q3qX6m2BJCM
 JvcezAN70i+I4TUGOqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_233301_572477_DD7CF8A8 
X-CRM114-Status: GOOD (  13.86  )
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

On 26-06-04 21:48:01, Jacky Bai wrote:
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
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

