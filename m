Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A4CF397E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=; b=cL9RmFsLETBCU7inO4EXMCggS0
	IjxgGUkrlBofpFmgcC2As6kKs+NKzfVvl1LiooYTT9HKBNEQ//iQqVhwcjP0CKH/lNE/VgRiJCI2H
	Kpm70etXMqH+RJ0X/193VLuA8sEPknjvzWJ1K1JpSQfcoI/tTN7CjJL8x8YU1uXvQF3pYE5DdEzTo
	eI/+krdT8wp8xqZmfhfuLmQT0Kl6RDuAzTrxkZpQFGYDFZSa5f/TFYmChoYxDRDIhhLth592UM4T0
	INhFmWDQvjNV+h+8ub+zk/VKvPCyJyQ/7jzP2fbHsyGNBL5+3F/LO1XXnBYRBwGYpCAAyVM8voR1l
	lhgXEP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm1J-000000047JP-3m6u;
	Wed, 19 Nov 2025 17:31:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm1H-000000047IM-36xC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:31:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so11057118a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763573459; x=1764178259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=e0zMuD5VQ10d4+6QsNpry7SFdtVUqhPSG228doPcjxDDZUT6SjmAMaz+/hMAwXT6K6
         MEeDqP3I3bJXjqTjWwMJBMFKPD0uRBq073WqMrwL0EDCNllw9JGrE8YpFn/0Ce+I9v5t
         86Empah+k/Cfe6/XIG6Et8C0PIhuU2ldRFY1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573459; x=1764178259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=MY7O1b+3lXXtc1XRl2XD98mqoqf5Nt/JArd4cxtXNztPa/sJNKM3/GE7orGDUF/LiL
         LODaHqP0Yawf6ChXNSGYICWyNzJ4SsAFXIz6VT5vSU6DZAPtt7mZe3vaTr4crDQUnTZO
         zKERIdFf7cjSo2CY4qgOP1XC3/WL2PbjVhIX6CZQ1OxX6LqLGpXmt++aODs9x4o8kvhd
         O9DeO+Ucb/hOO46cXzSKZ8HM0aA7EO3urzRZ2nKLGFUxVJMmUOBbL9CP4tYYEz2KJWGb
         srT8RqZVyGZ2TTC1denrtgvEYFPC9pCBV5J4zYdzuLngO8qoTb8Kx8VJh9fjjpzmVx6T
         OSSA==
X-Forwarded-Encrypted: i=1; AJvYcCWwhtUfcFakINH9++godO6xlZkvxiYhgf8dnvmm+cGghKxmf9OPzzQsr2RXXh1zUcGiXC28I6jELQB2BA6kYFcy@lists.infradead.org
X-Gm-Message-State: AOJu0YyhoIOluImaqxJwNgdEKMMuber77uS9SG79UF3t879Lf7RWAzJU
	k8xnugtDCVcbKxKEvyTBiJ3YcPjsCqzH5wsFeDPsTIg01MfCVOAHBWP2kTlkT0fy83s5YVnzWng
	v/gJoKbi7
X-Gm-Gg: ASbGnctKxu/10OgACgicX5tfXsI3L9T3RIdOh8kCEFqFQ81It/B7W22gXZ25HEcMurS
	i1jqcPvUo4kFzjBBfzZxg30Szj7l+JennQoeisf9dUjaUqs26WTpdjRb+iNOJM80NR1PdCFlSYk
	tdJ7GxAg+6O7zhstyV33xULfHEenFMxsVcPjDSalRfLbXQg3p5HkhgIVrowqJwBCz18+4P7O3kn
	4+iuGR2xwPcXXffOB+LFiz5WhkHiZmPsm15XLVuVEdAUy21FUcQs9Zup+xtZHSlKTTxMTx05Ber
	rOzdsTAqJLdq4Mh7ouKuevQKk5Dc8Rq4vE+DH3cjL8Uhe6BXmRAytt7Xo6PakwHmE/0k6XbGMcY
	iIWa0pKiGV875Kad1drWydq1cOPy0BEQbLe7Tazyp8EVz3/vypEo/HGTN8COV7kTH91uqyS152v
	VFs+QAfSkLecWnMJHNsBSvVicdSfWlgNCMHgVQfZkc+VI05iYQtQ==
X-Google-Smtp-Source: AGHT+IG0KAVX5cBR4WYkRk7Jl0JsobsmKfroQUMeLyQkE5bRKd1iQNsD5ItQv6ydaei9bIpibsdnEA==
X-Received: by 2002:a05:6402:2790:b0:640:c460:8a90 with SMTP id 4fb4d7f45d1cf-64536407322mr146030a12.12.1763573459306;
        Wed, 19 Nov 2025 09:30:59 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363aca03sm89890a12.3.2025.11.19.09.30.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:30:58 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so223955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 09:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXl2hRaSxNLflg89XIyPesRXXYROrCgfzyBfzv5aOz3Wa8t6w2cAXmhse1jd/3BaDr7vsF+WiwJjj0mQvXehl1Z@lists.infradead.org
X-Received: by 2002:a05:600c:4694:b0:477:952d:fc11 with SMTP id
 5b1f17b1804b1-477b8a8eb4bmr414775e9.16.1763573457648; Wed, 19 Nov 2025
 09:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 09:30:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn88skAW9xgPWrFrlEJQJC-r-nYEqb-FQnzB2AAJsIY30EVaWKYqaJSmTs
Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_093103_809401_EF63B702 
X-CRM114-Status: GOOD (  21.35  )
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

Hi,

On Wed, Nov 19, 2025 at 8:54=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
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
> Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@lee=
mhuis.info
> Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_drive=
r_claim_interface()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no way to test this commit myself other than to compile it. It
> looks fairly straightforward, though, so I'm hopeful it will fix the
> problem.
>
>  drivers/bluetooth/btusb.c | 5 +++++
>  1 file changed, 5 insertions(+)

Ugh, the bluetooth bot properly told me that my patch doesn't apply to
bt-next. I'll send a v2 right away. Sorry for the noise.

-Doug

