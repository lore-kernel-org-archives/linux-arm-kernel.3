Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wg678tNAXdRZkkapitg96TNog1Ghit92yl5gbeQUJs=; b=MohO5xaasD9ddObpXn68DstNPN
	KtAJ5QgDK1QPeEg4RVTxKKLiZlrlX3JDOgNy64lg0yZ3V33knb+1RTuqcugT17z8dztPtlQU4qmrZ
	kS9ucIxwIaKhxnARs/fZvcW0Zaw9WYVZyMuHPUkZc98e5WHw8hTgy6j6JKem/AP2AJcmr753l4HmD
	Mkoizdr+alzxScGdUxTfZrOhi921MSsrlIWLmWL/8UR3yNKOC0EOxcTGQxVaiOgk4zF+LNn0NynMN
	BgBAAiKDs5rViweqUHHnWDZ5QrEA/W/vN4OuPV9A+dMWDbEbfGSvVqdI2mtYip7XrVDz/QzBLn26/
	pJAt4+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1pb-00000003WGt-2gbA;
	Tue, 07 Jan 2025 05:08:43 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1oM-00000003W9w-2NjG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 05:07:30 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso158607181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 21:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736226444; x=1736831244; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wg678tNAXdRZkkapitg96TNog1Ghit92yl5gbeQUJs=;
        b=QJUqm8j26U46bXgB9bzy8DIEd/JkYrXVzf81tF+vLazaFsR1Vg9J8KYJmqVnRuljWZ
         TTwOBIr82Kh1lkWy+btNIg6dF/N5TWafT8+sbJUl1XiZLWcnaKJjffHepNTcE8W5jAEu
         l5/D6jK1k8hlksf2mxRjFtwDF41i79g3bxTkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226444; x=1736831244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wg678tNAXdRZkkapitg96TNog1Ghit92yl5gbeQUJs=;
        b=GRduwFAaPrvoDsX4KHjdVNAS6dwY6gKPTZBfSWjqseR2Z0kSo30yqzG+3DP0FRuyms
         rIfSGSF0lnCIyWfoIv2jO6dCvllfmGsC8soXhoYIlIGRxq4eFMFoNx6QEs7HHFdHSrw0
         weWLJDrUq0WmkitQh0vPYtHueyfbzEygMNRvv+7yirFbzLcBTiiAIgfodIz5pp5jVmlu
         +mm8fZHBh1ZH13eQrFSiUB9Pm3ume3LrMjmUPrhfe6WobPt1dhZ4dbEoEkEMoo8jkpdK
         WYSSGF++qUdo1HDBG6T3sHVUSPzvJcvvXJV2+ChaVHtBHzvpq3hxSCYbK6Q9CCAVhBtf
         zw9A==
X-Forwarded-Encrypted: i=1; AJvYcCWKzmzUkNCbqU7idPvNZoUWeRKdviwXrtnCHAhpYn1fwA9FiUlgCc27zftyMb8wXwicZKqvLtJMic0i45B2uomf@lists.infradead.org
X-Gm-Message-State: AOJu0YzrVlted/nd1c3WwsjIB1ftIgSEyLJQ5KBjgvOUYyGzi3FzQ/Ul
	233wjMH053yyy/mRf6mUKlq4N+vFSggrKfg1TDZIbL6ZRBTiApvWIUY28c9X7eqNkNsDNFUKIlm
	ICJhO341Ay4ByA4/n7bz5bNuSwIjFnFKF29lx
X-Gm-Gg: ASbGncs9owVT95t69rItk6lpe2BWdrSJhSaUH+AGs05N/iP7uSeEDI6SvOUw8PYwj32
	NJUmH/ictO4iLc4/cHiTQSQsJD9q5cXswzYbDJUGBUiuu3YC9xFpIOk2tuDsEaT5x
X-Google-Smtp-Source: AGHT+IFLiMjxu40TM+UVieh0Bd7i1lzubM2AaOkks8cek/BeR7xzlhz5A3bDMGs9Q7HwEqfELllu4ST8mmu2IBdFiYQ=
X-Received: by 2002:a05:6512:b0f:b0:540:17ac:b379 with SMTP id
 2adb3069b0e04-5422953c451mr13347762e87.25.1736226444371; Mon, 06 Jan 2025
 21:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
 <20241126025507.29605-2-chunfeng.yun@mediatek.com> <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
 <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
In-Reply-To: <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 13:07:13 +0800
X-Gm-Features: AbW1kvYyYtMKXXkgB8owp0uoo9z3s18dWodz3XR3LaPnMpcD1THVU7CSsiHgTFU
Message-ID: <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_210726_609510_83B8BBE9 
X-CRM114-Status: GOOD (  31.20  )
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

On Mon, Jan 6, 2025 at 10:58=E2=80=AFPM Chunfeng Yun (=E4=BA=91=E6=98=A5=E5=
=B3=B0)
<Chunfeng.Yun@mediatek.com> wrote:
>
> On Tue, 2024-11-26 at 09:50 +0100, AngeloGioacchino Del Regno wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > Il 26/11/24 03:55, Chunfeng Yun ha scritto:
> > > There are 2 USB controllers on mt8196, each controller's wakeup
> > > control is
> > > different, add some specific versions for them.
> > >
> >
> > Is there any MTU3 controller in MT8196, like all other MediaTek SoCs?
> Yes.
> >
> > If so, then please just add the wakeup control to the MTU3 driver,
> > otherwise
> > we are going to duplicate this for yet another SoC, like we've done
> > for MT8192,
> > MT8195, MT8188 and MT8186 already...
> Even I add it in MTU3 driver, I still need add it in xhci-mtk driver,
> some projects only use host mode;
>
> I can also add it in MTU3 driver and send out new patches.
>
> But it's not a good idea to duplicate it into MTU3 driver directly for
> some SoC which has limitation on dual-role switch when using upstream
> driver.

I think the idea behind Angelo's point is that MTU3 should be used for
all projects, regardless whether they are host mode only or not.
The hardware is there. Don't hide it.

ChenYu

> Thanks
>
> >
> > Cheers,
> > Angelo
> >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >   drivers/usb/host/xhci-mtk.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> > > mtk.c
> > > index 3252e3d2d79c..31223912b0b4 100644
> > > --- a/drivers/usb/host/xhci-mtk.c
> > > +++ b/drivers/usb/host/xhci-mtk.c
> > > @@ -113,6 +113,12 @@
> > >   #define WC1_IS_P_95         BIT(12)
> > >   #define WC1_IS_EN_P0_95             BIT(6)
> > >
> > > +/* mt8196 */
> > > +#define PERI_WK_CTRL0_8196   0x08
> > > +#define UWK_V1_7_CTRL2_MASK  0x5
> > > +
> > > +#define WCP1_IS_EN           BIT(7) /* port1 en bit */
> > > +
> > >   /* mt2712 etc */
> > >   #define PERI_SSUSB_SPM_CTRL 0x0
> > >   #define SSC_IP_SLEEP_EN     BIT(4)
> > > @@ -129,6 +135,8 @@ enum ssusb_uwk_vers {
> > >       SSUSB_UWK_V1_4,         /* mt8195 IP1 */
> > >       SSUSB_UWK_V1_5,         /* mt8195 IP2 */
> > >       SSUSB_UWK_V1_6,         /* mt8195 IP3 */
> > > +     SSUSB_UWK_V1_7,         /* mt8196 IP0 */
> > > +     SSUSB_UWK_V1_8,         /* mt8196 IP1 */
> > >   };
> > >
> > >   /*
> > > @@ -381,6 +389,16 @@ static void usb_wakeup_ip_sleep_set(struct
> > > xhci_hcd_mtk *mtk, bool enable)
> > >               msk =3D WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) |
> > > WC0_IS_P_95;
> > >               val =3D enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) :
> > > 0;
> > >               break;
> > > +     case SSUSB_UWK_V1_7:
> > > +             reg =3D mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> > > +             msk =3D UWK_V1_7_CTRL2_MASK;
> > > +             val =3D enable ? msk : 0;
> > > +             break;
> > > +     case SSUSB_UWK_V1_8:
> > > +             reg =3D mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
> > > +             msk =3D WCP1_IS_EN;
> > > +             val =3D enable ? msk : 0;
> > > +             break;
> > >       case SSUSB_UWK_V2:
> > >               reg =3D mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
> > >               msk =3D SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
> >
> >
> >

