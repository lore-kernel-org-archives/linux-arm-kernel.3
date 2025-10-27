Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A683BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyqxH4hxbPgxvQElXkdgiIeZ0ywNFegx6MYkB5gAcoA=; b=2PiTuzbB5mw/4r
	U3wc5/Mqh1IN+6vd1H9OL45GwMG5bzGnCscYyv3zLVHTIKrZh9i9XXvRaxKSuvDxMr552Dgbzm4r1
	v1mYRb75ARnSzuplz96YfxgBJ+EOPuDphN5/+rj+u+nHJGl1ECNE37kCvtoGLzmjCBUmGXNaIic1i
	OrKvp/KoFJjNTz4doaCtvy1tZKPVKcTpBWFvO7BvXfSscp+zJTCgEJLgodKusSx7HuwCVwiY75vy8
	FPqC0UXG66mp5RzkMBxgweSBqFF9egWjoR508pPwbLSsuru9HcclcOV3aSWhJspZDAPr84SkC4rLf
	sF+U0qhATvaiqluMUzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQZ5-0000000ENul-37Et;
	Mon, 27 Oct 2025 16:59:27 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQZ3-0000000ENu0-1cCE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:59:26 +0000
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378e622e9e3so43395321fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761584362; x=1762189162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyqxH4hxbPgxvQElXkdgiIeZ0ywNFegx6MYkB5gAcoA=;
        b=V8d0UPP4Gp5dRF6WMSFNvFJkBrLGKOOBUhAIQVSToSBJSZQPIZVnj8X4ImZBryBbX0
         zPCvUGQeuAFSsiBtudCvCQFVQBIxetGpxLPF8HfjegGoUO4zjaw5QuXJ+CVybVyMlzlL
         YrtEPcGAq1ZtO1if1Z0GQbzmZznt7WzJ9fRdzNOLKXXeZbxcQNXqXF1i5IKX9/zAnmmV
         RioZcuOJbjCBGnRB8xnIWbmr18oUUyodv2hvGGwotP5ZwZVB42w60Gg4W5BafJqxV4Jo
         c5n+g1pI4g5TX+fwJH8ycieP59pqUB0kQMqI39nzgOjn4gQcke90OadHp7gHu87TQ5S7
         3kDw==
X-Forwarded-Encrypted: i=1; AJvYcCV+MdFctz1609jh7k3elG+z/fWrw6KRCO2cO1+ifsyFA6nFzasLw3+rb9SfIzgxsOAaTKOriogah3Zw+kO1NcfW@lists.infradead.org
X-Gm-Message-State: AOJu0YzCjlfVjbV/Btk2QM587W9avP/GqZthNrq3kWFxqNwXNaVlkAV6
	ussuJu4soXWvy9mKl3lyTNlScEOmShHSXd2zmci0Oy8rEmEut2mPrGaOiwKRpLgv/c4=
X-Gm-Gg: ASbGncvZOu9K3AVjefrqVvJFZwCIewIOox0bKOR3U6n8b1Id/8gPtPQ6gKOLiOPtyaG
	hv3sMP5CLK7ozhJuC9abTb6D9yUhwrAauLCoF1e7aTSpbeY1rnUu358pvypMHP2nPF7LfSwGVU3
	0XA/FzJDIAG4PH464UH8xq8wztl3UxzK05nMtAi3tQWxapQhBPgsnNHFB312CnDsxdbwt1nvGKD
	v6lusB0owrPQgDXMSgbTx6HoGL4WsB6om+0txQjpbmCuAkVedJcAq1LRoNzhoEtA6LRyGOX45wg
	+NGvm0YHwKuzR3Bq0h14OnNpch7D9UDlyLGk2Zs4g2veBOiK0r+nTr+QxUJkOo/yHLu6JgwyiEA
	RIH0g3au4yQLHNAcEhDibPdltsEdoLPKbOatSgVBpiSxcIBTskB12F3w8cxGYUmrpkiQf1OQEde
	kjhXhb/PzDDWAk4Rvd1W4OzleD9KLDpBplpsUFOv0KXHc=
X-Google-Smtp-Source: AGHT+IEJcbXqumJFyh9dTTQJcNCJWPAZgJDYE/36uRLJJwlyJCv0ki8FjLWNIMfVv3ISXeFLRCPLTg==
X-Received: by 2002:a05:651c:88d:b0:352:bb2:5508 with SMTP id 38308e7fff4ca-37907c77f5bmr495581fa.12.1761584362395;
        Mon, 27 Oct 2025 09:59:22 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0e5239sm22055121fa.53.2025.10.27.09.59.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:59:22 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-378d61ce75aso45379191fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpuRlCTBaXR++0UTsSCUCHSEqpjFoUbaVmvMxppSyqco0oqMO5yWeOYHJF6yV9dtNu4TmIm1qLGqFeikX3yI1/@lists.infradead.org
X-Received: by 2002:a05:651c:19ab:b0:378:e912:74b0 with SMTP id
 38308e7fff4ca-37907ced9d2mr462481fa.23.1761584357146; Mon, 27 Oct 2025
 09:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-15-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-15-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 28 Oct 2025 00:59:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
X-Gm-Features: AWmQ_bl-KpqEJmmAdB5ZTKNvkIm9zEnVpIzMtZYC06hw3Dn_VXdqxOKWZ6n-OCc
Message-ID: <CAGb2v67tF5f-dgqXMZFbSMbctmpkM0mZGYVAA2gyOx-GY1cSbw@mail.gmail.com>
Subject: Re: [PATCH 14/30] drm/sun4i: ui_layer: Change index meaning
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_095925_427756_B77773EE 
X-CRM114-Status: UNSURE (   8.76  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> In the pursuit of making UI/VI layer code independent of DE version,
> change meaning of UI index to index of the plane within mixer. DE33 can
> split amount of VI and UI planes between multiple mixer in whatever way
> it deems acceptable, so simple calculation VI num + UI index won't be
> meaningful anymore.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

