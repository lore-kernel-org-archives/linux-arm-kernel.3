Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00653C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxqsoO5YRFSxRwF52mpSuo5ohU/ja/zCcFmdgD0i/xY=; b=OFz15lpw1wPBpB
	UEWFQk4eGOIYvSm6SaVoGlYMMMrQOkC63SmKvFhO+CP8g4O8norGFe4kTA2B5sMMdWCKcH6NCOVx8
	j+wb7vePu08O+y4aNf+BVMTwGzArKWXaYqicmO5lTtpACIjB9LwtczSH8qPm81eeQKMZZLL0EjExz
	0zh4B4aJJKl2wzOl3F/Owhck0FHCjFNjsbJl4c/zzuUUTWftJ67qdzKE1iCQ+X7HTpBUtbyZNpAUC
	At9voadc4f/CrE9hYZ6WpYSwiVEa3aamJIgyIDYiACPwGqUQtzM5/9z+soZYPF8F6j3mR626RaB97
	oi8ueJ7YLB81XZGOtz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhZY-00000003pE5-2utw;
	Wed, 05 Feb 2025 15:44:16 +0000
Received: from cross.elm.relay.mailchannels.net ([23.83.212.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhYB-00000003ovo-2PdD;
	Wed, 05 Feb 2025 15:42:53 +0000
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C48B890122A;
	Wed,  5 Feb 2025 15:42:41 +0000 (UTC)
Received: from uk-fast-smtpout3.hostinger.io (100-119-10-57.trex-nlb.outbound.svc.cluster.local [100.119.10.57])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8C5B490333A;
	Wed,  5 Feb 2025 15:42:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738770161; a=rsa-sha256;
	cv=none;
	b=OsjNgaApkZXHkKD/sbtUQKjQRhGJ2Zq4aYcD2R2LQ+7V4IHpBZY5MnRt6cd4THcDWdpqrp
	0I1dewPpzuBAhBfRcxTDAR/ECYZKlUjrrsQe8cv7UzXK7Ywd0AhHzELZLzRgOS/uouqzlS
	IJRtyxwnw12iBOZrjnnvhtsU+ZyRYaCdErq3wk9cRDtnNLqgqhwnF4c+MwEl045EZkLX7e
	1oHp7JYLGgdpcL+yVMdYNVXPCG0XGtLj/QWQhx7hZgK77iH+aDxyxlZoPT5uCQSD2SKda9
	izXxs+Qszu/KZrbdp7bzXQUh4QH8heR9CNQMq9DfHGFF4a3QUMI40Zw2wAS4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738770161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=YxqsoO5YRFSxRwF52mpSuo5ohU/ja/zCcFmdgD0i/xY=;
	b=t6+W/vx5mso4vB+SWRCH8lmC9dKhTPMhggT7XrhJ96mbDPYsnXo/jUXSMIjceYy4/dhu6w
	8y3jDg5870/ubnGlERD0ICP3XjUf+xZ8waOCaK1rBR+QLmcaWxnEJ2FHUudIVMNpHmGA3c
	BYLnPcW0PgviCjLkB3fVrB84L1kBJ2HVHF7MtC3JPMvsi4wj9jto1Wtsy+dZ3lvkWV4sVc
	TeEEYvH9Bcd15zkE6/RhvMNP+6NrcbNjVqVlRGpfOCVDU9aFW5o8/j4xvOQeHNC0P7BezG
	cmd+HlgTFx3YJf4AGN8LVyP8C67sdFO71FzKYw+ZoYWrMeomwduRGJXJN9PxHg==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-hc7pr;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Keen-Shrill: 6d08bb6615a96223_1738770161601_1876515665
X-MC-Loop-Signature: 1738770161601:354085814
X-MC-Ingress-Time: 1738770161601
Received: from uk-fast-smtpout3.hostinger.io (uk-fast-smtpout3.hostinger.io
 [31.220.23.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.10.57 (trex/7.0.2);
	Wed, 05 Feb 2025 15:42:41 +0000
Message-ID: <10de11cf-a443-472e-aaec-df9e2ed54090@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1738770156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YxqsoO5YRFSxRwF52mpSuo5ohU/ja/zCcFmdgD0i/xY=;
	b=j8IPL+DuU8GProATJm/Duv9PuKhykYmg2E302XRtT0REzY7Xwyuw+AODU+wsrNKKnCH0Gq
	Pi8RuEsYTrm8lSe5baEgUQ8WboBnIbhpdjrTaowqnNWEgzMzEGa5ahAkvmbMbfVvbRMaWJ
	kW2tuUGiICsBsneDgqZR60Nm2rk8kKKepv2+l1hxZKdV38DpIrd/z1QHQ9jmgGTed8s/Cc
	2nvhl7M/UkFqNCge5BY93gZfhGoYxQOic8FulAB7rXS8mRZnV5AbKNzyeZlxTj3DBfXlhR
	5drXh2xtuX6XJZhg0Z4dprka1SvB7AMlBMX5XF9n3wugc5pViJx/6jbsGG+sNA==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink managed
 EEE
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, "David S. Miller"
 <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <olteanv@gmail.com>
References: <Z6N_ge7H5oTYt6n8@shell.armlinux.org.uk>
 <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Feb 2025 15:42:30 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=FNtJxPos c=1 sm=1 tr=0 ts=67a386ec a=gmHaVq+lWCOlvlVL1vhg7g==:117 a=gmHaVq+lWCOlvlVL1vhg7g==:17 a=IkcTkHD0fZMA:10 a=6jP-D5u7NbJpRVPPYh4A:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfAbWRb9fpDBlM9PTOARaxKCQyT5N9lFLaT9hxBqpt8YY33csIIzo851RrRdUcj5OuWXj7LSHEKhkC6+c5m8RjZidR1ptXPzfh8YMhel7wLhrOeBLbUpf JgMvwFTcDNgAx3ceEmj3huh1o46TpAlX5mSthdlNUUIQ6s1l1yhTlRncANe2sWXi50R9YEKDeu1r5brkFSXnd8aZCi4pMYOoC+ltzo6qC5mVKQ0Eeyxo7pJZ A/LidGzRHjB84GsE/q6zji3shJkrIMh18zrw9S6FoYyLWGc61BvYGM906zB+L5NvO4KAxYMUnhDGlwMlNnRHWNVnFYdGIlEikxpHcUSsz8tTfR8c/ncy0kay rpFcvj9dCveq0qgLroiqbutE249qdK93MlZqSoFgPJmKuFc44LG9ky2wz86e5B5NL8Z2ZYVIFNy4ipvY9BhyF2KirZC9ZMiRR5pX1n+fxDlmEZImQ5+O8Elk V/8ZyDAJq7+sE163uO91r2sDP4m2zdtzVyIAUFjeObQHbv/0T9Qs1EoQFcnoxgsZnIh8rGklhoyCoeTVIunvX58mTuV8YgxCPG1WQsDS8VTZc5dTgh/JlukD B2OnJPwM+GuYpKwpX75MCEGhHlh5wzn0QNxGhwmkclXZJdIfGBq6sWCZRYzH2A+qu5del/RcL2XgBfRcD+GF5+swHwrvSqh0XxYXFM7ohvC9yFM2idldV5mh c9vh3AIl/ffLLXCNTfVReOReLYBeC2Jwa80fuJr6CIjfYzhas2U8xA==
X-AuthUser: chester.a.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_074252_034732_B71353FD 
X-CRM114-Status: UNSURE (   5.31  )
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

Hello Russell.

On 05/02/2025 15:11, Russell King (Oracle) wrote:
> Fixme: doesn't bit 25 and 26 also need to be set in the PMCR for
> PMCR_FORCE_EEE100 and PMCR_FORCE_EEE1G to take effect?

Yes, but only for MT7531 and the switch component of the MT7988 SoC. For
MT7530 and the switch component of the AN7581 SoC, bit 15
(MT7530_FORCE_MODE) must be set. The MT753X DSA subdriver sets these bits
accordingly at the setup function that pertains to the specific switch
model.

Chester A.

