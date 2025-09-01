Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C152FCA100C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6X9nbNsT+7iMStoNetBnrQA9tNd6eAxAU3Fq1XXKe/8=; b=Rmq1YfOsjwGVuVCGSGrRxpTfKb
	aj5jBkZksdWo7Orcs+EbckbrczojbEBw5aKECemIUdi0lPN+wYFyIpxxWCsMoNZFbgz3KAv40fK0S
	Xm8j90IoYzu29LE6YoeRos2WK1nzortVG7GpaiuIbkyd1+gp1W7ObAEIYCz3k+x8gp+Nj3BEOqcXQ
	3qbDDjLCbwQD0RUAd+33aaKC7SZh5pf//PIL7IFIM787rmC7zXwON8E9h0Ug2vTyFTQIGK1t7C6yu
	QeR1/5/UmnVHMG7BivMNmjZqD5hy57N5t+sPHf2nlWMp4itt2fTSlMx0HjfGd4mGeqVHOiA/cioNr
	laD+gHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFx-0000000EY31-35bX;
	Tue, 02 Sep 2025 00:52:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utANT-0000000Df2N-2MpX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 19:39:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b869d3560so20094665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756755582; x=1757360382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6X9nbNsT+7iMStoNetBnrQA9tNd6eAxAU3Fq1XXKe/8=;
        b=UHtu4iSLyxMjUTeVvwia5GM/VSulCwLBumB7GKrTYnE1MMfaejyD1qGgQ1/tnGBa/H
         IeJHR8Tx2b+yR1BUEqUW/WwfLG/dzdv4FQx4mvOF3opF4XftOiTrRVO8aREU2HklEYUi
         qyuy/+45FDwW7Y0FT/fkj5CnNYUtUZ6slgpzyQBsIJqsGKorLyWr8LL2lQ7qkHLeubNc
         3QlsREyOXH6e7qmbUvHgqJM4imSfkgAhAUVvKpgT2rlTzc50801uVYYtcum+//o2PjMw
         QuulqEcsfbm3vy7ql+0hAx/9u5AcYmXBR5sHMuUY6Bbv2T4o0AdmzAU6CCnjkhaGZAzU
         X91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756755582; x=1757360382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X9nbNsT+7iMStoNetBnrQA9tNd6eAxAU3Fq1XXKe/8=;
        b=LnJPKbzE9Xxq50KykKoxF0UjORN+0dPNLXaTIu07bkezXfnA2P4jCHDa1n70fyLC//
         pEWbtsZfLmFNTTyUqVUhbsxZPL/7n1BmawrBZzUqxYkIY0cgnTVLQ3XE8/QBC34Zb8ig
         2paWjY8/ojOa9Ooae5LKmo5GKlBVXz+Buolrs4EfD/7WC/GN0DYCawuVsSMCWnS7xDKL
         UehT1JE1DkMNf8cYY7/JpbLyZwkh/ek7cBgM7dMYSkP8q+aIEefp/ZkKqu5/L9XKinkD
         aHbrm+IbhxFPMHuSIya4rquF0jwdfdLIvZrYRqMCYwwpnGpt6QZUHqfRaQmeM+roQijV
         aNLg==
X-Forwarded-Encrypted: i=1; AJvYcCVcPWo9ezrGSY/mpqJfEu81rBkVXAvlW48YlPIhwbP55fZ0SVjNoNeWQysBNjOX3/M/OwTyI0uzM3q30GAUgnyu@lists.infradead.org
X-Gm-Message-State: AOJu0YwdYeU4tnCmm5s4+kYC0nFfUOGsaEsgPMPBD8Ali8dYSpUUfWWG
	WvynRiUoXTwuwxpZuyCo6/M/uWSfgnAoPmgtHGCqlef1DljkOh+8yn3U
X-Gm-Gg: ASbGncvPKdkuqsV/LXh7IgwgyAfzXevCnl0bdgnSZ2oxMsw0KCZL+CcRDOWaKL0iCN8
	c4BSB6+/C0XFrkrXgQPnC32IgQpYWv3SEOg2cCKp7Fyt00wiUZyt23kOWrtcEvfAi8NOCiZDGuR
	gG2Ke/FF+UsfiSUUST4ZNMnpkKpG37pLSj0mvl4LSk7+mDpKhNR3xHBdOT93AMV9sGxWGIlD/pH
	rZ7a9J1shpf8s1dF9D7OWDfzST71AnYt5AhGtl4/P4lsz9NdHtXLlZN1xjBKBXjaITpF1uGj6yO
	0ySSBTCsCIUJplutIJTpxNPQWTp7LtsHXHynjmNhN1Z+3uLnYoYkJBsmu8VwNADqXYG60xPuRHA
	2wOwMFQzh4fvGJlAg4zSpnyHeSAJxDQ39WxmzZeHyACOLP+60ulQJyqThVZGcW4vqk6p+M1oelh
	jCjkB1iPTABnnnE1tHI17skQcmFIs/aJdnBMuJvh+fUSJJiGppm6gEBCLWNPa+Dn1O6TL0q28Oj
	KS/1ug7
X-Google-Smtp-Source: AGHT+IEWv4ofu5GOeP6vg+xN0NWGIpi5fyqMqNzrzpvalEPnH1srOBCGFXpz/ezELB/XIzilfqMKiQ==
X-Received: by 2002:a05:600c:3b16:b0:459:d709:e5d4 with SMTP id 5b1f17b1804b1-45b8549c493mr71879185e9.0.1756755581598;
        Mon, 01 Sep 2025 12:39:41 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f36:d00:7965:aa82:4012:7ac0? (p200300ea8f360d007965aa8240127ac0.dip0.t-ipconnect.de. [2003:ea:8f36:d00:7965:aa82:4012:7ac0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d6376546c6sm6863169f8f.60.2025.09.01.12.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 12:39:40 -0700 (PDT)
Message-ID: <a5411ede-5312-4510-a559-e3b09e7e763b@gmail.com>
Date: Mon, 1 Sep 2025 21:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] arm64: dts: ls1043a-qds: switch to new
 fixed-link binding
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
 <fe4c021d-c188-4fc2-8b2f-9c3c269056eb@gmail.com>
 <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <aLNst1V_OSlvpC3t@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_123943_711514_E6F077B1 
X-CRM114-Status: GOOD (  17.70  )
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

On 8/30/2025 11:27 PM, Russell King (Oracle) wrote:
> On Sat, Aug 30, 2025 at 12:27:23PM +0200, Heiner Kallweit wrote:
>> The old array-type fixed-link binding has been deprecated
>> for more than 10 yrs. Switch to the new binding.
> 
> ... and the fact we have device trees that use it today means that we
> can't remove support for it from the kernel.
> 
> I think it would make sense to update the dts files, and add a noisy
> warning when we detect that it's being used to prevent future usage.
> 
Usage of the deprecated binding was added to this dt file with ab9d8032dbd0
("arm64: dts: ls1043a-qds: add mmio based mdio-mux support") in 2022.
At that time the binding had been marked deprecated for years already.
I think it would be good if dtc would warn already if a deprecated
binding is detected, so that CI can complain.


