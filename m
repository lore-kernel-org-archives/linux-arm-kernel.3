Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0444C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUCes1cgrKK/Gt01W/SBFLPoFtmn1LNCmQ7VDkRPRkQ=; b=HEiLd1vq6OkkImNB8ACgRVB3Rq
	d7FQjZBotV7Ob0F0s0rkUaTiVqBCbNqpH9rHqQIQXXg7LEZCm220jDYAc+m5J7Teml9EZSC6qz8x0
	3CX86VM6yHAk369L8h5ba/KkYUlOVm5JeP2Yr4o808U+d8d3NOZTcDw5t9mjcaMi0BC155BXJA43S
	6fhv2K34QclhJz+Sc6uGWgnpdqbPOoE5JIh9LLrrs3Y7/Je4JzzLl+GaP86QUODjLjN8TfOOtOyQE
	2xrT4lTJ+HwQNpOvOcjslL7sbkkef701wl5dwwp9uZFjtTNMNZHKjmgeJNTAGLkkE8ruSlHzKyLVO
	hAo2KWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvpw-000000058SD-1xCo;
	Tue, 11 Mar 2025 09:23:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvie-000000057CC-3C86;
	Tue, 11 Mar 2025 09:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741684571;
	bh=+LmbqfqjpLNk7GtSwJDOFlesjC4+wxWCYVNW6cSONUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OsTgjHIS83+R6Pd5t0aY4Go4mLKcy3qkW9KB8z7qOB4GPz04tCE6FSVwa5dgq/npa
	 /1LkVSwTKzUMjhx8CCJrinfpfkbezJgoVTFSkaFXbUlfi1jUOWOfw6YZmFNOe9Rjs5
	 Eq0XeTRxV/W1DYk8H8v8eDUbmgnkYRbvoYqTEymIvlU3GBr7g8pE9UFBsNhkA6qvPy
	 B339y6UtlH7KcSwD66lwY5xEvc/oMPYoEc1YuQzYeEJCGZwoXdy6kvs+IF9aGleeVS
	 3CMGeJFfsAexILHOhK+ymYTJ9mq5XBD8pmn4I7LNZCkPWbGikXzzcZCTK1eks3NW1M
	 3R2ooejUbim5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8127617E09FB;
	Tue, 11 Mar 2025 10:16:10 +0100 (CET)
Message-ID: <62765c3c-7663-4b27-a839-7fe5ea9a3c12@collabora.com>
Date: Tue, 11 Mar 2025 10:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] drm/panfrost: Set IOMMU_CACHE flag
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-2-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250310195921.157511-2-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_021612_957825_CF6902D1 
X-CRM114-Status: UNSURE (   6.17  )
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

Il 10/03/25 20:59, Ariel D'Alessandro ha scritto:
> Panfrost does not support uncached mappings, so flag them properly. Also
> flag the pages that are mapped as response to a page fault as cached.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


