Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7AAD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwN4cwTnAPlPtkSz3NLwx/yvFwHVt6coOVjBwRs4jiM=; b=Tx1SeNBveQ2Nio5tRVs7gEOeQt
	AL8iuVxtFWxg22k80dLRLdcsK2SyWA8DloWBH/D46jKOukmQ9iJ3eCaedxD09k05qxim//wYUMm+Q
	OMGY99YpIZnr1KnLWVP1j2G2TQ16Kr72iBPhc8v6GWcYUPfVFVi2Q5rs461wjysv3+qfmHkEMYfl9
	zIRnUlmMxTw7nbikAZjQ8FGK3i/wGRE9Xy/31jhebbb3UUfKSY309Tr1DaOc3zVZ3kXz98+OIA9Qi
	OKpkoX6NCJztHdYxFpE6Y2YwnVaC5FjINJBjhEu38lbDU2mUZ3nwQWYNyS9hOrYptC5WiRPq82m6Z
	d6OxK5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEgB-00000003oDM-04aS;
	Mon, 29 Dec 2025 14:57:03 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEg8-00000003oCn-07zH;
	Mon, 29 Dec 2025 14:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qwN4cwTnAPlPtkSz3NLwx/yvFwHVt6coOVjBwRs4jiM=; b=gCFWJBPkBhFv2udi7B89Sig82A
	wHMkq9WQSs9vdZ1XEGFMxBnv1FPKIjEdrbpowyYD3GHgXwf5GdNtrUyaHeTTBitWcj7cwYH6s9rFs
	EMpdunRSKbsa4IsUnLwEeNmrL/rANVOBM+LkfHi72ySv3vDeQsHwsjyrcMoykNfOZLUkqlpvz0T5+
	EeqPDFMt1nYpzK/HliPT+Zmb3AUUdcZEQ7U0VDedvbdgzJ6/ZAC+nRDzM9LzgJj2IMq6MKNMHZcGc
	GmWX3HGsB007WcYeZgdRNYmAlLtw3vcibnsgUZyDrH8H5Au/xMnXTrDd+YSP8UAELSpy1Hd8NzFOD
	fcESzGPw==;
Date: Mon, 29 Dec 2025 15:54:27 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 05/12] i2c: omap: set device parent and of_node through
 the adapter struct
Message-ID: <20251229155427.2ffcf120@kemnade.info>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
	<20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_065700_104361_66CCF54C 
X-CRM114-Status: UNSURE (   6.68  )
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

On Tue, 23 Dec 2025 11:04:43 +0100
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:

> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

