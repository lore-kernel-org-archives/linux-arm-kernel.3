Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12DC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdhVZ27fT6CE3QToaexz4mdCDbpmw+kJMYcK8ovDzqc=; b=1wSWtGVQqeU+vUEGM/fHP6Z6Sx
	GMzHCKIVQvOcEogDpgqvE2q0q7jc4a2Q47WZ+K6cFSu1mjv14oTvxO9FcDZ566o/9qa06dUJCBYhJ
	+pUIKy+fy9Y2FiAlLsMVFlKXTotcGT499ktgdk1+uvvh30lFlU6517h1XbMArF/GXukmBzZHlRBoX
	ylRv20kB4UDXwYaV1uVOX6wLxQv784FLmzYVPHImkCS8UQepLrC6OLejIh9j2Jp8VBpdbTIxa3r9L
	nMrNxUi+YBWSlvJBtF4m/04TbhQ9+faT/I32D1C4PiwKMmRVmf2Qw18mkCuzTkxn0B/SW83NX5uwe
	1gp33ODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRfN-00000003p1o-15fB;
	Fri, 23 May 2025 12:38:25 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQS7-00000003guo-3ozK;
	Fri, 23 May 2025 11:20:41 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b3hmd3T2Mz9vXt;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6OGEq_bauYM; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b3hmd2TkFz9vXs;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4884C8B769;
	Fri, 23 May 2025 12:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id p6vSVHiM0Uvz; Fri, 23 May 2025 12:51:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E138B763;
	Fri, 23 May 2025 12:51:43 +0200 (CEST)
Message-ID: <8ad901c3-3fcb-4643-ac5a-c1f30f93d07f@csgroup.eu>
Date: Fri, 23 May 2025 12:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com,
 johannes@sipsolutions.net, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, jbrunet@baylibre.com,
 neil.armstrong@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_042040_108444_1781C2FD 
X-CRM114-Status: GOOD (  18.03  )
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



Le 22/05/2025 à 07:02, Ai Chao a écrit :
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.

I don't understand this explanation.

You say "no need to call of_node_put()" and the only thing you do in 
addition to changing from for_each_child_of_node() to 
for_each_child_of_node_scoped() is to _add_ a new call to of_node_put().

I would expect to see a _removal_ of some of_node_put() when I read your 
description.

Christophe

> 
> Thus, use this helper to simplify the code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>   sound/aoa/soundbus/i2sbus/core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
> index ce84288168e4..20a4c5891afc 100644
> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -207,6 +207,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   			}
>   		}
>   	}
> +	of_node_put(sound);
> +
>   	/* for the time being, until we can handle non-layout-id
>   	 * things in some fabric, refuse to attach if there is no
>   	 * layout-id property or we haven't been forced to attach.
> @@ -335,7 +337,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>   
>   static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   {
> -	struct device_node *np;
>   	int got = 0, err;
>   	struct i2sbus_control *control = NULL;
>   
> @@ -347,7 +348,7 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>   		return -ENODEV;
>   	}
>   
> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>   		if (of_device_is_compatible(np, "i2sbus") ||
>   		    of_device_is_compatible(np, "i2s-modem")) {
>   			got += i2sbus_add_dev(dev, control, np);


