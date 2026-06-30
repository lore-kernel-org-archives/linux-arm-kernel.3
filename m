Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04763C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=; b=xRrpNroGnNCkd8h7mfRcfJiSjy
	u9Asy7ksriugvcfj1t5RIXrib30CRCnsewRIDN1QRHbwuONeL/tLhKVk0uDy9tmvSLr5DWpPswv34
	EIHRWaTw66j/zsH9uISgZTloPOI58f9wHcrfZBloCQuI+7cihApIll3mvKb2ycJkVIfCn7AYpGXJr
	Vk9xKNKPVqhCQUomgdfXXMYcf/8fMS2ghHOlCp3NV0LgvgT1pvO2x3MUT7RmYRjjKr7bR9iCWMF7Y
	otkYfhfJUhpUhKcS25EV00GeMP8t+Q1/ceFn8Tx5AeBd+bAWXa/PLMY4bxNX9gntrbkQeHpDQgaIR
	JNgguwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZIL-0000000HGTJ-3eS2;
	Tue, 30 Jun 2026 14:18:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZID-0000000HGS9-0k0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:18:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDHLZ2149104
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=; b=BmyoA9RvOmEyPSGz
	4DdeycYqRg5PCw4Sxn8ZYj5d67/KDrOpCaGBDY7TZ6s+x+WiyiRV5ePHES5IeqAK
	iL/+cW5LWLx0rzSbXefMMWSHzBSI5/IOPq53z8xX3tPJna3JcK6LjNBY7bg2y02W
	oFJA+JjUPagK07YIJMMFCeoStdq9cTIDDQttRK5oFLySxr10PgFXYz7FmSNRfDfv
	sdmrYhSaQ5SpRlduvX6+DHOce0hqZxJV/ZC/MM843ibdoKzmO+WJ29Bv1o93F4jP
	OBn6Hu+ZqZ/NcLUMXU4xtxQ0MuNoEEjTvB5d7Z3xxODCim5c4aiadSyvKaR7lQzu
	/yyDoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2w86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 14:18:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c011c7cb9so12800984eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829108; x=1783433908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=J+v5rW2W3EfT8T8O950zRjNZCrWc8ovUk7tk26w4NcQmHULbJ3mx9JvQKCr0t9qT1S
         2PfFI5j9LMO142T1R5FVOJzNe7L4xGmluRw5Manz0wLFPx4p0YDjAa5rI6iDsI1mnhw4
         S4dKylzD1UqV3GArLupzkLazPtIH/Xd4G72y416ZlL57sUsFQ+T1tv5pBmwWtuBeIIVM
         W0OxpcQwu2+iERcAsmiQtbN/6vYtn72PceCJ43ur1V4gF5AW5WWiXIYACGHXSJvtH9C5
         CfYudloNtJEaG9SACT9Hbz4nTKm8/As4AZTRpzNC2FUNtNxY2LYoKp6IDzU23+hta1z/
         sS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829108; x=1783433908;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=Sgai3nns3eY7U+PRB3V0DQtUB8WEygr8Hq+H/LkX+5s1S91p54RkQ5cJTk+0w7lZ9W
         CKXgRTN/cm6DrYI7QmOooycasXv63IyHNsYX6kCK7rmmOYtyKxrWbWVdoBT/1lEsfiiB
         pwJjIblXfEcYTfMD6CMFmk3TeoSgQjxhyspATrx/jscmvj+dqnqUmMHddCwbW61b3sz/
         OXFIxpA/m4MI1Ozi6FNj44z9igBuhvYa+kbkT3XEG1uPwtb3WgtrZ0gcV0QPXBtsxNC8
         /5ZrzRVyATS4mXLr0VIzZGR0b3UVPPyBwLPqXFykR4c7xpBraTd6FLWzVT29BoRGY+9g
         0b1w==
X-Forwarded-Encrypted: i=1; AHgh+RoAur8bcTVu/TMraagnV85H87NQqzfKtXWgyEUBzS/gvKdngJYKGhrRJO3WKZLay4uURYsFukLCX1ktr58XYCwh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk9B8eu6hsJuvA5bDUH6qMlz8yVyImlq/nf1yusxa/VRBV+2Xg
	LF/x4tRHYdQ5caFiN5Pdi00dSfz5jBfPM2wdK57/1EihqZxCAdoOIDEOV2tsKY0NTf09GiW/iBj
	CY3wuJh8qN0Rn7KmWuM8LkDoz/trLkZHn6NdtWjM87eWHqbZ8TL4L0kfQ6t/H9h9MT7RwfyUAsM
	DPnVGHYO9xww==
X-Gm-Gg: AfdE7ckHjHiPk+mmRrOyr9g8mp11TW6Sijofm0OFqbrG53El+LCSRy75v2kkDWCmYij
	5xr3JlikAoVafcVTNtiOuqn3xsEAuNHYBI85qL8OHt9a6dPfinZ2+cf7n4qpE8U7uFju7kCmpKf
	ZUXy4lSfAroqMx1uStBCnzz0fA79J9x4w61tyydnWtLYvTvJ5I+KDs1HOvaiQgH3yWncYCK3C2a
	1LMAK8yZNI8l8dQ85OyEvxXMETjFRBt5HWtKwDdEX5k96CHwgorAo3aBMbImlfLyfjPnmoevGRx
	3RwO2avzytycMPaLvV4MbPXt2L34fJV0IiMR0Xoref9N9OeMs6ZpCuSWt4Bp8B7RDPW4aQhHpgG
	dqdQiEe4QnGVj6Kbmra2ov6Yhz27Nmw==
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700861eec.34.1782829107801;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700817eec.34.1782829107056;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ef9sm13888083eec.16.2026.06.30.07.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:18:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
References: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
Subject: Re: (subset) [PATCH v7 0/3] Add root port reset to support link
 recovery
Message-Id: <178282909958.294720.13302580439189608628.b4-ty@b4>
Date: Tue, 30 Jun 2026 16:18:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Jc5MaWoW4Qu_aTll2emVQYDkLdFyR6Ge
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43d034 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=ccIQWBWPPgp-iIgOqYMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Jc5MaWoW4Qu_aTll2emVQYDkLdFyR6Ge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX4gG27ixKPBUe
 wTtIAVPkfnrXkbclYGiqvSO8z2aaEbI6O9i/5XgsgO5U36XtanmoQ9hzQvVXyqT7zPRiAD/VTlD
 /puiD4n1amg2rLLoze+Y8QERNzsWHPLxk2vYo2c2u9BQT6DG9tKbmywMJs8wnPTrzVUkZH8xc08
 175RDvQ0bb9rZloGn3llMgXL6F9oPmGCNb1g2Ugmxga7IEggm00pEEOdzqLBRvdIBa/Wcv/1mze
 3vzEtLpc9hTxwDe5Fq7dNSeAdXrrKh+hfx7XDLjOXIbY+4oHbrY67r5LMcU4jPnWTBO3x50QKIW
 bs5uha1q0pL6b7+fZqm6t4vXx4RMsRshlq5n7Yz4dCzTZWZpKcYl7B9As/vzmy6OdEJqmmj/Qer
 JCztGyE881OOJBxy/HIUdsBYV3Z1GbtZHzFXV4VVxmlJO9UfujSEdoBPgtaMime2/2nBG0tFXEE
 OzGvgOvVXeLD2LT+q6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX4Z63D0bIcLPr
 5c4rRNj6pDKifO3NDEjNSvUcCh2nMyx+GtOxGIkmvDmpAqPh2CpYk7damDK8XDPmKLpvF2+l0ou
 HEQMMxAmeA9crFcW9TC/+Zqd47X+Pyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_071829_220169_C55C9835 
X-CRM114-Status: GOOD (  12.22  )
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


On Thu, 18 Jun 2026 17:20:57 +0800, hongxing.zhu@oss.nxp.com wrote:
> Based on the following patch-set[1] issued by Mani.
> Add support for resetting the Root Port for i.MX PCIe to enable link recovery.
> 
> [1] [PATCH v8 0/5] PCI: Add support for resetting the Root Ports in a platform specific way
> 
> PCIe links can go down due to various unexpected circumstances. This patch series
> adds root port reset support for link recovery on i.MX PCIe controllers when the
> optional "intr" interrupt is present.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: imx6q-pcie: Add optional intr/aer/pme interrupts for i.MX95
      commit: 7186ac21201a9a408ae80fcbb9c985c959b3febc

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



