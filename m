Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DA7C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=; b=Eegrgsk2sL4py5jsgxxvWNgpXc
	KvmOl8ONVf7dtnkE0OwnHnnodx4zTTlsFl7uL0p+ZXDqdYcP2rXrFkwotrQp84MOFVXY+mSzrICst
	hGJp5sWNV+1YUohoRLWaCgIu49+0plzWlx/sYIDzLpiLAd1pgTwhS5DiQKv2FjrIcce3D/bGEvyOE
	Bfb3W/yTeYRNxzLonru2+2RCBwc3m86X0Xd46lnu1aOpXQVeI6ZsGwKXJDx34DzI7b/93WjJnTole
	1436x/V5cbjehGk2MUhi5gsATkjVNuaQwHjuXKYrS61bloev8OSHy39Lm4Pa8PFKEN4Rxyd15ziQR
	rHQCwJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG51-00000007RKA-1txG;
	Fri, 07 Aug 2026 08:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4w-00000007RH2-3v0p
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=; b=L3fz4HEvGv26rGbtW3vpEhILpe
	sQIiFuR0QQ/ZGdD0JkGE+j2/kpjX9RdU461kmHqbrgt4IZWqyt8zzed6VkYDgoTqGW1UDzCkWJ4IH
	MDE+Nto0HP85Grz+Yu05ZPh4kKd7y2Su5MzDXvaTSVfxdAKmxmy2xMWN2iWtlr9KyhOPWmMx9is70
	5RRKEqlr1B/zGGWZnYwRmctrtWBsfibpY7n0xpMxRht+D0EdIxNXDZ4o2FRrSqpIn44MRpsDeuOOP
	wUBUFh5dPBLnp2KOwPnhFpXtLpGOYpSoaTlYNVPCMfWec3q1zHeA1biZz/8DabYNkd1lEbVSJSvj1
	Fe9ppcUw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsG4u-0000000CCrh-0p9H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:37:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4956869750eso22624455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091838; x=1786696638; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=M5tZLXH/rsd5SZ/Kx+phXFY/bQ2q53WZ8rZD9IpOTqm17eORpV62BNPlcqcLVA3iSK
         x1FP6yll3MD8b015BzYb6vROhWS0okCPYidA2v/GoRBy4rd8hp7rm0RZT/2bCGUOLAF4
         HmQ/Vi292dkEaZKqe6j5CaEfR6PZ0Zxc6O63O0aV9r4GTcut3556etDDEqhcxhcYkFaD
         rMVRaFWd1jZJmQYwTR/GNVpWHP4xZYYHPbst9as5kdjK2JaJayG1g7veg2rcFV38m6So
         lysfMaiqfH/UweNaacDKf43yoBhnneJ7l6bypgiBfnrydWydEr+D22vYFZbXEjEqzqb5
         r/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091838; x=1786696638;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=B7eCKV8grV6zaoik4G46HhXK2MqDs3D+9rH7f+T4Bwo0cDuQJD0xTjiXMKlzlaPiM+
         sUV6jKvz4RttAKr1dF0pldUjbNEAzKTQPoAkMHns51uKeW9wbsuYo+7DE2ebDzrhW4l6
         NM1QW+tmRpu0MqBbDUGiZiYbhYgE4HVMfVKG0WDt7bKkbgiKzAo7kmAK690pj5b9xFfN
         KdoqDK+o/BM2O3sv8rsQnP7YbKGMIR1NOVSOuCCL4hO0cGv5TyxTSBy4U4B10CN8bfLV
         g7YV8zKSOMyaZ4OzOkInHteigASovIG9/urZW6tCCqVJOBHU/VTSv7olV+yo1vk6A916
         K3Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9UYaYLm99BAaDcPcusTEwwWqV4ozLHjsx2zFHAxvRYzWbXyjD63EtGl5WEyvqSVb0naZEQgJKsPr86e8ufYf9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw04xwUsQsTFMdJzgKZ9RP3v7ixKe5BDINuGQ4hRzBo7ku+V3wI
	plmnNrBvrNGFWC5lsUFVXg2pkksaG72HwJ0wJPiDCNg4mgZDHYrQa7r8mXHPfX0vEw0=
X-Gm-Gg: AR+sD11MHjXsbI7Oedlgwejg/qeGRDVHqukqYUSWtig+/mbD8JT/joPM7k9lUcEItAp
	/TG1SjDFxLHVxEqvjoD7zkcfVH3XmH7jhvMBmS5dTOPmifdS8BO9vnaQ5GQHyIrUJJBbVy63KO3
	0b4pHd7E2UW861jgdxYNpdGc8PrYiGCPKRc8hSuiTXfb4OGhJtH0bBzd4VSn6oGVwOP23YW9KCe
	uQkkEGDsqgg2iy3pGwFOEorMA+aVoZWTf2bqcWnhnA2M2IKHuLxRbZtVRtbhSVlYWo/EnyC8eZ4
	j2rFS92yKisGWBLUV+gi9DMY3H68ihMKxdtp/gy+Fr2x5+xt0W+SSNf8TNRdMiQ6X9PvwJkaEbv
	ASslw/MCVtH20iGJTROjPdpKGQxAmEvNtC6g3wk4NHjS4NOlt/jjlRxbFb8XvIqfzfSJKXXSno1
	zBaekHKNM9wTsyoNmugZKRyaWNUYpAmn5je7gzoaJkHTqiMy/hKQJ1CPou0K4ov6qf9KWkBck=
X-Received: by 2002:a05:600c:3226:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4994e7ce0dcmr191510415e9.13.1786091838712;
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.5571242599516025969.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=355;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=fuFEj1OU+QhcCZyLvfuNnHiX6rf0ZBxSPqBHjTqQNjI=;
 b=l/snFEuA6s9C2vYf6o5nTOQ8zlqd9Il9CufwGf1MkTpOA+4+PTdQ2n5jUh9glDVuzfjCNBQVJ
 WDZc+yLTygNBpO/pif+3n/9h9ZDIVzxwiVZwcXHim3sLopjfT4uTkcv
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_093720_328863_F3621D9C 
X-CRM114-Status: UNSURE (   6.54  )
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

On Wed, 05 Aug 2026 14:19:52 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>

