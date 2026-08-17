Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC55C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz7UJVJWoWy2wE7hc0CFyPVX5/AZ2HsTSf2ypZMOWxI=; b=ACGOBGpeHneabc6qSMJAJaoonx
	VuWxBty3bsxlOGqQd5iqGhNUF7ekGQSij9UA9OeiVmlm+Ky+MBLwcLu/+v3+HUdu6Jq7jDWw58IuW
	XoMq9eJWEN8rPyCV1c4HAbPj8OZWFFUukR0772nnvbC+igImwslmHomTSTtmbqebOjjABdEtufhQx
	b3kMZ9kq4GW0Cu067ifGAbR5JZ9UkAi61FCZR2LfnBAo9nLQG/AwhclsJrgBX1gydbLu1Q6Lian9I
	YxTRCfbvRbhUEQNrwER56UNoC+pgdu6c3z63ktwlxrLbmOS8U+5M2KZXkePgkR1OhLmCygFjJQldM
	Rmcm0w2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs3d-00000005atw-3HvF;
	Mon, 17 Aug 2026 07:46:57 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvs3a-00000005ash-3DAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:46:56 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c01c79467so676781cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 00:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786952813; cv=none;
        d=google.com; s=arc-20260327;
        b=bJeHSCFt9a7Cx8zkqw5N/gxqolLRBjJIMyrE5aadDS57EWgXyifgsada9XgUaL8h/p
         +SmMixoYevJmv+bq0c2Z/9KBPjNOr525nRRqQ8lHKBdO7YexUJUUZicAdF2QKeg1gDp8
         zLA7KdzOroRabFizjyaqXgiK7pC4Pk8qab9gGiLqaRrWDwK+hVuvqowQ/qy3YFWSeYq/
         R/g9gs6Z5aByOdf3ItwqRbKFTCA18v+FQ8hDVdBvMk+9jPBxX+rk3+sKl+xnGaIsWE8g
         dWRJg5BLO/j0ugazWonbey+suu5XKXq6Nf07kqSN+aBVVR0nPhfUvybd18Y4ukIjJG99
         Jjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lz7UJVJWoWy2wE7hc0CFyPVX5/AZ2HsTSf2ypZMOWxI=;
        fh=XVbLI2v8z7ogakFzyMgZOwL6I4J+07PQwuuZzLailOQ=;
        b=L9I3BLFD+ePf0fy9wx1BrQAxtsRt6IgiK07gSEqwgePlfwcP4rk8/5Y+6+gmN1dDCL
         Emc9LRqFGfe/+YjqT4h0bIQJCm/OoSDtfTk03lG3NIZRJEUtvm4kcNx82MDSocM5dss1
         +DAb4Z/bNb+rqo/v7n4CDool3z8NV0b6VUVgsGwr1gKGfbaGn3ATxskn4Kkea2kJtO5y
         SHFvR4V6XRUhwGSITcraWmOyg6DVIEUaH2UMb5hCXdW6jWSjKKopyFj8+W+3mFYNEgkZ
         L5INJp5UtFuyJrhs11aX/Tfu43ZFVOYA1iXqynXZErfs05p4QeDk3bNFJooSMBwwLdrg
         m9rQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786952813; x=1787557613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lz7UJVJWoWy2wE7hc0CFyPVX5/AZ2HsTSf2ypZMOWxI=;
        b=LbPvqieN15eXYoOhKTwOPnUueDZc/9IvvK2lud/mFnzMDJbF0tEwH0UBgVKRhRgo+H
         27FS4GoA7ZVECFL/5R/yy4UHoQBQVum7ANQUOHcNu4OOrnZNIhCpjHQCeQGGqcDZIN4r
         aj/HcTviliGGCuLcpJvUw/22xv1i6w6/ayxdoyPCq7mhhJznG8PwYH9McAzvN8tQofGT
         J94JooGPAOAbzNF5zcWxYAEqD0IXkWEBCf49LEMk/Ili+tzAVfk0Vwwa0ts9DDjnKBXU
         banGbDFf1o+T3tDC4/4yzopZglYCfJ7OHrqm7YguTiC7XMipIzgijeiu0eIG9ONSaMSR
         fXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952813; x=1787557613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz7UJVJWoWy2wE7hc0CFyPVX5/AZ2HsTSf2ypZMOWxI=;
        b=Xs9lmhKlbrZ0L3jQnRFaBbPyxODuzdJkrC3xJOha7TGXl8SYHOSoObjwEJxSOGTdn1
         okx7fa0vH+wqizlKfmV7ER0/thsHB/fdpNWyXyqxDFN01yrbnhYL0uBRuf0eGSMdBPff
         JJJ7ySTNvqZzOvWNbu6PwXDSPQYlJGaa8mMm9STZv+WF+t6SKpGEvUUuV4QS2idE5Prg
         wJLHo6BPLQB7JSR72DKbFflpZAjJFirhAOsxZTbNra5nx4gMxHGlcO77NiyG5w2F5JSQ
         E+itbyIHST24yX3VDEjIsmWCLowf46/yQP5DQQ5PZ1ehXVIt9t9y5j2Y1MGpEJrb2pIi
         vYig==
X-Forwarded-Encrypted: i=1; AHgh+Rq9p1SRRPy7DvqH9jY8dHtsM05Fs61K53esQaMi3oCaiStDgi3AjvvOG/jYLZrlDrzWKabcFdClfuHaIbMMfFz8@lists.infradead.org
X-Gm-Message-State: AOJu0YxnGd8dIJ/ileai0UBTkO9EsE6XtEzxoK0LWkWBvCAnnW2884FA
	rhhyOODEZU6EjRpWAv3LlqwutXHemF/KfOi225+Eu5D8OO+7QWniUHMHYy1CBr3VmTNOWMUgKth
	c2E84M+GYx0iHVds4kYItV5rIqLZgUdOeMbKElVYx
X-Gm-Gg: AR+sD12xpWjfs7ZF4cuTHBk2Q7TzkdSCrFuAQsmfP5wT5gs6uogx0dMCfVrGEYk73+6
	TA/sFMj9ry0i8CYwVkT5cfPxdcHnzXq0BH+5J7zL/3NQXmHcKg0MYs9KerLfAP8m4C5URu/TqXV
	LzjX0xhL9fmziR0IdW9nWfCLhV7myFQpJiHxS70XbjkHupHeKKhBOfmp6fBdtAQjxvp1HvyhTp/
	k+AGDkshagI+CvCshsu4cOa5N16wE+DLDHirl8nuBBvEiypnsehZQykmMAqG5C2RfZ3CjJXIkIx
	JkgVCUs7S4CmCKcVBvis+f0vFZphFks2akPYlyfsNhjvmw==
X-Received: by 2002:a05:622a:120d:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52db093ef72mr8236741cf.12.1786952812842; Mon, 17 Aug 2026
 00:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260815082048.4043217-1-irogers@google.com> <20260815172712.50119-1-irogers@google.com>
 <4998d0ca-eeb0-4b04-b3ac-a1f97c1829f2@kernel.org> <CAP-5=fVffrRgO4OM6u=JTEUwBY0np+fUExqOpbiYU1JgyMr7Rw@mail.gmail.com>
 <7cc71fbf-425e-4047-94c5-3f06d3ed8905@kernel.org>
In-Reply-To: <7cc71fbf-425e-4047-94c5-3f06d3ed8905@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 17 Aug 2026 00:46:41 -0700
X-Gm-Features: AcwNN1WuYOhNid9ghYjSUIFLSR0oHbLNq9UQxrihJM05AZi4ux_k8Z5V-9XdhW8
Message-ID: <CAP-5=fW7yQmH+4+x5QCqr2vO_MNSYuPW4T8X8qTns=GitOUN8w@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] perf: Add Raspberry Pi AXI PMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: florian.fainelli@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pbrobinson@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_004654_813170_821ED76F 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, Aug 17, 2026 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/08/2026 08:57, Ian Rogers wrote:
> > On Sun, Aug 16, 2026 at 11:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> On 15/08/2026 19:27, Ian Rogers wrote:
> >>> Motivation & Background
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>> Currently, Linux lacks a standard perf-API compatible driver for the
> >>> Broadcom AXI performance counter blocks on Raspberry Pi platforms. Pr=
ior
> >>> out-of-tree vendor solutions relied on custom debugfs nodes and ad-ho=
c
> >>> kthreads, preventing integration with standard Linux perf tooling (`p=
erf stat`,
> >>> `perf list`, etc.).
> >>>
> >>
> >> Slow down!
> >>
> >> One version per 24h in normal cycle, not 13 patchsets in two days! (an=
d
> >> even rarer during the merge window)
> >
> > I'm familiar with perf-tools which was set up to follow BPF's example,
> > both have -next repos. The -next repos merge into linux-next for
> > testing. I agree that cherry-picking shouldn't be done straight into a
> > pull request to Linus. Is there a principle against using -next and
> > linux-next?
>
> How is this relevant? I don't think you read my comment.

I think I addressed all the points in your email. The -next
development is relevant because it directly addresses your point about
not sending emails during a merge window. Except when the -next branch
is becoming the main branch, merging patches at will is acceptable and
you also benefit from the linux-next testing. Not sending patches 5
times a year during the two-week merge window, it is nice to think
that this timetable fits everybody.

Thanks,
Ian

> Best regards,
> Krzysztof

