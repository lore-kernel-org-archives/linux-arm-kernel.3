Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A338E106F2FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=GsWyupcFowCGMjLcJpJGE0gZwB
	xfKSonoZNIiEIOcWfoXF2JUi3dMqeAbPZrl8FZ5jDNx67cUyKkJcGwrQFZAdWQ5+l++sQ5+/j7Y/u
	XdSpojWFQC/bjSmA1IhjGFoZ7poG5CIKZC0Rf/eMGIWZRofc+AhNQHa10hyPYsum2Xd9AG6mXEvAT
	YJV0tbUQhbbHjjhzTXQhb07zjGAmqAESSeSDRBneFC6p36lySHYCtnixcv0LU14t8vrjsSyDQq0Z7
	vihCW+sMoO9nO5DIA0B5NPIuLlBKrl1QO/dPmYNOsi4My4fPweBybGLjGYIj/aKrmVsDjjWUwcy0j
	Kdm4+WZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gHA-000000052tZ-3URC;
	Thu, 26 Mar 2026 08:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH9-000000052sg-3wrs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=BjjfIADmPJcoZO5zk+/nXgu9gI
	pK9uU79wYXSCZCIMbWPO+gyLIQ1rfm5zNIbi/MwmuQtBZrY9aTeCYQlzZal/pf5PTpAJ8NcOIk322
	X9c7++1UwfqZ/IVVMWrRwlk485Ob+QsWFmAHhU+A7YUcqd+2pqdbwnlXQ/e/ameTARGGZcH/rAME7
	bM47e4OiLrOclBazRI+sWsWUkGzRIj4Y1yY5MGs9+gsDT73p0VRQQi7F6tRCLW4mN1ty4acr1H4UQ
	UTMcTKXw5Rxb88Ij84RDkQ0xqtr+Jps0l1run5cIeEHrFuAdGZGTfnY7zHEelwTCKF724oGAhjpNv
	R1u4h7Nw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gH6-00000007lwz-1lUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:41:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6P1dX051998
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=; b=kwqFVl0va4Ro4+rt
	fFgR1pQCzXvp8Mms5DBXi0Ow2aYvPUaXH6hlIhO16WnSpOV8MwbNlmWjKWe9TKJE
	J5coywcqs7VMaFOehqKnkiVjfyGA84VV0WzF2crMLMozmnJHtB31gFvTLueSbfT2
	oJz/npWpybSJK7bmwLETA+J1htz3aqgcjl5OnJrb18YiV84BH13+p0O7sLaLxWWp
	qjvKUy1ZBqwJmFSvaZsWvbGKJlGUI/ksvGuSF852jMxu8vFHlEnGMIjHl/YKvGZ1
	YDL7/rX9w/6AkkPIYPuiFYRcd6YJpfYxMRNWh6hNffJVdy8pY1E6zmtANkTByNj1
	7zCBdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t1ygv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:41:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso9726851cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774514464; x=1775119264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=esFW+z7sDsnt2/deeBnQpFnxlrsAEtHdGxkrVkRznLIFo85Um9rRPWThdkg3mzSl3C
         uRTlmquJ+H6fddRgVVInC6PZeXvQGu3nuG4fUVNDWpN7Qx27LMa6pWkRSLJtUo7/wcw7
         3EgFA2u95Nrg8fIV1ZhRoUDvv5Q3TM+snBL0XZ3HjTxmtoLzZZ5eOTyxRcnsz8AxBCMd
         nmxandvjzSugIrPmBPaxDRX/CNoWcZatqWefzYQ0zoUiWW3izX0wc8eOCvlAbkFwwx/B
         Kmw6AhnKM/mji42jK1T2brq9Tb3BkIZvEv8wx14MpvGRIw0MjVwNnNCMGjNdWNSHca8u
         i4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514464; x=1775119264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UahLMjjXP4HmY+1teJYFwYlE8SFM1tviQgqBvsmUzcw=;
        b=JW+MOOs+u9EFDQHAuOU6x69KPXt0YrzpS1D1HncBcQDS+TlRE9tIprEwHkXcU1w5j/
         UfOKGgJpFTYgYUwkLYI58ThChtKepXGKWGQ6ObRVdkT+PFt6vzSvJZkuJB5uTzLlv+C/
         A9QqFB6TGHN2oP+KNnwgY/I0UzBCbZy/TY8NwTfv+ptYWRXF6jLiy9tbBj0nMjfDkPZZ
         x9rIqWBl1d03KBJqSFoVbv/Whrp2JuGQJmCSzNx68+2FI4ktIlitStBR1g0qCx+IJzQs
         5vadw03s+oj9Smr3sFJbmr1hX48wexDxE1Vl5BV8LM3lT6nX8GCG5L7IK8/tZzFFGBOB
         FVfA==
X-Forwarded-Encrypted: i=1; AJvYcCUjudfnoVZjWBY8nNcMuPXRU9n7zYSAcJY5kdhwrsIBlr7UyjSAmPZL3tHiwITokjComCDrbN/eQ0YBBg+XXVtH@lists.infradead.org
X-Gm-Message-State: AOJu0Yze76fIApZLUf7r7S+sCP5RAQDBLPErp6Qi6fiS1j7C8dqRebR0
	0p2kwu1bckxxHE3SZOhxILbrVreTYF1WGp55XAz3SVQDvOPdWeDS7d8oTd/5QZULSfXz7C/tUwq
	b08nvyhgfOxRNJW/CjVbxTZCgx9ToHmeAkDIT01Jn2JcFY7i+daXufc7lRo7pUO/dM2cXC52S9G
	UbWQ==
X-Gm-Gg: ATEYQzyzVBJo512lT85DWJ74QoiMZ1IXUrDvWc1bwApHvtSlNluQ0FWppwjRr9V3pNF
	1p62N9hE/9ZEZXEyIaNsiBWzDIzk5yGTayVDWke4hdIm976iHEvsEgy3I8E1rRyu0zKvkvnhZel
	1cXNp2c5+NoOuCjCpfGDpdJ/U3ULGT3l+9W96BNVBFjZOZ1Q77as7cR/SwSXBL1DX3g10uPU1Aa
	x+gg/xKt0URGQ5sOciNn/17CMDy51R/QDgE6LFLe5j8x8zkIsZjKbVqzuh1vyEBY+YG5EfuPWJU
	Dj/o/zNWW0vQWbfcxlk/PXvd+I9XYqtJUbUQ4W912KoLXGXapPl4A8eSo6qPGQEsbsqji9a+SLH
	dt02Qfxp+ku3Ro21bC0ksl+NOPvVXs1Ns57Bq+9epzfmcq3zZk10=
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222421cf.36.1774514463748;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
X-Received: by 2002:ac8:7e92:0:b0:50b:44cc:2a95 with SMTP id d75a77b69052e-50b80e36ab3mr91222121cf.36.1774514463190;
        Thu, 26 Mar 2026 01:41:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:92a5:ac13:cd81:9625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm16608955e9.4.2026.03.26.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:41:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Thu, 26 Mar 2026 09:41:00 +0100
Message-ID: <177451445822.5060.11939390617609457696.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325100144.1696731-1-arnd@kernel.org>
References: <20260325100144.1696731-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4f120 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=faeRYzTSnDSNNYB9Nk0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: l6s-4D8UM5GRUMMOeiQdtcsrBacplExC
X-Proofpoint-ORIG-GUID: l6s-4D8UM5GRUMMOeiQdtcsrBacplExC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2MiBTYWx0ZWRfX3kz96ME8Sw8f
 z0fy890P6iJfqancL4ksHbh7eAOTAl/fQ/pDeDDACY0n6GSIZT5T+o3YCQ0RoD/Q4hFfuV2Q93V
 Oco+YNfxhembCN/c/BgXkTgWhT057vYj+hH8up8NK/YRyHhMLgvsYuH/nwMzymTvsq7qNAeJuDH
 12tjo8KpNuhasSfJuXS1L6Jc7Tiw6HlrC7sSgJMfLnIf0AKeX6FfhYBQQ3v5Z9iVfpZBq7a4PE8
 aIgzvAAl1tkWrTgFVLfP5pnP52tN/SMgZCYezObCmkwMDJe84GDR4UGLNYttH5oYivy70Jmv/0Y
 ylAe0JuflqtOK2sc0xeqSbWNSK2A7ajAICkVq1LMBzXlnOjxUNvmv2V2a6EkMcD0j0DRc3rCpap
 SR3Na58JmaOHnXXiIs3x5lC1Xu7BLH7wYH8GuSShn/4lkzIskiRJ2e3p0Q8kD+Cg4Wymmd2snbB
 4ceMULR4eyCX2X6U5EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084108_703030_7AFF925E 
X-CRM114-Status: GOOD (  12.50  )
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


On Wed, 25 Mar 2026 11:01:14 +0100, Arnd Bergmann wrote:
> A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
> to build on targets without CONFIG_OF:
> 
> WARNING: unmet direct dependencies detected for GPIO_SYSCON
>   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>   Selected by [y]:
>   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: fix up CONFIG_OF dependencies
      https://git.kernel.org/brgl/c/af475c16bc02a08ed6af6ca0c920f98a45611fe6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

