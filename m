Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD9ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKCZT/K4e4byUQqhyOs9c8fQ3Jbf6/69LbbDKjwZwLE=; b=HsWv/JYqw2OLKHQtgrgIzI5ndC
	2G8z06k5UcjzbrL4b4NEZ6LJpTzNfKfnIAcRZzNSVPBIKR75pnGUBLa50xRFvIFWkTca9PwgujYQT
	MgSxX0zuYc1pSzqc+Uj2H8f0Rt8kBRBgk4tkWWCLiJvkLQQuQkxdzlhttde8HLsWE8hWpaR2MzE9b
	ZnGmom+PFNfnADhiqyKL7hbFv64HR2nAq9hIWmjX4Vt2jNzjpjGLwDmot88ZlmSR4wqMSH5m92hoG
	sp54M+8AVClMf2TwjOpb9NvRyqV1CLh9aQLzaj9B4oy/EU8dkPN+1BFoC17TbD8vNMXFUotHfCP+8
	KxeZaeTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBzI-0000000Bmek-3Mxd;
	Fri, 12 Sep 2025 22:11:24 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBzF-0000000BmcZ-43vO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 22:11:23 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ea0150ee46dso1986191276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757715081; x=1758319881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKCZT/K4e4byUQqhyOs9c8fQ3Jbf6/69LbbDKjwZwLE=;
        b=ZCUfiN+HFqvwX+TaPxMBVhCPfLUrf3/CS/HXyueDYsuMDJ4VDb52q3xupnI7paMf+o
         +9qJoUlQmM9dpQnwj0O1/fIW1yyc8Z8z9OU/bxSFaGbPlXxqF6uijB8fvzL8gFThh3/r
         mM1dqLdl5XwtFh6zpc2dpe7KCx6d7mwhR0H2gOdSAfivA4mu03/9R6QhBfVkC1sAShq0
         WKI0V1uDgP7msIHVhx9uljhYab3EW+peNKN8BAJ6QS1NuJmZnU2K8ptmukAouZCCIb6u
         9dqC9ggfuQ9bapbUIEVQT71mQdFE+Z871kL06HtvuwRjgXkMuAwnSWwGJprScXICoi8x
         8+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757715081; x=1758319881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKCZT/K4e4byUQqhyOs9c8fQ3Jbf6/69LbbDKjwZwLE=;
        b=lRc6v/apsYxfhL5wE8mMt1d+gb3OUm9o5hlS6OBFe0cWV3Edi3ivP7Snv9gFUOQxgI
         AUnQZ18AJ2qz9mf7dHDJDkfon3BwBiC0nc2HKdavU6pML6AmoRUM0xorvLfrbsbBSzcv
         yXUQjemcOhPF2Fry4Zg87lZl0rrt/MAkdfpOqppUFgk7Jj0vv71yqOuhrWgIecOzVlMO
         9XS8kAAd/2li5yFK7sWZ2hM+OPdsXFGLy9FshSZ51nQFHeuD1k6jr1MByuu9dLvcovqt
         FDhvgrAnFM044RH8YzaSIc/OsqIZcJmxsUVj4LL32HmVvZOs2xcPtQ29Xu+kJ7WDj6Ug
         w77A==
X-Forwarded-Encrypted: i=1; AJvYcCVjIlXYjzjFkLXM0DRwhMQe0hCiWi4PBJKOO+oCNOl5w7Pgiz/DMc160F1grU77Dn/zZdwjRX/IjBox7lVj9QMG@lists.infradead.org
X-Gm-Message-State: AOJu0YwvjMSbOM0mE50U87NK3rULqbvMmu+paLqvjW4q5p2HlK39iQ9d
	kkZ6bpFHoiHzHZsmWjZDklsS63dJf87QhtbgaeFAqtFN1/AgMJndE8JqW+7PKyVZrJIvWUl8LZy
	0gneARB429sVFkb/zvOIMPTMSFDoPyTE=
X-Gm-Gg: ASbGnctntrALsk974OJlz6EIIhnFkePwZwvi1r05kL7dnzHkl8vEY9TSR9lFt0BJOkP
	YowvDOapO6Au67wvwwEJe11T1m+Y9i68a60U3laIbRyOfL2gZceijLhhFu7OmIF3mFlK9kfvqDA
	/Je8AMVHSBAwY870nwWXMek0M7R61E61LsNabVMF8OchK2zXcySkwhL3DL/a7Zqxi1oygtZxhet
	CY3VhHOYN866LhRgYSKSAgscx4K+dtDGiOB11lSvOc4BdsmKFidyWm+z5GBLboQ2lnFr2wR
X-Google-Smtp-Source: AGHT+IHvIYQO4e+EnIIRJTQWJn4b+DyuGOUZd4hIxE3/1w0g4hnoPddMFEkakoXj6yfAPLr17VsI/RA83QQAwziujdk=
X-Received: by 2002:a05:690c:4c09:b0:723:bd6c:4f2a with SMTP id
 00721157ae682-730625cd9f7mr37664467b3.7.1757715080775; Fri, 12 Sep 2025
 15:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com> <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 15:11:10 -0700
X-Gm-Features: Ac12FXxS_5OX767ts7gHLmsyJJeyNECHrzeeo_cAOYq8vugrFis3NtJYNr5wYEs
Message-ID: <CAPaKu7Q+KAzEtKBWy8KO2Kp+H4y-Mqo34uo=jgH1_iooaDq3hA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_151122_015595_3F53260C 
X-CRM114-Status: GOOD (  17.61  )
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
<snipped>
> +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D data;
> +       int status;
> +
> +       status =3D atomic_cmpxchg(&ch->rx_status,
> +                               MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
> +       if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> +               mtk_gpueb_mbox_read_rx(ch);
> +               writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR=
);
> +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num],
> +                                       ch->rx_buf);
Given what other drivers do, and how mtk_mfg consumes the data, we should

  char buf[MAX_OF_RX_LEN]; //  MAX_OF_RX_LEN is 32; we can also
allocate it during probe
  mtk_gpueb_mbox_read_rx(ch);
  mbox_chan_received_data(..., buf);

mtx_mfg makes a copy eventually anyway. We don't need to maintain any
extra copy.

Then we might not need rx_status.

> +               atomic_set(&ch->rx_status, 0);
> +               return IRQ_HANDLED;
> +       }
> +
> +       return IRQ_NONE;
> +}
> +
> +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> +       int i;
> +       u32 *values =3D data;
> +
> +       if (atomic_read(&ch->rx_status))
> +               return -EBUSY;
> +
> +       /*
> +        * We don't want any fancy nonsense, just write the 32-bit values=
 in
> +        * order. memcpy_toio/__iowrite32_copy don't work here, because f=
ancy.
> +        */
> +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_offs=
et + i);
> +
> +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> +
> +       return 0;
> +}
> +
> +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> +       int ret;
> +
> +       atomic_set(&ch->rx_status, 0);
> +
> +       ret =3D clk_enable(ch->ebm->clk);
> +       if (ret) {
> +               dev_err(ch->ebm->dev, "Failed to enable EB clock: %pe\n",
> +                       ERR_PTR(ret));
> +               goto err_clog;
> +       }
> +
> +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> +
> +       ret =3D devm_request_threaded_irq(ch->ebm->dev, ch->ebm->irq, mtk=
_gpueb_mbox_isr,
> +                                       mtk_gpueb_mbox_thread, IRQF_SHARE=
D | IRQF_ONESHOT,
> +                                       ch->full_name, ch);
I don't think this warrants a per-channel irq thread.

mbox_chan_received_data is atomic. I think wecan start simple with
just a devm_request_irq for all channels. mtk_gpueb_mbox_isr can

  read bits from MBOX_CTL_RX_STS
  for each bit set:
    read data from rx
    mbox_chan_received_data
  write bits to MBOX_CTL_IRQ_CLR

