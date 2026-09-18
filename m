Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6B3C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=; b=O9yc3LOHMPkkKqZl0d5eHeVefE
	cvy7hBzjslkcEqirYH80OzPzEqHspIXbRtUmqbdpEj4yV4PJAJ25eqjB9frQ6mXv5O8mw16njoqIm
	EvUGOM24XzVFhybrhvFhgOXcvkDinomggU9hUCg3O4NwJccec4Efr+v/Z6vRqfoXZFWyB8jChpIJ7
	2xIkAnB41O6OwZmbTRe0GxRrV3OdDuD9xFL7QVBIF5rri9lPu09D4fTk3BQd5HNbsJaWBq1F7I4oH
	z7Ox8MxMPuPWLDfN4p+Lh7f+XgBXnN4rmdqtEvVw+XI7HtosTpqfA6Tt9ui6NvO5akNXHgAoGJ3eC
	IcxVk1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dLA-0000000FJVM-1A6X;
	Fri, 18 Sep 2026 18:29:40 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dL8-0000000FJUk-1jX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:29:39 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso1603486a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 11:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756176; cv=none;
        d=google.com; s=arc-20260327;
        b=YmRJsqPAuPtJBmf4Fooc2NvFox1TiSAUIaDpFaPF1v2GSH2yEf9VJtux184ReKCAQH
         xh+6xBn65/ls7FfqkFOPd5HwCQXq1a0KVvXDrcjpOozaFin2A7HAyhZQhjKdcDru4FGT
         O4Itm8M/Xd6a1c88DdeaohOfOaCCwQBQ5AMTZF/9yKX72Yds/HIwszSAr36Zc42wyI9g
         oggHv3xd6IXe+yEvbfQ2OEkGYaWZw1PyHmfh8jNcEQYmL6JYnHAdMsSFMKbO0Hc9iV9X
         NuTHGEfnteYvTZugFXaKS9XFF1xSObf4rRlqbs1uCNZKNTZWXpzm3TuzTYI6J4F6gm33
         fFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        fh=0BowbVYgowuUN+C4SOTaOdciJ3Y2p0j6v7GuDGxSMfg=;
        b=Wfcp/nKBpOco/MXS/nyC4sUSVyVcVBc/6aBZnnRdpVW+cBwxK8AQk7Q1CAWDUBaWBF
         80/9GrvCaNMgYDgUk3TW0p689v/IhfRR0KbplSfNJaViZ8Ac9yJaCkS0jzHp1lS6eZ0U
         o8h/9loG+LUbptjMjGiuvuptLCiolbNBrCSMXkJvrxSpdc0PyX1CrNcjUi1MbFdZ+6RC
         oP3JWlTMKDyhAdzp1IY8lwt6qjaktU9+Y/ENqyKKC1TFQSXeugwqVYpGSlN5oQ8EklDd
         Ctve1MRdg0BnYy2rqfDU1vtcYCSCuusFOjpKJHjJ5cbg9tG4u07Uv6Jg4Sg+DFhkXQ3a
         9u4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756176; x=1790360976; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=hGjufEcws53yCxlSYLE5lffmiYEJVMuCofc3uqIAlKKcun3mV13OcdbdeMGmptBNUn
         8ZrlPDYyCNy3mBT8AY/Uf+tiCOiwp2r9HxDpdoiTgfGKT9ox5FQgq0A0cUshliYqbQ3n
         /Tkb/rZjOY71jJbOin/jZyGFn+g5QiY6p8KBuJ2w2oE+Kl5yVgb2gkckkqiiZaA6eVbe
         lEAijhOPXZ8d1VoQlnyYSRQGeq/mzoMWQ29cB25GGqmZgIWBy0KkPYTUUi32ZOWgwHB3
         nmrDgAcKJENsl94AlJgfJlsNhO3kKV64T+uNawY7f1sSN/z2JXsG/rmaccCf2uIQuvoP
         2E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756176; x=1790360976;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xkCUHEW8BaYz+mvJmpvhPzJPz+lQKTKEiJB6NksDW9o=;
        b=kLhWOWVOlDCFY/fUxR0NTENLvcI+Aa8ekZByEOqQLUIN+JfL/XAA7yrghlqScjQq5F
         lhpeIJwoNwje6OUMXhisNcbiHKjlj0yPbfjOu00sYzjgMK8aDMfB1JLxvL2/T/pDg9ML
         +LjsFbmWOiuRTK3y2yRRT9qbTcBoMVKWCDeruKnLzHvPL5/yZrT4ykpC1IxiVwIKwN1S
         xIVJWDBzhEwuN/7Qoj0F35FFW38fzDegoYWbeiEN1cHXQOzI33W9JMa6iQyYs0m7+inV
         Jn8g8HO4Wk94C9fgK3K2wTZaMd0Zr6hnWyz4bVOlO5QVLRwKmEgz+A8N3qszsSpTgtGq
         aCjg==
X-Forwarded-Encrypted: i=1; AKwUvByS0z5ECg26nd8RhZ3JBZasgMmKCef+h4ldSvhg224chsBGAyYv+SHaYl3/X8tUd6+EgGwPdENaR84IGLtsoA4b@lists.infradead.org
X-Gm-Message-State: AFuF++lD7dAJo7QsUMfTFNiJNC+hVOVGon2gNnWnYhAVkm3q2xL4aQIj
	AtFSzKhEIDuNbffP3WBP3h9tMNUXpaq49zq3NJ5CwHuSW+/i3XKlXJCYE63Qsd+OwDQ770zdEic
	ZqbbtncSFLYIQ0caSlkaNc7hwWUk0Rgc=
X-Gm-Gg: AYBFou1+mScJrriokQRd6khlJg5nGzYDTajHIuBvvQ0mlnRKeNGhqh7F76paTMHAbdT
	IgvKi5wAK5mcOfYqtwKn04zIF4wp9DI3r9KDYNCjH5DXfMfDbypp8+emK2ojIwMlXso/5P7zCcP
	tSLF9XLCxU1A5Ad7V7SvFZYGhszsw0irxl42EPPwaehOH0deT7iaaLP8+lLzqcbBfo81rIR3kxc
	Mc3dSMqb9Mr/x8M+s1sZEdh32lbL4xzDHUbeYwKQW4Fb4Ht39uONNsv0i/I+xnFsCVUGtNWmnQz
	8W59hTjzoYXH2aleniRqlAuKmBKlp7lkbyeh3jIylwYdIY0blz+lwAE6sHnrRDCI
X-Received: by 2002:a17:907:1c0f:b0:c29:d62b:fcfa with SMTP id
 a640c23a62f3a-c2a156590b7mr346464966b.2.1789756176118; Fri, 18 Sep 2026
 11:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260918175736.355305-1-l.scorcia@gmail.com> <20260918175736.355305-4-l.scorcia@gmail.com>
In-Reply-To: <20260918175736.355305-4-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 18 Sep 2026 20:29:24 +0200
X-Gm-Features: AcwNN1UQFOY_vCJJJdBRj6O6gZ3zFhbPbxWCZbiFNcjPHyL_aMs2Ld1pz8hUFJk
Message-ID: <CAORyz2KEfzcJ_2AphkPU6o-YhLAqudCXVdY+LDoynUx_FsTMJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mt8167-mmsys: add routes for all
 display paths
To: linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_112938_466634_2C609AF8 
X-CRM114-Status: UNSURE (   8.11  )
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

Sashiko found [1] some copy-and-paste errors in this patch that are
worth correcting. I must have checked it a hundred times but they
still slipped in.
I will send a revised v2 after waiting a few days for additional reviews.
Thank you

[1] https://sashiko.dev/#/message/20260918175736.355305-4-l.scorcia%40gmail.com
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

