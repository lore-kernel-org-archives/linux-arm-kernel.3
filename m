Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40951C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJj9rkDTFOQk+bEPSTqUhazzXgNIa2C9a7aAoT7fQaI=; b=IBQKtmsyBFpyDijq7tT7wYWzxh
	98MKOIOeOeQynvAix0PkuQvfn6PKgTwjq/+hqlxCSF6RMtHrzywvatHSdr5QdcXzzitLkLlxmbidT
	Pc2ZKsEVbq+wCHoBFrTl1pbKP7uk3E5O5YBv/xRJS7KapuLwQ4ht6mshEaaFSXeoniBnDYDrgPooW
	t2lYrU7BlfHeX5wlIzZizFSFMzFmIdBAmw8uaqpks2GnaFOVi9qyzVhsuQKV0u40VRbr2y4WytdoL
	/ad8qmB40rpGqdJVTA3gF8d/zebq7AUvRGnmSMnzQP7x/FQvGREycrBK18260N29zciMxal2Ugv0C
	kapf6ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxze-00000005nws-2mN2;
	Thu, 06 Feb 2025 09:16:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwxX-00000005gT3-3OSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 08:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738829401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NJj9rkDTFOQk+bEPSTqUhazzXgNIa2C9a7aAoT7fQaI=;
	b=YLhK7XywOkAjpz9NEiE0Angvqk236xJzMJJnv4Wuc88QDbiHFcsens2sYsp8FnSsboa7jt
	eWirH7rR3ydxLGCxgz1vP3tw0hxEpoN6M92DGm9HaecF506rm2QOx+avHggAvW695a81tR
	X3Flv2JJJy97TMaLzUivNXn9skrnxds=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-de2Nq1HANbanLsHOARP-6A-1; Thu, 06 Feb 2025 03:08:14 -0500
X-MC-Unique: de2Nq1HANbanLsHOARP-6A-1
X-Mimecast-MFC-AGG-ID: de2Nq1HANbanLsHOARP-6A
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38c24ac3415so358320f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 00:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738829293; x=1739434093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJj9rkDTFOQk+bEPSTqUhazzXgNIa2C9a7aAoT7fQaI=;
        b=Gz7Jhw6lzlFUD7K6RvPjbqEfrxHe6QMtM72ZGW2Z4csBxH4NB2g8I1DGG1QN5j/azM
         0KyvzpaELbk9h5XjpY4uJ3/X/joiJX6L/2nMp++zVQ87siO28VBLvx/sGIBImuML7ivv
         +0VvizPz3flcvmZA3HFPq26A+TPoDGL+DOZg30M9vckjv4igfGYOHt0CF4aGbNHtJ3qx
         MtoUi+NKZKSunNfGEVjgoVtYOa8bRq2FThJpxZXXHqE7EfGgzlxTCKOGWxUrs/xtVoe5
         54L8oSzU0sXkC3VtzjI1oh+wrVVrOu/sH40ArJ6l5v+j4T3t7cHmDII/ocA6tRM351rh
         +XCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcKOya2UkevYhstcVwLkBihb4QTtBG5wy+UAivsbNUxQXCUOsYmZ5Fw8G6BQwcmW4wpxYiU6GRNRCwjE+TCr4f@lists.infradead.org
X-Gm-Message-State: AOJu0YxKCqzEwLYKZQV79PcmqYDcWKp4rjUINdSmIa8ytMvZqf0h0bSO
	m1ID8lxAk88S13VH1rr/AUuUV/6iLVdErlRE5jPfpEapMtc6ypng/11uaclSW7XGQnF6c1U/65B
	4UlNzkURPsMFc2XZA1l9ZRd3lE3QVFhyV+lbH1+I5pSzdxeegzS7QJSE36yF5GNqaRE0cjvcO
X-Gm-Gg: ASbGnctf4hhXZO2YUWJ6qb2ly0Ke7gq1nBXVJDxeKchwdufMGDdb1gmx2JhfXAtEFSg
	Xg+i4kbL401CYLhmwLu/vbW73m5I2uYDnVRFqiUuYFb+eTxk7eOa8cIAERcelcVNEiS5IPwOSsA
	FiDzlKxg0mcdZ2lCd65v506urYJ062QrwWy4visLB009oVzIf0zEOHOE2HqFjhMtc5UcyD4M2SE
	L0pC7p5YOJz35RIolkos9wHtfeqU52UMn1fZa7nrUYZoaomrCpA0C05rnfhdud0/ZlW2tGP3utO
	L7JQkWpK5LtBC3VS7B4Cm6sg3DZDq2QseFU=
X-Received: by 2002:a5d:64e6:0:b0:38a:9fdb:7307 with SMTP id ffacd0b85a97d-38db490067dmr4768112f8f.43.1738829293317;
        Thu, 06 Feb 2025 00:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPyrYegeID52tdxqQD7ciYyg2T0dKVG6S8SKrlSjQtzEXfxI41hNRfpZNFy4Gru5MLr+ZP/A==
X-Received: by 2002:a5d:64e6:0:b0:38a:9fdb:7307 with SMTP id ffacd0b85a97d-38db490067dmr4768079f8f.43.1738829292956;
        Thu, 06 Feb 2025 00:08:12 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm668008f8f.92.2025.02.06.00.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 00:08:12 -0800 (PST)
Message-ID: <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
Date: Thu, 6 Feb 2025 09:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] Revert "net: stmmac: Specify hardware capability
 value when FIFO size isn't specified"
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ae_ooMXaWoeOawY840F7LN1PH1xs-CGBEal1dCdtG48_1738829293
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_001003_915178_F5804CB1 
X-CRM114-Status: GOOD (  15.09  )
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

On 2/5/25 1:57 PM, Russell King (Oracle) wrote:
> This reverts commit 8865d22656b4, which caused breakage for platforms
> which are not using xgmac2 or gmac4. Only these two cores have the
> capability of providing the FIFO sizes from hardware capability fields
> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> 
> All other cores can not, which results in these two fields containing
> zero. We also have platforms that do not provide a value in
> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> 
> This causes the new tests introduced by the reverted commit to fail,
> and produce e.g.:
> 
> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> 
> An example of such a platform which fails is QEMU's npcm750-evb.
> This uses dwmac1000 which, as noted above, does not have the capability
> to provide the FIFO sizes from hardware.
> 
> Therefore, revert the commit to maintain compatibility with the way
> the driver used to work.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Given the fallout caused by the blamed commit, the imminent net PR, and
the substantial agreement about the patch already shared by many persons
on the ML, unless someone raises very serious concerns very soon, I'm
going to apply this patch (a little) earlier than the 24h grace period,
to fit the mentioned PR.

Cheers,

Paolo


