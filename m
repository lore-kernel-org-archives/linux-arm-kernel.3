Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F1BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgMKlsrMP1eBCbeaAVjxhZXck6mumn4aUs8hwiTVomI=; b=w7/xJDFIgmJ5m5JvnVhW8cK9eV
	AD/oRFunqB+aYbxD3G5yk9a1/euT3aLHP6n4zQVZcPUgsNrQKnrg4EIOQ1FaBKYDC5wViceM2gmFv
	6a5xCyuDWu6HL3rJ3M8PUeQDu+flbMAvGgo17vIz8+1tLJYe1Q25wJZZ7/gFaom8CM5Fv9qOvY+fr
	jhFpiYalZh0OwG2aaws51Y0OwraSA6clPKHQQeEf6WxnmPHqpOJYV5Ffp1x+zIFV5dP6W2hnN9WN6
	ffPzz7wqRjcCrHaKYjCuMZNSsp6ktCfgH9eP/U/Ifo7HwC7/bAa+MrSDFxcn7d3SYjoQYiNXY5xol
	j3rBRY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ2u-00000007Ikl-2vyb;
	Tue, 18 Feb 2025 08:33:36 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJ1J-00000007IUj-07OX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:31:58 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5fc01d3faefso1543153eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739867511; x=1740472311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgMKlsrMP1eBCbeaAVjxhZXck6mumn4aUs8hwiTVomI=;
        b=g6d4Y4lRanh2Snb4tiLVSA5zU3qVlveBb6S7CIhE5moIZ/IKL7Qjul5EcNjQuBA3HM
         Jn+q8hCsktyzJ6Zo6vBu/s6FsHHTPfVGwYwdnxX2AVpWtM9tanaqySnjIbKYxtEuJHKJ
         r91wwrnliq0qnl/Whd6tdcvK5Dkaw10LvUkQpB/NkFoGFlznt0RhVdGkXGZKErbnt2TD
         TPblhjza6wPoxvsylb5LMXPzi4ecy8vA6lrbY8rgd6mo8xwuAHhmfWXLaO8mcj/U/Zi7
         NJTZFESkXNaRo5JEO1djcSzKcnYcX6cFztSMkuYPzXErz5DNOJin75MLvTk1c+j8ECHp
         cZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867511; x=1740472311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgMKlsrMP1eBCbeaAVjxhZXck6mumn4aUs8hwiTVomI=;
        b=HmCwwBPMStaFfrJp76u7n6QBdpV6PIv6HFWuOqIzDnkpXSGDZVaeX33U0iyl57fWL0
         pUfSKYxxXpmdkd0NsBXlN8VbexicRxNJm0cur+1CKmvsHZ6Nt5gm5HmiU8bL2U6cC2Aa
         AQlWP5KIb3/vS+8DTSRg6xvU6il06Gw4NxfOVoQY33NTd/3YU+eoqUsRVPb7aE8NCNEQ
         k2snne82Iwgy/kjz+gwY+TQYAZuR/vsvKfkgVlAt9DRNFMuU6k7TGsAF2ZA7khRcy0XZ
         YhSt1Fd48lYt2ThjJbtEfl8altaBCeRx2JQ35WUAztX//2rSTNmoNWWl0Ao9b9I7EUAV
         nUAA==
X-Forwarded-Encrypted: i=1; AJvYcCW8QQl14/bToeF09envec/Py3duGROUcObYCxylPBxx6NqnQFIeBanMjZHR1wsceYgBvkbR2DSKxbzrkONlYWs+@lists.infradead.org
X-Gm-Message-State: AOJu0YzIyTt9swK5yX7iVyIOuGNLdpdMJbiwDFNHHZDdS9C342mJ+qMv
	Orf+qZv42yzNGxzvg2GslZfra3t99j9zeRA53aW7XSLeHQusn7fA51H5V1XFaS+dOSpbwHABVio
	sInUdb0YxsmcC/BYFZh4y+5qihyhTRO1HyBUgcA==
X-Gm-Gg: ASbGncvgTxv2+8kGo/eLP50nMqJtaM5Vmy0r/2D0IFUxaRJLv4zwGg5Z8Yr29k5OPDT
	DWO1aJTiOvcSDE7PaqX+hE4vEArN7NF0jS/57baYCfm6w0wzkG4P8c78OTijHB0YUhpTz1n9hUl
	c=
X-Google-Smtp-Source: AGHT+IGHJuM9IfNPGlGcPH7aa44uhxOWYRwrS2rEKmNkeW+giAvfsVbkjj5RarhaVn+9MIgY3oxSFWNSlHJgrM3c2SI=
X-Received: by 2002:a05:6870:be8b:b0:29e:3531:29da with SMTP id
 586e51a60fabf-2bc99a937bdmr9235473fac.9.1739867511250; Tue, 18 Feb 2025
 00:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20250208104002.60332-1-cuiyunhui@bytedance.com>
 <20250208104002.60332-2-cuiyunhui@bytedance.com> <d1db3047-f478-4d8f-b9f6-e7a5820d5a29@linux.alibaba.com>
In-Reply-To: <d1db3047-f478-4d8f-b9f6-e7a5820d5a29@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 18 Feb 2025 16:31:40 +0800
X-Gm-Features: AWEUYZkcD7V4dyG01R1nkwYjrYmf-ApvAaWIkuajdXDd_s9zqaV_RoEhFC_HhyY
Message-ID: <CAEEQ3wmaD61DMV0nXrQeVEk6r-J3JYxFceXZmH=t0aQrESqJew@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 1/2] perf/dwc_pcie: fix some unreleased resources
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_003157_367008_8B6E8C42 
X-CRM114-Status: GOOD (  21.36  )
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

Hi Shuai,

On Tue, Feb 11, 2025 at 4:05=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/2/8 18:40, Yunhui Cui =E5=86=99=E9=81=93:
> > Release leaked resources, such as plat_dev and dev_info.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/perf/dwc_pcie_pmu.c | 33 ++++++++++++++++++++++-----------
> >   1 file changed, 22 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index cccecae9823f..19fa2ba8dd67 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -572,8 +572,10 @@ static int dwc_pcie_register_dev(struct pci_dev *p=
dev)
> >               return PTR_ERR(plat_dev);
> >
> >       dev_info =3D kzalloc(sizeof(*dev_info), GFP_KERNEL);
> > -     if (!dev_info)
> > +     if (!dev_info) {
> > +             platform_device_unregister(plat_dev);
> >               return -ENOMEM;
> > +     }
> >
> >       /* Cache platform device to handle pci device hotplug */
> >       dev_info->plat_dev =3D plat_dev;
> > @@ -730,6 +732,15 @@ static struct platform_driver dwc_pcie_pmu_driver =
=3D {
> >       .driver =3D {.name =3D "dwc_pcie_pmu",},
> >   };
> >
> > +static void dwc_pcie_cleanup_devices(void)
> > +{
> > +     struct dwc_pcie_dev_info *dev_info, *tmp;
> > +
> > +     list_for_each_entry_safe(dev_info, tmp, &dwc_pcie_dev_info_head, =
dev_node) {
> > +             dwc_pcie_unregister_dev(dev_info);
> > +     }
> > +}
> > +
> >   static int __init dwc_pcie_pmu_init(void)
> >   {
> >       struct pci_dev *pdev =3D NULL;
> > @@ -742,7 +753,7 @@ static int __init dwc_pcie_pmu_init(void)
> >               ret =3D dwc_pcie_register_dev(pdev);
> >               if (ret) {
> >                       pci_dev_put(pdev);
>
> Should we get a reference count of pdev in dwc_pcie_register_dev and put =
it in
> dwc_pcie_unregister_dev?

Personally, it's not an issue because RP devices are generally not unloaded=
.

>
> Thanks.
> Shuai
>

Thanks,
Yunhui

