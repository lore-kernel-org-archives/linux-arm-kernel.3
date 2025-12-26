Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA90E8FDA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ETCCHt7IoGydBghoCqkBEptevXP1DQGbUxzA0otMJg=; b=o1XdxYICsNudEq7Uayq9YIBc1p
	+/0L3WEt8zGuR3qjid22M9ninWW5OHhh8SSrkZj3OAjaw8z+Jbr3hnL6A8U7tVcks6zG/JfuR2cKE
	f16kdIazpthNDHdv+g2frvoIrOeILixuhaglSFqzwsVtRumtO6GlKw6GdSv1dtkh0FWl1V1Oz3w4x
	/EO09x5ZYIDqbx8zeJPpz/ONG74IvjPSyLbTT2Jn93vs3jR5IfHyWpztnkg+iOSMyBYKInGbw/WE3
	EH+/9QI5OpBzYXWn3NffUpa1BcbZj0ADihfE7RnF5xM3ioOQcc4qApGVwIqX8t5H/jNwNMC5qrTR+
	i5SEJ9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3EN-0000000126J-3k1A;
	Fri, 26 Dec 2025 08:31:27 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3EL-0000000125a-2ESi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 08:31:26 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4ed7024c8c5so58638541cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 00:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766737884; x=1767342684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ETCCHt7IoGydBghoCqkBEptevXP1DQGbUxzA0otMJg=;
        b=Sxvf8L4ND3reQou/OcjMxRFAB4jyjah195ZloferkNyeAy1V8CL3/nqyNNya6QMTpX
         bSIfKWm7AgSgWrkv2F+8a9Ze0oPojWmZYNYiRP6bWPuJjXuLd8kqTelL9CmIQd5B6a8x
         TNTxjY3tNdr4R/aRaqX+f00ifQib+4MdOJu0knFgAKVrMQ7hVms0fOhZnkGbHgxxCAjI
         IzRvRXEiAgd41thuE2EkFKtIyObv4sptgW4Ss7j1/4Kb6e6441qP4AbSfUcVWfFYzYlM
         QUVGS2nOeY/WyUiNt7ewMHVXfPh1ebmV44cvVEz/hhhW1tIYPuKQ+YM1f5BhxnNNCASz
         aILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766737884; x=1767342684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ETCCHt7IoGydBghoCqkBEptevXP1DQGbUxzA0otMJg=;
        b=CUkxQErhrISCbGBSQ86gltE0XXvSEDvUrFLjMIPv7M12yQXywd03AbE3AxHDoqFnO6
         0Wfr3eIhFJ6JAf4jkyYeAhDrSyven0z3iuEziOtaqCxL4Ky3n2d4aaX5sbZ728QfBxuB
         Z6fp0uauAOligyl9FqfH7/7opnboDvFLyXbkZCGxdz+bM5KbMis68yFJ513/OWgsJJs/
         xLC9nFpVjjgRkYow6h+2P79U5HnwbMg6MSNBWQp0ZRrQmZ7Iaig3ElkLRpbH5SRubxw7
         otB4l7ubzw9rYcnQ6dRyTy3pewYJkla+Jov0fYej5sq/RyupP99EgLcMFe/dZwPa53VP
         1VzA==
X-Forwarded-Encrypted: i=1; AJvYcCWBJ76xYhU3rBMXs0jXyA4VohBP5t32qJlkLJ3IJULJbTYke90SkADpMZnMx7eKRpPuKOBTjUUyeVccmrzRVzE7@lists.infradead.org
X-Gm-Message-State: AOJu0YyAx8riF790ZDrGt9vPHA+ODuZ8xuYCAiHZ89XHfrbm79mFFsTh
	5Bx3EJuftCsa2PZziEh564hcuMC4mf8Qs/vGGQj3ejVQtjG+jH1BNHYBa5iN3ua5uU2nT0kX6Pp
	zFKOSqRCTWzH1LXq+bKG8WhDWEKrDUWQ=
X-Gm-Gg: AY/fxX4cazW7btelcWwfil7vG11fzXhFNXIiXstOCPlLAq/giiQ49+KB6+XneEKsGuc
	aDgt7rYBNV8JK50NWzIHIvVbtWiKMX//bQXPVl79wUaWbr5w/Od5MRev6X2+Xg0hPhBX0k3p6gl
	b0SffT1j6QufjhvOg5GiFZM5NoY9340lZPM+Z3Yx655+TdpgetxkyMBCDumh27RbOLFHzuC3vW5
	CYymPk1NQFBVYR+TmUQqFf8YIAlVTsgfbhkqxHVBleRYr0nLyjHYTClZElWdNFiFey3ppcecUU7
	3TqN
X-Google-Smtp-Source: AGHT+IGlo+LNZk0/EWZpzgtTa+eewy9uUlgU2pu3xklivftu/e6+goucch5R3j67a8EiyZc4sKbd4+GSANbMdY5eOZw=
X-Received: by 2002:ad4:4dc6:0:b0:88a:31a9:ae4d with SMTP id
 6a1803df08f44-88d881bdc4cmr260654476d6.59.1766737883763; Fri, 26 Dec 2025
 00:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com> <915dc88b-9131-4520-a2f2-facadc887bbd@linux.alibaba.com>
In-Reply-To: <915dc88b-9131-4520-a2f2-facadc887bbd@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 26 Dec 2025 21:31:12 +1300
X-Gm-Features: AQt7F2qQ6-b32qG0-PITUSPaNlNbQaGfg_aC_VktZpMRs77vq1i3irw977ou9Bw
Message-ID: <CAGsJ_4yQtFK8wtMuJ72ce8KFRT7mB4SZxqS1MKi6RA1WDNkm1Q@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all pagesizes
To: Weilin Tong <tongweilin@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	baolin.wang@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_003125_578210_A5F518D5 
X-CRM114-Status: GOOD (  16.92  )
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

On Fri, Dec 26, 2025 at 9:18=E2=80=AFPM Weilin Tong
<tongweilin@linux.alibaba.com> wrote:
>
>
> =E5=9C=A8 2025/12/26 14:52, Barry Song =E5=86=99=E9=81=93:
>
> On Fri, Dec 26, 2025 at 7:39=E2=80=AFPM Weilin Tong
> <tongweilin@linux.alibaba.com> wrote:
>
> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels,=
 but
> large folios requiring swapping also exist in other page size configurati=
ons
> (e.g. 64K). Without this config, large folios in these kernels cannot be =
swapped
> out.
>
> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
>
> I no longer recall why this was not enabled for sizes other than
> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
> it appears to be fine, and the swap cluster size should also be
> more friendly to PMD alignment.
>
>
> #ifdef CONFIG_THP_SWAP
> #define SWAPFILE_CLUSTER        HPAGE_PMD_NR
> #define swap_entry_order(order) (order)
> #else
> #define SWAPFILE_CLUSTER        256
> #define swap_entry_order(order) 0
> #endif
>
>
> Thank you very much for taking the time to review this patch during the h=
oliday. Wishing you a happy holiday as well!
>
> I appreciate you pointing out this optimization. We initially noticed the=
 issue because, on ARM64 kernels with 64K page size, if large folios are us=
ed in shmem, they cannot be swapped out as a whole during shmem_writeout() =
due to the config limitation,
> and are forced to split instead=E2=80=94which is something we wanted to a=
void.
>
> It seems that this change will help enable better swap operations for lar=
ge folios. Thank you again for your feedback!

Right, I believe this is the correct direction. Just double-check that
the MTE-related functionality works. Take a look at commit
f238b8c33c6738 ("arm64: mm: swap: support THP_SWAP on hardware with MTE").

