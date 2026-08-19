Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B252C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRAkgPHFku3K+qajzjnPibaXiy9bxH0hoBjsc6qNOtE=; b=D/VU2z/V9HZawEVuF/I9CDNUZx
	EZke4COjxXwYmrE8KbpY2GBpGCyo+sgMcJabNTOZDrmdFv4Kr3iwmtI12DHZMybK64AIYKKfDZDiO
	KwUXops375hhpbaoJrGXNcxDqXZDSy1bxwfOvmOVOBHeg2A7IoAZvM2a9olOD0KG+SRPf/iG1Yf9g
	es6pNib4nX/q4W4ouqbt2pnAcBLsBhRbn5oHRHwLjhrQ5MOshreMnsxo4mPr0z8H/iCOxF2yyA/61
	p1yzhzqRUjW3iwj4f425L4R5vTytQPRvdqtktxAnzDtMzh3BtsGRoH/hJOPUzLlnhcZPQFWbtCv3h
	/nc5wBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjGc-0000000ACSG-3jml;
	Wed, 19 Aug 2026 16:35:54 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjGZ-0000000ACQx-219p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:35:53 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-836cb2fa1bcso19141847b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787157350; cv=none;
        d=google.com; s=arc-20260327;
        b=rFjLrpxm3+H5kzI7vTKN4drJhbNLIgZFtV+gSM0HJpuVzq9ATf4q6pqREAkKAERVag
         GSd5vYk4HxgAIDjLxZb4Ep8ZstdEVqSVg+AiIhKss6Xbo0op181BTxiYurR7pCnI81Dd
         LDkshfKmw1a/ng7SfqrCUrxz5Fe7Wp6UemshVVY/ud136JdRxjiMNbmt+ergkpLANHri
         lW9pmnf6wbsPmKn45PTjG9VTOBU+7ikaADQGnyHFSwmTu6V2Nnf+JNS3SESy7F0BBDUR
         /D3ole9M2waszxylYbHZsRyAQaIDC7maQhnIAyooyhTJcOpI8+sRXMMYTbeEdUMOZFef
         JGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TRAkgPHFku3K+qajzjnPibaXiy9bxH0hoBjsc6qNOtE=;
        fh=aiTa8oEPSdk0Z+lWTJsZ4lqbdMlL3g0GAo089gdXsrk=;
        b=rqGZjhLzWvUbaJi6lP+Hmogxi1jUc/DQLV4fVtbW9ymvJnVgbA3EtY8wuCThC8IWf/
         fuvgi8mk+QrRRA78Aw6zjXoodraRN83PfV3dx8japM+ckhS7/Y1Uh8MRpu0OIqylXcsv
         fCVDALVXk1K04zrAvCO5/ItMEbc61XoFBaC6TPzyMAVjZg/xbHjZrL62usy46ody5EIQ
         aP/xl/NpSU18R1dNwOMLUW9TDx4WJJfG2JO8N/VpOmj5oHqq8d5gdZhzXPCo7/981ntm
         0c2ppyc4gX+zQmqO8wRpRSNNZET73vm4yk9To1L2mvCp65P063rZsJbyUCDjA2Cpjw/W
         3NhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787157350; x=1787762150; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TRAkgPHFku3K+qajzjnPibaXiy9bxH0hoBjsc6qNOtE=;
        b=U1jX51lwMTpxJ69Rp6b3JUUjhVeD53GisTHdy0O2MqKQ50iFAbFKZP/8jgD/Jc/z46
         7QHXQKR2CpvpPQ+IZgFNkiM8dfknZCLIRIUOT9avncRRKpX/Nl6oaT2/IzFo6CP7Ai43
         EFNOy3Hp62YB+CnzUUGh6FPCP8L3JNRp2L5oD3cX2g63qem6DdMh5qysEmLNuvIm0RXh
         VaF7cPNStXt68MpaHOZflr/AjXOO8ZUEPS0lrP4X/U4PrSSuUa+G4PVx30N6Xs2LQYtx
         ZKvLmZMYl4eV7VHjFmEjsk2k67qYZrU1UTb1ahkmy2zHmUlkfQlewMprVYdZtRaidoGW
         sYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157350; x=1787762150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRAkgPHFku3K+qajzjnPibaXiy9bxH0hoBjsc6qNOtE=;
        b=YRZVC/eEGfJDOCr985i8zlqC97tYyG5v/oBDsLvFaVH+u2QvkCpb6eE2IKTG5oJFFc
         CXHH/pYIQP2Mnnbak2x7G1TmfvsTeBFDiThJZ9g2HDGsEaIApEZJDh9/u4kh2Bwnm3vJ
         v3eXOeqN7sj8iS9oEN+wVsotxyJMP7iNPeSK58QryiMJYcm1yVps6xhOsj06Dnu7sz7c
         6xypOdYHpQ5aeehbs8+X/Lj7sKfDy5A1HwIICBV2CkDBuVHex4saRF0riACCr4WITaZO
         xT7KL8NZr+bkQ1TH5sDVoC+c3+W0DFPDdGUgXzuJpuRlw6tfaH0M2XAfbw+UipG5VLbd
         kHBA==
X-Forwarded-Encrypted: i=1; AHgh+RpMaUQB4WKPfudBtJSXAMf0gZezjREntmGFH+CBw2iuSAtwLQ3NtGq/lSuO5rZIpsLnfVMdxGsUXJtES4Cm+sBT@lists.infradead.org
X-Gm-Message-State: AFuF++lN/JBEkEVGyX+ZKA05WfSPVguOr4e/6es+27SIgKB+KWI8QyMZ
	xtCVxzFTuq7fOmxF/69rtbwSebDZRVeNqbHcj5UgbWMogASyCZK6t8o5xnLrR77wJZrvbwBu3tT
	hN8BrfHVp1hSdmLfLBcdrMpGhlsrgHZ8=
X-Gm-Gg: AR+sD12nP+IIHdbkZ3yBX7AiBOwoNmdQOt8atgPTSCKBZwZubXbP0yhqoyxnWYzjhKK
	lIjxcPazFbiGWYfLFSZlgw9kNZFdRm0z1lczdQ5xnXdTgtm+wssamauPG7EWAO96YG1fHtyeXpW
	3kwXwoOIPwjfIECLi5jVbedSO65I0Z0C4V9c397gECK9riMnewaWVqO4hkY27EPwuVJ3BAeeUDc
	zxgOJjlF7ynl38h8rmlCl5RTcFzoDGNlJN/lMXqMKjHrW5C5NyCZBKRObP+QbW4zAb5+w2WfZ0q
	PcOl6xw5c4Pg0r4if9ReIwCVmwqnIAWj2LmFxzZVGEMvFmrqWcJL6aYcy082Wug4t/F+PXCuC6C
	GDucRUnrihS2hitkj0nWqFF2oWrFi
X-Received: by 2002:a05:690c:e284:10b0:81f:a7b5:7f0e with SMTP id
 00721157ae682-844e3d5b9camr18778167b3.26.1787157349722; Wed, 19 Aug 2026
 09:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <ec23dae6c247005e8eccd312d326a626163ea491.1787132512.git.liujiajia@kylinos.cn>
In-Reply-To: <ec23dae6c247005e8eccd312d326a626163ea491.1787132512.git.liujiajia@kylinos.cn>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 19 Aug 2026 12:35:38 -0400
X-Gm-Features: AcwNN1W6XuOgeA5e2OhnPyTrBuVGeEQINGGnNT6mDgRFvBtgWJXRQOG9YTogiw4
Message-ID: <CABBYNZ+Ow7XQTpM6gO_x2c9Z=jKewXk=dknxX6Ly9QZdezi4zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Bluetooth: btusb: mediatek: Fix leaked runtime PM
 reference in reset
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: Marcel Holtmann <marcel@holtmann.org>, Ying Hsu <yinghsu@chromium.org>, 
	Archie Pusaka <apusaka@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jing Cai <jing.cai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_093551_528383_EA6C2FD6 
X-CRM114-Status: GOOD (  26.37  )
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

Hi Jiajia,

On Wed, Aug 19, 2026 at 5:52=E2=80=AFAM Jiajia Liu <liujiajia@kylinos.cn> w=
rote:
>
> MT7925 on HP Pro Mini 260 sometimes timed out during reloading driver
> and reset usb device. btusb_suspend is not called again after closing
> bluetooth interface.
>
>  usbcore: registered new interface driver btusb
>  Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
>  Bluetooth: hci0: Execution of wmt command timed out
>  Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
>  Bluetooth: hci0: Failed to set up firmware (-110)
>  usb 3-10: reset high-speed USB device number 4 using xhci_hcd
>  Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20260605184935
>  Bluetooth: hci0: Device setup in 1856545 usecs
>  Bluetooth: hci0: AOSP extensions version v1.00
>  Bluetooth: hci0: AOSP quality report is supported
>  Bluetooth: MGMT ver 1.23
>
> btusb_mtk_reset calls usb_autopm_get_interface to resume the device
> before driving the hardware reset, but never calls the matching
> usb_autopm_put_interface. Every hardware reset therefore leaks a PM
> usage reference of the interface, preventing the device from being
> runtime suspended again until it is unbound.
>
> Add BTUSB_USB_RESET_ACTIVE flag and set it before usb_queue_reset_device.
> Release the PM reference in btusb_disconnect if this flag is set.
>
> Fixes: 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
> Assisted-by: Claude:qwen3.8-max
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>
> Changes in v2:
> - Fix the race window (sashiko)
>   Add and set BTUSB_USB_RESET_ACTIVE flag before usb_queue_reset_device.
>   Release PM reference in btusb_disconnect if this flag is set.
>
> Changes in v1:
> - add usb_autopm_put_interface after usb_queue_reset_device
>
> ---
>  drivers/bluetooth/btusb.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 184e95c1625e..45a726bed0dd 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -957,6 +957,7 @@ struct qca_dump_info {
>  #define BTUSB_USE_ALT3_FOR_WBS 15
>  #define BTUSB_ALT6_CONTINUOUS_TX       16
>  #define BTUSB_HW_SSR_ACTIVE    17
> +#define BTUSB_USB_RESET_ACTIVE 18
>
>  struct btusb_data {
>         struct hci_dev       *hdev;
> @@ -2915,6 +2916,7 @@ static int btusb_mtk_reset(struct hci_dev *hdev, vo=
id *rst_data)
>
>         err =3D btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
>
> +       set_bit(BTUSB_USB_RESET_ACTIVE, &data->flags);
>         usb_queue_reset_device(data->intf);
>         clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
>
> @@ -4497,6 +4499,9 @@ static void btusb_disconnect(struct usb_interface *=
intf)
>         if (data->reset_gpio)
>                 gpiod_put(data->reset_gpio);
>
> +       if (test_bit(BTUSB_USB_RESET_ACTIVE, &data->flags))
> +               usb_autopm_put_interface_no_suspend(data->intf);

Should this be test_and_clear_bit rather then just test_bit, otherwise
it doesn't seem to be ever cleared? Sashiko also complains about the
handling of multiple resets (is that really possible though?):

https://sashiko.dev/#/patchset/ec23dae6c247005e8eccd312d326a626163ea491.178=
7132512.git.liujiajia%40kylinos.cn

Or perhaps we should check if BTUSB_USB_RESET_ACTIVE (Id rename it to
just BTUSB_RESET) and then don't queue a second time which perhaps is
what sashiko is talking about when it refers to reference.

>         if (intf =3D=3D data->intf) {
>                 if (data->isoc)
>                         usb_driver_release_interface(&btusb_driver, data-=
>isoc);
> --
> 2.55.0
>


--=20
Luiz Augusto von Dentz

