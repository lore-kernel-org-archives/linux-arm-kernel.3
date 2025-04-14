Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D369CC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW/uohQqP4tAP/xbDXxo7aA53CSD/+aE8GjhaFtaV7g=; b=vCsoGw6rWXfSJKKbKPQzYleRKa
	nSzH9G2G7t69TuwWGwxzJpR7FVhcGAuVUM8diXceEW2H+ezxW8a/LBJc/JRCXuyQehko+gXt/53ny
	l7tGEgsai186FRcVLA7cWYOjXFKu8gDoQ5SRa3vn8MQGMccOgGxOxHhBP9HFSYWSrRk7UiPV2Nk7E
	JcAH1HiMtcNMNECCR5CwFXGAfOj21Tzp0Qq6SVLZO6yUL4zYhxOKLMNhR4cjTwPwJNnIeLGK4Pe7i
	2e0gA+rsjDylMT7fTef3Sm5pOm5EIPl/hNuBNUG9WIKstEXu4s3ky8R7e3Vw6copGVF7ndKVOJuP7
	IyxMzCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GDu-00000001HxS-0ngi;
	Mon, 14 Apr 2025 09:35:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FqQ-00000001EZi-2F8t;
	Mon, 14 Apr 2025 09:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744621868;
	bh=7GmyhB9YiiseELmMRG3esYEYrbKodzmhymAzhPbwobo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCgux5ZSLOc0F0gQOZ05wl0VGLS1ov+KNQkID7gnWBgAx5krbzD35OkruxUhAVyEd
	 +FICNdd6DKfOdwTMCsbLF/FfnCN28Lyq5Am/GPv6y4VqiULZzNuGZ5q7yKUAyHpdU9
	 hngNJtDvzRxHIwbdQgvf4B7GVisHQVvM+KbA67/K6mFriNM6Z97m8y1fmHwfC63+HB
	 felvBiYMu+AFmp3wCz8fgSdpqJ4L7GOe+Rf6ueVdkEdyInGHUY58JG+KL1KEEzBCWe
	 xVPIcMi/V5BGD8bJqvHuTM8F06tGqMmzIbfvDY6C8P4MaWPt+C4egjjssML+UhIW5h
	 usZRFqv+OShsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55EF117E0F85;
	Mon, 14 Apr 2025 11:11:07 +0200 (CEST)
Message-ID: <9a6f30c9-9b87-4536-ac4c-a1b437729108@collabora.com>
Date: Mon, 14 Apr 2025 11:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: mtk-vcodec: Don't try to decode 422/444 VP9
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>
References: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-5-5b99ec0450e6@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-5-5b99ec0450e6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_021110_721270_C701D9BB 
X-CRM114-Status: UNSURE (   6.28  )
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

Il 10/04/25 17:40, Nicolas Dufresne ha scritto:
> This is not supported by the hardware and trying to decode
> these leads to LAT timeout errors.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



