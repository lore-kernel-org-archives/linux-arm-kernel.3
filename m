Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DB8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfuuC+7w2DxvL1+4IGdyXxSYobWxsOTw9r2v/sqdLBo=; b=ZZmRNDQtsoDxbS3vzo3ml9BxVg
	rZcwxE7lXSavYNnRt7JpbLEHJXKDtnSaKun7iICzHW/qUF7uBGAG1AKkNyIK/4+Qyl0mstxMJu92O
	/WHNroCwJnSQnAdgLyT7PEqJbrcG9QiiCvCwXdZmbWc3B6trALasJfcK3mvPDw07p7ckmYrvfn9qL
	ts3tiPiCIkN8z5tIgpD70UnwwTEKcePcIOg8J1SzXtAGcaeNzCbTX0/OAADB65QMDEsrSDb0YpiFB
	D0A3OkXLIizSSHfFA2EekC57xBFRz6RVgZXZsmy4A15u5n3mm6oWkAJ5C6DewTkT9apQcKwKHWJq3
	CnDkaD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlze-00000003hCe-2sLx;
	Mon, 23 Jun 2025 18:34:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTG-000000036th-2u3K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92E0D5C59BA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1BAC4CEF3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750690109;
	bh=MfuuC+7w2DxvL1+4IGdyXxSYobWxsOTw9r2v/sqdLBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FlzIhNrGnbcVaZRsLjfayf/H1e5q4VaqwbypmWeDnLZmbZhaklNrk4I+mXFkrsp/H
	 z4UtQLebpLgkQo6wMFXJVE/q73Qtl5XzERzGGhdl4ljZmJ3FQublkGZqk/lkSVTX0l
	 YBZs80f04bSuk4Px+IHENSQyAL+0WoqGzNJqo0w/Fcs1hd1jA686qpoCbhl4RYOa4z
	 s18gtTztshzgFdugwxbtR7kgsbbap5j+oMAH2Awd71d8Yf2kePhlHCzOLCiuKFTt4m
	 AlklHYlaA/XuWqGC+SDy+3rvTnCtQB3caMEcW4SPmURZmpeuSZ8+LtCue81UQFXP4U
	 1C0mLrSeMDAsg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso8204688a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwBjRNFBZ8F2XHkzaurvrO9pWoVFVYeWOsBpgsotN7cLkb78Uz5aBWpMOwqWuRSJPZYSMtJQdVWdjPRIWGnNDX@lists.infradead.org
X-Gm-Message-State: AOJu0YyOJ8ztHTn7N4k/MV3pEAPERtl/Ff/ks4ZzX4iXnD1zs0B//fFi
	Zj8INnpnAZFvAHoeU+i6PsuAzOcBkPzvnl+Kl0/K0qCce/ShfXGAD2RjI5ayc1l+ntLGc+TV34C
	SCey37TJh1gzveQwPYtYcQoP9p5c3EA==
X-Google-Smtp-Source: AGHT+IEkJTaouEoSLqOFM+aNoCD2YfrR9XQOA+ZEyc7rZToekEocazcacZ5lvHceLe9SxcjElzIsPrZrLktHZjFbJ5w=
X-Received: by 2002:a17:907:3d0a:b0:ae0:67aa:6c95 with SMTP id
 a640c23a62f3a-ae067aa70f8mr1000125866b.53.1750690108323; Mon, 23 Jun 2025
 07:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-3-james.morse@arm.com>
In-Reply-To: <20250613130356.8080-3-james.morse@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 09:48:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
X-Gm-Features: Ac12FXyKBJRIelfk3y1WfSywu5MXnF4Xh2DfdmJn8G-sIhaA3G0-KsrimYntTJA
Message-ID: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074830_816400_F4CC302F 
X-CRM114-Status: GOOD (  19.19  )
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
> Filesystems like resctrl use the cache-id exposed via sysfs to identify
> groups of CPUs. The value is also used for PCIe cache steering tags. On
> DT platforms cache-id is not something that is described in the
> device-tree, but instead generated from the smallest CPU h/w id of the
> CPUs associated with that cache.
>
> CPU h/w ids may be larger than 32 bits.
>
> Add a hook to allow architectures to compress the value from the devicetr=
ee
> into 32 bits. Returning the same value is always safe as cache_of_set_id(=
)
> will stop if a value larger than 32 bits is seen.
>
> For example, on arm64 the value is the MPIDR affinity register, which onl=
y
> has 32 bits of affinity data, but spread across the 64 bit field. An
> arch-specific bit swizzle gives a 32 bit value.

What's missing here is why do we need the cache id to be only 32-bits?
I suppose it is because the sysfs 'id' file has been implicitly that?
Why can't we just allow 64-bit values there? Obviously, you can't have
a 64-bit value on x86 because that might break existing userspace. But
for Arm, there is no existing userspace to break. Even with 32-bits,
it is entirely possible that an existing userspace assumed values less
than 32-bits and would be broken for Arm as-is. It is obviously nice
if we can avoid modifying userspace, but I don't think that's a
requirement and I'd be surprised if there's not other things that need
to be adapted for MPAM support.

Also, what if an architecture can't swizzle their value into 32-bits?
They would be stuck with requiring userspace to deal with 64-bit
values.

Rob

