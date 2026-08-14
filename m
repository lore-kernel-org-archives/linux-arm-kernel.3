Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED3C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11mUflqlXkmCeAYz7HYUrNSCSADec0/VbBYoFAKPT8s=; b=vkjr4i+z4NAvl7FB3n8L3P/rwb
	lG1Cwq9mo+v5qo6KxoXMSbabijkCxBCdv7YqSnxFloMcobPVHDAvGlcpyt2VBpfnVtpxoH0M5devk
	GVClbf4QtyHkO+iE5265oxgGm2vQPuo29r600JPDlAB1MYOLTmc3kFCe9cCBDhAIHQ4t/IyMay8Vy
	JfRwJuPudxVLCUz5ODLz1Ce541Z0qpmm5dXhGHEK6e3nL7O6xtM583aQKvTmbRPGJqPtEZCr+B85f
	RakTJfPwxsq6qaENURasdQb8Z8Wb8VvJvaA+tTkuX7BU4XqFAuOP/OspvD3VmOqMW9NQF5pJjAX4v
	wGw+KAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhGa-00000001pVz-2vpC;
	Fri, 14 Aug 2026 02:03:28 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhGX-00000001pVD-19xw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 02:03:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38f620399a0so424325a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 19:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786673003; x=1787277803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11mUflqlXkmCeAYz7HYUrNSCSADec0/VbBYoFAKPT8s=;
        b=ZmeTEvKNC5DeqlRQJaGCu83Y6pvuRfON/s7uYsXUWUdRfRJIS/d2/hlOh6Uv6Sw6ce
         eGooYqIc3STDBSInwX7LWXS9MPQ42tVYWPjecrWda+fQi4WUP7kteclB0rIyNUaUE2tQ
         9fZdSVhx13ZHzsDD11Bqg2Q1zyoq/niiYwxmWLxbAu1jhg+hbPOKcGN4VNcoKaEANjc1
         DHuLbQu1uirFR7zEKRd3Dn79XWZIDGLK864LryUzlQFmaeyenR+OEjlmC44KC431e9fT
         OrUlfCE4aeNv718oa3C2h+i7VumUdKX7qFNxlS3koQom5hKgiRGOV7iC7pjTST/jwmga
         9O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786673003; x=1787277803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11mUflqlXkmCeAYz7HYUrNSCSADec0/VbBYoFAKPT8s=;
        b=HKXJ1asjxFsxqJ98vYqNeWdYfVEcGH3rtmZqipMINnKHBiEgoejVgQ2wUT4LQvTOm8
         BozB2uzSsipehd/rMcJdttNbz8ZGi/AUpEjxCPwb3x/ZRjF5HWg2Y4Jx563jl6GiT1mA
         gt4wmlPYtkQ0zx6SKL4UcpNYCmqUjJkZTJMKdjowUM2r0W7G1465RkE9SLkZmiaf5oIV
         00G5w7M1FM0jm61y4LV3bKsDzdjBbvo7i9DNIMlxOOxCTNYL4txlnnCVr2y15Djrw3pz
         OBqcQOe+8yG2+KgkOvQZRrvspFW5EHs4YKT0HVzl1mN27BECbvTPfkBy+eoKa6umon4n
         UtVg==
X-Forwarded-Encrypted: i=1; AHgh+RqKH20ckUmtA1EwRH7jEjwPvFwo2qcX5PdfwnkTWdh65582RtJbHJdLgUnEKuHEkvBD0n390QnbUsjGGMhV4OJi@lists.infradead.org
X-Gm-Message-State: AOJu0YwoLxrmFv2l/1xV7CPFQWMS/Va8yXESDQxHVq3XOgbW/cwxUoMS
	u8W86g5M38cedeKTWM9h1zLwZufrVj2dn3d/QTPk7BIRjAN0AGKw/QSXv+8ZXA==
X-Gm-Gg: AR+sD12zqvqElVo6mnuFumkzWA1Dq0g5aPkT+R9fFo6ST9Xnh3uo50fMQmLVsfpSd4I
	pCsRnpoGcCH+xgvpWqGa8bV8N+oJjB90PrYmzudFCMu4XYXXcv46Dcw3ekVspJ5+030jI7br2kv
	QhzkWiwyiKd4Sy7gG5gbeVY1te5OPIhBiJb04njKip07yas8qrnqAIVw2AvRmEiP3qUTLueXs9q
	4ynaKdiJVxcFCwVsxKetKEZDJSgLXFea7R4j0LYE2miFltxJT4ic5t/Z7RGMFNrjbIpmv7t/Kp7
	lb9FRI+PB6skEYP+Skaz+Fo523CI94pWGYw/XCa3SwqOXDShBa0BLkVgFx/on0ZfXapbErS2qi5
	UhP+SRANur0XWgQuKi7glWgMTOZuEI0jzWhH4d7pmOdK3l9WHaH8IdeUozj+e6elYVMCov6VA8p
	o4k+3efMhiXD2YMkw8CwtAh8jwCUK81Asyl6Id6LXB5iAEuvzCpO9J4ZMVuhiTJKb5QJFJnR0G1
	zUytn20OLGXcYoI6Km8z77P
X-Received: by 2002:a17:90b:3c02:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3933b785b2bmr2677191a91.1.1786673003303;
        Thu, 13 Aug 2026 19:03:23 -0700 (PDT)
Received: from fedora (n058152022186.netvigator.com. [58.152.22.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b71e1f9sm361942a91.3.2026.08.13.19.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 19:03:22 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:03:14 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
Message-ID: <an53YmW_owzL5-_E@fedora>
References: <20260813030708.37609-1-marcelomspessoto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813030708.37609-1-marcelomspessoto@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_190325_353298_C709FB5C 
X-CRM114-Status: GOOD (  18.96  )
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

On Thu, Aug 13, 2026 at 12:07:05AM -0300, Marcelo Mendes Spessoto Junior wrote:
> The ipv6_flowlabel_mgr used to be a component of a broader overall
> flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
> script called tests defined on ipv6_flowlabel.c and
> ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
> the in_netns.sh helper to set network namespaces for each test env.
> 
> However, the ipv6_flowlabel_mgr.c was drastically changed recently.
> These modifications led to the mgr tests becoming a self contained and
> independent test suite, enforcing netns creation by itself and
> not relying on the ipv6_flowlabel.sh wrapper for proper test execution
> anymore. Therefore, remove the mgr tests from the wrapper and update
> the Makefile to handle it as a standalone test program instead.
> 
> Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
> ---
>  tools/testing/selftests/net/Makefile          | 2 +-
>  tools/testing/selftests/net/ipv6_flowlabel.sh | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index ab890e6f79dd..0f5c178bc224 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -150,7 +150,6 @@ TEST_GEN_FILES := \
>  	ip_local_port_range \
>  	ipsec \
>  	ipv6_flowlabel \
> -	ipv6_flowlabel_mgr \
>  	msg_zerocopy \
>  	nettest \
>  	psock_fanout \
> @@ -183,6 +182,7 @@ TEST_GEN_PROGS := \
>  	epoll_busy_poll \
>  	getsockopt_iter \
>  	icmp_rfc4884 \
> +	ipv6_flowlabel_mgr \
>  	ipv6_fragmentation \
>  	proc_net_pktgen \
>  	reuseaddr_conflict \
> diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
> index 2eeda39bf64c..5d1b5464c54c 100755
> --- a/tools/testing/selftests/net/ipv6_flowlabel.sh
> +++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
> @@ -7,9 +7,6 @@
>  
>  set -e
>  
> -echo "TEST management"
> -./ipv6_flowlabel_mgr
> -
>  echo "TEST datapath"
>  ./in_netns.sh \
>    sh -c 'sysctl -q -w net.ipv6.auto_flowlabels=0 && ./ipv6_flowlabel -l 1'
> -- 
> 2.55.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

