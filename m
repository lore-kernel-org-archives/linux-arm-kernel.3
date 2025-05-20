Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AE3C54799
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UExusS9wGruu2jirSHupY+orQc1NwlzDHTp5gtaUL6E=; b=UW0ZBSF58PBvWIH15zLvj9ZI0y
	YIZMSVmwkvH/FCu/zPD9ZWsMCU/UsvL3knVwmSmZxZommQ1tk+SP203YuqktpZvs8YGP6ZdtJV3vk
	TengRRGpFiKiVdhcexKaOwa6j/jor6gx3KzU1khdSTzeRxpoaB4iwi7rVw4z1q3gDoCsh1Jaz25as
	GJWRCjJfXlP6s9D+BYWCX+WG9IdClZK1aRSiXAdItmVUr8DdVBFliLM5Re1/oD3Dz6ABA1RUy97Ak
	T5zJiiRRObj6meKOXUvGicSrANlI3MON7rn4WHicosZmiryK84ZQ8hFIhDQ1efAdNYpoZ/Asasoya
	RAvwJ49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLOB-0000000Ch6h-1GcB;
	Tue, 20 May 2025 11:44:07 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLLv-0000000Cgfz-3Fcl;
	Tue, 20 May 2025 11:41:49 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9UC8E021011;
	Tue, 20 May 2025 13:41:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UExusS9wGruu2jirSHupY+orQc1NwlzDHTp5gtaUL6E=; b=GzTXMwsiZejt1O8H
	HSMOo4JJMYdWKi4XLUZACmweuNUHMXMcoKBaBK4izDYF74vuwBPhTZk6IexHobg/
	qK9I73asI1F+eYDQZiyzxP43hKUrX/gpKv/++Q/63O4zRbJXsKcyIXJRe8YtHdoV
	RPwyyY04Tk6DjBcJZpMMLx0wfWgVldqOE1FvIgNQm9RI5S0gb+O/faMVPHN8vYO7
	xVKBfv+hc1nAbKmBD0/cmEDphgVskJ4VOESdBzuwEbJOODz1O+/U82sx8FwgyLMU
	7hCq2HGWxCcmbZsgQoNFKYIKbh+ZOklyV2oLZ5i1xQm8eShnTM2y/drHpPFlUzAG
	h0IOcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pht1w43t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 13:41:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1C0F740049;
	Tue, 20 May 2025 13:38:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B551AE2BFA;
	Tue, 20 May 2025 13:37:16 +0200 (CEST)
Received: from [10.252.29.31] (10.252.29.31) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 13:37:13 +0200
Message-ID: <b1d3f93b-8206-481b-bd8a-d7c0953e0ea5@foss.st.com>
Date: Tue, 20 May 2025 13:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/22] drm/bridge: stm_lvds: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman
	<jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki
	<jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski
	<paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu
	<Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <dri-devel@lists.freedesktop.org>, <asahi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.29.31]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_044148_460860_423EACA1 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

Hi Luca,

On 5/9/25 15:53, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> ---

I went away from keyboard for some time.  Sorry for the delay :

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Regards,
Raphaël


