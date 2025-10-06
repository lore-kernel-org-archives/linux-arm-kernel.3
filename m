Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D4FCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Azz9O4mUwwwsxG7mSBpJ+zeBvEA2Nl0F6icaY3vg3+s=; b=gL/fsyBVHJE4HJkSHST9Ig/ErQ
	umqNL9lou6gu0fKIy1H+fT+zdmZTQRuNLLahDcqkrZyI4pljj8MP0XyIMRCvWUii36C1bZ1+S1Vm4
	HiOeZfGOLRksvBg0c/ADhGY/6jUfvjRKdrm0GaTdoxsXDhEX2J6tYI6XqcSoS0t3Yxc3t+q4+KIvJ
	2cL/6z5m2nuJEixuApjrA5Ql12BKNMncG7sF2pwekirYwSEhDuL3k28DjPjraZmTaZoSgLOt5ur8s
	Qu+zdadJm0Iu028BY+fC+uOeiPM9Z/1a4aD0ztWU01k+9OACjGjKbYSqZJB9eTCJzl4LBroV+wYkj
	cfWEkNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kFX-000000000YY-1ZoL;
	Mon, 06 Oct 2025 12:23:31 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5kFU-000000000Y9-2gD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 12:23:29 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-633c1b740c5so5437634d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759753406; x=1760358206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Azz9O4mUwwwsxG7mSBpJ+zeBvEA2Nl0F6icaY3vg3+s=;
        b=cUK9RwLjUangEc/1beM5FCTBwTu0nBYAVEkf72P2UN4uHOm965ePnX5Y4hMrsE+qpR
         zNQt4Z1Q4v+IzCAC4FDsGz+porklGopOKUuaKOVFzKW+R8Remawn39sTXR4nCLL4/a/Y
         yQA/EOSA5d+sknnkN4+IBHv8cafZD4UkaoUoYAxPA2pyyoW8UYBrASUJZQbidbYK0Te+
         F1U1/wunGtVMdW4cE6eVYfTzC5F0plHcWEzGLmRXNCg46zpcLcGOJwH1mFm+dn4FpTlW
         C0ETcU9lkgUidemsQiPWYlHuq95q1GTT7xyDuoLXhZTVQGOtlyCMeymx+qt6HCl9zJXt
         k+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759753406; x=1760358206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Azz9O4mUwwwsxG7mSBpJ+zeBvEA2Nl0F6icaY3vg3+s=;
        b=Ho9vklCda4eRdpnm8JkrPmF5x/twpDPDxlLC2MFyzRLDowK4klAJ9NolCsQaHtMBXD
         4pTDFMcGFSwkJp6+QEMNO5HnIYel4VUdcdIpR/CpTCsDwHVNev3gUaPVo8TI4vFTx5jo
         9czhiZ8v+fJT1QEKJJ6yprrL3eoVRcc5EsNieLrNNzMma0IffTpUIsXLMiBh5dV2pXWa
         dOUleRyh8jPZS0U6LgUFgyCVGfZ4bSXjSCk6HQfY0lCfC9TMAfX+Dc/NJ1GCf+IAx6F5
         lmO92WaRp7xb5Amz/WcQ+RihLjhvPwFNFLThfDEHcj0IhdIw5nTLeVXqeQbzv/l28D04
         ta3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3PtoTKOskMpeBxXjrL0LCH63EYZ11AF7gxpVuZNhANcxftpYA+R5RHy5dkQ7dRwoOekjLcYjDtJBrpWHqo9M@lists.infradead.org
X-Gm-Message-State: AOJu0YypFwDfv4CvnWwhj8eHgWp0jS5NnHfuZOQ4ajjxhu3tlxwlsCjx
	sLVbnzY9NC2a2OMJkxE4BKJAbH2LQDvxvTmE8k+HBH5dcdrpOQnS2Bqyx8/7phnqMSS+w+BxQDK
	35y8IEZ/iUihp5MRmEzLgM4vsaDLmepfKTOtQKJr0Uw==
X-Gm-Gg: ASbGncsubEdDeVe48/lIR/yOH9+zWbGUwWfxewe7YxqcIgmkItU42NO5tryQlrqrj/K
	FpxPCFlhvndlhKtH0GYRIRpWswni9Ga3n5AziV3Sf7ROlp7j55wC4w2pufLFXahVxaDeLTHdmJG
	Jpv1gqMJkT9VuSeKnCqZ+7Z3d3Q0El3N9bO1+kppktQSBApejs7NI/Ivq5uRCb8XYkXCyOLNf1r
	y25gnRmKEQLZgf8olyoP21xiN3h3V0QKwGRfgGAley59CI=
X-Google-Smtp-Source: AGHT+IH2DWL1rMufHJoRTaOEsDQX80kfcKh2Smoz9/7LaEmtgBq0ndRVK0/fgAr61uabtKnXzQgGo5LH2G/ebFNXG8o=
X-Received: by 2002:a53:a006:0:b0:636:13d5:6968 with SMTP id
 956f58d0204a3-63b9a07802cmr9764799d50.15.1759753404956; Mon, 06 Oct 2025
 05:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org> <20251006-manipulative-urban-antelope-31101f@sudeepholla>
In-Reply-To: <20251006-manipulative-urban-antelope-31101f@sudeepholla>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Oct 2025 14:22:49 +0200
X-Gm-Features: AS18NWCQYiaPlcdiDQop43x4w0EDfpR_gEuiAFidF0pHvlZI8_2qX-prnyesMvw
Message-ID: <CAPDyKFoz4P6cZWNA-omNtF3XqKKciC07aVXBTVQp8ueyyYxmxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_052328_691632_B7CB9569 
X-CRM114-Status: GOOD (  24.11  )
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

On Mon, 6 Oct 2025 at 12:54, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Oct 03, 2025 at 05:02:44PM +0200, Ulf Hansson wrote:
> > To add support for keeping track of whether there may be a pending IPI
> > scheduled for a CPU or a group of CPUs, let's implement
> > cpus_has_pending_ipi() for arm64.
> >
> > Note, the implementation is intentionally lightweight and doesn't use a=
ny
> > additional lock. This is good enough for cpuidle based decisions.
> >
>
> I=E2=80=99m not completely against this change, but I=E2=80=99d like to d=
iscuss a few points
> based on my understanding (which might also be incorrect):
>
> 1. For systems that don=E2=80=99t use PM domains for idle, wouldn=E2=80=
=99t this be
>    unnecessary? It might be worth making this conditional if we decide to
>    proceed.

For the non PM domain case, cpuidle_idle_call() calls need_resched()
and bails out if it returns true. I think that does the job, for other
more common cases.

Making this conditional could make sense. Not sure how costly it is to
update the per CPU variables.

>
> 2. I understand this is intended for the DragonBoard 410c, where the firm=
ware
>    can=E2=80=99t be updated. However, ideally, the PSCI firmware should h=
andle checking
>    for pending IPIs if that=E2=80=99s important for the platform. The fir=
mware could
>    perform this check at the CPU PPU/HW level and prevent entering the
>    state if needed.

I think this is exactly what is happening on Dragonboard 410c (see the
stats I shared in the commit message in patch3).

The PSCI FW refuses to enter the suggested idlestate and the call fails.

>
> 3. I=E2=80=99m not an expert, but on systems with a large number of CPUs,=
 tracking
>    this for idle (which may or may not be enabled) seems a bit excessive,
>    especially under heavy load when the system isn=E2=80=99t really idlin=
g.

Right, making the tracking mechanism conditional sounds like worth
exploring. I guess the trick is to find a good way to dynamically
enable it.

Kind regards
Uffe

