Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA88C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=; b=KQcuYVTVefw2+lvlWn9viYP0mR
	SkX8JzviLjLiImIW9En/BbjlttJzgh3sH0X+zgWSOTi98s2Qnh926vaB8s0zGQduJZ8aXNqIv16+e
	SoVPMYRdPrOJoZ3niQ+hJ1zka+sU1ha/CWQGzz01Bz54ESOvTontx06se1cRFagfak6ilchS8mIDv
	ou4NA69DSukY5krO5UTY3Kgj9roXkzutMh1j1aIumRJylEpUBAXS3WO8YT+o/m1tJMVuG3Pp7yIj9
	lbDquLarW4d24MbnG6pChoYxqgwcjA7WGGx0AY9Vy/SphZLBhXPrX88z9AUrriKAdfR09tBwipa/5
	JFulplzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIrc-00000007wSz-08H5;
	Fri, 07 Aug 2026 11:35:48 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIrZ-00000007wR7-284B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:35:46 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-6682259cae6so3614173d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 04:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786102544; cv=none;
        d=google.com; s=arc-20260327;
        b=M06zj7WdABA+DdSzLLpMSyuGllC+eKGnmilwnaf+WpbSeQELTh5oWPchY/7jvxXFdO
         Ui6damwCD6tHGhlOv1lDXCbJRDHNO9e0D7DEyJU+WPTqXcmvYnLRzlDlBvi1hkH7H0p1
         MlZ/FTJ4OcY4OVoTib0BRDeug+ucDNH2xI8UincD1B8IBkMUM1tE86rqNOFvBM7jMxid
         XiItrzBdsc0mBEKoWjdWrBJ6LyExGNj9+K++thAGVaJbPNGfpD+Dmp9ui3kVZuKlW7Rj
         kT/+boyzeMPSHethW5ml5ooKWGZw1T0zRM4XMdylfRc8TX+6VnaImbM74jegRI5tPAXk
         Q57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        fh=qcKJqHM3Xm24SS8dplNJor+EfYN6RELET8xYCZ0Juk8=;
        b=GyjElfovXTLXuyCElNDoByYOY05Io+g0QZnUPYWxETi40aKrIwMVfWg0PtKKkoM9GS
         D+xeLPig82ULElDKNLo1oa0/MZrk2F7nQTi6qxGNt7H8SmU4P0emmyxKQqVuzCjwSHZL
         U9ufyzvCA8OE1TrBRSnIKuZ12JzcEP3XF0Pi3wP1Vj/s7bxwcJwcZOZMLyqAJy0OGhiY
         j8RxsIkmdTqMQQAmtEI5ORQmTP4X/OjKAXeHPmMbOQBvCXGiSWn/D3n3/M4++R65skrO
         LwxFdo8Qqmxvl+ldSZgzkOWPRTogf4CCm1MpUnljmK3J/fjpTe0FUCkyxUQL7Eyxac6j
         pL1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786102544; x=1786707344; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=GG5QGJWPxTbLpInw1o0XIVMDkXgGOgWbTUiJyRnfVqF/NJC8znKjaChX9jFuuisYIN
         SV/77/FspVqdv+OSbH12U/ei//c7SYeq9WgMC1aSxSkD8SGZSJ1gn5mPD03DvSJbSl6W
         TsOw1XDnBAGmlka7X3m6VelxrITJdec41MaUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102544; x=1786707344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFbpeccrBLnPNDngnsLUG5X8Bi2l3FjgVOiCpFS3kpA=;
        b=f7weVmQxygbkyHK/ULgTj/ubjxvCXq9eBbA2PqfqE923Klext6ola+o2wg7yNqm44W
         aCetshckRryIcIbqCKhSESG+VNCw+3bgb7lmwD8axJCnu2je4S7RMIWqpCNXUx9KOj1V
         xFml+GDsPCzoa5sLBpdcakWe1Rhs9rmB5g7jb7NXHLhzVFcS+5gy1oVOdMZwHVPGdjdI
         DHpe/ro7ANzhHsGhyfCLM9UGTgePMeiDesj6t6+g8zlNoRh+ecO6nnQ3vQR4bWPIEYWi
         Z358cz2MSPNT+yImm11WMTYx1kc9tcpRBIMcZdSfSNnol/YJOHLBLqkj7oohE9NdEsE9
         LvWw==
X-Forwarded-Encrypted: i=1; AHgh+Roq5xZa0eMgbZDhQ71SGiBiGS0MiT3JMTfNqnGrfTkkwnnI/9Om3mkPEJqOrSqM7avv+0XZn0Mr9kwTYTv5VcHM@lists.infradead.org
X-Gm-Message-State: AOJu0YwCRZUD1RViWkw0cpLkEKkoBG0ia31Swj0DXLqWj04VYHc75Oer
	m2GQNGPOydKch3LDXoie43EoqW5GECSlzIPkpzp1eSukCb27KijRWhVj9UcuU2Tlh2vsIvvf3D7
	CA0TgWQgk7qq0P9sJlLXL1g+C0iSWYU8GI7aibu0a
X-Gm-Gg: AR+sD10k7URPEcC76gor8fWP4ba9A5Jtq1qEuCZfXfEd6kb9lZ8nm2/XqvOk2iDOYz1
	8dfoeMv4Gb6v0SSrwHojYR7zN2FKbf7OJfNPxMIVKFMeJE0mpIyiuys1KkVvN5oks0BGwO1wRUo
	VAsTGpa0rZv+ECUEfPJBYPvjSnr1STntBvS3HVZZO05OYg9L8om8D8bUcMDdgRA3Vmp/YxeVTs8
	jRT0m18BTR3iTfM7gnNMIaQFOQoAigYeZKIJ255soGTlRCBy1BvoiItn7PESArc7S1VW/WfNPbf
	uK/oZgCojLQYl85K2FB8uP8E/Mdy+1jMMu8gDSMmxCohmp9DTll6WHdFb9baK2JM4lYPkitEtD4
	6LIeY6+/PDQ==
X-Received: by 2002:a05:690c:480b:b0:81c:872a:5152 with SMTP id
 00721157ae682-82022510fcbmr127613327b3.30.1786102543795; Fri, 07 Aug 2026
 04:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org>
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 19:35:32 +0800
X-Gm-Features: AUfX_mzUutrA5-Q9ACqE0pQ_D7Us70orWiV3KcyO1fjFDW5_he5R56G8cIzEovo
Message-ID: <CAGXv+5ETE2WAA8jwnQKSe69aR=qrqKnALuiSM12X_ZwFouxdRA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_043545_570900_570E3575 
X-CRM114-Status: GOOD (  21.46  )
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

Hi Mani,

On Fri, Jul 24, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Hi everyone,
>
> This is v7 of my attempt at integrating the power sequencing API into
> the USB core to support the USB connection on M.2 E-key slots. M.2
> E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
> Hopefully this is the last revision. However the pwrseq patches haven't
> been reviewed yet, and the fwnode patches need a review from the fwnode
> owners.
>

[...]

> Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
> driver. This is only used for the USB target, but there is no attempt
> to differentiate the connection type. The driver simply tries matching
> the "port@" node first, then falling back to the port parent or device's
> node.
>
> Patch 13 reworks the power sequencing targets for the E-key connector in
> the pcie-m2 driver to add targets for USB and SDIO. The former is used
> later on in this series.
>
> Patch 14 splits the Bluetooth power sequencing unit so that the USB and
> serdev consumers can separately toggle the actual state of W_DISABLE#2.
> This patch is purposefully not squashed into the previous one to provide
> a clear target for discussions.

[...]

>   power: sequencing: pcie-m2: support matching on remote "port" node
>   power: sequencing: pcie-m2: Add usb and sdio targets for E-key
>     connector
>   power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Could you take a look at the pcie-m2 patches? These are the only ones
that haven't been reviewed.


Thanks
ChenYu

