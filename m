Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07067C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=; b=3HBR428uq0lsTSP3N9SNlPIo25
	aEb64dbys900oEXcM7Tdh0HduOgA61Xzcc4mBgF9lGcixKSZqADmsAR0aMWcP0SG7f/HYymJXwcgw
	gZYhnh4KcMysjL+oSJQf1JPMAggq/qKzd2Rp+JK99ZSiyxA6Qvt0zAc6t73kdLHMwlS/OlzJ3q2UT
	bxwPWnjzkX2p3B+7r8VNRll4+BnXIkAgexPqu/I+9FpM7GDZO6gds+upO3ZFQLnwLVQ4QKl1rOMz6
	08ubfeDrfZuzuYnRdO/T/H9nSlvjlY8vRJtOE5YrGWTyb3z/i99iV8I2uev1kEa2WqNCCzxW0Rn+/
	ye7rZztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTyc-00000005Sd8-023j;
	Tue, 18 Mar 2025 10:15:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTwt-00000005SK4-3Q15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742292807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
	b=AQpgYCmfpA2TBL9C2S2jkX34ddR0CnZKOoYKQbKX/3evvYkWW+bPjcFOit+tFC/2noS2Sc
	pyp1YrNhQ7zrpCScspKNxPf0WUP2hGBvrIKKkpyQYCY+Iy25TtxlD4uXMvxSsRhl3DfwEw
	zoXJeNtVbPahL/3ghvYnAf2svs3QQh8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-M3XqoXYrNHqatG4Zd3nQLQ-1; Tue, 18 Mar 2025 06:13:25 -0400
X-MC-Unique: M3XqoXYrNHqatG4Zd3nQLQ-1
X-Mimecast-MFC-AGG-ID: M3XqoXYrNHqatG4Zd3nQLQ_1742292805
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so19101345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742292804; x=1742897604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTXyPUX/nTogcTrzO4w+0DnzKj6GcEsE6zMX5lpp/T8=;
        b=nKZ3SjoEG/AddIxi/IxftwQLOHNDwAWJSNUNwhcy+LFuTMiI99IF/NloyMnvcyhNia
         i4ZINOmrjxJHMBJt7Jtn1SU7NOzbHIn5UM/CG74v90RPsYTd3hxNgalph/RzGZ4/va0M
         WS+OJ5YKWOqqgvhN6DgnuIP5w8VI9dixtdctVbzJ+nzwnWLnjHGZXyNGeiA8+eD+qY+Z
         2E17d+KqdmAcuIAfSrwaeDrUpqUuTrbKy65WH460uO6hDAz8S95+/TE/bkqSUoVec+60
         QM9YCO/RCYLbSquJSUFJaPlqfREHNmFvCQcKO5zCLJY+yD1J9P4sto1UvREX2nDrFIqF
         6U/A==
X-Forwarded-Encrypted: i=1; AJvYcCURQdeWRD9uGdIowe3tC4AyA0AtvM7sp+RdegGdKn8tttHz5XHDg1YRuROqMZpUcg/qNRivyT/G2+KuL5gGrjQl@lists.infradead.org
X-Gm-Message-State: AOJu0YxRMRAi/fgLWYgYL561wjvg8+4yIMwm7iVDpy50+IbYdkieu/Hm
	e/724ENv8QXsrhMBEHoxpQsa7s4lOx7Pq4i/KX72dRb7aFLnSviEU4nSbPM/hCOuinAhuNadp8M
	f8O4/toWJRrRVblG9on6pm8pzWR8e4OJlE7aUk/NIwTJHdDyNcoybmdGh3H51joNK7L49zowa
X-Gm-Gg: ASbGncvlCKNdcgYcgL/AZoi0q4DxM1ZZem156yZXDH11w3CORD8kLvxuHbHc/6zP5pj
	g6gG22+O0AQkh1lWFS7sYdNRnFXdNv5CS1Ml8VSgLkh241MGpTP/QMwtaur/qLGUDY8V6Ran3KX
	kPjSgUWBB8/8HzVIkXnXDknYWk/6fQ/uZDTvRqtsR6nRfmk6MomoZjM/pH15GHVl7RpCaBANR6n
	y2OByEUdpzG1Tly6eHT6YdvGsHVZadDTbxh8S+SA2iG2x0z2JghRBLo2bJq3usRx1ybPyjUjX4j
	VArI1RgS4iX6sABc7qCztJfHjWUZngdedG784r8OZNF5jA==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14645005e9.19.1742292804455;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa2x79C78ENEoyzPPniqeGCkHBce2M9I0jdc1yv0/RSaEENBZYufXun9PO4beIARs4YqnHHQ==
X-Received: by 2002:a05:600c:5112:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43d3b9cd704mr14644695e9.19.1742292804010;
        Tue, 18 Mar 2025 03:13:24 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe609dasm129105475e9.28.2025.03.18.03.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:13:23 -0700 (PDT)
Message-ID: <6259af5f-f518-4f88-ada9-31c3425ce6ed@redhat.com>
Date: Tue, 18 Mar 2025 11:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p631Tu-A69Oc6CBRE2xVrmB6HvXKQ51vDgfajKGLF2U_1742292805
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_031327_930445_2780182E 
X-CRM114-Status: UNSURE (   8.99  )
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

On 3/11/25 1:18 PM, Lorenzo Bianconi wrote:
> Introduce missing metadata support for some xdp drivers setting metadata
> size building the skb from xdp_buff.
> Please note most of the drivers are just compile tested.

I'm sorry, but you should at very least report explicitly on per patch
basis which ones have been compile tested.

Even better, please additionally document in each patch why/how the
current headroom is large enough.

Thanks,

Paolo


