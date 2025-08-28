Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BD1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsNuu9CqZFnBU/rKLRncHHCAvG7dZ93NWIpdKa0+iIs=; b=qMJntp0Jp9FB8Vz44D1zX1gU23
	mPAXaM6qmn7RYkHzsPf4TpGokWmSS8iWErCWpboNU6fL+QpdN3ROPyppew/eBXKJi/lfGJrmaj3F7
	rmOQK/Iirg8V/dIZw3Wf41LJqswyyybgNTCvMlztK2XHGS/45n1audb8fDU4DvDiJ+xGZgyNrOS4n
	gCRSm/lrnc2/op8sopfGjlG6wzDITPG7SmM0JnzJzGHXLqGIQs2DH3oBk89UE2eqK9Ime4ixGGBRo
	zOuueDG7Rxxj92lkQ1FG5WW5KgQ/nviREiTICy62WHI94V6rO3Dxhaij19ckMzOcYKF85fCSbET0z
	1Eidy9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgnE-00000002aJm-2FJW;
	Thu, 28 Aug 2025 17:52:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdA3-00000001p4k-3UGV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:59:33 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SCB6Wo027035;
	Thu, 28 Aug 2025 15:59:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AsNuu9CqZFnBU/rKLRncHHCAvG7dZ93NWIpdKa0+iIs=; b=f9t2+7cB81Pe7zi8
	nvF1FcT5DHLMeaZpL/4wM3sTZLKtbUKAuWN1dejpw1Pk5U33vU41fcLhLPgFtO20
	5YZYokRD3gCNaX2Pi6LPA2q5XgA4KMBmKWHt5hrhn/PHYxCJq5YIU/mGPPrgPngC
	sNlAUojHQ85OKnpk852IxhITDw3PTJjW9JMzoleCBGd0OjwcCQdhdUPNiUBZS7Hv
	CI1C94xfmpktIBxBKqGDTgEE+8hjfD4lUhk//iUqkWktojgZj9M9xGZlyiNP07MR
	6CGIaJl63GwaeC1ksjA/95N8QuA9lZ8LjO0CBuA6jjsdrBg6aI1vaEB7wplNy4JG
	G52t5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qq74b3kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:59:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DD9264004C;
	Thu, 28 Aug 2025 15:58:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8850475040E;
	Thu, 28 Aug 2025 15:57:49 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 15:57:48 +0200
Message-ID: <b55efa1f-d2a6-3e02-b7d7-7985e0610679@foss.st.com>
Date: Thu, 28 Aug 2025 15:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/stm: ltdc: unify log system
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250825132951.547899-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250825132951.547899-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_065932_164594_1736F3F9 
X-CRM114-Status: UNSURE (   9.32  )
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



On 8/25/25 15:29, Raphael Gallais-Pou wrote:
> DRM_ERROR and similar are deprecated.  Use drm_dev based logging.
> 
> Link: https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou@foss.st.com
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> - Fix kernel test robot's warnings
> https://lore.kernel.org/all/202508250637.nLxtkS26-lkp@intel.com/
> - Rebased onto latest drm-misc-next
> - Remove Yannick's acked-by since the patch changed
> ---
>   drivers/gpu/drm/stm/ltdc.c | 139 +++++++++++++++++++------------------
>   1 file changed, 70 insertions(+), 69 deletions(-)

Hi Raphael,

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

Thanks
Philippe :-)

