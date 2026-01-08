Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87486D185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+a8/HgrrA9LGdGkGtxw3sexeM0b0Vs24vRvPS8jCcE=; b=Vowhu8Y0FU966j/99oUefuCflU
	l8Rx+S6IUDtKz2BoShVbg6D0WokZjpNboRTwUBjDVENWB0ovxnmIPwb53Xfl9euf4V6q8I6ihHKdi
	xrPEJk3Ju+kx1wudU4cPLCWFoWR3dU8xu4n55RET24qSSVc9gluSYpLzrS/q/YU++qwZnB4s5vbO1
	VAk9MkJ6A4n4gFaY8ee0WYO6xfR4cQkhfIwnNoCCgldsichnWo4I2qnXIHyv0d6m+90drAze6sbrE
	/uQEspCX6Qy1ljFWr1sc8mXleNlLgoGD016pG/n3+mDekV47Tx8nP7WJj9ERaOxedDuH6KlOdlF4V
	CHeGO6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoCV-0000000GqjY-3Xm7;
	Thu, 08 Jan 2026 11:29:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoCQ-0000000Gqib-1VVB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 11:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767871745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+a8/HgrrA9LGdGkGtxw3sexeM0b0Vs24vRvPS8jCcE=;
	b=W17prrJKNGMapg+7XCIJ9/T9Wsh9ud3pRO/maGsPXgrAJD72uRPz037T8VyP5noBRidZg8
	1lUVNip8aNuVdHAjBwwYfP3MLCWfddSn/o0ZBFlWMeGJFgManDLBFTlG1UWh9DfekQyeD5
	4PyCqz7KV1dpGYuvivtwvYvxLoHq0Bo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-3NR2jlLFMq2YkX2XwAUhAw-1; Thu, 08 Jan 2026 06:29:03 -0500
X-MC-Unique: 3NR2jlLFMq2YkX2XwAUhAw-1
X-Mimecast-MFC-AGG-ID: 3NR2jlLFMq2YkX2XwAUhAw_1767871742
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so32485715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 03:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767871742; x=1768476542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+a8/HgrrA9LGdGkGtxw3sexeM0b0Vs24vRvPS8jCcE=;
        b=YrFu10HyibUwgPn954KYhCCWZAi212yUfGS/fIbbNVvx4AUZihxb7Lhko6mOJFwl6/
         n8e3KpglSGQk93iK8RqRiwqeDRfIe0kYDCX3cYclQcGpuHf16IDRVCZYGrztARQdMkVo
         +KoZuEclW5/jMqennrxw3EBglVCJwgDYebpDuUABCFSgTpdsDMi74mNYRbAuSqA6rHnb
         AL3cFvP6KhorQ7RpXwySu5tUWpY/3X+Gdve7TPHfBYIW8CHGoZgo9q/bUpQLew6a8/tP
         +oToO5OZS3dx6ERHIYVXr36Ps4FzUExmiBuyShRAfQ7u4z2Yr+r3cZXs0BtX8vRwr9IM
         8e6A==
X-Forwarded-Encrypted: i=1; AJvYcCVhzxKfW+OOYGfEZggA44eO6AxqsrmmIIFFMCccoYxajEX9f2RVCJx1XpMlnhYppH9R5YV7sFKGzBgR7keRDreH@lists.infradead.org
X-Gm-Message-State: AOJu0YyAdzjRNijQGT0JKn9qaszMlwTaqh2GTLjLC5tJT2Y2JwgKmWId
	KNM9yoFSlAqvwksCh4PvyFGCzUpyONeOQBsSYjHo+oxzdjdTLV4aMkSZ7u5Lp1nKRF81apagF45
	9sTR0jz584u3JnJhNkx2UZs/y7eXQDuegeQptRDM3YLe4GJhrmwT04YTHCZ69UnzGi2ns0/ZObF
	qd
X-Gm-Gg: AY/fxX5GimXddqO6/lWeKMoEqP5+TNf74MlrOfGmQXhTBHbUOQE+p+FGxmOcSgemb2A
	57HlO8CGLY1TwHILMg6xF0wXutEA5xauSw3sgHW3sk6XPoNWzHC8eeIA9PgK1cgLJQzpFq9eQwZ
	/NGN4IRtYSOfm9ROhxncCQ1OD9BzxSTkpXrOshnxloLepVNl7X32pUoNxWC/KBRBITixRSHpBmw
	yEfLrAajrc4wixmCvTsq7whqWZUP92udVlgWXQS1wjheTFbRltuwCqos8KG6+1xQWswMwhQL/k9
	jIITCnx1leSo0TLKDuTYCne1/+SvnnKXxc0WYrOSy6JhmV0J2TQRPOf6SLHvy1WhefDUrB09iGR
	8RjqYH59+9PhvNw==
X-Received: by 2002:a05:600c:8119:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47d84b0a8dfmr65473535e9.3.1767871742165;
        Thu, 08 Jan 2026 03:29:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgaAftp+naANwBwxcdTWbs47iqT+WgXibibJoopIEFumDXskHupti0hYSDGlBzsi6bm2o4vA==
X-Received: by 2002:a05:600c:8119:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-47d84b0a8dfmr65473285e9.3.1767871741741;
        Thu, 08 Jan 2026 03:29:01 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662c09bsm38373035e9.2.2026.01.08.03.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 03:29:01 -0800 (PST)
Message-ID: <a1341a4b-3ad0-43dd-adff-66d7d90be471@redhat.com>
Date: Thu, 8 Jan 2026 12:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 3/3] net: ti: icssm-prueth: Add support for
 ICSSM RSTP switch
To: Parvathi Pudi <parvathi@couthit.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 danishanwar@ti.com, rogerq@kernel.org, pmohan@couthit.com,
 basharath@couthit.com, afd@ti.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
 horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
 mohan@couthit.com
References: <20260105122549.1808390-1-parvathi@couthit.com>
 <20260105122549.1808390-4-parvathi@couthit.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260105122549.1808390-4-parvathi@couthit.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uS5nfa1RanuMSCoZ2qLnzKayjkCz69uKYiKaxr5Fbhs_1767871742
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_032906_501698_8E55F0D2 
X-CRM114-Status: GOOD (  14.02  )
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

On 1/5/26 1:23 PM, Parvathi Pudi wrote:
> +static int icssm_prueth_ndev_port_link(struct net_device *ndev,
> +				       struct net_device *br_ndev)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth *prueth = emac->prueth;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	dev_dbg(prueth->dev, "%s: br_mbrs=0x%x %s\n",
> +		__func__, prueth->br_members, ndev->name);
> +
> +	spin_lock_irqsave(&emac->addr_lock, flags);
> +
> +	if (!prueth->br_members) {
> +		prueth->hw_bridge_dev = br_ndev;
> +	} else {
> +		/* This is adding the port to a second bridge,
> +		 * this is unsupported
> +		 */
> +		if (prueth->hw_bridge_dev != br_ndev) {
> +			spin_unlock_irqrestore(&emac->addr_lock, flags);
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	prueth->br_members |= BIT(emac->port_id);
> +
> +	ret = icssm_prueth_port_offload_fwd_mark_update(prueth);

More AI generated feedback here that still looks valid to me:

"""
ndo_stop() can sleep (e.g., via rproc_shutdown()). This function appears
to be called while holding a spinlock via the call chain:

  icssm_prueth_ndev_port_link()
    -> spin_lock_irqsave(&emac->addr_lock)
      -> icssm_prueth_port_offload_fwd_mark_update()
        -> icssm_prueth_change_mode()
          -> ndo_stop() / ndo_open()

Is this intentional? The ndo_open() path also calls
icssm_prueth_sw_init_fdb_table() which does kmalloc(GFP_KERNEL) and
rproc_boot(), both of which may sleep.
"""

There are other similar cases; for the full report see:

https://netdev-ai.bots.linux.dev/ai-review.html?id=ce23f731-f25b-4082-a5d0-c1261ab829ed

/P


