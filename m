Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046F8E94110
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=; b=0ZbjB43BV7SQEbbgtRH7hdrhwv
	bpTHbZaH6kqd2TRRtLRMLXAq9SV/2c2mII367YqNQRTk6tLNMF2V7zhifq6kr7BuwsuIYNbODbxfd
	a4eXGALJ98DYkW4hP9Ev6euvkcYXdd3AUilEXJK+FY6Wv7vb+b7/D+EppoOnFMuqBWUTAIjlhnKWa
	1+eePhyYoNSjA9c38hlYjN73ZmW0/Co3NdeXBZgKueS7h2y1eB+K+ji/9zPfKBafDezQnXRPYcyEz
	ppTROc+A/N9OIpGZpJAM976IFMgChQm8qRtvN/y4SozMbmnHj/clUPNWYtfL9LO9qA+mLEbZGbucm
	wxvTCflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaSb1-00000004R8w-3SuU;
	Tue, 30 Dec 2025 05:48:39 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaSaz-00000004R8R-0WPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 05:48:38 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-55b22d3b39fso1854615e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 21:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767073715; x=1767678515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
        b=gYvFfqTXMv1c/f3W8lwhilx5jYZg/kKR/iIDXzTd42Ydy9WJz6UOa92R6PWZ8BP2fU
         8in6laQ+yPFZAYYpMOrcm34j3zDRJ64KPIwu70Qsk9zuWkK/1hbj4jb5WT160A/f+OTg
         2OhWw4f4SDdnUn20kVAOXHoyL8VvzdToVqalA/hebFu3PiJeNlZZbpy6lwtgREccgabW
         /KZd9nKI+FbwNjf1v8voI28KG/W01CQ4OBJ/OErOzbK0v+30l93pAec18PAvqOlqQt7Q
         Z7r3OnYog1/2IvKjhOpdQaRWRmk0ANGnjikO3EiQHWMZjuw/2cgUbf8e0Az2wh0A00NI
         ACAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767073715; x=1767678515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Io2ywk5egcCouRJ+jUh5kFNImLPSJfA7UhLYpX0iGxI=;
        b=fJ2LpChvGVxuYo3qZJ5nPix9S5G6k4UpPbvXFsgmtNuyQsCwNr6vapF4S7ZuGk/1zI
         cZHkH7fD067eVH8S9P2BnpP/3soqxrsjw1xsCB/VC/HkE7UgkTRnRDh+gmmKaJ/UcoIO
         rr8k3qeVY53agkm26jTmB3NI6E4aHsCrudjmzOImpEA3SK5Q1q2tPVH45Xv0ofBBgLIa
         MNIELnghYmkAFCyo6Xls5gt3k+fTELGcDkikb3rBQh/wEnnUspYb7h+sVK6HId/u3z3w
         IqykR2NrR/dCux55B8cIvn8qPAI9I1y6UqpQAGTaVvRHoDYW0jTtgMUECstDYTQ7LuIR
         2qew==
X-Forwarded-Encrypted: i=1; AJvYcCUgsdLo/VI1qV5czH2BEUNE8Yc3DMkYpzsWgaHzPM/M033TA07J4IkERGb468EorTtPwP15Ka7JCNw6s9eghF37@lists.infradead.org
X-Gm-Message-State: AOJu0YxEmUDDG4sSNYs1/QYcOAfjaKjwUxCh4+XM8RRQX0eKC7bDGaVF
	5mXbjmbN9RoeU0QGF3sDQrSqKp+cpNFQuBmngKdlE9fh4b02Ce2gFafWUdN5vK/lf+E4RyKbeC2
	V6m8jhUtOSgsWVFh4SMQ2xgOx2o5LI28=
X-Gm-Gg: AY/fxX4cUVosgoh4SWxJY+hODbFksFkRWcYDyWyNO5cWOH1QkYmX3KZw+LWjlsnqHaS
	4QpczYCJnXQphL/5FkZGbJNJXAP9qtQlRo66qrjIpWmWZWmRILL+xGZC4tsS8reduYxwyJYUQ2P
	JmcHn4XPz7xb2CYIymFp51X1GMSENhiLO0uVwNhLFR4yvQdjKojZGVOreCq6rK8Lv8l9k9F6kll
	DhyWeDfamWvjnTMPV5sZvOgzpMvfyUglH1gOiFEEo9HeWe6w+CEqfZIhOsP2LMbza1ieA==
X-Google-Smtp-Source: AGHT+IGcn7ngK1Vl7ZEBA+uwHaBbyq/LtaGbWOTh1TF7kp4rDbVZJDT5LgJQCOziJh0geZNQCW6ZGjhSrLMHLeIwNHg=
X-Received: by 2002:a05:6102:568d:b0:5d6:155c:33aa with SMTP id
 ada2fe7eead31-5eb1a663165mr9947765137.16.1767073715290; Mon, 29 Dec 2025
 21:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com> <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
In-Reply-To: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 30 Dec 2025 14:47:59 +0900
X-Gm-Features: AQt7F2pUL_-MfhVXCOS419JhBeqjx_drkdULdJgcsbrWyUHU3_jdpuTD8pVkzYY
Message-ID: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_214837_185315_0A68977E 
X-CRM114-Status: GOOD (  11.32  )
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

Sorry for late reply. Merged.

Thanks,
Inki Dae

2025=EB=85=84 12=EC=9B=94 25=EC=9D=BC (=EB=AA=A9) AM 12:01, Marco Crivellar=
i <marco.crivellari@suse.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > [...]
> > ---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Gentle ping.
>
> Thanks!
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer
>

