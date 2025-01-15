Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE8C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zL/VhawMqdkK0mqwrQDIuo0f3MoKOJdYdsbaS2CXGCQ=; b=tL8YVTWMdIXGSFKkK+Fmci8dmg
	cfbViSRszYLY+mc5cqME/FCpDZjm/u6ZwNB1UEtWXYpeTXffwpsx147mbE4B6qEhDEp7N3cWjxf5+
	GbCtk+gyO1Fr0fnrx8Bczg1odgvkBCXUOGQTEKySutY4cYsIEZGuBOPWHOomlAUb2twnmlySVs5bW
	VQXVcTLchAkxzi4oTsxR9G4GB0SeZNQ1Vgzppe6ovx6YNsewQ2JbZMNGScbQl0n412j9mTL2izM8/
	NKwDXWG515D4QRLzzL3nkMXxDqmiLsqRB9Tvx6GZnK+pFVEb+GZlKtc9b1qoOHkukrguxPRdt1NuY
	ku+cFrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0nE-0000000BXLh-1Z8d;
	Wed, 15 Jan 2025 10:38:36 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0iM-0000000BVwQ-2zeO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:33:35 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51c68d851feso2264878e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937213; x=1737542013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL/VhawMqdkK0mqwrQDIuo0f3MoKOJdYdsbaS2CXGCQ=;
        b=uv2svlZp9jf69TsWBY7nNXRboc3uKg824OeQ6Nx5rb5mR6T8Yc3xoyYV2T9u8vLl/2
         O4H+Unpa57uI8/MN4jRWXu/gklc3momn6n90/EzSXxC8zKqKu+s1enGPDJaRKX81qAl8
         HD5Avud5OdZKmU5iUJYyXrjmUBgw3EqFSipVyFh8XIQP9i7rl4NA4+QokjKf3/gYOUM8
         2jE6Z2wyC4z3Ng7tY9NIiS5kM9NZ+I5SsDziu3vUExojkKu/3VyxI49xlOcGqB+EVcHo
         W5rrElq6S0EX9pRTCxo3SSCkcG8cqFxULVwLHoS78AKt7SweWaTePT59rKEeQxRIZWUc
         zHvw==
X-Forwarded-Encrypted: i=1; AJvYcCXoszhLRHogWs31CxEIgPqlgvLemiUSttCJmyedYZ+oDgsIg340sf8nkz1dQ38KUVI9UA3ICNT2ElAT96faOgli@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm2fKaAxFhUdEWR2r28dfNGufiFDNMRzTKuZx7dMhpP+O00xrC
	MNwqicS2SiJb6SqJIb6tWv3Jb9WeLHHEjc5OaxIflXvcv2OytbGoSEhCXA5S
X-Gm-Gg: ASbGncujwng2sVZANMTcnmrU4swlAJnbSN621mk4bM4VghGLioCtEVvUG1SYYtiQLDI
	e+EX+qvoMthSC3Yq4u1+h2DlLpSsLBJTjq2/gNfjU6IM4xF+ccxmFXIkSLU33hbEU1enbHf8umN
	gxlySbhSykmm2C40jgshSwdMh0Rjuce8nxYJUQ7aLUvXokmXM7DL/Qm3EpXk27dlQj42g4LjOAw
	bLeCmahodSWyEtJgEgcM+OECBbFHvH4l0mST6sVC6jjI2M2rwgPqCfspZKvWkvsIXWZsvqiH2p1
	A+2DW/K/ULhREphhazZ3xXs=
X-Google-Smtp-Source: AGHT+IHIBH8CbbARMLc3xilwZiZ+x4oUa43TWTV4SzAxnw7SSTHEMOVVpas3RbnPyG39fBI0L5pJpA==
X-Received: by 2002:a05:6122:1d15:b0:517:83d1:d438 with SMTP id 71dfb90a1353d-51c6c437bd7mr23493143e0c.3.1736937213077;
        Wed, 15 Jan 2025 02:33:33 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51ce28f0b67sm13358e0c.25.2025.01.15.02.33.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 02:33:32 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51c68d851feso2264871e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv5p9Aj0+R/t+ZZNWfODYtVLWk2uTARN96eqxq21dgabdCDN+sxwulnzJLrfjwObBnnjeTM8Tx68J0Ou7hXkdx@lists.infradead.org
X-Received: by 2002:a05:6102:b09:b0:4b2:cca7:7d51 with SMTP id
 ada2fe7eead31-4b3d10482d8mr25112112137.19.1736937212681; Wed, 15 Jan 2025
 02:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com> <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 11:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
X-Gm-Features: AbW1kvb1Mw4yh70skw6jyTVk4uvwGUIHSALmg8qZGE_Zuk6TjwfomZ94w4ClmYw
Message-ID: <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
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
X-CRM114-CacheID: sfid-20250115_023334_748891_16C43F59 
X-CRM114-Status: GOOD (  17.65  )
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
> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -408,6 +408,7 @@ extern "C" {
>  /* Greyscale formats */
>
>  #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit=
 Y-only */
> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* [31:0=
] x:Y2:Y1:Y0 2:10:10:10 little endian */

R10_LE32? Or R10_PA4?

Does LE32 have a meaning?  My first guess just reading the subject
was wrong ("little endian  32-bit" ;-)

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

