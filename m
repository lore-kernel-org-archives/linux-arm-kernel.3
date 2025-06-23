Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48CFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGLolw1OHDgzRQRSVHu6bP4bOR6UGr5oa1nQhRO9Iaw=; b=qXGJvlUeo8xIvduBh3E0X9imIS
	5W9+StoJZYF7qKdvZZaOrTbtV72vc0JskYt/4e7n/WWu1dBwcgkBrP/XqMG3ZdT9LW8ZIRg7uCEps
	YEIOe1Ubp2esrjWW295rxGY9IWdF3PRkspnFBpVkYSm6uvMfX4qdZ3WAKxkrJ3txkWUR0W3fwvsoT
	50QhFNr3e8dPPtEMN0ovXACPI2x7XvtXNR0DHrTJ4JgmuVcqv1wT9bfZkvB4QNxAIBHie2xKQLU/D
	3Nh1SrBFPeOfB9G6sqDOgTjGSvcRqqSwgr2y9ZVdZsNIMvTKfyQSGptBAh3pFVXVyd5ssYAbL1Hjk
	jtVjicMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo8w-00000003xTx-1rJv;
	Mon, 23 Jun 2025 20:51:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTik1-000000039yd-2qyT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF48361360
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 15:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766B8C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750691148;
	bh=BGLolw1OHDgzRQRSVHu6bP4bOR6UGr5oa1nQhRO9Iaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OTrAWlXEqER8s3fC4Du+FufM0rb+0d3QzuwEPOc4CJXzSfmjasZZ0ZsHWFO0/AwQ7
	 FrD9jn3Os70jLcwO5aKeSHj/NptmgTU3xti52bRB3i87HIz40JN5NOPfaabNtcvPGO
	 dnQiuT04RZGtmk6+j++4ofRjOHbxdM5nS/36PTBReW3K3eY81Hr9cak63vuV9rKvi6
	 x8yEWO9STV4Iq3thvAPbMVb1Kn0jesEjSjJWORdp5ZTYX9/kFB0VA61JPaqrNtC/TO
	 /CGHkgJajmn94S+iZC1XjDXeF643pJX2DecLrk0BTQpIrCyF0c4jTsZ3igwgnn3ZdY
	 NFq0RntRhHmWg==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad891bb0957so791620366b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWt7jT5unhBV3cSNpGbZRfg3slUOxpmUbGUZXT39TrOYG7CWPAJan9lvb8sdGR82GVd73OuQuPIdxYeol99UE8g@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzs+Smt+g7SL+P6efBvrbvSFNh1frHpVn4QtlML7bSAmdL3jNB
	ofZfhj4kNlJi/6KXThH8E4eKOAdA7bOCAndrWnv6vpaPodg2OVT3N3Y9yjpGxQ+7RL9M3vL0xPd
	hhV9EInl34Vad+yDyGKdgxId9Ahm7Tg==
X-Google-Smtp-Source: AGHT+IG9p6Zu6Fd7+Bcgke2KZ+yJ3wzAadO6WtoYXMwwtd3LyCC7cV0CYf90lekWfovyEwjPUV+MirJCAoH2Y7zt/0k=
X-Received: by 2002:a17:906:9c82:b0:ad8:93c0:27a5 with SMTP id
 a640c23a62f3a-ae05792716emr1179556166b.5.1750691147064; Mon, 23 Jun 2025
 08:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com>
In-Reply-To: <20250613130356.8080-1-james.morse@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 10:05:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
X-Gm-Features: Ac12FXwzawAJxW0H6SL7NFHDsYDzMvsMRRXGyNtOlEIdLWJc6ed_7vQOPGHyLBs
Message-ID: <CAL_JsqKD7yOxSnfnah2gE0EodtQ4KyJ2_qXmMu2oK9i6numzwA@mail.gmail.com>
Subject: Re: [PATCH 0/5] cacheinfo: Set cache 'id' based on DT data
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 13, 2025 at 8:04=E2=80=AFAM James Morse <james.morse@arm.com> w=
rote:
>
> This series adds support for cache-ids to device-tree systems.
> These values are exposed to user-space via
> /sys/devices/system/cpu/cpuX/cache/indexY/id
> and are used to identify caches and their associated CPUs by kernel inter=
faces
> such as resctrl.
>
> Resctrl anticipates cache-ids are unique for a given cache level, but may
> be sparse. See Documentation/filesystems/resctrl.rst's "Cache IDs" sectio=
n.
>
> Another user is PCIe's cache-steering hints, where an id provided by the
> hardware would be needed. Today this expects a platform specific ACPI hoo=
k
> the program that value into the PCIe root port registers. If DT platforms
> are ever supported, it will likely need a kernel driver to convert the
> user-space cache-id to whatever hardware value is needed.
>
> Rob H previously preferred to generate a cache-id from the information DT
> already has. (Rob: does the PCIe cache-steering use-case change this?)

I don't think so because who knows what values the PCI root port
needs. It's never going to be the cache id directly since that is per
level. So we'd need some sort of mapping. That's going to be something
like this:

Userspace level+id -> DT cache node -> PCI RP value

So the first translation is the same as you have here. The 2nd
translation might be something we put in DT or could be in PCI host
bridge driver.

Rob

