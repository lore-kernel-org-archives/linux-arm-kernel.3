Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2EBD6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOmshKDUDvVNH4QiayacMf8uIhPEsQBSAOnp31qS5y4=; b=BwpZbLwjHkXdQ55uxksACw4XN5
	KVgNswXC87P1BZ72sb0U9DmzCU5LOPexKVH2ieChIhTIC6SNplZXSIAlYpEaazidbzOMqGeNLkb8R
	EnOcOzqb5PhGl/uiNV9B96S/H3tNA9yFNSVLi5SNjhWMeIhwpdNNILnMQ/F+I1ukXAIO+oTsjTIhS
	rz0B3OlIIy57a+bBitqoNENhcLwgorI6v75FH61pVte8BqFPtMptSjHqJV1FfBss4n1zboZlrjLaE
	BoH88rBg/L4cNresMlQOCBo0BOmpjU4pA1y1VowYQ0/V9OjzOy0OqT3BbGbENz7MgsevgkOj8yADI
	gKLjsf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9yA-00000008741-1OPQ;
	Thu, 18 Dec 2025 09:06:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9y7-0000000873i-3lX2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766048803; x=1797584803;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2FxCS2v8ys6Z9v1YP9ReHVNMpOtfhfAq24bTG/5GKBY=;
  b=2M0D7f9AQ6dyUx9i5iNhBIrsOPsg5NQpzsy0r5eEU0cQF4YezcEVRKuu
   hfaJzQLmqa4ovO6xSp4fKvLDeJlLqYOwNd+/afJUb3Q6b0ysAAjtj2WEj
   NGiBiFV8QiWgcrl3Os5P/nfHXef5kn1rmm2PhqAshdYGDxIYEqhtfFoRT
   HBP00KINTZGIo81wRd3yPeAVyFV8VBQZK+kdUPvFni0YbHQ+mueomFsWr
   N18kjasnSbBBYxAz158zP2pYCVFyLxyirdCivD9UwS4DwJblHLBIw4ED8
   mtlFtmO6A8WK3deZyJ5yj+SLfa58ZikDCb0k4kSPJKrQ4ap8QLxUKr/VL
   Q==;
X-CSE-ConnectionGUID: 3TswuhhSR4iw3eoTfkehJA==
X-CSE-MsgGUID: ypYW0R9OQBqxqqnx5ZMI6w==
X-IronPort-AV: E=Sophos;i="6.21,158,1763449200"; 
   d="scan'208";a="218042574"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:06:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Thu, 18 Dec 2025 02:06:18 -0700
Received: from [10.171.248.75] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Dec 2025 02:06:14 -0700
Message-ID: <83faf871-0e54-4ea1-9490-e27026211eac@microchip.com>
Date: Thu, 18 Dec 2025 10:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm: atmel-hlcdc: add LCD controller layer
 definition for sama7d65
To: Manikandan Muralidharan <manikandan.m@microchip.com>, <lee@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<dharma.b@microchip.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>
CC: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20251218040521.463937-1-manikandan.m@microchip.com>
 <20251218040521.463937-3-manikandan.m@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251218040521.463937-3-manikandan.m@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_010644_004393_FCFB46B2 
X-CRM114-Status: UNSURE (   6.68  )
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

On 18/12/2025 at 05:05, Manikandan Muralidharan wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add the LCD controller layer definition and atmel_hlcdc_of_match
> entry for sama7d65.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Ryan and Manikandan! Best regards,
   Nicolas


