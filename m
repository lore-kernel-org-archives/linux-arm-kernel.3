Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E69E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsZWLwNN3Dj8vY9Jgz0ZZvXQlClGHa97ZSTKANn10HM=; b=uwmIXtvULZ2CDyI6Q5CQjSqiAv
	ElqVDezKHbQayw44w+6i3yYN6dAeto13PIDEHl0z2ouNMH4q3lvo/iA8YlH3LpIYjg605VZxGJoRt
	dRO4BCB5d83ut4CjKUDxGDGjNvI2ZUA+vWvFBIVaiPHcMrSCpRU7Kgrbg2vI9oZAE5pVdxXd64bUC
	bDm/oz0Ni707ebz9td83NiPpR94TyQwVBfH0g1tI/Y1VJZSThhFS0rpQBnqxH2oJOQ6bnKe8Z+Hsm
	I7zIX37NmGR4rzXGMZQmZrRDOuTszyJvXdsM3z0ZBO9/mN56HSaARhKRT+FyEppi5U1LXY+L3ku8u
	m3xCLRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUJF-0000000D0yW-0rs1;
	Tue, 17 Dec 2024 09:56:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTuT-0000000Cve2-1MX6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734427831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsZWLwNN3Dj8vY9Jgz0ZZvXQlClGHa97ZSTKANn10HM=;
	b=SWHJ/Ox+4B3pNll7+Yj8KTQoQ4uDiUCINokXmXCTvUhzjDip2Oio9gnTHH5Lim1DafcbwY
	8NxE3j6PVxZtybV+eI942RldL2k+lo72IjMszwPfcw7dLTdWzlL6i8B3uTi52XML3luo4o
	In9iatf156Izl07n9uKRbc84xBdcyUI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Zyl48yf6O2S7GqmvDJKh4w-1; Tue, 17 Dec 2024 04:30:30 -0500
X-MC-Unique: Zyl48yf6O2S7GqmvDJKh4w-1
X-Mimecast-MFC-AGG-ID: Zyl48yf6O2S7GqmvDJKh4w
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385e9c698e7so2599290f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 01:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427828; x=1735032628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsZWLwNN3Dj8vY9Jgz0ZZvXQlClGHa97ZSTKANn10HM=;
        b=fgRrO3gpKM2+BeVcZI/XETRKFVHX3dpyorR/IDnWxMvfjp2O8yMNXyharfimUcBOKn
         3h6m727opWvV/ZXq+bKrkqV8FxUxk5oU7zMAhxcf1G1tAv8DY3Q4uzrPIl8bsLcVu6Do
         /yr1pHLiAcow1WWUWiggJcx8FMqU8NDWhtW8DR4yKzBl/b60FCC5BWcGMIoHFuFssM0D
         tJXDMf1FBv+XbT05MdzCsGVJBskZulHu3h+Ou2qK96lPk6fLCWq1Hhcn/269cbuP23PQ
         MPBGGtOjHYA+ju2q0o6qs6vE6VNiPvBxo/hsdFvwTs6H/9Bw3MGFyFnys4fJglkCYws7
         LjRw==
X-Forwarded-Encrypted: i=1; AJvYcCU01JL35Kl7lpIccFlhoDQBdEWxhMvSvaDuD3h54MBPTtoGWym9ycxjhT8uM6OoK+WH4ZzzjMu6prkPWjsFmPI3@lists.infradead.org
X-Gm-Message-State: AOJu0YwwtNFTtzt60x9H29BVnYS9eIqPwZSfPxgmQ0bf8Wh70cRZx/o4
	PulEz4UmkL0u8wvm0VjzwStupUJ766UaXQkzERj3drgO4ofvkJckxgXVSHa5JkSBfwOczleDiHJ
	ltKeoathFNDcdZ3nWFssim1AL8IfrY/tzN3FP4Wc3Bqy3sBionppQTr+hFIp+P/BXC+9g+bEoS2
	NsIDUoqWI=
X-Gm-Gg: ASbGncurNizRLymmImXy9hoxR+8B3fjdtZvaz17k5TfYO7YQd/gVxNpZnEJ3WhG6ZqX
	SZQfafJzx/zJG3yLNq63jdNQpxCbZ0JhTjxhLk8TiKwokMqFnVbShhlkSzCW1IgXy/yjtAvmgBm
	Ge77kGDwKI/Q14VmQ5qh3/JQ1YQaT+iTgqD1IsTjELsViOBQ5jjbmKCsIKiSvybonRyRrM8le1S
	k8KmtHdfkZ1+eCBHBQBd6/MSDmZpxV7R7FvG+gQMWsUWyEJyyTUmbuHgacepvfgV6lQIbJpUzH5
	l00KyohLPw==
X-Received: by 2002:a5d:6d8e:0:b0:386:3afc:14a7 with SMTP id ffacd0b85a97d-388db23b794mr2025557f8f.7.1734427828127;
        Tue, 17 Dec 2024 01:30:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGfqm8yOmdd4TkH9Nm5un+/9BqyR43RiXrtTTnaPexsrsZBcqLS0wyDa2ydDNBgCgdLmOg5Q==
X-Received: by 2002:a5d:6d8e:0:b0:386:3afc:14a7 with SMTP id ffacd0b85a97d-388db23b794mr2025421f8f.7.1734427826252;
        Tue, 17 Dec 2024 01:30:26 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c805d489sm10688171f8f.88.2024.12.17.01.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:30:25 -0800 (PST)
Message-ID: <9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
Date: Tue, 17 Dec 2024 10:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1] net: stmmac: TSO: Simplify the code flow of
 DMA descriptor allocations
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <20241213030006.337695-1-0x1207@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DQsV4y6Itilm_Hsj2MZXY6Eh1XhzTnNd8ZwVknWeuaI_1734427829
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_013033_434045_86118B0C 
X-CRM114-Status: GOOD (  15.15  )
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

On 12/13/24 04:00, Furong Xu wrote:
> The DMA AXI address width of DWMAC cores can be configured to
> 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> get a little different between 32-bit and 40-bit/48-bit.
> Current driver code checks priv->dma_cap.addr64 to use certain format
> with certain configuration.
> 
> This patch converts the format of DMA transmit descriptors on platforms
> that the DMA AXI address width is configured to 32-bit (as described by
> function comments of stmmac_tso_xmit() in current code) to a more generic
> format (see the updated function comments after this patch) which is
> actually already used on 40-bit/48-bit platforms to provide better
> compatibility and make code flow cleaner.
> 
> Tested and verified on:
> DWMAC CORE 5.10a with 32-bit DMA AXI address width
> DWXGMAC CORE 3.20a with 40-bit DMA AXI address width
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Makes sense to me.

Since this could potentially impact multiple versions, it would be great
if we could have a little more 3rd parties testing.

Thanks,

Paolo


