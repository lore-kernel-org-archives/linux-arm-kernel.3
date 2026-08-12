Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD2FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huenUMl5uc0M2LnoWQjZXPUhYAeUlpsSxjwMFpT+H8c=; b=rcTNxP/X3xk2ZMAKQPuO4Eh3Q3
	We9yDb3aBW5k1IaWCY1QNNmJP/3Zls2+fD9DAfnUAoKOVZOcyI/Wuz+O3RwobIgtahvSJU0L4IJ1k
	KIbEJByS5sJZXZLuyVKG8kAVHfyrQ34nEQlWJTPvakqrlwTIUywwfWwz+DQV2Xi1Xb269YIDCfGsr
	LAr9m0XSs6beXt0Z+2HW5GGWSuVnejZPwRytfsFv/ncg4rsw2hfM3BWYf8CccL3j8pX/k8UMaNGxO
	KzMFnKD/5LuWWWcmaAJ9SL1gZEP5lMRgSdN2ESTlssEjvoL7tc6ey3xOPkjDj43SDXcXtQEvoFJ7t
	uJtytn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9AN-0000000GIz8-0aTZ;
	Wed, 12 Aug 2026 13:38:47 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9AG-0000000GIxO-3v9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:38:45 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c01c79467so217781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541918; cv=none;
        d=google.com; s=arc-20260327;
        b=S4LWnC6pvl1eYo9PyeB+M7GnZz6bSqWb7RLkpPkdGqBQseSl60ueokN42ABOBisM9K
         kJSAvZBdi+9F9IJjidQzJV7cd5rTIRvyCkVf0N2Q39WkQWT3pBk+XU4H/23MFjgeJMY3
         FV3L8FTW5IkSuwYX4u/gO4T1l6npxAePd4IQ7Qs3Dl/UGttne8WYwg/CBNBqYXSCCGIp
         X5ERPznNK8PaUcGGZFAOIUB4qTfQqmnrIjDrig60Nm9u6CCzLj7HhAIT8dSBBKKiIa+U
         qO1cmbinsPSh8uz7VRbfOWeBHlsqjwpiYAhlyBQrTqPx6Em+C7N8I+1KaH+/7VfycOVP
         NsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=huenUMl5uc0M2LnoWQjZXPUhYAeUlpsSxjwMFpT+H8c=;
        fh=ts1gTy3L7Wg8kkQJZhKlGwq5WuCJuCWfnsZMU5igCog=;
        b=cneGIawFquI+9jLu8/talppuQ9DrmM6ff75mIDizdpr3l2cEK5RX7L84Zd255L8DtR
         Zbkhydvg82MTCkhla2XYS4sUFRlauit75JblKHkKr6fIABNmxCeWNVX7zBVfya31KAFe
         Uk/H1vNXafSIPtm216CGj/Y99JhBW8ZqRWK6d+p1HFibHYcAg46d2kM6A2pwTtGY9m06
         WycrH1mPivXz3lfh/PZVmRV1YyG+uk80gnLSR+u8loSaTm4gMOSZ0of7Ohw/Rba/HoJk
         g6gWtF0mmDtpGtLoZtHCxRViW0RPmHATumHSgfDHPfZEQul94z8IJQzZSbwRgA6RePvp
         T0AQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541918; x=1787146718; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huenUMl5uc0M2LnoWQjZXPUhYAeUlpsSxjwMFpT+H8c=;
        b=EbwhBetWbDZ5LLF+YYvvLZ0Y946IimZCb6AYCHWmLU/Kp7xiTd72m5Xfh3PU+2uEtT
         PUlll3ErY7bZCUJT0NM5WTPqLudeHC6RQoZ94wXZqYFc08koicaTWtRb6WBrejSofdZH
         2sjphIh95n5molsYL7szc34nuMZlv3CjLakkwOIAZUsm7oeSuxhwfyz50kz/+fJZvALe
         49doLa1hphDqts58tCMW6+KM1i57CQkjKNu5JcN4akBWrX0tCRJiP7+FLDSRTUl35jpD
         Sqf4u0xYQqefXITgfTJOhw7SwVk9Firfwf0Xp3HgH8R8AdYigZD4RtHWQKqGBioU2aAR
         2fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541918; x=1787146718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huenUMl5uc0M2LnoWQjZXPUhYAeUlpsSxjwMFpT+H8c=;
        b=bvwWsAtnP0zeWv2ZpsmGtas0sHVrniFnfjCwwUJhE0pgMxwfoDeTsFRf7l0uhSAmOd
         Vev4zR6MmxvWQjvfHyf8g0LNjmiWSYWKhvpum1voNIlAt93DikxhKaOmbIoT2msk9+WB
         s5wp2rUw99HXAKVHdeO0DYLZbuokV7X5qLobmCNGMVNXuTwvfjLfUN58OFzFWXa2uTgu
         sr1iNoHl8Jx8K1gHVWG2zRUXcY1IyWiYgXqbbPW/Ccoq3d6t10Cb2iYZLaYGA8p7j7ks
         lywIHDVw+qz2w4yZL04/AKajZv90DyDe3FtNk2U6iEZCeDObEzZP0pFAn2VTEbFwoou8
         LHVA==
X-Forwarded-Encrypted: i=1; AHgh+RpRbhroauDVQwwIkFx6GMzXEgT+LBu3rxT+Olg0qi63TRoQ3nl+59bGJYtKVi4ZVFKsAsfFv9+mVNiRzwXuhfH9@lists.infradead.org
X-Gm-Message-State: AOJu0YxWResWiNxT6zdF0fW+EFaiWJtEANIcIvPwqvKkUbhzhUtEwqwK
	jxbQMuQQ3fGXOSYhPzwtYI3o1u7k3PVu7r05jBbN1sSAi4LWdpR4PqD4Nl8D/BP4ELVR4B5pJdK
	EE4htlMF0fv8w2fyTBsbNNOxa3208rX6zyyIyqBiB
X-Gm-Gg: AR+sD10Wot4Bo9il95ZCK0lPKq+XUcG7bS8aQ+sJfIhjFbQuXcwXuanWwNcCya1/MVi
	O0jOOZSaCRNvUQmjdz8dcohMz0gIvYRii/grUbbX4b5fbP9lHWJfTZ4dPxh2kLaIP8LRlsqzewh
	DkZIH9zyvXznbDazGzLU9CEgrhULVNScPV0ctCG2somR8h0+9pDfDoqJXGT9XwwI9MAd4geJWA5
	hR/U7yI0AKZkAmQ1ayMy1aAu3dkY9azpLEuWwlxGYWp4ZDsaq3v3uiUi3g1+OqZ9Fza0YITUttu
	6+ULs2bAcnxSa7xgDMztHXJF515cPCYomEzrVLR9qP/3dw==
X-Received: by 2002:a05:622a:1e17:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52d61fa3c57mr18485041cf.12.1786541917310; Wed, 12 Aug 2026
 06:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck>
In-Reply-To: <anwuYYxLFbtDmmHx@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Aug 2026 06:38:24 -0700
X-Gm-Features: AUfX_mzhVvdWEb4aciWXtp2N8iHPEM1EXkzAp_fI5yNdeyk-XCZ5nCpn7hjB-nM
Message-ID: <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Will Deacon <will@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_063841_024528_3F779D1B 
X-CRM114-Status: GOOD (  17.83  )
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

On Wed, Aug 12, 2026 at 1:27=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > This patch series adds an uncore Performance Monitoring Unit (PMU) driv=
er
> > for Broadcom AXI system and VideoCore VPU performance monitors found on
> > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through 5).
>
> Why are you sending four versions of this patch series, at -rc7, each in
> reply to the previous one? Nobody is going to review that.

See the cover letter for changes. They address the sashiko reviews,
you may not see these reviews as they are only sent to me and
linux-perf-users, which is somewhat customary in the sashiko setup.

I don't see any relevance in rc7, I'm just mailing out a new driver
now that I have the opportunity to look at it. Whether and when it
gets pulled upstream is up to a maintainer. Another useful series to
pull would be (imo):
https://lore.kernel.org/linux-perf-users/20260101-apple-cpmu-v10-0-48812c52=
9ffc@gmail.com/

The changes are sent in reply to each other because the entire series
is visible in one mailbox (b4 mbox), which I find easier to work with
and provides me better context. Others use semcode to do something
similar, but I've not explored that.

Let me know if I should drop you from the cc, I placed you there as
Mark and you were the only suggested reviewers from
scripts/get_maintainer.pl but I don't want to spam uninterested
people.

Thanks,
Ian

