Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB7EA4E18
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=; b=GnFHXp9JmxA1ymwCo1kaB0mTRG
	D/A+QNOK2DVA5urLDsswm5rCJxeDr3pfBI/g2Pz+PgIsTHIjr5sDtsHpvyZgewCC9bXv8s1hJkaUG
	t1xSsnO2AZNJg8S5WVblJ+KSgVGieFOz80umEfER7A9207nsEzPCipuXnATrKh3il1HaIsF8H8gMO
	ctU/fg08D3SRfWKZS4gzyjX2vYzhm6oiVYeR0W7/UvU8N+rzofAjPYSQ7h6aCSvFQ3+ixa47+r34Z
	CnH3EdFb20RJbWv/NgRlVns6hfZxFpCGlw5yW2hCT/ZM/cNQ/kp3BV9anfNq5jnuu1Ti41Ic4LNHw
	Kc4SMllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4sE-0000000DJAx-1zMm;
	Mon, 02 Mar 2026 15:07:54 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4sB-0000000DJ9T-1wcJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:07:53 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-64aea64bf15so3888265d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772464070; cv=none;
        d=google.com; s=arc-20240605;
        b=keeNzcfUzLj6hbZgSycS+43leDG+Lb2KFxLKj8fXdHpTtLsR1kUohBTdUVC5aDRySL
         AKcn8ONaxI1nOrmqJL221oaZTo3lq3Vc9SdhX9QaX6hHVaqOP0l4vt9IdonqdlqQ4xV0
         u0I0B6BMR3uw9cFDtJeoRKHlVu/VwuMd/yKkMWe6jePQ52fGHchDpHpPpIJuub50IHut
         FLo/A32ZzMUHunFemAd4PCbvAzSArvrYMKC/z4Im22oBGElgEKYtQCP6Y7cDE6oLMJ/q
         htjfnimur3fi881G8gJPkOBYRnBy99e+kBlQKuubRKJ6B/StWQT8il34P6xdl9TIBKCT
         fkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        fh=pe+Kuk5bm6GsMA5fxctgPOHBOgxCB7pHwdd1pZrU3kg=;
        b=LW4VoRY1gyfKDn7Tsmje4gW57+uczIHT5bo4E5abS7hpEy+4F9Hc6p0Ze7mdTG123p
         7LePapGk9RQ2W6m6EoAnaI8G1r5egtqohul9JaxbjdVwG8+9JIj29Luah1PVlTlY5RaS
         3cLYkqX3+LLLAYZiiu0K7exhuADFp/elLY5UDj230Tzyo1ncYXLuNpYZxtpNntic5X+V
         eLe/lyHvl5b6dTrJmFrJC24/khJmjEEux6SDY3rfsL6y9YjBxCGUDJCUSn1xAlJbTVGH
         q/6ATdu56iwx+VYAlMhw5GtqvJC9Gl1wnLQMphHOHjzz0H2aJztQcp2YuRtmvLy8rRqd
         /c+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1772464070; x=1773068870; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        b=M6VTNzJg7JUgSxFDeMZmK9Bj5vWNXHH20gC5wwzbijylLKcHhcUyZ1rmvt6/UmWZd5
         Rh7iuhpCDry3Ch68RBXjMRqsVS43HC2gGvYtTN3a+UqemVStN0EnFEj5LGQWHkioQK0e
         gWkFfmjePsTrSw5SF9zDR/LHMLkhtKrbWNWRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464070; x=1773068870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        b=Bu/NV1BaaOJDoh8tHCiJmi9mLzQsvC3O9FPESbQMr1SAnKpWO2WWbxjyXOknOB2mUm
         D7KlvqlmubgXRzQckL51IAFVJNIWJrRxBQuekdMoCN1mZY09KZGeLCexj/KaAmBTOH3t
         uYkxC2zZf5hu6djYTRFjoqdWiuFSMmk7ucCEVgR6am72QMqpSEqVMWBrC5T0EqB0yDrh
         HqIS1EfE7OSSMK8hzku5A5PpoaWv0bqiLPQEZ/Hva/Lx8YATsXScgHfNYGgDC8CsggHI
         VUWciFvIqGE0HzHq8wRGhAnQuaBp03w5KrTz+2P+gALvCeqkFr9h4HQzUW6TzcWn622E
         kG4A==
X-Forwarded-Encrypted: i=1; AJvYcCUrdNRIpOKRYAhlKGPMBXHqij8JF08HIuT5hQmEcRW7PmVvwHhJ9Rs2JnhHsi7n7iC66nRJliytXv+gO9REy5Oe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6qTegmLjiDX17HSLT4IVvKI6G6yMPGQJf1Uje0D1UebQx7iY
	C0uHnNBcwWAopDjwh/LPbvG5fKZ31PnkeomScoj5bKAx4WLAjITnKUt8xTWWvoEOSUOD8JFkGIH
	rUImpb9L3OCVea5su8ObCwfIaQkdLvXwXFb5SOQoq6Q==
X-Gm-Gg: ATEYQzzuE9lMP/0aiMmFvy1UQ0m2qOCKsSryKhjPvxi8/PeYWPPN5sqkbLz/oOU1/fw
	nBNGwNJdF8tfxinEsAbCnYPpw8wM3S0cu0a7ZBU5yU5n3hy1NMUYCPyGY0L0nbg1VoOktPPQpQR
	1AqmlztgrghCunoYqRuF8xPnTQA352BpZZ7OXV9Zk7rcNNGbqmImKreirTeIZiTkfFKI3UaK4XQ
	u0pU0MGwXe5KLAiXx9Zn7iGMN6w9Oyiv2PmGU8WvasZtsEEXW3S0VUHAYj6qGD8FmLecP4leEHT
	EbglluYt9qocTUPx7BWKv8a1c8KdxpLVGXG7MeM=
X-Received: by 2002:a53:ab0a:0:b0:64c:c1b6:714c with SMTP id
 956f58d0204a3-64cc2379297mr8671268d50.70.1772464069335; Mon, 02 Mar 2026
 07:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com> <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
 <5081457.31r3eYUQgx@workhorse>
In-Reply-To: <5081457.31r3eYUQgx@workhorse>
From: Andri Yngvason <andri@yngvason.is>
Date: Mon, 2 Mar 2026 15:07:12 +0000
X-Gm-Features: AaiRm531VbuvPlDMvL8ehAEpeh4QP_0yXJbIL2OEHZWnP0es8QNn2W0TYwz5fEU
Message-ID: <CAFNQBQymuv0roy_xupcgU1bHygfBeE3S1FepQYxpobLq8O0yEA@mail.gmail.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_070751_521720_C9F6FCF3 
X-CRM114-Status: GOOD (  10.67  )
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

Hi Nicolas,

Thanks for carrying this forward.

m=C3=A1n., 2. mar. 2026 kl. 12:36 skrifa=C3=B0i Nicolas Frattaroli
<nicolas.frattaroli@collabora.com>:
>
> On Sunday, 1 March 2026 17:47:48 Central European Standard Time Dmitry Ba=
ryshkov wrote:
> > On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > > From: Andri Yngvason <andri@yngvason.is>

N.b. this patch was originally from Werner Sembach, but it has grown
considerably since either of us touched it, so I think that
Co-developed-by tags would be more appropriate here.

Best regards,
Andri

