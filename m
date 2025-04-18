Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61175C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=; b=bNbEmLm1ZLG6ii3rDyBmw9zXiG
	EW1uYTMqahPenHqzk2jm9BuNblBxaWMuqPzCqXm3dmBuHj++8IGnmTT++Fv1Orlcqj/PtrH/wLVIB
	Laxu2dxlZkvoAQqFdeg2vn+ZbmVraBFa0dmgxZ0E9lQXrpjGqPUrIduvnKODWfy8RYcfDkby9OcRy
	n/3wb2hekeBUfmRKvBiHD68LdPap0W3vjLF7XqL8j5ErPVMKWvyKYWPjaWtQcHA7tbUmLZaxHwBr3
	EMhZZMmEVU0/KyYUaWi1aVZJ78eByH8Dhuw6GlxPuyV11R+is1jZ7W5lrGDjxlRbPpSHhQjqEuAYJ
	XjK3Ry6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rP9-000000000Fe-3mhV;
	Fri, 18 Apr 2025 19:29:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5rNE-0000000Hau4-0TqF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 19:27:41 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b09c090c97eso1440825a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745004453; x=1745609253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=;
        b=Kjx5GBytKhDxp3hV9XS6HojkWd1gFsYbs6rRAWueVB4oxPOcBYaS5MQQgclq4IcRrG
         P/oVeGnmW4bAYOtzn/njRhXCl0d0k6PhcjBD3krm62Nb6VK4jB9ayeFoz0StbIK3JfDz
         Lq91SORTmdmYHoxLJNFPIz4wkhjyDJKgwuptg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745004453; x=1745609253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXliZB9xDy/vBKgpgY3nlv+6pXp7lLwAFFvpUkQS7Es=;
        b=OMsk+GXfMarR1h383buhXu89k28gcTr5xMcQ88Ozhr4i3CAsHSAHnDuLGs63/RweYv
         8sHpsxeDR9QoQzP/k+eFvpWEx9kMDMeG/PdA7xranPRqeLptkbFXisVS2A9kHQZ9qA+B
         WNumSs62L/3ZUaGIXlGkehlsa9pTEU0pm5QyCQn5cyFwX2DVkVoGlksdMhEt9rWrq8Rr
         esRfSkJ5WLtsA71NF+lsqRlxmlPbdudRnkWc0onxi/7oSNfHYMI83BDCxLQiZUYTSG8Q
         eBFu8f5ID9BV2LyQJtmTsMzmyReXLOO9+ECo0UDYfU8iOXDSpw5jZKJbdfEecUr0+sD4
         ONsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGcz1HtH8zyRg+T55Wp9OtOtohwIzlbTCs6QmM1tbig08ChbU3avjQPdp6OiRgOq1K9GnlDZZF4YuPmVX3ZMU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kKr3Ac6Jo0o0AEBRfmmmB21mrbgWXNGqpK9YG/ldDhx/lgps
	ypRqDXWvSBq0Kq7dD9gXL76pzIidyUdy3Jyz1T4St03G1Ry6KSK1cQGdiAgpuJ1AB+hq7zWh8Qs
	=
X-Gm-Gg: ASbGncudrI/rZEizVG0A8Sppt46tLZkj0gya8OMmth2kutNazLO1jlfK1Nln5TEvpUd
	Qa6rk5XYjIA9FtW4s+uydelNF0wfsBKOO/y3ZhvX1gm0bZkRWThBBQmh5vFdC5om/iVvV3NlrzP
	sPF3mhcPgBwLUKz8gQC9Y4gPAbXvBGoC6yf4bgBRXD2L4yRVivkdZK053GGshxiAaogYmS8Ky6X
	YhMvjRBOU58PSY04kS8D+ubzmAGfTMDixxgUfN2gt6TLW294TtKxW4elmLkoKm9YOtz4z1GQb7x
	uwy469M3CqiImQwRd7XloIeBvnUrfgoxo1iw+29tf91StKdeGxlXJKPWee1AT4W/AA0S13UseZl
	RYZdcqeb9
X-Google-Smtp-Source: AGHT+IE/ruSDRx6bwcpevkMmZtgEPnM4xxdYN/kDuM9eWvQI61k9NjfN5mMsDBQ5QVCglfZv8g5eFQ==
X-Received: by 2002:a17:902:ecd1:b0:215:bc30:c952 with SMTP id d9443c01a7336-22c5356792amr40918595ad.6.1745004453623;
        Fri, 18 Apr 2025 12:27:33 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde206sm20591085ad.14.2025.04.18.12.27.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 12:27:31 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-aee79a0f192so1389698a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 12:27:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWV1bH6W4H7WZKMVBvXSUK0Enx7lQG2ijDnGTyBNYU0ryetLNG7jt5gMtgH11VVREmEFbppNiKoF2nWTJ5PVw1@lists.infradead.org
X-Received: by 2002:a17:90b:4ecf:b0:2ff:692b:b15 with SMTP id
 98e67ed59e1d1-3087bbca3b0mr6080668a91.33.1745004450746; Fri, 18 Apr 2025
 12:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250331143710.1686600-1-sashal@kernel.org> <20250331143710.1686600-4-sashal@kernel.org>
 <aAKD+zsLwx8pBSOE@duo.ucw.cz>
In-Reply-To: <aAKD+zsLwx8pBSOE@duo.ucw.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Apr 2025 12:27:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvoAxfipbsG1O-WXBfoPn2kEvgQk495AdMike7swgnpQ@mail.gmail.com>
X-Gm-Features: ATxdqUE0FNJ4-KqG291tKKSsSflmlD7l8xzy9IRc-kV_X-qxA7cNZEuYYXsJ3pQ
Message-ID: <CAD=FV=WvoAxfipbsG1O-WXBfoPn2kEvgQk495AdMike7swgnpQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 4/6] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
To: Pavel Machek <pavel@denx.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org, mark.rutland@arm.com, 
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, maz@kernel.org, 
	bwicaksono@nvidia.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_122740_181797_6C34976B 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, Apr 18, 2025 at 9:55=E2=80=AFAM Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > [ Upstream commit 401c3333bb2396aa52e4121887a6f6a6e2f040bc ]
> >
> > Add a definition for the Qualcomm Kryo 300-series Gold cores.
>
> Why are we adding unused defines to stable?

I don't really have a strong opinion, but I can see the logic at some
level. This patch definitely doesn't _hurt_ and it seems plausible
that a define like this could be used in a future errata. Having this
already in stable would mean that the future errata would just pick
cleanly without anyone having to track down the original patch.

-Doug

