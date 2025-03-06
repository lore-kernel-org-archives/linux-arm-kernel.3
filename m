Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjRt78Dq2s+uI5+AwqEfT+jWVL8f1Spro5dG2E/jNI0=; b=GDdIXE16/uL60dxwB+/zvIo/Ll
	yXEFH0Jcq3wcOElCHv/c0NAjizttjyJiWCWmfxfLNgM8UFBbMGStnyUXvPWxFYfP3kUTIOklFXhkc
	YKtxrKxQrLfXL8y5Q2hw3xnLpq/+Lesf4u6R0ylymGoj8Cfl1VQRVF+x4gFBG0eXNYU++eBCv8tBe
	vK0IxencOnbI/530KS2JVkQRHBBhg7TGM/w4bh3hNct0rdK7d6VlB1tWWCucxpJ83SqCjcIwgt1ob
	jwiGdXKDFtAUVA5s7l5fwB7wLFkbo+RbDrFNCH97+zfkrhGpGSVOvM3fZZhQrKLRAEm0HsVjWFGN8
	nJyA+edA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8oP-0000000Ah7W-0ObK;
	Thu, 06 Mar 2025 10:50:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8mm-0000000Agji-081g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741258143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjRt78Dq2s+uI5+AwqEfT+jWVL8f1Spro5dG2E/jNI0=;
	b=axrydXgZCZT/b0lMtLVTiPPDWvU6zN8Amnf0SdpLMAdi7js1fJ8BBTTa/+OEPV3BnK5Bp+
	u1Q2de+PLkuqo8R3oBuiqO5qgxfWlrB2brRppq4tPc8zfUg4tgw6ShCSV3TUsqTCBh9vfy
	IB4mDIbWJQlukHgV68zcDgOUYlnok3E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-M_TygwomOFmF1XC7afwR8A-1; Thu, 06 Mar 2025 05:47:26 -0500
X-MC-Unique: M_TygwomOFmF1XC7afwR8A-1
X-Mimecast-MFC-AGG-ID: M_TygwomOFmF1XC7afwR8A_1741258045
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bca561111so1976875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258045; x=1741862845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjRt78Dq2s+uI5+AwqEfT+jWVL8f1Spro5dG2E/jNI0=;
        b=E/+L9eT28DM10fYUcNlB/d/wsCarZXiWLHdg4ZZl1dQrxmPXkSrR6c/g0bWL31Pyag
         tjAMK+dT2Jx7R8sxMsxgaWtB376956jjNSatiYgnu+Ll/BVpFREXIJU53orL4Z+g6gYL
         vOPRH+WOXUQJBL5FSKvrBlQJub3T8OFU0quvnQ399Os6EWTD2LZ5Uf47BRM/u/3+AqHx
         Slrhi3yKtBv9YMhjBCvPqWYx1OEmkvXgvGRr6XrTaTD3Utp5TGSPnVoZEvYRboAMov7j
         k+t9aUR2InR65w+Su8QUQtDVPOWG9DqY2W5LqKoJ6Qh2BKq5OVMz/qVUoZQwjn31wyy/
         ieSw==
X-Forwarded-Encrypted: i=1; AJvYcCVZBbZXBHTS2oeXOQJ+PQ6z4d0qUt3qpnFQSMyaSYb+MHMf+VYJM9jl6A7QVPULghIKNXq/5Vi9TuZtJuQp6Dni@lists.infradead.org
X-Gm-Message-State: AOJu0YzvDs70yHq97Dbt98777/DsQrK9fZYPiv5mC1squtNJ1sGwO5H2
	W6ehJ4EOGzOFHSSuCJcnt/AXHY8qEkZteYW5IkiAtDkGi40ECmDLxG/q10Y+navdq+ZE1+Dm1l4
	dfas11A8Ernhyeux1TsRleYBI00UgvqMCZiUkt3RdboetXQ1Lm24WWbTVvHPrhjy9WtyTIctV
X-Gm-Gg: ASbGncuS4wryjLJvV6txnEdOyWl4iNhgC0LTFGkGrz/+TrueGfWTaZrV+fNPZ/Ghz2e
	Q4QDvvfxWywmSYXaSu69SMauUI1EmQyyOnMyKsnk4iy3KcJhhe5oRHRbvGSIPAso3JT4DVt7pxX
	OV+3fl+FZjS7Zgc9K7uOT73Nv9aLbxr++WPUENz75talG0WJAP04GqkL1VZkqGZGbOgaUcScb9L
	L58yRXOMCp2QMJ05/onl5QlnE4GDHj/Fmip4UPN44kr+iWPGL/WhEUEt8p6h2RtfWBSUAROt3He
	dXfPnhC3A3dklwakwwhsAXo1Nyoyg2JtcmVJ09kdVV6EMA==
X-Received: by 2002:a05:600c:474b:b0:43b:caac:5934 with SMTP id 5b1f17b1804b1-43bd2940d7fmr64405845e9.10.1741258045147;
        Thu, 06 Mar 2025 02:47:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMjHLrijI3JnQ9/rTJXDsThbCAGg6S1g+aRd1hhWjvbEr7MYhP077xwT5HmEDiJR4B8678IQ==
X-Received: by 2002:a05:600c:474b:b0:43b:caac:5934 with SMTP id 5b1f17b1804b1-43bd2940d7fmr64405645e9.10.1741258044718;
        Thu, 06 Mar 2025 02:47:24 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42920a5sm46021545e9.11.2025.03.06.02.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:47:24 -0800 (PST)
Message-ID: <5d0b952a-ec07-4ebf-8228-a424fc0de4cd@redhat.com>
Date: Thu, 6 Mar 2025 11:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 02/13] net: phy: Use an internal, searchable
 storage for the linkmodes
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
 <20250303090321.805785-3-maxime.chevallier@bootlin.com>
 <738bd67c-8688-4902-805f-4e35e6aaed4a@redhat.com>
 <20250306095726.04125e5f@fedora.home>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250306095726.04125e5f@fedora.home>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9XJ1yT87BvdvLI1Og8cr4tmmdkZ0yIjSLtcTuc0_GSM_1741258045
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_024904_234340_FBD29807 
X-CRM114-Status: GOOD (  16.69  )
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

On 3/6/25 9:57 AM, Maxime Chevallier wrote:
> On Thu, 6 Mar 2025 09:30:11 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
>> On 3/3/25 10:03 AM, Maxime Chevallier wrote:
[...]
>>> +/**
>>> + * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
>>> + */
>>> +void phy_caps_init(void)
>>> +{
>>> +	const struct link_mode_info *linkmode;
>>> +	int i, capa;
>>> +
>>> +	/* Fill the caps array from net/ethtool/common.c */
>>> +	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
>>> +		linkmode = &link_mode_params[i];
>>> +		capa = speed_duplex_to_capa(linkmode->speed, linkmode->duplex);
>>> +
>>> +		if (capa < 0)
>>> +			continue;  
>>
>> Or even error-out here.
> 
> Good point yes indeed. Russell raised the point for the need of keeping
> this in sync with new SPEED_XXX definitions, I'll add a check that
> errors out.
> 
> I hope that's OK though, as higher speeds are introduced and used by
> NICs that usually don't use phylib at all, so there's a good chance
> that the developper introducing the new speed won't have CONFIG_PHYLIB
> enabled.
> 
> Is that still good ?

I think so. New linkmodes should be added on net-next. Booting the
kernel with phylib support on any device should catch the error. I think
even the CI should catch this.

Thanks,

Paolo


