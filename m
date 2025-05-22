Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBECC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEvqtXUoRY2MtYTRcX5uBf01lX2zWH/6+T3j+WmGUyc=; b=T0Of6KayYcy7y3ED9DH0PqImWq
	zNilfS/LYBmPRHCbhvQ5Xn+SnKnhRSfgj78FDaYVFrxb+R9cZEBJJZ7jc2SxkitZMixPK6OJCWyLX
	mRi23mS4Hr4HSmYnrpaVDs5jCSH5DEBkB6mcdrWicMi6TkqkXWaWYNHxEgxWZcmfahkq9nofkNXSH
	yPs8hsrukLwMwE7hG6/9Qu/9NQwx0oCmK8XPF37LCQJdf2VCMGx4pTVbmasUt8WnXU/MFZdO+rWlM
	+O4f686HDtQF1qMREUAZuxYfLDx6E36hNxhABRvsOT3fmH4VE5fYZgR/Omu+6N4Q4Nwc9HKjFB98h
	ItL2NTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2p5-00000000dEG-2NUm;
	Thu, 22 May 2025 10:06:47 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2mz-00000000cfK-1NMI;
	Thu, 22 May 2025 10:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BEvqtXUoRY2MtYTRcX5uBf01lX2zWH/6+T3j+WmGUyc=;
	t=1747908275; x=1749117875; b=aRXyepbh7byJDomKoID211K8ZbaKbU9bicpNTQys7CY0mtT
	CrNWsYmrV7aDE/+6BNmN8VjTH9wol/U3TRO8FOrQ7fduMcYz3vsJIGhPg8CVUTeJ7jVybACKdy2UV
	uAn+FoohLtHErvtS4v+G9wti4XjO2YudyG/UxQGJ4E1vTgdMsM+HGv9LnJkCHMQNjZDLCeNabNANG
	4qiiKHrNP38JoZhieHoh5Ifq5Iyd9fCuAoYOSqfkByRk8/fb2NI09m2cx62Hvj0nkj/GzMBSC6afp
	REzlJdFbyvtCaja3Z1ogXrGuQn1Jf8VgQn+kgsYiBKmeBgVg2s1byO3Bw0jfqdfg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uI2mm-0000000GdCj-3E2p;
	Thu, 22 May 2025 12:04:25 +0200
Message-ID: <3fa189cfc0a52572008590efbf5f4ad05c81dbc6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 	festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Date: Thu, 22 May 2025 12:04:23 +0200
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
	 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_030437_374970_ACC64920 
X-CRM114-Status: UNSURE (   8.35  )
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

On Thu, 2025-05-22 at 13:02 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.

> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>  		if (of_device_is_compatible(np, "i2sbus") ||
>  		    of_device_is_compatible(np, "i2s-modem")) {
>  			got +=3D i2sbus_add_dev(dev, control, np);

Given the structure of this code, this either fixes a leak, or is wrong.
I really don't know which of those two it is, it's been decades, but
either way it's not a change that simply "simplif[ies] the code".

johannes

