Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D494D4336D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er6mpWlY3aVnjbXQxhMUSEL8op6AP2WTIDJ71e3Q6Ms=; b=rE2/hOBPfGvWIt7vZwlszrJvqf
	CKHQnPadNViprHeMelTJetCy290eSptQSrWqUvQNLE98BwRRHiz1xD/FCL1+RE0BqD1OaF6ulEaTq
	Ri3m07T9Sm4jwHso89DgTeq5V9CgnybXL+VqaOg4EyCNM4MUhdwXuuaGPYnuaj8M75V3EhC+m7iIZ
	Tf8JM1arMqfCE8ve9556MZeOeKemK+RjEqaIxdVim6BgfJWTXdC30iv+VRLv5Bs1RxqicbvxdccvX
	5++LqDxygF6EcuAo93iA0eOzm9A6MqlFV8rXRQiN1DIdWOrwtyyG/G2iwxMm/a7V50ulkWQggCo5I
	ljnTzN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94TZ-00000007S0U-07Q1;
	Thu, 07 Nov 2024 15:31:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94P8-00000007RHx-3u4g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51991A447A2;
	Thu,  7 Nov 2024 15:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1410C4CECC;
	Thu,  7 Nov 2024 15:26:37 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 163E25FB46;
	Thu,  7 Nov 2024 23:26:35 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Shoji Keita <awaittrot@shjk.jp>, Icenowy Zheng <icenowy@aosc.io>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
References: <20240908214718.36316-1-andrej.skvortzov@gmail.com>
Subject: Re: [PATCH 0/2] Fix magnetometers on PinePhone
Message-Id: <173099319508.2335414.4545070931289341462.b4-ty@csie.org>
Date: Thu, 07 Nov 2024 23:26:35 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_072639_072844_B11F2D9E 
X-CRM114-Status: UNSURE (   7.13  )
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

On Mon, 09 Sep 2024 00:47:16 +0300, Andrey Skvortsov wrote:
> Introduce support for alternative magnetometer (AF8133J) used on new
> batches of PinePhones and define mount-matrix for both magnetometers.
> 
> Icenowy Zheng (1):
>   arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
> 
> Shoji Keita (1):
>   arm64: dts: sun50i-a64-pinephone: Add mount-matrix for PinePhone
>     magnetometers
> 
> [...]

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/2] arm64: dts: sun50i-a64-pinephone: Add AF8133J to PinePhone
      commit: 193b199a925b04e2d9bc9dde8bb63f6d55483b7d
[2/2] arm64: dts: sun50i-a64-pinephone: Add mount-matrix for PinePhone magnetometers
      commit: 844c35cea6b2d36608c3026c7d29a4f5350b7ad9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


