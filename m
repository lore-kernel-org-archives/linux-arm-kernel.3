Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54021F4199E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=; b=HoYKWcjkzRsulPIDGSuaQ1063K
	Xq50QrpwBIwzdNOi1ML3etLv6BCf5fqLcavmsw6mqSRp29oM2w5MHt7SEidl22ADKIutlgyDUw9vS
	ks47if5WUQmE0gVppVyFhQlhywDHsS42ipxkF2Fm+mE8pT2HG66GQyiBoMVXTiCA/Mp+0eMJdgTns
	PbMV6tdggfbbygdQUTaiZqKpADEPHM82OjBZFxXu9lqzTTyCPEgMGo224QEeMgYDqHYAkxOtIRfV1
	yIRf9MNrCf8s7zkPDtH2mbl+EeMYyJCxvA37lKcQ/VexW108S3+Yo7Kwxrl08SIGOfhTZAla58x2c
	a7va7fmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzRa-000000017re-3qAG;
	Wed, 15 Apr 2026 12:34:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzRY-000000017r2-2Xff
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 12:34:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ad9516a653so33908575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 05:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776256447; cv=none;
        d=google.com; s=arc-20240605;
        b=j9umtxG1eYYpX2D0A61pPz/KLVVPPmkL0nWC8zSDS1vdYoybultYVaaUFN6br03jMo
         GbqmyUED1b2deIco5PlAAcbt2zcMEvkh2N0IMmrwWp6G7ya8h+LH2h1igL0ar1ZzH2Ei
         IASdbWyrxZCY4ICXwKVa8oV+pw4SY9DebxEjtpSAYIu86tYgtVZcX4B6lVOvtvhFHeN8
         5INqYNZioPeA+/+ZBZm8Icvp3hmofHd3bdlEC09xglzzjQxHYJaB2hMxzs45fjcqiW/a
         iYVZUeNvE+FbZhjaMyyTbdjsAY6x//didP83c/SIR/kFaHsKvrbN8Dt1X2iP8IQqABK+
         xhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        fh=rcwRltrQC683vfgws/blKG2rIZXQE7+DUQZ1XaETovs=;
        b=imTuY9aH5zVLR+niAQjPxI3/UCWGJtuIYaSA3+7Wtr3ZGD6PijAu/VhrSGq9DID/5m
         265TmwJh1MLTAZI8O0QydBj79jnInUO2FEsNonatReZjy8YKlym0IB7DqVt96Rp71cJQ
         kjM5ylGGBjs+GK6xdkOsXhW7WKF4Mtn4NTACXgNtbbTHjaaTQgxGAzJVxrt48dVp74fn
         sl6PV+q0yZDpX1TS4fh9MVKeb1zRjjVkFOsrr1+QRLCx17w4LZJNuXA2e2XBmWPLZWOd
         beJrUAHp02jIvNr1QzbchEbSi9eGPSkg3Fl6LpHLaHfZ//y6LXkPsycIR2dd+qBfe4Ns
         V+gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256447; x=1776861247; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        b=ARw/m+Svyd5mGc9fbR19L7z/FsaQwQ0OTosZhXPdokyZ0EngOzs6T7irdkR/UnuuFo
         6+bIxRTb+i7WmzMyw3/Vk+xHbYV/fgoUAZLaWep9e9akLW/M3r/Tm59WhLk1RlDVl+xk
         9eWYxOf9ivx49gtrQoU96avQXmTifjzS3tW6rCDh0G+eQLD3QTDaT7Nnv6+FfstzSp4f
         gYLfN0rKILR0GvJCEhBmn7jG1n0Ccb3oF5kfKGDC3+aOppM6YWXqc9H7oCRdmuAJ6UiZ
         fjQo8ma15ouaIYROrg/axz66t+CVYKZF1NiUg41eMn3lDqHL9MFxcCEcxHFChc4wFZPO
         b7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256447; x=1776861247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v5h0WGA6GciBmySthgQ0LZ+Ql4Vyrp/FXGCtEgGi0I=;
        b=KWqfCflKkGhpxL4DhyJURmsXZj7P3Ln8nwskw02UO/vVXgPC82nvN2Z0HGVd1URx0k
         2Xr6j9Fdqr/AC9jpF7BiyIYPfgvTC2zXtjlax2+GdIqJ4jiLoSSte4X8n4hOrIFKtGRS
         M7n9njAuWYa8mwHp7Gbf3BYVckjHUPBeuBGqHfkEk+4j+GRQv/P+wVORI8cfDgHlL3ef
         mxXPK9LuAuEOcLRxcxUYbD2CHiNrJcBlD8fgLQJL5gu2x4gY58l2tB2TD6Ijgjn4KARs
         SDX/E/UeWLDW7wsNcmSYjH26akQ+tRjccIx0xQV+4rXW+yX4aLvQTfgLxqdT9c9AB4nz
         1L4w==
X-Forwarded-Encrypted: i=1; AFNElJ+yRNwc5MXjNVBgrmV7KNiQG6QLmVhCEWjkQn2a+Aw+VqN2ud6kV4BmMnZy040igTdgLjxU/YPGmDqWXTf3Zy+v@lists.infradead.org
X-Gm-Message-State: AOJu0YyJS/BsxJ4/tewQX3C0gHhhd2ZaKrzEFGCDJF1IhK/DoVCNAJvQ
	z8VZ0EzE85bZU02hN4zjjxhP3BvPtu6L9r59Vdp77OiSUH0fQRxzFHLvd2+ZwjvEUIJtWGPPJls
	vR9kOmhXnWs6mQtsEF9cJOba32WZ7N6U=
X-Gm-Gg: AeBDieveZCYhh5YaVwFPZtRRp+DDKwMtyIWmiuabDEQ+bXq1/fTNB+iJD4zBfqXy4tg
	706qx8EKGdrl/RpjQAFOu01h9eCh5leHLMUS9P3iVlucC2+FerIoNIWLImAVdAHarGDsFElqcTZ
	ZstU68qlWX7YbOGsxzoOVnPRMqbLcd20R5vIAFSwfymKrNNEUSna8hGCGaN2n9YZlTOINXqGuO9
	I4dZBPtwdpKBhYu8IDPAcaktH1tqyqwS3j0EDdg5eqY7VdLhg67AJWGELyQu7nBpigHXIIVbtQV
	Evm0VXOjG0ShZNkOEDKgkN28g3fAjw==
X-Received: by 2002:a17:903:ac6:b0:2b0:60db:7927 with SMTP id
 d9443c01a7336-2b2d5a168bcmr221211305ad.28.1776256447117; Wed, 15 Apr 2026
 05:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com> <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
In-Reply-To: <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Apr 2026 14:33:55 +0200
X-Gm-Features: AQROBzCJwjrc1bDi-TXhcjD-wf65qYVngCDiW7f3UZYU9kWetoIg3teCKW6NkdA
Message-ID: <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_053408_645766_4559B86E 
X-CRM114-Status: GOOD (  15.51  )
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

On Tue, 14 Apr 2026 at 16:00, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
> > +       if (sock)
> > +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);
>
> This is more complicated than it needs to be. I'd just add a new
> callback, `hdev->set_priority(handle, skb->priority)`, so the driver
> is called whenever it needs to elevate a connection's priority, that
> said there could be cases where a connection needs its priority set
> momentarily to transmit A2DP, followed by OBEX packets that are best
> effort. Therefore, `hci_conn` will probably need to track the priority
> so it can detect when it needs changing on a per skb basis.

I have tested per-skb priorities, and unfortunately, this does not work.
If something tries to send a low-priority packet (for example - a volume
adjustment), a priority drop causes the same kind of dropout that is
caused by scans. It appears that the only way to make this hardware work
is to set the entire hci connection as high priority for as long as it
is being used to transmit audio.

