Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 23:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=; b=hvYi5djkhh5GIyQ/+Ma7+6Ym5c
	/yBOV/BDhFh52giT7CsPnJbmqyJsGvybdaXbePMKNzmX5stu2VuSN2q+wTjqryqBizFVYHzK3dBlm
	prULQo0o8igJ38ljPa+qgd7jm1AlbDlwsD4O0VZaV5VbRpwC/pbZOBTbT+yI8OH1AAhHMJyE62dXv
	KdU1hH9KsJdaZD6MLBQXq7nFOeUDiJDNr+LHZIg5vhiIS7b4zV77R2eU+81RZt/EOVMw0vGHcDP8w
	G3CxSvxeiCcTwSbEier8hJ6wvbW5uhCQpvaxvH0BBqkl0iNaZ3x4VsCYIH4+kH8morzaQIxAOBy3q
	u3rD58BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whEqP-0000000FzuN-0ThF;
	Tue, 07 Jul 2026 23:04:49 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whEqM-0000000Fzty-4AFl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 23:04:48 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51c10e86e52so45071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 16:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783465484; cv=none;
        d=google.com; s=arc-20260327;
        b=UaIqb3i6lCJAQ0jTvtp/V8AgDekjNZvO1PXwqRE7ZHKFilc1NhhvFfu9MW62WL81Pb
         ljB8jk2vKNFXJ/CJrXQ5zcJZo2yMlg2jV7UcKbfG9xkCNDoPdeozW6dWL7uzboUnsMsf
         R5osqV3JNaZ+f3EiLSqff9EEBJBT9WnY0bZgGfU0r/dlUanx9O2YN0W4jIzFoenR4CEo
         8vjAY6pbssjGLmtK3wqdTVboDkRsbTWpSNdqKG1I50WUaqzDmHXxOy91jtqdW6R8e+bt
         Puos/9SVKerYv2VI8u1nocTT3Zes1zm9BI6Ebsttu/JB4tGXhI2bMtROaz1/i6yf1La6
         K7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        fh=Z+VeeYFL1GAUZOb82xCgBqjr9mWAYOwOO6GQabIjUlM=;
        b=FAiVT6TsgWT3LzrszxeEq0SkLtWopi2jE6lIvYWb68sFFqWsq3WmoAb9ANchoLO1FO
         lwFJCXkUCtAxxLioW9734UdRLaHubj6d/fApMFN9BpExrOYVXTAc7Sy3T7gWW2hAnCGq
         aBhY4UNa/GClreBtzd27YVVLTK2iF7BdlTdPZSbnS3BzhXgBR+fnxffxP0brhJDNYXe/
         1ZWz6utGtdjp3UZSULyZ04G9Nr8EhIuv5C2e4r8Qdx9TcEphf5yL6cSdGuzzQLs44tDj
         FW2ZnSgg8PWRN/vzMCWL/YYdN0HBx9jUIhmoRwg6n2jema4hOdciNGC2Wno7VZmDS+IC
         94Qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783465484; x=1784070284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        b=Dt5mSdtI/glvEfvYQwzssePfJEjvJITGpmNftgUw1DM6y4lHHWryYpIWY6IGhFxzgp
         VyUdhHRXH1rrDa3147NSzPvmoIHABEs+nh2WL/Rblz56i+AJwbDdGTr6+RflpLKJD/OQ
         BGLC0a9OuYdYiUDHgYvHAdSkc2hZ1jaH2s1FymWozssH6W/9Rhyb8RJpsEvGpZNcbcQ9
         5Z5zQTJ6l/Ekd4cNxTPi8WQG36xGO1ofJdnXstHcse2q5XB4TkXo7ngHM0Qj34X7oa8O
         HQ26Vt89TJVfP8EiFVdjIbOifHHeA+iay3Dm8wFsKMwlBj7FJzzfBy0ZE/oXUMNH3sjP
         kfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783465484; x=1784070284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJCG15RqjZM9VwC2ZMUtoDMeZ/DnczqolCzMGW46D+g=;
        b=QyLo4zF7tDYgQaWusqsWxSUflPIbL8heYizatB+I/2SAz40y8rgsezmtzNz4an0EUi
         XODhPcfjLWSuabakSxC3urhnIHxsalovjFFvvp+n0KwM+btVFJSSjOeiS2eqHGBE7AjF
         r2tash1UXkjSPamflYv3rvw01SnkzEJY3uzbzeqD+mh0BHPZIzy8okyEu9pkgq9BcPgJ
         pZWdTidsYW6R6NvS4b7sh5SytwCXH5GeS1XOrx7jvulWu2xKMEcJXUko13uOaflciHnD
         5PEJ6ZWnB1RYhNbjrAwmEMR30RIF4Q7pWRoKWT+MrtYlO4bY8VKcS/o+k1yQtrBBKTtc
         ahFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7O4pYLN6wk3kTQskJFtGdqUziI0eBI9z8PC6qMJuKaRSBihaG8DgUbTwnx87qIzeHpRcTWSC+GqIzG5UoRutf@lists.infradead.org
X-Gm-Message-State: AOJu0YyU3Wd2BvrTzqhUDkUIvZwGNlJk4U+u/0J00FtetP8ml6iQqFDn
	/mOFd5nmDIN0NcnvrSvwL0cCstXQBeU/MRg/bKk6AT+v5agsUc1x2QPljYHr/FKGovTKtlycIru
	3TztTTGNM3FNGtJNUBvhCCzazJtFCdaZup6K5VmSb
X-Gm-Gg: AfdE7cmmg8dquFepb6d31TZ8akmAN3xWOloPHBqqXerjDbZFtwoBCG7hTmK0hxtL83M
	1k786q0QoIn5PUoJAUWO8zNuk+5oxUnLWcI01TmNaD6qyWj16DSspxFdKI7YEAFpq+xk2LF0Tfx
	fl4uNkSvRQgvzwTeyHKcAT+anD9e7zw7S6GDkBPQ2V3rnaKlecqYYS369bAhhCXYBLQljuYVAiE
	LC8Dp7ndxqwnSUS/TLaEWZ/G+1773x0Px+Ie0dxdkPj4RlcYCCMqNUvTw7cFJJOWMgg9/QSlmsH
	8oinHW+UWaXHbgvE3eAkr2B4yeAvY8ibeVtt
X-Received: by 2002:ac8:5f4c:0:b0:51b:fd5e:e81a with SMTP id
 d75a77b69052e-51c7b43344amr11256661cf.20.1783465483775; Tue, 07 Jul 2026
 16:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com> <20260703161228.GA1948451@nvidia.com>
In-Reply-To: <20260703161228.GA1948451@nvidia.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 7 Jul 2026 16:04:31 -0700
X-Gm-Features: AVVi8CfuI8cp_vTcATMKW7PcdPdPcCuC2smvbVMutN55JZh4YqKCDGaKUlDmCMs
Message-ID: <CAE2F3rDR3PaiHo8KW26jTqWYD0EfG2mqbfEHhupEzHYENxz=Vg@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_160447_072306_6F58A968 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, Jul 3, 2026 at 9:18=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Thu, Jun 18, 2026 at 02:32:09PM +0530, Vijayanand Jitta wrote:
> > From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> > Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.

[...]

> > Support is gated behind CONFIG_IOMMU_IO_PGTABLE_CONTIG_HINT, which
> > provides a compile-time opt-out for hardware affected by SMMU errata
> > related to the contiguous bit.
>
> I reviewed the errata and didn't find any related to contig that
> required disabling contig, the driver was OK with the ones I
> found.. Did you find something specific?

Arm MMU-700 is affected by erratum 3777127 ("Under invalidation in TBU
possible when using contiguous page table entries"). However, if we
disallow partial unmaps of groups of adjacent translation table
entries, we implicitly apply the workaround ("Ensure that contiguous
page tables are removed using a single range invalidation. Arm
recommends using range invalidations to remove contiguous entries
anyway for performance reasons.")

