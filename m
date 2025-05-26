Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D991C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=; b=Fmcz5rddSpmlztksjLcX4iNQWp
	qCjfmTLFczNdGzmajseaY+e4JxEFl6SFqwQzmdhShtc5A0Dr+4mRqXesIav8czoubn4B/2JenuogW
	qRsITXTpiOXRtzlRQBykjmMtBhO5kSfWWU8LvQ5KIH2YMSfhLZZ1O4KLn/VffBwiB9MaTas/S0e2R
	HJViFRf8Oaoc+NnNEXobVQA/sU4bUifYIH+QU/QyRnWVUFAobgDcB4Mwkk4fJ9doP2JTgo1zLpUlD
	7Ltwf/p01+TGTuXjgIuO88wkLd069tQvZ+CddgsnC2GJOrq+gqgpGcMjAOupbdJGWcz1skKXHIhVT
	8Eoq4oaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJT2n-00000008N1c-1o2C;
	Mon, 26 May 2025 08:18:49 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSxu-00000008MKO-2u79;
	Mon, 26 May 2025 08:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=;
	t=1748247226; x=1749456826; b=iCPb/AcHDU6xG2x4fpv6MMjLVYp219VtBpAxWy4oXe75HWE
	n3V4EhYUOqImhZx0CH9FVoqMBysskPOjz5H12PUByFqzmrd0mZQ7wI5mKG1uYL7MW5ylnHuoU16Q7
	o/n8foKno8h0UK6qJ1PLN/AyJb+wRmw9TyyFLl/MD5Qh9mRT8qrxrcju7sEcUD2NOM973DbrJtKgu
	AUUbYpVHxltjFXq+7RVjCj4HUxzOFA2A4pfDvML4Fjw2qvdu/u8l8XtoDvQ2qolb0xmt4lfGhwC1+
	aq2c3uGUz+XPZ1zQH/7CNJPSYBQxA3WyBDOZmVHLgUSH1QJ31arq88CmDTqYksXA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJSxj-0000000DOyV-1Dst;
	Mon, 26 May 2025 10:13:35 +0200
Message-ID: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex <perex@perex.cz>, tiwai
 <tiwai@suse.com>,  "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Mon, 26 May 2025 10:13:33 +0200
In-Reply-To: <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_011346_729964_3693B560 
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

On Mon, 2025-05-26 at 16:12 +0800, Ai Chao wrote:
> Hi Johannes:
>=20
> > > "simplifies the code" is no need to callof_node_put() .
> > Fair. Except that's not what you _actually_ changed here. Like I said,
> > either it's buggy before or after.
> >=20
> In the function i2sbus_probe, it not return a struct device_node, so , I=
=20
> think function for_each_child_of_node_scoped is better than=20
> for_each_child_of_node.

You still haven't explained why it's even correct.

johannes

