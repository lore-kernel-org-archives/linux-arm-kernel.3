Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D54DCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=; b=PqQtdxcE+zoWdUYzuGdRaT4aR7
	rKwBFPPFXCF/IDc1+p86SqxF87ty+M+yQ5Nut5BERKBpRK8FhIdGCSkSO8p12IlH8qR1RbddvaHQQ
	mYKHESYHxblYBoi2/yznCdkNuKd6+fCztj5FCfqZ5oe9TGg/0ZihfoSLftx+fBxM4ucou0ced0Vx8
	2gRezS46Eb7k+GPtUYJth7XVFDsFefOH5ltmXYTSjobLZif/ZwWf/9tosWHJ/7j7h9uwFzB3IrpcP
	ef3qHIKXKw8US73hdoHdm1jBzVk4g+ru8yrFimirJvkMe169h8W0cxcSrQjhAxawwJXUovpO/r13t
	mHKNzJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGNO-00000005RFg-3xZ3;
	Sun, 18 Oct 2026 02:11:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGNM-00000005REw-0INL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 02:11:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c3f10d2f255so78526166b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792289510; x=1792894310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=cTQ3kdCI8ts/g5K2fg2b5lkMvE1ImecnwWm4lHnf/MQZdoUVbNWA5jY4b0prf1MHc3
         vPWcA8T2C1C2wzu9YDOG2qnrG0R2gyyxlGGVA6Gpm6mQkjXm7AerpHJgPMW+yGgDGYIV
         U4Livw9/Wl9zl6R/hk5dsIMD5zG6tXPUAGVyEU8MI1GIAUrv1QjNqeziWiwhC69xGOXx
         36irSAMyVT6FFpfr4BWRYRIxdPH6gqoT6hQpVS+hzi00rl8EHZv0rKXztSk/l3h5Z1cJ
         4kFuDjBU8fqfnqdAUOFHpsuFlzGpb9m9Te+qEQOUjssgPBCXMN63FN2KNp0WTl6PwTO6
         VA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289510; x=1792894310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quR7zaG5HvFKkoAcyflM6P6NFsJA2yI0PSyMysQvzs4=;
        b=f+E29R9nFDHAz3UvI1/KLPnyPTv0toNAZRpqbR5j+t4A9PraiVcHDZziK4cm5emd8g
         R6C/AxLaZ9iP2GLf2ZfwVw1Zf10YzlDh5/mRouksybohIsRikd8Ka7tl6nHhckNlUSAM
         wZhujxtdMosDiQI/6QmDn+8SqArBzkd2wSDsGEYb3Iynoi71/mgkE6ZgY2XboluITcMP
         8EsV8JL4iWwc8NIh25Ue8n2pG9TAB7+KdAXYPnaXlD1riJnHxsKrIqulGfRwQgVG11kc
         nnn8cXVDD97+vcl9oEfOYaguRWDV7ZQ6wDbxHmwJxoLEGtUT5u0EDYSEsTK5TLXXhbyq
         dXyg==
X-Forwarded-Encrypted: i=1; AKwUvByrO0uMQxVwMGV+nK9H08zHucxx1I7P8tG5FzbsqcVNriuQYWsC5jpX/av3+gwGUCyIF2GvCO4iIaeK4Zrfa+eb@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8L3cayEon2MvMdvrcC5D9N3VMXai/j8wFgGSXID90nh29l0hG
	eaJAYwymp/cUi868sgEpw9f8s3OFpt2KZJ50xXm4gG6YkOPxMjfumS+R27PoMYWv9Q==
X-Gm-Gg: AYBFou0b6+cjXI9sM0JjQnARdPlD67OjLzD6vqy4IYBikt+yFhUuy7gTYrA3IsG8MRH
	ae0YGCyzZuc/qMokRmxLqknNpbXA7D032MrJXfk4+eiR/20ZAaUMe858Z/ykyCTmGdY9wS7srm0
	axsjO9kwzitZg0w64c6b7MPAGeZZOOwZnQQfEn/D2ToYlRLLjEjfiIbMU1mAfrgjbq3JiBuTN09
	LwNDvZobbkxXfTGnqP2JVkmTqtFLUMQLDQK1l6czA9dbdjFBz1UH3iBGHo8t4zccnpcLaFyY9Qz
	dLNR5KobbHwNFYyPJXRFWai5WyGORcIo1mVPtVHJoCj265pE7JED3h6p99by7z4ionU20S1HdFt
	6h+lU5Ul+47DBwwXAnI0igeDmUa4CcIxrp9UPMPWBfmaJE3PKGO2IE1MSQk/5htajq2nIk9AT/S
	j/lbfiVQJ/OeLP3Ud3VxAXJiO8sYa2kHdkVUNkMqlrsITNYoRxFLDzgV29z0NUs5Yo9UPijk7/v
	C96ccX9jG8gLTg1vVS5sn/v6eHVHwDEj6D0gjjF3t7mQrBxQMazf431Rj9wUkBwEIWhzm0pOjrn
	rpxW3ZGOyrDo7UlSnn/e/BaSNQUWusCWWSNnnVrCglILA2Cri+xoxp9wD9b3WbsFlbmAgJjz+1M
	3xDXaDLgP1Bik3e5TxppcXsY+b6vwNkqxR11CqEgflnI8lT4Fw1YPZXeDBXoWoDSkBzqvVdhI+/
	LUgFQAyl5HoHqVziY0PdmXNO0MTW8bvVQWfJ4RFWwBHm/+zfjGwlcwr22E+Ox83nDSf2orpGXgC
	q2D21It
X-Received: by 2002:a17:907:c48b:b0:c35:d50a:1356 with SMTP id a640c23a62f3a-c41a08dc5fcmr283934966b.42.1792289509761;
        Sat, 17 Oct 2026 19:11:49 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247424f103187cc9af620d661.dip0.t-ipconnect.de. [2003:f2:4742:4f10:3187:cc9a:f620:d661])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1835sm224698366b.79.2026.10.17.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:11:48 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:11:45 +0200
Message-ID: <20261018021145.3769432-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQkUoH3aa-J5-vf@chamomile>
References: <atQkUoH3aa-J5-vf@chamomile>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_191152_129172_56A75748 
X-CRM114-Status: UNSURE (   8.26  )
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

On Sun, Oct 18, 2026 at 03:43:46AM +0200, Pablo Neira Ayuso wrote:
> I think we already mentioned this only works for hardware, this is a
> no-go.

It works in software too. nf_flow_offload_forward() and
nf_flow_offload_ipv6_forward() set skb->priority from the flow, see the
nf_flow_table_ip.c hunks. The selftest checks it on veth, without
hardware offload.

Julius

