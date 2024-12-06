Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421CBE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 00:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyWqX2zoZLFRt3ry2g2R9lR3izotXfaeTSy8KYkYq3A=; b=AMaBYBHTs0ViU8YLARR8Uv3oQW
	oLuuWG9JwtJtFTm2y/ny7QlIgOB4+ogC/B+9KJnCaQB1B9U72rNsdUGV2zgCjuD5CowyjwnjWkMcW
	ghFH9Ja5bjZf2i6f1kaya+Y4b14EUMiCZvXFZueew/w/NrqEFDkItWZoALUwbkca9TKPjJh8SlFvm
	nYmuWawcd17/IkVaqFaC/NC/WWLV0I3jSXKibPhM6tZhY8xbObd7QjGTvhD7lhM8dOKSeLew4Uhe2
	Z7/kWP79sHREGqtB2bYmoqJrJ5PS3mPQsiwBPQtct3Hy5JT+FYyvox9RAlG7hWuGRv791u+88Xf4o
	/cyU2+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLvj-0000000030R-3Utp;
	Fri, 06 Dec 2024 00:10:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLtP-000000002FZ-20vU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 00:08:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e2ad03bb3so423534e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443702; x=1734048502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyWqX2zoZLFRt3ry2g2R9lR3izotXfaeTSy8KYkYq3A=;
        b=FFpzJXl5asmgRaVBG4wX80toWslt4PNX0R1fWOjYqmA+XO7s54cAO8TmAPs/gJG2M0
         p+uX8sElfj/kZJw0d7Uh6RDmYMtHM0wkcLchDvZWYxyyEFd5MHqxCMzKQq66wVtg6nD/
         LDWCk1elzHHOiRyPtJDUz6z5SWQvJQAwhlulTW0EOpOHckdNIWvqhPI+TCuY3N4+FQ5O
         Cf1ICm/Zf893vCLNiAJEUZwHYf/QHJKbvfi+wIFotWCYemH24SXXg4het8hx0x3QY43A
         GDyQGKsEynkR1xiyNb513/CAf3RivzfZBRzGEFhd3Lxkcw80gf5G8Z+bN1RRfj37dkqC
         9uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443702; x=1734048502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyWqX2zoZLFRt3ry2g2R9lR3izotXfaeTSy8KYkYq3A=;
        b=tFzFAA7w3oxHe7+k2JE14JTNhZZI1pXxInoyH+965KXIYr2gvxJX6nF7fYdLjMjHwQ
         mhUzQNG0v7mVFx+LP7pPTMMR5d00CH4peUXAz/JSvaU8JadotAj/LOS3yUiMl2VIYUOm
         8J35KHAY5nwxX3cEoiFJtfbkRJM158yYud/244NziagmCWP1iAQrDHTTvlH4gzIfsX0q
         vbBgvsFbHbAfZOP57qZBDWmXvpQkXT6frg0kwqDnOivIvjBp51oc4eES7xyo0Mg7OT/s
         SoZ7IbN+xPpDEfX1j0Hvab+TpC+jVd0zvw1O5XtDwoMmW69ZM2wuk9zkLf6LzDS88xvK
         DUAw==
X-Forwarded-Encrypted: i=1; AJvYcCWpISRy+WjyjPROhqhyF0/gJA2nljV5HCZwqU7dvxTRhYsa3Jc1Uplia7gMoh3NQdte0dbTNbHa5+I194GflybT@lists.infradead.org
X-Gm-Message-State: AOJu0YxjXtW5dk1IIVRwxLPf5p1JGTpI05a5OYhvBknjdQmqCd6udiJc
	wHdtEMtdXnwv14Q3HFzJK51WlZcqy5ri6ex4sX5qy4Qi3dk1WGw80ZaQbZAmHwa6iE1d8IkhelU
	o7hjkdos47fD+8aeaP1fUwt4Ynfm/+svZjZhb
X-Gm-Gg: ASbGncvID9H9DVzYZ8EhOlB4Cz1Va8tX5UhXX53DeRsUJvp7hJym6eLMrCz5iKcjL9Y
	Qjj3dR/OvIaWoV9D+ZJOTFp7R2oPZXA==
X-Google-Smtp-Source: AGHT+IEl7P8g4C6biT8pMmR7TEmB0gJQnY7JWx1axpsFaCZBcd/5qdwTwlQeic62GJWu2sWz95sDRQrA+1CjugfgIXQ=
X-Received: by 2002:a05:6512:3993:b0:53d:ed68:3cfa with SMTP id
 2adb3069b0e04-53e2c504c30mr241237e87.55.1733443701768; Thu, 05 Dec 2024
 16:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org> <20241204221726.2247988-8-sashal@kernel.org>
 <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
In-Reply-To: <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:07:45 -0800
Message-ID: <CAGETcx-6yHV5xr1j7krY8LShCF5JATX0NSwjeRUL9+3TLCMq9w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net, 
	sumit.garg@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160823_520027_DBF77985 
X-CRM114-Status: GOOD (  23.83  )
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

On Thu, Dec 5, 2024 at 4:06=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wr=
ote:
> >
> > From: Saravana Kannan <saravanak@google.com>
> >
> > [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
> >
> > fwnode needs to be set for a device for fw_devlink to be able to
> > track/enforce its dependencies correctly. Without this, you'll see erro=
r
> > messages like this when the supplier has probed and tries to make sure
> > all its fwnode consumers are linked to it using device links:
> >
> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) w=
ith backlight-lcd0
> >
> > Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca459=
8@notapiano/
> > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> > Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@goog=
le.com
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> As mentioned in the original cover letter:
>
> PSA: Do not pull any of these patches into stable kernels. fw_devlink
> had a lot of changes that landed in the last year. It's hard to ensure
> cherry-picks have picked up all the dependencies correctly. If any of
> these really need to get cherry-picked into stable kernels, cc me and
> wait for my explicit Ack.
>
> Is there a pressing need for this in 4.19?

I copy pasted this into several replies. In all those cases I meant
the kernel version mentioned in the subject.

-Saravana

>
> -Saravana
>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm=
/display/drm_dp_aux_bus.c
> > index d810529ebfb6e..ec7eac6b595f7 100644
> > --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> > +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> > @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
> >         aux_ep->dev.parent =3D aux->dev;
> >         aux_ep->dev.bus =3D &dp_aux_bus_type;
> >         aux_ep->dev.type =3D &dp_aux_device_type_type;
> > -       aux_ep->dev.of_node =3D of_node_get(np);
> > +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np))=
);
> >         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
> >
> >         ret =3D device_register(&aux_ep->dev);
> > --
> > 2.43.0
> >

