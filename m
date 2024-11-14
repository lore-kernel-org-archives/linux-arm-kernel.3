Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AF7D6A22D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9tlQ6UIV80cZmXaqxhISxlCRaJ5DdpbEU69bjf7t98=; b=ANtAfrhmc/Xp0Uipe/vWUKMexG
	O3zrpiJiw8aLVr5dPsCyS5qy0VEHendmAo8Eq4nlxUMQUptpMpHB59aw3Nce3ce8PRWRXWkRHx/94
	n8oNE8R0blcu9FldtOwZCorVZ7ht4jetB9Ull1ErcyoQLZQJSU4FpHAKRtd/ZI6X7AGRkH2sLLy82
	jl2v3C9uPzHnqdl8Wp0TlRkC5uLIoYa4yzdUtgz/W6AV4ueYPCDdqh4MU+SEdLFTk7E3trFF4WbHz
	AYugh5D3eY/hNjt8fW/AFiY8ue6ikRpqyeG72zPaWg9NqtnegomV5LSyyO7dvHGcQ1xYQZwDthr2Y
	qdsOVmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBh44-00000000qdd-0vD3;
	Thu, 14 Nov 2024 21:07:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgzE-00000000pjO-40zg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B6AD5C6133;
	Thu, 14 Nov 2024 21:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56ECC4CECD;
	Thu, 14 Nov 2024 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618164;
	bh=x9tlQ6UIV80cZmXaqxhISxlCRaJ5DdpbEU69bjf7t98=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tNv3hNkleQ+UI2yJpVF7OzzSWX1l6tzUvXfSYXQrTj/lqBFiSCH6l44UQrSIqUPzz
	 VJ52YNHQCD1QYZCINueM3Hj6YqUmTgvcia2TfZHpBF8SHfl2kOBU8FEPhRu5HDMyn8
	 JIlcisH0iJMniZ+C2h3zd+9HQwMKmhlCCxshdeedLms635oxJR6marfHiSziz63Ikr
	 dWp6tri+dH+YMfqmVDsp6ZQOrK2bBSKiWoEaGdxjoYJUHv6oH0BURysoTR9QhcMjEb
	 pqFA4wcgf6MORFRUM/DtyXtt+gWWewoxVrMAbVXIxwdSj2gcZh/IOPDB8IS/IlrU0M
	 BRBk1W/dPB44Q==
Message-ID: <b59b3c8bd47e09a29da3b1f65eb949a2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 7/7] clk: en7523: map io region in a single block
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130245_035974_0008B612 
X-CRM114-Status: UNSURE (   6.95  )
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:54)
> Map all clock-controller memory region in a single block.
> This patch does not introduce any backward incompatibility since the dts
> for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

