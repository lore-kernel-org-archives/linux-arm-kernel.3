Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F58ACA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 02:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcWCEGr6qgfUpHyZ2bb6dMdRWns/kJMvA5VGMIiIy+k=; b=LerIfNBJ9lYPRD2+wSQDBdj5eo
	h3Bu098C3WxPaVyBvesBGQD/NiXj6QbEopc8scvKhMMUC8tISmH+T861XPU+WG1kBMRgWWEL2EZUy
	pPoDGUZsuYUlFnzUlZDM4KwKW4mH8PfaKhMKEyOara4tJwjBBGzID65AxXWK7Z4iNYXgykoQArq3F
	3Hfkuzv/ZVoodhTePdQ0RF5vr4mFgH7JKcUtfXYV1xGwnJkeBOu4ye8L3QE6hPn7rjc1EPO5/rL1b
	jdlhfPljui5jInzHE02RmiHSNKIVbYDMRky0aQaMTZYvpS9/h/tw6lT/UMGyBZ7G/r102UN1EtQBX
	iCN5AUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuFY-0000000AxNd-37Kl;
	Mon, 01 Sep 2025 02:26:28 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usuCr-0000000AxFK-0Q65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 02:23:42 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cFXjc46qRz9txD;
	Mon,  1 Sep 2025 04:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756693412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KcWCEGr6qgfUpHyZ2bb6dMdRWns/kJMvA5VGMIiIy+k=;
	b=k4AXxQjd1HlPeiobIXEyCI/jPC7mEgm5egg8qPp/VjK6R86RjF6t8LNlyfh9ql1PpYLGtW
	mEkBFKEBM2iVUPUMTi/RdeLkxKky2dGzaccFTRAp0YV9d96tDyleefubHqiKPQKezIg+Wg
	yDiTo/hjW8RMC4wjqjLgCndkAl8nolvlLaDHatyjii6VN4HTaLbKs1ixShzJDI3Gwf1KKN
	numz88zOiVLTBt7KifaXQBkNdq5VjrLk1CcwXrcSDjtsnr05s2LDIDCFsbhYSOP7bKNclB
	EnzWVawgB99hDcjt5Zxsnyn9Ud+rrEAk177S+kaYXIH2mfjUORHeagQJdkm48w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="rTYHesc/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <3a165d77-3e36-4c0d-a193-aa9b27e0d523@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756693410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KcWCEGr6qgfUpHyZ2bb6dMdRWns/kJMvA5VGMIiIy+k=;
	b=rTYHesc/kk5s8Qp5Pvw6sOAA8w/F4tmZAJR0CL+95Pek9MllTDu+g7oK1I4knmFJBA3wiZ
	RiS9S8Y3iUjfPlbm7Rt8KpHRXEgX7zWTW01iae98tu+vYzRScscMKHShrW/H3kG1LtH9Y+
	ZsRZIIZ2BQdqPWxOHYgHTr/iLvwxqrT/yZcLzz5pCfifQj9KoddK2wcz9OXVzWFGO7yNeu
	2eg+NK/qB41UlrZuDIW5zW9IH1sNJdr857AE5YwM9n8rnoM+acR+Sm0E/7zL1nH6CS/4QZ
	mCUoi3k11IUgHZLNCVMGmcv54KacCTXPVhLajiCOnbvnRZfajDuxrGDU0ZBZOw==
Date: Mon, 1 Sep 2025 04:22:58 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v1] dts: arm64: freescale: move imx9*-clock.h
 imx9*-power.h into dt-bindings
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 E Shattow <e@freeshell.de>
References: <20250831200516.522179-1-e@freeshell.de>
 <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250901032203.GA393@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 348a3e4ca199d13e5ef
X-MBO-RS-META: drwo57x9gf3fnmbxbskh9qyqt8zpddsz
X-Rspamd-Queue-Id: 4cFXjc46qRz9txD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_192341_282268_D1CB31A9 
X-CRM114-Status: UNSURE (   8.64  )
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

On 9/1/25 5:22 AM, Peng Fan wrote:
> On Sun, Aug 31, 2025 at 01:04:45PM -0700, E Shattow wrote:
>> Move imx9*-{clock,power}.h headers into
>> include/dt-bindings/{clock,power}/ and fix up the DTs
> 
> No. The files should be under arch/arm64/boot/dts/freescale/
Why ? Linux already has include/dt-bindings/clock/ and 
include/dt-bindings/power directories for exactly those headers , why 
did iMX9 suddenly start conflating them into arch/arm64/boot/dts/freescale ?

