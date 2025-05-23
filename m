Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0BC54F2E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=; b=Hhc9vGfqPb/ue6KUBYAvMbekk/
	A8XSH3ZTM+vHxAXa3TFkREFxz4adkjonUS39wk0oz9d2EFEoC+bYgJfUywl28Q5B1BsTNV7u4A50c
	7BPA1MJiWl0/3oRclWp/iviYJ6W54j7HNRsnXRHMSigm1dwD/jINaI2fZ2NrC0i8eOyOWG8QhpwLN
	Dk0IdeCJVYF6gytgKT5J9RtAmOv7ubofsug6PbU5ljIAsWx6E2cr6MImWMHt0/8MeeDxeXXApanZX
	st4g8Gv10huWVW2M6dh/5uLivUQrIlj04JC6rXp5R31FVZd6EaOQCqaN4BQOEyxOYQZHj20j5PPmq
	n1/Shibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPrU-00000003cjE-2D4j;
	Fri, 23 May 2025 10:42:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPpK-00000003cWq-2OcI;
	Fri, 23 May 2025 10:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=K2JQO+uYU43rONsrKzctsDigqQZ79oxfKv9WnQ4M8rs=;
	t=1747996831; x=1749206431; b=hZ7dZRInJ/Ma+5SrzqJlypknwP1EN0GbvkfKWYqdFNMwGov
	guj66rx83b2i/Gt78g869SwRDEEqsZhotv0huSnTMZ/pt9NuMMb8GzXbDnplODz9+3viG6KScQN4D
	SFLCkJqpMdK6wz8Xv80G/9sXBgGu00waf88Bw9fl0p2bFWXK8u0EDuqeuKWu4HXiGr1vJLMhlmJ2/
	s6IzlQpzW1vmHoaE1cp83uszya6t2gSxKuNsEpvl/2c/aNJFze9Am34yD8YK//aehhHmRkHnEWAXR
	nFz70S1ctrlh2kkcVgBlMA8rrnfhVm/Tk5gasyAAsDP0m6Y1/mGhOoZ8e/Jv8V8Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uIPp5-00000001O1N-1Ky4;
	Fri, 23 May 2025 12:40:19 +0200
Message-ID: <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?UTF-8?Q?=E8=89=BE=E8=B6=85?= <aichao@kylinos.cn>, perex
 <perex@perex.cz>,  tiwai <tiwai@suse.com>, "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood	 <lgirdwood@gmail.com>,
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
Date: Fri, 23 May 2025 12:40:18 +0200
In-Reply-To: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_034034_607669_25B78958 
X-CRM114-Status: UNSURE (   4.40  )
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

Hi,

[you should avoid HTML]

> "simplifies the code" is no need to callof_node_put() .

Fair. Except that's not what you _actually_ changed here. Like I said,
either it's buggy before or after.

johannes

