Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2629C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS+zfB7x3WM2aFm3VJh+jRc3SyKH56pLc+VNUMeznOo=; b=2OtXbWw+lUiW3IumHtZlpcIy19
	Z1RcW6duxsGLjde5AjXaFs34UH+lIrRolf1yRO1xjL66up8YGGAKsXdgB4gL1vAtMuEpfx5FF5VtF
	84w+xNldP3hSJ48MDNyA4fhc/aEFWeUHOUcOyC2hO7wrNogU6DSOFLeFq8cy+SNtqjwpGKkP/9EDh
	bmHswOw3LDnp66XhRKqCRZHZzwUwk/bfGlEIsy5zF0ZU+uLvPSVy0SBjrTadNwEaK1mJi/zo/BsJn
	++Xtzv4rZBAMVX70rmHSyay4fkVAz7c0KzM7oKxd89JrXNtoe13wZy1h0x7N7MURdUBr18357Vifk
	X2P4xIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffmX-00000007Orc-1pq5;
	Fri, 03 Jul 2026 15:26:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffmS-00000007Oqh-2tTP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:26:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c88cc025f54so425324a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 08:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783092376; cv=none;
        d=google.com; s=arc-20260327;
        b=DN2tLUKQCfS5Z0Q8vc/Qc/PHhuBy8p9dIf9gsMaL8kM4VncKFvWVIxOwypXIVpji0u
         iN7iwO+Lkj1GlcZF+fgmy4YvGxtNHiQQl+Og33/Qbn3pN4b9gDEFIZb0I+fD6DhOdFSj
         9WL/0EjAVd1CE5OXS3+xjDbloaCYh3kysinlHToufLPMgjoAp83vkH/ejGDEkqYfeKNC
         b1cEcjuogRJyFXm7jgqDb1iYngixxj3ie/KXA/DLdtgVtNdyRtKfs/TR8xQt03j6v/Ig
         Phd6cnA4B67tJuRQXxXLQyZUP4EqqlPKK/myoSYPtPA1nKb5t3+seZpaTlY2Q1T1gGV3
         JaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SS+zfB7x3WM2aFm3VJh+jRc3SyKH56pLc+VNUMeznOo=;
        fh=DybuPvq2OWgFcWFb9kmQhmt5Nu7Y6geKzCg6Kp+TVL8=;
        b=sP6IfeiAw3/2fk0dFGFVvnI+3nenSEXKB7nEdo/iw257UerljkmRH5q0BpprUTyAg9
         CX9QHgZzgBZwSfclpZOH76vnawQJigC8ybZqg1AyfDVX57K/XNLSqu8etOcwicgvvrIy
         JV6zYfnhhHTGnKpA7z47/W2tv98OSMfTPr5lHMi9PXSRd/lT4MWhhuP0ofHVU+7Iy7pY
         Ij4juE2qTq6kas9SWJSnHixBYhSADSVcBqV7lapuKFdXGQ+fdcVCnQfxH+qFDu6ZxZ7s
         YtBTYsL2Tr0wFHnu9ts8ypMgmXPMAzybT4oG0rwXIT+nJPpcka99JAkfiZsuAM3+/2dJ
         Gx+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783092376; x=1783697176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS+zfB7x3WM2aFm3VJh+jRc3SyKH56pLc+VNUMeznOo=;
        b=DFZKiCJD+/AKbCAoWKvWxU2sqMxQW/YXoPIXz27QU1NWRpin9QCMc7SRqE5b/EFPoa
         WyjT+AeBgSqOc3RppmUmolzk6/ZaPScaeDeIhS2yR0nch9w2qdl9HeqofyJgirGwMuhU
         drBrSaMwcOuW6Rhjh/At1EbKbM3phBi2KqQvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092376; x=1783697176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SS+zfB7x3WM2aFm3VJh+jRc3SyKH56pLc+VNUMeznOo=;
        b=TuvpIcDRRxYat6KVQETaeQMcgc6wwdmU4DM61rUSuke+hg0Q3Us2t6Knyh9E9l6FGd
         YvAxgffipnxbEgAxK5JlaaWw9OgDTd1D0lDk8Lx+5sgb0Sp5Q5sCCuPfuSNCjRum1Ttw
         QbH//Pec6MR3srYDOLJhq6Yj+OX1GiqBlLADaJODt2nyzKWhAJhisEi7Bpv6wOosAsHL
         AFlci+j1ReX4kS/zGDxwfi6Oqwf5pfTTzroKHIh1HDGTda2TMNFIYr0n+d653dYe1SD0
         VF5VTYhu/3TAz/b9NKVTUnm5bQRs/B4dAVQe/qadptx0TfsbHOIGTTnw/dJuZf4SgKNp
         Uafg==
X-Forwarded-Encrypted: i=1; AFNElJ+KMPmyJqm02EfpkS/gZx6fjmJlNp8waBxYFQKOv12dOLuvsVUWzEbbFNEEUiYxoMBrr+F94fUjxKdf7g386onP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx13udnXy1uH1p+g0fz2K2EzNqMsxRBJYGdNvTBc8P5oGFdPg5y
	LM4ovO0dzy7MOQndzCILIdYasa2llQBhQbvllqLv3zSNAXsdmaXUam4dLlRik1Vyh+bSmOgnOv4
	RJ9KseDqDBD/6Wp3giPPoGNjdk5UsvgQNCA8oWzMhIksaP7drq6+MPlI=
X-Gm-Gg: AfdE7cloh6kkA4F8i7J+Fw9oXoiSdx898rp52grN6SvQeWN0al8WKPlcKBnMNnN6HoG
	QQ0k7MI3jOogY/StlH5HNJn7NjVpifc/n96Bj+biyk9i0KVJZvKMTu4aMEwEfqfsFffj24vDBFF
	jE8nXX6sBUa4TsZ23NhoiygYCfvtFS6pqfNYMqjP2Q3SdFC/wSJdks2dI7FLE0devaZ40HJ4QMF
	S6J2dlQEP4OH3W0iUV5EcPrbzRILuG5gEKON388bapjLJeJmJdxk84qazirpmjauaQ7UkoT2ra9
	4NocPY1pm0nUblJBO03Q4xM2CB/O0Kg=
X-Received: by 2002:a05:6a21:48d:b0:3bf:6c08:fb9d with SMTP id
 adf61e73a8af0-3c03c715558mr313481637.49.1783092375859; Fri, 03 Jul 2026
 08:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260608153421.26910-1-dbgh9129@gmail.com> <CACrCO_W7jHY6WMZbPsUHHHWFK-yBHayS-5UcQeeyOGiFUcV2eQ@mail.gmail.com>
In-Reply-To: <CACrCO_W7jHY6WMZbPsUHHHWFK-yBHayS-5UcQeeyOGiFUcV2eQ@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 4 Jul 2026 00:26:03 +0900
X-Gm-Features: AVVi8CcuonzVYVsLxC5kmgxp7B9IWfvFFHxlhiyNFf5P7OQRPqAL1Y3ZvwkzEG0
Message-ID: <CAFr9PXnK=x0ODqvaS1gfa=Judd8LeQEk9CR-+xvnQKcZGMKDQQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: mstar: Drop OF node references after mapping
To: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Cc: Romain Perier <romain.perier@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_082616_727173_D9FD3BE4 
X-CRM114-Status: GOOD (  12.28  )
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

Hi,

On Fri, 3 Jul 2026 at 06:11, =EC=B5=9C=EC=9C=A0=ED=98=B8 <dbgh9129@gmail.co=
m> wrote:
>
> Hi,
>
> Just a gentle ping on this patch.
>
> I would appreciate any feedback when you have a chance to review this.
>
> Thanks

In my opinion this doesn't really do anything. But since people are
sending the same patches (I guess because they have a tool finding
common patterns) I would accept a patch just to stop getting the same
patch again. :)

If we have to do this is there not a cleanup helper we can use to let
the compiler do it?

Thanks,

Daniel

- Sorry for the spam, gmail did its gmail thing where it decided I
want html email despite telling it I want plaintext in the settings.

