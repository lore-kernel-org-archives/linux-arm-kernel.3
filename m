Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D1810F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=; b=zEr6R4CXCKJHQ93E4B+Fa+x+Bf
	qc9Dn+HGwRXJ5hkVFTXfAyZwrgzl1SetVRFF+kcjB++PsxVoT4k+wNQaxq/3p0WpmhMwT7vOezAur
	drc69BSOsnxqR9pXlLmsfod+ipA6BOjtVzDPeBO3PL3N1bZpe8ofsqizkrLiK+41dMeOK+8+Tqi01
	yBD1zYZt40peDthVvC8MPj99KA9bbdccMMrA3wk/AK9iarBFzVD7/kvbVeSCGTCUg893+4kx5ja1x
	/LiueVZUAbh4tusaELZWPrVFA1P4Pyw+7O3ycho6lChR/qIOyQF6et2R2gaYlI4SYmCJgaSALPUth
	7iMtfFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BSD-00000007u45-3CCj;
	Fri, 27 Mar 2026 17:58:41 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BSB-00000007u3T-3dAt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:58:41 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6500040ef85so752717d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774634318; cv=none;
        d=google.com; s=arc-20240605;
        b=QkW/zwYlQ9+uvKukMbo3N5QLeMUWBocqO2pQ7DtE1lawD1ROuBU7qmu6dFHQlOOtEH
         iHlUtjryqulI7Lf/wl1DEUTxZWlsgb48G/Y4D36+mcmB2jNp1/7CUeZrwfiRbO9i7g35
         1eKyVt42qi3ReN0YCpvi8UpDpZIIzPqaGS1geev1myKwhrIIYSNCzwRvMy8PkJ8pqkwT
         5udtpgK6q/1wxjN/Pf+2nvG440t2wgCuZWNmB39ywT8fW2+ue23oDf9fr0n/mzfD+9QN
         rrmcRlAw9Dy0ADWfADETFyKU+/fBDWx/31FQsYllsd1J5Mb6svTQhfeW97Wt9TJbeeYo
         s7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        fh=Fb6vmO4XT9SXp0nApfOdsz2jOTPdQjIqfhjaVYYTfQE=;
        b=gKGbTDoIbACvwHTwmz8L7f/qhmtq/PMo/Gm4EzyCexUnsiAfvH7Z+zD/vsMbEAe4CG
         r3d+BhYRSYcgfn9P7yhK5lW8E0WLTj5S1mqw2aNcHxau1tsIguMTJ43Rgvz7h/HlVKro
         9uYZMT+DpgjgzoDwJxGUXjEoeHCzglCM521ecYeJdpoXFQqAV0Bee1ui93W1hMJGXOOF
         lrZ+iTJuZs1ZKSUgeDcEd8V4CeFns4xBYOExgS+G9tHCnI+V4k2+zXdOAto+QQsG8OCd
         j44ha9m1tRN/4//Ij40S4kjADRik9sV18G60lLjxA2skXaNfACqh2+ArWXx8NvFmN8Bn
         o1Hg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634318; x=1775239118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        b=X91eCEkT4skr297OMCHI0XsBteOaiLaB19S4zZAdkXB2ZAJm4p75rkF/HjU2FAWx+w
         EsiHc55myIdeECHfjdm516P7bh0VYeNRwU0e82H6SHOi1PPWsUAJ0yg6wQpwk9paFO1H
         pN64rJJx5A4jIIX/Gqys03Z8M2bZuhAwaS9UG3mKS0ow397ra2Jdg9/djUUaLspJuzXZ
         olE6pqawNK+ch41eMeHmf0HQhxXbpdqlTmRrKPc/2iIK8Wos9YfKRE/CH64G8UJGBSJe
         uZGYaz41uf1Bf/7JYzddtduwZaht0qNuSqIczGk7z37mBry3eMGrzesxHODrp4JqLLMv
         txqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634318; x=1775239118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LslZTbQuCgzCpaXkkqU/ikNfkg2VIP9zaNKZdPAylrs=;
        b=E9lPyB4PzSO3lxRmUkqSt1Qs3idK3IH2v6XTsJDLZexoAiAQyOm9WQwRctBbzJkmrt
         Rwc5mCfOaR66P/Yrf5lPUSmH6QJgYftEAeSXczqwkDmJqOlowyHyH+T3LgV49TczsvR2
         JtE6MlKVVI0pYcRnE6bwVj+UrFc1F8NOfuH+CvBze6Y3fVcAmFWQDTChjTgELSu6IW2+
         CWF9oaeIgYNPNiy438IFOh04tQ6XW1qjHJXl3mTwJkJYzHjG6x7IWy4pvwvMJjPMu9eH
         2IcIhIb6534XJTpMvF5k/+e6fjva+U9znlRDlDFxd6jt+5UTsNuLQO1ubYcKGodKKD2j
         lT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrtU47H2I1hA+FZnPpMR07VdB2t0tjC9rfLosTSdg33peAdfjA6zDsLWUguiOkmqfqOtewanM/gtI1CWyZmPl4@lists.infradead.org
X-Gm-Message-State: AOJu0YwcJyparH7mjHWF3SeRH8VLkO6zuSv8tcnqwrIcEkwkOox4x34N
	oysQXe2SMiZmqIGcee3RiKugmAE1CAlFwaqYsv7E2vc6ms4zE7jsL5ULIlmzeqtCQy9WHe9yvFQ
	tn2XbwQl3jnIl+7NqwVtEh7t4m3eMjWrfmNhsxC4=
X-Gm-Gg: ATEYQzyBLDqXGaGhFwUUVobv5T7HdUUggGhN8TspI8Y4RxkZUtu25Uk6RuLS7jI5BC5
	VfiyxR1UnR3A2olRDpJ4PsA7do0EWYSdpMwsLtSSR9z1rdTeOL9V9CsbeP3A3zwHYhPxx0OiikC
	JIpZkj9xale+VWVoVYkLoQOs/TDf+9ZZ0gFAl9BkG8Nqho6OyYS3lZggkK1/F3elm6taFbuBXHH
	DGNSWdLA944axavJwzxUv0NakYAnf+5fxcRvBWFpu3L/dTOVtcHvLyBrPtMixFHf4iSaySA/mEa
	bouG9vkgRRcEU8Z7zCZaE7wqFwkbIbSF7ftwCcUvgYofklucD3tUP2OSXi3oTN5HFvIdZ8fqHw1
	XDR/N
X-Received: by 2002:a05:690e:d42:b0:650:509:1b07 with SMTP id
 956f58d0204a3-650050923b4mr1392484d50.0.1774634318385; Fri, 27 Mar 2026
 10:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <177272816248.352280.12453518046823439297@jetm.me> <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
In-Reply-To: <20260326-mt7927-bt-support-v3-0-fa7ebd424323@jetm.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 27 Mar 2026 13:58:27 -0400
X-Gm-Features: AQROBzBLmQGFzRqmnDnZOf06xEI8m2lMtSggZgTni-ORGhpk4NTmt_2iIVVyT1k
Message-ID: <CABBYNZJLQ99727+3vnKscsDwgTnuP0NijWr9T=YWBpdq7giv7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Bluetooth: Add MediaTek MT7927 (MT6639) support
To: Javier Tia <floss@jetm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ryan Gilbert <xelnaga@gmail.com>, 
	Jose Tiburcio Ribeiro Netto <jnetto@mineiro.io>, Llewellyn Curran <melinko2003@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Nitin Gurram <nitin.reddy88@gmail.com>, Thibaut FRANCOIS <tibo@humeurlibre.fr>, 
	Ivan Lubnin <lubnin.ivan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_105839_929676_38DCCFC0 
X-CRM114-Status: GOOD (  27.87  )
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

Hi Javier,

On Thu, Mar 26, 2026 at 6:13=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> This series adds Bluetooth support for the MediaTek MT7927 (Filogic 380)
> combo WiFi 7 + BT 5.4 module. The BT subsystem uses hardware variant
> 0x6639 and connects via USB.
>
> The MT7927 is shipping in motherboards and PCIe add-in cards from ASUS,
> Gigabyte, Lenovo, MSI, and TP-Link since mid-2024. Without these patches,
> users see "Unsupported hardware variant (00006639)" or the BT subsystem
> hangs during firmware download.
>
> The series consists of eight patches:
>
>   [1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
>   [2/8] Bluetooth: btmtk: fix ISO interface setup for single alt setting
>   [3/8] Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
>   [4/8] Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
>   [5/8] Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
>   [6/8] Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
>   [7/8] Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
>   [8/8] Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Cre=
ator
>
> Three driver changes are needed for MT6639 (patch 1):
>
> 1. CHIPID workaround: On some boards the BT USB MMIO register reads
>    0x0000 for dev_id. Force dev_id to 0x6639 only when the USB VID/PID
>    matches a known MT6639 device, avoiding misdetection if a future
>    chip also reads zero. This follows the WiFi-side pattern.
>
> 2. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
>    "1_1" used by MT7925 and other variants. The firmware path is
>    mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin, using the mt7927
>    directory to match the WiFi firmware convention. The filename will
>    likely change to use MT7927 once MediaTek submits a dedicated
>    Linux firmware binary.
>
> 3. Section filtering: The firmware binary contains 9 sections, but only
>    sections with (dlmodecrctype & 0xff) =3D=3D 0x01 are Bluetooth-related=
.
>    Sending WiFi/other sections causes an irreversible BT subsystem hang.
>
> Patch 2 fixes the ISO interface setup for devices that expose only a
> single alternate setting (alt 0) on the ISO endpoint. Without this fix,
> btmtk_usb_claim_iso_intf() fails with EINVAL, causing ~20 second
> initialization delays on 13d3:3588 devices.
>
> Tested on:
> - ASUS ROG Crosshair X870E Hero (USB 0489:e13a)
> - ASUS ROG STRIX X870E-E (USB 13d3:3588)
> - ASUS ROG STRIX B850-E GAMING WIFI (USB 0489:e13a)
> - Gigabyte Z790 AORUS MASTER X (USB 0489:e10f)
> - Lenovo Legion Pro 7 16ARX9 (USB 0489:e0fa)
> - MSI MEG X870E ACE MAX (USB 0489:e110)
> - TP-Link Archer TBE550E PCIe (USB 0489:e116)
>
> The firmware blob is being submitted separately to linux-firmware via
> GitLab MR !946. The firmware path has been updated to mediatek/mt7927/
> per maintainer feedback.
>
> Changes in v3 (suggested by Sean Wang):
> - Scoped CHIPID workaround to a static VID/PID table of known MT6639
>   USB devices instead of mapping all zero-CHIPID cases to 0x6639
> - Changed firmware path from mediatek/mt6639/ to mediatek/mt7927/ to
>   match the WiFi firmware convention and avoid confusion
> - Added MODULE_FIRMWARE(FIRMWARE_MT7927) for initramfs firmware discovery
> - Added Tested-by for 0489:e110 (Nitin Gurram)
>
> Changes in v2:
> - Split USB device IDs into per-device commits as requested (Luiz)
> - Added 0489:e110 (MSI X870E Ace Max, new hardware report)
> - Added ISO interface fix for single alt setting (13d3:3588 devices)
> - Added Tested-by trailers for all USB IDs
> - Added USB descriptor output to all per-device commits
> - Removed BTMTK_FIRMWARE_LOADED skip logic (Sean Wang)
>
> Link to v2: https://lore.kernel.org/linux-bluetooth/20260325-mt7927-bt-su=
pport-v2-0-b892a3252880@jetm.me/T/#t
> Link to v1: https://lore.kernel.org/linux-bluetooth/177272816248.352280.1=
2453518046823439297@jetm.me/
>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
> Javier Tia (8):
>       Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support
>       Bluetooth: btmtk: fix ISO interface setup for single alt setting
>       Bluetooth: btusb: Add MT7927 ID for ASUS ROG Crosshair X870E Hero
>       Bluetooth: btusb: Add MT7927 ID for Lenovo Legion Pro 7 16ARX9
>       Bluetooth: btusb: Add MT7927 ID for Gigabyte Z790 AORUS MASTER X
>       Bluetooth: btusb: Add MT7927 ID for MSI X870E Ace Max
>       Bluetooth: btusb: Add MT7927 ID for TP-Link Archer TBE550E
>       Bluetooth: btusb: Add MT7927 ID for ASUS X870E / ProArt X870E-Creat=
or
>
>  drivers/bluetooth/btmtk.c | 56 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  drivers/bluetooth/btmtk.h |  1 +
>  drivers/bluetooth/btusb.c | 12 ++++++++++
>  3 files changed, 66 insertions(+), 3 deletions(-)
> ---
> base-commit: 50003ce2085a7f7dacf2426065d1a69c84b5b963
> change-id: 20260305-mt7927-bt-support-6589a50c961f
>
> Best regards,
> --
> Javier Tia <floss@jetm.me>

https://sashiko.dev/#/patchset/20260326-mt7927-bt-support-v3-0-fa7ebd424323=
%40jetm.me

First one is more concerning since it may mean it can lead to crashes
with SDIO driver, the other comment may actually need to be addressed
separately, perhaps WBS handling needs to be fixed on this family of
controllers.

--=20
Luiz Augusto von Dentz

