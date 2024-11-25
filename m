Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72878D58D54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wkpi3C3Erb5LcuJAqMaLXJb2wxyVOmfXm6CfHhPKV4Y=; b=HgTK438zcyuxEkm4jsnmG6wlAK
	zMA3SCIBKCeWiPq09BAW+pTfsyqIRi3K2DmDqo9vDiQZU3fye5fx64+oLz0LpHuuWR47eaP4yDqC3
	e3YJJp9efpjI+sovqp2KNLoZoR4hOj6ik84jZiBw4dX6rIaKTjvL4lxVYqj2Sjyd9xi/q8MFKe+Mv
	xqbiXWW2VZWyW/ooawmcQXmeXptzjngt6SkbTK8DtgTNc/gERWVRo84do40Rm/3TBTxRnEtTlatXB
	VnRQN6yTluLa1ChVSCG4Uf5S4Xnt+cEFln5pHzM/v4g8TkCWELfX7JQ7P71CU6P84gBZ1ycZFOuC4
	TMy68h0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaHN-00000008KTo-24BQ;
	Mon, 25 Nov 2024 14:41:33 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaGO-00000008KO6-3076
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:40:34 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so13765931fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 06:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732545630; x=1733150430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkpi3C3Erb5LcuJAqMaLXJb2wxyVOmfXm6CfHhPKV4Y=;
        b=BKRxfckHnr6k+/CmBg6QEaH2X5jI6ZgnreY9vTy8o7avx7ZbzAywH2LLkxLOyKi7sk
         blEvAllsCayDY9XW3I5sGQvZgSSErR4x7QGsBfJ10zj4JDR4GOCe5sNZ/0Cms35rNDvI
         4M0U+ApUD0pw3Cg0K3xzmD4b+cakMbqmcwn1IOfdBFadBjMs60CBvRCZCWH2DhmFZnGm
         KVpAzEzkrAk+Z8x4IwOH/hLdAkS7pwxLP9um3OOpb1xM852IDdLU6sGPDwpXDz5B3+Xl
         cu4zQfcA7Yh5DkLSXt7bs/PfBu3QGx7rORsTguJyZgcxutB6gOXaYn73kcW2Pns1Q/Nm
         CoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545630; x=1733150430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wkpi3C3Erb5LcuJAqMaLXJb2wxyVOmfXm6CfHhPKV4Y=;
        b=IZadUcs9DkREUjRU8BovYSfHb9EOQx9By2MRrsIr1epV8EKK3UUY0/yLu+x0SuplCk
         kzb3uBhL+dASYZK0+77lCLgNw4TQchXmhXh2GJhJseIOWMjzbyQMSATn/svVNiuDgjWt
         /1cpi9+VZ71CP5fY9WNLaQm0UbkUcvmoMGy4930wJaWGwFasxHgO7pcAI36J9N2mlfcx
         0G2UL6f7nTB/SMTvbnLZJS8Y8pgFBw73rUD3q4SHFjeju3LuJa8oDEzSEAaAhU/9cE05
         S1vwNRuvICkgoc986KMpnk5FtyL9t8M1Rsq4KxabhG1tTwoWqmFjXpKdkHVwvmk3/Vxp
         f2Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVn8L3VDKdG0LB6beb2JwG4WFmSRW4/fk+LlQBXAiE44UgEu5Vo5gBRFLfIuWwE2Z7idqALALeLcCyi/TN6kmJo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8Tvg1YahdDNMALyLFW+q1ncorw/pWgr3EnImAeEZnWXCidCz
	Pja9OsrJZPpWLkAaVNiin/WJtFWiuXoH9gDJLhG2cJxTHGMTu1E86cOlwW3XvDnPfrMR2HNIxu5
	FCIpAYGkT+hJwmQ2T5nFDKfw33hid12cVUv+NBQ==
X-Gm-Gg: ASbGncs8T9rkGQ3ce2m/kk91jsliIu2cBpC+AkiMs3QynYUPECXJEWj0gaNLQqQNyzQ
	hfA08NVIIvRnbZpF7P5Bfygl8lsnktA==
X-Google-Smtp-Source: AGHT+IGylk1WBc/171m1MnIZm+s014KvRI8FCTVhJrxpcS9ekQI1Zx3waN0H0Og4c/z7YunW3cfM693tp/5+vZLQ61k=
X-Received: by 2002:a2e:87d0:0:b0:2ff:bc48:a0d0 with SMTP id
 38308e7fff4ca-2ffbc48a360mr28445671fa.6.1732545629740; Mon, 25 Nov 2024
 06:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com> <d17dfb29f60bfa1889aa554ef16c9ddec272520d.camel@mediatek.com>
In-Reply-To: <d17dfb29f60bfa1889aa554ef16c9ddec272520d.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 25 Nov 2024 15:40:18 +0100
Message-ID: <CAEHHSvbScBhn=6rSOApQ=K9JEpwL6JPpJnJy929mLXHhxQ=3FQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241125_064032_750190_DCAF7201 
X-CRM114-Status: GOOD (  24.82  )
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

Le lun. 25 nov. 2024 =C3=A0 09:14, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
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
> > +static void mtk_camsv30_update_buffers_add(struct mtk_cam_dev *cam_dev=
,
> > +                                          struct mtk_cam_dev_buffer *b=
uf)
> > +{
> > +       mtk_camsv30_img0_write(cam_dev, CAMSV_IMGO_SV_BASE_ADDR, buf->d=
addr);
> > +}
> > +
>
> [snip]
>
> > +static void mtk_camsv30_fbc_inc(struct mtk_cam_dev *cam_dev)
> > +{
> > +       unsigned int fbc_val;
> > +
> > +       if (pm_runtime_resume_and_get(cam_dev->dev) < 0) {
>
> I think this pm_runtime_resume_and_get() is not necessary.
> mtk_camsv30_fbc_inc() is called only in mtk_cam_vb2_buf_queue().
> But when buf_list is empty, mtk_camsv30_update_buffers_add() is called be=
fore this function.
> But mtk_camsv30_update_buffers_add() does not call pm_runtime_resume_and_=
get() and it works normally.
> So this function is not necessary to call pm_runtime_resume_and_get().

Hi CK,

This one is actually needed because .buf_queue can be called before
.start_streaming in case a user requests to prepare buffers before
streaming.
But you are right, if a user requests to alloc buffer before streaming
mtk_camsv_update_buffers_address will be called without pm. Streaming
still works because in start streaming we call
mtk_camsv_update_buffers_address again.
So maybe I should put the pm stuff in mtk_cam_vb2_buf_queue ?

Cheers
Julien


>
> In other register setting function, please also check this pm function is=
 necessary or not.
>
> Regards,
> CK
>
> > +               dev_err(cam_dev->dev, "failed to get pm_runtime\n");
> > +               return;
> > +       }
> > +
> > +       fbc_val =3D mtk_camsv30_read(cam_dev, CAMSV_IMGO_FBC);
> > +       fbc_val |=3D CAMSV_IMGO_FBC_RCNT_INC;
> > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > +       fbc_val &=3D ~CAMSV_IMGO_FBC_RCNT_INC;
> > +       mtk_camsv30_write(cam_dev, CAMSV_IMGO_FBC, fbc_val);
> > +
> > +       pm_runtime_put_autosuspend(cam_dev->dev);
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

