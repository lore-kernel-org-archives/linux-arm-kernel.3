Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E18FD3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xNh2IrUQfFXer4apy1LW0wPRCYKX8Op57bOTtZRB8k=; b=ca0c7Mf6THZDdH+XG2gyRZeY7N
	HR12/2ERdgFZUo8POYIUnAJP1Je43+sWdbqzgc4we9p7v/gMMN05a4p71jUMBunPLutYD5wMXgYA5
	9cAtcyYn4JNXgFYrz2LYHA6sJkQLRqFKwnxGWXNQggcbXvfOtw9IFPeJfG01qSvdkSFhOtI7l6VT9
	Z6yF++EgU8NeOUosJ67HDMnJFMTYkg2RUcBTqtH4jTt8krnsoaSKt/pNTt7hUnyhpD6hx5LkIgdqB
	Q410pCQe8h/ZgLAS+GEo7POFm86GjfYrgSkn+r5WlqO6HyX7n+v4BjdSyOsMxfyg5BM5RKjYAyC+W
	nU1ZmONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZMV-0000000D0Pu-48R4;
	Mon, 08 Dec 2025 11:25:03 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZMT-0000000D0OU-0HJ3;
	Mon, 08 Dec 2025 11:25:02 +0000
Message-ID: <e245ff67-1d71-48a0-bec4-f30056ef2e19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765193098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xNh2IrUQfFXer4apy1LW0wPRCYKX8Op57bOTtZRB8k=;
	b=K+3Q+f4wXwHAnSqWeD8Zht4KMjLopVIgM4PK7rSR+Hinpl7RTbJvRrBBabkCUQhDD5x4/Z
	4pxwRlrEFBvcM1zNBGsUvfNVpd7O/Mm7AzAfbDuNH34KRj5DegQWb91SVsBmiqKd8im331
	NeOxbkTG/SqtW2oGCbu4kfXm6n1R7Mo=
Date: Mon, 8 Dec 2025 11:24:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] drm/atomic-helper: Export and namespace some
 functions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Vicente Bergas <vicencb@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, stable@vger.kernel.org
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
 <20251205-drm-seq-fix-v1-3-fda68fa1b3de@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20251205-drm-seq-fix-v1-3-fda68fa1b3de@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_032501_436017_8BE93249 
X-CRM114-Status: UNSURE (   8.51  )
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



On 05/12/2025 09:51, Tomi Valkeinen wrote:
> From: Linus Walleij <linusw@kernel.org>
> 
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
> 
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> [Tomi: Resolved conflicts, fixed indentation]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: stable@vger.kernel.org # v6.17+
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 122 +++++++++++++++++++++++++++++-------
>  include/drm/drm_atomic_helper.h     |  22 +++++++
>  2 files changed, 121 insertions(+), 23 deletions(-)
> 

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>


