Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190D1D6AAF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=; b=oaIxSK87e47/z0TDitD70vzU8j
	04FpacHgNL33PRjtF5rdL6Ko/+2AqZrikd6uspFvWvORESs5Zyq5QPC8TYDj4vfKiuBahc3zQg+E6
	fnHotoHNiZNKVtqYIzhyJ5fzNGw8JHCPS1rj9IJ6NqhEble4byxDXOHrrKcY6WjBmqZPSfuC8FW06
	BeLfNgUGwYyi6LG8//89/Kdg0cu9Og2GRQRn2crcVp29tK8hnVmKCKyW800j7VW/9adeOrPcecp08
	MHPxpXYqWxD0DRDPQ9VpcVzNNbquMLoTH9zf+oZ9qRd3sZgUAAvR8K/E3USeajEgK94NcObbzCa1/
	0M2jTdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LMx-00000000Ysm-03JW;
	Thu, 02 Apr 2026 16:58:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LMu-00000000Ys7-0riy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:58:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4lhk2528171
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 16:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=; b=Bf26WH+/dBfUSx3V
	tP2v+J4ciOrokkWLfCXaLAhUJJLbLcXurHv0PNuPz4p3/qhtOi2ycFQCI4OIZPIn
	AmXTTvMY57lGOJr1x6jVC6sU19Dtp1+jV5HbGgtKthH6gECVzjwjqJM25/r9VP/P
	JEIYvnTvC4E6b+G36a2rzMChKKNo1Ugrgh5FF+sIw2D7eoUO0wunrsLoL9WGfPFW
	D4QiquEpKupq/dKcoh0Iva+/il+iRmFvvNlNjBkcMMwYKejhLtkiqXW8NvYv58Oc
	ZiYrp0fhJTwcFR1VCPb80v19P//GghsHJpK8+sS6qKzyr/k7EdJf9x0Hq/2nBmqv
	hs5Ywg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9txc8cqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 16:58:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7691378914so488786a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775149086; x=1775753886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=;
        b=CBBpe+aDNFfAMDhrCnKuWdlt7lrn+kUPIVXwj98UwOjrEyajcP/qdUPS6bM1msUgxF
         S7onUQJBjx9sF5qaWSsX54kzxK/oCTQNNxFm6y9IyV3LMK3pcO+AX5mngVuOCLAS4mlJ
         KPfu7rcKsGasM/iI1qbj0VfbA8d62kiVqPSaTG6N8QPW+ei6ojJQyutD49g0TOtAl6aB
         mGlLacKvElzaSkCuknzMTQjgz1G3A7dzWBi2IM8Ouz5iGSjVv/meuM1htHGgWtAhOpOE
         BdNgmNehFW2993GdM32zsROkG79diXjkFUFdCkF9r6B7MCsN6xnou4vVvYZas0E9QT1Z
         MMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149086; x=1775753886;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=;
        b=N5FpRaRJXdccZyKy+L/wQTpyw9xuu7end+F24hHD8mp7De8GYtmLFxOznq9QOrFmG7
         1qoBZoK1yrMp51ccwSGBzzuS4yklaOaEq30+KUUfQ8new2wP4gDZxlC0VdREm8kAkdVr
         xrlktVoya4G6EkFQrz+7xFCOalxILqCTCG+JQllMILwrkeeGOXG0zYCn4FzTvjX3LGKG
         YW9yiFpdB0xPCobldzRJF3jL9FqVhEKzZ963vyCVMUx9AWMsxr9g5l/cW2NxCOPZ71Vs
         omm6/zNcv3UIGdQykm0obKjG1YejovEzcbl90o72Rf0TtVe3kuAusV13jX2KgZKnyB6J
         gxUw==
X-Forwarded-Encrypted: i=1; AJvYcCUaHS12Mq8SGwXXQOTUa5VgBzrLRzbvPRA1kfzV4nCbkV3OMebNiWCxve+8SdPScrheb2qycr0YF96R4cfQzGGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnxOMwbp7JORYbohTiG0DEoSqjuxGYE7VhgVWDXDXARm0WIdT2
	EpQcUT9/RQxc+xhaty+CnQrR6qGP7e4LVuDrfmP8BZIYAr93iJaKe8gUAcLhY4bi9u+SvDYXrFr
	7xICYGpbeYjeW2s58ymGE48mMlibrvWOM2KfaD+o/tbvc36+4PvL/EfRg2nRoiRUozxh/hXi004
	8F/w==
X-Gm-Gg: ATEYQzy+nIIbMk3Ih6Qz0P6ogJkCh8vxcAmzwnXfrabvbpL/cwIsZkIvzQkxQ8obq+P
	afgxAwmUCo88LJi8Z4QB3B1WG1D0WvmeSOgrWxh9gaOtwryzYwaqyq5QREJPORfeqX1Q3gPpqjh
	eMv5zQejkACLUde0tsHvN9AIf9Qlwtm3E46lGI5ErN96i1eofzAnzYSGKTuMfi9wm/EW76EZEQS
	GCo1M56l29msUvf6hg2JAIHdz+fejlAvavn21bv7HzLVk0evZeWk2173AybZ6GtUr8FqDICoQVv
	tYvoyZ8N/pAHMPa/1QSCi/lwSFTnjvGURxPgKFCDAUHYoRnbhWs714zgDmT5sfkeeLUdA9qigZy
	tOGdKFxU0KgrCbiSQ2AI=
X-Received: by 2002:a05:6a20:7288:b0:39b:d5f1:4ff with SMTP id adf61e73a8af0-39ef73de98bmr9045354637.20.1775149086039;
        Thu, 02 Apr 2026 09:58:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:7288:b0:39b:d5f1:4ff with SMTP id adf61e73a8af0-39ef73de98bmr9045314637.20.1775149085388;
        Thu, 02 Apr 2026 09:58:05 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.79.18])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm3262932a12.31.2026.04.02.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:58:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20260331085252.1243108-1-hongxing.zhu@nxp.com>
References: <20260331085252.1243108-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v3] PCI: imx6: Don't remove MSI capability for
 i.MX7D/i.MX8M
Message-Id: <177514907977.11779.10857136002766145178.b4-ty@b4>
Date: Thu, 02 Apr 2026 22:27:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: YWX5T61Tu41CiXaVQaTSReXanN1MnezV
X-Proofpoint-ORIG-GUID: YWX5T61Tu41CiXaVQaTSReXanN1MnezV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE1MCBTYWx0ZWRfX73tUoSoEgV74
 MSHlUrYdF5QXOFol+V0Xto/+CPMj6W8N8exgApUNUyI+j+PsXx5adyIEOviHCsN2NZ9+HzUvb59
 8x6MRsuwoJiMItD8De61rLiuCPi8PxLR4ajDklwTTsL3qdQGuvJzkTQO1RWYDDBF5u45g+I796P
 Zy35cX+0z0HFdU2rxgyeQ4t7psbTcZXsmNRf3rWxaOohVrSxCD3mH/ifvh/LyJ0KQg144aj+PdJ
 qRF3MXpx6M+fSXJIIjFWkgOq3A45GjADXRc+58lIVL04+NxLzGJtmCuNM3gzfNxSTBipnaNfUZh
 an4JnWPImTNSS8tt3dX4C/t8j0tRMwyV8rU6HOKiOJiWSS+ui3Nk7i0TTLpOeT1DrgsW2ZLStBp
 R8g2VCEG8suCJ0BiDaOeLy4skYPVdWdDtAKXp7Fm5Oi2Np6cEYYK2waJTcSFl2QtyLpLpn3YNNI
 gqR4xfp1xhuwMZhTy9w==
X-Authority-Analysis: v=2.4 cv=HKXO14tv c=1 sm=1 tr=0 ts=69cea01e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=+KsUAYeLG1mN9JXONzlAbw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=kxgfuGgQFWlVBPJi97AA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095808_251032_2E5B3F09 
X-CRM114-Status: GOOD (  10.51  )
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


On Tue, 31 Mar 2026 16:52:52 +0800, Richard Zhu wrote:
> The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> capability register settings in the root complex. Removing the MSI
> capability breaks MSI functionality for these endpoints.
> 
> Add keep_rp_msi_en flag to indicate platforms (i.MX7D, i.MX8MM, i.MX8MQ)
> that should preserve the MSI capability during initialization.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Don't remove MSI capability for i.MX7D/i.MX8M
      commit: a9de12c04779729f6d404192a5320c2e4dac0968

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


