Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D982C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlFrHWCBZ0GRvhfqPcMu6mVAR9pzqmTshDoLe8nyLtA=; b=bsswt8D2/59XQw8rcOwE/dd4HW
	TzTEHmmHMwcLHGV8tHfoA3+xG+X+U4UJVne2FlgcR2SBuMfAFIQpSDwA/fAaFj6Y1ygmf4miPytIR
	rH9D974MgTFy9+BL1rZvIIqx9maEhpS7RRrHRQe9Z2w2K9cuA8imw5vwu3uM24AhTvThH0yzMMFov
	vSS8tkfw+njq5MAOr6EJwYN6L5b2qoNoXtm2EBxWXmTkDI/LVtefUzhU8kVPLRH5HyJrVVpsD8M+j
	b7Bp0GmuG2hMl+c0isbTPjWcEwuPMSygrCDx0sko2A3tkFqaQRiKSwNI5qA9tqB6D1JuzUNAk2TDY
	JJVuRBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ58l-00000004zrd-3aLl;
	Tue, 08 Jul 2025 10:01:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ4VI-00000004sX8-3jgb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 09:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751966442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlFrHWCBZ0GRvhfqPcMu6mVAR9pzqmTshDoLe8nyLtA=;
	b=CgperA7C9IUvRXD5rN3JRI4rRW1Au1JZ3NQ9tRVy5a+NfYs+ODh3+kcd+ZZ7lJAflVpH3z
	+VfmxpcOhZwz3Q6kdR1CQADi0kkhqzRvHallbRLxROHiuaBr/OAFWoiqn2/WdZXymxOqQx
	xA3OZB6yg2OMIrULtrXfVGL01Ep17+Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-2rDPwo03NQ6BhrlJAUz4EA-1; Tue, 08 Jul 2025 05:20:41 -0400
X-MC-Unique: 2rDPwo03NQ6BhrlJAUz4EA-1
X-Mimecast-MFC-AGG-ID: 2rDPwo03NQ6BhrlJAUz4EA_1751966440
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so1692279f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 02:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966440; x=1752571240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlFrHWCBZ0GRvhfqPcMu6mVAR9pzqmTshDoLe8nyLtA=;
        b=WVqvHL+iHx4N2V+YhlqVOvjIbTc2YEOOKgWUrdLdDGjRmkM6ScrBv7DWrxS5UwNMup
         T/72o3aJ3NTe5gGNA1P9X++tw+XRsdtyf11Q4oqZd990BzbOwnPK/Rgi7gmg6QaljZln
         NCPpl25sA9Ip7u3FF1wRyCZSaG7IQ8sTjIp2w33vn8+lN55LjZgporPeHjVw60L4xdDX
         SGVkDo3zOswyNIo0qncnm5cLpsTP3aX1i9PWUR6DZ+aRNaaql/nTiW4kBQztxJ1Z9GUA
         oJWOhxQLM4ukFuIzlzFUj0KPFMnm90YePv7hVWwsiev/gHjjFMgGhXVj4ihRslW0ha0Q
         2anQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdNMXJxOZoPHlzGHAyyJGfN0VZeEpIdN+W4Rg36e+PzMUyUycRs/E0Dhllg3GaxYG0/JAXIT344E2YaSOuR3ha@lists.infradead.org
X-Gm-Message-State: AOJu0YxkjudWtS8mqKMJYps79oaXlWiXy/FEUFbso61GehFy1axzMygo
	RvL2KwLKxLeGzqwjVPdKxGwZYE6xeEFi0MDpl6RVNvzROJdP6GRe3wcBI+70JYNbIHxwH2R6HxL
	oZ2Nh9hIgNzk0KyJlpIyhqxl//bvyQ1wdaH3Rj6Q1RWtlDabLcMcTQ/WUKdOf7QLz+DHvKonqkp
	Do
X-Gm-Gg: ASbGncsEkmAj4nD91ubomaxAAtcFoaHWRGZJuC1UNltdpqaxF766U/VQ7ThAsM6P2uK
	vEZQvI/kch4UDdaSekBITxBUNK7DlVepN2q3JzMmpZr95UAqXyRt/bFBObaiHJMQbHea5GsyXi5
	Md6UGwA+IBOzOO76/B5u0Jr7XDEcui0TuNfBx38oanEvpgGyL3GrFaDu3fa21GNEwGbAT0XrkDe
	d7lerd4KPloh5385DieFgcq8kRqnWEcgyjmr9A907Yf92hx8npnqp0/7AVmAOmkGxylY6Z0uUA6
	0dW4gPUvSACSHUzimf7N8oeFdxDm46mdz9FPu6rN9l20xWFXSe+HqmOHKE12/Ldhe6nIqw==
X-Received: by 2002:a05:6000:4a10:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b5ddea1c51mr2238703f8f.53.1751966440097;
        Tue, 08 Jul 2025 02:20:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh8nD1EiPG7m0mg6QXkWYeptqjWcfmnci5Vnj6Jp422MialDVXM6maHNA8ghrBApwgmMdE1Q==
X-Received: by 2002:a05:6000:4a10:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b5ddea1c51mr2238665f8f.53.1751966439672;
        Tue, 08 Jul 2025 02:20:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285d3c6sm12548795f8f.95.2025.07.08.02.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:20:39 -0700 (PDT)
Message-ID: <b676eb1b-265a-4647-b340-be88559a3561@redhat.com>
Date: Tue, 8 Jul 2025 11:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/2] allwinner: a523: Rename emac0 to gmac0
To: wens@kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
References: <20250628054438.2864220-1-wens@kernel.org>
 <20250705083600.2916bf0c@minigeek.lan>
 <CAGb2v64My=A_Jw+CBCsqno3SsSSTtBFKXOrgLv+Nyq_z5oeYBg@mail.gmail.com>
 <e9c5949d-9ac5-4b33-810d-b716ccce5fe9@lunn.ch>
 <20250706002223.128ff760@minigeek.lan>
 <CAGb2v64vxtAVi3QK3a=mvDz2u+gKQ6XPMN-JB46eEuwfusMG2w@mail.gmail.com>
 <20250707181513.6efc6558@donnerap.manchester.arm.com>
 <CAGb2v64UTr1YSm7VXtzk5jmD_J_20ddPcWww_NPzx-e5HvaOpQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAGb2v64UTr1YSm7VXtzk5jmD_J_20ddPcWww_NPzx-e5HvaOpQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7FOCjrSqWkRwPnZrbJJXPn6X0jlsCqa8cbM_eUAiYS4_1751966440
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_022045_003923_C26C1FC0 
X-CRM114-Status: GOOD (  13.24  )
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

On 7/7/25 7:34 PM, Chen-Yu Tsai wrote:
> On Tue, Jul 8, 2025 at 1:15 AM Andre Przywara <andre.przywara@arm.com> wrote:
>> So if you really insist on this: please go ahead and merge it, so that
>> the 6.16 release contains the new name.
> 
> I'm afraid I insist.
> 
> I think we still need an ack from the DT maintainers though, and then
> the binding change would go through the net tree?

Note that such ack could require a bit of time more, as there are a few
patches in the DT backlog.

/P


