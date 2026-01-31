Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760DAD7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJLogjaQIREWDYxPFSLJELLqjbCy21hgcIev5TDCa9s=; b=dZgTmUiBgBHiUXa5+uECpqrur9
	SnDPZDHLbVKcuNQeERsh5VZhuxAv8WP2ZgoKqfBzKXYnd0mrrBG9EaqQg3nVjWDOsajKva0hmIxST
	8/u6wED0q9cgfXlM63mlesFaYls1KP38JJnQn1T+TFOdWklazNdOubvFhuL0nCJaswE0TOZCP2ylS
	BUoFJbekLj2WZjv+eXYTrCCsXiCGwJFPtYc5OxKvGQnd++JT6dEKxY1cwoVjdql9B+ejhrlZcfHT/
	Ogekek/0781kf57G6253elFofskCvoZMrR5ad/Zw1EYLdcas9L0xrCSBOCpu131QOL6AHeMG5rLCu
	wm+7u/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDPD-00000002mke-1x1m;
	Sat, 31 Jan 2026 16:01:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDP9-00000002mjx-3RKw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 16:01:02 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b885d8f4092so537493266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875258; x=1770480058; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJLogjaQIREWDYxPFSLJELLqjbCy21hgcIev5TDCa9s=;
        b=AEHpbxwfzcdbmLH6aESAgoJfDdsl1gT+lBbq/M9wwSzRLuZJIKXyH7UdhXa/kxWGIk
         UDQ//JuBhS+HSKjVjB9CnjD1aYvl8U84ADdJupC3hJ4mbAeFGOrgO0EXcXk1fL0riRjm
         sYJW7Pde3Xmtl14ON+qkGpwcjkBAEObWESzb9ymyRsd0YIvATcU3TwsVm0ybgaSkCkA6
         YRaxJTtjfBRrsf28ZEW9nNPm68ua1odw84dTMGs0lavlZvTI1YIvIpd0YvzqW64rEHF0
         lG7M0Njlej5sZo6LHcxNnPZ/nk5/XR9fJ2dsKyi7Hmm8BdoCmnE5fxx+eMbkaQn5Ko8s
         7J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875258; x=1770480058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJLogjaQIREWDYxPFSLJELLqjbCy21hgcIev5TDCa9s=;
        b=jaM6Hn46/OPNhB7kiwOgQQ7DK69oz2ca/ukwsw3jfuhfCtJAkQOV3hNyxeJHKUC5LH
         G5d2qa6hEYWUJO6wdrEMu5MNZCp+DhHyScP4eUnTAIQbkEJI0RZQ7qjPT73fzuxq3XPk
         5JDNwFnQ95OHYxqrdu4adw05zUznzrw1GcIGXnQs+ZFsi9fKlTLrbjK4LPi9VNyBUITL
         T2izw9R+lDtCoHzSm5AU12nYIbza8UqAetSzK5ajpok41WtpVbLUW5oXrbFeG3iQi/U5
         VRsnl0h8HgKqmxqei4t2GwSl88JcX4X/WR5juUPP7Kj6imQp/FgdEefJOa0udC0jNNE6
         qMyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVsZ8o12sz6QfnASnmNEcBjb24yjJ0AmKc/xanWLH/tdKfK1oL9CH2vu5gTTMKnJzsRrZ7l0/5JUC4jB2cS3Nt@lists.infradead.org
X-Gm-Message-State: AOJu0YwMapeAl2jGO/bcY3i9NsW8NbquZ4kZODz7eC8M1qNpVMdX4vQt
	IaTavyk4F5KXJJcA3h2GIed3qJzrNJ/ZuSfSONcqb0iNWNZBQuoNycWIdY0u2Xvt8WI=
X-Gm-Gg: AZuq6aIA4BTyySNb6HE1cn5GrOYFN319zHuUwVOWthP8taHK1mjKvHxhONMVRqEaqVR
	l3Y+6LelpFfmXFTVLvMRAnVD0X/vNtGsTpPAaCVPq1BNdvu7zWM1tJISt80sBhXtKJdT+5s7qfO
	sxU9lrzgRFfzbpClAfnhgSMRKE81kMK58HnveFEFich8/vuEFYJ3mUkcfAjswD9c8XkN3JiJlf6
	VDlNDfZ+us+W2968hAzZTEerbZ60NolF0FjFAsrndnHvC1YCfVe8YLK+Rrs9wOdVcHhRwAQZNaG
	U7MIOA9ebC30HbfvkO0DjLV9vGDOAOJDRw7WOPc7yJPbinrIhbOK9Dpn+AiIHhpDLk+R/SQovyM
	aYOG/VOHeMDMkaeNn5pBkJImanmEQcZJxbAjjuzEkPQ2sE9z54LtUEgs076PYKPZMBj1kNiU0Pw
	iLIZCL8DbCo7/1M+ey8+fc0nh2iqV6
X-Received: by 2002:a17:907:96a5:b0:b88:5bd7:63b0 with SMTP id a640c23a62f3a-b8dff5af70amr373554666b.11.1769875257922;
        Sat, 31 Jan 2026 08:00:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183f2bsm587629966b.32.2026.01.31.08.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 08:00:57 -0800 (PST)
Message-ID: <a7d42750-276a-4348-802e-30cfa4ad3a81@tuxon.dev>
Date: Sat, 31 Jan 2026 18:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] nvmem: microchip-otpc: Fix swapped 'sleep' and
 'timeout' parameters
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 stable@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_080059_894299_4D1D11D4 
X-CRM114-Status: UNSURE (   7.87  )
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



On 1/20/26 17:44, Alexander Dahl wrote:
> Makes no sense to have a timeout shorter than the sleep time, it would
> run into timeout right after the first sleep already.
> While at it, use a more specific macro instead of the generic one, which
> does exactly the same, but needs less parameters.
> 
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> Cc:stable@vger.kernel.org
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

