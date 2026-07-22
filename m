Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F25DC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=; b=MKPc+OZyH2AmsWB1mKvFHl3XMY
	vZ6rIouIetY868vw0la7/F2KYsZqbjGTj8MwcjNwO3tQh99RhPyvT7Wcoo57skybGyz9zlWeqOFxJ
	TVOznB/2exE6kCpAI7jT/qrBoIeWz0Nvwt5U19VWCGh9tiQV7v+rYc8IbcZnMcaq6MKmBhr6ft5qF
	StPxY9IcNvl13GAx0MG8dGs84E/3xgGlVuMe36B0ji0hPBc3Lr2m+3fO8uKpxHD9MdWeldfXQum2u
	fOwA8i6PnoCAPkBh8ChUIau/MA2g3ZY4vJWoIanHmGjMtDB16OT3T6JNcsMOaWXN1UZ1rM/otc3CK
	48lIhMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb2B-0000000CVH6-1XXh;
	Wed, 22 Jul 2026 17:47:07 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmb28-0000000CVGA-3QEj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784742411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=msFSU0cXWpZHma5l8e1RgE+vsAuTgCi0+2fZtmz2bkSkCak8aCcWxqaxHD8V+IKirv3a9/hpED5T5hW57OKAVI3q7upgQEOcKgWOBQGfyIaSSwQLYjGX9nak33gsU2VKXDC7FONDF/L36DB+9c96fDvaig4/YinNeSocTDlfzBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784742411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=; 
	b=jCiSzJ7J/PinuTxMmiSZpOKV6gQZKSVlq62LfvVEtNgC62cqMi1ejyraBHr6We+KPolbvQ0CQJD1RSp9S/GA5urWCEbJHsRe59pwqEWuXLMfmbkKpbmkgNZdRoN5aB2pCrxcnxhfsKAESFbgS90Liai9UGH6x3YRoAe5xe8EjvY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yoavmoshe.com;
	spf=pass  smtp.mailfrom=linux@yoavmoshe.com;
	dmarc=pass header.from=<linux@yoavmoshe.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784742410;
	s=zoho; d=yoavmoshe.com; i=linux@yoavmoshe.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XCrzWIHXMTC6vLxmZAYmJB0rVPxCp1X90KZnT66wKo8=;
	b=VNxQAg5BokdoSQOY/uISQM8jI/tpEcYc+vHRmCnkNiGXivOucZT3kDX9OihMBQrj
	aClr0C5SbCXW7DI116JO7imxlKcYTrieUV6uxOkoX9rQW5nRSGnImtzCTIoD6Wr54eE
	552Kz3FvsvldHt5mVRFsb4TkJQ4Wv/dQikURjbP0=
Received: by mx.zohomail.com with SMTPS id 1784742407582988.2620092098992;
	Wed, 22 Jul 2026 10:46:47 -0700 (PDT)
Message-ID: <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com>
Date: Wed, 22 Jul 2026 19:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, Yo'av Moshe <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>,
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
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
 <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Content-Language: en-GB, sv-SE
From: Yo'av Moshe <linux@yoavmoshe.com>
In-Reply-To: <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_104704_917830_F2116E1F 
X-CRM114-Status: UNSURE (   8.44  )
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

On 2026-07-22 5:00 PM, Sami Tolvanen wrote:
> Are relocations applied to this code before the function is copied?
> Because SYM_TYPED_FUNC_START doesn't embed the actual CFI hash in the
> binary, just a reference to a symbol that contains the hash, and it
> relies on the kernel to apply relocations before indirect calls are
> made to the function.
Hi Sami,

AFAICT, kernel relocations are already applied at boot before fncpy()
is called during init.

I think the issue might be a parameter mismatch: in C, the pointer is
declared as taking a parameter `void (*)(void __iomem *)`, but in assembly
`imx6_suspend` has no parameters, so Clang generates two different hashes
for them?

Best regards,
Yo'av

