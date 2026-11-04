Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUQoG9K5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lbByIN/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cunjgbridz0HQX/g4meLlXFITCROzNjLIFnstKfzcMs=; b=vUQoG9K5ocGkpZ
	N6FI4RyjH70n8LLLEXtCJpVbGo87Tn/Tv89M+4ervwF0E0ms0E3DPWJz60I5qZkoduSToI+TjZ4vk
	5knkEX9+dyzs8MpU/IN6zCZ+FpOYfWm/BNplcXp4DQLgbrPyyBGb+Z20cceqwF8TJS6uUzZkb2R7G
	t93oJ9qv3fbSSWzKSWrVfqVyGls6bRNZIjKsKz5OfTVCHZb5V0iLRNf4z2I0JS8hO4sW6FGcGXWIo
	ZkX372L7d44N/XgAPwkxINF0laeG74kqig6E+8rACONVb+ob49K/htXLx0zZ+xzskki/EZobISWDB
	lyfKnR2MPby/zjqsm3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfbC-00000006Nhg-2xYQ;
	Wed, 04 Nov 2026 18:20:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfbB-00000006NhV-3pg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:20:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8722941FD5;
	Wed,  4 Nov 2026 18:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492111F00919;
	Wed,  4 Nov 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816437;
	bh=cunjgbridz0HQX/g4meLlXFITCROzNjLIFnstKfzcMs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lbByIN/tBhKOZ+yDF1hnj5LKgvWdRsNSLns3C6d+peSaGCr0JRqWklGGkGUjVHn+2
	 n+/9Gu/1YDPSlAyOpjAJ4ugxIadtBNiCGxEDKdc0U5YawxuXeanWWp96w0LfLjFFJ1
	 U2tjY+CkkAzWntIRJsTBHOhZuwVCxhr26j7Vj+7gd1biXFN5epk+mfuLKnGVndOD9n
	 k0ZQG8awfVIz9Z441Ohj8Sul3jCslkwNFcxBbGKfnfQ720n+VOFuMN3zUfgFGnsVX8
	 TFLQucX8AW9ZVgtQQM/OC0fiucYE+lBiM0CM7bH/t9TUCaVnEY6Ry0rPjIZHxWx8u6
	 e/0l4XPDtC7RQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D1BFA26107F2;
	Wed, 04 Nov 2026 18:20:34 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: mxs-saif: unregister the mclk if adding the
 provider fails
From: Mark Brown <broonie@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104024048.1508618-1-vulab@iscas.ac.cn>
References: <20261104024048.1508618-1-vulab@iscas.ac.cn>
Date: Wed, 04 Nov 2026 18:20:25 +0000
Message-Id: <179381642564.2456854.18418832543641508866.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=613; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b6GgQKO53UD7V0ZZNWbS/aJZRzL+2qawICrArLxJPkY=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJelxe9PsXoyaX/bOGTmUFH2AP+SfK+5Tmi+3lyzrYlB
 qwXUjwNOkpYGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR0iuMDCdv/pqjLzCv57BB
 gMePt13s9pppmi1f42SnT+d+qbaStYzhx+qmGvdp8+K+ckk/mPrprcQJ1Y1/5XZ7dNqJcK5PDfv
 IBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> clk_register_divider() registers the mclk, while of_clk_add_provider() only
> stores it as the provider data. If of_clk_add_provider() fails, the clock
> stays registered but no provider refers to it, and the driver has no remove
> callback to release it, so the clock is leaked.
> 
> Unregister the clock on this error path before returning.

>  	ret = of_clk_add_provider(np, of_clk_src_simple_get, clk);
> -	if (ret)
> +	if (ret) {
> +		clk_unregister(clk);

We registered with clk_register_divider(), we should unregister with
clk_unregister_divider().

-- 
Mark Brown <broonie@kernel.org>

