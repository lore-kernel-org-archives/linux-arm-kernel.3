Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01FEC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeAIg/nFoLV4HPdy7uK9Th+eYhFPpG/Q07Hu7di9WW4=; b=yujg/dg0XnFx/qpURl20vGLLTh
	aNAvLG+FPQEGKKfRLzjGWp6xaWxQh64ymdgwUVr3BVV6+OMUg9aqmB9vGS9msJoOJEtxqPKdzcjeE
	h6Ttrq0rlKbQigQe+mZGXYkpjs9oz7K1H57FimmhEm8D4i6bZk8biMxYcAVK2nOIc7JmVpFv1mohJ
	MvHn6Z4/SJfRciuR/g4uf5I5/qZxnwjKv40KQW/sAt4/42xK/u92P1X7CsyhUOVar8blYkRxrUjym
	QNQ2BCdLOo2QfDj0O81nQXMxiaTWGTL+W8OLLuSr25ute6wgMrp1EPhE9gW1Qn7mELD6fJQP2ZpDs
	XmEjFWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2uC-00000008Qij-0903;
	Tue, 21 Jul 2026 05:20:36 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2u9-00000008QiJ-2wpe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784611218; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YXldcrMVRv9AwB2SCKvjY5ah80LK7PLbegwI5zE7S33lG/zc8ZuXYp2ztLQFu3okbgIWEjZ8C2gu7RdVwU4ouOXmT8yjzVQbbASBSbVoJ+3DqzhT+gTuLdSACs+kWCU1SunSKB1qK/J7qwE6V50VdCEJ0Kp/0xd8X42UWk+ffPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784611218; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MeAIg/nFoLV4HPdy7uK9Th+eYhFPpG/Q07Hu7di9WW4=; 
	b=f538/rQMV8XuRF0T0jIM11UM/z50ftLwDvASkGvmQFRmJQu3cwvby3BwzD9xCAa86dPEFvIvg3/NK3Hg1/Nqk7+e1g74CsiWPm1kP1t5takI1wYzUDsn31MRyar80CZ7FaNiPm0QQcysVyR5fqFKCHHOJlSmKnz5Bk8fY48ttjY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784611218;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MeAIg/nFoLV4HPdy7uK9Th+eYhFPpG/Q07Hu7di9WW4=;
	b=ClKTDFa1P9nJhbRjKKoB9/a6FYZyD47U4yY7+fn5Ub2/dgBWFIa+EI02zvx4/U+I
	4JkT+KJA5zRFF9gRqRPPobS/1eBtGpiW/qtuVc4+1roCziNf+cdGN1iBwVRVo62efW/
	3/aUJGqVIsGXJy4hPnl15PvXXXHOTVg1h+6MnYT4=
Received: by mx.zohomail.com with SMTPS id 1784611216000751.5066369487145;
	Mon, 20 Jul 2026 22:20:16 -0700 (PDT)
Message-ID: <38fd4fc1-7aad-464d-9d8c-5667ebcff89f@yoavmoshe.com>
Date: Tue, 21 Jul 2026 07:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nick Desaulniers <ndesaulniers@google.com>,
 Yo'av Moshe <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CAKwvOd=eAC-Mz0kZhbHQMFOY=ba=WXDH6X_Zzh6KGfuq5PmJ4A@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CAKwvOd=eAC-Mz0kZhbHQMFOY=ba=WXDH6X_Zzh6KGfuq5PmJ4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_222033_805512_3D191878 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On 2026-07-20 6:53 PM, Nick Desaulniers wrote:
> 
> Are we able to just put __nocfi on the declaration of
> `imx6_suspend_in_ocram_fn`, rather than bother with a wrapper
> (imx6_suspend_in_ocram)? I don't know if that works, but surely you
> can test that quickly?
Thanks for the suggestion! I tested placing __nocfi directly on the
imx6_suspend_in_ocram_fn variable declaration:

    static void (* __nocfi imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase);

Unfortunately, Clang ignores no_sanitize("cfi") on variable declarations and
emits a compiler warning:

    warning: 'no_sanitize' attribute argument 'cfi' not supported on a
    global variable [-Wignored-attributes]

Because Clang ignores it, it still injects the CFI check at the call site.
I tested this on physical hardware (Kobo Clara HD), and it crashes on suspend.

Best regards,
Yo'av

