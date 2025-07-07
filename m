Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEAC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53uTP48U9raYU1xARbwn++MyD2R9IcpM1aiz9h61VBM=; b=rb+lRJHeRu9cOv1OlLPn7B2kKF
	gvFixV4WCpEKclX1I9198XhjgWSoURvnd44v96zElo+RP7Qg50ro/LFfuQdFKe7BvHdibHHgcvbkS
	Or4n+udPs2wpdiqKIHw5bKyzkG1WM1wo7ANcDrN+UnRGA1ubl/Xy6MqcZJUN+82cK1wBbpa07mXhe
	g8SfTCmpVMfCa8JYR5Fj2yVdV7Y1hrkhkE8AXGC/vrjsB+AaToWHpo8ZS9MqqkdRDUnCG8Wj6v/js
	M/uIYDxrHR0jcI1+f6DYxaT80wsaqG/MOYdrz/rxdsX48VMVBUlx4tiOeSt91BjWEXAuhvqU9ZUJp
	hWb6J2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj1Z-000000028VA-3GHg;
	Mon, 07 Jul 2025 10:24:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiQx-000000021py-2bJi;
	Mon, 07 Jul 2025 09:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881605;
	bh=X9OPy8lPBzx5zXYW1HynhmA/aOJsEytUlCoR4bDLob4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ee/ZizGVMxKrUWe6P3Z0136YBYCER/oyjhC8ElcUR4/ulQ5Qf8XGLyy0gSoAxVrIT
	 wIC2PBM/BjmesI2cnk98ro8eY0tJAHxmgzy/yqx766uAWfo/Wk2KmpkkiQy0XVBcXB
	 9vuqrCr1nPPnMWjTaTf90rEQ1UWgc7BQiyhLN/TNezFNTiFAeMZIkPyHX/ulF1Xjg1
	 WBX0lYxeNTm+ndxkmsU/O3mVsRPYFFl+xaY1nuyi0XXp4SYlndlvbcRRNLOk6ZaqHm
	 fyLUflZUlQvzttDyteHhvqDqI9XTESRoKXV9spY5VrPudXt20VOwUpC0RfW8ewANLP
	 sYafYBWj6oDFw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 025FE17E07C9;
	Mon,  7 Jul 2025 11:46:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>, Max Shevchenko <wctrl@proton.me>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
Subject: Re: (subset) [PATCH v4 00/11] ARM: Add support for MediaTek MT6572
 SoC
Message-Id: <175188160494.76260.12978644604061063764.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:46:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_024647_837293_B782E434 
X-CRM114-Status: UNSURE (   9.06  )
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

On Wed, 02 Jul 2025 13:50:37 +0300, Max Shevchenko wrote:
> This series of patches adds support for the MT6572 SoC and
> the JTY D101 tablet and Lenovo A369i smartphone based on it.
> 
> 

Applied to v6.16-next/arm32, thanks!

[07/11] ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
        commit: a46ae3392aad15cc1b13fb098515e457934bfbff
[08/11] ARM: mediatek: add MT6572 smp bring up code
        commit: 9ed85e0747c0ef14d1867035fc05e3882343597e

Cheers,
Angelo



