Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7367C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2hb92Bf5/2pZjEymGfvJqesYHZmbFv63xQHrBpvJ/A=; b=eKs2BEhbVyIDxiEos9uNKM1iUF
	6ZCtK6Unax7yxtuMRSC3TAo9CvrpZE4RaQqqGEGhQqGhwAfgB1LFf3cgsDN7sK+ceA7jUC8OLEqWI
	YFRUXmqXs2BteQAxSYWpcAlbLZJtngYBQqDUV1siOVTqkg5u6dzz6XlFlHulnh1WHVWUnidxAClb2
	afcMNeozm2UKpO3LzLvy6pGRgGsDy37NfmgwqH6i+GSdibKCdN63e4CmJGOpGJc7eI54QJo+/Lj+9
	L0pOsrkTya2H2Wiojq0f4uYkpNOtK/sy/i106vXIurRxN2dvC/LG9YaIU34CC23wKRU8qd8JEO+BE
	DWD1Jp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdO0-00000002pAe-2vp0;
	Mon, 10 Mar 2025 13:41:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcRg-00000002erk-3Iff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:41:26 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so8304736a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 05:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741610483; x=1742215283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2hb92Bf5/2pZjEymGfvJqesYHZmbFv63xQHrBpvJ/A=;
        b=dDtguNesRA8rfhDu36qH68uDXf3muHtH8beizXD6sz+ic23VJB8rmYTKyQIq3qXfmS
         3erOEnFQoo8LTJW4vd+D+8Rly+yzWIg8jB97ZCC7D73yU6aVa/fnYWakzI6c7DdgTgZ1
         PXbCouVTt1tK3UsqPx3pMYUZ8qYazzu16Sesrx9/wDJ3c2/vNpUzpyYQaFZT9pLBYCmO
         /cutvvKu+PeiMO3EXelZKgHSqjpVxGnnbDjQJFR6jPGH+PvxovTacQEkO067I5qYtcWK
         0GsiR7E+5S+Jg9jb8Ri2K/2o1qolQpH5Cyc0QGnLP9VzjgPBvqKWTEUVOdIeCSnK2p3G
         p9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610483; x=1742215283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2hb92Bf5/2pZjEymGfvJqesYHZmbFv63xQHrBpvJ/A=;
        b=d4DdytKRNhhrF+uWaDqbwaS9UIPhqtyf6PVzDBTgzUC2lwe8WS/vzveHxsMoRJYa3D
         BRrVmryzWOvtAC5JsDn30LABbuVUvXKXoeMWDKcDCVS9bMdct6RexxuDEA3JewsOSvGn
         qJyjPU+Cc4ffXpbd87zSRz6KEM1aGRKnbRKwvUxeX2YfYsHq8sZu8Ua5p31Slw/iR8Ko
         yodQ8F0xpEBjHIBl9XsTsINp7RSqVghI3mdxYn2yika7AB5SEOoRTRxZEH7kJxUmUShL
         qCIcpEu3DWcb3/sqcyntKu9bed5cq4T+oxDReO/tN+qWYmTd1Tfh2FavD3ditH7jhPkJ
         wVdA==
X-Forwarded-Encrypted: i=1; AJvYcCXKJOub4pnvQ0F/gA3eXUVDqNK0kl4F76gd8fPte/7sQCdZ7SDENBG9/Pa3WCu24YphyI8JHIwGvl9t5zhAOcBZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwXgGvNFLjQ3sIoVdWQ9yoCH6UbppNPXkxJccnj5S5c3F41wzje
	J7iAgGZlciaj9el6GE/20ebhiTyUDfbfY2ZoY0yWr8sLBhpMBhPGR+gwPQwHJxXxk7RNlMvlP4t
	hamKb7wMG96MSm/y5YJmsEvQMQ3Y=
X-Gm-Gg: ASbGnctWrSSus6sWOYSF8nPWJDCuB3zvvMkzyleptqEIXHX4iSMySkwnKjIR9MFzp3d
	cg5Ui53tTQMALAb/OFaG0/oLsylOjdLeERQ5jrw6v3dH5iqIl/ptQ7NHFmaegPU+4yzz3zx/Awr
	D8EkU660i3Q0rmBxmWyIufsdkPYiwA17nJucf3D04wpnuT
X-Google-Smtp-Source: AGHT+IGbhuSl05kaEcLr4vaNaYcnvbu8eAnHPI3X7260iUe/HNnjduw+l6Z5dyOdVihAIIZ0GFIAt8i2L6PXQgKu7P0=
X-Received: by 2002:a05:6402:34d6:b0:5e0:8a34:3b5c with SMTP id
 4fb4d7f45d1cf-5e614d92d51mr11025464a12.0.1741610482533; Mon, 10 Mar 2025
 05:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-10-git-send-email-nunodasneves@linux.microsoft.com>
In-Reply-To: <1740611284-27506-10-git-send-email-nunodasneves@linux.microsoft.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Mon, 10 Mar 2025 20:40:46 +0800
X-Gm-Features: AQ5f1JpetGYU9QId_nDle89d5pd0l8CdMTUEIA_r5WaM_0vYFhAkX03EaOPPaVA
Message-ID: <CAMvTesB5dCD5Cx+CE8oPQ35OHC+C=tyXbHQ0BNxSABEFVK53Tg@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] hyperv: Add definitions for root partition
 driver to hv headers
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com, 
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org, 
	joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de, 
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com, 
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com, 
	ssengar@linux.microsoft.com, apais@linux.microsoft.com, 
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com, 
	gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com, 
	muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org, 
	lenb@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_054124_822273_04159858 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, Feb 27, 2025 at 7:11=E2=80=AFAM Nuno Das Neves
<nunodasneves@linux.microsoft.com> wrote:
>
> A few additional definitions are required for the mshv driver code
> (to follow). Introduce those here and clean up a little bit while
> at it.
>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

It may be better to unify data type u8, u16, u32, u64 or __u8, __u16,
__u32, __u64 in the hvhdk.h.

Others like good.

Reviewed-by: Tianyu Lan <tiala@microsoft.com>

--=20
Thanks
Tianyu Lan

