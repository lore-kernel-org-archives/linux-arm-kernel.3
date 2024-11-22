Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E9E65D3A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cONwVFe9h3jPRUrTJqjZ38mmUsRgHE6KH95XCIxtkE=; b=B/eH7Mye7tYkF/07bajowrn6b9
	43mcn7sf/dkPlYMmcqvZ2sGp6FoE01qqggS72Tbu9NovKpy5U2W1LDUTnu7oHvdsOuZb9GJTwg5LR
	ALFXmTH4dVh8oloPUPwC3vhOufoMnf1Y0R999A2r5YjVuLLehV3nNfbEkwGIk5aoD9XNS8ga3XqFf
	XcGAvQBQat5t91q/P27qGIosTv8Yrhde3bgINXzJn/b3FzaQ+JgAqJWGv0H1qa2xwX+BuYPr+wJJW
	kExfsrtZGo//vtu08lNBwJpPmQmm4Z1my7Ze3fn4PwSpCJzK8Lo5xCelXzvtDpyrmLjPySjPihVh7
	Sg+Af36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPv1-000000025V9-3AIS;
	Fri, 22 Nov 2024 09:25:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPmB-0000000230P-1yMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:16:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9ef275b980so299674166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732266989; x=1732871789; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cONwVFe9h3jPRUrTJqjZ38mmUsRgHE6KH95XCIxtkE=;
        b=kDl0bKPHS9G+Y6ED8L+1tcAHCnu440fyasdFaOBuWPQvN+CtEvyXuWoYjuuNTFeoXM
         rrRcm/1Xz3ukIvIon816UloRFzXlXjCezk3mFoDETCx6l/7wpxXWvy0suv7y08dYvumT
         0N1TEbipGw9hBsjLUsOh2FOcPTXCakhDoL/Hk4fn1Z6dHj6QNWJZTgoG1m//C6AI3qWJ
         l1iyy6R/sxhf1V7GcpCbly2+vV+9RXn9JqUFfIPICMLpHp6qkCXmcadJMbMFZfshsufS
         bYpWTdS1RS9wsoPikWDKontl7LrEC57RQ61UO5yduNw13DLpKjsOtM79wnSAVU6hqtvG
         HIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266989; x=1732871789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cONwVFe9h3jPRUrTJqjZ38mmUsRgHE6KH95XCIxtkE=;
        b=sj2xU5m1OI2E12Zgc6iK149NkNQjufMQQsDfZH/1Kw3gF/KoELwA36qAoliFeNFJyf
         Gt3HTkrQXrc7DO4b772HUPZ2DK9DobhzpwNIZAI6iofU1imWEq/fgeKFZZrXm5+rvUcD
         LRfQN4HsjNmOjjq2fjdBwte+rMtkbEHvU8u8AA0B6xtjcMAyD/qwYwQKRVGNP0tPzzHv
         FS+vR4Ij3BTQKHD6nNYHnyIMYeA9F/49jkl1GFSLsKganP0RiPO5t4tnUhf0lRdQ0Y1G
         kZK12AqUhKxFycVP3EsUQDGwy9A3MbxSVVdlXlhkFkc7EbxN1AxnfLHEuVHQaskHgKQo
         HDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDf3p1OWfxyk5+CrvDcyA83y59RPft/LQKZ6/B5wP5M9VYbeGJee+oJVbOh2kFRhAlmhZf5tG4MWmT6RAxalK2@lists.infradead.org
X-Gm-Message-State: AOJu0YxGw9OKk5K/Ak3iBw7tVUPisGdnbdP1S1xBmcDdDbSUPIe/RC5z
	ElzZ4c5F1p4YQx67C9tx0Y+Dua3eaFlvR2zkgbHeTwvypSzMS1Q34Wel6bCCqbcjnZeOpUi6DxS
	2wjuFSYcfZxGX/hZFo/FDZSnhdI1nxaw7L/1tMQ==
X-Gm-Gg: ASbGncs+wfOM4wFEsUWMbJisxiAnNa6F3d4+I/PsnXADxkrZ6J+3M9iyKJllGAW+sNH
	7OKknBhiYL7wyzr9ijtlo4tdcli+DLA==
X-Google-Smtp-Source: AGHT+IGBIJn2l6iW1Ximwej5Nomk1X6Bfwt6JsYUR9VUOC3nDn5WmX59qNhA/dgRca4VNr6bv6dLyhB1J1APS3de4mI=
X-Received: by 2002:a17:906:3101:b0:a9a:dc3:c86e with SMTP id
 a640c23a62f3a-aa50990b1aamr172667166b.11.1732266989281; Fri, 22 Nov 2024
 01:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
In-Reply-To: <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:16:18 +0100
Message-ID: <CAEHHSvaEzCGZt3GpKBNDGUphetR7JWfJ7SZfvAU=O-3M4WZY7w@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011631_775075_07F37927 
X-CRM114-Status: GOOD (  20.54  )
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

Le ven. 22 nov. 2024 =C3=A0 08:54, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-11-21 at 09:53 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static void mtk_cam_cmos_vf_enable(struct mtk_cam_dev *cam_dev,
> > +                                  bool enable, bool pak_en)
> > +{
> > +       if (enable)
> > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_enable(cam_de=
v);
>
> Directly call mtk_camsv30_cmos_vf_hw_enable().
> This has discussed in previous version [1].
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20240729-ad=
d-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com/#25966327
>

Hi CK,

I forgot about that discussion sorry :/
I guess you want me to completely remove the  mtk_cam_hw_functions struct?
In that case, what do you prefer:
- keep mtk_camsv30_hw.c and put signatures in mtkcamsv30_hw.h and
include mtk_camsv30_hw.h in mtk_camsv_video.c
- rename mtk_camsv30_hw.c to mtk_camsv_hw.c (and all functions) and
put signatures in mtk_camsv_hw.h

Cheers
Julien

> Regards,
> CK
>
> > +       else
> > +               cam_dev->hw_functions->mtk_cam_cmos_vf_hw_disable(cam_d=
ev);
> > +}
> > +
>
> >
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

