Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF217C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=; b=0SyskkKH0ug5j2fy4xDaht5eDD
	w5h09dV4fWWwkHoq+uHVFdz8P4+tpnCP1cr+1MsgMKjXXublQX2TyltxpyS0Np4lxMwGsY8SoUMUC
	I0a6uKs4dlPwyS46phjUY0u9uM74YsIe+g8LGEzV6Q2gB4FcN2cbChJZePATaQ5Z8r7DY/dU0bfHK
	8fcxAwhqNYqqI45avCGSmnjVdFS5ObAAv1WiebML3I7i6xXiWOMLCW7Pl2T/MQ6I7NZvTn9RJkKCS
	0NsQfmVgt+sjLlzGBn2f09HmrHlBuTp3+e4qLCqU01+thdIltnxuGM+ffaamSIfct3xaoKkBcmoFo
	KQw532/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PCc-0000000CJ1W-3Gf2;
	Tue, 01 Sep 2026 14:11:06 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PCa-0000000CJ0m-1qm4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:11:05 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-866e57f63a3so11316397b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271862; x=1788876662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=;
        b=JLpqrPZj1es72+EFzP/s/2sqJl6y1NHE/nhBHVl4gew6y70bm4bE1jb3Bjdoa68q/v
         tlz1scu0ef+4Yl3/Yi79mSYnODfWOkdbzxwSc+26rckeThUnwnBStnPOU+kcNAMAFQ4t
         JhqFtWFOhBPaRLx5tPSi7Lq1w1dnDTWTFkeKmrlkD1mMlnvZmtt41xc3UVb3G6IkeQym
         JWLwT2O9JqsVKvKaBkPmLz92YgtsMExSPS76UzkPtXtcYeE5tnB5CCYFuSUAzd2hNNHB
         KRWIqyMQItMUK9W/y/IOav1XGC6u8ik0WypFkDDJ3Rfm4pR66X6eeJpuMwvZ7ATw86/t
         wP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271862; x=1788876662;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxeaBvDlKAqKYcHDBk+Xfrsk7n+I0JQxkCoAoHuqNkY=;
        b=f98CJ0GrqaetOKrTRTECo5gzmhw9MqtUYXFke7nM4KXaDFfWeVBO6FwexGzpEfM6+b
         tkWT2AY3P0W4dxgDtQTp2WNre6cICub9xJiaflFlmfybcBKqoaTyMmQ/iokqOrqZsPlw
         7Yw4JXT1cdVKMjIBMWfDI9Aq5uxlwHLbT9guxCH0CdhO7pAI2mFtbGE7hFYvxQEdY05W
         O7Tnjx/D8NOHarIXR69D1quitEqzVR9fAo3Xlo3Dp+62DF2bqm9fSadJwvBHqJJB04Xv
         K8+YG76IckGzwzhgZYYxzRNMKt9E4ZsROxvbHe5vh1+n42YxIzEHDplxLBDfWitgSo5B
         4yAw==
X-Forwarded-Encrypted: i=1; AKwUvBxJQ4Bws/55d6gEm74NkC9OBouu7GNZh/ARnfLs2uOwXB4KwHSwUbO3PNEC867yFyrRxcsRoBmA0Z4YsJSeHyHd@lists.infradead.org
X-Gm-Message-State: AFuF++nri4dgyGBtgWgihMAU6rine1tW243zgxOQSVvkmN+LmV04eaFj
	Crq/JAy2rHNvAjMYE2PbHAGiZmMsbPwfaPTJtUlso7r2cegwFeCCiFRa
X-Gm-Gg: AYBFou2bCcOq0BfYzYREvzwQiAoilHrcAOMYBO+C19aRVJq3JXvol5WHT3ZBaSmftHZ
	Z8VrsOZXjT6jWWbJ+3cw4gHBtsJrt0d07xBCe2ErRV4T7gfP/VFfPinBMEhaBIgo7LkXm2QLpGe
	j0dcrs0Pk1BOVw+hcqVrf+Vy8XckpvTLlrcdk72zfmZawTXgpYXeydhVjTXV8FhmMuGTtdK2YA4
	OnkuO+bdsrlZlNLjRoqxwnTEKOsyixsC7MiIK0715xZVaRGHX3kcc1kr6Nrs04Upq/NmdxxABeR
	nOnMOeGgUBWzzLI57kNQ45iPEcOGlmUemxpyUJsz4H6MDHo0EEiEQ6URkxEMiL4C/usKkjqN4QE
	hdmL32e7kU8LbY72uC5ojjouRbuKWEQkTIx6K9nuwsJih5+aMJIaOsOOWtCDXnAn1qFvX2hHl4c
	cUWTvTznRq7q0LrS8oei6LK62oL8OaELZTHh9j6nGfi14WKf9R1z92SMfzm3GwfNIVo4F79EKOe
	P8ysQbrX0N0yWnCiM5FktYkLPnYksYdo4esLRapkA==
X-Received: by 2002:a05:690c:386:b0:855:2d6d:2db5 with SMTP id 00721157ae682-85d69e03e9cmr131893827b3.12.1788271861366;
        Tue, 01 Sep 2026 07:11:01 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146edsm76395397b3.32.2026.09.01.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:11:00 -0700 (PDT)
Date: Tue, 01 Sep 2026 10:11:00 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: zhaoping.shu@mediatek.com, 
 edumazet@google.com, 
 ncardwell@google.com, 
 kuniyu@google.com, 
 davem@davemloft.net, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 dsahern@kernel.org, 
 willemb@google.com, 
 netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Cc: haijun.liu@mediatek.com, 
 xiayu.zhang@mediatek.com, 
 lambert.wang@mediatek.com, 
 Iven.Yang@mediatek.com, 
 nbd@nbd.name, 
 HW He <hw.he@mediatek.com>, 
 Zhaoping Shu <zhaoping.shu@mediatek.com>
Message-ID: <willemdebruijn.kernel.4214410e062b@gmail.com>
In-Reply-To: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
References: <20260901082312.14596-1-zhaoping.shu@mediatek.com>
Subject: Re: [PATCH net v5] net: gro: Fix nesting of TCP GSO SKBs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_071104_490839_F4F3FAEA 
X-CRM114-Status: GOOD (  16.47  )
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

zhaoping.shu@ wrote:
> From: HW He <hw.he@mediatek.com>
> 
> Fraglist GRO and hardware GRO can create an fraglist of
> HW-GRO packets. This cannot be segmented back into
> the original form on TCP tethering scenario.
> 
> Avoid constructing such a GSO packet, by flushing an already
> built fraglist GRO packet if a hardware GRO packet arrives.
> 
> Scenario (Tethering/Forwarding):
> 1.Driver submits a single TCP packet, P1. P1 is kept in the
> gro_list as the first packet.
> 
> 2. The driver submits a TCP GSO skb, P2. P2 has already aggregated
> multiple TCP packets by HW_GRO, and its non-linear data is stored in
> frags[].
> 
> 3. P1 and P2 match the GRO rules, and since there is no local socket,
> they are aggregated by skb_gro_receive_list(). The resulting skb,
> P3, has a frag_list entry that still contains frags[]:
> P3: [ Linear Data ] -> frag_list -> [ Linear Data ]
>                                     [ frag[1] ]
>                                     [ frag[2] ]
>                                     ...
> 4. Later, tcp4_gso_segment() or tcp6_gso_segment() calls
> skb_segment_list() to segment P3. However, skb_segment_list() only
> segments the entries in frag_list. It does not segment the frags[]
> inside P2, so P3 is not restored to the original packets, which leads
> to IP fragmentation or packet drop in the following path.
> 
> Check skb_is_gso(skb) and current GRO method, make sure fraglist GRO
> applies to consecutive non-GSO skb, others adopt regular GRO path.
> 
> Fixes: 8d95dc474f85 ("net: add code for TCP fraglist GRO")
> Signed-off-by: Zhaoping Shu <zhaoping.shu@mediatek.com>
> Signed-off-by: HW He <hw.he@mediatek.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

