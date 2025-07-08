Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D6DC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YHab4xqAP2Akdg2G04m0t1Le3rHcVZpLaQPZJUOZ1g=; b=tATDJm2r0gz6Rk5XIkV/AgrT4Q
	tABxQu7Et5qiOl4BNWVGqBeImR6MSt+6JIhQzXCZ+g2HJq34RPxjWwTYP/vYS8/yolC+DjkbXN0vp
	2S36rQnc9ltAUR+Wt5tBsTKAFsKGnZXqTYs6Q7zsotofAV5YZ/hryAugyfk69aLyLS7zy5BrJMWBT
	sYSH1atSCNHErO81JMbNNso+Nz4eAPaH4DPSdcTgzJ7KDqoPbNIkWYJqNC37im9haL7xIgZqM8XDS
	0BlaVyeSY21uMySiHtlnpLn1tydTuWYe9ZVNDpANSyNZRdelCFW/kBY7cZAGRxVSrrYwf0P87YOA8
	iRnZY/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5R7-000000053Bd-1Fh0;
	Tue, 08 Jul 2025 10:20:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Al-000000050Dh-1U6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751969014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5YHab4xqAP2Akdg2G04m0t1Le3rHcVZpLaQPZJUOZ1g=;
	b=RrOthxNHQEiNG70Ar0NrEkOnKofC3zYpGyhl98korAPrKpl2IfQd2nB2Jt0BE5Qtk6q2Gd
	WKJP/d7ezWpTCT86RGPcJvg+FeKKUfy90wL85775D7DfCTtlvQQQb79ESOuDlYTFOS0ha4
	wh9ZsyFJXs3ASIUvjEagwFLmIeH53UA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-7eRKK03zNNqjvyfzaaWGwQ-1; Tue, 08 Jul 2025 06:03:32 -0400
X-MC-Unique: 7eRKK03zNNqjvyfzaaWGwQ-1
X-Mimecast-MFC-AGG-ID: 7eRKK03zNNqjvyfzaaWGwQ_1751969011
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso1696579f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969011; x=1752573811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YHab4xqAP2Akdg2G04m0t1Le3rHcVZpLaQPZJUOZ1g=;
        b=tIvRFmfxrfjizM8RNG56dJGuT0pDFACEIXOSNmxdrOuA/gTIP9oS2liJV9H78eFigF
         1bKIOZT5kxRUUkZKyBhz+0sX1T6/tArxQYWV0is+hS/WSN+XJqeXsjA8/Hcl0FoZCydX
         3f8JwCvlaq4mKB0g+lxkFO8/QH1FDjRxPLxWXWBuXDHWp5Mm9QPZG1WdEA6xG7jn4HDp
         jBmDH++Xc1YitO7hAH8ngiXeQ8Vx4/kr1vTLgEEWPkRfdWiYiSSSfA9JVh56gNJjBUN5
         IILOQ/Hc2nYJ4Mw6s1FyKX8zsB54ifGjzg6zYLdXjINL5SAhLMYL06AzRzeoHYfF2TD6
         TkoA==
X-Forwarded-Encrypted: i=1; AJvYcCV7B4f9D4qkxnEl7jpZfUFgPwVcDE3Qg/N/0+FJ1BhUmmAh9uYDI1Bmp4mU8NGeHmJsXQUrudwpb9k+faH5oa2A@lists.infradead.org
X-Gm-Message-State: AOJu0YzvxdE16ZPWCB7diB8/gWZkPRI5K9IiA3ThWF+9rEwDQJQqRx7B
	CxgIYw3nLWboBnlohWcs6OHUGIyHKx8+2ngJR6nbU12aCfx+GRh2xt4SNqPEU4BtBOxHs2A8jhl
	OHt54/Fa5tXkakCxt0UYDpr/1O+dLUGbnWhOgd6awIy6zCpB/4kOcAY4oSExOrvuvGut419dAWf
	53
X-Gm-Gg: ASbGnctXgNSJrk3hTrJK8AzTqgknr+OIvewzGCwCx2drYJHMCDyM0WlNG2tSzBMMyaA
	HNOO7KlxeFHFrDuUlxNRWguyoEW3hs2vgPWCJrTyl6LPIuuov/O/m/cnoCelbdk4Mlt1ze6S16b
	rINscRWE2lN9FWAFagmkH0WHuRh7Gx69LpmTGRvQ21AaNPaKUUuwDthwlrJaa/lni1vyJ/uV1zW
	cJnYfOug/QnoYPU5gvLah+aVL1v/9DmdIDV41OIiuDfORyWmFiASzIiur9l3GZ2nNRaKVg4QwJE
	Av9iulz42Bcqy/mN0q/Bq4O+KxFsGRR015VYbFdntBd61UToF3Fz5EKgsHN0sskas4Iq0Q==
X-Received: by 2002:a05:6000:1787:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3b49701198dmr10216093f8f.8.1751969010553;
        Tue, 08 Jul 2025 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1SvwWcO9VGXYTPULjJBC0m6vJeUr2jVKEuOXwryHw29XUGkc++r6gFKLLfQS8l/e7j3Mcpw==
X-Received: by 2002:a05:6000:1787:b0:3a4:f72a:b19d with SMTP id ffacd0b85a97d-3b49701198dmr10216057f8f.8.1751969010016;
        Tue, 08 Jul 2025 03:03:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030ba48sm12695745f8f.13.2025.07.08.03.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:03:29 -0700 (PDT)
Message-ID: <ea22a546-9381-48c3-8bb6-258fdd784ca3@redhat.com>
Date: Tue, 8 Jul 2025 12:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-7-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-7-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UIMSl1HaZiAC-cl3kKbxEFW8T1rAE8nw-Ol7uDfV4TA_1751969011
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030335_465921_517FE229 
X-CRM114-Status: UNSURE (   9.18  )
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

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> +static netdev_tx_t mtip_start_xmit_port(struct sk_buff *skb,
> +					struct net_device *dev, int port)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	unsigned short status;
> +	struct cbd_t *bdp;
> +	void *bufaddr;
> +
> +	spin_lock(&fep->hw_lock);

mtip_start_xmit_port() runs with BH disabled. The above lock variant is
inconsistent with what you use in patch 4. Please be sure to run tests
vs the next iteration with CONFIG_PROVE_LOCKING enabled.

/P


