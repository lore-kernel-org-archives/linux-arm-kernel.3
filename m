Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1915DFC72DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 00:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=; b=Ailbc2FHZxtKxq5KckULeqONNl
	zi5ZoDTzu/1w5jtZc+iuzj1Xfq+gzNibqPcK0611kc2mf/+IbFUtsdbBJHi2H4otMAkE6sOqmhAUm
	SV3vvBUdSoh0t1sHrD/4FbHiQDvWIwOqFA8ZmJp61ZZAqb0c11uD3SCNErKVe0ic2KTcMm8vglYiD
	z/lnvPeIKrbUC8skg4kNx54usjmDO4CtDNup1D08fRAKYOzJCexwODnkJy5dSvv5ZVMujK8mNrpJU
	1CBA/Aj8YW1y4wJg5ICSgibqZXaiIaGPigH8E5eRsG1zLhQluBik0Kv9+z6o4UbVQ3Z5AxhX+8JDR
	aLbFX3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CAH-00000002PO2-2r5p;
	Wed, 25 Mar 2026 00:32:05 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5CAF-00000002PN7-0Tuo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 00:32:04 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8cb3bae8d3eso562171985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398722; x=1775003522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=rF/I58nQoD3CRenBP6NRr5GgQjSZNzTfmSQBVuf4YYvbe0ydbofWfUrgMKGxxDJ+Kp
         ukAoGC1g/gfsZM1eibwL67sKrpXp3J0b2MtchVYLbkxZWE41+iVfi5zKvLFnB76FvM1s
         dmgCJl2zK7XPeeHBw6FmHQcBozKoq40kEgsEJx3ZPVI1fzSmWy63E1HaRgCT3z5Yn1GF
         K5tzqZbvyrfwd2k8eybtH/JlcJuQeO3yOe5xtMYbhC+KJOB116rNTPT9O4p6v1TK0SuW
         ryui4nYH6jTZg8BYco/Mu1P5zLCBR5rnPQtm4VoVDLaG833iC2LJCFQAD2LI5B48wO5l
         RNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398722; x=1775003522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCLRk+NAkU6fy7pdsIcUwbode2bX+R63hoRqk/fGQl4=;
        b=bSMKOFRnMBM3Tlrvos/VXJnAGOeVz61hXeqI5f1Om37qi+QYTYrL1ETmPlWwPtXOrv
         QXrVXynrR5Wbh1xsoXdNfCgv2lzYtnJPqASJkpTC7EN9TreVGzvnqt+BwxGhNHWPk7P7
         kQ5VoFxlIag62qrsok/10FPyuTxDy8HuIe1mNUKNHg0uCcYz9MUNzaonTmTgwKVoW9Xb
         jLOLlM26KwcM5jiLyMkWIdq5pwfy/orsZRl7IhlxUK0qv6knfXat7AB6b29CLKdktf2H
         +uoSiXHsOIskK+wh6oe6nZvlv9CjRpHgX69dtTTSr7vIvLrHUC2NyLq6WK3r2qI7mmXE
         vHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnpElHrFDit1/scESjLCwKkMry1iXmZj71o2yOESV+S7Nk2kDF13sIVqclRVLZARnns/nEL+0FDcv1eBjWwFiX@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ZT0p9De/WDGjuRR58Ni9UhCkD1GIYdh4eL9VDZgmN6qx3Znd
	EEOJLlI2RixYxOX0wuwirIQ0oInBfB+7ho1noc5QizZzUvrWzuhyD6pJ
X-Gm-Gg: ATEYQzxQLiBbjhkCopRUxrt3mKAiAkakq39ZJltB9/+i0KDAcBfY9zIB4Z/eCUd3nnY
	eZkEIS5zNb0qyU62lfrJ+GxiYsyLE1Rtr8vkG8MIC4oLTnyC8hUUeYXttlXSX8XWun4iiqb1HoL
	8bvaHCmX2CZX1cqMmdFI8aVNoZ/pbJigk7bs++kNpN5p+AiSaDA6+tILX8hT0sM1GB0qThg1W9J
	L7e913ErvQJUKiT7avXaW6hPxB1WJdcDmssNRba9f2tKSuYtnR7p53kb9rANY/x7RBt67K/pu3U
	Hz1C8ReKsFmv8d0oSgeMxx6R35cMxFX6A6GHPuCnqBq6ULzr9UhyK+f+Fleh7H52kpa7KvBaV1N
	XQrqyzMgTfKJEqBk2aPOD3IZ4m/JFhkYefhz0LN0y+46WS3IZjFTptGEO/WcFWL6WvtV8N0zCn2
	9Lxgcd1Bhjo2c+L/tdPla0LyaWBXDPrCoZOvUDHYLGPp6rJkgIWDZY9Ih40cOrWJBFeIycBxfhZ
	omJvQ0xQ+KE/vG5aHEZ7vij
X-Received: by 2002:a05:622a:a291:b0:50b:4116:78dd with SMTP id d75a77b69052e-50b80ec12camr21220341cf.66.1774398721780;
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
Received: from jernej-laptop.localnet (16.red-83-43-237.dynamicip.rima-tde.net. [83.43.237.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm146375291cf.15.2026.03.24.17.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:32:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
Date: Wed, 25 Mar 2026 01:31:57 +0100
Message-ID: <2052919.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20260324161930.1602083-2-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
 <20260324161930.1602083-2-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_173203_152397_2F432934 
X-CRM114-Status: UNSURE (   8.18  )
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

Dne torek, 24. marec 2026 ob 17:19:29 Srednjeevropski standardni =C4=8Das j=
e Chen-Yu Tsai napisal(a):
> All the UARTs support DMA and are hooked up to the DMA controller.
>=20
> Add the DMA channels for the UARTs
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



