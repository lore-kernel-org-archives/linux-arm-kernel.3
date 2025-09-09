Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AC3CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3pmDaVJYIZQhrRHJmz8GcRjusYo6oodT5OSlpTQ0+I=; b=y7kaW18f0J+hN0ftEUT7R75fDO
	s5AMWVbHJsR+7BcHoGs7dp9udcFxl/IM5uqFchFMmS4NiNOYgp9KcTn+5kd6UHA1zksOa+J61uDpy
	JkMY3awSkMO5szl7YhIAXge26xCGbBsbMHiQC3alj8CyTw192ggM1hbXFMjGeZKf6JUkOxz7WHg2Q
	1B5z8cadzhdfuOuedsCHbx6dvejj5gmLAgvYDBJHMdeg2xjySDskS89AWSBwSnfZZwfOZP51NoB1K
	+MRbv2U/LN0CC+YmbVHpI9w3nNu9heG3FBdeeDN+xNRcZezMXJlug0f4OgGcACEVjsupHFr2W8+Bq
	vY6TdxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0OC-0000000871E-2XKj;
	Tue, 09 Sep 2025 15:36:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtbh-00000005XRG-1NFH;
	Tue, 09 Sep 2025 08:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757406099;
	bh=7AQEL1juqiawy45ZAxf91ih8HpQwBQAic9ZRFlIoxl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MaYx0+cmECTn5E5dKoUWkeKcNUYqqPiKDQfu24dcvZsPCZ1UcssOmUmT/QAZ1YRwV
	 jrzScuI8kkfbjieeJzOQGslqETCfZyZCvSQ1caBYYpFnMoi8hmdG9s9FUorXSaUa5v
	 Iun5swZ4xNJyyeXHjL65RwnF3ShNEKZmhgvmMlI7jd3iCKOcxGrAvHObgvbSm7+7OL
	 2VuDMIURF0/2Sq9YPgJAs6G/QVZkJiAiHZY3l1hFifMpjrs51FjrA1Lk1HDvXnKkih
	 7HhGsL40vhR7F+zlAfOyDBhh5iStpF4XLhSbeBXvx1IyUwjnAzuv7eX3JfO02GyI1g
	 1oUERFUeyXsvQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53A7117E0100;
	Tue,  9 Sep 2025 10:21:39 +0200 (CEST)
Message-ID: <32d498e7-0774-48d5-80c4-35ede039692e@collabora.com>
Date: Tue, 9 Sep 2025 10:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: Use devm_mutex_init()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <2280ca741ef36fe9ed26b8079b91a8e5dfd669fc.1757360105.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2280ca741ef36fe9ed26b8079b91a8e5dfd669fc.1757360105.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_012141_628508_54EEB0B9 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 08/09/25 21:35, Christophe JAILLET ha scritto:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> As an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>    35803	   9352	    384	  45539	   b1e3	drivers/power/supply/rt9467-charger.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>    34792	   9008	    384	  44184	   ac98	drivers/power/supply/rt9467-charger.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



