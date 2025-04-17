Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E25C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eca6nYlnj6Q/YeQ89T3yXHQz/N/LC2yMQtBQUQX05wA=; b=NvYAwktztdzSs4OEpyuMjY83pi
	NkLQZtVYoJMOpqxPZ/jkKwC7OIl/HSqhjTNM4i2Lbtooe4UsgvPyS3RaOpkjgpbxKfpCeXEY8h5Ob
	5dXrmEZZjOpTVLgyUDsdIbMuSTUaZXataJD7FvVfzELiCA4RYCCHUsuQ3OBxEYOb9X+yF0s6BlAJF
	jF9OUlEdPX/8VzgHQv4SBWew21eZzbGHT4YViMkCq18c3B0w2JDqsEQhBlhY5smiMHOWX/dUPcbqR
	Ory1B/826phm2ekLa089EiXTxu8S83hQTIV4h7WZ9ppOaZUP9FsbD/ceh4mnF/5OES926QZPQvq6J
	mu+/BazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5M7v-0000000CYfN-16Q4;
	Thu, 17 Apr 2025 10:05:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5M63-0000000CYN6-2IUx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744884230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eca6nYlnj6Q/YeQ89T3yXHQz/N/LC2yMQtBQUQX05wA=;
	b=O7NtuO053U5T0HYaeSp0BTiQ28ZFrBrUMq1z5dPv49IMCUFdG93/HXMwprjD3uFbQ/o3t3
	8CP8qPQCIbqj3HEnCfKJx4xHSqeslXwbKQhXNKVj6gF6qbvBKPkxb2Lc8FGORcSCWFhVji
	IFLnVmW4Zx3aJi5tFtPWd0qGmrJsiPQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-FnchNZDgNYKEjzjigk_tEw-1; Thu, 17 Apr 2025 06:03:46 -0400
X-MC-Unique: FnchNZDgNYKEjzjigk_tEw-1
X-Mimecast-MFC-AGG-ID: FnchNZDgNYKEjzjigk_tEw_1744884226
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39979ad285bso304361f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884225; x=1745489025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eca6nYlnj6Q/YeQ89T3yXHQz/N/LC2yMQtBQUQX05wA=;
        b=UPHCL2GGnHiXmgSknk7/2OniZaM83eexGtmdlj4FHwEOOz4kpJX2uDO214AERAW2Hz
         FyNXuimURRkPgvBLCbpLWkPhxbN5YIc7cip3Wb2bhtfzVuf4Yz/ve3UeiFj4tAVWCC6k
         CgnOmni0CvyrtgCcRGKtjRpsG1QakBmSN+M87+RCJSkTfVNu0EKuTDA/A+UkO48qNFVB
         SeMV2rWyeOunXEl2ddj0x6Q3dTy8hfzhIJT/kUrFJdfca7faUnx9KhjXFX05Avq18kH5
         2nc7YRYm5PjksGXS5+NMpIiJC+ZHdJ9HJLb3mIF8gF3Ocoa2tPbUZHF6c3v+btnsS9Eb
         /RqA==
X-Forwarded-Encrypted: i=1; AJvYcCXpayHuoTBLJgpovMPwDw5hEjH46F7iewh6ZYYLzAvQ0+1ly7r6+cEaZ7EGkJlvyAOgVfkyHYR5KsNpEABL5omF@lists.infradead.org
X-Gm-Message-State: AOJu0Yymz7/u61acGWbsfMED8ldlhC170uogGHtN47b4n79pYPAvldZS
	+sjmg8mhhh1cfq5GEhgAxw89EBtRufTsXQpjdkl3YEgK0YcaeHDqfsgOji9cz7fZhzNzN10eTn1
	ncDg6uYSW0EAFct5HopDR6ANgkRIL945xUUBHRCZ/LGhl26dKyFlHvJtn0tdcwMzaoKkwBX21
X-Gm-Gg: ASbGncuX/cjrYpHzpcerJyL/J+XstpZIgtnfZ//fsJTVyqtw8Y3wZR8EA3G5fOg/Nd2
	PV9L3yKt3czRBPG6ulctMv0ME9DCwWe+4ySv8RX7rHvlc1plx82WNEJ6Og8YpvHG4tBiN3a4qQN
	KHVRqXmI+efbRUhWhDNkWoClPLXRQFL3BR9suWuOlmUJb34C/YKxL3upteM923QpPYVAZtSVYj7
	t4xZ4rBiAB+Wp4YVGubsjdoDJF8kG/rYAmmubjJqZpLQuCZPMh4FYV4hi21GiaJvdVmD6tLBUxi
	0/fSpcHtq1n47xxiBclJ9x/Ft5M7ncXQnQhuQYgBUg==
X-Received: by 2002:a5d:5f54:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39ee5b8b7e1mr4746224f8f.40.1744884225632;
        Thu, 17 Apr 2025 03:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWbMd5UZNS52cZp1/RVD9DV2YcByv7qTywhU//hbfm0mgjXhAdZwTqwRIUercg2jPhhkOtQA==
X-Received: by 2002:a5d:5f54:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39ee5b8b7e1mr4746191f8f.40.1744884225284;
        Thu, 17 Apr 2025 03:03:45 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cceesm19733949f8f.73.2025.04.17.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:03:44 -0700 (PDT)
Message-ID: <564ca4ac-661e-4126-a65a-106d3c28a47e@redhat.com>
Date: Thu, 17 Apr 2025 12:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/2] net: ethtool: Introduce per-PHY DUMP
 operations
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
References: <20250415085155.132963-1-maxime.chevallier@bootlin.com>
 <20250415085155.132963-2-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250415085155.132963-2-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vly8LBulnKEMB199e8MJErtmv5Hi6mSBf_feEI9Jlyg_1744884226
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_030351_675491_E2C9217C 
X-CRM114-Status: UNSURE (   7.63  )
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

On 4/15/25 10:51 AM, Maxime Chevallier wrote:
> +static int ethnl_perphy_dump_all_dev(struct sk_buff *skb,
> +				     struct ethnl_perphy_dump_ctx *ctx,
> +				     const struct genl_info *info)
> +{
> +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> +	struct net *net = sock_net(skb->sk);
> +	struct net_device *dev;
> +	int ret = 0;
> +
> +	rcu_read_lock();
> +	for_each_netdev_dump(net, dev, ethnl_ctx->pos_ifindex) {
> +		dev_hold(dev);

Minor nit: please use netdev_hold() instead.

Thanks,

Paolo


