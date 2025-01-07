Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAA9E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=; b=SZidEtM51DQHhpYB+1/G706dQp
	L4CvbQuvtEneVy8kBrokEb7cPlKxksmseMpD0ob02j/uSL1gGBkjH2lJo6pPXjNyCcBoH7QtPE3s0
	SGrAptSLwxe/d13+iU8Ac1HOM1Tp5cf2u/tY09E+CWOTDsGXoQx1AbV6LHluH+9WWNfJLq/HBowtR
	3yEPDT2qTEfvyxmpC19sFdEfD4e6PHxUydQjmnYZsnGQ3e4mXFqYPc01yWVo5jbXO1EJ7H78g1Ez7
	QBk34lVHlniuJdWG9RiGmT6GIFV6Uf+ygzvn9afTnLgTbMkDlq4yGE7q9sa75933lHXx+lA4lsFuU
	p/Rnyc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3Dh-00000003fUh-3hne;
	Tue, 07 Jan 2025 06:37:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV3CU-00000003fHl-4BN1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 06:36:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2165cb60719so224351645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 22:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736231786; x=1736836586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
        b=nJxJuY0PVxTVacN6btX92SaOodd7Iv+pTv+m6RJtAbp4Z9ItD+S7UQWA9cYlRSuKkL
         BCrSvJG2In6VNz2OgandhcgOYjX6iZLJ0fmqzuYSuDj2CdrWx37Ijf4DBsvFFOXlcTj5
         2mMMxYuwprXnMJ0jqsM60ZVjZQBR+Olgotd7Z4L87Ip9xPeA0d/xWCv2VK2PS1mbM4iv
         fyLpaZX0+v15QeRBoALw3VkZbLkwogD5amTJTbse4wFdYoRabFja4lJJfp7MzXDztLF6
         WiSDUT8ikxbPzEL3sKAj/MS1goBXJ3by3m3i2etAgAbYCIRCF4Utt+bG9lZvT/BI1Ntr
         DfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736231786; x=1736836586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kng/mpbUzhaJx0h/7Fasw6w2qS0oY3rIDnnEx7pNUzQ=;
        b=CoIcs7xtnhR+kYlhC2ckp9ItwOFZ1XuHXvbNhW/pN7a4GrMTec+QY0fs7RKuB90D75
         Hs4napzgTY1FrOSa5o+lRXxvkIZM8+rPeYqJ8XM8DHW9GO97CeEcYKLXpZazFzo4+djq
         WCmTDwWX3nx5vyGkncb8SCyomFucW8u3FgSDPi6jqqqFE1snr/WM4EDsdkTZU/qopK8y
         ZGZ8XDw3k7tkXmBipPSYLZ1s1lmhsoUh8OC91rUMMt7odC4eDeoMKO64dp30Xg3oUUvR
         dXTPdfuwFf4X56qeU3Wwq2NODTHlzvtHrNO+uNaOMDMnzxmFDF9XxDjZAHimS6zg+DGZ
         yOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+bil5Z9fDpSIq8MdybuOEgjpq4nLTsVuO5L3XRaZsjFM9coBH7R5Zq3bv9VVFYGQVeS2knWz45VoHkPamOzkA@lists.infradead.org
X-Gm-Message-State: AOJu0YyTc062D83VbayX4CucDmBVPsnQcF/Aj3bOpiOag9H2PGQeuw2s
	UGfES9UjrC0zlzQRiNVeLBsUZW/QpCh0IGX41J5IH1uB4jcsg9+a
X-Gm-Gg: ASbGnctiFTKelWDJKgDPYtO8LGcuNcOrXaWhM0JEp7WWanW1sXpk/Z+uPHNHvjKL9KS
	gWIfjzyV5tR3w/aiacNzEr4qns+p+ufvmi/0ZDpso9V7GR0/BY6ftlhPFoECX5IlbmHoK5IvXPF
	VOKtE+REVvxYECy+cE0DbZXASmw9Rr7ErrYzQfqjIDtzORxYxH5z8wV5kj+rFNc+G6Q/aHAWCXH
	2F4JsMt9DWnlZH3Sc9sQC3bGOWTjyHXqr7UwgL8pLFSRxKwYy9FrSh7nuUBuprzl1BzX0+iL7X1
	xYMacmWD3CUhK1bV7cIHTSYjz93CgDleVVw=
X-Google-Smtp-Source: AGHT+IFB3swUN2iLMUEOpHvMus0FiubXQryQDXtAgLSPcX+ECwaEuxj3DZQ/Bf/+X66C3yI9GBLI7g==
X-Received: by 2002:a17:903:94e:b0:212:68e2:6c81 with SMTP id d9443c01a7336-219e6ea0223mr977864255ad.24.1736231785959;
        Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a739b423fsm23758445ad.198.2025.01.06.22.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 22:36:25 -0800 (PST)
Message-ID: <83c11616-ac3a-48b8-a513-ca000ff9d48e@gmail.com>
Date: Tue, 7 Jan 2025 14:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema for
 Nuvoton MA35 family GMAC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: edumazet@google.com, peppe.cavallaro@st.com, andrew+netdev@lunn.ch,
 joabreu@synopsys.com, netdev@vger.kernel.org, schung@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, kuba@kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, krzk+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, yclu4@nuvoton.com,
 conor+dt@kernel.org, alexandre.torgue@foss.st.com, davem@davemloft.net
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
 <173592330334.2414402.4730979254460270593.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <173592330334.2414402.4730979254460270593.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_223627_037127_DA143C40 
X-CRM114-Status: UNSURE (   6.72  )
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


Rob Herring (Arm) 於 1/4/2025 12:55 AM 寫道:
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches*only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.

Got it. Thank you for the reminder.🙂

Joey


