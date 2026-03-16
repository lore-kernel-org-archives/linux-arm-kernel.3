Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D7EF506D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29u/YwWl2Hl+YGd7rzZ2lo2oPDlodQX9sQOsuio7m4U=; b=GDQ4MEAhbrDE+PRwOE8C6SMc7n
	8SMw43vOJpRvKv8LvuCUEhyy2CSBVbuiC3mtMOwx2FT4pUmfqNSoNxotpEKqLwf1H/E81SSRcvh7K
	2bu3Qd0vvmym36Sr/7p5fmYwDM2QQ+t3bNxP3ty/rgeh2UaJrJzwD0/LlTf62yDAkaZhWHQPghJpp
	QnwLA17U0lzXsqL+PTtRiRWb7QPumLU6D/Slvj/ggrN0fCOkgdzaiFXpFtwSh/X/R4RZtL7t/i1Wn
	6NKzGgi0r5uMxa7VbdGPevNz31AfYDkrTbzQCJSRzoW/COmh4/a+WL5ZN8oJIHY6+DlKSkUFLqUEp
	uD+oQDsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28J2-000000046Om-2nTk;
	Mon, 16 Mar 2026 13:48:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28J1-000000046OT-2DYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF63060142
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD0BC2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668906;
	bh=29u/YwWl2Hl+YGd7rzZ2lo2oPDlodQX9sQOsuio7m4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oNZ5VjQOOeLfTyF61rXT1OTdG9OWuy2s7kYKcf+oY2qj7QyW2T2Q55GULG1rA2ix6
	 XhKlIXbcGaM+FGloQob2PDt33JD9LXxiihJIqYTMPSSex/qUajvxtjuaep5F8l3I9a
	 aJX9WQ2fWm9JtxDTS6+GO+XqNhA94ojNDzH09wogrQbNgxUEbiNf9C2kbcsJRz4ctW
	 3AS3k25DWKvEI1DlbQmxYeAO8hY7TYIFmuf6aplmid/ai/JmvP0YXrnkZge3BuZU6G
	 ssoR1/f25c+MdSx5czpcjnPTZoj7UzzZkOLyxtw1vfmRu6CHbtoVMkuFhNy74qOyrh
	 ioEvMsYDRTzLg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a5ad7cc52so4485687b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 06:48:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw9iTT0ulA48YvyxEYFrPQa8fTIZr+c4EQRK+H5B32SH/Wi/v7VlZWxHs2THpr+jHDgrBTcHV5bilu57UnwjSX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi57MUWctZ3ioOrKYEi/I59NMfTEbJaNcHBysRs6Z72jQPHdl/
	FysNUNP6+3UP0U4jROX6L01W7bnDEEB+FkWsBjVSnFbyG7h4ecNiiuojtjDKbzU4vu+qdZJpzlt
	2fz+CiQ/AgpJZ2Bj1gtvpoMFOvj2NCN8=
X-Received: by 2002:a05:690c:385:b0:799:2b4c:1d49 with SMTP id
 00721157ae682-79a1c17a01fmr136295397b3.36.1773668905744; Mon, 16 Mar 2026
 06:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-3-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-3-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:48:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLmv8Soi70pJefMg1EcQ_6rR2HyYPzSd-=aeTH8S=GGZUg@mail.gmail.com>
X-Gm-Features: AaiRm51g5iKD4Fcca-uqHDY_L5ulx_Os5N5cONdMsdXj4A_yltz8H03U9SZCBfo
Message-ID: <CAD++jLmv8Soi70pJefMg1EcQ_6rR2HyYPzSd-=aeTH8S=GGZUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] pinctrl: pinconf-generic: Add properties 'input-voltage-microvolt'
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
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

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add a new generic pin configuration parameter PIN_CONFIG_INPUT_VOLTAGE_UV=
.
> This parameter is used to specify the input voltage level of a pin in
> microvolts, which corresponds to the 'input-voltage-microvolt' property
> in Device Tree.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

