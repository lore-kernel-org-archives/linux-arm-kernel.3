Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46EE109E549
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 05:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88eQUwPWNg5/11s1UwpjtUkzDcsJiKmUA2VqWZ7xx4Q=; b=mZZve9Ek1kn4f+ihGE1X38WhwG
	pMlDRf0lRbcNR311HgiOlQJrOBV+L1XMLwW/MQLxVf4CGKO6Num62DVseOtJCffmKs3Jv13EZ3MNi
	eit4+UsrF8j9JyXBH2CFnp5yuPIzI27KjO9cKyS80JhYSWLt7IrWXAghjnA6KnQ+AZI2jD712qi35
	TQOBrhAyT5CWW4cyrzm+SpZrfFQEPsx43J5qnXwYucIKFfv+Gz049995Uakjn9uEUXmj3AGDdHZ3N
	Qj1ZWg1PRfDzjX0Yoz4qcMYmK54vgvP5SqxgMc2VUQhOA0KIpkFDq9XwAzJlTWM2GvoAeCL49FNv3
	yHkhtmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cuO-00000004hzi-2JsX;
	Thu, 26 Mar 2026 05:05:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cuL-00000004hyy-0oqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 05:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 946F843B56
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71520C19423
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774501522;
	bh=TyLg5thFWaqlzjvd8zu1XKcqeTfoSr+Jj2R8vgCS6KA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s0vhoR5QLERHe3jxWNy3J1dO/sE08j7FukSfKmJVmcEiRRmXTrBf6/rfNCyYS5FLW
	 nrGrRKU0QPnU7CHhtVm9WXMENXrq/jzqdIHfANx+R9D2ELhq3SIlNS5KNYuarj23BY
	 PBAUUyYdGUCMl9CCkBjFrXjPkL83mL8lDz4YelI0nYeKgXohGE8KIG7IqIQcdASFqD
	 OwPz+IqID6L/4p0F5CA/nd0ShZsyjJdmDDVGY+jk7vkkc0Ev5wXPbdcqoJyblmUkL0
	 5M0SNSTGnzzMFKXmjxAcZHk6B/WNL+1Y2vRACoMIRCreORSy3UtnJUnWq8bI/LaL3/
	 mteRrAYYKMMmw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so3777661fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 22:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGL5+LBaTXJx9SB96v7wUAMYbFOSL/oysAlk5m3ZgJlh5mqwvWO/fROGzEWdbropdwas1GKbXlzW4C0YZ+s+MU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhcr40JrEilmRPluksBnWVwpSeFqBqeEjv3e+3yddYM0tZcIkI
	Jaw689N50kk9ZXzCZW6IQXFpExvfBmu2kOCDcGwxw/plJTdLzbQSNrVeFWhkLMPRhRtJxb8yNiu
	DK6zuvBPTb32L1zaNdb1UhsHBQUS0tZQ=
X-Received: by 2002:a05:651c:41d5:b0:38a:8602:71e7 with SMTP id
 38308e7fff4ca-38c4311b956mr22846451fa.28.1774501520757; Wed, 25 Mar 2026
 22:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me> <20260325-mt7927-bt-support-v2-1-b892a3252880@jetm.me>
In-Reply-To: <20260325-mt7927-bt-support-v2-1-b892a3252880@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 00:05:11 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzrme_J2UyzzG+7AWGU4MKx4yehgUy4biy4ZbtP9OkbfnQ@mail.gmail.com>
X-Gm-Features: AQROBzAPG2S2pavEhvwOU-i45Vxw9QY7jzh-VaM4p7aDsscxDyjnvBriDVDFaS4
Message-ID: <CAGp9Lzrme_J2UyzzG+7AWGU4MKx4yehgUy4biy4ZbtP9OkbfnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
To: Javier Tia <floss@jetm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_220525_287606_B4F38EE5 
X-CRM114-Status: GOOD (  34.06  )
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

Hi, Javier

This is already a clear improvement over the previous version, but I
think there are still a few areas that could be refined further.

On Wed, Mar 25, 2026 at 6:33=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> The MediaTek MT7927 (Filogic 380) combo WiFi 7 + BT 5.4 module uses
> hardware variant 0x6639 for its Bluetooth subsystem. Without this patch,
> the chip fails with "Unsupported hardware variant (00006639)" or hangs
> during firmware download.
>
> Three changes are needed to support MT6639:
>
> 1. CHIPID workaround: On some boards the BT USB MMIO register reads
>    0x0000 for dev_id, causing the driver to skip the 0x6639 init path.
>    Force dev_id to 0x6639 when it reads zero, matching the equivalent
>    WiFi-side workaround that forces chip=3D0x7927.
>
> 2. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
>    "1_1" used by MT7925 and other variants. The firmware path is
>    mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin.
>
> 3. Section filtering: The MT6639 firmware binary contains 9 sections, but
>    only sections with (dlmodecrctype & 0xff) =3D=3D 0x01 are Bluetooth-re=
lated.
>    Sending the remaining WiFi/other sections causes an irreversible BT
>    subsystem hang requiring a full power cycle. This matches the Windows
>    driver behavior observed via USB captures.
>
> Also add 0x6639 to the reset register (CONNV3) and firmware setup switch
> cases alongside the existing 0x7925 handling.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221096
> Link: https://github.com/openwrt/mt76/issues/927
> Reported-by: Ryan Gilbert <xelnaga@gmail.com>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
>  drivers/bluetooth/btmtk.c | 23 +++++++++++++++++++++--
>  drivers/bluetooth/btmtk.h |  1 +
>  2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 2507d587f28a..13c6e45deede 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -112,7 +112,11 @@ static void btmtk_coredump_notify(struct hci_dev *hd=
ev, int state)
>  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ve=
r,
>                            u32 fw_flavor)
>  {
> -       if (dev_id =3D=3D 0x7925)
> +       if (dev_id =3D=3D 0x6639)
> +               snprintf(buf, size,
> +                        "mediatek/mt%04x/BT_RAM_CODE_MT%04x_2_%x_hdr.bin=
",
> +                        dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff=
) + 1);
> +       else if (dev_id =3D=3D 0x7925)
>                 snprintf(buf, size,
>                          "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin=
",
>                          dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff=
) + 1);
> @@ -130,6 +134,7 @@ EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
>  int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
>                               wmt_cmd_sync_func_t wmt_cmd_sync)
>  {
> +       struct btmtk_data *data =3D hci_get_priv(hdev);
>         struct btmtk_hci_wmt_params wmt_params;
>         struct btmtk_patch_header *hdr;
>         struct btmtk_global_desc *globaldesc =3D NULL;
> @@ -166,6 +171,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, =
const char *fwname,
>                 section_offset =3D le32_to_cpu(sectionmap->secoffset);
>                 dl_size =3D le32_to_cpu(sectionmap->bin_info_spec.dlsize)=
;
>
> +               /* MT6639: only download sections where dlmode byte0 =3D=
=3D 0x01,
> +                * matching the Windows driver behavior which skips WiFi/=
other
> +                * sections that would cause the chip to hang.
> +                */
> +               if (data->dev_id =3D=3D 0x6639 && dl_size > 0 &&
> +                   (le32_to_cpu(sectionmap->bin_info_spec.dlmodecrctype)=
 & 0xff) !=3D 0x01)
> +                       continue;
> +
>                 if (dl_size > 0) {
>                         retry =3D 20;
>                         while (retry > 0) {
> @@ -852,7 +865,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 =
dev_id)
>                 if (err < 0)
>                         return err;
>                 msleep(100);
> -       } else if (dev_id =3D=3D 0x7925) {
> +       } else if (dev_id =3D=3D 0x7925 || dev_id =3D=3D 0x6639) {
>                 err =3D btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CON=
NV3, &val);
>                 if (err < 0)
>                         return err;
> @@ -1322,6 +1335,11 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                 fw_flavor =3D (fw_flavor & 0x00000080) >> 7;
>         }
>
> +       if (!dev_id) {
> +               bt_dev_info(hdev, "MT6639: raw CHIPID=3D0x0000, forcing c=
hip=3D0x6639");
> +               dev_id =3D 0x6639;
> +       }

Using raw CHIPID=3D0x0000 to unconditionally force 0x6639 seems fragile.
If another device later hits the same missing-ID condition, it would
also be misdetected as MT6639. Normally this kind of quirk could be
carried in .driver_data, but since btusb.c is shared, I'm not sure
that is the right fit here either. This should probably be handled
through a more device-specific fallback instead of mapping all zero
CHIPID cases to 0x6639.

> +
>         btmtk_data->dev_id =3D dev_id;
>
>         err =3D btmtk_register_coredump(hdev, btmtk_data->drv_name, fw_ve=
rsion);
> @@ -1339,6 +1357,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>         case 0x7925:
>         case 0x7961:
>         case 0x7902:
> +       case 0x6639:
>                 btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), d=
ev_id,
>                                       fw_version, fw_flavor);
>
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index adaf385626ee..6645bcadb523 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -8,6 +8,7 @@
>  #define FIRMWARE_MT7902                "mediatek/BT_RAM_CODE_MT7902_1_1_=
hdr.bin"
>  #define FIRMWARE_MT7961                "mediatek/BT_RAM_CODE_MT7961_1_2_=
hdr.bin"
>  #define FIRMWARE_MT7925                "mediatek/mt7925/BT_RAM_CODE_MT79=
25_1_1_hdr.bin"
> +#define FIRMWARE_MT7927                "mediatek/mt6639/BT_RAM_CODE_MT66=
39_2_1_hdr.bin"

Sorry I did not respond to this earlier.
I would prefer using the mediatek/mt7927/ folder naming here. mt7927
is more widely recognized, and using it would avoid unnecessary
confusion.

>
>  #define HCI_EV_WMT 0xe4
>  #define HCI_WMT_MAX_EVENT_SIZE         64
>
> --
> 2.53.0
>
>

