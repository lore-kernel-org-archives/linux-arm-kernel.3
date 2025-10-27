Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE3CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=; b=UcG27Tp0NX92numlFLghZcyTvS
	ZCZGTVAwLOQsKHx7OX64OxDP8yAKx2AZPct3iMvn050ZhzD/mPBpYXE38DoWK84XnG+H+0KpBofzI
	dmIfnCKaEefAo1OQYMDP4yv3ni8qmc1NjpSLH7wKfpzsoG/4as59QfUSai8rSYbiEFy4jyw85ZTmT
	DTNXHaDr3uBKp4OyIVN/dNyIzxBuG40KXnRzya4C+T4G6E/b52X/78eO9ZHC0E5kKBnusGdAPF9r8
	t+Q+g9atvpqTrBLWNRNBgjUr2qe69pN/V6B9+AO23XBR47y+VkUGuAQ0IH7seBx5IodIa3NA7YElH
	gfWbvuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRhH-0000000EWWL-0erU;
	Mon, 27 Oct 2025 18:11:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRhD-0000000EWVM-40oQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 18:11:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so50134375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588714; x=1762193514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
        b=jZLBg5bQq37Qw0C1ViM5Bw7Fo7MCok0ZdrGz25Xz0fJc/rjUulQaMx5s+dDRK9avnW
         VGlU+B8lx1wIkP+Zc9k1VQeU9iTHEkUVuwAAb6glh+H5igqoKlhEsHpGDUJtuSy3xOlN
         nzJrcnuNrlSaXAzbmoOM/aXApTPZ3eN1ayDTGtwrd+rDM3Ud1GwIhronXiPZT6jOxIOx
         ivHeMTBBKG48l0wdMQ5DMGT/qtElg305xyJAu/XjFXxUIN73tSZIIMh+0hx6BfyGx7aX
         GON8RgyYMlo1C8dQONvT9R+uwUIWPs49nwO/uD8XQxIzH2ClcNtL0AIWqUwtcCaMlbrK
         1OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588714; x=1762193514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
        b=anyoTALXogar3vf80oW6pPdD3CZWLj6svKF/qPKrGgfVkrU1AEZ3/IH4z1u6luuYyn
         ERF/N3AIBxlaIrqkCg9H0aUKXEe+PCB0Sb9/Q9CPpP8cBcutYRSFSJxWN5QzL1go/hB5
         QJTwjOHc9W52emGD/e3xqg0vjidbFCe4m+qzQTA0XE6UMUIwoe5FKyalbmabJpfJhNYb
         T2GMm6shgLYf5HcSVyCtmf17RKO/eNbHonHy5/irktICJJa0tw1gUU/kBY11M6T0w06z
         60AlMZE7alMaWIkqbPXUi93AS5/VVKEMA3hGtsgDphH4GvuObSB6Uw7Ou02MXrIcymav
         36qA==
X-Forwarded-Encrypted: i=1; AJvYcCU93DBVB5ksFlKsr900vlTGZOqVvkcEy5Z3IQdMYMe/T7NOMwKiZYCkSY7GUacpJoI1aDrPhSJtnMVVmdC98dfg@lists.infradead.org
X-Gm-Message-State: AOJu0YytdiOYrmda5tn6du7I92xLKJvuEwApBc7wCBFESsoDnnWbuZo9
	IfE+RecAERUbf7NhP4eLvLNx1SkOE82cv9nQaYeOggr8LGWMZVBIuwZW
X-Gm-Gg: ASbGncuvNZZIov0AfzNBwVZrpiwWlZU9ZNhOlShEYeMommRh4NPrnO37shwdb7ZIDsP
	VswKoypq803XyuCzp0JQRHGfPvaLSBd73VEd0WDBmTswsGiRuxRkTy4qdV9Qg7ui8ZxKKLMtysw
	7gd35d+CHhREZHGbGotURsW2QBP9zSXVOqMTA0ybxMHLYIbQja4P5eraQ3HAqS6lUY7pSCHJGOw
	IDOppeDTSJ4kJsfcYrGcffltthCz8SdNwdjTEkl/tOHCezgjIgWa7G9EJtIUCGWH1R9kcMdcFdq
	qHwGplIkZvYOiCBGklLFtSYiJ7+djduk3WGqvtwEtUCrFHwOmVvvLwIiyk/znWNeX1cxcOboWix
	XfU+4KFxdp8CYtcISkn/aM3dKqVI5+4yJWWodRKBnB9ZBnNN+2jmgEr38udxdi0m7aI1knlwbsF
	I+TxIU2m4+ElakgyVEu9EFzxLTRXu1DkQvO+hrwvg2mhWw/kDV7yMoxevmMGtJRYbsFDLc
X-Google-Smtp-Source: AGHT+IGXaCcfOwLIrQj9yH9WMbrO4UAf1AZg1ch/afDpC4pXgTmkjf1NdqvThLXtmMqqXSWGbWSmXg==
X-Received: by 2002:a05:600c:4446:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-47717e6ab4bmr5964995e9.29.1761588713974;
        Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da645sm14913054f8f.30.2025.10.27.11.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Mon, 27 Oct 2025 19:11:52 +0100
Message-ID: <3382705.44csPzL39Z@jernej-laptop>
In-Reply-To: <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-8-jernej.skrabec@gmail.com>
 <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_111156_027032_C6D6F8E0 
X-CRM114-Status: GOOD (  14.63  )
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

Dne ponedeljek, 27. oktober 2025 ob 17:00:05 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > With upcoming DE33 support, layer management must be decoupled from
> > other operations like blender configuration. There are two reasons:
> > - DE33 will have separate driver for planes and thus it will be harder
> >   to manage different register spaces
>=20
> So if I understand correctly:
>=20
> - the "layer" is from DMA up to CSC, which is the last stage before routi=
ng
> - in DE30 and before, routing was limited to within one mixer
> - in DE33 and onward, routing is global

If you mean routing layers, then yes.

=46or example, you have pool of 4 UI planes and 3 VI planes. You can assign=
 them
in any combination to both mixers. Later you have additional Z-pos routing =
too
within mixer.

>=20
> > - Architecturaly it's better to split access by modules. Blender is now
> >   exclusively managed by mixer.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej



