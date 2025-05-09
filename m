Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC90FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=; b=V+iZUTwvEq+UKQhnpUhvlHpyaH
	TMZsz1Aoo9Ul2jNV9Vk8aLg351i00EKtlhHJzFQEzk/lx8Jjiw5H27ockomQOP28K+T7pLDC+PG8u
	2B7K03XqkTtMayzLqezNoSReEcTEWd61z2J1K4XTsV576UNW0pf2FYONA9OoU+B0eB6761nOzUCmN
	M8KeMbA7VL1UcYYtOL4V87mEDCtQ6WVQIgcPlwuqt0SLy3yZln0tUbjjU8O6bUqJtcBu7utJXPgbp
	4rdMXGnTKRYOtJf7lcFIxm1tu3r2MBzudTR5w2QK4LJC3juSCLdQpHnvfMV7dWU9/rhi/BBaOqN4D
	sVUHKQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJx-00000004p0j-1aDi;
	Fri, 09 May 2025 20:27:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSS0-00000004Zdb-3ZE8;
	Fri, 09 May 2025 18:28:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e661313a3so23658395ad.3;
        Fri, 09 May 2025 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815280; x=1747420080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=Bzd75DUK0P1fC6uG0vDl3wkR7QPeveaNragb6D4slP/xMMkeJpB7ZSZIjLggnD7AM6
         IrdRc+F5xvl2VTcr4gD0vjAz7QH0mZwmHCOvq7djVgSD1D+Gr8yQT+TaeFDFlpxL2KrU
         Os2ZRdhut5LKufyGGearuvwdEHb4lAzCKgrV7l465V+3t+ybjMVMa9sdXbpJ/sI7cO1W
         LEE17TCpX+AkXDgRBKedKHk4B8woru4ZhBGh/JNMYw1CEANBhNrxBRukMWaPYeHvBW4H
         GUz1Fnwpz6ESVKRAoYnOjX/CYbNhHiFjoIV4w6+nC0BrC1fVWFMJCdDOVBZ1I5mJotCU
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815280; x=1747420080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=CPvpjIR3I8NobeE8Ld7slJJJX+LjEmyRz1IGQsvwEjkgSk5DswnYjE00z9Ll4ElscW
         ambikVkAJygGH2n8clqcv9djeY8fLIKj+Sp1WE3v8Pw5scRvi9XPDPJ3X+185OAXBHjK
         k6Hf73vbx/dVD6Gw//wxZH92ULYYKIvT+CqZmBGro5+GlHB60ptsTfseaK8UimJ99hd6
         Gx+wYTLlieDE0LHvm1iSxaP0a1ArbXniI6stUi8NFv9HhVt/RS7e9Dp0zuvc39640VRX
         KZoT9h3fHYPs85XL4iOC3FCLxNO+GzUXvxg1hcH0AJ77herj3MVVi0ByIdD9psg9nbpZ
         SpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbY+adHGhvOqq14teE9gDlV87kNHrSuG1KuJ7nj8n6q5unc/Cm7tg33hFWcOA++7HCB/2I5fhN7ddIQd9N7Taj3A==@lists.infradead.org, AJvYcCWB3i80oBcT/Jcs8PJ6WxWwOBi61BOs62X1c5ei+cB4q5a9UqasJTVaCYft4UsLF5dyrFtkbopjrkhEZXRJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuYP/OT+9PhW+2i44nhsceH7Bdzysp0MtmU7NutjSW6dTT+Wj
	NcWUcUIhzfmOwpkNNZcfafAf5JngbtdQq2oo4OAlLmuF0wH9zV4FrfptLehURPgvBLIjTVeAtr1
	c0Ng50oEFmEVlfHkhaXR/zk7W+QA=
X-Gm-Gg: ASbGncsz6QpnSeR0RBopaSlbxWZI5wuXvZTDOmvZmYescTHkJMYP0CKS3MQVs+b0UU3
	8TJW/VY5MHoXgAt3GH4IB0dL7X8St15oQaXCDHirHQ6odXdmZqZnykYo1MvBs6rTKYXuy/iNanz
	FWjjhXPFS0LwzfEJJ+p1w88OHUALeeoNAiGnPjdQGSNH9R8IMEUbINJ7ghWVxeAk/xLQ==
X-Google-Smtp-Source: AGHT+IHXDGWP+YtZpWiwJiGwLYqFvxGO5dbb7SWr+ooxT2b9DImqaiGMOG5CHnVu37yhFV5sw1lsNGEQqFB08eoyEkU=
X-Received: by 2002:a17:902:d48c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-22fc8b32ce8mr71176355ad.14.1746815279648; Fri, 09 May 2025
 11:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com> <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
In-Reply-To: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:27:47 +0200
X-Gm-Features: AX0GCFux03CvY5ldQo8MgJxENVqxGp77YENyE8ZwpmGhXEQFNatCnqiqkcdNym4
Message-ID: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_112800_903750_D3A3730A 
X-CRM114-Status: GOOD (  11.51  )
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

On Fri, May 9, 2025 at 5:35=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 05/05/2025 20:43, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>
> Could you add a Fixes tag ?
Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types")

Neil, can you add this while applying or do we need a v3?


Best regards,
Martin

