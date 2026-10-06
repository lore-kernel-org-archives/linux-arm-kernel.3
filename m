Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58B4CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=; b=OzWNQcVQuano6h5ANgYSwvqWPE
	KPc4z+345bvuI7Eo57Hz661Wj1DRIdevuzSa61hE+CYG15hAPkvIzpz5kMxMMv22SqmyHxJ0IeRXr
	053L0h11Vj4/OfTz1CyMJQ5JFeoAMNiNsh7IzRmiFIB9MsXWtdti6v4IbBjGlfma65F/7g9Q5qs7Z
	SmLqzYuao8a3m/O/xxuoz92E210sjY+jeM7RttObuEtH5YXhejw6/YM3q7x4dxhEIsUgRelQvZw4r
	ypVyZAgvQtZI3QU7h2ymlxuLTQQOhS3C+xaaGWDh5a2XByVV0Ez+hqbN6I4RYvwe8sAmi+Im+s11o
	dUDBBLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwq1-000000001Cd-3afJ;
	Tue, 06 Oct 2026 04:31:37 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwpz-000000001Bx-2x4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:31:36 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-988c94f1c07so1418040241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 21:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261094; cv=none;
        d=google.com; s=arc-20260327;
        b=kVUSWOB1nUSa9bgcvlILnfKX7AJfr5nZ1oPTtie23LpvsuGnLFKg5TkxhTP7fzeuOe
         9T5GBALdx+Znb7J+1KEALavUPN9JmpwLMPyCBuyfIGI+gy1M1KgthhrQCuVi7FaZkbFS
         XVYuztVhr17q9FliPe+rHoG5ajs3zTO+uJrkT9FU5VO6pF8MpwiBqX8oiX8hMkzOEs/H
         OmM0gQa1B981hLOYvj5ibSd2cIJYbkvg1ourqwaYoyuQLodQLcNOHmbelR7MVX8WROYu
         Vdb+isFNT30gwMfX8OIzbKieCvXbSMyHA4hIWD8CjqKpLZob7chWhemp3PTCjRjLIpyQ
         i0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        fh=dlr1lMtMe6AoNyQ+GOXkoG9IcDvVgLH9wB0CE+GSVHo=;
        b=rZUZz2BWzM/9UHTcISAOBeOFJISRPdsaF3JQj9jsMpo+TsYdknoH9SySoN+yHuWblx
         aU6PQQwVjCpLZZzqInGAI5hS5Tjja09iKz+THFIOh4H7hWtGGcoWU7bZsLc1VbyOi7L8
         SJ8nkebu+mCvgzjgOSQu5oqxx3KsG9I202GDcNrRom+rl1J2PAq8H7tlAMH02ErjFHjg
         0+EqH/x3CASbDYgphdNz3frkTSgHdS8eJLuyutWLFk/LGjFLV9qf9Z8moeJv+m4A0GQ5
         XyP7x2H4ZFUcQFFEmDOtn5LL0oVh5FMKAtZili0UcpLXUt77S2sce1VNbdiRFjY4w7tU
         U3EQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261094; x=1791865894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        b=W2VS80arkmF4SaHKMPg/DMcNm1Cpisf7PqjyrJBYDZzaJ0tKKk7NXSJcGCs+6k1PEc
         H8ipBNpDjT8+TItRNHfb4sMy1uXga0EgdRUFahPMLmpNNrvORS7hNsx6VbaWbiu1yHzL
         HtUUVjE1wZ3w4cCOqNDiI01Kmxy87rd6JXAMGpVt2o/yt25efpI9V0rYytbuPPrmt4k6
         qfU9vFLiOB19mPqM5RyTAo7WfHOjzEU+7mL2hhPGkum9bUjR804x3zfFicc2fiZJ6MmU
         XMt+qq3uCUcINMe2YCy7gT3qZIZXiqYcdR3xKWHIBGNlKvAJnqy3oVvcErv/mYsOR5rA
         n1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261094; x=1791865894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6JiiEhOg99Vjs6HW8VKbpmPJkOtJXYZ/aUNoaDYSo=;
        b=o5U1ljQbETLCv/vTvpMVTNtK71twLOiRA+O/nBRX2qr39SnpnRAoHUwRXsp0TP65bp
         VqOyiGPieUsJTcfqf01lFjH5gsGvsxNi9lH5xiGzRX6ore+3unj6oF9Mm782+EcDWu6Q
         H7lR63Vi0ju5RE1EoVd+CI9zBEa0aqzzPIeW2VuJdGiPg42+sxKFWb63Ri10v6QnSLTn
         p0LHVXhx+8+MzYHLAyfdvBxfjMZ06csWosr4pzydY/rHKo3qjTAzBsibTJQiS7CbWYNa
         rJr8FtiBrDCK31EsgU5awxSQP7yTyG5k0oybpv6IHBC/vEHZwC5TA5SWJZyuvtqphVgc
         do9Q==
X-Forwarded-Encrypted: i=1; AKwUvByrAmLB2ZjtmYwjf3JSfCohX0Fzp0RrIRYtX25M0zwjwhelL7KORu5kI8VYE+EC9enjZiFXEmvP2zGPmrpJT9ZW@lists.infradead.org
X-Gm-Message-State: AFq9FYIj7juvHETZI1OWUBqm1eQUwGvAFyECLrQcHNvqYIq7/bZRqtv7
	NCmrbipIh28sdrg8g0xBWGKtb03kZ1HsuzW/oyXQUecG9vhwReiMD2rT18bvcNJGaTpgiB4MFZ1
	3NpG1zSgL6SrIeaiXeYiDoonkOgZoALU=
X-Gm-Gg: AYBFou3eCQmpsz5vDU0rOgP/zlVfIAesj4fBmGZ+gCr5+woHZCMIcSZO+X60m+EfVIU
	FgTxG7ZF8RecNPrCidiUOjN7Pqm7XViG/hst3s6+PSBBgvd9eapW0sEf43XUFIALY3GwBggbldM
	YmBVWXYgfa92eOK4mvzjXPo0OOzxYvk+M0G9Bou/zO2ptga3Rj04diJHIKmaTaMTW8FunMlxXJD
	dTduzOtcn1042noFgg0XcZUko8uhu3hla3jz879Qdcf2o3RUt4G+qonEB6LsmQ783Xj9YxuwunA
	IwldrUQggXqDQNY0XvXr4dNfoxmtRFYUT/v5cvEKOtbFYzYZ7xmA+FXavln3UAC5HTKU3njy2f7
	yZC9o+Dx+yCG/6EB6IVwL2RotMb/1/NTgRSxQtVt13UETvRgVo0CsbZqZyDVtIznZOSYRCuASV2
	ZmIxDoNIAmFwZp/Qu6Uc9WTJC//mmdxCoG4hoAHIWW13Rr
X-Received: by 2002:a05:6102:5125:b0:7c3:7286:c291 with SMTP id
 ada2fe7eead31-7c87c2d1810mr25241137.19.1791261093704; Mon, 05 Oct 2026
 21:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com> <179082977927.31693.14994198839172125816@kernel.org>
In-Reply-To: <179082977927.31693.14994198839172125816@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:31:22 -0600
X-Gm-Features: AclHuK8pEKgTOuOpuPx6MWvpOl0xgJlv86gE-NJ5IR08oT4zG1HmfFicCuHsjnU
Message-ID: <CADvTj4oPo5oBxB0jx7E_T9mKHCbzx7E1TVQZ62F0HAP59BAvjw@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_213135_748317_61315037 
X-CRM114-Status: GOOD (  21.52  )
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

On Wed, Sep 30, 2026 at 10:43=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found by source review while working on the larger stmmac MTU/resume
recovery series, then split out as an independently useful fix.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The live AF_XDP pool corruption scenario was identified by inspection,
not reproduced on hardware.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The fast path was tested on Allwinner H616 hardware with sun8i EMAC1
and an AC300 PHY.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

