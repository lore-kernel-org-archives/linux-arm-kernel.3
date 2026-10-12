Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27C8CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=; b=BAxZOgr8w0kqMXOn9CQNOOfOBg
	9TE/OozDbJm0pSvDPc5hB68ltvgxfzFRIdjoHzNAjOqWHxBINl5BuJfN09ZcqppQcQGNcsk4C0k3o
	BASyTEnW+UbZtUA3tcauVi6JnoLMQGzw31hiRTQwqgqRNrjyJ9Oiw4/A9qNdB+83EGNhlNKAaVwvd
	wGxCtdKaJWCKZQFmhtxjywFXqZPHkzEBUiOEq1rBpB/JbmBW3iY/ax9WXnRtET2VQcx3lrVBxmeiW
	fitG0J5gkhMPL4VMTZzuwh+DmBWzuRiF4db80o3yTOGwIuyo5rtePsK/C0GVZlM3JY6MKBDRwHzOn
	hT4hARbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCKD-0000000A3fS-32U9;
	Mon, 12 Oct 2026 09:28:05 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCKA-0000000A3eh-45Sj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:28:04 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so19054021fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797281; cv=none;
        d=google.com; s=arc-20260327;
        b=XL7ay+tKFG3zAfnp63RTJ/mhq5xPTbGA7h2mXBFcTc/DKTuiA1VSJ7maN+5QaiKaY2
         sFCpmMGrlGmWIw4921Gdkm/avfZRajX3ZSrfeHg0uacpbbw2qHqb8fexgbHCqU8PQ21A
         OWOuKwwefLt/m30IHgX9Qq7tzHoegSZlmwsy4yQUfIzeKpnM3vUCxqNe+BU7OL2dhLJO
         yrHzjXOhisNZ2eGWj/yy/TbhTrqSDiZsSlUqUuyf2SZBp5vXqU5u73Oe6vUJsvC+qOD6
         JhWPL/ssqagiDDiilmHMuzKTIQKTWQSAlZQ7Mg8LzZgbuITKjsz++mDmLFbrhD8WPbaF
         knkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        fh=7PQefjhFwVD32BFUPxIpfCVzTQLM8vqOckvPc/4OGio=;
        b=TIT7JMEr8AvngWzHmN+yoNjo1DxgKerW6CUVYRyFBtubbsp2SXcm8x2ZVHgJ6IglRd
         tqA7qi1bFb89Eg0qnHeOEDDObLkL+jz4hk6fF65hs8aBqYQ0Fs7Hj7Eku2BfTi0rmjai
         c46jc5ldkLR53zk41/lC8Ux2QE9k590+hSX+NhfRzbfaTCfG1+mtZebIZ6I5Q885OjGm
         vZJJIeh/mZ+zR4XuUNKuMXxCzs7Y08SfZbt4h9AaIKTHuDefDy05m89G9JGnRgm2KDnH
         Y0fFU4Gj023XfSQrltBzleSLwr9MT+oiT4g45L3oepXv9hQK0Y+W+aCbj42uF8mSYj6c
         jdvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797281; x=1792402081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=WqgN7wSUB85oC2TyhEFqfMrp5PGMWHKiHoNvoggGLbKtv07rmbHGI5/rmdDG3XA41D
         CyK/84LoptQvIJz1VhQz+MFBujtZYw5j0WjCy/MHyXGMqCEd4Sqg1nQ4/SQW4pKfEiKa
         4ueXyJvkLp6e0UwzbhQiItkn6+RCHynBPen5Mw4uwlvigDYqYZ6KeMx03zENguBFUCP+
         rxyCOehnovUslL9//QBk4ZY8vb1a3gICJJ93jRcOjKW15IkHSstBCUJ8+hZorFaltZO8
         VLSubYq7ygpRRGRs8AdUfp3ocfja3mw6Gu8AF2gF8jF2na/u/VLfHc4jEsJoLILj8Ig4
         HniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797281; x=1792402081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvmpQMhsElKYIhMGMYI2OVNGAllui7WBWbcRWxS8qE0=;
        b=01kyBWqrGFCZ/6G3+Gk4nSzUd9uxSzY8mz1G8E7BmUOkfXmvYhtq5/IBrlkld9CFC3
         nEV9wgsRuEVEENr1QNeleBfX4lPVrGxFLNLHuz4IH1NqVvhcXeMuDP1sKQsz3CaBkYsS
         OG5kiDIJ8XKTOhSTcenTcKEXxVXv9/1tyHbKLVwmzQ/q8EWoe72EExppKpEB/3uPX+BY
         gLyXuoPofdNi7gPmDvTLhKgnWo9vALnBwwtCuX+pK7n+pOC1LZGQ09MB8DkJuKQhumqB
         Q45gBTGImQhbpeFZbP4zZSTIhPkdHxBFXeW2BCLj31zax0z+kYRkUBYWzj/C42+dPAnj
         Yycw==
X-Forwarded-Encrypted: i=1; AKwUvBzqIHHSvQE0o+IR3EqeKan8K8aMez2ETBhmf44Dm2hkESVcjXIEe7ORI3vk0DKBEyOF6sYYrosgCvOX8I0NFEB6@lists.infradead.org
X-Gm-Message-State: AFq9FYJAxcVg0kxIA//NeS8DBfgGkIZc5eLB+uQZhOsYwvea+KwTpQY7
	ZdGtAoJJDiKhuJ8GvcQSM7ZG55BGCq8Un63MGTY6m8YeERdlaMbGY8rfFXaIrQA/cXIxidisotG
	bi0m9GcndNlud0oniMVmJZo9+WgCfBA0=
X-Gm-Gg: AYBFou0U2jm1rP3EeL47AwOYzQXC23hbcFKV5l4fejMB3n69Gen+j+qsjTzOJ/ENU/w
	3M5M+Uk/KZq9tez2qbIlbhlSFsb8Si9sYJUoO1lpMBSojsouGbXVGzeRrGtrwGzOM383SXjOBrr
	KbQM070Ydck6wTwMS+arYgPa63ahwctouNObyrZ98SswHWmjZrDJRo7KkoBPLrlw8pTF7h+XyQt
	SvLkZMWbyVEuYxZrPryRFXzJ1ipPKImsa6KGsWOqB17pEf9+pRR6I+8Kx3u92Io+5gRLYIRASaz
	9DZ+QlpF0YFTYk41bL+hs9iwFf3aOzjmmD/pI4gCCkr4ydZwOz8VU6qYv9424ORP1lTYAK9+4Ro
	GZcY+QUCNbQj4wprA8LehchphCVvs0gF566RmaOeTc7j9DnB4g+/TxI8RyubtcU9jayOd5cVgxR
	6lk2VRj/kPUcYiHwDzRBASSyIF+PRDMiEq47Md4oHcefsO6GvUjR0=
X-Received: by 2002:a05:651c:2105:b0:3a9:7244:e861 with SMTP id
 38308e7fff4ca-3a9c512683bmr23826781fa.3.1791797280833; Mon, 12 Oct 2026
 02:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:27:24 +0300
X-Gm-Features: AclHuK_r2Y_fKFcYo0k3f82kRis_dPW1IUC88HSmLwzwEEkzairYJHYuqRzAsKY
Message-ID: <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022803_030919_6C35CF00 
X-CRM114-Status: GOOD (  14.53  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior.  These properties are
> invariant for the lifetime of the device.
>
> Extend the hwdata flags scheme introduced in the previous commit with
> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> This replaces the repeated device tree string comparisons in the
> suspend/resume path with simple flag tests on static per-compatible
> data.
>
> While at it, clean up mxc_gpio_generic_config() to use a local ret
> variable for clarity instead of the =3D=3D 0 comparison.

...

> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WA=
KEUP,
> +};
> +
> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata =3D {
> +       MXC_GPIO_HW_DATA_COMMON,
> +       .flags =3D MXC_GPIO_HAS_PAD_WAKEUP,
> +};

Okay, if you want to deduplicate that, make another data structure
inside hwdata, or wrap hwdata with flags. But really, kill that
definition.

--
With Best Regards,
Andy Shevchenko

