Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A42C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=; b=qL63PHAfXgGOhSGLgFR5F5fsHG
	+9JXSg8UkozLJ5HiLm/Hn2KlygSCR82eZAPQPsYSiCp5VWdDLKuLe6tHJZ55XlgPSHcLUIuIi0sqn
	jykqQTMEKoTVLRwuB3GuQ2/558ceTfK06fiatOvp3rTyj/HlOE/AXx0nVgmOLBsahyeHUuH2gHlZQ
	uLOTwFmWpgIsHMJZxwkUgh1zPlaAXvdGAhpTqKVmESudhHzZTA6PxY6TqiwuK88sErH61nO8/B5fy
	OJoK5Pkm3AKPO2WmONCy4p/RzdUMt/8OlP0nu+NeVyPevxQqyo6QIiR3lziHc+oa4iEzWljVfzAwq
	Yb9RE0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jg1-00000007onU-3IR7;
	Wed, 23 Sep 2026 09:54:09 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jfu-00000007olg-1tC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:54:08 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 00721157ae682-89666ee9b3bso8071367b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790157240; cv=none;
        d=google.com; s=arc-20260327;
        b=TznuEQNxZ8ozTFTbqavamKa4cy5PYWcj4JuX9ALmOFkK36D5d4mI3ZfhaH9qsm23rw
         iIePmmXksHtTRtLEbcdKQ0awD4a3e9Wzt9q6UYusjaSSDjXUlVQTTpy/hBaZD0R7BLB0
         7ZvFoHpkReNl4OfMGeUYD/h2bbrU6LkWDNtr4HLnazeli6omSirb/ANdRZZSyTrL1WW/
         IBtzdM2IhvJYD7ZTAJsNVTX3piS8UBcsABIS6aO8/G92PqE14upVxSv1BVjvmob4RCE+
         Mv7P+VgHkNeCCMFGS28+9fonRK+jeM7z4mZrZr6rCSMKzWGCMfcEJprs7ARguA/eyvX0
         zhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        fh=y6CzPrbZoJ5TQIFcTViK6hilJJGvvx2IgOX6saJ/ZZc=;
        b=RMdGU+lSYdY3oi456IwPDRH4qQ7QriHCB1/dFKZupAKFz4xKmiyvf4IFHIEHyFjuBX
         G5N0TPNGXyCagjXx56exiQwGbF8UOYo/NnR+2MhUlzy6joTRndBh52nAi6lVZYIJu6p6
         pomFDMJcyTwWinOhZqi1QxdJMKMQ/tSc+k4CMFJL75RNLx2cdceXbFJRjtzpHt2lCiOW
         wOUsVYtPZaNJSAC6GhYI+OLpBhh37nHWTNaFfVJ5AFJdvXESaL7AEcxtMRumgXMvEOeW
         iUvfgasb/u0nC7C2GLoksrCb8ZEH4rBudlXWuDd9yFkwgAx2sONvw+TDlY0+aheRAU0M
         NfEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790157240; x=1790762040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=ZodQ5fjtznPjJ6NODg6QesSHurwKpAUt67cun0ERWB6oGtxmmiz+0x3637OpDjv09J
         R/MKtQTlV/CZBCdmyNkQk91E2TqK3W2NpJKT9lFey4jPPgP8iKho61QtyDK58uEXH8Ab
         TIDk+unluDXczvxgcfJIq/O+LhNkTHl1Oa5G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157240; x=1790762040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geMBxQ+5OMnk+zqMUGg+MADS8D5tDZgkCZyUCSU4ou0=;
        b=Qa9PwzS5dVhzXrKMt8mYIH5VreEDYlp0kj8XbusAj4Al8xb/V/tndXdiod+G5ckSC9
         Tmu9sMuo2bxkbpE8npZxQWZXMlqBkvnibhaZ0lUlHs7o2aSH5uk5jYpDu7YZiTW9WHef
         K84q/cRCNDulpc1qal6HAeVGIg3It63uLyQUQZ0baZFK1QcR2+j404l5ODz0PCHh3kFh
         a2jBZFlP3TYraP3fALEJb2Gu0rAfwaSYrqXQbvyNKtNUC7plCotSKYSzYiSJXzcZwr8e
         4rKOg0mevLiMcu2+g/uYRi3SNIxt1sLPLteWm1kII0opybL7r2xDLlJVU/P3IIoKRGBi
         vpKw==
X-Forwarded-Encrypted: i=1; AKwUvBxvabEO+EdwyqnGfds60UMSrA8s75EofKb9at8+f3n5oq5DTX2/Iu1sdgztefgf+egjNzWW7MuyTVSz+t/eBGgC@lists.infradead.org
X-Gm-Message-State: AFuF++lRdUhWSR977H4sVtVsNlOk4RHnw5GESkuavZfAiF2EyP/MtK0e
	kPV40M9e59jFLphH5cz9ajor3wIKE1G9+NEOP47fE/E3C07NnndopMHE30ygjpDO6rzbgPmaM1P
	YZHYwOgHf1UGP6WnvFyKtnyy8Su2BYjiVnI9eUrMd
X-Gm-Gg: AYBFou3V5AjB1AbEkGtDWVWgTPbRi6RRHeE43NQbJuYDAvwyZTi/79ORsBoP4Lcf+xB
	31Ph+GPbcBmguV7LMcT5jm2m27Xz3Comy8mXYQejHtZYV25s+Pccn/leVksAdZhYPl9Qrl+8exh
	WDerONkOzHu+Wg94s/KFl35FAqGcE63sozqckaFP3HpHjNxFC03cKWrUwbT4fMRNPywrTEEKnjs
	lKyC6dOz/F9AhOB421fU1P+j03M4FY/YTkH+YqTEiGOiZ0K74kvjQIZzjODl518EYodDjAeYPv7
	qtGGWwqtZw9flT4SX1yajAPYwta2t8I6EOwVvaQeM5MlRcY+M4pE8vXn
X-Received: by 2002:a05:690c:7011:b0:89f:4c20:73d5 with SMTP id
 00721157ae682-8a457891187mr16275917b3.6.1790157240628; Wed, 23 Sep 2026
 02:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <dac8ddf07cb1bb79c70d5a516f0ff7baf41eb462.1788507854.git.liujiajia@kylinos.cn>
 <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
In-Reply-To: <dae8ba2edf89e35c44748912aa466f3b9c8df75b.1788507854.git.liujiajia@kylinos.cn>
From: Ying Hsu <yinghsu@chromium.org>
Date: Wed, 23 Sep 2026 17:53:49 +0800
X-Gm-Features: AcwNN1XyckWCvbLuUPclr9L84lJ4nL1-DpksFwXIj_myJJABSYaeMKkWJtFwAPA
Message-ID: <CADwQ6b6626zB1+Ms5JOSjp3fP0RJrE5BiQFqMh8Ra1c_QFVgmw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Bluetooth: btusb: Fix leaked runtime PM reference
 in btusb_reset
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Archie Pusaka <apusaka@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jing Cai <jing.cai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_025402_536246_EA691A57 
X-CRM114-Status: GOOD (  27.77  )
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

Another way to address this would be to let the USB core handle the PM
bookkeeping instead of doing it in btusb.

On Fri, Sep 4, 2026 at 4:04=E2=80=AFPM Jiajia Liu <liujiajia@kylinos.cn> wr=
ote:
>
> btusb_reset calls usb_autopm_get_interface to resume the device
> before queuing a reset of it, but never calls the matching
> usb_autopm_put_interface.
>
> usb_queue_reset_device ends up in usb_reset_device(), and since
> btusb provides no pre_reset/post_reset callbacks the interface is
> merely unbound and rebound: the interface device object survives
> this cycle, and so does its PM usage count, which is not cleared
> when the driver is unbound.
>
> As a result every reset permanently leaks a PM usage reference,
> preventing the interface from being runtime suspended again until
> it is unbound.
>
> Set BTUSB_RESET flag before usb_queue_reset_device so that
> btusb_disconnect drops the reference. If the flag is already set,
> drop one reference.
>
> Fixes: c9209b269afd ("Bluetooth: btusb: Introduce generic USB reset")
> Assisted-by: Claude:qwen3.8-max
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>
> Changes in v5:
> - no change
>
> Changes in v4:
> - do not return if BTUSB_RESET is set in case the first reset failed.
>   (sashiko)
>
> Changes in v3:
> - handle multiple reset requests int btusb_reset (sashiko)
>   set BTUSB_RESET after usb_autopm_get_interface. If the flag is
>   already set, drop newly acquired reference and return.
>
> Changes in v2:
> - Fix the race window (sashiko)
>   set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.
>
> Changes in v1:
> - add usb_autopm_put_interface after usb_queue_reset_device
>
> ---
>  drivers/bluetooth/btusb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6f7946709266..61c18402911a 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -1068,13 +1068,15 @@ static void btusb_reset(struct hci_dev *hdev)
>         int err;
>
>         data =3D hci_get_drvdata(hdev);
> -       /* This is not an unbalanced PM reference since the device will r=
eset */
>         err =3D usb_autopm_get_interface(data->intf);
>         if (err) {
>                 bt_dev_err(hdev, "Failed usb_autopm_get_interface: %d", e=
rr);
>                 return;
>         }
>
> +       if (test_and_set_bit(BTUSB_RESET, &data->flags))
> +               usb_autopm_put_interface_no_suspend(data->intf);
> +
>         bt_dev_err(hdev, "Resetting usb device.");
>         usb_queue_reset_device(data->intf);
>  }
> --
> 2.55.0
>

