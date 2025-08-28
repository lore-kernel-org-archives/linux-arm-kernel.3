Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835DEC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm6i+EpyE8QWt4iCU85NedWZbbxEmH/7ZoLUzNKJkZY=; b=j04oiSjsB0dq8ncESNqjHeRmrW
	9bBocwEmBqArxDpBGZ40p60Xs8osGweqipwP/JjKW/OlMA0fhmY+CqfarQgxclJrDNcftUj7hJC8a
	zwuH6MtF1RlZvgZn52vkxCqLSiP/iAxInl+iu4Efui1g9PqfnvDosindWpfXKB0/a+0RsOyjA3POX
	yBC11lAVXtlfC5o41OL8Lz+HdW8hI6DPgflPzW4OsVPvY92nDgwcKd2XATKikJhGsewhsJKkNIkH7
	JoOO7BppLcl+fOl+pyX28rs8bwS3xzq7WlsnaX/p7rdDwOy+LLhvy3h85fgPh2492s4Q1nkd/+Y5N
	AmBN6vYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhko-00000002sIW-1bXi;
	Thu, 28 Aug 2025 18:53:46 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urd6g-00000001nwL-1G4u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:56:04 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SBnI4b026021;
	Thu, 28 Aug 2025 15:55:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Dm6i+EpyE8QWt4iCU85NedWZbbxEmH/7ZoLUzNKJkZY=; b=mKNgIkdjnJ69Uacm
	r1W22+vpUjzgOSBN+1ZubxX1Ff+Hd6brat1mwbIqER2QKsFc+VNNWLo9+iXZV1bx
	U9H06JDsYUVEZ/9CuY7YIjkwCPxv22cS++8EoCsoR3pHH6t0PKnUjcWINPZh7EI5
	EE6T73pCi+hoN1otSsxtrBl6y6i/zpkg8MY4YeUR76corYBIf5WZfOhi60sSpdYL
	rwCi76BlFvV6M7aAnKeeXZUC16zoj8mpKX0CCFBBUb9/5FB5WJGH+lHfVpPvYqVt
	ID6zdZjWPrSW84SmsgU5asZAsfttFgXXl6CJjd3NCsNg7OT4s33TaTmK6iVZnIwk
	/ElwSg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q626vktc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:55:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3ABAA40048;
	Thu, 28 Aug 2025 15:54:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C14A74F6C6;
	Thu, 28 Aug 2025 15:53:27 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 15:53:26 +0200
Message-ID: <676469fd-b957-79f5-9483-749c66bdf270@foss.st.com>
Date: Thu, 28 Aug 2025 15:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 08/13] drm/stm: ltdc: handle lvds pixel clock
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_065602_606737_28B38C41 
X-CRM114-Status: GOOD (  11.34  )
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



On 8/22/25 16:34, Raphael Gallais-Pou wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Handle LVDS pixel clock.
> 
> The LTDC operates with multiple clock domains for register access,
> requiring all clocks to be provided during read/write operations.  This
> imposes a dependency between the LVDS and LTDC to access correctly all
> LTDC registers.  And because both IPs' pixel rates must be synchronized,
> the LTDC has to handle the LVDS clock.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 22 +++++++++++++++++++++-
>   drivers/gpu/drm/stm/ltdc.h |  1 +
>   2 files changed, 22 insertions(+), 1 deletion(-)

Hi Raphael,

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

Thanks a lot
Philippe :-)

