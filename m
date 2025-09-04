Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92317CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G44qT3ppm0NrZKxqg/zbbhuYOayOg+q8MSz2CLb5bks=; b=tqX+6Ilx/m6fHQcKzGCml6gzK8
	mxgr4PJp8DIW6+acdnkolfu+uKlQpuzfDeqbVYxOZjj/o56or2mGBd/DzhSQI2dBqNSQtWEw6cu93
	JP0GDfJux8SS0fHXayLSm+gFCyadW5uCglh09Kqbnm3kLwms333kmU7vlhBXOJudBX8uNiqrtNAmA
	viiOQI5HXDdJurDRaafBCmwCAAy1M4wrtm1Z1/0TeRXQFAEXEZOPGYTT/OHCkV8ZzqRqzoAeuEsnY
	yqt29vVD5ltNJ2DC4r0ZI5bYnpaCbMKexjxUqjsDpgGaBZobrkLz1d9QnA4vcVk87TZiS29oDmZiK
	oG8k8zyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN5T-0000000GR3J-0iAy;
	Fri, 05 Sep 2025 03:26:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGcH-0000000EGsj-3hmR;
	Thu, 04 Sep 2025 20:31:35 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-71d603b674aso13972697b3.1;
        Thu, 04 Sep 2025 13:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757017893; x=1757622693; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G44qT3ppm0NrZKxqg/zbbhuYOayOg+q8MSz2CLb5bks=;
        b=mI+CjCOEXLYZvq3HdR/I1U6EEj5ebZmzJ2QY1YLidACu8uIRPHVVnT2Z9Z66doSDiw
         3GjZCQZW8xyTUeobuM2A6R6epxN1U6pEzNXjeRY3KG87b04EyjBXY4yutmfhF8q6qced
         32WCRKKabNSGNdBFEU/j1MGBOZ4saR6IAWUu5rLZUPwPxl3L8ARkuWfxr/y4RL29ydnM
         0JMGsO9hxVIlQ4SHSWWVCSPMUoEzjKbnLuBQ03+2bx7457JRXBZbWnoO/ig824lkYR1M
         he/9JApJZo8OX+0fvQetX+l0vdZEYR86kKSkHZhSVAvZkzHAhnhIxBiKSzxFG5Ekq9i3
         lC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017893; x=1757622693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G44qT3ppm0NrZKxqg/zbbhuYOayOg+q8MSz2CLb5bks=;
        b=e+EMIJUGzBL4ECIjCh9gGBIkaa8sldsvSGLPFWR+JA3ChWK/YE1XGOdHsFVfj9DoG6
         cYxkfkH9WU1zGF5zKc9qNp/DNQ+6u96H4aocHQVlko525vGk3XF0s6oWDTBLW1bxGb4G
         fIoUQt3ggy2/tAHpreMQsGzbFM8co5YjvPJ2wLcEi8/YKZ/NzVH4jNa+OCEiUIfZLMmv
         rWPFZgNPgIbR5UBlc/mx9wW7ECLQzDsqtoILzbhvMY+vbPnytySZFihxPCblKpjfvNkh
         oG3os7IlpkYK/8pKPRKqDvLZithDdvpatgf3Plir8dpOfvtd8huuIJEp0hRCWS9LL75q
         L4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUdbEL19tHQ9GKHWuDDkFMLGGm5TcpcaUV6Za/z/PoYLSee8qjCJB04ekxoR6TI2rvFT3tssbeb+kWB+lGuKK0=@lists.infradead.org, AJvYcCWhsW9e96I1EmO5LsIjp0ffiRo7rtPds2M9rNtaA9n3VvX0L3wsZxzV0YyQyErOIAK9hvmdaUBjGoeKUTzLm3Ji@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3zHadGors8C/En+NHfNUSAc+tkxk3AZm65fssZFvjOJT71N0o
	779GYea8G0zjKO7ueLDA8psu04NnZDTduKXNf2fX4SXJBu1gcK+Ewq6SW6bUDw3wjv0wq0tyFxF
	OnDHQJodEgBmVee/RxRxIKHPfNg3CKms=
X-Gm-Gg: ASbGncsIvLb9EhT0x71N6ZohDILL9/5yirWQ1V76tUfy3kkGaLh0D9oUVlc9Jq0GBzP
	jPCEGW6oKH+eVAwHoOIaXpd+yHLR8w0Zv4o/jHo8DAsrd2tc0XVhHNKiAcV3VtVy+W7rMc4qFKd
	p7rMBghWyDdlkl3OohIOk1/rCIe4qhPE3L8jaWRJp7gOg9fRMEo5g1xdYu0DMpbbF6dWYxSX+q+
	3ijrZa5a/gATl4MZhOiTTTg6ERbzF0brhgdyFuZ1G+uJrUhGpgqoHckc50/E7cFgG/3AYtI
X-Google-Smtp-Source: AGHT+IFZZhEHQ2i0PMUPdNUhuJd8vApgTrRB6dKWPtsXXKNyP2QHk/29i5uL4JCCIaB/197BciHOQ0zwuy7aQHiDCkg=
X-Received: by 2002:a05:690c:6803:b0:720:73:1a11 with SMTP id
 00721157ae682-722764fe1a4mr194168877b3.34.1757017892676; Thu, 04 Sep 2025
 13:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com> <20250903225504.542268-2-olvaffe@gmail.com>
 <20250904-practical-dazzling-quail-f1bebb@kuoka>
In-Reply-To: <20250904-practical-dazzling-quail-f1bebb@kuoka>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 13:31:21 -0700
X-Gm-Features: Ac12FXyq4YSAlCgSb1X4fgGqu2j04uBunN9ulHXu5oWCguf8BsghjVTucyWzm4M
Message-ID: <CAPaKu7TDQxJZW0b8hR7S=tAX7G+S2oGTeB5h0+2Qp1joqLPo2g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_133133_925246_B8BBE2A6 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, Sep 4, 2025 at 2:30=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Sep 03, 2025 at 03:55:03PM -0700, Chia-I Wu wrote:
> > MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
> > panthor.
>
> What is panthor? Please describe here hardware or provide some
> explanations of not-that-known hardware names (if panthos is that).
Panthor is the DRM panthor driver (drivers/gpu/drm/panthor).  It
gained support for Mali-G925-Immortalis a few weeks ago.

>
> Best regards,
> Krzysztof
>

