Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10312CF8549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXv3TnikV0+4+RIuOXrnFDb1qrTsctFO2AIZQi4m+vw=; b=COaAqwEmcmOcBFXaUwWEBP3P2c
	3XCnojI5QN1N35vWz3GhUF3LL4qafdF3Zp1Amb2Gglpgv9sYYWGuHyMqWb7xJr1giU8oGsXitrCEd
	jV6z/xw9M9Mza80bFuhFrSFion3/uSLrAS9e2GRdC4VNnZkehM6c/WgakJ6kI/YYpeaknPfo+Cx+a
	aMEKEVZJFrD+M29pzIKaUGpuDGCoRUb/Hk8zS7QPxpuUuAWG5MAlHOtSGRUnRnBLiHNiU8GF8w8Ne
	CGmDfFJjCiYCfG/+OiDj7kBJaXbqMKKecLuoaA3sTBI72H6pvxhdaf/uWyk10cGS3+tHhG7h4FOcN
	MGznZz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM85s-000000073Ls-3kwD;
	Thu, 20 Nov 2025 17:05:16 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM85q-000000073Kq-0oZT;
	Thu, 20 Nov 2025 17:05:16 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CF5FF61CC3FE1;
	Thu, 20 Nov 2025 18:04:36 +0100 (CET)
Message-ID: <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
Date: Thu, 20 Nov 2025 18:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid
 btusb_mtk_claim_iso_intf() NULL deref
To: Douglas Anderson <dianders@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 incogcyberpunk@proton.me, johan.hedberg@gmail.com, sean.wang@mediatek.com,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_090514_384212_805EC144 
X-CRM114-Status: GOOD (  23.65  )
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

Dear Douglas,


Thank you for your patch.

Am 20.11.25 um 17:12 schrieb Douglas Anderson:
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>    usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
> 
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
> 
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
> 
> Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
> at the start of the function. This makes the code handle a NULL
> `btmtk_data->isopkt_intf` the same way it did before the problematic
> commit (just with a slight change to the error message printed).
> 
> Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
> Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info
> Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")
> Cc: stable@vger.kernel.org
> Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Added Cc to stable.
> - Added IncogCyberpunk Tested-by tag.
> - v2: https://patch.msgid.link/20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid
> 
> Changes in v2:
> - Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")
> - v1: https://patch.msgid.link/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid
> 
>   drivers/bluetooth/btusb.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fcc62e2fb641..683ac02e964b 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
>   	if (!btmtk_data)
>   		return;
>   
> +	if (!btmtk_data->isopkt_intf) {
> +		bt_dev_err(data->hdev, "Can't claim NULL iso interface");

As an error is printed now, what should be done about? Do drivers need 
fixing? Is it broken hardware?

> +		return;
> +	}
> +
>   	/*
>   	 * The function usb_driver_claim_interface() is documented to need
>   	 * locks held if it's not called from a probe routine. The code here

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

