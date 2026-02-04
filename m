Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA32E95363
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AI/nHMuupilMGKzkZo1RxmEdDDqp05ziOca4mFkFe7Y=; b=mNuS4Pry+z9oi/4hQqL416t9Jg
	KDzXEg4jUgsmmNN6zk+Myqni4n43sSCFgc1V1mPn4E63NS0BrZcHQlIrWjkaF4PbIQ2reu6ueGzOu
	cJRSS/UPE/y7qIVfn6OeXn94GEUYik/PyiSY04i/JZzjS4ygyp2vVFLrS6yRG5lNQQC+WuqYVkpip
	QK5/zHiYvqv6pyNKZzderBaT0WNjntlyBzgMX2el4IfCcefi9lv9lW+jbEumFOj2jdqXWF3+jtPFR
	veImRm6p4csBszPM6gHQ94UN4XFVtk0NXoGkk3OKS5C3BnTh1xQnARrZn0oeA5MYZWa3kjH/VLY5c
	hu6qopOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZMl-00000008EEi-3zEf;
	Wed, 04 Feb 2026 09:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZMk-00000008EEQ-2neI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 09:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AI/nHMuupilMGKzkZo1RxmEdDDqp05ziOca4mFkFe7Y=; b=XqLgRJCMbg+RYV/rn1oLtt+U6Z
	QOcO/ioRq2A9a3WmvrGwCbAmYp0RLrURZV7Nw8UGZ65kYZ5JzDdH++YaNPWoR3apElvirfnNUV08B
	TEJlmSGRfAcChDXD/uU0mEP9BV/x2lG7gElmGG56XmLPYTDfSxttguEukm5Uevr4380b52vau9Nc7
	v+gunoUOYgJqeeSmZ7gDKhTXI7yXsB46WGPoH7CHCJLrDq1bwvb2Jv5RvcjZmtKDpGVUT1de+7mrH
	/Pu6EK1U1qD4oFUv6rjncGaMTSeMJJlwJ08d75YoD8mlEnvMUb1jON4sIqvaM0teLNH51Xu2A2jLV
	EpfwIztg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZMh-00000000EXS-34Ez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 09:40:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D48C4E423D9;
	Wed,  4 Feb 2026 09:39:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAE3F60745;
	Wed,  4 Feb 2026 09:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 383D8119A865B;
	Wed,  4 Feb 2026 10:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770197992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AI/nHMuupilMGKzkZo1RxmEdDDqp05ziOca4mFkFe7Y=;
	b=wvDQQR6D3NBroTTsWxi26R4kPW+9aio4FhNW0rwmIim2KruxF+sPRmVT4VjQMLunA4Ibib
	ltTV/uFCBVhpL8x4kz4gfGY9u0v4AW9gpqgOrDWYYHIlnOqYqtvKuftqQUS4RbjYmT/yK0
	YjU+xglnARFA//o6JyluxbffW0afooKLZrSdVH7axblBGwwbUMOzMgg9CjdpiVdF6S7CvI
	zrFis9TzJqvk9ldNxb6CWAZ3dOGtzx2YkTil1S5YBWp65e4hwT9gARCalzPhbxqHTyeRru
	eilPDcA5AuI3ynI3GOD37z3IgND0dxrW21HaURKjOwfIbAc5H0v3nSodWyPhow==
Message-ID: <5935c13a-04cc-45a7-9b71-3ebd821f2043@bootlin.com>
Date: Wed, 4 Feb 2026 10:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/6] net: stmmac: rk: introduce flags indicating
 support for RGMII/RMII
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxl-00000007hol-3XiH@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vnYxl-00000007hol-3XiH@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094003_974490_A7DE9531 
X-CRM114-Status: UNSURE (   7.82  )
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

On 04/02/2026 10:14, Russell King (Oracle) wrote:
> Introduce two boolean flags into struct rk_priv_data indicating
> whether RGMII and/or RMII is supported for this instance. Use these
> to configure the supported_interfaces mask for phylink, validate the
> interface mode. Initialise these from equivalent flags in the
> rk_gmac_ops or depending on the presence of the ops->set_to_rgmii and
> ops->set_to_mii methods. Finally, make ops->set_to_* optional.
> 
> This will allow us to get rid of empty set_to_rmii() methods.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


