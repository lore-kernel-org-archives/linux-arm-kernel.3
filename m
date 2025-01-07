Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA652E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb1pOcXu31lYFeGfpMgDjeg52e6mYQb5OHgfqtIS2po=; b=A4soVmAPForejse/nKSpjq1202
	RK5+bCNL/L36KbdHGEsgVcxhS3JO8vqwA0MJ8aDduNiZvYHZTZrB+UioOho4+H/5/C6dGnGMczSx9
	nipU5tDlBRCgS50ahLHcMQuv+8Pl6trO5euFmbrOHGP+GlsB4S3z2nLncHIXfnOrl6zQFoPwN9ucG
	lcc59bVpbju80JRXD5hX1Q8qoDj4NzPP9DYQPPJdyx9BuD43HLZhFun4qd2oRyoy1eS+8BMEbuqpw
	fU5xKxww6/6+9W0Z6Qp5uB242iHTcXQTBzXuk3G7WDky+A6ZXTSiZtJ+evbl6NB4gTwTRxQnMTsaO
	pQ9k00qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDCe-00000005p4f-461x;
	Tue, 07 Jan 2025 17:17:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCtd-00000005jeF-3odt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:57:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2161eb95317so239431375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736269057; x=1736873857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb1pOcXu31lYFeGfpMgDjeg52e6mYQb5OHgfqtIS2po=;
        b=dmcp1cn5a2kNa0smVBSvKDfHKzqcJzFsKFMzS9c0bEJauPDZyf09pruk4ECB/tWwSa
         wylMxF0SG8VyOGFuidHR/D04T2l2v4PjFJ7zWxIOY13NusYPEn1g7xhW+xNSrioFq1J5
         jTXmVg7WPoJgr83gvJHAX9UuNckY86LDenACcNANqddaBsphGYawmS4G8k+yX9uWhShb
         SOk3y0r0IUMLXpRMwDch2iy8Fo/nY9Nalgscae3NxRHgqO5LyGzhpbR/dpfiF6DpZQaT
         yBk/3GfjS6otyqTVlN1pEdmUitMMjkKUBiBS+/4uwsPVRP8f7d/wP6UPVG+12JNQDf1Z
         oyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736269057; x=1736873857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rb1pOcXu31lYFeGfpMgDjeg52e6mYQb5OHgfqtIS2po=;
        b=qRIPS8BKKnwKefkpPJ0I19Ix5I1qTVE03Fpx6dfqBgp87aEbs0AjGLP/6i70BCk3Q6
         4hGdmPz4OFHV9RyeKaC+1AlFxPZNOllq8enRKDbODyW4S1WJFavsJ7bAoYlOOM6kPDs3
         uTwOmdlcfljl5Yc4+uo2zr88Q5VoBWntDW3BtX6hqp7gcefi6EYLD0pdLkp9SMgWxln2
         HrqtlUpYRyrDoncp6Ssi0waVs863tks51ENcTismwoE6C2PL58x2NAKj3m4AmfzbNjgI
         LN8l2fjNG7h1rHPT/x1pDFzS3dK2LkjL9IG7L1tkZu91EFKvHNOxKWNJL1gPK9ElwMmN
         fChw==
X-Forwarded-Encrypted: i=1; AJvYcCUN3SkOlETWK8MgKvY/rmuJjybAvcFrwcFd/IJ0MDbvCK22ZpXEcZwrxubWTw0uabuPSHQrDJta2eXEGDPYbaVi@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzeGLWmC2lcaMbhAz7V5h6KSpjTCNbVQMKOJbCK9FC5K+dcFK
	+Oqi2crMdwQknTpTeZVWjgY1sNpVX6bK1NvW4A8RAfjwVd6Vz1s=
X-Gm-Gg: ASbGncs90o5J+HtBbfQp5Qsk1GsaG5nO3UcgtqmEsqAdO8TVgQBBYaXT5EfXL99eejY
	i6QKFgMw2hKopONdzM7V7Og1P/gJe4reh0z1PMfnKA5Wj9MEvem+2bzT7kMvxyW7Qojp8/3ACef
	+dDAl9KM+c7qGgyMxjsXYl32zhb0rSqmTNhjfQ/rYVDqr9g+WdFbgBkFNF+f0l1EN4vL2kRc5Pk
	4wwHnPDeos0F1efbxdZHSwtICQ8O4l1ldnfYhUe+503npAR3Tmnu1zg
X-Google-Smtp-Source: AGHT+IFlhKI33ii68VDZqo5j2PH+n5VdBpF5kgNaO5PfE/xaemL0ooS2ho/W9ZBFXWggOucM2FsUEA==
X-Received: by 2002:a17:903:182:b0:216:1eb9:4a48 with SMTP id d9443c01a7336-219e6f289a0mr710448725ad.56.1736269056620;
        Tue, 07 Jan 2025 08:57:36 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d0asm314014085ad.53.2025.01.07.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:57:36 -0800 (PST)
Date: Tue, 7 Jan 2025 08:57:35 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org, xdp-hints@xdp-project.net
Subject: Re: [PATCH bpf-next v4 2/4] selftests/bpf: Add Launch Time request
 to xdp_hw_metadata
Message-ID: <Z31c_3j9MEP7Z3bd@mini-arch>
References: <20250106135638.9719-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106135638.9719-1-yoong.siang.song@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_085737_954768_8959D720 
X-CRM114-Status: GOOD (  24.50  )
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

On 01/06, Song Yoong Siang wrote:
> Add Launch Time hw offload request to xdp_hw_metadata. User can configure
> the delta of launch time to HW RX-time by using "-l" argument. The default
> delta is 100,000,000 nanosecond.
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  tools/testing/selftests/bpf/xdp_hw_metadata.c | 30 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c b/tools/testing/selftests/bpf/xdp_hw_metadata.c
> index 6f7b15d6c6ed..795c1d14e02d 100644
> --- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
> +++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
> @@ -13,6 +13,7 @@
>   * - UDP 9091 packets trigger TX reply
>   * - TX HW timestamp is requested and reported back upon completion
>   * - TX checksum is requested
> + * - TX launch time HW offload is requested for transmission
>   */
>  
>  #include <test_progs.h>
> @@ -64,6 +65,8 @@ int rxq;
>  bool skip_tx;
>  __u64 last_hw_rx_timestamp;
>  __u64 last_xdp_rx_timestamp;
> +__u64 last_launch_time;
> +__u64 launch_time_delta_to_hw_rx_timestamp = 100000000; /* 0.1 second */
>  
>  void test__fail(void) { /* for network_helpers.c */ }
>  
> @@ -298,6 +301,8 @@ static bool complete_tx(struct xsk *xsk, clockid_t clock_id)
>  	if (meta->completion.tx_timestamp) {
>  		__u64 ref_tstamp = gettime(clock_id);
>  
> +		print_tstamp_delta("HW Launch-time", "HW TX-complete-time",
> +				   last_launch_time, meta->completion.tx_timestamp);
>  		print_tstamp_delta("HW TX-complete-time", "User TX-complete-time",
>  				   meta->completion.tx_timestamp, ref_tstamp);
>  		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
> @@ -395,6 +400,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
>  	       xsk, ntohs(udph->check), ntohs(want_csum),
>  	       meta->request.csum_start, meta->request.csum_offset);
>  
> +	/* Set the value of launch time */
> +	meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
> +	meta->request.launch_time = last_hw_rx_timestamp +
> +				    launch_time_delta_to_hw_rx_timestamp;
> +	last_launch_time = meta->request.launch_time;
> +	print_tstamp_delta("HW RX-time", "HW Launch-time", last_hw_rx_timestamp,
> +			   meta->request.launch_time);
> +
>  	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
>  	tx_desc->options |= XDP_TX_METADATA;
>  	tx_desc->len = len;
> @@ -402,10 +415,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
>  	xsk_ring_prod__submit(&xsk->tx, 1);
>  }
>  
> +#define SLEEP_PER_ITERATION_IN_US 10
> +#define SLEEP_PER_ITERATION_IN_NS (SLEEP_PER_ITERATION_IN_US * 1000)
> +#define MAX_ITERATION(x) (((x) / SLEEP_PER_ITERATION_IN_NS) + 500)
>  static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t clock_id)
>  {
>  	const struct xdp_desc *rx_desc;
>  	struct pollfd fds[rxq + 1];
> +	int max_iterations;
>  	__u64 comp_addr;
>  	__u64 addr;
>  	__u32 idx = 0;
> @@ -418,6 +435,9 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
>  		fds[i].revents = 0;
>  	}
>  
> +	/* Calculate max iterations to wait for transmit completion */
> +	max_iterations = MAX_ITERATION(launch_time_delta_to_hw_rx_timestamp);
> +
>  	fds[rxq].fd = server_fd;
>  	fds[rxq].events = POLLIN;
>  	fds[rxq].revents = 0;
> @@ -477,10 +497,10 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
>  					if (ret)
>  						printf("kick_tx ret=%d\n", ret);
>  

[..]

> -					for (int j = 0; j < 500; j++) {
> +					for (int j = 0; j < max_iterations; j++) {
>  						if (complete_tx(xsk, clock_id))
>  							break;
> -						usleep(10);
> +						usleep(SLEEP_PER_ITERATION_IN_US);

nit: instead of doing MAX_ITERATION/max_iterations, can we simplify this
to the following?

static u64 now(void)
{
	clock_gettime(...);
	return ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
}

/* wait 5 seconds + cover launch time */
deadline = now() + 5 * NSEC_PER_SEC + launch_time_delta_to_hw_rx_timestamp;
while (true) {
	if (complete_tx())
		break;
	if (now() >= deadline)
		break;
	usleep(10);
}

It is a bit more readable than converting time to wait to the
iterations..

