Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E64C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 20:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQKCJ04siddRBG+IxS9aOk0Krq1ez5qBC2vqbCHaW2I=; b=ul2EWk/bMA9/BNA+hBEk9+SOSw
	cipc5BQcAV42xv2Z8kNLojiUnxSAkgpDXJByK0Qco49AkpaQIiw1x7Hd8i1gOPMZU7/89YcaDitb0
	ojA1Y/f2Ob/kHKYMDqDK45fxqA1iLzaexyjwO1eqYm62cefAMKCUGObBy+eX/pPt8VOZp4PG6gQ5W
	O8y6NDmbI35aEZrep2SBe2CJvN+rFPv0+Qc/56Er8+/hkbERjJ+oUAiyxT40GgA/LfZByjMdTNQZk
	MNEsXM3jTXyQmmKr6HFbieJOrv4dqPZrZNwg4JuEB6DiujhHVJ2m4d+u6o12dOEniWd2ExW6MgcME
	nwxaOwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLOW-00000003Qp6-2lLK;
	Mon, 30 Jun 2025 20:46:28 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLM9-00000003QPX-0e1i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 20:44:04 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIER08016451;
	Mon, 30 Jun 2025 22:43:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=AQKCJ04siddRBG+IxS9aOk0K
	rq1ez5qBC2vqbCHaW2I=; b=rlAa3eTMj2MhjAVRNMno0xIZa0U3bhDxcRktwj2T
	Lze+UVuHk/rTCuDlw1OXP/+EiKk3XQjXnpMT/KGt9ZP71emNkHlW9dhX5P3D1d1F
	r5pCLMbQi3vxP4djavoTZyxCOf02qJR8tJxOGFmyHfn3NE4dk/ykFR1BxKEOJYU5
	RgAlViTXOpDwKq/uQO9+3W/6jKjLL6zJlteBJzk+RHaELSgLQIMZH/aGl6heW5mM
	aMEhD1IYLqmar40BzAojWG6H+Fx24NVtKCUZ2p+CbTyLNg+wHcXQcUIaP/nn4oMK
	cF03K7AQWkiHVuzA1A+tJAse+2jEn/fhUQ+waz8J0RxN8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tm1j7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 22:43:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B127F40055;
	Mon, 30 Jun 2025 22:42:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F7A4B2BD0B;
	Mon, 30 Jun 2025 22:42:26 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 22:42:26 +0200
Date: Mon, 30 Jun 2025 22:42:20 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
        Mark
 Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
Message-ID: <20250630204220.GA522704@gnbcxd0016.gnb.st.com>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_134401_693251_3836245B 
X-CRM114-Status: GOOD (  16.88  )
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

Hi Dan,

Thanks for this patch. Indeed.

On Mon, Jun 30, 2025 at 02:35:25PM -0500, Dan Carpenter wrote:
> These lines were indented one tab more than they should be.  Delete
> the stray tabs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/spi/spi-stm32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 3d20f09f1ae7..afb54198bde7 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
>  		if (spi_delay_ns) {
>  			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
>  				 spi_delay_ns);
> -				spi->cur_midi = spi_delay_ns;
> -			}
> +			spi->cur_midi = spi_delay_ns;
> +		}
>  	} else {
>  		spi->cur_midi = spi_delay_ns;
>  	}

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.47.2
> 

