Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE8CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHlvgHZaFwCkf7ITU9EaNlOvR0Pl/LuLj+JB04prPxg=; b=yjoEyjX3PxjocEvEwek1RnEa4D
	omp/7RlxWfDwTCU2K48AvfnozHeeWC2FR7SJ01J/SIVEEM8/2fPzfxG3dUAKvdCyJqshgaslbt5Gi
	jYzZECOZypImpTepp9awHfY/+A+mUMhLxaxRPzVr+2IkdYTSm6i7iibX8OnqFU6d5UeQle8O8nLNq
	habzsOhqTmWZ4PDM57mk5O9Dc5gxPcXqni24ECbFf9Oa1AzLVP7F2dzVqtf7w9rmvthf5qjrPfdsD
	H84gx+1LzNeyfkuDrXnwiv+wUf7Yz4ew3arpYEfvQLYpM3r4Z1Y+kkrb4tUlTO6VGYAEzCNHAq5Zn
	D/q4VmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUd-00000002JWU-0MwU;
	Fri, 05 Sep 2025 14:32:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSXI-00000000fD9-1Gq3;
	Fri, 05 Sep 2025 09:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757063710;
	bh=33A/I19euiFo7KyPkCzzuu4tf57r3cMykqNriw0KQWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KssQjEZDH9qu/sgjacMKg0Zz3UxIzN6z1Hvhb5Fo9k5JDDWuD+TrfyEPCYWFKEmrJ
	 btk2pincIPdba6Wn/25wln5tco96FJM/f8dTQZffE8QGDFfxp2jrbVcO9wDEHh+gqk
	 yTHEibEWSqqAPD2ntAHoude1EL3UdPjp4aOO41aCWzfU7L4HQ+B28rK9JNjat3vt5X
	 X8JwwuxuQvV/D6NYUiKcCgLYKHSKpmZ6PEZS5gFA1HOVradnMsZ4MVTCj1A99pD6ev
	 Z0BaaOfxx0ZcWJGwfUiWiEzuiyeijBEqH4pkRhGqr57Snx/5Yp8jY3sHCcZQ0zh+xR
	 k4w/eCvUdARjA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC6EC17E0523;
	Fri,  5 Sep 2025 11:15:09 +0200 (CEST)
Message-ID: <9aa961d0-8138-4363-a606-30d879638a5b@collabora.com>
Date: Fri, 5 Sep 2025 11:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix sleeping function called from invalid context
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091727.3745415-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_021512_501058_D1DC23DA 
X-CRM114-Status: GOOD (  12.64  )
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

Il 29/08/25 11:15, Jason-JH Lin ha scritto:
> We found that there is a spin_lock_irqsave protection in msg_submit()
> of mailbox.c and it is in the atomic context.
> So when the mailbox controller driver calls pm_runtime_get_sync() in
> mbox_chan_ops->send_data(), it will get this BUG report.
> "BUG: sleeping function called from invalid context at drivers/base/power/runtime.c:1164"
> 
> Additionally, pm_runtime_put_autosuspend() should be invoked from the
> GCE IRQ handler to ensure the hardware has actually completed its work.
> 
> To resolve these issues, remove the pm_runtime calls from
> cmdq_mbox_send_data() and delegate power management responsibilities
> to the client driver.
> ---
> Changes in v2:
> - Move pm_runtmie APIs from cmdq driver to client drivers.
> - Move pm_runtime_put_autosuspend to GCE irq callback function.
> - Link to v1: https://lore.kernel.org/r/20240614040133.24967-1-jason-jh.lin@mediatek.com

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



