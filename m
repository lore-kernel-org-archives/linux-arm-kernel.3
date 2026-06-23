Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD7CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=; b=0Ymzeq9rnUpghJDzz8WCNGC0dh
	X7wAATYgp/qKEut2j63cLKY3ITOMCfQdi8+rkQYYIKtEsdgzwAdaKQcR6GsjXKQTZAO0rnWVY66uC
	cgkrvP5/vGdbQXWcC/EA3deNSBUbSfz29VRfLCjQQVHhsOaayRSQWd6H0g/9JvTIM4682AZ4gESwK
	edazZAcuNx1qUtlfiHRoPSCLrTUBNviP6F3pao0/sB6LD/2flHq3n2OqqRDFJa1a8tFgdZ1eFSHYc
	MA1vQWgMwvHP/eGbYStHgrKKjZweKCgqcrnbc007eUu3zGGBl2oEA5fmRG/0WfEa58US5rJ3GeSue
	czRuYaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TS-00000006pJa-0yJF;
	Tue, 23 Jun 2026 20:11:58 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TP-00000006pIU-1wkn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:11:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6dadfbaafso2065035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245515; cv=none;
        d=google.com; s=arc-20240605;
        b=YueM12Gt2JN/VpKSQitg9RKv3nX5OSy8bOSO/N1xMsVCdzwsDv2n3fhxOaem2vR+OS
         Ywcxq3f0rLiAg5t92U+r3Iu9ZugMFk4Ic/4ONp2EPIDuW+a6Kh6fzw+YbapOGKYWNsYM
         VINCpVRB7diVsG9jfJ/DuZ48EqOtR6jeN1K4qsobEFUdFA1Idd6rJImWGsT8jxNvbIIi
         0gYL1/Se7a/6BdekmNsllvZcInxFK+XOa5Ll/4KuBYuPCsm2oAiss0aieqOnB8yOhm2B
         7wediYXZPgFzF2leIe/4y475QbhXtcr4N8/LA0CeUiTYrMdBU88nLkuY/CZx5QwRqkLG
         b/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=x6LGkI83TZTz+xec6NQFMUGm2wSTYCeTkuL7hdkMj+c=;
        b=IZkj/+Jq5FtFV1uk1ULRoiMhMHXYo6ylm7e7fOdGwRmXraZLgbnWm2rax8qCDKjUCr
         Xch9rS5iZWFeoaKGx8r0dkwxxgzh3r8WMRwpG2sc4P5/yRz9/vJBkaeWeztkMBqKNqe0
         tre75SqyHJherWdKFw8XK6K4POPqBcEvUw0RLVQdYq+QLQpAqQEXYUFgrsigZUm2UHDh
         Vu+g8DaNHgMZPAFLDxK5Xnc9zrr2ZV5ER/ikHvdNNwKlPicuGiM5NgNWaRMubo0tQdMW
         5MDqYs0b3qw2yoSrvo6XuzuYyB3mIj3puuIZb4+v5N7S0iYAl2gw0Ur6NAMPaUyA5Ahf
         0CEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245515; x=1782850315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=OBJ33mahA732IOiO3vrKJNPcTTz+wV5kpvcYNxqMmpCX2tK7YgJjvJfRsIcLE8qbmd
         wgqNBQLuY4psLtdug0mLBBnctPQz/L9axExj77SgzPP1I5qaC/4vvtVzrJw+KsQT+tlm
         AsT4ZL9PDTlivtSI8l8h7p4ZzUiURKqsmihudbxugLA0RtOciBUQBgryhIHn8hQanfm0
         h1UnkFRvzh5s3RWrWAoFvu350bOyixD1OHPzIyZPZZtZmGjMp1krMKxP064QJfcjJUgO
         jkFmsWYr8feE18yHosmy1MaULddlwC+WeLPGl8ZE2opOBd8tKN6mzjuJcwFzOO5R4Bfi
         KUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245515; x=1782850315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=MsdYNAykvyUM6Sp0awLoZul3sd8j31s1+F+bFVQGlfx5cmmXJ1hXgoIJSBpTlSqrDe
         CP9ehJTTfqbFQ1RU1mB0Fn1ThUS13f26hv7QxKChkj32aqVu+KlR3ILuVApZLt/yGAoM
         MWBEQHYVOqKkH8o/qCQEb7ueWR7fV72etZ8h1pflEgOb6MP0U1+eMLH+3iJEkD2CQdaJ
         /C0lac4AfBiXefnnGGEMkrZYbyJ9ZGdoCb1bmSvh+8CYIWQodDVFuoLXTwR2fN9SMD3I
         F8cvSmHf4XUSCIM/vVmCdiBGYgw6WZCSWzRPr3GfIMH50vRbbKTwDpYmV1Hy6otbC+m6
         mXwg==
X-Forwarded-Encrypted: i=1; AHgh+RrxsO9MnhGF8pxZB29iXceDw3IZIS4mnbONEYlDNuapR6Itl9dMua3Yz+WVgfRS540TQBAk6OS/N7kv0Umos5r+@lists.infradead.org
X-Gm-Message-State: AOJu0YxVaYg8KuaNH1uDrpOP/w+LuhJGYPSLIObuzUcRyEn4VzGuAg5H
	BGKHUAkyiwxnR0b82wrBYI6OFuszujnPyCFb6oEtkwLesM+nwokbeK7zM2ZJ76wuKuwPMlpUWVW
	7vz5Dw9rEM9yUjPtva4+42CGPQqYmPAA=
X-Gm-Gg: AfdE7cmly8fHm5cCSKefsKQe3x4YLo3Zs+KwzCtHvI0skvJBzgHrWiQG5Mq9J7FZc64
	wJRbA+B8qjumUGU0UEyX9j73TWaSnjYkJ9u5FDUXKR8RMS2vGombw1xfWmxplNRndc/OyYyA1Uc
	Opd/SY/belL71m49U10y8chdbSgQw/cqJvZ7X/rvAN9Ezy1dmoc6jiMTBvqchK4mWD71B+cRgIl
	YBO1xqZvxLRUlfx0G2AxgJ0TkNiPS/BtozJcvguOSoXOOqa5pQVauuB8VRfwlYrdp/qUcLgnVs9
	7/yrrCDF4Y5mKhpQejC6NyDdUj1/8w==
X-Received: by 2002:a17:902:c40d:b0:2bf:160f:7043 with SMTP id
 d9443c01a7336-2c7e16f52ebmr3796575ad.34.1782245514637; Tue, 23 Jun 2026
 13:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-55-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-55-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:42 +0200
X-Gm-Features: AVVi8CclP812_MCc2l3_hynpLrJPPYN9UiQ3ld_pgUPdTcXAwwfZrBnBsjf6dHk
Message-ID: <CAFBinCD3suLGY4ZVK6bH_F4O2-OAtVAD81HSped+LkYUaEeNxA@mail.gmail.com>
Subject: Re: [PATCH v3 55/78] drm/meson: encoder_dsi: Switch to atomic_create_state
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
X-CRM114-CacheID: sfid-20260623_131155_502303_CA37A082 
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

