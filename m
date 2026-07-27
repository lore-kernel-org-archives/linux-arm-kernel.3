Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3199C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=; b=ajGdHvlTeIlgc4pLEmR0yPZoxj
	0xgWr+jzKNcK3kfwmtgU2txcarBMXalB8OtxWgZjDnl9j50qWn/S4NiAH/hzG7sGuJz8RTp9Xbevl
	iTKG6VgigTVZyvlOKD+1WFIm+DhP0F8ryHhjQi3QUDx1p79XwYQkxl14T+DWZHnrGgmxblHwASwkC
	jU/9l5FS2wPDOyLPtVZFZh23LfzUlg5D3tQXqKzmfsCRIbak8ZIarE8Z3twq4CJMDxBPHTGFRUlr0
	w6ifHoAbseFS/mf8AAT1LY/EQUJ2Pmkuidi2PQenn257322UW6Tcds51os9kn0bJyVoLcKiu6BP+b
	xFJvGksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI9H-00000002QAf-3x3a;
	Mon, 27 Jul 2026 10:01:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8x-00000002Q34-47MI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:01:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9bXdW2846503
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=; b=pR4g/VVDUj1stCtg
	quKe4ihAM1gvEsgmlEWtE+21OkUdNfPYciwb+yeHh03cLS28HXTex7gEzog62RaL
	N2d+cDiCvfrdjXDv8RwdHJAPqnMTlDlAy0hkXz0A4ojGe/T2xLeCu/2mk7GLi0ZW
	UrFvVAjMy3d4gC2jrb7+l3RyUUQ7OWlxF76JT8b86VGb1eTfc3nLfUX9X43DLp38
	G3s+8zd4R4gvaQq4q7cW5lhV98s5ca06f27h24pcadY3WichadQZPEJz/PexHuYd
	L93y8Az+sWt+fkf/DiFr9bTxglVYH/hyXM8gz+lEINLIgpczhK8smEgferrZ3EUK
	vAU/MQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v6836w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:01:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso245135485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 03:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146466; cv=none;
        d=google.com; s=arc-20260327;
        b=e/whZfaBFRssACN/e/5VwnwhB1w3obbreDo1eDZEoox/Bqjn/eI/XuGQM6DbpsSA8k
         klD7YfgxuR5wyyVlFnMLRIQoTKpCJ4G0hKVMS9QejYVuMcSetb+xlDHP4fSaor9zUeY6
         Fssg3xv9jMoqcj3xhkHrOLoR3i/Hl+6idwbwfxZEkh1ACcpOJygVLm0vZEc0Fy6J2yP8
         oG+cU3c2t2RNP3W3M3srY/Ll3VzjxOj5zMn2gicEqh3QvPyywkoWfPMZxBjPGz8cO8sc
         Snop7Fuiz1X5vpmCOBsP3fxKq8LD/u1EIVieQRuNGsOMe9vJ28gfOubkSJ/NpOMRqoxG
         hYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        fh=zGnvUOVxut5kXQYGNsExaVgU1E/zZS/Tru6Onw02NGM=;
        b=JGml9sDCanNiUzSsAc0NA1qrh39Og6jIzrLx5y0g0L0hD1v1aJahKPpW+ZanL/90wD
         VsrdiblfXV3g/kos+maNiXawIDfu/A0Y0oUAh4L6ggz9DgZyvKs40d36kROPeeRR3kIC
         hNHrcDx+zx0CKQAQnZFcjcT64I3j/7RFk9BE/97dsps9y1uYGG/m+Z9qCnDMr8VCJucL
         /ISiqTfp/ZNgPOKnIAVnWEcKv6DlL3hXeDPtixto6rMoEK9nwLTbbS96P9DaM9T2CgIq
         jzv6heeiQVymyO9CRq7nNi4US7Z2119LShzKprzaLS5LgYKdCpKLH/hlLbNhRB5Moafl
         GTfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146466; x=1785751266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=HYjsT4nmNDWckG1wRcc/r1HjHsi15+hTcF9p1ZeEJxQHePAT6ZVLpdD0G9LpB2VxHQ
         +KPbX7uEvOOEY5HyGyVWIz9I1/EnNb/bBUGaE+qRjip+9U/XWIYTCCau6t2B8XKUCTKw
         0E4Q/vPyT8fi+gH3jr6zAfQZofyBggrGw1wR++O1sTHxrQcQB50RqrymchHJ8L1Kjm3H
         ZvlJ0utF7rvxpuxO/TbNuPMh6SYnGatWOcTQMIWreuA/NP/063EoSUz6VFIub1d0I7YK
         nZl/pOYz6UGVlRpf2qrrwwjXLnAg06nWRPD9qaMjOZlPxOj6ZKdQtqXvSonbaIK4yE5f
         6Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146466; x=1785751266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpxga49hr34rpRcBFaAC1QHjhjtKMHjA32E0mhgUj/8=;
        b=d4gEhQxLUyYJ3JMJ9Zy6SjTE6GRMXQxkybtV4sui3AIf1q3caPitPAkb3PRvDGeI46
         U2eeNaAwqqwdHWSpCnO6tb0dF+Jd8j0mOCOo2Kb9H047NvBNXGRsxtu7svRH7jk7keQp
         kC6SIwfWIS2SiFJFQXHqepsehUUJIpLPfNKydnjyvB3LMPjoDBVc6rqCoVfMVnxfmjf7
         3raRdUmz8gKhRsmqUf+BnSXtzBiWqo+f6gSeeWZSanZ5bcLnh6JJw1f5CsJ2Njr4GX0Y
         gD/K5vIliGl7ZBJBIYLlpMRAGNnP/9Itu3uNAuK8db0f8r+1AF+GVbki8nO3EaLFI/ao
         iuBg==
X-Forwarded-Encrypted: i=1; AHgh+Ror5Uq+H37aVOyrE4mXRdCqm2PeAVsWNiUSv0H3Hrs1i9quMV1j2mId7pFUw/CSrGyUam5I+Ul1+ITPtoqc4Mw/@lists.infradead.org
X-Gm-Message-State: AOJu0YzF3121hSAQ6g0/1PXL4htcHpwo6AWAbPybTy9/enrPCFcDYmgX
	0w2K58hKJaWeydqMiCzG90UmYGbFLRBYhiIhAJ9Aq/Cbnji2YBfZl8tEcZrWkmkhW/ZDB0hvAql
	ni/A0qUUIm8Mq92SemcSfcGv56EQaORHZ9Un22C8nwE76vBqCA7dOip+GwCs96rEUGAnHx3uLMc
	PwWyT3JU//dJaOMP0wFQ7Jod+STAHgngXdtkQAh5tZaMfIp/zomlw4
X-Gm-Gg: AR+sD106VWnp0e/Tl8UMm3eKYyxC15gLtQ3alezLDoTu3K5CjAIEqVi24Czt5aW/w4m
	FkbHBp0tpdER/+LBnzt1GdzWl78yjWmZiQb+L2dCdXIbcVr/Q8d2w5QQbMgAb82TZ/z1ik5YgrX
	Q24h4JFTuAeNCN+lavzdX8qsXGdrKHdTuKHRdP3wxAkb2PvcOAJTsfsZP6Pg==
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id af79cd13be357-932f948144amr15115885a.14.1785146466287;
        Mon, 27 Jul 2026 03:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:92e:745c:6c5a with SMTP id
 af79cd13be357-932f948144amr15109385a.14.1785146465706; Mon, 27 Jul 2026
 03:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
In-Reply-To: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:55 +0200
X-Gm-Features: AUfX_myrKTD-P-po5naXNkkd8gbbZmT-1aLEtXL0NN10jCpUSfBDEv1NDisfyg0
Message-ID: <CAPx+jO956WAqXt-zbEyzU5btS7KsXn4fBemaj4r3qQNANNJCKA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pmdomain: imx: build the SCU power domain driver
 as a module
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        peng.fan@nxp.com, aisheng.dong@nxp.com, jindong.yue@nxp.com,
        xuegang.liu@nxp.com, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX2zfDEFZYlNEf
 X2KoHIL/FmPrSqfpHALpccRbSL8BpOCQbrRU50ys9JkPit7h+tEz83zdfHMwKS/99II9/S0PTGL
 QanPjKh3ByEfR8Xvw8howZhsISV0HWs=
X-Proofpoint-GUID: 0WYVmMNTkaaZquZgnP87Dj9Oun_7Xx2d
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a672c63 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=73SNKA1z6Gcgn0qlyfgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 0WYVmMNTkaaZquZgnP87Dj9Oun_7Xx2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX/UNPEpPbjMv0
 J0ppKRwPt1ZWL1i4qOhVtNsk7HA4MkpSDdQYRyts4b0I3RCcJyEGi0GDcxEHwoxLNvqAncFPjfA
 9cZ64Tj1PZP3M7LSaNhHIwZrY5s5v2142iyPgf7ybfq/ngEbJJLcc2u70jFNw+rue/7pw4Pr1DD
 /mGelO/TUtaiK3MGiTWe841mKJMvB5KCtec5GCPo9HpzJD9ryEuMpAcQvyqjDVN1wb26xQi9ahf
 TieiyQxeP3DiCvZg5NYDuOBQXk2ANmzvfa+8nSBFnW0geOsVXfJMYPTlP1x5ToS3LHb+1ny+E1L
 V46qOHP/Qf3YJFcDFMLAAeTDATkUaLjjAVGt98hCtgvtzmmJVgXm4jjj84pRvpkInxoohUq//XF
 Le5T4AW6TR7oDZqoE6XnWOtBCYn56AG/BaFZEdPPab+GrOOajVVqtSSWFcbsM5P2hE2cNwWzuhr
 2dcRzpdnaq3bZmVuhqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_030108_042861_BD5F3FF2 
X-CRM114-Status: GOOD (  26.49  )
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

On Thu, Jul 23, 2026 at 4:05=E2=80=AFAM <Zhipeng.wang_1@oss.nxp.com> wrote:
>
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> This series makes the i.MX SCU power domain driver buildable as a
> loadable module, which is required for Android devices using the
> Generic Kernel Image (GKI) where SoC-specific drivers must be modules.
>
> Patch 1 exports of_stdout (which the driver references to find the
> console's power domain) from the OF core with EXPORT_SYMBOL_GPL().
>
> Patch 2 converts CONFIG_IMX_SCU_PD from bool to tristate and adds
> MODULE_DEVICE_TABLE() for autoloading. subsys_initcall() is used so
> that when built-in the provider probes before its consumers (e.g. the
> SCU clock driver at device_initcall level). No module_exit() is
> provided since the provider cannot be safely removed at runtime.
>
> Patch 3 adds MODULE_SOFTDEP("pre: scu_pd") to the i.MX8QXP clock
> driver so that modprobe loads the power domain module first when both
> are built as modules.
>
> Because of the cross-subsystem dependency (patches touch drivers/of,
> drivers/pmdomain, and drivers/clk), I would suggest taking the whole
> series through one tree.
>
> Changes in v5:
> - Fix MODULE_SOFTDEP module name from imx_scu_pd to scu_pd. (Sashiko
>   bot)
> - Add Acked-by from Rob Herring for patch 1.
>
> Changes in v4:
> - Add patch 3: MODULE_SOFTDEP in clk-imx8qxp to guarantee module load
>   order when both drivers are modules. (Sashiko bot)
>
> Changes in v3:
> - Use subsys_initcall() instead of module_init() to fix probe ordering
>   between the power domain provider and the SCU clock consumer when
>   both are built-in. (Sashiko bot)
>
> Changes in v2:
> - Drop module_platform_driver() which provides module_exit() and could
>   lead to use-after-free on module unload. Use module_init() only, so
>   the module cannot be unloaded. (Sashiko bot)
>
> Zhipeng Wang (3):
>   of: export of_stdout symbol
>   pmdomain: imx: scu-pd: allow building as a module
>   clk: imx: imx8qxp: add soft dependency on SCU power domain driver
>
>  drivers/clk/imx/clk-imx8qxp.c | 1 +
>  drivers/of/base.c             | 1 +
>  drivers/pmdomain/imx/Kconfig  | 2 +-
>  drivers/pmdomain/imx/scu-pd.c | 8 +++++++-
>  4 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.34.1

The v5 series applied for next, thanks!

Kind regards
Uffe

