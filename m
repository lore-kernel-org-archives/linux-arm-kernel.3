Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AE3CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75qBxmQOIEAlKUJsCU6kHkks8y+FZFXi5YOHbTzTprU=; b=JUo+xqzToRBLhVwk0wn+LZDfBt
	H5Kju/1LlzB+NkvcTiUIsUxILCaTWFbw+L0D9lgag8ZL03fbLCYH55ONNOt2TJ868xbv+M3HFmlmf
	wJZWg5SV6FfBSyU+yk2Pkpsf7ZiO0dCJB+GVLgSFz8qe4pAucLa50GGnWUfG1wGXoYskr167G1LRG
	npphNPzQwwt8v8Oot4oSOxeblhnkYhn3/QCmv9zi/X/Ysq1dQs0LQYCMqDfjsug6U2iTDooXWH1KA
	JR+Pi2cwGYE1XqBo9O/nzQOpaBvJLJRQc1i9Njkln76c7+ceYbqpdVhXBcLAKOWfspQFMGmV5Z0s4
	fwkAuIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpJd-0000000HGEF-2c5x;
	Tue, 12 May 2026 15:46:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpJa-0000000HGCb-12mg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:46:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b8f97c626aaso119632466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600792; cv=none;
        d=google.com; s=arc-20240605;
        b=O48rfMpUag9d95li10GQhfpu0+PNZm6YPj9mgPaEaFkaf3i3hRa3jpTe2AuXM3lNfP
         UymeIyR8vnIimwaLMKKgmy1T6c/rJtMbR+gIuF1JOQ5BIN2h+6I7gCxm2Gyw//K97S1M
         1bzjoE5fX0zTXDuALY8Z9iNYbhfhVqUvZ7yRVdPWbtxrtcbqh8l/QJqYhwvogBbDoLPI
         nZTRAW6DoKOJEo5XTZxAy2koV+IfaISYH6y/umAhu0RKt+IYNDGUH4OZW7CXlk1MNpvI
         QCJwMD+Z7wMY1LEPLx2lS6g0WikPduusGfOEAz0Owp0WV9Vad01XIHTKwQMmLmfM0u+Z
         xz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75qBxmQOIEAlKUJsCU6kHkks8y+FZFXi5YOHbTzTprU=;
        fh=4xFBYc71EbGSTrlyooYhyct+7zm62SByqxocT/0CmDc=;
        b=f9fUmJAOSUijZLFSNl8e2v00q2v3EUAGrx63YTxS3L2uembVAbMtmPxHs6JfMSsBdh
         zAQDhIaGO+sqLiCrwp6jyL3j3H5GwwmhbQm30tBOOvQdA1rA2WKOvNrqcbPmYkgFYlO0
         zEag0l+iXWw4zOkNXV1saXWUxtKQ439czu0h6v6i6/hQ8LvImcx7vrdi/4/i+ozZMRd7
         c+V3ROw7K4aOJ9XcDHDyDsAX+/5zHVQ/esVGrxNOPm8WAaGEPnDOmyAoN5taT4bFnxTw
         Bs9EH6qxI0ubXzQL9tYRBasADlhdpeAmoXT1aNEgKB6Wwtv1UVPE6+VTmEg5h+dTgkWD
         uf3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778600792; x=1779205592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75qBxmQOIEAlKUJsCU6kHkks8y+FZFXi5YOHbTzTprU=;
        b=K93ftgbCly5VjjiZ54wDhJ1aVcy5q21iVO3RTsZoBFXIHu14+wXzH2Vd2GUKDKEBro
         /Ny2ZPmdLKJT54fNZ+/DqyehQlKP0IkMr0HDhfB2AaNS70XrAVH/3BcoCwDG/4ntHzqG
         gwnAk5wrs22F5Q0KQvqOl49iUeFX99XX+6vEn3089/6KXTI0wv6LGzbncvo/A5g1IaIi
         LJP+RN1lSq+VOGJgN6c8LSOWzrwwasyEU4HUuJBYIYDCB41IVURqoUWBDipqpwGD8Ocr
         3mLBzpmRKOgvlBQ3eNSiNXN9HGqmUhgmxt71qlbdrEragTVlFBUYuix2GSijhdYTJVnM
         N60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600792; x=1779205592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75qBxmQOIEAlKUJsCU6kHkks8y+FZFXi5YOHbTzTprU=;
        b=ACkPfZuLbC/4LkjU8zfNcdDPEvunMC2F2JyHOaV+VwXlD2Tylq5HfUxzVAZtC3TPKJ
         pwXlaPzOdhwe/L8ThUnqKGu1AhVDvaGlgvKD8ZqcSxzb+1WMyvxuFVPOvG88/CMM5ff7
         YOoTLauTO/ci4a2vAg6pDNVsXuEAj1gEwKxtX3ijag+xLh/1XgBbwiHZWLV//vCYD6F3
         hdCgrkhHAxjGmuwyXUvTWgPB60sl7Ze4bMvWG59vvGFlUQ+1ioUARHo/bMWI4ArF14u9
         pcOWQ019tZusOfEjNynHvZ40rvac2EOOElwwuUqpW/XUhTuprIKI9zf4EmILVsJaOL8G
         WYpA==
X-Forwarded-Encrypted: i=1; AFNElJ+czlW5CUyS5/ze/Y559pLiyouuWNQeO2fIbHGbgHaNCInek/IPZbxJZDUmxMuemcUFE3Zdd8jGpaZMyhU12L1K@lists.infradead.org
X-Gm-Message-State: AOJu0YxCW1hF4Sz9rgMYLZG+RLT9KK0ufjpJAvXIeNjBKAM+6jnH0swb
	bZ28ZpIws2elc23IUZxMd6sVKSIe4M/cyyNv4I4M7vZkmtI/mnLFgXazp0BnmewxzafKFIDOEDK
	J2zvkdHucpO7f3zLqqWQVaB1rDpDL4xblJZbCbQbbzA==
X-Gm-Gg: Acq92OF3J4K1PIofWs4SMFtu1juxbgHTBtuRq3YKa7sscs6RpxI+zIDItbShT+NveLG
	lWm9b7ntHeWJEOGOTJvps/NeybKMeCcyU6cVagRBCCHn/nDYzGT5vZTznVTjXtaFEpgh5Lu0DpZ
	4hMgxiZ/RnWxda3+aSgCRQB6CWNj2EF8wjurZ7Vce5+9B6UIaduIuHqvLEmvKQ8Rrgmxc5GsnxL
	jg+FTRzRKFca1BxOant2r2X9XRi+jZM6r6Ahq89wLdxyoVRnPA0LR0icH5DQ3jLSleYHaUux+WB
	Ry+VddACr80MA1CJ0OlANOOPfxH0ABItjFNe2CPAhBgwMtdhLYOPgW9gbML3jpXeiH/dtD26jbJ
	BWgxc/CqeWQZ9gKm+qkUvZKhF
X-Received: by 2002:a17:907:6d10:b0:bca:4861:65d5 with SMTP id
 a640c23a62f3a-bcaac35f762mr1082691066b.29.1778600791859; Tue, 12 May 2026
 08:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260414224245.8493-1-guilherme.bozi@usp.br> <20260414224245.8493-4-guilherme.bozi@usp.br>
 <e84d98dd-c81c-418d-8cbe-5867f8bdd4c3@amd.com>
In-Reply-To: <e84d98dd-c81c-418d-8cbe-5867f8bdd4c3@amd.com>
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Date: Tue, 12 May 2026 12:46:20 -0300
X-Gm-Features: AVHnY4K46d1uZa3D0VTlOTLicMN_W7masSFd8TRMYjScY4EWQs5rQm5x0V1Tk8Q
Message-ID: <CAJgF-xt5UFzPsBXX-MUNOmqBTjZrZC8Wj4DTtqHehWCjUfYfFQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iio: adc: xilinx-ams: refactor alarm mapping to
 table-driven approach
To: Salih Erim <salih.erim@amd.com>
Cc: "Conall O'Griofa" <conall.ogriofa@amd.com>, Jonathan Cameron <jic23@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_084634_302628_5F562397 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Salih,

On Tue, May 12, 2026 at 11:34=E2=80=AFAM Salih Erim <salih.erim@amd.com> wr=
ote:
>
> Hi,
>
> On 4/14/2026 11:40 PM, Guilherme Ivo Bozi wrote:
> > Replace multiple open-coded switch statements that map between
> > scan_index, alarm bits, and register offsets with a centralized
> > table-driven approach.
> >
> > Introduce a struct-based alarm_map to describe the relationship
> > between scan indices and alarm offsets, and add a helper to
> > translate scan_index to event IDs. This removes duplicated logic
> > across ams_get_alarm_offset(), ams_event_to_channel(), and
> > ams_get_alarm_mask().
> >
> > The new approach improves maintainability, reduces code size,
> > and makes it easier to extend or modify alarm mappings in the
> > future, while preserving existing behavior.
> >
> > Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
> > ---
> >   drivers/iio/adc/xilinx-ams.c | 161 +++++++++++++---------------------=
-
> >   1 file changed, 58 insertions(+), 103 deletions(-)
>
> Two issues:
>
> 1) Same tabs-vs-spaces indentation problem as patches 1 and 2.
>
> 2) In ams_event_to_channel():
>
> > +       if (event < 0 || event >=3D ARRAY_SIZE(alarm_map))
> > +               return NULL;
>
> The 'event' parameter is u32, so 'event < 0' is always false.
> Either drop the < 0 check or change the parameter type to int
> if you intend to handle negative values.
You are correct regarding the u32 type -- the event < 0 check is
unnecessary. I will remove it in the next revision.

>
> Salih

--
Guilherme Ivo

