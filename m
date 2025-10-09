Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3310ECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=; b=T7gnKAJtKS8M7dBg6tNphAGeTU
	2Y8vGTDTo3rHSoCc8e3SB3cQjtJbIXYKN9qhBNlh9FZmj2MjkhH+6x4aWj6KY7X00lfOjPj7BbVyP
	9wl2JXZ8FgKKq5DI6UC7FhP2gDBHz0e0i2ZcCgAeF8HwsW8+z+fGY11P0378aJ7Z8Vtx0lbZhsxsW
	k+q+i2vpd4dgrybcKrzRkRcWELbZCTSa1KWj/WQ1wfVkwJ0YB/66SiWrG/yXRPdAC2QOa6MRcoO2W
	CPx6/d5EhM+kX4pUNyhwuszyC8rTeHvXhumY/o7vvdn1NB5JK5P4gRclzXHhVzV/69msrjphLhd7E
	oRJaUwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q76-000000069IF-2ZXx;
	Thu, 09 Oct 2025 12:51:20 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6q73-000000069Hg-3ldb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 12:51:19 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so691441a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760014277; x=1760619077; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=Y6/CKt8yCLdntoDIbe5YNvlJzhl/yWxX3F5/YOX0OC0xfZWZB8/6TYvdHC+VTGdG+y
         QcD5QwgI25lqLgxxumhDer+wkTM7EWvDt9lAaMKJwwQ25V52uwhlAJ3VMYy6Efw47O0s
         SmFb793CtyqszMm8lJYTeIXFbpu/laxJzGxSg8bZPg07DkQFTOcaGY48NU8JQmyhb1ze
         5N/EivdM0nVxGiFTFPKQ36kDqLovNWq7gKjYfkn7lztY2k1/ixR+xJhOE0cLAJo1jsfh
         Yw6PYjRqO75dI5ssMUtvIy4QvpmqmHwXqAi7I0PxiFZpUrBljVF0pYHMtwW1ryJ0QA9z
         MSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014277; x=1760619077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDMFuxtj7DOoK9vdG1w2+Ih86u05O/nr3t6ARiKVfns=;
        b=fdsunng9QNpeMlZGHm0o5EGKxNObzUswZl0TEcDih6ie1B0JmJZH+PMkMtCvivBYpB
         fyx8HTRzgKgZ+pMaQgc+MLskH+CTiS2GER9oKJJ3BCNG4Jh+9wASCNWd1B/uoL3I4P8a
         Ycz/hQuZbpvC+83xl5YLnKt8KHLVqvcrE01oUdqBJrFGzBARAl8dncQHOTxhtrDnJq3K
         FX94h4mD9Edmy6YCS+kBgkFk/4sAMs0sf/WuIPhD9I4hXNibTnF151S9Y7z507MqNqvP
         omVz20R2faAM1ZdP+/OYXkb4tIMGM5747gD22axUy94WX01mOWy2mWqjxCRagubv8yyJ
         OTSg==
X-Forwarded-Encrypted: i=1; AJvYcCVYnzzo3fpjBxO+WU2D0h+CQa4q14QF8B6wS5h45Fvcc13IMAVb+E5Typ/5bJxkSkVZ/FQ4JsqfodfSx/qVWO+y@lists.infradead.org
X-Gm-Message-State: AOJu0YzszI+Wiws4SabLtgWm3UozNNMBE9a4+eo1ttbeq9P++z2GNDLV
	GBcQBRROs0nrz4+jlz75fDmImw5YdxJnQG8PnKXPvqy2DyV98pckmaWaBfCmfvd5x7PXg9iSmjW
	b9CbTr62yOL1eLTJAkjyYLS8hV34ldjQ=
X-Gm-Gg: ASbGncsWnW2adeTbNeXTWOuDyfuJMQF8TPuetqwkkUjnrMrnOujs4wkUhopM1lB6wyy
	27diGCU/GkEvoT2SCobPtY0ydyhgV1GHlxen9dquVvoA+EDBub7zKEN9vVAMQvgdB6U4d14xm0j
	kGNlKf05f/ahdORv1oqDI95AmL+f2xcuu6RB1AIumL/PLASkOwevkV/paXoaXdqK5QKu2WXCosz
	NkDKrHx4ut3oPINBnDYfZRvpAKzL/vrLcK1QaoIPjQWDEkhauDT7JssTiXt
X-Google-Smtp-Source: AGHT+IEhAV1wqwmuEfqj9eDPRuTr5xhy6QzH+Fe4j6lHSFhQoyHt9bJp9C/EYN1+uc18PLR1t+1Bf7rHPlE1k2VNj6E=
X-Received: by 2002:a17:902:f608:b0:263:b8f:77dd with SMTP id
 d9443c01a7336-2902741d0a7mr98644915ad.57.1760014276668; Thu, 09 Oct 2025
 05:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 9 Oct 2025 15:53:34 +0300
X-Gm-Features: AS18NWAD-sPW--RGZUkk020BQr_wBUAqvEISI-DaoXi4Qt_J4rUCZMsA_rvkqkw
Message-ID: <CAEnQRZCFk=07=tDgEPJeXx_xDp_6LGXi+2o9GAADoP86mWYZ2A@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_055117_953578_D11DF927 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Tue, Sep 23, 2025 at 8:30=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.

Tested-by: Daniel Baluta <daniel.baluta@nxp.com>

