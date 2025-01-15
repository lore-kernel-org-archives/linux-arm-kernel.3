Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA335C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFz9PasHUXW73JJSPpGUZLnbjAFldUmvO6Eocb/wDHE=; b=yYwmLwopcBzSTto5MQxWkjWS/w
	jckyM0yf5JleXE91SU9ddVmMWZKWkbG5fNPhzVdfCiFeKqnrEs8++K+1KaLZ9ff4o6midhuw/Peig
	uH3JCqFwqgxMa1IpECnCzJCLT+b1sEeLpvs47AHVNqL9mB+ZpZmqTEMA4qy3eXc7dfFnoVKCxHos7
	45+/09ndJj4D9AmsoRoHeDh7Fs+Zn61upKD8R6o96LyFMpTkYgYvbAqNztC6d1nE0SMBjI6U/Br8P
	GQjSSUebLaQupYsHFe3lhjVvTX9Q7NLI3tJuzaBozlGUJiBY6q4xjPgeMeVTAGVOvMwQSXpxyNn+0
	lgW3P5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0m0-0000000BX9n-37Ie;
	Wed, 15 Jan 2025 10:37:20 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0fZ-0000000BUxv-2gMu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:30:43 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-518ae5060d4so2060264e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937039; x=1737541839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFz9PasHUXW73JJSPpGUZLnbjAFldUmvO6Eocb/wDHE=;
        b=Za+MyQ26Aw4+MSY0unVDNXRzRvuOQN5Hm5ZDdI5FmNdzWG59uY++ogLHAWHrDof8QZ
         O74xR+9KwQgg8Pj8r0hsdHZWW9NarVj/xPcFgXpYEo9rmMM1dJHIKaOr6ERu4+Vl3TUh
         41zY7CvrdOw7E6VX8+j4jKW15C60gXbPiqoe/cDxNCs4JV400RHqdJZRUMBmrCwCSp+i
         BfODP/X8L1v/eTqYgoogJBfhS7ypJeClf80V9BIZIrVakBHDCQksvcGdIDY0XtYKYhn+
         9wPOi/SrXJnTff6qy8FIjuHmW5FpBJtDy79Rt+/qYe/U+7YlXYX436RLSMayIEW+ugXT
         9vTw==
X-Forwarded-Encrypted: i=1; AJvYcCU7+3EKYNmYSwNgEsWJhemBslTEAMkEUA2rQfBe3jcL38YsaYIucDqD+Wxzvy2iKe4jnfubgJp6Tjs2dZ6UFsO3@lists.infradead.org
X-Gm-Message-State: AOJu0YzbSxRP4o79+hyPpazhaCpk+jGkFaVbpdkwnWlxK4lFLO3oHI4H
	igYFKBr1nlvZub4lz4sUpHFL+m9MG9HACnDekCfPeGeMQUHL3Pmg/xmDTMEk
X-Gm-Gg: ASbGncu4z35TnX4hRWo/v/v55fivpzBjg0i68lUXLpLhVLHtdZS9Osj51udZwIy06RE
	ToUgFRg9GTmUFzsebrVC0pV9X6PlBQE9AgMb/IBUfhavn48pvVj+5Ug8lL8B7iEvxZ9930bLWsC
	jP3tsNOFXpmlInWuUr5MS1sFPiJrJsDd7DsbzJGp+ORztNJzeqZ1iTBQua+HV+VK/sMEiC34hPw
	L04BuOJ2ZhurRaQ+nVOMgyrP8chor5JyGHqQnrhsoz7c9fpzv6R+Fjn4jPAQm1Iz8Ayj5eCcL6k
	jRy24RhTjahgfTkcdAc=
X-Google-Smtp-Source: AGHT+IHfsJZaXRufB/X961WzYRywKF9Xr/V/Gfy2AqXpeUBeXito4V3V2bWzwV6fB8bOOGl2x5lhHA==
X-Received: by 2002:a05:6122:1206:b0:51c:aa1a:2b5b with SMTP id 71dfb90a1353d-51caa1a2d10mr8594299e0c.4.1736937039074;
        Wed, 15 Jan 2025 02:30:39 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cde53aa50sm88105e0c.27.2025.01.15.02.30.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 02:30:38 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85c559ed230so1512285241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmoal7M5Sa25ffNRIuJ4tz3bbzYD48x3Qwb0hA13Kxe/c10Z0IWsATIVl+0pEs1aKhCQmqgf9WNJg0dKaZixca@lists.infradead.org
X-Received: by 2002:a05:6102:41a1:b0:4b6:3d72:5c28 with SMTP id
 ada2fe7eead31-4b63d726a44mr11631291137.18.1736937038252; Wed, 15 Jan 2025
 02:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com> <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-3-160327ca652a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 11:30:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMEEuCcmzvet=9sfYzn2_XtSkTgvpHkYz+RALCzHDzfg@mail.gmail.com>
X-Gm-Features: AbW1kvaABBYHZ4mYsO-unZqxZKnHe3EW4XQryVGulktTLq2QtVWgYecDsS4wN9Q
Message-ID: <CAMuHMdUMEEuCcmzvet=9sfYzn2_XtSkTgvpHkYz+RALCzHDzfg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] drm/fourcc: Add DRM_FORMAT_Y8
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023041_677510_67247C7F 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Tomi,

On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add greyscale Y8 format.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -405,6 +405,9 @@ extern "C" {
>  #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-su=
bsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-su=
bsampled Cr (1) and Cb (2) planes */
>
> +/* Greyscale formats */
> +
> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit=
 Y-only */

I don't think you need this. We already have:

    /* 8 bpp Red (direct relationship between channel value and brightness)=
 */
    #define DRM_FORMAT_R8           fourcc_code('R', '8', ' ', ' ') /*
[7:0] R */

See also commit 8aba4d30520ed656 ("drm/fourcc: Clarify the meaning of
single-channel "red"").

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

