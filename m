Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D89EA8121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=; b=Ntq/w+K5vQUI5BcRqhJodjsnkH
	6P+IGZ9ZLGVhsWE+DpxTREC7ZDYCaxGR5Tg4Fhf6sfVS8Mhss2XX7Gb3GJUNgLzzXZzCXKbfRXlrG
	OuhvYnrO9y/fnL22EGx51yr9Ml587TGeGgLnwrymk1Z27l/n2BwrO+ME58Jep6KW25HWpB1SP4HKa
	6/PsoXlppw5DnSv/XI7Xe6yqKuqj1wgB51iuhRyELz4S/dkC9F30GowYFcrovJAWzlngbG5oMF1LH
	a7W3YUFLb8fk9pMJnhaEW5+gd9ehC/hUaWsSpXyXZnak88pNza1rFKpZk70IY4EnchZLOBP5siWUL
	AeQ7EUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoaz-0000000H2Zi-3Pz1;
	Tue, 10 Feb 2026 14:20:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoax-0000000H2ZJ-47Ko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76F75438F4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565E1C116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733201;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bh+T3j3iTWYfAVEB+OpSnFuBl7FTl9X1t7PcutsI3Q/B/GDgJjifvoWAJ2+gzXief
	 vJM69hMd4FvOnqcEd/FihbVtkdycwE4EHu48Jdhmje8UVA9ZZR4ed2dKs/zBt0Aad3
	 EUfyt0KYattmvr31qg31g04Nw+Dj2/tuYCsYtUsyoV3hOTjOglRokyfrNdFqIIEArr
	 STv26k3KsuZ9uE2e2ike9TJflX4NT3S2CcOLWAvjMKrkuicUIFFfAS+n65KdL4I/aw
	 PDcczD7NL3yo8+pSQ+ChJ37Emt7J+jZMysH34NuQzCmXoIxhUVlIWBndFw4hhh9SKC
	 UhN0jo0iwG0sw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-649dbff9727so3576984d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 06:20:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0isuER1RujeF3tmmoY06VXSgC8d17JF3tBfUSdTG9rEiHGajYVrSWw7TZXT3yI5dBYFx/R7B/6gm4YuS0t1M7@lists.infradead.org
X-Gm-Message-State: AOJu0YywV3TzgUHQbhkhGWSyTZsIzV6SNGFujBkx1k6jwBXcHLjWrJEw
	CYZIStnBBQAmBoMfT2oS70Cwd/QNLUabHQHwGTMab+2GX5cGV6fBWX+ZeMVliKkmn15a2KNihTS
	I0EgdPIPyg5FV1voU8/EJfrsOJBUjO6k=
X-Received: by 2002:a05:690e:150b:b0:649:3e3d:327 with SMTP id
 956f58d0204a3-649f1eb3d66mr13590998d50.40.1770733200730; Tue, 10 Feb 2026
 06:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Feb 2026 15:19:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
X-Gm-Features: AZwV_QjNXHFtXvNMF9TF_TvJtup1g1L8Eh_OBP9sLN0HF7Jz7nHdNO-AVIyYB00
Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_062004_039819_0F49081E 
X-CRM114-Status: GOOD (  10.25  )
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

On Tue, Feb 10, 2026 at 12:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

[Page Mathieu who I think wrote this driver]

> As stated in patch 1, the U8500 driver is clearly unused for more than a
> decade. Removing it allows us to remove generic platform_data support.
> Both removals make the upcoming refactoring (headers and lock
> allocation) in the hwspinlock subsystem easier.

Fair enough, these hwsemaphores were only used when communicating
with two DSPs that we never managed to support upstream.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

