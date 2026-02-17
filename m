Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A56E909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qNUDMsT13UyKyfZxgoLNA1qpETCM08fpEf53Df9PSE=; b=u7SklVrRMuphhq
	loQqrpqSUhZQtaJm62dHzudTXFGfP5O1zxMViH5e/7WutAmp5xz8F6oYnAq1rLX1yI+J6KmUm6/ZT
	XF5Lnph/YKbkNRfspn3OgNhOoeWX6subbI1/a7GkBhSRPmnfAQh6kpYkJgK2lp9eUC/hwz4BEC6RO
	oY5plAGoV7NyX3wQ61y6ooSlL4+E6WORhjG5IUMwBws0wEdQW9Xtrne1h5btBrz+zvIw59IC3Q9dk
	7ixRhm99XKoPDU0wwucHG1RWZTsQ5XiIoDvaFsGh21purkrlP9wsn/TQMqURAKw/LPa/VFq5CFBsB
	hr7oiQf+8gPNqa0/WySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM3h-00000008R1O-1kHj;
	Tue, 17 Feb 2026 14:28:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM3e-00000008R13-2zQW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA4964452A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 14:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9E1C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771338488;
	bh=D60oHNN6lFdIL7vwcATr/pv77WmeYhYGvjsPCv64dCk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=USaO3SAbpV9UhORq0ncePYzUxVJVjZF4WPEQ5AuHbNwei+7Z9CneyFfsoupnQqh9j
	 iHLRFky9v1JGN++iUtO++MOEAc5oo/O5jYYaaYHq23SLB/Cswof6oc58cAcBzXuzYj
	 Z6qS6wCWskdH9Q3X+/SxETEwqWswZjur16X7Dp0cSRNUIBsyTPhSV60aRMGtjV4Dxo
	 59qVrHa5Y4iaACCbPYJO1SMhs/yLSXq+gfvEvmLEkrnnjTu3UWRQGZNr2Gry5rMt+m
	 +966BeycMEOxxxGFf/l3E20jwWlCs09HOImPmne3mWZHnMXDSl/oth3YcfsIKvjWdl
	 gO9R2DaCOsYEw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38706b10b3bso38825531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:28:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4X5QFicunS0UAP+qF3YRVDg++x2hECyj0V5Dfnhm7p/Lwn5cIECbqOahjFDg9GFy8Sxi2lSV7GZao3bTxielL@lists.infradead.org
X-Gm-Message-State: AOJu0YykOFrJhtfKNHDWipxhxf9aGCC0Qe3oSfFhtIchKhkF+GF9tSg5
	zrohyKkYutpaz1MdFYdxxAjkzesevRThhiVBxsXsl9/FYg5PvkvXLDdjDNyIRa7Mb+hbZQ8hUNs
	UPGdl5v3jxDW/I0RrBCtVNjEVI+43ecE=
X-Received: by 2002:a2e:bc0c:0:b0:380:a1c:7045 with SMTP id
 38308e7fff4ca-3881b8b41camr30976861fa.8.1771338486818; Tue, 17 Feb 2026
 06:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh> <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
 <2026021718-citrus-parakeet-dc60@gregkh> <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
In-Reply-To: <7f30a8e4-49c3-421d-be05-08afb544aa41@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Feb 2026 22:27:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v67_UQ9rAFPQ5mqTFdNdPxyAJj0WZ6PwOLbHxU_0XQM6CA@mail.gmail.com>
X-Gm-Features: AaiRm50DlbCKmsQK00mf12t22scEG_EaCKBpc0WZ1vuqzX-7ewC1OTCugfPntLo
Message-ID: <CAGb2v67_UQ9rAFPQ5mqTFdNdPxyAJj0WZ6PwOLbHxU_0XQM6CA@mail.gmail.com>
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map creation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jack Aboutboul <jaboutboul@microsoft.com>, Sharath George John <sgeorgejohn@microsoft.com>, 
	Noah Meyerhans <nmeyerhans@microsoft.com>, Jim Perrin <Jim.Perrin@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_062810_790472_A67127E4 
X-CRM114-Status: GOOD (  24.07  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Feb 17, 2026 at 10:21=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> On 17/02/2026 14:10, Greg KH wrote:
> > On Tue, Feb 17, 2026 at 01:58:36PM +0000, Ryan Roberts wrote:
> >> On 17/02/2026 13:50, Greg KH wrote:
> >>> On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
> >>>> Hi All,
> >>>>
> >>>> This series is a backport that applies to stable kernel 6.6 (base v6=
.6.126), for
> >>>> some speed ups to enable significantly faster booting on systems wit=
h a lot of
> >>>> memory. The patches were originally posted at:
> >>>>
> >>>>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-r=
yan.roberts@arm.com/
> >>>>
> >>>> ... and were originally merged upstream in v6.10-rc1.
> >>>>
> >>>> I'm requesting this be merged to stable on behalf of a partner who w=
ants to get
> >>>> the benefit of this series in Debian 12.
> >>>
> >>> Why can't they just use a newer kernel version (i.e. 6.12)?  Surely t=
hey
> >>> would be able to justify moving to a newer kernel for performance
> >>> reasons, why enable them to stay on an older one, just delaying the
> >>> inevitable upgrade they will have to do anyway in a year or so?
> >>
> >> I can't answer this presicely, but I did ask and push for that approac=
h. As I
> >> understand it, they are stuck with Debian 12, which is stuck with kern=
el 6.1.
> >> The Debian maintainer apparently requested that these go through stabl=
e in order
> >> to get them into Debian 12.
> >
> > I understand the position of Debian not wanting to take patches for new
> > features that are not already upstream, but really, Debian offers a
> > newer kernel for hardware that wants to use it for things like this,
> > right?  Why not just use that instead?
>
> Let me go push a bit harder. But I expect we are in the grey zone between=
 bug
> and feature here; this is a performance bug fix, not a new feature. By
> selectively backporting I'm guessing they are avoiding the risk of new fe=
atures
> that a new kernel brings introducing new bugs? I'm guessing there is a hi=
gher
> qualification bar for that.

Why can't they use the kernel from bookworm-backports, which is 6.12?


ChenYu

