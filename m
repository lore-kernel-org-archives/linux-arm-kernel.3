Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55149C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vjseJYbJT5ETJFPoncHRVVX4/JCv6agmUw3wmhKosc=; b=ryxpwRae+HXsvX4Rk1UunZ6I9f
	XzOUtRvu6qM7NDmakTjLpj23V3gXq+/pJpvrBDVGE+kQROJfy6Jn3jjNHy457dsMkKGi5r1cV0dHz
	nwo3vRF3nQNXFUViTbHFrxbRrnHViSPmVXqnANGnJtSUiA5jBqFegm/XnDWIFWI8yupCkEaKY0IuI
	mAsfzsA4IHty1xTBxoVXz27Q6GG+y0pzCadBBc7bm+77Bb+LYv+tYOTUx6DfeEyZwZyicSB++ig0+
	oDM+9vZ7OaTWOo1PFtTtxbC5k4BYHk6KEFIEXrcPDAelZuQIg6HliprfLM88J7XV7B7oXSrW8FxFP
	HVpchbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuhU-00000003SVZ-0GoZ;
	Fri, 16 May 2025 13:02:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFudq-00000003S5U-0keM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:58:23 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB2cC6002118;
	Fri, 16 May 2025 14:58:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3vjseJYbJT5ETJFPoncHRVVX4/JCv6agmUw3wmhKosc=; b=h6kvDvfd3E/ew6uD
	kIA4mZS2tnjaseju95OgnOlcaevnuXwOZJvA36MXrggZ/Hr7PdgvofDVTarF8Ygx
	KFMVVv8lABPdDH6QhBWt1yNLdOHWgCjglzDTT6MURdczeInpIVdBFl1U6j2eriHK
	ga0oVq4B+n0RWP2EFXFlCK3S/xisYYw8Z9soT15E74cr1eRFcDn6onQcZqPOqaNO
	i9mY5whVoiTkjperNXUXlhd8t1trzhw3qYmuAK3KX22+sCEJOu9DDTeAmUAO9XAj
	A3A4/C457uS9c3CjHYHd1EtwweqJdhzUQ41LXkiZ8iXL51uhSuD++EGj2trv82u/
	bWkdYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdwe848-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 14:58:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F01D740063;
	Fri, 16 May 2025 14:57:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4D70B44890;
	Fri, 16 May 2025 14:56:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 14:56:23 +0200
Message-ID: <ae7b8134-923c-4967-b25c-fc1411fd0602@foss.st.com>
Date: Fri, 16 May 2025 14:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
To: Mark Brown <broonie@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
 <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_055822_492207_0529EF5F 
X-CRM114-Status: GOOD (  15.74  )
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



On 5/15/25 11:19, Mark Brown wrote:
> On Wed, May 14, 2025 at 03:56:01PM +0200, Patrice Chotard wrote:
> 
>> This patch is dependent on commit 6b3754009f87
>> ("reset: Add devm_reset_control_array_get_exclusive_released()")
>> available on tag reset-for-v6.16.
> 
> When telling people about dependencies like this the standard thing is
> to also specify the repostiory, or link to a pull request.  The git
> repository is needed to actually pull the tag.  This appears to be the
> PR at:
> 
>    https://lore.kernel.org/all/20250513092516.3331585-1-p.zabel@pengutronix.de/
> 
> which is the full reset pull request for v6.16.  The commit you
> referenced isn't the tagged commit, it's further back in the history
> but still has a whole new reset driver backed up behind it.  I'd have
> expected that if this was expected to be pulled into other subsystems
> it'd be on a topic branch and directly tagged?

Hi Mark

Sorry for that, how do you want me to proceed ?

Thanks
Patrice

