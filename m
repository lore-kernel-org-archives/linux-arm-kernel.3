Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29093CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 03:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=; b=NqVP9Q3I+x8S0aNpyKo7hD9sIf
	xd2NI2DIezvR/uP4awj/EtKvlpJ3R9SePnscDc2/5EM0PGSmopV8Uz+64nNZu7PN2EORv2NoxaQXI
	U0HQ8j35UE5aFxPofbYlAgqYY/L1dUEDlWx02MdGegM+LsLpEBnI+xCCP93RyYja3OY7OtfPab2wc
	Y0/DbgkQDZgHq8Xmr3OmtQoJJWDpnK0TXJqFB80hcyghxo30UjgBcinXT1jpwgph62fRo6wOnutds
	gasWAhhmNs1y4cLZ5ahguVZQA3KkRUttKcW36i8FVqrXb5+byw8eZM8CYEqygjgCUJ2F4jdX6k3za
	xIVLtTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQcqu-0000000CanM-1qMl;
	Sat, 23 May 2026 03:16:40 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQcqr-0000000Camp-0sLp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 03:16:38 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69d8b7aeeecso405554eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 20:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779506195; cv=none;
        d=google.com; s=arc-20240605;
        b=Rvf9Laop1bgi4rDsihlEvCewyrnos9DG1gvdVpVsPXkefNnn/YRKxXeCMsLCnWpELa
         cm5yHX2dg9cokEEY2XevJETUn3PVRKcyy2RsDrsXJShbjbIzfRg4RWGObvuwltCZgxBH
         nBEV+cTvUCWNgTnU1kjq7gwQKOyLTcnEztC+AW2YzIxfvAMVtd2Wz8dF2w354GK5Kcjr
         lShsNe/mCfF4AcM+jta7t/gHUYzlVJCxAcwXGLgrk5C5y5shW7has6oguB3ZWkj1n0fe
         3ij6ZjVbKPCa2CQIUToQ0UsM2IeBCSU/yFdvpuZRfHN558lb8DnV6u9QC4ghTE3SlGU+
         GkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        fh=ijKfn35mJEeQ06K6t2EhuzJahhd86+iajDGuPYInFsk=;
        b=cisZN0P8ZJb0GMCGzxrHxwKyolkKtQ9SHoahIM9Q1azi5tfbqNPVtHWOtLHAva3c0b
         wYAczn7uUpJpTmv4YW4bcftCxfxowKeyC8CmjZCaOnCaKzKByvr72SvE+yly5zHMTH5A
         HfM5y0pocPjE62T5dRHMJpr2zMghj7C29wodaWMVFnuj3BAuYhdmHxxbkkYYncH8qQif
         QvVBFr7en85iU03FYja1L50PaTKN2sNMK8SLLIfWVRQ0v8Y3CkGc8XlcrGbfcTff83LO
         30ZOMRiHvPgMQFv3Bn9LfN4whsDmvn7Pspuph66cJVzLq5X2LY4ypKJKxyDXb6pEitj0
         MicA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779506195; x=1780110995; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=TktaP0LOJcQDqQ4pTCefUBH4k/sEfHynQveeVUPoAGNuLY37MUe2acCAGqTHtQvKQz
         4C2xs1MftAEylyHH/itUevotirjA4ddYj+NGj7AHbzYUR6AAeCZqJXsPc1QkhrF2z0LX
         /YWENSpDOZ4nANAijvU9uka3p+whpIm7SNOb+WseIOcrlrvC0mW4XNwZfSi7gGZWu85u
         o0o0/O7klaelz0TQnViwtGp7FI4YiaNX0uvs8fn5/iZuZEswVwP/HlkX21i7NPVMvPd4
         Nx9S28/cTrg4Y+d1gVdp01ZcXUkYoKj+Zlrbc0/bvWa/B3QIP9MvgULvkbiZ9iPQBT8w
         Z/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779506195; x=1780110995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XL9fQqEWbSHtUTzHJNem08rNzq8qxneQBBCAFW0a4o=;
        b=RqbTt/mqEwAMfhqoLGEIl3tYPDxapg0tSMMm0/0jI6zOP77CLp/rWbZi8V3cnmLobw
         UAG9QPn2Z547W1v8V008q5wGEkGgLk1IATAKZA/ilvZAZOnhXaSXQvtwndyB9iKIJXym
         U6a/It9JwjpUsBcpoRQm63i4PA3RTeLaYxYdhsBLl29K38xi+KXN88RPDtuTmKp4k+Yf
         1ZYVe9Wb36Mg05GfgzBKa45zisUzi7laC+2MG69ahfg7tzfWrzwnxc35DvqeTLy8dZQD
         zeLmEl+2uPxtTfE9HMwbXRmHehv3gRdazjQFwkI/jTZlvE84wKuWyXFIUDgWthqBVrqx
         9Hrw==
X-Forwarded-Encrypted: i=1; AFNElJ+a04d+heTstXwhfKomk6x8g6oL1rs4We7g7ddpOE+zVXXYaIq5uParBfXHuTK7yquUOH3SdeNYKvhsu/nB6Wd4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7YdT7dLI40dnZsbc+HVzCTCQgXKSSHmyyZRAcOmU1IHkczFV
	2PNXE32PTWzLO3Tg1/LDNuO7ssjjWF+2Z7vRdZpobWHT7b6eRhL4WoiAXyG5dJ5XtkXHIYSXnp2
	sEPGyqBnTfdhe3JBKg7b/nmlVwC8orcyChDtQ5yQ9nC3s5j0=
X-Gm-Gg: Acq92OHBvyQUzps5YUUnZPJolJpo+76cBCD63dzq7nZyNFzDWNJVzN2kOZJdBAJfPvM
	hJS15vZY2G5lfAC7WHddxABjI+hAa1kvQok0l48SPZ+1aVSUpRxjg1KJ9rNakfijP9tQneI7kJV
	XvfhHi3xKIZkm/UJa+Vcf6/FdF1u3Rf2J4Fr/xN91E61JeHGBK2InbRIRtWwFmy+NtD/mXUmKqc
	8h3VkQj2zBJ3FbT3GR/7XpxvuuixVCyt2aVFKz/N/Dd1wN17a11wC3xD2CvkdDon/jjHvdeWdpf
	26nMsFppqp7R3mZrwuTuOb5Ly+NixTc+hepW9gYQAiWFSkf34ray367BJo0vTEWHIc0=
X-Received: by 2002:a05:6820:4c08:b0:69d:521d:a4fc with SMTP id
 006d021491bc7-69d7ead810amr3088050eaf.8.1779506195590; Fri, 22 May 2026
 20:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-15-paulk@sys-base.io>
 <CAMxPZkg9MgZrsM2L0vKzzUOA_tnSLKHdHkzDsfH5_WRqSQgvZg@mail.gmail.com> <ahA61YIGM4Bqipu7@collins>
In-Reply-To: <ahA61YIGM4Bqipu7@collins>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 06:45:45 +0330
X-Gm-Features: AVHnY4ISNoCKi2Ahpn2OwYGMSPucMAJaRMseXVZ6HijrWpM0v0rlwFD_MrYBAdY
Message-ID: <CAMxPZkj_2h507_3d+5aZe6b5wUrDOpA58y4OcD=D0TTj3FQcog@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: sun6i-isp: Use V4L2 subdev active state
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_201637_257266_394FD35C 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Paul,

On Fri, May 22, 2026 at 2:45=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi Arash,
>
> Le Thu 21 May 26, 12:53, arash golgol a =C3=A9crit :
> > I used LicheePi Zero Dock (V3s) with the following pipeline as test set=
up.
> >
> > ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
> > sun6i-isp-capture
> >
> > I verified TRY and ACTIVE state handling, including changing TRY
> > formats without affecting ACTIVE state. Format propagation from the
> > sink (csi) pad to the source pad was also tested.
> >
> > I also tested streaming with the sensor test pattern enabled and
> > verified the captured output was correct.
> >
> > Tested-by: Arash Golgol <arash.golgol@gmail.com>
>
> Thanks a lot for testing this! Did you test just this patch or the other
> ones (especially sun6i-csi format enumeration) as well?
>

Happy to help.
I only tested patch 14 for now, but I plan to test the other patches
as well when I get some more time, especially the sun6i-csi changes.

> Also if you have an opinion on the code itself feel free to drop a
> Reviewed-by tag, a lot of this work is very similar to what you did for
> sun6i-csi and other drivers.
>

From a code perspective, the changes look good to me.
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol

