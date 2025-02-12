Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFEBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=; b=xKOOAubHfccntRCeYVu4EqG6BZ
	w7Aa9Nx1pg5bOazjXk4AfQv8Y7wyCd/K2MW7NakqNyaIqAXCmLpkQ/7A0+ECRxzTGiM0YfOWK6jRO
	n1ENVJUQ/xvCYx4K7k98RfOF+/TC0c4rzZyZGLE88rI+Q1QKdk29dCpajEHtQHqbh8mkHsO03lyqG
	/vu/dutiUwv48yckXEG7QeD9obNAinscxUW6wKfofshploqoYaonmHiTZkIC9v2vQi79SmprABPwR
	mstAhQ8/p/0B4N0ei6SgBhYDUplY1vIVSeCHXIoLKT6hLYCqG5FDZtNL2ncxME7bUUgmOQaDieUJq
	G87aZhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJhm-00000008peG-2BT8;
	Wed, 12 Feb 2025 20:51:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJgK-00000008pHz-0xg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 20:50:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4395f645200so197775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739393402; x=1739998202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=zuRg+7YjP1kL0Hba2QhgCAnjIO1woaFhtxPfvBUX0hEhtxxjpwGUmOocHvr3Q/mcVm
         QK+nOCEXeuMm3qOWvdlg+laTwlwKhYUJrfubYbFUMHYpfgr9d5NRmf89VnSTpJI49vrX
         tr6nhGvri1BSwZ/ATnVIBWNFLqaIphz1SO5oF3pt29ISy3CGOxq5c46XQ0dsmCAJ2p3u
         4O04acAvoedXV4Xtgkmj3WFG+ZhfgSgXkXgJ48x23YKQgBAbVVdK6To3cbzfhenfux2P
         n5yAsYVkpZ9qNsWGo7gBBE1LP8XF+7YDE+8f2AJBUwb7ljkxGb+UXHJFhXnSMLkSj+WU
         sxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739393402; x=1739998202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05bFiLRqtjieBdQP28ZStS6jjJuxslhK7B+dgz1ufHY=;
        b=wRn+kFbfFjpGCUcP8HVftiRkRmg0tAPEsADgSHY4cdY6lGd/nplXS3Me3/2kI4Y4Sl
         spqwvEgAXcFu/I+75CjshtZCax4ZZt94IJuTzKJXCpg5BCjAF1eKebAo9rj8UNZnxJbF
         ePM6ymvzngw68YErfQ1mfJBfdI1opghvJz/+y3zKit9+xoWEcwN/wQOOVq+Wnyr5iufh
         8rywHn4/DeAD7+rYtrs02UA6jYuW5t2B9m4iLFFJe/BZkhY+6qts/bo/wN2MbzoeBQg8
         s1av2s0C1dK1w+SMSbCW5y3Itqov41evcLAtn80ebTo9exslkbzoRCc23pDTtZ/uyHhi
         SlAA==
X-Forwarded-Encrypted: i=1; AJvYcCWJImJtuUve010YzqS/+nuqU6BRBO30zRBhFE+4f2QE/7KRFYBPWV4r+5Eu6uOYs4YH8rqDKURTUZnbyC+w/TKf@lists.infradead.org
X-Gm-Message-State: AOJu0YywzBanb5VcN3SOXDCvYBK3AQ8WarherlsHuZUUesJdYFtlc5Cd
	uvKNrzHMpejXUL78AHUeAzGMhGLTqo8/y4GXADEZH8dg1AVoAhSiqLKcSD/9bls=
X-Gm-Gg: ASbGncs5gB3JXKo4eZGP89w8kci5cg4Jc1LFNF9S477GqsgXpMQXh1189/juoNrbRHi
	zGqlwLOIvAVFtz33sy2NP2At9pjqkt7zzqf3Oy12ZPE5GN06fvsjDlYecU4bbSqCc7bNlDZhofy
	KMryJtAnVEqO3ZeVilQWnx6Fg2gaxai87a+AE2vno2FsmMHQqtAphsA1gTheqmWlvLZGk0L9Suk
	ZMfnUlwwkAIPUQDzA27iGwaTUghnu6mAq9hmVijyqIuAqfpBFvaq858caGvaUYGb3OqLDcYvBHc
	rhd8gs23x8kDszeGmOxf32Hj2I8XGpk=
X-Google-Smtp-Source: AGHT+IEBtbJJPvZYtnqI1EcUYSzvnE3bHzpiZAK+Kj6ubquz7Vmwq6Ph8AWnkEWgLrniziBTqXUdZw==
X-Received: by 2002:a05:600c:5103:b0:439:560f:e7cc with SMTP id 5b1f17b1804b1-439581bfdd8mr18910825e9.6.1739393402471;
        Wed, 12 Feb 2025 12:50:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm30461495e9.16.2025.02.12.12.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:50:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 imx@lists.linux.dev, loongarch@lists.linux.dev
In-Reply-To: <20240717-anvil-ashy-544e80a1317c@spud>
References: <20240717-anvil-ashy-544e80a1317c@spud>
Subject: Re: (subset) [PATCH v1 0/4] Removal of non-existent DAC nodes
Message-Id: <173939339997.59416.11108011581545463665.b4-ty@linaro.org>
Date: Wed, 12 Feb 2025 21:49:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_125004_284037_F4A3CCE1 
X-CRM114-Status: GOOD (  10.78  )
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


On Wed, 17 Jul 2024 10:37:52 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Recently I've been getting triggered by abuse of the Rohm dh2228fv
> compatible to get the spidev driver probing in Linux on development
> kits by employees of various silicon vendors (like NXP or my own
> employer). I had a look around the kernel and all users other than the
> original Clearfontz board added by Maxime appear to be similar abuse.
> Drop the non-existent nodes from all of these devices :)
> 
> [...]

Applied, thanks!

[3/4] loongarch: dts: remove non-existent DAC from 2k1000-ref
      https://git.kernel.org/krzk/linux-dt/c/854a080f0b73ff966a813ec2dc53891831daa28d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


