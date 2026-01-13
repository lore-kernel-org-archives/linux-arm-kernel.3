Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C2BD2F338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgI6znnKNqjv67rui8uZ8o9dmxfy1sWpcCUyA+Jczkk=; b=Nl+4tLzAUV11lPAVhmR+RHcj99
	LMN9sjYGasQcAdOjwPugQS4Nx1NgZK4FS4+uzJgXQJ0fm6KkmvXi5UYxpc5qqM01oDBxBLtZr3sL+
	XJhTIF868/CINzUF9nN21vbBGzVwmN+h+N5TqNYrWQXgqpZlyrRCExgxAdGWLFkyGXpQxkMl9wOtn
	Zw4z3ERtrle/R++EBg0o9ABnmeuq+xWbYGtqft39d2PlFce/42l/NMdZgX+lBel4WTd/CVqmKaJeQ
	LwEqtWS4NUB3mqMt+ufGk/pm5VbWhrTn/Q9azrOSIVtZ6NtV981MdG5LtfRWEFp7Gbmnli4tbUQbz
	1V2A26Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJW-00000007Mux-0bKJ;
	Tue, 13 Jan 2026 15:28:10 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfgJS-00000007Mrl-0TOA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 15:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=SgI6znnKNqjv67rui8uZ8o9dmxfy1sWpcCUyA+Jcz
	kk=; b=cNc169Korl/6TxVMCh5WZOsk774hbswKmcJ5vJBx1lq9fE5e7edW5HPz1
	qguCmN+Afd81EJRCJRF9ihKxps8C1gR/gg7FqPT+HX8LKkG7J2GovSzLpdTOmyxl
	I27CnY0pfJb9kOXGJDYyQESV27HScSyQtq6NWVm+WZuuMByS3dQgK6TLgnb/KnrE
	IP4FiC3dFPqTCe7YMJrVF8zRXjqijVFySYRDTvUYUcE3VQqVsaFZ+TfBcLI76Z7W
	njdsTbkGqHsijVfSIn5mh161Vnj85Hp7iCLiDfigYy8qMesOSRqQigGs4I73vFBK
	U70kO6uFMY2sYsCrXEgQvaumu5NXw==
Received: (qmail 1751517 invoked from network); 13 Jan 2026 16:28:03 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 16:28:03 +0100
X-UD-Smtp-Session: l3s3148p1@VJwxo0ZIgpgujnvx
Date: Tue, 13 Jan 2026 16:28:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWZkgeWwjkcWXPcT@ninjato>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_072806_901601_20E5E91E 
X-CRM114-Status: UNSURE (   9.28  )
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

On Mon, Jan 12, 2026 at 02:46:08PM +0100, Andy Shevchenko wrote:
> A few drivers for I²C host controllers use HZ_PER_GHZ in numeric form.
> This is less readable and prone to subtle mistakes. Instead, introduce
> a well defined constant and use it in the drivers. No functional change
> implied except one case where 64-bit division replaced with 32-bit one.
> 
> Andy Shevchenko (7):
>   units: Add HZ_PER_GHZ
>   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
>   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
>   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
>   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
>   i2c: st: Use HZ_PER_GHZ constant instead of plain number
>   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 

Fine with me:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


