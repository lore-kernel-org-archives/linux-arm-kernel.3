Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A1CD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=; b=Nk3Jci2cQmwliOy5ACH33lMZyF
	SpL9emAikkaylSdJjWocZp5PXoguaxOa6cfBydTkVVrSWxFUwPFw1eYlt2gmvI9AKBvZ/UdFYIdbk
	ivR+MjJcj7r0X2I7Aky1pYkTAD+iVMz/wsBGEImY3AZ4hs6b0aqPOaTxjFsz49TAyARz5bvfrCMOt
	I15/3WS9xoS8lsTxU//9HSUI0idbK6hEQ1iMBMe1FcWHmnVVPZU3sPZ6OUi2tYIuABYgW3210SiBr
	xJdPUzoBFIynzpp8rU4TMymJdoK8YgH2vFLCgl1tacDqKw2l4/gbe0IZbB+Jhm1lPHf3x6B8NvjTi
	IWk/l8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmN-0000000CtXW-0udn;
	Mon, 26 Jan 2026 16:49:31 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPmK-0000000CtWe-1jJS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:49:30 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-78fba1a1b1eso70486587b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769446167; x=1770050967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=;
        b=EeWiMQ2M1BPLeoVJfnnEI/dtrlZB6M4+XDzxHJwAunM4pn5Pe8Dlkv8rVG1RKvMfos
         QxSwU70gx1kS1zvrJNFrPz3dAqd6RAz3GMfU+a6cDuSy0gJP91bD6KkPjMMx5LetgUNk
         fWfxm64ArbGbWSLH18raIOgtScZij07JGqyjO7X+ovcT9UqKaPABiNowpNgVqPfV6i59
         iisLNO3WYgOzemeHIQkV/BYfVKzpBvy6Txv5xWe4Exk5kWJzTiR74Fs9/q5Kv4bmXNv+
         UNP4hbirh/NgsxZWm9Qscn5YFoVnpPFLRCQCLDk2HJZ1/DZfulJ5FdlUJIpZz0gPoy+d
         YF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446167; x=1770050967;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzIM5S1aosasnRgv4fpJy7hXx99GJuvBk4X/AumVJ6E=;
        b=fbcsevPYAx+1w62LnnDkUJG7nXgq38usl8PglFl8OqbpVD+qitdFpAPzJE5ZKzWrDZ
         T/PPy+Ym613pPTkkfXMvttxn+h8f3lZ9RvEC3gJdQBKJbWF864i11YcYiRKO9XlSJpHv
         9Q58SCVK43hK25bUkGWxJemUKRudalsvjO5/qNOvFISAS6Gprs5+tzoeRZWSsk0Xf4nY
         HwJqTisfMMpngwfdNNs4KERAxmjVK1/hqrFYM09SQvkzyfvZ7dhqJopPYbBIAs3pl/Mk
         /itvNoi3ajtTGSXOD6f9e5HEPo6CuFuwKpzneMegmwHDmUiXMGduZZYdO+h3X2me1g8N
         e6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8/WCD3Or1ltmY1U1ml2dxfnx9PTmKb3UXSCqyR4RNTObvRlmlJg4nAi3uXilbD0TDAkWz/gleWT3GBsdT992C@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGzgb2dcv1rfEsNROSD9Snu/tiVZAyV4hBcIWbC+eZzMmh9PO
	eZc2wJQ/mCHG5myxt1743OvJ8bWX7GfJafWI+bflNx7gSEJURsdVxYAp
X-Gm-Gg: AZuq6aKYB6ANxYt1fbzNHWfu1sXw/16JlKfGIiLZDyvPjq35wa6ap7X+demgmEwNjMY
	gEgtfAGNXJLYzCteDh+bWnXw2Yb0YPgm3F9B2en0mQJlGgW9P68syUi2ZH6MSsNQVIYM/Cgz1Au
	YwtpLODMMMFFVPXh8U7LOBWHCtPideWEpwmjpKIdwF8b/Hl4gK4Neo0WwdQTna8yujEr/K9Iqnt
	jh14pHbmkPp0/nR+zL89pAMVI1w2fwKbTlmoWJDTHWHHiSYdYVcdSnyUCkufZHSIgDQN610VOS9
	sakMgdG2QNxq1tM6g7CX7gN+XG3b7cjRePrFJwknaPuRTM1kdJOoBM7kQpaaYUmLkiFz0gOJbOO
	x6IXAyXN0YSCi1JDfmh0GldIpfXmXwcPjv6K9+3MCMbwlCUILPE+Op+YCd39DuNK5dn0sRu8A+9
	F53FTU35QWF/jcCk59FM7n2qw1c/sfvti2EcXQVOJ/GVwFv04kXhC0Axx8xIg=
X-Received: by 2002:a05:690c:6809:b0:794:107f:12b8 with SMTP id 00721157ae682-7945abe5d41mr35771317b3.10.1769446167253;
        Mon, 26 Jan 2026 08:49:27 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7943b2b9bfcsm49990507b3.38.2026.01.26.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:49:26 -0800 (PST)
Date: Mon, 26 Jan 2026 11:49:26 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jibin Zhang <jibin.zhang@mediatek.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 David Ahern <dsahern@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bpf@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 steffen.klassert@secunet.com
Cc: wsd_upstream@mediatek.com, 
 Jibin Zhang <jibin.zhang@mediatek.com>
Message-ID: <willemdebruijn.kernel.11a4b80935127@gmail.com>
In-Reply-To: <20260126152114.1211-1-jibin.zhang@mediatek.com>
References: <20260126152114.1211-1-jibin.zhang@mediatek.com>
Subject: Re: [PATCH v4] net: fix segmentation of forwarding fraglist GRO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_084928_464260_A16F884F 
X-CRM114-Status: GOOD (  11.91  )
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

[PATCH net v4]

Jibin Zhang wrote:
> This patch enhances GSO segment handling by properly checking
> the SKB_GSO_DODGY flag for frag_list GSO packets, addressing
> low throughput issues observed when a station accesses IPv4
> servers via hotspots with an IPv6-only upstream interface.
> 
> Specifically, it fixes a bug in GSO segmentation when forwarding
> GRO packets containing a frag_list. The function skb_segment_list
> cannot correctly process GRO skbs that have been converted by XLAT,
> since XLAT only translates the header of the head skb. Consequently,
> skbs in the frag_list may remain untranslated, resulting in protocol
> inconsistencies and reduced throughput.
> 
> To address this, the patch explicitly sets the SKB_GSO_DODGY flag
> for GSO packets in XLAT's IPv4/IPv6 protocol translation helpers
> (bpf_skb_proto_4_to_6 and bpf_skb_proto_6_to_4). This marks GSO
> packets as potentially modified after protocol translation. As a
> result, GSO segmentation will avoid using skb_segment_list and
> instead falls back to skb_segment for packets with the SKB_GSO_DODGY
> flag. This ensures that only safe and fully translated frag_list
> packets are processed by skb_segment_list, resolving protocol
> inconsistencies and improving throughput when forwarding GRO packets
> converted by XLAT.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Cc: stable@vger.kernel.org




