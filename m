Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D22C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=; b=XS/vpYNBn8tQWEJwM53CjNKdzx
	tqROvw3zn8kaMdk9mxUWqLO47oPbGcYZAcw2btVI1g+KsB+QcNXM3TX1d0neaYDW1+K3OhJTUlhQV
	D7gWWKwfokwfmlLnFMUM5BNb+t6L3CI3Q9zSAAMDghaQtRelmwoll3/L30wHyKrmRF75i3U3FLasN
	9PRi1VmDX055s4YzayQep83RtWFSVz3XOcqlPt9XZOWJrkmx9PLjjKPA3fzvp0MKV6W8KsACfsIPN
	JnCP+vmHIkbQ4pA+satEMhGBSDkDSd6yNo2B24KBsabseZowTvwMI0/D/N3gVL6VuS0jPXle0dLKm
	UgbDr4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylpl-00000000JVM-478a;
	Tue, 25 Aug 2026 07:44:37 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylph-00000000JUK-23IB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 07:44:36 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66d06b5f023so2815497d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 00:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787643872; cv=none;
        d=google.com; s=arc-20260327;
        b=X20yH7LBck65TIU7UVO1jvSOmvn6npESZO0wpQ87/YSu8qcVssZ8CbzOgRzSoeACdp
         lN9ZZTi7j/CvmyrZBCCQoHAvDQHlhLYOkbund2HK/Gy4wD3fg4c3gqVo8bjDI9I7TDI1
         jovd7ErG033RekURijoIeWgRLqvn2G++ku2HkkYEti3WCiLXDMwsDb6fSoxU0P//nZTO
         iJk1y3o7+r6T/Ku+fXiH+BZQ4p4nG9bVFh4TbU7qhMlm9SOhRb5GDviaPGmO+42EGiXR
         tiUJ52CruyJ3w/jj6W0F6P5xmWymgoU3fGq2wVbvcIPTZwyHZflP8TtBBBw2UG+hkwM3
         hMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        fh=s/BtchOkI7pqyRVUzzNFdjeuxCfxwROIz5nbnEIZQrI=;
        b=S/noX7fWNi7/cBxQ1iDMKvMTH9vAx3yk8zqpJ3YQWruJFmNHWmLdcJuC2kAIqJn0T5
         xAJVSQo4Hlx2rcDiifZfN9O/Tz2U6A8GfI2v+fLzgf5ThcBifF6HqTej9/BRs2QBU5m4
         HKeUvjK5awGA6VcHDowaG0z+iSHyDyna8Q/qRf4GsMp15CAgAjHFmtfQGazb5VY9egh6
         B0IEwR9gA4avDIN4KZfGrVx3R9l18TD6HBJ0DpF6nGZ6XeGPWDhM356zE4A7/B/ua1xO
         EnqyYzOvLez2FqsId8aRxa9HFdXZFVoY5MGlZmH9mSh30qVYp2AbaHqwrRXUkJZTxj6z
         VnOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787643872; x=1788248672; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=TPJIs2+dzBjJv7VPX4Ug643td/FkJ1S9QdyvmbmioPttPS+ZAkjK95vi5hg5njFU5b
         B2xA1sEvPWERUxQ2JNgtfEvRFvNP1MrTTZd649vveAvonPlkD/OEDHMbmMof97JbeFek
         hZUACxdZuO/NIL44kx/zLVqWcHqy4+f8/kFFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643872; x=1788248672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=CbP5TegiYTdym2A/kIoR6WHC/+dkMjSwPveTBd/Vqd73cf7l7U+DXIahmd5b8bChzV
         src/u5KDVhbTqc6UA1e9Az6CF729bgTsDNmJLy5bgQy9swNqQqBcTAfn9NmwyNIJh79M
         PTFvgx7cK49ma4vcwTXsiTa+JClcQv6jeTX8bmZsSnVfE2wIp/TgkYNuiOUt64i38vjw
         vhJjMKAwwVLTo0+q0Uiucyx98LV1w/ylm81KV1b3JuTaKGKJqWWJX0Kal9hhiTcc0RzY
         G7Mq5gv8ZfC0NrOB2N1yUf7X/OwaGrvwLIMUF1q5/aukD2536hR2Pr4BJbGpnYu6mTh9
         ePOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoN8uktBVblDipzeGV5HOF7ZxxVAltzMIcvYtfc4c2zIeVXF4IhXd1D/ZxguCUrb8w4AHr2mw2i6H6Tz/92TRYO@lists.infradead.org
X-Gm-Message-State: AFuF++k4ug6/lsRpiBV0Yw4mgYY2EJeWeRAUMVs349dI7QiJU3+JWJOy
	Se87HN0VZWSWTF6FyA/B+R17NkM6ZPSqC230IzfFvkSHGEW2z7GuSct2LeRVPtdESJPUU82Cdr+
	pnNEoLpyJzZL1VH2Jk/7YmfyNfGjSbjapsHozC/YQ
X-Gm-Gg: AR+sD13SW37kJsyRBfSs9YMRkiamwtPRxzmJpdLVJRop9ULlUtPUHf8w9Gahxau5lEo
	gHwbk/ZnP/o+fQuuD9lGXKiJS+TVAAipei96+HDMunmR0r5L3dkcoq8joVNCmx702CHb6TTBeiP
	E04p5sOfuMkXFGqklL+zggyYmTCtECF4FmrX59vLeDC2X6fWF3fbgILCo+lwP8s3V5E6ueh2Mgp
	qg04sw/VvQf+nLDpK7w4A6/55hKDM3pVJeG2a5IwV0nuC10h145C8ut/qHqkTcxyyBHtseaMrVl
	X7hd833H/5rGVkGRK3ICLaw6ixfJtAnFfR1jbVwrBbALz0MweFUcEEa0M2WribQ2Wdk8Zsn8
X-Received: by 2002:a05:690e:1449:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-66d1131bc41mr2549091d50.29.1787643871703; Tue, 25 Aug 2026
 00:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260825041628.988369-1-wenst@chromium.org> <20260825041628.988369-2-wenst@chromium.org>
In-Reply-To: <20260825041628.988369-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Aug 2026 15:44:21 +0800
X-Gm-Features: AcwNN1VHbO3y1ftfkF_7R2W7KDk8RFMySudnf-TTSiUhjGplV2Fwnh0fieb32LM
Message-ID: <CAGXv+5Het3zp_OTp=_ktg+_d5Q55zkE0SwQnM7TVyJDmOdBtyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_004433_529421_123C9883 
X-CRM114-Status: GOOD (  22.66  )
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

On Tue, Aug 25, 2026 at 12:33=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.
>
> In cases where the regulator supply is always on, or has been turned on
> or left on by another consumer, the driver could shorten the delay or
> skip it altogether, provided that enough time has already passed since
> the regulator was _actually_ turned on.
>
> Tracking this requires support from the regulator core. Introduce a
> "last turned on" timestamp field to the regulator device, and "enable
> and wait" functions to the single and bulk regulator consumer APIs.
> The existing "enable without wait" functions are then converted to
> macros that expand to the new functions.
>
> The timestamp is updated each time the regulator is actually turned on.
> For regulators left on by hardware default or by firmware, the core will
> set the timestamp if it detects it was left on and its supply (and their
> supply, and so on) is on as well. This is unfortunately best effort
> only. The core can only assume a dangling regulator (one without a
> supply) has power. This also applies to the dummy regulator.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Try to update last_on timestamp for regulators that were left on

Sashiko flaged a few issues with the changes:

- _regulator_is_enabled() called and subsequent timestamp update
  without lock
- bulk consumer wait_us incorrectly assigned
- _regulator_is_enabled() could return an error

Will fix and send a new version. I probably should get a local AI review
working first.


ChenYu

