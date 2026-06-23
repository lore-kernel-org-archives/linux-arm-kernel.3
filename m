Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCD6CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=; b=zNYH8Cc0qi8vZgQetkHCn/cf6x
	di88i+Yzs6D3mw08mWGjkKHZK+R2/WPYTG5oJSY7UwBS7xDk8k5iq++hVhEwPvgcBxSHTQZPXsshz
	iaHX/3jCVQRhpF0qHjEPNZQhEtYf3eqwlD/1jFmX8BwccTFLanwWkVgH5Zv2EXbXurvdoy6mucwNV
	dEbAJFCghdwNe/57GGurRJKrhawRNgJ3Qz+QCJmbi6I/6vBjXA0ETSnwiFZcft2+anCcZXYoF86qE
	lkDAeXBLvPOwsmhnsh9JeZugJfFx2cjHlWwTQOtAxukMGGlLoQmzLjJFMms/F4SdXSKap4GnNyHcQ
	8A4sF/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Te-00000006pO6-1hUB;
	Tue, 23 Jun 2026 20:12:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Tb-00000006pMr-2bi8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:12:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c168baac83so1072465ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245527; cv=none;
        d=google.com; s=arc-20240605;
        b=LieU/gggM3FYdMPT9oiXvyJLMh735R7Uiyhv+fBvlBASUl3yJ84+lsQ5kKFnD3/6Sn
         F73FCsaWQNIrPwQ/kcTQuyHdiQXt0dh+ws4YyOto5VeFHh0WsV40zyx4Vdlny0qAVJIR
         EL5knYEtAm0wTorbvD33jUCOqNZBPN5LluZzPN/Y/aPhGI4xay4ScylABq+jvvbZef6U
         R7YVVbgTUp90tIiKJeWd7ut902IXhxf8yaSamFQXNjA7LQzxZYUJolma7deYsGsU705N
         mp8mDJL37ZJKqETUycRR0ROZEOT9hSEERLOP37poRAv53sL0/8+ZfilFaacFUH+XDKpy
         TogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=1MNQzDXm7h2NYn0ufA89rD532aetxe+5aY1FznJRmPo=;
        b=dOK3zmWzlUJu51W7iPzBggHYQaOxGIRrASdYv47HSEEkUBoscmZwNhomy9557QzhMZ
         UpFN5PO/ERdt4lAz3pmHJeNhiiavZ2M/HycHeEtDSLZC8p9Azsb6DaPztxhKlnv2m9ov
         iRFxZM6k/zGJiCH8ALGck05G+H9cWgSqoZqX+pdwwkvU8XGul02xz/TnBBV961fJIaf/
         uacUX0oHSh2bK37/6MsRIsHq8qibIWllzbT3lylMcaoJMn+Cf++vihKUdEtRp38sHE+2
         8fy/VZyUQTlO0hx7KdsLXdx+7hEIIkW5pM5nulQhzevDtzMK9vNmOfopKKreGNEdh1kR
         3bMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245527; x=1782850327; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=NIBbTwvniq3sWyqrGUqBfljYNG1RpzaHzL9YjSdrW5I+PMXyW0GWHfhmkldSPJGxlX
         oeD9d1gxEDtV45wMIKPtKSsvJzJ7j5SnO53cer8FV3+8naETcoOasHu7Mz0X7Va0Ze6Q
         jjMVU5zucv3hms1Lb9Hdpn5NfNpl0uW+xyVvjMpBiovTkhOhEt8oInNP9FPGXbc/W7Jm
         Yw9FFfeIlPXTklictxxrhsOKOWL/dXGnWPc2Q2TXmPeCEoe8x9k9PECZR9rBku1MRAQk
         A7h5Tba3ZrGVyXSoZewzt0TLebyF3F6kjmtiG6Ei53BZxtT4K+o4PAbV9zKKvxTWo6ax
         g3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245527; x=1782850327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=jQHVP6BpEpzuchMZ6vontBPOolpj/k5JPLkMw5szjDB5CMRIaNhalhGqtkJMTcoamu
         dYxQVlHHD83Hxcjj/AlNDQEv97mtJIMTQ8kRJRCX1YaJpN4G1/O7FJS5VGZ+lfkoaHOi
         t8rwTsbKFnoGApWDnX01sN/4L2VwpTiK0P7FR6bVn2cUwysBfKq6azIeiYJuwRdtNZWE
         4b34EtTqmA8lfO06VgGcowk3NGpx2nH0H10e59J8I8yGLk7qYcmmtOhJYlyUke10cMPL
         j6Z9DKbbkv/kbOWX62Zy7POehFHrRfqP6I5Kevy+8nY1rlbrqksaYyhUvaJ6suck0dVR
         kueA==
X-Forwarded-Encrypted: i=1; AHgh+RoG35mYcN2RfbdWS6hHOhgCLXrqqwyAx15SiLuAzTNu1U3kcyk3cfPMM6iLLaYvCfzPO6PGAG48X15bsPTxH+xW@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTHjjZlC3WxKQhMVzV2OERB4/KTB7gqruFJJedyJBy6Y2XMrH
	oB6bjFYkqsA2gSD/261Acucd/QenqgBT6iVbnPtnDr65V8S0TlpIKzy76JqaceG68Gd/tVRZviN
	9m12kE4Ky9UzDh42q98HyuwU8+c+ki4s=
X-Gm-Gg: AfdE7ckM9DmxzmFKYBUPJLIssQwcd4Gs1VqlzC/00A0ONcq+0sM0VvAcKKJkuQNJpXI
	eaZHX/vPFdmcnrXDXN4Ae0LwMCmt+e6PAU4/5Emyw135FYVVZNiQpVZhxde7ARsmGrR/tVEOGOE
	rcv+i+K/c3su5hrKASepEhfAhZI3I9rWTnGMSA13owo48apzTJOHV0+heS9DMwPVEpD3oJH/UMX
	4O05P35gH6QjR5iK4O61enCeEtDUgkVvINxmi4f9fd5eukKiUDHgsmVmuVlenZEfHXyAALSNVcv
	N62P/07jf38/m2nQGw+xb9nVyrD6wLZy9+LFOEjZ
X-Received: by 2002:a17:903:240b:b0:2b0:608d:d8a8 with SMTP id
 d9443c01a7336-2c7e13bad7amr4514775ad.1.1782245526813; Tue, 23 Jun 2026
 13:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-56-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-56-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:54 +0200
X-Gm-Features: AVVi8Ce2NYfA8Y-QDZ6Qs0nmK98DH-xBcBFK3tKliqc_-TAchO1N47N6NmPkuP0
Message-ID: <CAFBinCC7S2N0yKj=ayYf6FyzssLmF0z7JsokKQ=w7pucPxfZ8w@mail.gmail.com>
Subject: Re: [PATCH v3 56/78] drm/meson: encoder_hdmi: Switch to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_131207_660101_EA50DCE5 
X-CRM114-Status: GOOD (  10.06  )
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

On Fri, Jun 19, 2026 at 2:27=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
>
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

