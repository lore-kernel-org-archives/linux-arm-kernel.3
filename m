Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=; b=iO7hIZRiFSJML4bEKC/nKVWDZ6
	/iFGlTHL+0pTX25lwQu5AMcHPyoqmUu2ouzU/Cw59bgWiPXZeub4cHC6YV+X+/N1Ok5V3wHoaakAw
	wAgtS8bIDMB91GQeG2nHLAbxxUqiLvdh0VkBOHVLyhOIuO7dlVLuLQlbvJhAjJxXvYChzMsQjlMrx
	rowhpZoMTsIOje7qNYccZ+pQ5aPXxv2c4tNQ4ZMcjUGvLgDgR/h82Yqx9bYspw1Jj9ry9sR0YfVC0
	18X41TTIYqZjFw/lKKzR3Ky/8LxNMH+/r79dFlLyB7Udl15kTHyIneb53OwgbW/6Rr+hd3c3S6fNN
	EzTlP4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZhz-0000000DN8z-2yEd;
	Wed, 05 Nov 2025 09:21:39 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZhx-0000000DN8E-35dK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:21:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ba599137cf8so404226a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334497; x=1762939297; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=b5AskRm+H2W9VfbvwVgp8LiQyhNTKvTkmSBileWiqsTP3Wcor+3syzyzmtWDy45YDj
         ZDoPEY6AB58scCEnVJ7Y/yES/PWprY1iF1YcQI5m0XDaWlUzsO0A3pgAFnmzwH0id3W2
         esxF5QMi2CEOt2hB2qtIRGiM22iEDsrCVJWKtIrYlbFWmuE48vxdU23fd8CB8O/v5mZn
         1HXz2gOU2ZxKyZ1s+/Se+yEW7vpwEVhlvC6iZR7N2GavdrQCqhGJHmshgiT28aPxxcUG
         oq1WvTCSUSz5s7iIUjSmMUF1ItDaLtHSXKNwIKwWIR95SuZxdqCy2XbdbaJXwoD3jYyO
         JNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334497; x=1762939297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6IAr6ThWrXT0VQC+S0LBlsjUYHMVkUu3AebSU18ydI=;
        b=d3nYQ7HOax+VQhKvndcICujb2Yp6nOk4PXjRjPDEt/HcJhICrh0AFUAiNegxM4VmIr
         3bzinqqLj2BqdwCT1AoCE+Ar5hfHBgydr9HNYZ1+IE5Dtng28awl9pJtQ/onk6OM/AML
         1s+3IejY5gDRkplrDkPr2K0QJ/Rrrc8bVC3FHZJT2FStuQXHVhO7XWutcsf+cTVQVAhz
         1TqequAc/og/7uurMvh5sNL29/1hxwQ772SbcaYorSj4t1O/+ooL4qz/Zqw/6EXG339i
         cjrTw13e4wcM5w/Lhy6fL+j9glsaSTOMblYziqzRvIs9IiJdZIDQDKRGAFES+RgkM+1s
         MjSg==
X-Forwarded-Encrypted: i=1; AJvYcCWsoeM6eD+KVrWzjxZzk5NArRj1drblgpbq29+Eu+gbWJbJ53uR/aR+s6SP2194PWoo907ZkZjUJ32HoMvWwsLt@lists.infradead.org
X-Gm-Message-State: AOJu0YzEAVJeUp9x7c5bcldYjyphsMbVFKZJdUV4rFVAIZ7rtSb+AInP
	JgihN+cNnousJjb6pyPFZU81u/ZmQtap9rDiL7PG4JMmkQ/7+Uxtv7KTwSYX04GqBR3l/1bLujI
	d9b6WrbMeEa9ho6Q8cq7vbCKdo4m2HGk=
X-Gm-Gg: ASbGncsmxi5Tt0dI46qEZ1otPs7Lwrf9PxhtnLWmZfEHpG/PjmqjkoDPRppYozFRn+A
	+WzMKFPA3LsMSXasC+SDhM6qu+YGdAWTcX3shDxi/C+L8hQcqPb4glv9/DtFxxi5ciD+CUzqL8v
	hl/yZsAybbde9beXWloBYPvD/TzREyIUpavAbkw6yfHZIcJXfJ5s4Tn5ZvmFacWOY9VcpE8dkFr
	Yo8godMXBq+UfSjYqdqmbeM/PbDtGFw7Ua/wQ5+Q5Bs4T7Z5yGRlCuAeQ==
X-Google-Smtp-Source: AGHT+IEhLgnnarruJw6eIIB+8bTnN8uYAF3Chn6W7iyK13efG69zCQaoyAaLYmuTmnpZholD6kqVshKjrwpDBWN3vSI=
X-Received: by 2002:a05:6a20:d049:b0:345:4b5a:16b7 with SMTP id
 adf61e73a8af0-34e278f999bmr7748938637.11.1762334496625; Wed, 05 Nov 2025
 01:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com> <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
In-Reply-To: <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:24:04 +0200
X-Gm-Features: AWmQ_blaxwVbzKBmJKN_0Fj3HFefT03QXEkDQ4Lh8h-h3RbucXTuRrqR5o2qb58
Message-ID: <CAEnQRZBNzo6RKjNf4JxxxjxtLCFfEGMMt2fSK4MdVeSjtF5aag@mail.gmail.com>
Subject: Re: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable()
 helper
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_012137_795085_59F6B145 
X-CRM114-Status: GOOD (  12.84  )
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

On Fri, Oct 31, 2025 at 8:50=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 31, 2025 at 05:08:32PM +0800, Peng Fan wrote:
> > Replace manual pm_runtime_enable() with devm_pm_runtime_enable() to
> > leverage device-managed cleanup and simplify resource handling.
> >
> > pm_runtime_disable_action() not only calls pm_runtime_disable(), but
> > also calls pm_runtime_dont_use_autosuspend(). The current driver
> > only calls pm_runtime_disable(). But this should be fine here to use
> > devm_pm_runtime_enable().
>
> looks like this paragaph is reduntant.

This is not redundant! But it can be phrased better.

```
Current code on the cleanup path just disables runtime PM for a device.

Using resource managed version devm_pm_runtime_enable registers a
cleanup callback that
sets autosuspend to false and then disables runtime PM for a device.
So, basically the same
functionality as we don't use autosuspend anyway.
```

thanks,
Daniel.

