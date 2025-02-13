Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2288FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDH2mAPI1dc+oNCI+jprC1LnlVjmBy3U7iiSh3qJEe0=; b=FIF50RHDXg7h4aR1tsEhe5Bj8t
	KUNOjKbE0xeYs1mAeJ3pUo25yujfGdj646ZlMpZB4eZojOrwgpGjNjQewsC8vDb9txYny/W4suySX
	k4H1e3a0sbCDRGBUyM2liuwSU+fghH5nOS3sl7GxO9+IrB5PIBCFfXWy/VArtcE7U9CcXxLGIEVpY
	Rzu8d5BeRBcLyIYcLFrAqjvXWb9qOfwrrqWStYQ6tzNEEu3gCIwlsMtkelvdsmvxy+YDBwED8yRfu
	mh6Sqd91bDIgP4lv/rREfp33qf3CLRJoBo5qGHb5vfeIPnAHITHd4p763gXTE5F/4G0dylRFnCjRf
	wlftJN0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWh9-0000000Ai49-25hO;
	Thu, 13 Feb 2025 10:43:47 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWTd-0000000AfmY-2Qci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 10:29:50 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6e4468b7099so5802546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 02:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739442587; x=1740047387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDH2mAPI1dc+oNCI+jprC1LnlVjmBy3U7iiSh3qJEe0=;
        b=ZMdes+dT4McI7VC/DXnAu/J5LEfke2ApTk0kzFnXBFWv7jJ7R6GL8nvSrBF7vQ+GRP
         UehAY9/ZGwfl+Deh3nM3U8ygvP8quvpRDkC8HAkUbrobfzHsueWUK2GDjnsrTYepgP1X
         17fkS3lUHNElqmf5Jwav+TAh/764fl5T/pEhlv0P+V7zrMvfi2lKGQvrtV7w+kgDsoIk
         TLd+bowX7RHvQywmXNl2UXsMwmeDt1Yc0yCFeXvV/ysQCTGb1UVV6xFR2rsnvo+6/ivQ
         QapZ8YR4A42IMUWFL6PZ46em/jZWhzOASBmROJVHBlrbTWylwr58kPL/fR54JpOE0sKa
         xLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739442587; x=1740047387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDH2mAPI1dc+oNCI+jprC1LnlVjmBy3U7iiSh3qJEe0=;
        b=siX5JE775LSGyNU35saRSpdz1+NJawZ+Xw9xAIcmHLIGKc2Ib+T/B6qI8Zxtuxqctx
         PU+zfT8uhS0/8XsrF0dZT1yCSPBqKk1Zc+ASY2In5pxW0wveIdK8Cmb3zEHzKZD/Ehw+
         Cekb3afM4N4Cyul/GvXd6BHgQe7Gf82jz3M0BaiO03chHG9j0u4gFdhtmrjlvuCfdzxy
         s/1YL/9pnpku4s+j3mdAkN56GnyaxoXAwXyEXlNn3ORHzaL8vkLzXIGTM+rze//BkjYt
         OyGKeKT+ypL6Atovbvbf3BI5px9uOv7lBdm+xpx+vq774Wdh2Mk4GQHbuGOuZ6ysWFK+
         opSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWfUNebkMDijSm9hpKCwGNhOnSKyAlPLAj6HQN8NVzIvaOH9wxAOXr5IVrm35hOszFhTPz+XU/1Mv3HH6X8s/@lists.infradead.org
X-Gm-Message-State: AOJu0YyoSPZZUzQGyJLHGxzHYpKNGSRSuHNP9wuVOiw7doIkjAkUn9s0
	6tTcSVZjO9w9/9yfVt+0O/aUYjE2pgdPMHF6m8+KB1m/iO7OSBjmvoE+yOAUvTCtMik+9spyfkn
	HduBIHJb7NK95DcPR6e9p3LqfzCK8hB9PeV2/
X-Gm-Gg: ASbGnctTdYelsQt+gDIimqU09PydMGQcVYoiLVsBJniszd53dv8qJZTqcHki3ZOVo0N
	f0nbMBlIsOBk/7T/lpK2c8CGPIyVjoNNoINIxK/RKnLlFp7NWN4uQEfeWnw9WgPhYTEPmU+4Brs
	GjEBcOGOkSGZkzAkF/Tzn8N2dpJiA=
X-Google-Smtp-Source: AGHT+IFSuewblnxjgj5HnSVadvSSuC/qdEmqFfvr9Q9PXwmIlT3F19JHVcIhx52HuK/by84c3/uhvL7P/3cNQ+kC7m4=
X-Received: by 2002:a05:6214:f61:b0:6e4:269f:60fe with SMTP id
 6a1803df08f44-6e65bf1a860mr53983996d6.10.1739442587576; Thu, 13 Feb 2025
 02:29:47 -0800 (PST)
MIME-Version: 1.0
References: <20250212182558.2865232-1-maz@kernel.org> <Z618Rd__s7g8xWNP@linux.dev>
In-Reply-To: <Z618Rd__s7g8xWNP@linux.dev>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 13 Feb 2025 11:29:11 +0100
X-Gm-Features: AWEUYZlpJcerqPZRSnhliHHFx2Y2i8XCh23BYfHNVZxojxkfWkjFhjBvxm-zDpI
Message-ID: <CAG_fn=VYXBce+0S7=ZuggNKvn4-b7awWVtq4v9B14U9ivRimkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Assorted vgic fixes for 6.14
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_022949_648962_E41591BF 
X-CRM114-Status: GOOD (  18.79  )
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

On Thu, Feb 13, 2025 at 5:59=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Wed, Feb 12, 2025 at 06:25:56PM +0000, Marc Zyngier wrote:
> > Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
> > all stemming from the fact that the vgic can be initialised or
> > destroyed in parallel with the rest of the guest still being live.
> >
> > Yes, this is annoying.
> >
> > This second version takes a different approach at the problem,
> > plugging the glaring hole we have between vgic creation and private
> > interrupt allocation.
> >
> > Although this is more invasive, I'm more confident about this one than
> > the initial version I posted a week ago.
>
> Much better place now! Here's to the next pile of syzkaller bugs :)
>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
>
> > Alex, I'd very much appreciate your testing on this.
>
> I too would like to see the tires kicked before we pick this up, if it
> isn't too much trouble Alex.

I am on it, will report back today or tomorrow.

