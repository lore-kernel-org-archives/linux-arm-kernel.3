Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69186CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 04:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhV9qe8NnkOAhcf9GLA4lJjKhlbR453vMJfTKBEP8Uo=; b=hXDApBNkp1ADymEcjkWWpQG8zJ
	0772OoerSB6qlPBary4HzaTh25E5C+88Zbsfwi+Xr76q/a+CCtDN2958tOOrt8XdqLyxZiOwhCb9b
	SaGBERg5jEpZgZhjtRxXgRufT6AN0oU6bHb1NdzDq+Coi358mFoXhI1gVwAHps8hFN9SwisLCeulS
	leN2pHc4WgPF6ETkCm/+b0htCE34gPCpdV9e8ZtFy9BzfPCfWpTIIanMFPkLNC4HpIUjZiG7Ek1sf
	PuSrB66CnhSE8tJznwylCip4uFoKB95oezjsUn7iTl8le3g8FyrmyAWJbnYOENcktPPxrQ/WR2Pha
	cka+B6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB1J-00000006nZq-0uC0;
	Wed, 10 Jun 2026 04:58:29 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXB1G-00000006nZV-3357
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 04:58:28 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8ce3876a50cso64124776d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 21:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781067505; cv=none;
        d=google.com; s=arc-20240605;
        b=Rz4UqO0xfd+Gd0PX5jIuRCiC4xgAvc9zViMJSS63A+Jd9gbMt8E1VIL5oH5QNd884N
         tO2YwnomGRdTnyc9nCWG1Bt1x1KCT3eoeTk3IT2k9fC5qC7nbrJhfRZ0qPZHnJgk6fLm
         GdCjeCXouPU2PJNKkxoAVF1OKyfeTGZUD7uKi81LQD4VDRs64TTQlc4gG/Ph6LQ+fZFb
         OMLhUJ5vrRaX5MR46SGEZ9iLDj8PgwvSB39Vk4pcNEOX6Prp9Ca4Vsv2zkaYMWguAtFK
         Eb3mTUna7zloST9xdkg1oIaPXk7NbJq98yTWW+Xw2MHMWbmMgvQGUJE4pIz8NzFb7O1n
         puqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VhV9qe8NnkOAhcf9GLA4lJjKhlbR453vMJfTKBEP8Uo=;
        fh=H3ysEi/3fA39y5B39YERkwhUPGvB7G0bCnSVHrdYQVQ=;
        b=ZHnW++KXgW9yn7Z19yUdtVa/UXSFLZiZXAEPTqUSdihbinw7euh5zuumOvSuGGwjgC
         ddb3jFK9+pBAoM8IM+QDRkczkbRz7iLCm56jTdRJRDbZkHxOzzHj2MEPK5brZOdsRxAh
         ozuxjHU68R3AMrgHirqMpG8ijC5ShRdWKXZdo7DcBPW5RF5xW607pbJY2c4ihJfUBkWK
         fEPkCC7zrQ64h//5ekimCyfkM1Uysfd5rhlCNC0Oq/9idTLtGAzFSOpMLQn/Pc1jTNzT
         gber46uIFSXA57Ou4GQTBnGIJm29A141TMZvwDF+ZGywXunZqKmLw7u1i5eaXG1D3nW4
         x8tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781067505; x=1781672305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhV9qe8NnkOAhcf9GLA4lJjKhlbR453vMJfTKBEP8Uo=;
        b=f0BUKI9GzEw44oDQg3/QO7m2/pYJRmV0HOt2aVIfhX0XOPn8YtwC4WZqvT8l7wDtzB
         +BHYp/q61TeDQKbUk8f/fEBrT8eBMdoJe9CpZdv+z992n8od/bJEId3YgE6riI6+RrwQ
         OquhFOs+YQP3iM+0fJ7qSnhI3TkJrB0XP9f2HT35aGILL0TzGvb0oSqH+a/5k2F3RrNL
         zvVViPegIrdQvI8Qz5/5aWGGI3PSPUsLzmXItlvtgXtM/kKcApxpXHmcIXxkxtcrkjAs
         wg4DUy4l4XUTYM9nxGGY4MF/AE4GcySbwqzdt6fY6UHIczRDvpHzORxBLSTnoE1wBxhj
         /L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781067505; x=1781672305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhV9qe8NnkOAhcf9GLA4lJjKhlbR453vMJfTKBEP8Uo=;
        b=CDK2Q/CczGpv6EdXS7JhqXPUJDVJVgyaIKnwkHQ9zKo6C3Pwr2cNjxnXPxApSX8J74
         vN7FjQATWnJuj5WLtRLfWaRN3T47klmVGJjz6MZt4sfFg463xwgxeldYo/J4NH1QA7Rz
         rFM3knIDcMh+e2dgra26jrk23uTrcol3945wIXhTAjailyEfzD9pZ+/gS+4pguyc5pGm
         A/KG18QFy35kOrZmPBsZcnQGxdl6MQ3P6GeXLfpDC+1V3f3hv2g+HIXYP1rMBAoDuA+Q
         KuCuYy+JovMeqs/MH0kqtF+WnKgKUpvMq96O3jNIgZICh8hEdM0jVd04fExlshbPJmTB
         3ARQ==
X-Gm-Message-State: AOJu0Yw81Xm7GG38yRNueaMz7SQBN3dvTTdO3hjCAP48J2ddhCXsaOWY
	/GuJxdDktwxd28ut+GYUnb1AeixeKuLJNWNu/X2L35l0vYoDBTBw7L/uhhjqeXdWHb1qL0MGG6H
	M7H30LqX0WUWveyyP1mwsByiDLyIKnraJ7s8P
X-Gm-Gg: Acq92OE+l2GBjL60O9wcU5xOMtZYzMGrWTMgiAYGpp1mnM0g4WE2twXbu+7wiBcRqfV
	PYulrY+FAt9KrcLEBDtEQqsWKmqKZkpn0udYbcoeXLyyGqillYw6Pi2TzSQluKgbZQI4eDJ4Bha
	TAxznie6BeB9t+rA4haYLa4YNPbv+jl2Iym0CKdXKCd1uJ+lXSU/Q/RKNEwLJRroHoVWYk7YTrE
	2ZbJ/tfp7d9f3mUOrWW9i74mxH7iXebIkGb9XivMr9OTZMKVgnZfZRkWPUSdUCWIdUjJ0j3XiQs
	/PbsHxWzeTbZL4ok8pDkMKCpz9TDa67sLBCsYCTtGm6LZ+Olsq3TxsePG8165DjaNJhHAxOQYff
	qWZ4=
X-Received: by 2002:a05:6214:54c7:b0:8cc:e14:9594 with SMTP id
 6a1803df08f44-8cee6268478mr347436126d6.33.1781067505455; Tue, 09 Jun 2026
 21:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260518024051.189979-1-enelsonmoore@gmail.com> <CAD++jLmiFqOZCL6OxZB2g0k7dY5=XTNMmz2p7BfEhPdgWk=X4Q@mail.gmail.com>
In-Reply-To: <CAD++jLmiFqOZCL6OxZB2g0k7dY5=XTNMmz2p7BfEhPdgWk=X4Q@mail.gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 9 Jun 2026 21:58:14 -0700
X-Gm-Features: AVVi8Cc3CkfApccdGqRnLGgiQw6fbKPkfTlc8S1Q1uHiZyQkLFNQmPhvJeBIKpo
Message-ID: <CADkSEUg72cn7jG5vGc-M82h5hPhuZ-AHgazGfthDrivWKNC=Jg@mail.gmail.com>
Subject: Re: [PATCH] ARM: remove the last few uses of do_bad_IRQ()
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_215826_804318_45AA77A2 
X-CRM114-Status: GOOD (  10.88  )
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

Hi, Linus,

On Mon, May 25, 2026 at 1:20=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
> Please send this patch to the SoC tree (soc@kernel.org) after review
> so the SoC maintainers can apply it.
Done. Thanks for letting me know that I should do this.

Ethan

