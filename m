Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7391ED6ED3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=; b=bnWIWW7SmxzKsoaoiamwk7YZuc
	75XS3Nts+JUHaHL2nDED/kSZn1ddOagtjFuSqVXw+QVlTmfZs32wB1DJVgdUkiR3AAVz735iNkAOX
	8JuR1y7V5rG0FcYiBw1rTJsAh7XZGgdIURJSl0MIpFJ5e33klZf0PcOzl1Kn6U9MzGmy8bmRDLcIR
	O2gQNFVi+izRfvpWe7GFoVCJKax26wDjVms8b/s08aA41BPsY89sH6R+9/6NlvyJLH0BtjG4sDFoM
	J6OzJBeV0BbEaZNlHKtHTijw/rkfLIQlQkf/9U3nZ/DuO8FvDPTmzlmnsAofn/8SjIgKFdK9EeCz8
	NwIfZQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQEo-000000028GB-0WAk;
	Fri, 22 Nov 2024 09:46:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEQDp-0000000289O-0Uve
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:45:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso274261766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732268703; x=1732873503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=RzO2jx9Zb7xfWoZr6gMrY5hB32i9KxiesJJLf6QmHYCKSTfCUpS3Xp//cj2BteqK4U
         CW7SIgig+0gNhfTlvT3tuquL+DvuQlhYpk5InLUhkA7BXw/Hpj+4O9yRSjsKKLMeZ8S/
         hpv9KE2lbEwJ1SFhkJUzj49xZw7I2fpW5tUTrf9CmZaecT3zmFAWQRWznfabylcXs+UO
         k+tJ9PhcgSqvpv1A+enmc++ypxVDlHaxiTr58U2e28Dd1+DtV5s7MPLdxdUxLzjI9zW9
         PM/c83YZEpdjhyJshmBqnGDFy3Pid2EnPk6m7D4demTKUJ5z/K/Dhbsiq2DP4krCGvc5
         K8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268703; x=1732873503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hd6q8zDhHex0K31D5UPVNO7yeK6NJNFYGAAxQqzFbc=;
        b=sGUAFpP4BYEIHnjjVUWO5guqcBEd9jFsyq580v9P+0Em/OFN9kexuEmeCaEkPLi/Ri
         pEViMO6nAKpx8DfLbTphnWiI1GqyhbJdBtDhOL74mn0hXnSbrApLeP92di+j54ey+hDo
         l8w4pjZUBikIuegTSDgySc+bmlkSy+zUAhIHxDfp3wns4VE5gTMTKzJnLLn68RLMy5II
         2icAjeNVFZLEPIjF148pkZtXJIGgB9RtxLPgC4YVrkVyBMtewcmaJr4FgSJ/tDcJWb57
         q2YQ9OlBOkqm8cJOBT6lD6fdJk+NBLyJVR5lOIWEoTrMNkAFtg3+dPy/vKBfd6Q1bysj
         2UFA==
X-Forwarded-Encrypted: i=1; AJvYcCV/NWNpvIid8pSdW4v6q/brbdIaddD/Lp5WmoDG6oJ3cHQM1GRidLqbF9ITzHLtDycTVW2BS4S2fX5isrsqAoTn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4dsgL4CvLgpNk0dm7XN/SU+heipYJVtJuf+5ig3Bw2MeutSyJ
	4z6bomclG1Y2fqv+H6p2d9UkCjFpkSK5g6wajnxajk+koJBJclMJ1jQimi12TmKqaQTh3BMVWnB
	mY9CEQ/oV9kkaj6xaWfuXl1HaAYEKUhRW6177Rw==
X-Gm-Gg: ASbGncsORFjmiPZk2rxHqulQhtiY0Hk/axNl41FadhKshw0viv17dtgK2j5T9wpNH98
	W4K6gxYFcM6vGFX4rP8WJAu4cWl+2sg==
X-Google-Smtp-Source: AGHT+IF2siysXCL8AuQk/Zj9BKQZImmKFwTANKrD+H57DhSj6YZ4aXozWUBRbTyiMmt32yK0vwfP+uNoBA8OHC90tE4=
X-Received: by 2002:a17:906:310b:b0:aa5:2237:67af with SMTP id
 a640c23a62f3a-aa522376878mr15619866b.9.1732268703393; Fri, 22 Nov 2024
 01:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
In-Reply-To: <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Fri, 22 Nov 2024 10:44:52 +0100
Message-ID: <CAEHHSvbFw+MC0R3w7isgrF15JAAfBWQmSkh1PoiU7y+P4O2psw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241122_014505_160727_7E5383D7 
X-CRM114-Status: GOOD (  26.81  )
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

Le ven. 22 nov. 2024 =C3=A0 10:19, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
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
> > +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_cam_dev *cam =3D vb2_get_drv_priv(vb->vb2_queue);
> > +       struct mtk_cam_dev_buffer *buf =3D to_mtk_cam_dev_buffer(vb);
> > +       unsigned long flags;
> > +
> > +       /* Add the buffer into the tracking list */
> > +       spin_lock_irqsave(&cam->buf_list_lock, flags);
> > +       if (list_empty(&cam->buf_list))
> > +               (*cam->hw_functions->mtk_cam_update_buffers_add)(cam, b=
uf);
> > +
> > +       list_add_tail(&buf->list, &cam->buf_list);
> > +       (*cam->hw_functions->mtk_cam_fbc_inc)(cam);
>
> I think fbc_inc should together with update_buffers_add.
> After update_buffers_add then fbc_inc.
> So squash fbc_inc into update_buffers_add and drop fbc_inc function.
>

No, this is not true.
mtk_cam_update_buffers_add is used to indicate which buffer should be
used for dma write. This is the first entry in the buf list.
mtk_cam_fbc_inc is used to increase the number of available user space buff=
ers.

If the buffer list is not empty and user space calls buf_queue again,
we need to call mtk_cam_fbc_inc to increase the number of available
user buffers, but we don't want to change the buffer for DMA write.

mtk_camsv30_update_buffers_add is called on irq to update the address
to the next buffer (if available).

Maybe the name mtk_camsv30_update_buffers_add is confusing then?
What do you think about:
- mtk_camsv30_update_buffers_add -> mtk_camsv30_update_buffers_address
- mtk_cam_fbc_inc -> mtk_camsv30_buffer_add

Cheers
Julien

 > Regards,
> CK
>
> > +       spin_unlock_irqrestore(&cam->buf_list_lock, flags);
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

