Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C3D65553
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCbQxBDGwoMQR+Ujqm6pGlRA4HnmMRyNgadk85WNZdc=; b=OupuhSaOqBcEQNc9ZpLxgEz/sV
	NW2EnIC27Z+sJmQLkEB622swigZPRedKjvGzSpV4npX9p0oMFuw5lR/Fya1V++bpy/w++gM5X1fnu
	VlF++v0AcdxpWp7XJ7bvBpf8qHRBzBXT5Ig+wlVuMP3d7VemZ3pHwr/9Rrk+PJUsFKQ0wX9lbXM/b
	pl/TAXOKr/izL6SiAMFG11iIScIzXlrRIrJ0n1UAmqTwanOxkB4nzk7rQncYJDUqoTdPxDImM/Hit
	yRRB9QY0h71OE9E/UZohqTT70Mp/Idg6mIUfEbKkMWojBYTm0GS3W5p+KjUgaLxp9e6vzAKofAxqr
	/PYwhHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG27o-0000000Be6i-2ake;
	Tue, 26 Nov 2024 20:25:32 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG26r-0000000Be2W-3al1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 20:24:34 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ffa678ddd2so51155961fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 12:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732652672; x=1733257472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbQxBDGwoMQR+Ujqm6pGlRA4HnmMRyNgadk85WNZdc=;
        b=aqovNGkSiTuUJdpm719pb07I12lVeoOuqFXCoVvu55fOJsRQ7p5YQbIs+vISnBVHlw
         xvG6FTLIqINGvldP6oAmYGsJLQKZmTlK65r+MrwAJknSVVif5D676Y5Ztlkkz/P8btq/
         YMNsWnWqilLGou7TSPYi4xP0iHLSjPUe4F7q52v5cxrZZQCbQ5su6Pie3+OvExUpLn9s
         86fNuNUfQXfe08QO6ocmNIqVT1ydbws3KdmrI5H0XlTctb2sKiIcaSPBDFOEwcskN5iS
         8hMJv8L8dVyDl1wuQ9MqEZ/aoj/vAAuwHVfoCECVbby3/0FA8RhttA7AXxa3kxTN+DhP
         09mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732652672; x=1733257472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCbQxBDGwoMQR+Ujqm6pGlRA4HnmMRyNgadk85WNZdc=;
        b=dlxtRSVDUOmMF+B8a4bJHN5kLM7EaNS1Cn+aJqR5EDl2hBlGciuOpua0Hcj971H5F7
         5HtJwp/e7fYeUL6Gqv6ihQm7kKtd6ONtyWC0bCqIJXyQm7ao9JMmy9pNBbw+1zMHJOkW
         ROk4huDVmU/f5fWiuh/lpgJLvJUvJISef+Ldyu38IDPmCYcwAvUmi3q/vdKNXruRrvY6
         RWTPAolCGyxJiCXGCuMy8PYW8MPWO5gGz7LjepWX4xolHtj1nRSOMYfDDiKOAWBz5bZ+
         0n57fyD6j/0/12ik9dWbXuFjzfZcR2fio6W8Nn04qrigqQAPsWSVn95+ZraoWtH4DWuQ
         U+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMKH+2kWZH+7M1rzBfPfkB/yqFSFf1zikAMCZOL/Bs/n9XWDDNi9RygliVLtXfrLn2gXD+YVabz2AmiQ2hZu3f@lists.infradead.org
X-Gm-Message-State: AOJu0YwbpJvWUE3u1ufolp8z1TolCE3wSu4uoqFKx15cQi7Z7+O/h0+N
	uAACdUJa7dcKCYdRoIQvGjes9WnvJrjeA4X5OkkvvDH3M9/LcvGr
X-Gm-Gg: ASbGncvFTcbxPAgj8BpuQObUMWNzBZQCPcWyx0JTNbIfzMv4h6SRj/fl5efWy6MVywk
	/xiY3evGpu4JL5palAQHFBUcJd46LEFlaOw83HdCcsEizwLGjTST6qcstR6tW9pf+BfjSTaN6aK
	vK0mgRTh/+NR21nZ73I/BLJcqi26s3xgID27eLcRooYT8s+IDD3i4nN266dreejQMtJPvVur4ll
	k0n3bu/peWLSi+N8r4MQFHwVetQZTEJQBPpY/rHRcPL2KD6ZT3J9pCw4fKhLuSkFAqtDYQXMm+2
	cltIja+ym63kPUF+Li2ByakDtp2b4H3XA0AqQAiurBwMrPZM5HVJzWgzbKDNY0l7EwiL6npNwCD
	6tC1f/y4e/dzCkTKGxu6awnGBNEwjvQjIiJephn9j+w==
X-Google-Smtp-Source: AGHT+IEuYukIW1SzzFpdM0JiN5cbEMmlY2B1L0cx0Zr+6akBeltzj2q8qYuyGTdNxVhxgs1yNg6PuQ==
X-Received: by 2002:a05:6512:2395:b0:53d:dbc4:3b8f with SMTP id 2adb3069b0e04-53df00d1110mr236390e87.13.1732652671453;
        Tue, 26 Nov 2024 12:24:31 -0800 (PST)
Received: from ?IPV6:2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b? (dynamic-2a02-3100-b1b1-7000-f43f-954d-8ddd-f91b.310.pool.telefonica.de. [2a02:3100:b1b1:7000:f43f:954d:8ddd:f91b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa51759737dsm601261566b.81.2024.11.26.12.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 12:24:30 -0800 (PST)
Message-ID: <6df1ae83-32b8-4e0d-93b2-42eb2c47f1a7@gmail.com>
Date: Tue, 26 Nov 2024 21:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 05/23] net: phy: remove
 genphy_c45_eee_is_active()'s is_enabled arg
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 UNGLinuxDriver@microchip.com
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <E1tFv3U-005yhl-LJ@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_122433_899914_16CDE7F7 
X-CRM114-Status: GOOD (  10.63  )
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

On 26.11.2024 13:52, Russell King (Oracle) wrote:
> All callers to genphy_c45_eee_is_active() now pass NULL as the
> is_enabled argument, which means we never use the value computed
> in this function. Remove the argument and clean up this function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Eventually we should be able to get rid also of the adv argument
and use phydev->advertising_eee only. Prerequisite is rework of
eee_broken_modes. I have patches which I'm testing locally
currently. This can be a follow-up to your series.

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>


