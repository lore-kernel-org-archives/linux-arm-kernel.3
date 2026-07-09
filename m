Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=; b=zBEhLu0fAHRYFGG/BVSkCkjJmm
	BM1MrNCg+ocC1bw/RNEiysIOwKzbOaiYF11R5hfYjxD1S+wjPb3u15XufPEk6y2lcKakmPAxN10Cg
	6Fw8xhefY29EA3p4zFfDgPsGwGe3YcqTjCz7t+l3yE7gOSySXTU3q36zdF62zrIHbPRSRW6B/rtlI
	x/pBzl1WO44G6d7+9q0FbQsojjrN9Opkpiqqr9HOjTnve41bN8fwpvZmMQCoFdrWIrpT6v2gkr0T5
	Uj3kJJ75vNlKhHUwOXLQvmYyrONj7UjYGVAgElaoST2dy0qLY4s5IcuRNs0j+0JuDjOEn1YcoGN3y
	rBLCqvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkEA-00000001RFD-0JiG;
	Thu, 09 Jul 2026 08:35:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkE7-00000001RE3-1EPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:35:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1799629a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783586122; x=1784190922; darn=lists.infradead.org;
        h=mime-version:content-type:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=;
        b=CJa14V1snqpxs0x+e5/fegMPyoB5dY/RfuyxBrv6RYx7b001mfDT1vIF1ecYSY8HOj
         IQqnCE1zswkf1B3UpEvPhhFHW3joA5SfHngmWcOadlYyxinsG80TBqyo4WBSO71HrXFG
         qpAIuzudy7K+eS05IlI5OTRUORboyVv4eoI8qlzDfo4z34hwXS2ViaO57oU0o0OlY8bG
         pW+f2mpmlJJnil6gCT9IBewNSi5zfPNQ7PA8xv1UEg7AmfkbBUORFNIfASEIq7R+6QMs
         +d6x1f/1g5lYPK22jV6/0hdtfgNJM4m08fdHCXrpBkby7eJx7dgP0v4gA7sPsVOwvLBz
         tZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586122; x=1784190922;
        h=mime-version:content-type:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=05+LHhpaaEHtiLUM/uJYO+V0R+R9kRnyL/DEaqmQD5k=;
        b=StP6qRVH4O32ClSI/WBzk5Jw01aHQJ4ceIszyG/SYDZQFILdSCHDHe/u/T6EVbFEmV
         BzK6JcXhM5Qo0vagz+aDVMt9iC6xYTsVrIBW/3xcpDsNZoUFqa+E6eteosR/p0ZS1YFk
         g/GoWciU9etT6I5K32B8ZPVwIda6yzuGnqFmWWaESueVbnW6ZGqVa/XRJ2J6goacC+vm
         eh1IBjQHKWtp7aoMnXTQfOdlV4/0BbWDi+4GyH4nTXwM9I+tHInszAYC9ia/WifAEc4L
         Et8fBezOYLfiV/OaWIDdmHevZ1tEJ+FJJy3dURMCns6YgLFDEzXdDdpB66Fe82pL5NOJ
         /CJA==
X-Forwarded-Encrypted: i=1; AHgh+RqD/JJzfN4z93Ptpl+PPahxeyawniiYv+a+amWKq7LaRlyk4sxZF6VtGIxyEwD57JdJOuGRJjtrrnKjZXdzEsh0@lists.infradead.org
X-Gm-Message-State: AOJu0YyV6J0oBiiEILzcnXYuSx/XUEwcJYNxkSQeGpJ/OTmJUAdWsqER
	VdjXxigiswWh2IxXEqvD2b7mDw4GjfbjeBFPwWgGIYMaDowKZGbF/8sR
X-Gm-Gg: AfdE7cnWF1nTaEBtNDRODpwyG+2+BoVswd1Bvh1T397+So4kPi7VovJOCMcR2twaxvI
	njJrBJG/AL585l0eZdEs6oDrttkoqMiBIHUcBqq/exNBHwxxKL03g9nwNP0/MBgtc8I49VBnDoD
	0OiOLT+xuz+5ws4V1yEME5j/cyGaoMyue078Q8LtMvJaPuQZc3GdOYX+BWIW9EQz5KZ8nQAe9bg
	PLT62JquhHsq7EeYqzULqa8KHYlgln/kIJoI5sIdb8bKhSYw1o57KJbFwoF10T+V1k3BjwMjfw4
	8iocIPcQXRE8bPtEsE9mQpBYJuBi+tU9xm5rAU+sfq0bLnpKM07h5fGdugYt0tCYNsJU/EXpc6L
	1pIqF+3WMY8wQ08runA4pLrYj/GopBoOxRxZpS/lmJe8crMT8HMZoqW+yGtMxLtTGWNLMwUmmuc
	/25NCVhQ==
X-Received: by 2002:a17:90b:4a4f:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-389415edb6fmr6386335a91.10.1783586122340;
        Thu, 09 Jul 2026 01:35:22 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5564f58csm811721a91.8.2026.07.09.01.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:35:22 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] ipv6: initialize ipcm6_cookie before parsing control messages
Date: Thu, 9 Jul 2026 16:32:30 +0800
Message-ID: <178358611790.128118.11036367713019213946@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013523_336744_C57CB521 
X-CRM114-Status: UNSURE (   9.90  )
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

ip6_datagram_send_ctl() parses both SOL_IPV6 and SOL_SOCKET control
messages. For SOL_SOCKET messages it passes ipc6->sockc to
__sock_cmsg_send(), which updates fields such as tsflags with
read-modify-write operations.

The IPV6_2292PKTOPTIONS and flowlabel option paths only set ipc6.opt
before calling ip6_datagram_send_ctl(). If a SOL_SOCKET control message
such as SO_TIMESTAMPING_* or SCM_TS_OPT_ID is present, this can read
uninitialized sockc state.

Initialize the ipcm6_cookie with ipcm6_init_sk(), as the normal IPv6
sendmsg paths do, before overriding ->opt with the temporary option
buffer.

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 net/ipv6/ip6_flowlabel.c | 1 +
 net/ipv6/ipv6_sockglue.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index 1ab5ad0dcf24..5cbfb82710f4 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -405,6 +405,7 @@ fl_create(struct net *net, struct sock *sk, struct in6_flowlabel_req *freq,
 		msg.msg_control = (void *)(fl->opt+1);
 		memset(&flowi6, 0, sizeof(flowi6));
 
+		ipcm6_init_sk(&ipc6, sk);
 		ipc6.opt = fl->opt;
 		err = ip6_datagram_send_ctl(net, sk, &msg, &flowi6, &ipc6);
 		if (err)
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index b4c977434c2e..0dcd2c224014 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -839,6 +839,7 @@ int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		msg.msg_controllen = optlen;
 		msg.msg_control_is_user = false;
 		msg.msg_control = (void *)(opt+1);
+		ipcm6_init_sk(&ipc6, sk);
 		ipc6.opt = opt;
 
 		retv = ip6_datagram_send_ctl(net, sk, &msg, &fl6, &ipc6);
-- 
2.51.0



