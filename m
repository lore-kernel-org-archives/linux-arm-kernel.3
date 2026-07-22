Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E221C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQdJhIsoV9JuLr/1dkO0z+WM7z+OAgZ2kqVl0g9tzyk=; b=JNybMYm8AP7LfXyBxdFq9iTU27
	LLVbqAgaCEUjmUUzBoYUakMZpaCPQyT9ZKCHZdZYB1t51e81UlzDUQdMkQXGh5YSqQOwU0sEO45Fs
	SNXHFcdagXyPTZ9PNdc46OZKFELynfD8sKGUvnkWRuEpZBh09a55vx8PWxMzOmJ6ZNyW5BQvTf4B9
	5cbT1YUXLpIoSVCycBA5QdrCQDg2weIan0H7dboP1gXCd8FZmZ5pvcbCdFUwfsGL7Eu108jLlaWs+
	LQhSmDGcpVs6IbLe2vVmxynjolpsmxwuZ3HwNUKoURT2bPYxZQXoe8Y0qb3aZEg2FB73PO5s0rsfc
	kmLNzatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWSm-0000000Bnye-3MaC;
	Wed, 22 Jul 2026 12:54:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWSk-0000000BnyF-4A8i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:54:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784724840; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OabnKG3HRHohSmn1I6Aafm+nQlHcJwu/3SXwQJJVKzk8P7/M6HcHvBqEOkYlkT2eOtvyzE9s8KzsyRs4bIv0pZPEMDHiMJa8ZS9Lc4PPIFsgEKUzBLWgw+EVToBZISgsufIlrLn3FJxr+CQQmlH1KdJzNPiWvQ1pP+6lLEbnma0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784724840; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FQdJhIsoV9JuLr/1dkO0z+WM7z+OAgZ2kqVl0g9tzyk=; 
	b=nXuH92L+Qc5i72ZVLXq2YydKP2Rkp3KRCW30RxAciHUmZiwc08eDq4uuN/0q/1MuV4S3GVb7bnwB1K+vpCWwYRAHOlY64pRBGb5FRFvBlifBGfWvcRuUCGHkxzxMKswLeMHEOjiwJpZpB5my8iflmLjiF/LESyYooOXBvA8KWR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784724840;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FQdJhIsoV9JuLr/1dkO0z+WM7z+OAgZ2kqVl0g9tzyk=;
	b=BftG2pab8i4ALZLaaOZtPiPoUwKgJnO+YZHtLYMgCXqyxzL6oGNQ1AiCiSJcWbP3
	5ITRvP8B28usUg4oo+0QAFypqEW2vLV5RbQ6GOFTGj0P8arWlodIWUQVVE/zX+Lar/6
	moydj4DfxPBlFhqetQ7g990tJinJjSGsWMfH+h/k=
Received: by mx.zohomail.com with SMTPS id 178472481504875.2682977610848;
	Wed, 22 Jul 2026 05:53:35 -0700 (PDT)
Message-ID: <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
Date: Wed, 22 Jul 2026 14:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Nathan Chancellor <nathan@kernel.org>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718111340.159896-1-linux@yoavmoshe.com>
 <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com>
 <20260721180950.GA3684684@ax162>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <20260721180950.GA3684684@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_055415_095983_41EA2733 
X-CRM114-Status: UNSURE (   9.43  )
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

On 2026-07-21 8:09 PM, Nathan Chancellor wrote:
> Does using SYM_TYPED_FUNC_START for imx6_suspend() make that work?
> Something like this builds fine for me and I see
> __kcfi_typeid_imx6_suspend generated by Clang.
Hi Nathan,

Thanks for the suggestion!

Unfortunately my physical board died, so I couldn't test this on hardware.
However, I gave your patch a try under QEMU emulation (with CONFIG_CFI=y
and copying the 4-byte hash into OCRAM before fncpy), and it still
triggered a CFI panic when suspending:

    __und_svc_finish from imx6q_suspend_finish+0x78/0xd0

It seems like the hash generated for assembly doesn't match what the C code
expects at the call site.

Best regards,
Yo'av

