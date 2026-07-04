Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0712C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdAowFH9jipDKejyM813D662CypK8NeENF8iZZGVI+I=; b=xRtXwbVcXsN/gyN01769WO6m7C
	9pdRoNSfZOjW3s7tffzeWAnLZIs3yEu1m5j2GAC27WsJB75BnWo/ikYy9mBj/OVyyquPJVJUkOOPB
	6l9ud0TOs2/T9Uv9yzhd1m8/QWcM5Qj3f01lFUFt5GUPy03tHdl2tfAla2uUN2317NTqHx1xQRpzq
	60JpNk/r2eVE8oBgDMvKYPGZR48TOq2podQHtAbnBW8DN9Q/lyMBHtj+AA++ys5Tio2b82O63MlNC
	J+sEVQfXTog/gZ7lfs6CKar0XMVV6rSH4bV8o6tCvbvyiAM90V7KwUz4LEfoEhHvsxsrz3H1PsMLe
	znn5xJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfw0k-00000008Ij7-3a6P;
	Sat, 04 Jul 2026 08:46:06 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfw0h-00000008Ii8-05b2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 08:46:05 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso375309a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 01:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783154761; cv=none;
        d=google.com; s=arc-20260327;
        b=lmYwCuKPTeYoVV24ld8N2sCzFkYh9/KJ3Dpap+gWLFx2UfpDqNEG8Wakwul/8wOPJE
         51lu9J6RFmLXnVYKecfa8ftSyg32y2axqfgdcF0N4O4sLIEFrQU/x5MIbNuCj72+/G9c
         BnUx/CETywH2RpQf9WY2O5rAXJ8xRCyKU0DHdqExdagCrO36tISI+AKfHMO/c4KI61xr
         0/FJVLWlJ1Ren66rDdpm9Z8Y5MCtQysU7dfkTQusTcZdiTTMaZrKixWBxpnX2h8j0YW7
         17zqSXAO471KtMir6s61PXP0SYRaeDAj3X0XmrUnWnK1gmroqSjeCZAtCjcKdUVROmT6
         XMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HdAowFH9jipDKejyM813D662CypK8NeENF8iZZGVI+I=;
        fh=tlyioz0gPV9oRas2cCKW+z0PXCxI1CRQCzev/HIoWmc=;
        b=pGPCKa3oS75EVDSR9PS9kQxaOl/JwKJJ8xOiBssakhZYBuwTBrapwTc7nCa0G2oZrx
         0E9aAXmF6p37C6TRedYgcn6e1Aot7bdr+/Q3fq+cZRKIyn5vKPFZ4k3nvh1KQsYmBWX5
         Xfy6/jSlcK+V6HwnR78z3xljueTu/QAPj2lWTO3W6/z0qmCnTxKVZhYazWKk0nHfzJXP
         7kYaVz1ov01A2HhMRRkhHHfk+h/EEZJyx5gXpFgn2+ZDbtY08rHNSUo8H5d5uSdBJrXF
         lZoN/drh8N9dKK+0aOQLguaQeDJJQdfySH4vRMP9UARbbdlessKaZLBmu4eOxIRyozkz
         CTWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783154761; x=1783759561; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdAowFH9jipDKejyM813D662CypK8NeENF8iZZGVI+I=;
        b=XoFUl+QRM3niNGE06p/8VtnG7ZA1DHK/6NSyLS6FuWx785HFGKSZmNSl+w3v1EhnKK
         xlRS8Jbc6TVGiQaiFPpAbjVXAE0jBF2NShXXekGKjNCx/6V6eITaJySfu6nsM/0C0EkG
         3RU8fAJxMo2ieQhTSkT/Qablx4W7peIpikL9Mg0tpnO43L9SXH6Iu9IVJHmrHq1jUuxo
         glqzv2FeOhEPxWxZg3X3SQFrvthTl9taGZdnlN5tyFNHqUIbvk6RhGGgKlODaCtfMwBN
         w4s9EZ/PCG7dP+4cGyGtpCw+Gxi8X12IJqt+d5LGH2L+qM3/3yW0t5j5DIxXH6w08iX1
         HD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783154761; x=1783759561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdAowFH9jipDKejyM813D662CypK8NeENF8iZZGVI+I=;
        b=KDnNez/Zo0RK9qiiqdPpwO1Ol97mK5H8FhitWqNEokLJVmQUmx3ilcFbqbsUYhqTER
         Rsp8ZqDzW9k1ftZPuE9fc+W6QjiHBE8q5t+ebmxalnb2WLtQeDQOLlRcTVDiB3khVt7s
         s8qvSdQIwYcYLPQQq1wEU2O8XSGuuxQkC8S1/uTUks862J+hgQGBEnij15Zt39N+gAz3
         PFz95lycTZfgOA6P/y9XDhVp2z6qMbtQE9aB8UjLrERJlEgCasc/J8iTNLeHK96mykbM
         fi692QPy0TAmm7YcCshA0R2OOdgn62yFpwbadSH0YEFHM1t3RgtKSfGFAmQWrv/zY7st
         gM8A==
X-Forwarded-Encrypted: i=1; AFNElJ+DXKb8TVvmu+B02UvSlpi7VlGhyHu6SF7YYl+pOswoTvdvHyLZo0lKT4+hM/eZZetD0wtLDYs2PDLqfzzov3OS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5oPSe4O06/HG0W9G8+pXyX0uDvWacJ8zDrtQQGLabgvgOe0iu
	OYChOdCzoLpONJmtlv6JO3/Izf4Ciqt0ct5TrC+d9xfOHhO2K1dDjdlLlC6DQHeEweT2CjzghdX
	DSjk2BaXcfyBTe8pohQaCt48Od6Wt5g5qYg==
X-Gm-Gg: AfdE7ckd4W3K+vvuMPDm5P3teIeiU4Hn+gxAvmzQ7sHy2c5xAKM2LSrb7yStULvt9fq
	TaQvCiJ+pR3AAHGnpsivwuOl/KR8WZ/HtD02DFPPgDJvW90PW4Qrbz9iGfUfKCETAKAfl7h1tUs
	S6Sp45tc2PDZ25GuxekHwVC5KAP34vp3FpYXee3KRr7exEUz4PVuavkJiDAt9SwfGxDtvy/vUjQ
	Us489vB11ZKQLsMS4HToCUnhiVtAJQtZcdFkZaEO/9dUMfLX1uKLI9gTv+xHgclf6LtkaGoFw==
X-Received: by 2002:a05:6830:67d9:b0:7e9:b4d0:53aa with SMTP id
 46e09a7af769-7eb7fef3ae3mr1509892a34.27.1783154761285; Sat, 04 Jul 2026
 01:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260608124018.480365-2-diogompaissilva@gmail.com>
 <CAJpoHp6DnspnA0rirGb6E=A9wCS3eaDn=eFaqmae98Q+39b1PA@mail.gmail.com>
 <CAJpoHp489qKfkfLOX-XPLpOWo86gibZB=NM_dXPbv0yDGmxysg@mail.gmail.com> <2837071.mvXUDI8C0e@phil>
In-Reply-To: <2837071.mvXUDI8C0e@phil>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sat, 4 Jul 2026 10:45:50 +0200
X-Gm-Features: AVVi8CdYOU8UFgiMqZSy_kqF2cXiTqFa8qXPulo_pHpnNo2bmATQgxO9Gfh9jAk
Message-ID: <CAJpoHp4cRALQTDkBevaYu1=v8iOi=4UYZ+9iXHjsLwg+DCb05g@mail.gmail.com>
Subject: Re: [PATCH v4] drm/rockchip: Remove dependency on DRM simple helpers
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "javierm@redhat.com" <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_014603_064673_9B8E024A 
X-CRM114-Status: GOOD (  10.86  )
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

Hi Heiko,

> the tool you're using to send patches seems broken.
> In the patch all the places that should be tabs are replaced as spaces.
> This of course does not apply.
>
> Ideally use git send-email or b4 for sending patches.

Sorry, I think it broke due to re-sending with gmail. I will stick to
b4 now. Thanks!

> Also, please don't send new versions as replies to previous ones.
> Tooling can get confused by this, so please start a new thread for
> the next version.

Noted, thanks!

BR,
Diogo

