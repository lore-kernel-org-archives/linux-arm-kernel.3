Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29410CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDyEXvhcMjHGVLUO7kySkl3Qfnll/RHQf72z6TXt0us=; b=DoxzRhHoaYdOSp
	jFd8PbY/tgJIjNP4TdSkdk0fmbDO00wjQxaL0rj9juEZuJ7xwKRvQPZWLL/FHjVJ9c+9b+FlAkUfP
	j9yu7w/WnLCeHfbflkXidQNPkquRJZbLVhcYe4p8gk3POJUV7X2BCJrPF97tHXn+yjXg2epWS0CHj
	5VBFvrchJ55wpSG1s+YJ85pjK9v/loJM4PSurBqxIgx4K3MEINvZXEnoE9y0PRxzdJqHc16JEGgbB
	pH7tSQ2xSSzj8nfpv+8AXzArkyv+/NtIWlMwPi+/YTnT2dEzppar/IIYdTPviLTMR0J82dJQnh2bZ
	Z5Z6aPYkudirZZySZ9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO5a-0000000An9I-153D;
	Sun, 19 Oct 2025 07:44:26 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAO5X-0000000An8V-01Md
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 07:44:24 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59093864727so4050000e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760859858; x=1761464658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDyEXvhcMjHGVLUO7kySkl3Qfnll/RHQf72z6TXt0us=;
        b=nclZa/e4gcADqZkRqqeqeohI1sFvV/7f+dFfYXDh5DOgMVSn45VDBAfD2NmnqY1kpn
         tx0pbMqN4LKT2ZRaE81sIssJ4Dnlftlm2/B/INUNaVyywI9schilHYJegjngCNvo/q9i
         OheHqwJHWg6MMleRX8Sx0nIhNQraMwjVebltz8YL+5UJ5aMQV2tcB3oXvd2f5FliGzor
         U/SXZN0H3y8fvYFVIYJ9qNvT+2TdNZjc3FEZHVRGm3uVg2n29KT+yKujAbMC/lp6jpan
         aEC6LnCVw8cpYc1XvW8zcNdd0ouDeNvpBZP4gSI1aCFfdFZxd02PURKRDI0bf4j8NCUM
         88qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkW2MU+fUEUVFALkJlrblQ1w1tnOkwZfIcWmq6v5YM2M3Xhe8g/uvHGhJeflICgcxEGI65arfukY4aCpFRBnFh@lists.infradead.org
X-Gm-Message-State: AOJu0YzLd+HFLrJALhgFxSAL45zXvpzQ9x76BleuhdCfKJIUTeKPWE6T
	GiIesRfrscip07Rs7GewJXZTXYPGi5ri92149m1syzp3ZXycx9SGZjvEIYCSeR/Q
X-Gm-Gg: ASbGncuvEHQ6ysgCzI6vahiVeh+8OCQIZ1hhPf6IvxDkbXcUMTAFgKQmKRmwxCvrEN0
	bAs3q7jRxdM1OTAQRxY3TT6wApANDWWg9CI9y9OjUspjtg8eN9QZRB+9++ofIw93CXR6u9Asslg
	1uWR3ixy2xYshN3gjlP5ACfejteO9jtXAyzPVCyW9qhXO24MYxX8SpqpHKPYc/nimhoD2sew3Ra
	S2WAIOIjzamlfRhAGU8jCbrvhl/azlCNbpB9RgR4u0tjWRZ/bEgXY9L3oiZFrDJQbxYQcBbWdo7
	cPfPps3JDdI0IeQzbLnyWrtWFjgtWsG+Qfr7COEHOamIaDkEKbHq52SzabkJg7P2mH8lFR91NE3
	beeQrNBAbUowmZKIKb8mwF59fOf+32EuMc27DhmSziPGl9VE1+rkuXUdra01ovIbORV/n/2eyuM
	wBLlPNaDVXhtth33Dc/16kQDN5bus4ShN110jewmN7ie0=
X-Google-Smtp-Source: AGHT+IG3kWwR24GinudlDnJLBtpE/9Gqdux9Z3ECHcXNNbLtc9iIzkmm/Hp9ymRdoDoyUVVZjO1WLA==
X-Received: by 2002:a05:6512:3c9e:b0:57c:90fc:7d3 with SMTP id 2adb3069b0e04-591d8575731mr2949056e87.53.1760859857531;
        Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf6e2sm1346001e87.32.2025.10.19.00.44.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 00:44:17 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37777912136so31405471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 00:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbvLmPvmlcvh7/ez8J1NlgexRwelx9bNjbAP7bthaPuefTUrBd/sY5fhv3TmoZkeVdAjA6nQvUSFQBd9svjNkB@lists.infradead.org
X-Received: by 2002:a2e:9a0d:0:b0:362:b98f:edec with SMTP id
 38308e7fff4ca-37797a28204mr31528471fa.23.1760859856735; Sun, 19 Oct 2025
 00:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-4-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 15:44:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
X-Gm-Features: AS18NWA8cc21pStw1TYls77Vg9dX4gj_1oPuVNMT5dpbk_Fef3dnnMNukJyo070
Message-ID: <CAGb2v64QDvw_rQN3v+zPLp8YBcfQBZvOBenKQQ__g7P=kLkucw@mail.gmail.com>
Subject: Re: [PATCH 03/30] drm/sun4i: de2: Initialize layer fields earlier
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_004423_056523_19ABCECE 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> drm_universal_plane_init() can already call some callbacks, like
> format_mod_supported, during initialization. Because of that, fields
> should be initialized beforehand.

I think fields should always be initialized before any structure is
passed off to another function.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

