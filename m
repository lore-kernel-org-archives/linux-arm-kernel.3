Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94A2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oi2XJsVVO+vc7c1/zrjvYVUavZv1Bhhh2/RTVMd7WoQ=; b=Nm3CJF5JnW+h1kGQpn5trbPQZ2
	qoSb+FeWRiDFzqaLeVARisac9xx7t2t15jHL959dCb/ZEudhl1ztUYKTKRfN2MkLFJoJoDHXxp3uv
	rsLeF2gH+f/Vq6tdBmT+agikX0lmF4JXPsWARZZg1+8jK+70HkiCrK73YJHaRLy6DIJW5zJ7KwRxZ
	86UozKBgd1GKnja2r51Guj3U11l5oC8e4tffpdk2+DAJhJyJPkiLDhk4qZD8GJeWMFB+/m9izfNzz
	YXyi6Hk0su2Ca/3myYqbRBFTwYytMy71/uvieC475DJqJf9Oi0FwcWwKCrWBNVg6QUUmeh8pCHUT4
	Is2mjFNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyetI-0000000HX4A-4BlK;
	Tue, 25 Aug 2026 00:19:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyetG-0000000HX2k-1JSs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 00:19:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c2074710751so755759166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787617184; cv=none;
        d=google.com; s=arc-20260327;
        b=lHagxKXhsST1csDVQJb8nan/Tw/hEgov4QmWAyWS8bn2uxRH1Hr5wwvWWFS7I9NBa+
         KwCnHdwCiors322QcWJdiivNNR0IvkYDhqcCSMVUfPv2lEdDOWo6/mIXP7aeqpqA4hAz
         6tlUO0DUgjOvH1Y8xgmTbbs7Nr47FSK0MTEAQTnMKqk2MFcBH93f/9Z4y0e4TuUrFsgw
         ynUV/eVncwiLZPj1Prq5WM0b/C1gcFD4jIpPpAQBOwzPvvBVxuT7e78zMx9WQxCXGFEd
         /Fpvq2qhzI6tozCFTyTZM2/Ae2xptN7pH9TFHASP2cdjayYRKFEqx/ueGDPjrbVWwroN
         OQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oi2XJsVVO+vc7c1/zrjvYVUavZv1Bhhh2/RTVMd7WoQ=;
        fh=SjS4cGIbvm7cvz22BG6P1JUGdNZttW7Ik9LxX4cM8Oc=;
        b=G+FB73+3bn1Ix1GdEmfJauiQ13ZC7f43e6t4bEXgKPH5o6osEzEXhKUhS55lHz+lBX
         NfpvMVQPZeTwT1y0Wd58ZvTv8mjMCNpNbkKvIstKNXEyXz6bOrDe1M5AFoHUcmX17wJJ
         ZDbGqOhGgud34FjCkBgl6Dn21DHiHgrZ0/T7QUzC0l1ZnGkmWi2P+UxcIjM1ZBYWJ1XK
         y/5qavtZjW6Hme15PEHntuS58rufNd82nQoNOiNeTWIKliurOmUIXlz/vHzICVJDFjro
         jyDDG/xWcmndfeOTv+9W6FLvVutT28p+IESBKWNVdGAKckFCzQyB84k3iymtF5RnjpLO
         sS6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787617184; x=1788221984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oi2XJsVVO+vc7c1/zrjvYVUavZv1Bhhh2/RTVMd7WoQ=;
        b=d286gmT+9oQFkSKxEyZ6LTTsElGfdoT2uYmHjLOwhhjGsJYR8KAVy2hUlicifUIeYj
         g6U6OkN9ts3+hjluyuufCJCAvB9FUEttQpdLfWjf/Ama+cDCmlE3/V717IEEEBu5PJID
         EGtD2QDJUAcwpg0tS7hinppkVXZOFAHhsyzMh1LiFjP+9qBP8/X9nDrhgkKvFzyDjwqx
         VMvBV26TSIJQfkKriczX5yJY106sPZV5uwkkJiLiN1Ap/Yk0esaTP3EvV4EObkPsVKkJ
         F0hhUm51YI1FJwZEFXHU4Pb0R0vyePin3twUaZD8Bu5VawtgvmATv+RLb/JNkVuljr8a
         Y8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617184; x=1788221984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oi2XJsVVO+vc7c1/zrjvYVUavZv1Bhhh2/RTVMd7WoQ=;
        b=l3/NE01ZU8oJSfzW3VNH7sCjmcqiiB0M9CBwcXJj7i08MvdV3B5hrhl5KdHJ1Iqzcg
         w6EWAj2HPdVotQOSQE4gNHmAHZBeWpwFbPhSrspUOK/HiRLzrrJeaJuJuvwnaMVIAlRS
         EednBG2HcYADcUtg4iI6fnfb1ccPbT72aidHAUiJOpOChaqNNvxQcofowBTBA7dFS0h4
         Ar1B9ho+lAvZdV9p5IJEuoVk1Vro7n/VGoudQkclfBXH/cYBDZa9cnOCnyVlGj+EN7Uj
         vKG3XqFRu8TWXhW3g+UIzDxQzELwEVRGG7AITB1z+VeZY8y59tQf7lZExFvsceunyN1N
         iuLA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6efa+DtMPIp/PDJKFxb3nQep10PdnHlnmFs4aJG/n2sh3RuR1set1KfsFAnqXjBfnJb+6z9OuUIHCKvU1JtQI@lists.infradead.org
X-Gm-Message-State: AFuF++lg7FzZAI7RJVSP9CBQTgXO5KDnDWcz3UBmNJGqLbrxlTceI3Jj
	K53iRS/1cBtww4LfamWYp3AAYjuQyUyUwuvQ6+hF5vblIeBJrwtVAeHl7xU35G18xarNr+a9WbJ
	Iff3lN8+p/67xiY98bmnrqU+7wjwCk+pt10a2w5WB
X-Gm-Gg: AR+sD13fAWY1OpxHYg+NzoUZH1o8y4EivyQTAkMRUuB4n2ap15zsfad7HSMlxbTYPJb
	ejVqvXxTHntYmqLeJLFhYP3Pzwof96kDaA88SWKuL46nOgjGylFzIdqaV7YVrG6m1eVBl8P9Bnk
	O6gR39xEGxtRsXvxZKMuyxe0U0yD2ZP0g3D/qfJbK8lycNTwlwWPF/FWtpqJS5H+GdScfm4ARFp
	l/Ch74t8xXLz24xMi5PItGchN7lOJwe8bGMGT4jmzSgZ1gkiqJI1ATM3tuH2LQVkTIyYdFjRjZZ
	oY2SfsS+k1P3LfUQY7ouFYI9jXd5a8Tn9/RSCRWyMdLGpq6190xT1IcN4nquG/FDQp0f7cHEfoU
	5A1zw43IzSlysZiqEfzPen6TcCzba8xoy675zU81bgzNvTF6DtstB/SZXAy8KOYJthwYKBqdltP
	tgweu9iutn6gjv
X-Received: by 2002:a17:906:478d:b0:c20:31d1:a89f with SMTP id
 a640c23a62f3a-c24921149camr2175651466b.24.1787617183877; Mon, 24 Aug 2026
 17:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-4-jthoughton@google.com> <aoRnHjaQ9Y61OB5Q@arm.com>
In-Reply-To: <aoRnHjaQ9Y61OB5Q@arm.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 24 Aug 2026 17:19:06 -0700
X-Gm-Features: AcwNN1UQZKYyQWHzZvf5pN87Sz8ZppUU1k5HLeGcPZGcMuCryj8aeaANnsSFHi8
Message-ID: <CADrL8HXGZxkOhz5QVNzvJhh98akCzrGJd6sC_Nj07CMCXCJUSw@mail.gmail.com>
Subject: Re: [PATCH 03/18] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_171946_365047_850B5FD9 
X-CRM114-Status: GOOD (  10.49  )
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

On Tue, Aug 18, 2026 at 7:07=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Wed, Jul 08, 2026 at 03:11:13AM +0000, James Houghton wrote:
> > +static const int VMEMMAP_REMAP_INCOMPLETE =3D 1;
>
> Nitpick: I get it's all within a file but a static const int feels a bit
> weird. I'd use an enum or #define.=3D

Fixed now, thanks.

