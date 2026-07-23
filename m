Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5992C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=; b=nrb8pGn/xiuDutUmGaQcTfRVCR
	bFgbjhwNAXDCtCSU7aJ2HeL2OwZQoZ8lGzJ01aXQRymsL/LFBNqfyoDCzsIx8/FA8QoJuJprLygHP
	YF+vEqI6kjTv1KkhJS07lgvik+HcuxihU5QRxmxD92Mrc1f1AelhDD1QvACSpTceg2eLO3jsVRG1P
	B4hxL5ZEPmR7n8akqMXR3ljzV0AQKQnpWlBYL4ZHt8APTiUXVSz0hxmZ7qJbmE//Fbc6hPRgSpzku
	oTh6qzndIUcgoOB4Mw7Oewy+9x1FgcvTleDTjVUqmmsX+KCbckvxQfusIm0IT8aJAg6SmOnip8/T9
	zI9KE4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvtS-0000000Efnz-0Rqf;
	Thu, 23 Jul 2026 16:03:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvtP-0000000EfnP-44Ji
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784822606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
	b=M/10HsOzCAxKw+rFt9bhpOrxOAQSf9wX94d8+4iFfprfvm6YwH79VgetnjKXh4j/OVsxeW
	mOwZq+PdEauPyR0rJ+24hFHdufd9z/lwW6+pV1xWtmWr109mjzfbsEe3j1UwSUS7SicndU
	x4o9h4qBiSnpURwkE+O96rXdZdyUbdk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-FZYhyDF7NnK3Ikt6nMgx5Q-1; Thu, 23 Jul 2026 12:03:24 -0400
X-MC-Unique: FZYhyDF7NnK3Ikt6nMgx5Q-1
X-Mimecast-MFC-AGG-ID: FZYhyDF7NnK3Ikt6nMgx5Q_1784822604
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso12046286d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822604; x=1785427404;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
        b=pMbS0K+G4/H3LDLn1kgfnOLKzp9kJ28cbs3yBtgbq6iArPpQhwPSCYGWL44JyuxJ0i
         Ia/f2peYj0WgcdQW/ljRQoTws2sXb7DvWgi/KE7c3uPYpcuMPdSG72lsaxSfDbU47Ow9
         KZFvequdHNlAeczOo8fVnbzEt/K6xYN7cs3iIJBhDS9BzAYZq+lOn0/HM9wP/ISeg5N7
         ZqhcnK3wRO6zb3xjo28QGSjz8WRSQdoE+V1dTkctIVrs2YHLzz+AQ8RXOwAQjoBF8z+Q
         Jxyq5hmE11sferutiIdperNP+2dzUadL50A2Oyy180nuqbU0Y82ElhQC434jnns0k4Kx
         u8gw==
X-Forwarded-Encrypted: i=1; AHgh+RqE4Gmkl1MhF/OPChxP79934UYI2zneX/tWtya1Ja8PVM8GfM7oRY0hr4A/GtxZV6eYRu9Da3hXYzTAhZjJBRXE@lists.infradead.org
X-Gm-Message-State: AOJu0YzXzSeWa+uDsPoQS+VCIGDCrOrlp5vAt3PX59l+zwhfeg/6ECfj
	YjIS/YotGio9xAWXJji51Zm6v9S6LCz+Y/xQR0Xblt+1ocLgQRSwrlFielvISQfZ9L7FMpLfCRM
	cQgbi1YMm3EAYNyfY6S3AeJhvA11agn82r38/+3+4za5MoF8DtGPoMUR40pWlta5cUO75yt2YC3
	8Q
X-Gm-Gg: AR+sD11+bwjCtzF6U7Bue4JBOoZ+NlyoVJpjhAJ2fFzA44CflnfieCwj++F5sIFcORc
	XAu93ftE8wbd70yzxD1cCkfyrTI4wdB5pdCPXo/je0fiyOjp4slrkKE2ua00pE3s4YpwBLyhOnP
	puXmyFhEyEUtvigvns9nqJTYGMRGDvMrjOwOJqF5YcAs9sG+6TPY8tSRJyhDESo818GU/aXGVXh
	QgvkJUrpzyijTqVwCNHLtYT2tmlBtCqdmQwqaChg22EXFFwMGAApJOIB0FPd1xJFhzDZYvkLMY2
	mphtUfS1CMPvX4ttQfu3eSKWDAHuR9pXsAmIesdXuwMKd+muMA8DRVrpsh2TKGy0QQwmCblKuEq
	PIaxDbjBxPmFYdwOweLhU37Sm4sr/1ZtA5u4=
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33587986d6.1.1784822603629;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33587566d6.1.1784822603140;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba672806sm48357536d6.0.2026.07.23.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:03:22 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:03:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	jindong.yue@nxp.com, xuegang.liu@nxp.com,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Message-ID: <amI7SFD1bQjkj6Db@redhat.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
 <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L_NnRLz500YA9l9cgNPcrOdwf5tn9TWd0ltWz0KjqdU_1784822604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_090328_099228_6A101EED 
X-CRM114-Status: GOOD (  13.52  )
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

On Thu, Jul 23, 2026 at 11:05:24AM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> The i.MX8QXP SCU clock driver manually attaches power domains to each
> clock device via of_genpd_add_device() in imx_clk_scu_attach_pd().
> If the SCU power domain provider has not probed yet, the attachment
> fails silently with a pr_warn() and the clock device is registered
> without a power domain.
> 
> When both drivers are built as modules, there is no implicit
> dependency to guarantee load order. Add MODULE_SOFTDEP("pre:
> scu_pd") so that modprobe loads the SCU power domain module
> before the clock module.
> 
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Long term, it would be nice to fix the probe deferral issues via a
separate series.


