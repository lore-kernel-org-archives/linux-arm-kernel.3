Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7B3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRiRpdixJFrcmqSfsDGBuoh5lIec3C8LN8yr92Ku6F8=; b=hgh3Ugmzn9WYCfs/TxwBqmtBvr
	G8j1UeEY2tiQEsQJAZtgJTXwWO87cDSyzDJDWPJfkUAlCBS0qH9PGLEPxwDBH3DG9+anq+0eiYRNP
	dGLpjFzPtugAOwGAUCHucUl8J8xgh2ARQ39ppTSDovbRdBBk5kZLSsOQlEPg7qDsOKO7TkU7GQOl6
	SstqnT2zUuZP9yDryw7RsFwa7FhRmdzhUZvwNy9lc/p2j+6hrUW637XVO6BewYmtaoHZPQgwNCr0t
	YTIuqkLcNY/7oeE/NBvnHCSDqHt6526aBciQVndNwA+yj1u2x8K/0y73lFtMEoTXoA4IckR5F4i/v
	JXpysYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH08-00000004UZU-0rGH;
	Wed, 27 May 2026 16:21:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH06-00000004UYe-1XXn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:20:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso254a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 09:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898855; cv=none;
        d=google.com; s=arc-20240605;
        b=jgDvVOw8O5OtrMFnM8Uxd6CzJc2d7y0Wb8mf1zWY35xxrBFBsZtuu8lf6wKQ1dBHT5
         2IUeo1/vBiw6xQDD46EXPyj005bkgUPh4iyYSmyWbLvhoUy5g3yQrdlmKT1HrFKyRnSC
         38tNuN0X5oHrEzDCJD1JS5R8HWlUgeks5U178Ni+DQIPbG0oK7tSleCbTnVrzHzWNQG7
         3qDqzdxT56YG8GxLkeB6tWyn6XdF8+YoZA5Bj//Dc/PJrwYLq6G75mrfw8rQuIgL1Zem
         UAAx4/H/xQTJ7eaCoY/4wNQ5AWwnECh5VzLL8VjwjT/U3ir0Y1zq1Uyf64Oo1nq7PyOn
         8zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BRiRpdixJFrcmqSfsDGBuoh5lIec3C8LN8yr92Ku6F8=;
        fh=0nrcboQ3YcMego7ET2zfU0vunNHfKzia5kpgAlZMbnw=;
        b=a2mMHos4Xt/iAb6LSz998CBqt1ABYae3bgq9mi5f+ae3DeaeDcf78AAVHNFvWnTY8c
         u7N5PUbR4ZF5sFioC3aHFrBA2NGN48RPJSOwHkBG5h5nFXkkJO1xFk+PcG0C6O3Br6av
         MHf7Fh9tgkZUbV6ny7CnOcJIXKPuC1j2y6wJJ5DwGleg048J2Clr6QlrwPbBPl8P727m
         KrXkwJMcSBWbGDVCow3Iy+4KqI0eFhMpYgaX45Cicgh6lXofGjcBKkSaW2tQ0k5RDSgF
         KGnbqjVpDSzetqmF8mW+WpwLqRHKq1HRSzh3laQOYfkQ2pHqlnmGT098c2B9YOrbChcR
         xdEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779898855; x=1780503655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRiRpdixJFrcmqSfsDGBuoh5lIec3C8LN8yr92Ku6F8=;
        b=usc6JzuuOxfeEsKu47K8Oiznts1W1GeOBx5xNyBpNqyv45mdSZtI36Rvm7w+LLN6bp
         xIYmLauIAFILlAf4tpi1JSIvUBVaMrwBX3Vv1VZJTuCFnTTznRVcE11QZB/uUe1KT64U
         /+1gttfQ+4CGYsgaGHo2CULK85TUDbNJr+1GjqFkjHYz3VZre7OgA4ydhjaEoHTaInEr
         m34cXJeBZByRqWLaPmBF/zCOfsWtJI4k4OumZzeDFVkoSxZpKTj6dmbGrG3FDPB0mFVm
         6Ta4sbUBkuo1HnlOy8ZLKG4ZwVgUgRd7XJ8Ve/zFeLkHKctBokV9qNqNoWM/CANyJ1B7
         yDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898855; x=1780503655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BRiRpdixJFrcmqSfsDGBuoh5lIec3C8LN8yr92Ku6F8=;
        b=qPx+yHAQYRFW8/nTPcMp6xh8e9Tb3FsMwNUJzCdpPy6oUrltytMNzFNYY9DfOrUvMe
         TPd+Vjlyuk4CSYwSlgWE3Zh53L55tg427daOd3KS6/nmK0gVLiomlh6uYYM88lCt2+gM
         /yI9mr7R6jPwIKFx2VncweFa6vZBSK/uTYhiHHLYAen788HTX4gKosnRtaZMVwOLekRS
         p0XzPsh1VqQMIWnjEfKcht3oB3e6tpzi9L3Ky8BXIw6/8Mw3rj9Fqc8/+iwkgTbGiiwv
         zs/AUPy+xdS/1nyyx8CGQNPmBJAHIEEgdpr9Mq/SDwnuXV00Bbt2/TL4eGRuOF4Cmula
         Ieqg==
X-Forwarded-Encrypted: i=1; AFNElJ/FqMs44KEaS4DVKxzNEsFPxPcnU9S63v0XCv7GmE0R54xu+ne92XU5LCqYs8M02FBiS7qZrR/6PQp+3euyhjTa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6+fnXccAJH1WZurr+1d35fkodkMD7zVX/p3q0TSkrR3jLk+cV
	AqS1EZF3kRDEz4LFdO2AsSPHg+P8+ZYeKTJoakc3N6v8yY9gfdb+Wzl5+VybTMJ8ABFXeV3Y+Ar
	qZBhPdE6HDsOA28SLLpfOEPhuM3MFwknOM+k1Sloa
X-Gm-Gg: Acq92OHZIB77LBIF6uCWIUGHcwblHGwd5KeRUdZct5I7eAkVlhCNVFPC1OXxFK2W9rY
	VONujeK2BKzD4D5nUDjWqtlwrhvtd2X2pXvz8ApyFyPIA91VC4W4oBPnwtGqXaQOb5c+frlTt5I
	fqPvruID4J6T6hejPAZhNKwlQCpJWq84vUxVBi+SgdMgBl30SI+K3l6sgylkz7Bg149BzXrkek0
	N7GmEFD8D/PuzyPjb/MW+Nxs2bRrEcVzygXnQ3K5tf/KWS1fYli+RTANiHA6Iw93vNio1lkHaEH
	JzhRkO+LCtIiH6qBC4pqLt5Ws4oqZFVfF/b/LjKIY2KVn2c=
X-Received: by 2002:a05:6402:a218:10b0:670:9e9f:1a5e with SMTP id
 4fb4d7f45d1cf-688fd0d59f2mr196269a12.2.1779898854707; Wed, 27 May 2026
 09:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
 <20260527035607.14919-2-xueyuan.chen21@gmail.com> <4e0696ee-895c-486d-aacc-71146f0e9047@intel.com>
In-Reply-To: <4e0696ee-895c-486d-aacc-71146f0e9047@intel.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 27 May 2026 18:20:18 +0200
X-Gm-Features: AVHnY4LJMjA4I-4MPpoRWm5AfgyrLNpqa8PcyRvaif8KE5wTh-FmbgALVAeR1iw
Message-ID: <CAG48ez2qj+QkLZvvi+6S78_v4Zk2eZBnBx6TozwgG4payOqPLg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: make persistent huge zero folio read-only
To: Dave Hansen <dave.hansen@intel.com>
Cc: Xueyuan chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	david@kernel.org, ljs@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, yang@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_092058_422575_E9791482 
X-CRM114-Status: GOOD (  13.33  )
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

On Wed, May 27, 2026 at 5:55=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
> On 5/26/26 20:56, Xueyuan chen wrote:
> > +config READONLY_HUGE_ZERO_FOLIO
> > +     bool "Map the huge zero folio read-only in the direct map"
> > +     depends on PERSISTENT_HUGE_ZERO_FOLIO
> > +     depends on ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
> > +     help
> > +       The persistent huge zero folio is shared globally, and nothing
> > +       should ever change its contents after initialization.
> > +
> > +       When supported, mark the folio read-only in the direct map so s=
uch
> > +       writes trigger a fault instead of silently corrupting the zero =
contents.
> > +
> > +       If the permission change is not supported, the kernel keeps usi=
ng
> > +       the writable persistent huge zero folio.
>
> I vote for no Kconfig options here. Why? This adds "security" with
> _basically_ no extra runtime cost. The runtime cost is, what, usually
> one kernel TLB invalidation during boot?

Plus potentially a bit more TLB pressure from losing a huge PUD in the
linear map, IDK how much we care about that.

