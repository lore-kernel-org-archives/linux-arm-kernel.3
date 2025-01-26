Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8EEC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 02:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO1ms2VfnDa4Pg68YIbyfHsBiRPVKAqT5H3D+lbdTYM=; b=T8QZCPdI/HRufVLCo+5A6NLtM7
	k6LfwK3vpn1cITjZyJSLqOgIaCBQuyvtwtUvKIZLs8zjXgiZm52YjEFQGrv55nAq+H2pX3Erhopda
	ckcb8ZvYyzrzxsRDSWLT6CqigsXKt66vpyknrpDbVYS9PRWep/jGXIMplVbLO2TKb47FNXWc/C206
	55w1VdKHjE8Nzl/o5WmXkhOpX9OUX7VJTj21ZIZHz8Lxguvxm95dyY7SyuTOEDLCA7fJSey5vbkIj
	gE2vWAnBtgphLeIrFgU+mxtY38Qcnyrrz/XeXQYLrsF+k2IJ5emAbtBt8RMIhK+Ny0+MJQlmxWGkI
	gNWu/7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbsab-0000000H4ov-0IeT;
	Sun, 26 Jan 2025 02:41:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbsZG-0000000H4iY-01Mp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 02:40:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2165cb60719so58362855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 18:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737859209; x=1738464009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO1ms2VfnDa4Pg68YIbyfHsBiRPVKAqT5H3D+lbdTYM=;
        b=EBLKoa7a1sELDpQYQm3UgbPE8tN5MZcne7rxnbNpeXeSBm9nGGEZX6mVu/42cyzBI4
         EdOLqILjQW7UJmw5czjfOI3y8GwIEg0pO1H3ZpPEbdvF413ehcvKYunRosEhvPlwSPNa
         2MtY6IG3WVP9oTztU6qBqumxTGZb53UFjn8xJcwnNYEC20Q1+Vc/V7wXG3j4p8CEETaS
         tjrIHDv5A/WXkuUV1f/rs/YaP4LmkdGP8hlIFrmq8Sey5ovB5ErA87vO9O5mbxcrryHJ
         cEe8Ipio9/KkjvDiw674+d0RxCqEouPy8xkJ+BjhM0Dv+xITxfDycknThRiSlj/V8zE7
         7UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737859209; x=1738464009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zO1ms2VfnDa4Pg68YIbyfHsBiRPVKAqT5H3D+lbdTYM=;
        b=p1dxRDaC22xO5y1r3Rd79op3egyC6rOQFIfCa6GvOeW6uLVm+pQKOSWE+hXEMwGV35
         b07g2bsmoCK14Lp4Ki3p5EU/taWXiGEZubJeiHnWdxjilP3gTuuxJQqEpLi/QMh/rPkJ
         VZzalAZ32NbfaO/zI5VrYOBXzdrr5H9pBUGMsrcPALDVUzTFVQCJIqhpvXWALMNoqagE
         xtyIsGbpVASKEWQCt+Zj+26nSHoADdM6oiwWYaykoEqNTmzJn1gZxOhU3YTNmbHGaM2V
         oAOtMJOm1AzuSp6foXJYjqEzRF+zX+lem6LqRT2uXN32aJQNSZVIr+NTWVlLpuc8PSbn
         QT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1fu3xC4MO7AGmW2qNprvU1ioqZw32mBKkwJEdmGiAUcym3vysaDAxZEAiJ3CY8AcylTv2yfNyk6F4xkZRQhzX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqgx7FRoiaHDObGAtpXHwRQawhnd6OT8MCwbjdBNFkIfIheQwS
	WMxdEsDl+l6AY78+zbub8nfCaSXAd9rWQVpMe7qzX8ZoaqeEac1m
X-Gm-Gg: ASbGnctUFdLIVkbJE1DUFESPqOf7My9tTQaALTOG6LAF+MCS/1q+O8Lz5x/dLsj+OUF
	XM7OLkLlpcH7Y8EL38COkMMTKt0eF91uCUvW1kxEOArNZaL7nb3xfYmDMP1D0ExJ7wXt7WIv07h
	f+eA3PgKPmIi0CMfMmNQFzA//sLd6sF4EVQ9XzgDQvz6u6ulCHUzXVbC4yMWpRvuvpo6eRmDpkf
	puljxwIZ2XbaAdD2HKhlmbe7pFx1J/mksqLSbGUnH4H1kAJb7I8qjRF0qkp3tDQNUH4x1NrmLSz
	BQ==
X-Google-Smtp-Source: AGHT+IFsqUm3b34km4WyrcizVaYpgbqweOU0v8OuV1KGFi0lmdJUkL/Z82B1rVH2F3YAwm0jejyo5Q==
X-Received: by 2002:a05:6a20:a10c:b0:1d9:6c9c:75ea with SMTP id adf61e73a8af0-1eb21470203mr53454209637.5.1737859208701;
        Sat, 25 Jan 2025 18:40:08 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761193sm4591717b3a.93.2025.01.25.18.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 18:40:08 -0800 (PST)
Date: Sun, 26 Jan 2025 10:39:52 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ido Schimmel <idosch@idosch.org>, Brad Griffis <bgriffis@nvidia.com>,
 Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato
 <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <20250126103952.00005556@gmail.com>
In-Reply-To: <09442385-573c-4756-8c30-296631bc6272@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
	<bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
	<d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
	<20250124003501.5fff00bc@orangepi5-plus>
	<e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
	<ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
	<20250124104256.00007d23@gmail.com>
	<Z5S69kb7Qz_QZqOh@shredder>
	<20250125230347.0000187b@gmail.com>
	<09442385-573c-4756-8c30-296631bc6272@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_184010_047350_FB6680F0 
X-CRM114-Status: GOOD (  15.61  )
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

On Sat, 25 Jan 2025 20:08:12 +0100, Andrew Lunn <andrew@lunn.ch> wrote:

> > It is recommended to disable the "SPH feature" by default unless
> > some certain cases depend on it. Like Ido said, two large buffers
> > being allocated from the same page pool for each packet, this is a
> > huge waste of memory, and brings performance drops for most of
> > general cases.  
> 
> I don't know this driver, but it looks like SPH is required for
> NETIF_F_GRO? Can you add this flag to hw_features, but not
> wanted_features and leave SPH disabled until ethtool is used to enable
> GRO?

SPH has its own ethtool command, stmmac driver does not implement yet.
see:
https://patchwork.kernel.org/project/netdevbpf/cover/20250114142852.3364986-1-ap420073@gmail.com/

> Are there other use cases where SPH is needed?

https://patchwork.kernel.org/project/netdevbpf/cover/20240910171458.219195-1-almasrymina@google.com/
https://patchwork.kernel.org/project/netdevbpf/cover/20250116231704.2402455-1-dw@davidwei.uk/

The stmmac driver does not support both of them, but it will someday :)

