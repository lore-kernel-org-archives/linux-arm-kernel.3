Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C77CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jkXDRZmWGRgRXzJOU+jIPIdQYDS6GexJmI7jPxQpAI=; b=znZ3JA1TKu4Ii81ntTwvBzErR7
	mgEPWkqIscVutPwJP9m5jLva0bcxETituSjceA+jFdwOBUNctNkOVvc4LF5WSAZFO+hmQ4wfMIYCC
	roblCycTH4KTS26aiADJG2LXN5fbbP1Dcs1shd/kuzOTnrk34vsZJbTzOKifrPDMsSkCzlhmZMHoA
	YGcqHXIHQAOKqmFIfuFVbApQkRQot/lUAdZEJ/JrtNYhGiZhu9IwYc9DGQyZoLnwyzEbyVGn6+sk+
	hQgQie3hXcrf2LPIZvVW13B7GrBrlA2mQsC1docmkUj4Wr6PQTPqKJV/jDwMYtWfd35+bGHVb6NrQ
	uuzyFnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um90g-0000000DQRc-0VDL;
	Wed, 13 Aug 2025 10:47:10 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8No-0000000DK8y-44os
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:07:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C5EC43A11;
	Wed, 13 Aug 2025 10:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755079619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jkXDRZmWGRgRXzJOU+jIPIdQYDS6GexJmI7jPxQpAI=;
	b=pTGq3u7ruzEJwmP3IVkTm8+aqpnCbVjsWdRcvIh3Q1eeiiB6zc0LdpsX3zgpXnU3qPV/Js
	7vCUVZF9PwpKUc2BathX3SkxvRM+DowdZnLhEUDHb582JJjcz3l4LZe7q3/Iiu2Yg8OdPL
	k5trmBpbBEn4odsGQNqGx1oi73B1QEH2wWIi2+8VTHx67sY3f6qqk02rn9V1kuE+QlZUw7
	eQ99L2ASzg6xFdwiyTMIhWU6XTyRstm4x3XOGhtAlaCy3mJB4keOqNnyiQs9hNCbwuVUba
	WVcztX5VbiNe4k5/dXfWlhCG83nP1hAjnFgLDEhxdsAFiMjF6JR66dwCjw6sNg==
Date: Wed, 13 Aug 2025 12:06:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoc: fsl: fsl_qmc_audio: Ensure audio channels
 are ordered in TDM bus
Message-ID: <20250813120657.1e93b16b@bootlin.com>
In-Reply-To: <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
 <8d01cf4599664188c92a515922d68c9834263384.1754993232.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030701_156854_1C6E8624 
X-CRM114-Status: UNSURE (   8.95  )
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

Hi Christophe,

On Tue, 12 Aug 2025 12:50:56 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

...

> @@ -879,6 +884,30 @@ static int qmc_audio_dai_parse(struct qmc_audio *qmc_audio, struct device_node *
>  				return -EINVAL;
>  			}
>  		}
> +
> +		ret = qmc_chan_get_ts_info(qmc_dai->qmc_chans[i], &ts_info);
> +		if (ret) {
> +			dev_err(qmc_audio->dev, "dai %d get QMC %d channel TS info failed %d\n",
> +				qmc_dai->id, i, ret);
> +			return ret;
> +		}
> +
> +		last_rx_ts = fls64(ts_info.rx_ts_mask);
> +		last_tx_ts = fls64(ts_info.rx_ts_mask);
                                              
tx_ts_mask instead of rx_ts_mask for last_tx_ts.

Best regards,
Hervé

