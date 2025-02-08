Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB4FC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxLH/0mNKOA9oAdJlhcouBluEGl2xAARBS6OeCkhtnM=; b=jHK/yMEBsYwV2pDX4zTUs+x7pZ
	KXDXlX0y+56WgI5GdXhaNF00Hjt22OAX0W3qtp0DmT3lPt193bObDyOWVHleuN1owORwDlfJX6/8j
	Up/90++j4qc15IRlea+ma29NKW/EHjF5DgZApUQUwIj5dzbDEyhImst73AOlZFU119EWuRdxMTlUe
	+gb7hsUtGtj56ESgfZL6AbF9enLewLt3IwoB1e2iTkU19ysj+ySpmylQ5RfpnsiijMECFynr4hT+/
	JcJPsj6X2XgxFW988HmtO2J75JUVql5gBDrEC3dRwyacudKs2EW9sNROt3fg4onw+5GDMM985Up8g
	/1OcIFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb3Z-0000000BxvG-3kge;
	Sat, 08 Feb 2025 02:58:57 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb2A-0000000Bxmw-0FLe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:57:31 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-724a5d0427fso1913620a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738983444; x=1739588244; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxLH/0mNKOA9oAdJlhcouBluEGl2xAARBS6OeCkhtnM=;
        b=JrX/lRalk3G87rXbTDO0N9HaWv+BjyHWltkqHXmOnox3Iec7ykkOiXEaJBw+mrje/U
         By4ZsOW/Lm+H+b6DF+J1NT2nqLYSfAhl8lukqXiOcYY6EXong1Qwt4TOi2xunJTKULDx
         NJAF9n+H5NjC0vh7enrybd7LtOLIFvia23daSy4+4gEIgFadjD1ZMoxtLRVW04mhGmql
         +lKNueJzvwYsllwY8ucjcMaCDp3rbfJKgSinBsUpiKQtLBCkJOqkwxOVgD1jj1NJqje1
         NafbIQNH10T0BylMEKpKIMXOtSz63MpWS2TOYj55k0/y1ciwjBAoerYj5JUa1sCqsi/+
         w7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983444; x=1739588244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxLH/0mNKOA9oAdJlhcouBluEGl2xAARBS6OeCkhtnM=;
        b=AXZTdsALHs/C8Eqoyd5guttqMKkdbelFa8FeaR0y1TY2YnlX4ID7WpTqaiBkQfkm0D
         4g4VtXzmarLSY2sL1y19ZFbI+1+pIxoduauJJs6e4dovOfIE8VlZMNA4QA9P99aqRJTO
         SvyPjLredu+L26tG7yfwenMhod6EfUqR67ONrIC3upJfBV2FMFdGd/prpvqokiDjy3AL
         k0s6q7Vtngd2w4G7uqLogbW4q108lGqUP2PnoVI5EKdcTVWcJRZN8ZGMTrKlePt6m2rL
         6poscGpZEMznUtoWnvJ5WrEeScC0Sd2itB/gNw9EW3dwSWbm9u9tC7bx07brQRUZ/mUv
         7MqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqXnnOxUvN0e7+Or17LWdzT0YzBLT4hCIXqeuPZWx+fJFgxhZRARY00hUEqa3Jmw00C0Ijj8EOc1IZ4P7cupz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz2eHk3RTbC/Eev5bOaT4shrOWKqvR4ofwPQfSKEvAaAN2i4HE
	J3La9JUivoX+rVK7sSgFgBB+mBKmLN1DnTjI+0L2koyR3wTVdKQizoACMHlwiovKS/U7uWAINVp
	ggAapRDwYaSaeiRQkjLuuveEYbuIE3KLzzx2AEQ==
X-Gm-Gg: ASbGncucraG3iMrgGGIfW/oiH7HGjNCGysXMaPElWZGy5hNx0t87tkz0USoSYQBKVtE
	g1AcWj6zevPgQJ5OPAtOZr2COCpUZP0BiFTJKzxASLH1f9CB1BRtVu05C+eogNpPgW6WhyU7S3v
	Y=
X-Google-Smtp-Source: AGHT+IFzDA994qoj0pOD1pwjZKhnb3ZJW/yjhXcqLQK+e3oqjqOgw2RnWRlREyQPjPL3pbFYTWLXVADhEyqMHUGwews=
X-Received: by 2002:a05:6830:7001:b0:71d:de27:8d32 with SMTP id
 46e09a7af769-726b87b457bmr3893379a34.2.1738983444393; Fri, 07 Feb 2025
 18:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20250205031425.67265-1-cuiyunhui@bytedance.com>
 <20250205031425.67265-2-cuiyunhui@bytedance.com> <76dad20a-0180-46a0-9840-6d8444d1749a@linux.alibaba.com>
In-Reply-To: <76dad20a-0180-46a0-9840-6d8444d1749a@linux.alibaba.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 8 Feb 2025 10:57:13 +0800
X-Gm-Features: AWEUYZmxaYnEp0Kg964XX7tTfsxe4wOkRLUxQOmGY9VcBaQMtyFA6anqEU-dkW0
Message-ID: <CAEEQ3wm6vw9AvEtWOaPqLvR3x4vs=KMACN9OQGJ2eAOzuv2GhQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] perf/dwc_pcie: fix the incorrect
 reference count
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_185730_269192_CABE6EC4 
X-CRM114-Status: GOOD (  23.13  )
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


On Fri, Feb 7, 2025 at 10:20=E2=80=AFAM Shuai Xue <xueshuai@linux.alibaba.c=
om> wrote:
>
>
>
> =E5=9C=A8 2025/2/5 11:14, Yunhui Cui =E5=86=99=E9=81=93:
> > for_each_pci_dev increments pdev refcount. Call pci_dev_put after acces=
s
> > to decrement it.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   drivers/perf/dwc_pcie_pmu.c | 42 ++++++++++++++++++++++++++----------=
-
> >   1 file changed, 30 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> > index cccecae9823f..4ac53167d7ab 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -553,6 +553,7 @@ static u16 dwc_pcie_des_cap(struct pci_dev *pdev)
> >
> >   static void dwc_pcie_unregister_dev(struct dwc_pcie_dev_info *dev_inf=
o)
> >   {
> > +     pci_dev_put(dev_info->pdev);
> >       platform_device_unregister(dev_info->plat_dev);
> >       list_del(&dev_info->dev_node);
> >       kfree(dev_info);
> > @@ -572,8 +573,10 @@ static int dwc_pcie_register_dev(struct pci_dev *p=
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
> > @@ -594,8 +597,11 @@ static int dwc_pcie_pmu_notifier(struct notifier_b=
lock *nb,
> >       case BUS_NOTIFY_ADD_DEVICE:
> >               if (!dwc_pcie_des_cap(pdev))
> >                       return NOTIFY_DONE;
> > -             if (dwc_pcie_register_dev(pdev))
> > +             pci_dev_get(pdev);
> > +             if (dwc_pcie_register_dev(pdev)) {
> > +                     pci_dev_put(pdev);
> >                       return NOTIFY_BAD;
> > +             }
> >               break;
> >       case BUS_NOTIFY_DEL_DEVICE:
> >               dev_info =3D dwc_pcie_find_dev_info(pdev);
> > @@ -730,20 +736,29 @@ static struct platform_driver dwc_pcie_pmu_driver=
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
> >       int ret;
> >
> >       for_each_pci_dev(pdev) {
> > -             if (!dwc_pcie_des_cap(pdev))
> > +             if (!dwc_pcie_des_cap(pdev)) {
> > +                     pci_dev_put(pdev);
>
> If the pdev has no RAS cap, we do not need to put the device.
>
> > The reference count for @from is
> > always decremented if it is not %NULL.
>
> Please see comments from pci_get_device() for more details.
Oh, yes. If that's the case, I'll update to v3.


> Shuai
>

Thanks=EF=BC=8C
Yunhui

