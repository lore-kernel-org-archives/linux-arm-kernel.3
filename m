Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FF2C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmnP9FluU/HwvhyHftNofULVB0VcKcyWu1eae2RMNp0=; b=dlc7+lwF1mvcaNUdGs/eWbD5Q8
	Jhw98EuuddrtdDNckg/xFiMVnQNOm1qeqmI5oSq7x14g28+wOulCk52pNHsuSsMeJQhsWZt/mQjlW
	qpdKeudf8Bw2szPXd3xVtnv/JfnIF2KMvCpAvI6AgyOB2iZYilRz6a8bkH2meA+FlIgSpMusPb5/M
	S7O5rFUcAbdrKDPQ1cb40JXoRO/wE+IhdaJHkhUkkcqZLKqaQ7xnlJaDaduTbCXhB7A0KHUDdRvzE
	/G5+qyp5KB6Dnir1CShh8K7oW5Vo4v75TozeEzXqwU9de06mjAaAkblDtr2wk6++PQ9jNxTK9sWKY
	m3PvCJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pok-00000000os8-1gt5;
	Fri, 25 Apr 2025 20:38:38 +0000
Received: from smtp-fw-52005.amazon.com ([52.119.213.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Pms-00000000oWc-1Zp5;
	Fri, 25 Apr 2025 20:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1745613403; x=1777149403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DmnP9FluU/HwvhyHftNofULVB0VcKcyWu1eae2RMNp0=;
  b=DjpCC8deOGjebYm/SMO6+71ylOW9C++5A3zZM8D7EbdV3PokKo0OvLHE
   qi2vTqL2z/aNNwVMAKcJ/uNnijVqnjyUWaz8+uEW/1pjrPP0dagXNjSWn
   f7SUaTCe7xshmReS5Qc1nOBxioADVOsaEY0f1FJednpspnCyuqIyJE4d4
   8=;
X-IronPort-AV: E=Sophos;i="6.15,240,1739836800"; 
   d="scan'208";a="738826264"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 20:36:38 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:23839]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.65:2525] with esmtp (Farcaster)
 id e867d48e-e564-4aae-919e-2b0639b7151f; Fri, 25 Apr 2025 20:36:36 +0000 (UTC)
X-Farcaster-Flow-ID: e867d48e-e564-4aae-919e-2b0639b7151f
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 25 Apr 2025 20:36:36 +0000
Received: from 6c7e67bfbae3.amazon.com (10.142.164.216) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 25 Apr 2025 20:36:32 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <shiming.cheng@mediatek.com>
CC: <angelogioacchino.delregno@collabora.com>, <davem@davemloft.net>,
	<dsahern@kernel.org>, <edumazet@google.com>, <horms@kernel.org>,
	<jibin.zhang@mediatek.com>, <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>, <kuniyu@amazon.com>
Subject: Re: [PATCH v2] net: use inet_twsk_put() when sk_state is TCP_TIME_WAIT
Date: Fri, 25 Apr 2025 13:34:08 -0700
Message-ID: <20250425203624.43634-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425123354.29254-1-shiming.cheng@mediatek.com>
References: <20250425123354.29254-1-shiming.cheng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.142.164.216]
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_133642_575497_C90D90B1 
X-CRM114-Status: GOOD (  21.58  )
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

> net: use inet_twsk_put() when sk_state is TCP_TIME_WAIT

To be more specific:

  [PATCH vX net] tcp: use sock_gen_put() when sk_state is TCP_TIME_WAIT in tcp[46]_check_fraglist_gro()


From: Shiming Cheng <shiming.cheng@mediatek.com>
Date: Fri, 25 Apr 2025 20:33:48 +0800
> From: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> It is possible for a pointer of type struct inet_timewait_sock to be
> returned from the functions __inet_lookup_established() and
> __inet6_lookup_established(). This can cause a crash when the
> returned pointer is of type struct inet_timewait_sock and
> sock_put() is called on it. The following is a crash call stack that
> shows sk->sk_wmem_alloc being accessed in sk_free() during the call to
> sock_put() on a struct inet_timewait_sock pointer. To avoid this issue,
> use inet_twsk_put() instead of sock_put() when sk->sk_state
> is TCP_TIME_WAIT.
> 
> mrdump.ko        ipanic() + 120
> vmlinux          notifier_call_chain(nr_to_call=-1, nr_calls=0) + 132
> vmlinux          atomic_notifier_call_chain(val=0) + 56
> vmlinux          panic() + 344
> vmlinux          add_taint() + 164
> vmlinux          end_report() + 136
> vmlinux          kasan_report(size=0) + 236
> vmlinux          report_tag_fault() + 16
> vmlinux          do_tag_recovery() + 16
> vmlinux          __do_kernel_fault() + 88
> vmlinux          do_bad_area() + 28
> vmlinux          do_tag_check_fault() + 60
> vmlinux          do_mem_abort() + 80
> vmlinux          el1_abort() + 56
> vmlinux          el1h_64_sync_handler() + 124
> vmlinux        > 0xFFFFFFC080011294()
> vmlinux          __lse_atomic_fetch_add_release(v=0xF2FFFF82A896087C)
> vmlinux          __lse_atomic_fetch_sub_release(v=0xF2FFFF82A896087C)
> vmlinux          arch_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8

Please don't fold this type of logs.

Do you have the original stack trace decoded by
./scripts/decode_stacktrace.sh ?

Then, it would be better than the log with binary offsets.


> vmlinux          raw_atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C)
> + 8
> vmlinux          atomic_fetch_sub_release(i=1, v=0xF2FFFF82A896087C) + 8
> vmlinux          __refcount_sub_and_test(i=1, r=0xF2FFFF82A896087C,
> oldp=0) + 8
> vmlinux          __refcount_dec_and_test(r=0xF2FFFF82A896087C, oldp=0) + 8
> vmlinux          refcount_dec_and_test(r=0xF2FFFF82A896087C) + 8
> vmlinux          sk_free(sk=0xF2FFFF82A8960700) + 28
> vmlinux          sock_put() + 48
> vmlinux          tcp6_check_fraglist_gro() + 236
> vmlinux          tcp6_gro_receive() + 624
> vmlinux          ipv6_gro_receive() + 912
> vmlinux          dev_gro_receive() + 1116
> vmlinux          napi_gro_receive() + 196
> ccmni.ko         ccmni_rx_callback() + 208
> ccmni.ko         ccmni_queue_recv_skb() + 388
> ccci_dpmaif.ko   dpmaif_rxq_push_thread() + 1088
> vmlinux          kthread() + 268
> vmlinux          0xFFFFFFC08001F30C()
>

Fixes tag is needed here.

  Fixes: c9d1d23e5239 ("net: add heuristic for enabling TCP fraglist GRO")

> Signed-off-by: Jibin Zhang <jibin.zhang@mediatek.com>

I guess the sender's SOB tag is also needed here when the author
is different ?


> ---
>  net/ipv4/tcp_offload.c   | 8 ++++++--
>  net/ipv6/tcpv6_offload.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
> index 2308665b51c5..95d7cbf6a2b5 100644
> --- a/net/ipv4/tcp_offload.c
> +++ b/net/ipv4/tcp_offload.c
> @@ -431,8 +431,12 @@ static void tcp4_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  				       iph->daddr, ntohs(th->dest),
>  				       iif, sdif);
>  	NAPI_GRO_CB(skb)->is_flist = !sk;
> -	if (sk)
> -		sock_put(sk);

sock_gen_put() will be better.

Thanks!


> +	if (sk) {
> +		if (sk->sk_state == TCP_TIME_WAIT)
> +			inet_twsk_put(inet_twsk(sk));
> +		else
> +			sock_put(sk);
> +	}
>  }
>  
>  INDIRECT_CALLABLE_SCOPE
> diff --git a/net/ipv6/tcpv6_offload.c b/net/ipv6/tcpv6_offload.c
> index a45bf17cb2a1..5fcfa45b6f46 100644
> --- a/net/ipv6/tcpv6_offload.c
> +++ b/net/ipv6/tcpv6_offload.c
> @@ -41,8 +41,12 @@ static void tcp6_check_fraglist_gro(struct list_head *head, struct sk_buff *skb,
>  					&hdr->daddr, ntohs(th->dest),
>  					iif, sdif);
>  	NAPI_GRO_CB(skb)->is_flist = !sk;
> -	if (sk)
> -		sock_put(sk);
> +	if (sk) {
> +		if (sk->sk_state == TCP_TIME_WAIT)
> +			inet_twsk_put(inet_twsk(sk));
> +		else
> +			sock_put(sk);
> +	}
>  #endif /* IS_ENABLED(CONFIG_IPV6) */
>  }
>  
> -- 
> 2.45.2

