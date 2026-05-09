Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A053FCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTDsNVE3ocqjOsopP8iwGEg0f1/zwRBYg7404Npk/Nc=; b=zTd6PCRPodFTAdMLT2IsTe2w12
	ghdJk5MWK/1qlAN4lKTaNXfbPe/QhL5b2A4XS2O6dlSXz6NVGqHbFYr8zPsu+8SNrH9Z11csURyoW
	3imhdsU65BIPQdKkRbddUmIydMNcmm6z5cGPZ49mN4Z8RMozfSURbUCEEW1owTJUEMvrKrkXJW7JX
	4aAJhMI8119GMvimpAhBmugevbtc3ECu36ilq5DA5veDwL7vp8inozU8CXHdCgtZNSau3AhQoMcpW
	URd7atC5IOIm/QtSgLpV0H2vzmJMjCooznPZjv6ovAY2ZbP/+X6NU0G/noR2zzjiwRyNJgJQAFW+U
	snp2jJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLknh-00000009HcT-0icj;
	Sat, 09 May 2026 16:45:13 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLknf-00000009Hc0-004J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 16:45:12 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8b8e98fd885so26666616d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 09:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778345109; cv=none;
        d=google.com; s=arc-20240605;
        b=A+AIcVJ2JPU76QPM1Zv4DiMh7V7q9Hfvr4cqIWkhRCKq+YL8zkDl/AF3fZzUeovVF0
         hxpqvFqgBEgv+4qNaAqgdUU6YYXfm3hSzOX5cVwKTK06d3kPcGn/oFP/HRtLOQjzljX0
         PKHsbEcJzMgTv1ZOK3KU7UXLFwE0fJiyrw7yiSV1gY2k/77GU09YS+cyRh5TmPiw6IRY
         khiTwlvMG292IGwkrIXUfaSzJEDPyhO/dDNvvn/jLTjezCeQVcDItRouxY6+mfBDVfzg
         TMxhl8KMcMFseNCakbbNtNgRfES7/F8mlnN0bVpSvCJZCwtPCBHzAmQx8PZPUtMyERkR
         Y9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTDsNVE3ocqjOsopP8iwGEg0f1/zwRBYg7404Npk/Nc=;
        fh=wZD5/QOULSmN3nwSE/wRAZGJMfJSDvhtb1L3L/Ejgh4=;
        b=cFPhtW3abbnsPLcyqtx1Hu58JwJG5e2tttrplUio6ubKjYi3r6tVQ22ZQ6th3muTei
         lGDGcjX+7wz8jiuawlcM0DAhMpNJZgWJHM2ozwvJLPL1oB2INrmY1VTDI/g+ZwxwTydb
         BeVAarWuZMvyDDZ+DHHyZYv485z/D9hsoJuYoXNtBoq/4mkU821BC3y3aSBR6il3w98G
         oPrLNI7aDlA+ckHxDP20smy5eUX5p/BS87rhsrfF5R7BiOog2AqLyq1/3WEVGXGO7dul
         flmCjFJD+x9RnMmkphWVJeNjhRMb+jmDpnb70AM+uToDuPVPSBjuV1kTECtPu0SdDwRS
         uv7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778345109; x=1778949909; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTDsNVE3ocqjOsopP8iwGEg0f1/zwRBYg7404Npk/Nc=;
        b=RVW/Akdm6BpbQKlp5IrM94ovvxevzCZ/Y5hyjvETXz2xb4vD+zGQ7RTFtR0RYvLcIN
         91l0BQz4TtWwx/HwQqOOJxhgH2msX753MgLIsTvce4afhIHQUm+FjNsAS5PqJfT7oAqO
         8TSKOX7Je/Tt+4uDF96TpkX7jonwPJ8hO1TL/wjdM5Y+d7bYsAXlkmoA+wh6DGdGjJZA
         5LsKdHJP1P+yNvE9aWpukyTLmPYoJOdMXa6f3O0sisVQidzzKYZD26WmHmilrOS+l0hA
         lJTIP4rF9ftoghXWfvTELex07PSzS0aJHKX0ewD46gunivjE8jLWENLD5akley35L+ma
         zTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778345109; x=1778949909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTDsNVE3ocqjOsopP8iwGEg0f1/zwRBYg7404Npk/Nc=;
        b=g/gvYn//o+pEVTVqxvtHQo5pJYDO+f7NiFWm0Se6JzVQYDLHG4TyiYDEyxeGGIsyZp
         /MOIEuYuAlvG8jJCasPm9Y0b/7jl8CpQHI6jLXjz0bYmaQcWjTmfh5MQJMxZIJNkHRd5
         7HSnvTx6DKP1+h1LArdqSrFPno1GGT0WHuq9qAOcD2v/Rj4Z8ia09zqgJJQC+5yMIAgO
         PPm5vDHR6VBVAe3teuRdR8Mr0l5ChJ9Jl+WPTX3sLLqxGAXIw3eDpzPFs7piIIMnWUVC
         XvI+lxaKXznORLKtUM1zhfeTheR6T8Jm0CD9Drl7G8DkDzutusXsyoWHyuHHxbMiMjXb
         l8Aw==
X-Gm-Message-State: AOJu0Yxw3FGZr3wHcL+NJvgZa6c3Beh3Zztkzn0LtcdV41rfTxoOfjEj
	AqY/DaYVvHGHhHX37tZpnjLhjYcww3lpube6FtMtyLuaTZ7nVz/MALi6brxrRCUvelqmybMi9b3
	C+RKc1T6aMoECD97rnAMdrYU+iHNRe5V7SKpcXpmV/g==
X-Gm-Gg: Acq92OHpuh4B7zVTljtfAi7jDzSFMblyb1/+6SQQaV7M60CWJEL52rrhna3GTy8WDgA
	o6+cuqJ/xrEeyTtEpbNcGXTejRm7baqt66tvLWRprVFc5duFfawzeaiacgO/uzrExKqiRxkboo4
	povxhFsmkMqsivT8o6RXJ/6edH7yO5nv4qN5uVdqIOet1WIMyU7fYXSYnf73+wFG3Bf/cVyD4/t
	eTC5u8tO5XdUYnsbbqh7dLfrOmkFtJzisQp9YWy/Fk5UtNtcHqvfmVipMu9vVCERh5avEpO+6Qn
	xgYfQiaKcrCTSOAidRk99FS/7kGRw0Qm+VfscGJfQ7pPRdTVlBf9bmY0uO1A4vV68PCt
X-Received: by 2002:a05:6214:48e:b0:895:498e:e9dd with SMTP id
 6a1803df08f44-8bc42784279mr256622446d6.2.1778345109540; Sat, 09 May 2026
 09:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260509014246.21649-1-enelsonmoore@gmail.com>
In-Reply-To: <20260509014246.21649-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 09:44:57 -0700
X-Gm-Features: AVHnY4KgdnUDXFOPNu9q7392VVUMqFCBpgGPyfSaViyblkIGEqmRglq6axhe8Qg
Message-ID: <CADkSEUjuzsGLnL5N43dc6sa6bH8nGBr_U=tf-nXNAkTD7N=Cug@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl4030-power: fix stale ARM machine ID checks to
 use the DT
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, Jon Hunter <jon-hunter@ti.com>, 
	Benoit Cousson <benoit.cousson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_094511_051796_0FF4A8BB 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, May 8, 2026 at 6:43=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The twl4030-power driver contains two checks for ARM machine IDs via
> machine_is_*() macros. These checks are incorrect because the two
> platforms concerned now support only FDT booting, which does not use
> machine IDs, and therefore they will always fail.

I have been informed that this is not correct and the kernel still
considers the machine ID when booting with FDT, though there is still
value in updating the check because it allows removing the machine IDs
from mach-types. I will resend this patch with a fixed commit message
after the 24-hour deadline.

