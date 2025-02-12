Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D98C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3Pf9VLqr0zn74ybOM4AB3R6LkV9Kq24XCYfLCd4K6s=; b=uziW8bjDhd7EkYCO+M7s/erZLj
	kXFV+9lcE9V3Rl9JFMAMsEZAv++ovhNz5IANmlvbJbgAgraZQW3HDhPkY+tG2UIInX4pPP6dO15rL
	NGb21GuoGnJFP8hMofCRZK+eEXV/OX2CPoYCjHtfggKM/M4bvejKulCQt20KjzMCA71uK8y0Z0UZ4
	VPPQtRF6cKzJtH33ymQM0PE7mNhJwQlavt3BPnaWCrH2gU+7fOt6o1G4j8hPsl1XAFX9+xL6ExIW1
	Opfv/6v3T1A5Re6ArrIZ65YL7FEI0gWxCqUJo/SKDLA2rene+0bkbLXL/uETxZG0gjasgYRX8dBZC
	71SLvuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBeo-00000007Jk6-0slz;
	Wed, 12 Feb 2025 12:15:58 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiB92-00000007Dvi-1wDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 11:43:09 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-51e902b58c0so3209026e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739360586; x=1739965386; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3Pf9VLqr0zn74ybOM4AB3R6LkV9Kq24XCYfLCd4K6s=;
        b=WRWTylmddfJ73HV2NN2AsR0PZgxXoDfv3HwwmcsY+K3YBlYukexQexA55lJaaNeWSt
         COJhatgA0BJ83ZUWzCDSp3ae9dJT1ItZF6Xy6UYT+J+r0e1uSUmnSUGDUQTrru8G/dR8
         miN9EicSHDEg1nC6zgbdcD9C7xkftQaVRZjpmkIFrv1b+1rh1gpkNkOq9eL4Iqt1WUq9
         35l4BYil3Bj0TnqA5Jvr4/3PRu1D/ztlhttj3vT3Ejus8M0E3zFsLtsLuK8UHbyOhYlE
         w64qqDlTSt7/WnEpR11bKZJ0fJRRSPgbutUN0uGnJH6VHjcUSR2x+DRqvtphBzvO2ODc
         q3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739360586; x=1739965386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3Pf9VLqr0zn74ybOM4AB3R6LkV9Kq24XCYfLCd4K6s=;
        b=U5nXd8SoIEBQSg7jjpdyYjXhKoSB2BauVbKB5Evlhi856DNbs3yjyUOkLjXoTv0nke
         0WClIkjznK5UxFzFgbhmAyvFtCfaSJn5AlW/3DbwWFET0LUSBrcNgVQQUOo1CHPL8Z60
         /kQRidhTcbFk2G1kMTaSnvq5+aosxdMYWpaQXFp05F80jhT/q11vPe2yAPQStCaGVSTD
         ERNpe+UlHeX3roUaCJOfScC+FTlDRS6iQBv6kUp5iSVB7i1LGTqSsUCfCzcS02cL0XDN
         43XRnu5Ff+4vgtaUtVhVZrFxXWfPmlvbY2IZjGS3bD5PR6B6JkNB7lNdQ/1anjAMRZ8P
         C2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVfT9KzLJY5tUCB4WZOgukq02RHJh+cj6UTBMudQdURX9XEJ3mdbVoKrup2sW3EgJ4HMD3uxnhdmldhpkJ0WScj@lists.infradead.org
X-Gm-Message-State: AOJu0YyNJHo6Mvg2h/JhYyN+7Ttkt0wNZZlCHCf7SsDzxLgWh9NQnm/y
	6/PtnJRv3dY+Pd46apQih+6QMZguoOCnT75fM/PwyxL7k9rMo2tGwKq32XUIWTlfytP6Mq7PPfY
	RuRS1E2IRvW5j64mIhfB9E7ijwD8SHkGWpbSkKg==
X-Gm-Gg: ASbGncu2OpNxO0cYs3fLaHj9m/bJxINml6ioUcNUtP2lch5x5WwTmJEISH47m+zsXIk
	2fsFiGz3wCEZ6HAit/ysjAsrEwBFPh5gS/wxJ2vWshAg0j7/3rdi8HhJPAsrDRoWkZKi+Zq703j
	s=
X-Google-Smtp-Source: AGHT+IFOih37+KrqDaHnv2z1gD470AjQX0R923clhFtL4aKxyGDPMwXe6xkjFhG576o5Jmtsc4iPKFF92U7xej2AN4Q=
X-Received: by 2002:a05:6122:3c4b:b0:520:42d3:91c4 with SMTP id
 71dfb90a1353d-52067b4369emr1897998e0c.2.1739360585770; Wed, 12 Feb 2025
 03:43:05 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
 <8634gku30g.wl-maz@kernel.org> <3902208d-8814-46fe-ba98-3db833b9a886@stanley.mountain>
In-Reply-To: <3902208d-8814-46fe-ba98-3db833b9a886@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 12 Feb 2025 17:12:54 +0530
X-Gm-Features: AWEUYZm2GCz4FlZi-oNTIdRy1QPKZCSG3F-OJRaS44oBL_Jsi3XOtSmcXBGZNeY
Message-ID: <CA+G9fYsjW2U0k2XWBESRpy+xpn8hHGYTEV3TQu6qdeqj7fu6OQ@mail.gmail.com>
Subject: Re: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_034308_515369_7279026C 
X-CRM114-Status: GOOD (  11.64  )
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

On Wed, 12 Feb 2025 at 17:11, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Feb 11, 2025 at 11:36:31AM +0000, Marc Zyngier wrote:
> > For the crash at hand, which clearly shows nVHE, can you report
> > whether the following hack fixes it for you?
> >
> >       M.
>
> No luck, I'm afraid.  It still crashes the same way.
>
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2steTT4f2J8ZJjc3jNJFMuow9Cb
>
> Click on "Logs: html" for the dmesg.

Anders tested this patch and the reported issue did not fix,

Link: https://lkft.validation.linaro.org/scheduler/job/8118315#L1379

- Naresh

