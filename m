Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EBBE67A8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVdYil7W0i9u77JXtm0StCzUZz4J3OdCK1AwKZIzaa4=; b=crTkwOBtdV0qKQYy6eS9fY7hEe
	+jb0sF1dE5ByrEq7CWih/rtMZRwvkYLDedbkpwakFHTC6Ahr5I9MzrwweLrzi06Dv4k/dSrfYxEiI
	bzwoFq8d4tpSvVDuNP2YDhbAvOmSXgKUkq0HMeGuqfrUE9cRQbp78SDq0SoWB/h4RwiWwNs3yCeQI
	PpQQ6c3oQNqinS93/bw7LyUbR7U2qC8kIW9PeCIbJ0PZ0RwsE7cvW8OEaTvoVcyIua2BFqaPvsC6i
	VGj+Y27mQYJKF4MBnpmAfnhRsPO1P4Q1+YyCC6D3BYl97/Q5FKt4EFhtJeF6c5caxAXPCbdwobu5M
	bjY0SXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxK3R-0000000EfBk-16uj;
	Tue, 03 Mar 2026 07:20:29 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxK3O-0000000EfAx-0uvu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:20:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b939cfc1e83so316190266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 23:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772522423; cv=none;
        d=google.com; s=arc-20240605;
        b=fgKzgkL+kdNBfmOBc/L7IBQd4rYhG9qWMtn+a4AtvR8PzJUKrrr9dtaCl+i8T7Qx9Z
         zceeKcaBNsoKifDVy7U2xSE2LTxT9RKk2apqsYH63l9dLlbJ3caMbiSzRVcb3QlaMQo4
         AvaFmHjLDdy4vJTBasTe4/yzHNi/s1T2XX5wU4oobfLKDols0NwfL+eqtOzA3kv8Vggk
         DZvYjYJulvBy38IsbPzwCiDWrgQnhScP7WAtW2BLMPCHqbaR8us3gmIGZn6im5X/L2nW
         TWW74xQUyfOAHrM9oxiaH8Yr9XAn0miyMT7+0kkZ7ETtHMyMAjR2zzL9BIZBD4IEiV16
         74IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVdYil7W0i9u77JXtm0StCzUZz4J3OdCK1AwKZIzaa4=;
        fh=pJevb9HNwC5L9xk2smh9tvPIvPDMYYQHorRVDOHOoPw=;
        b=h+da8CwPZ57vNZIjtt5oYyiUnlqlch4HiNRpDAGkw/aoIpV0Qka+o6WOwARseYt15D
         hZ7U2bhTWqWolChGHqxqY0GlZkjofoIVSu0HbojkbSn1HJ8TmBrw1CFiJbUB0PlfuX76
         9Tm3DdFdlYl5YRg4xNG0HqebjPZSn+4TPssmoNCQPIRL0P6LgZ8mAw1/1zyGQ6mazHwf
         by4YM0l4pwhL/tc80eIGA46z6AuunjJ7ALsQAa3N8do60p2D6prP6wuxAJM2g4m4niGK
         cJq3x9BnCzZYGkYqkBKfDxLn7O/IXWm0uVBRD743zXQC6qbSeS2pb+RxbMeuqrSs2E5H
         DoNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772522423; x=1773127223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVdYil7W0i9u77JXtm0StCzUZz4J3OdCK1AwKZIzaa4=;
        b=w6ximgGMoEiYLJZ7X8DxxSj1mbVx5grljFfOg+EFQaT46KNlqfrKElxLSslybcowPs
         C8LuJQxUbD9FVF2EyB1QggNHijIeRzep9omK+anBGB/vm4AvwwQzxPHTp6rrAenPLyHf
         ryKy4g5Z3WEv87OjYJ2gwJ2DTqfIxkUhplY3PC/B9lkkCCip+mFZ44aqy3gKF86uA2HI
         xopfMcba+rvJQ0KcF7wtLlAafgz0KCoam208XaNu/kZ7kF6VxaGafp75yAecyfUzFCg7
         pE3D4RmI0wTEef5ZYqh2GsBmrs7g4B0cJXbrwvrckPfwWkEEpo6ysOwThdTLdvbG7M1Q
         TkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772522423; x=1773127223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVdYil7W0i9u77JXtm0StCzUZz4J3OdCK1AwKZIzaa4=;
        b=U79xpSZ1gYYwb1pMUKQ08WwuDV4c8nIBMbWJ7Nwz0wY5B5Xq9UjhFbAkxPy0u9RZ+F
         bGZmtcjaTBSjJs37ARtT58CXX9MgBIpqMXhA8R5OZ3cbCSrBwu5oGalf4p6PC3Gp+QEQ
         Sf1t//WHnagGuAcJLmj+RjNedgMueoU/dukAF15GFnLaR63BfLoeYXpkQ3BOOTUffW8Q
         /2DKhZd44ILWijS6RVmwaASaVXFwvpC5dy4HaXpiKM2mMYKT5SWVMmlwX4lXl8/FVlLH
         43xRMC5PSZjqu1sKq1Y9yURdIfeCmzFJ1FJvB0RmThQmwcliZ5o8fwygoWBZDGD9QB0b
         6CWw==
X-Forwarded-Encrypted: i=1; AJvYcCXjvZ5Fzfi0RU4ZC2rY46pFdJLBjxVszjiVmw3I/F0xfu/U9UxPX6DJ2yFi6+pjRp5bSeL/kGxKRqWzk0CFEzZW@lists.infradead.org
X-Gm-Message-State: AOJu0YxFKXHUmvLPl0J8hxz++qLiUoD6CxlLE+UjNarRvWm3Ooe2NeNu
	xUyiy2SkqyKIKPaKhnEdyHYzqFAOV8FgRutA60WcDIuZ5/LKyNkfFuVDx2t3j4HGj5cZu1Y+qEJ
	ZiGMeHYRUIN9DbdWwW3hYyvwQEcOHs11v57hGcw79
X-Gm-Gg: ATEYQzxA4+BS3PbT+bNLXroNrMQKl0/0ixr1bKHJUBG1/JxlI1A3O7XxNYzlEz8M0al
	mI0raB1tiGUK7jSvFFv91tpfgGzY+4EJ+yEcaJa1rJL8s22uw05WM9tJX9HJUhaEI/tmHpL7dNA
	XkGbGmgP48Bi43kfsvnfgEFjVs0+ofkremISJ9yQy0hSTBqKTYqOF/Nda9B16vg6NqV6qwg1tiu
	8Eoc/JtbI9C3CEB/RFuZ9uUl6pqJ1OAdY9c0SFed6orzC8H4p3vxR/WxYps99yZSdsR71QVTmoc
	HaQZeHMQAKLTUTcb4yoTWt/XjGIeNklANpyj5fl2
X-Received: by 2002:a17:907:3d90:b0:b93:a3db:a6b9 with SMTP id
 a640c23a62f3a-b93a3dbae19mr488908066b.53.1772522422966; Mon, 02 Mar 2026
 23:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
In-Reply-To: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 2 Mar 2026 23:19:46 -0800
X-Gm-Features: AaiRm51Ep2_L29b_JroBYwNE4zf0aj9rqC2fV9F6QzDJPa3ta2uUEeGpii49xJM
Message-ID: <CADrL8HXaTz-TS9rYiQkZ6NoRWhHm0t4Tv0t=TtDXS4purLnDJg@mail.gmail.com>
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
To: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>, Breno Leitao <leitao@debian.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_232026_275261_874DED94 
X-CRM114-Status: GOOD (  17.50  )
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

On Mon, Mar 2, 2026 at 10:38=E2=80=AFPM Piotr Jaroszynski
<pjaroszynski@nvidia.com> wrote:
>
> contpte_ptep_set_access_flags() compared the gathered ptep_get() value
> against the requested entry to detect no-ops. ptep_get() ORs AF/dirty
> from all sub-PTEs in the CONT block, so a dirty sibling can make the
> target appear already-dirty. When the gathered value matches entry, the
> function returns 0 even though the target sub-PTE still has PTE_RDONLY
> set in hardware.
>
> For CPU page-table walks this is benign: with FEAT_HAFDBS the hardware
> may set AF/dirty on any sub-PTE and the CPU TLB treats the gathered
> result as authoritative for the entire range. But an SMMU without HTTU
> (or with HA/HD disabled in CD.TCR) evaluates each descriptor
> individually and will keep raising F_PERMISSION on the unchanged target
> sub-PTE, causing an infinite fault loop.
>
> Gathering can therefore cause false no-ops when only a sibling has been
> updated:
>  - write faults: target still has PTE_RDONLY (needs PTE_RDONLY cleared)
>  - read faults:  target still lacks PTE_AF
>
> Fix by checking all sub-PTEs' access flags individually (not via the
> gathered view) before returning no-op, and use the raw target PTE for
> the write-bit unfold decision. The access-flag mask matches the one
> used by __ptep_set_access_flags().
>
> Per Arm ARM (DDI 0487) D8.7.1 ("The Contiguous bit"), any sub-PTE in a CO=
NT
> range may become the effective cached translation and software must
> maintain consistent attributes across the range.
>
> Fixes: 4602e5757bcc ("arm64/mm: wire up PTE_CONT for user mappings")
>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Piotr Jaroszynski <pjaroszynski@nvidia.com>

Thanks for the fix!

This is similar (sort of) to a HugeTLB page fault loop I stumbled upon
a while ago[1]. (I wonder if there have been more cases like this.)

Feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>

[1] https://lore.kernel.org/all/20231204172646.2541916-1-jthoughton@google.=
com

