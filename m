Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E377CCEE339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3GmwJD2kwLuyDqNWP8yOBJ/E1a+4fbbXeZpSCL5F2s=; b=zSpew3ds6rcORItyMz3ZIMk5Ek
	LDufOEQWZkYZ3LOZ3JNniu9V2Zk2mK4EkNgR2w6ImHztjfZixlgLbVkJZ120ZpMaRrhv+jMzammeG
	uFEayYn/1R0mibAav5nRvfBxo/e3WHG9lr/ytdbwtpnh2nCtAPogoh6BFKKKnd1aV1OR4i1zfE2Mj
	R4c2swUqoXrhsylrGbLKP9cw8SRnFpsrEMSZyJIEGBvruQoLa7pTb5v3wSApX/l+6PhlaKiD/X99U
	G2pA76Kv0ckiWlMdYxnJUCToaMqPLjn63H6PT48QRG1oG7Ds1chcJ/sCKL9/f2yrkLn3qowUReQhg
	ObpxYkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOSM-00000000iM5-1nle;
	Tue, 18 Nov 2025 16:21:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOSK-00000000iKb-1mLZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:21:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B716605F5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 16:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4AFC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763482882;
	bh=I3GmwJD2kwLuyDqNWP8yOBJ/E1a+4fbbXeZpSCL5F2s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nUHQZY3V3VOoSssclzRTF+UTp+AicH0H4nSVV+RCFKhSYbdAPJNavKiDn/uBtGvzd
	 9SO0QTKC8T+OtJdId4QKOKf1TmLpeaNz7E+Qdy+NvD+5ITjcJ8WqBE8NAyM6purYrs
	 BcjJs5Li4SQwdu7qFqU8ogvmRH3l/Ro/jWfozURlGwtp6GS984HlyK7AbftkKhlhg5
	 ZQRR/UVj4UFm1nqWqI8P/hFxo8oguf2kriU1gjdiJ0XFlv7ugf3HywohCrw0Kg+mbD
	 9i0sz1tPWXKFwutW7CiJFZumUqhbM/BhVXjBRDa0rq5c7XJnSVs9mgInsbxdPX4FfY
	 1BRWx+f8LZ10g==
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-44fffff5f73so3244857b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:21:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9iMOfjEpIJit9Mi+KTyOIkXF72ZAXZHVzJARdT7493fjczOL+USOkR4kAZ/UjLTo90nerSSYWvkr5cAvRX7SO@lists.infradead.org
X-Gm-Message-State: AOJu0YzTLyoklOG5XcyKTH9+HXGLa8dQ1ia0Hc0+9LgTurZoeq5EOmln
	b8/wRElQN/sCmdVtgfBAqPy5Bw6lfOzivMer7R627JwUGReAVZezRvV1Pa2cjkeSznoDsTHlNlL
	C9TWtRH94Tq9GP/zsdb7Ma6iwVzdC/Vw=
X-Google-Smtp-Source: AGHT+IFMJZjgP5aklepY9KBnBO8QtoifwrcGOQsz6jIsKT+WEbmuM8xcx2+qAo5tlILgNyckS9CtPcgSWVBdgHqsBXg=
X-Received: by 2002:a05:6808:30a4:b0:44f:9b51:2256 with SMTP id
 5614622812f47-450ee0ecf0bmr34581b6e.10.1763482879506; Tue, 18 Nov 2025
 08:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20251117170014.4113754-1-ben.horgan@arm.com> <20251117170014.4113754-9-ben.horgan@arm.com>
 <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com> <aRybF5PV_N2ODeiZ@arm.com>
In-Reply-To: <aRybF5PV_N2ODeiZ@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 18 Nov 2025 17:21:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jA5vWi3JFRcCMFmvpWSu8jFT-jOWvSNLt59FeqKEk3iA@mail.gmail.com>
X-Gm-Features: AWmQ_blEnEFTWdXS_gsLWB3lwSNDrraXvdDy_6ijwAdVXqjVWMksmXmFIQQ5JAo
Message-ID: <CAJZ5v0jA5vWi3JFRcCMFmvpWSu8jFT-jOWvSNLt59FeqKEk3iA@mail.gmail.com>
Subject: Re: [PATCH v5 08/34] ACPI: Define acpi_put_table cleanup handler and
 acpi_get_table_ret() helper
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com, 
	amitsinght@marvell.com, baisheng.gao@unisoc.com, 
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com, 
	carl@os.amperecomputing.com, dakr@kernel.org, dave.martin@arm.com, 
	david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com, 
	gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com, 
	jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com, 
	lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com, 
	robh@kernel.org, rohit.mathew@arm.com, scott@os.amperecomputing.com, 
	sdonthineni@nvidia.com, sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, 
	will@kernel.org, xhao@linux.alibaba.com, 
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng <zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Catalin,

On Tue, Nov 18, 2025 at 5:13=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> Hi Rafael,
>
> On Mon, Nov 17, 2025 at 08:46:52PM +0100, Rafael J. Wysocki wrote:
> > On Mon, Nov 17, 2025 at 6:01=E2=80=AFPM Ben Horgan <ben.horgan@arm.com>=
 wrote:
> > > +static inline struct acpi_table_header *acpi_get_table_ret(char *sig=
nature, u32 instance)
> >
> > Maybe call this acpi_get_table_pointer() ?
>
> Would you have time to look at the other ACPI patches in the series? If
> you are ok with them, happy to go in via the arm64 tree? Or we can put
> them on a common branch if there are conflicts with your tree.

I think that this is the only one touching ACPI code outside the MPAM
and PPTT parsers, and the other patches in the series are fine with
me.

Please feel free to take the entire lot.

Thanks!

