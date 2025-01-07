Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57143E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kkw8OsqKUstZ6+HR7QBUZKdgqA2L6g+toZ/3deeQ/o=; b=rgRgbvRZq00MQ5TCEwyRVYcbMx
	9+nmNdjA3dADhVdSgQ3/8i3wSSuFMSN1vGljbhnDBXKS+7QI4ZaDnQVoRAqyL2tpYvh55ROCdpDDY
	tfMhk96YJGnTNAgiG76+vwOwdp0SyhEJ4zS2JpRSMa22+845j1Edq0zcJMYc5XYKfZpxcQS6KVDXN
	dz737RGN6WFKwbA+JQnhIIsqFZEd5l6YUId4PQtCIv1MyOFbtJPH2qB4Xfiwy262SlJsYfko/NE3K
	+AY4ReDZhHYt6O+sD6EuIGtZ+U20jSqJoKFYhVtz4TMLF6W/8zy2I4JhEBl+Vr91WKRWjA19pP74Z
	d4vAVJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDBT-00000005oiy-3tD5;
	Tue, 07 Jan 2025 17:16:03 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCmU-00000005i9z-2aoT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:50:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2166f1e589cso13838275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736268613; x=1736873413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kkw8OsqKUstZ6+HR7QBUZKdgqA2L6g+toZ/3deeQ/o=;
        b=lvsh7oKpZzTfeaG9iZJFHxkSJwgMk4qkmBT+71GDsQ9/05IdS3Ybk5OlTNRW0zAWTt
         gWKU15AkijtvpcBCAuJhwMk0iusPinukq6iat6ekJsYLHQAI/FaJhzLYOM4JLOZ241zv
         nCVeonYEFD8IC3eanhojEYnBb8fQNK6whDRvHkPPYCYUqOC8s4l8lM9yF5cXlsblXurS
         zyIp8qnaWUvbI5iKccYdOwTUq9V9lwJnQPCVi2+dZvhTUr6AEch1UgHcldXq55WP6ozy
         d9rgJEOzUiggLbGEQCuKGePHzqQHx95C1AC9bFX6f161I8nGt7fDC128iCFvy9bk6ufd
         penQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268613; x=1736873413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kkw8OsqKUstZ6+HR7QBUZKdgqA2L6g+toZ/3deeQ/o=;
        b=Obo6oAySuXeQL7SR/kR3RsOWyPjmBZuQ1iCDG6jFN3NQlhbpRWyR5wpp3+CtrK5PtA
         eooydkw6Y4BcrSYMu89PGb+ojFaSmSkW0BkuCvhKeQzNbFSXqSz4XdKaKXG6Qyrg5Nqm
         NDJSp+7oPczlwAmDFul2HIED+IoQLZKi+s7/vSTMfpJZCLHu6KzMXQuji1Gi4neNA09W
         xdp8UcKiS4CMpmWl2eGL5zDt4zM0uiV4+KbnHEr/Sm8g0x/XqgoH+8hEUn9EIaMKTsGH
         iy4GWglSao8v9LMCsI/a83U27hEZPkfdfF3Lyrxggr/RbVKi+TmmMVHS290YcJ85/+p0
         y/pg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Wpm7tU9HBApDnWlYjiRiKJu2j+iVymScr/vq+bzYftCc3ifrxCEh3xqKqbqQ+FGZhDA98frFUTXFf9hbmSZf@lists.infradead.org
X-Gm-Message-State: AOJu0YxrP6A9bCuv6DXiZhYd2qOzNgJFM6iPNeHWBV2E0DM1oCcF9tm9
	KIXUeMb3Q8VCGJruo4moIqonSSKuKqpL7Cf4EZCZYYxa6OSkCwY=
X-Gm-Gg: ASbGnctIyVjUjuR+sYL1ra6l5wn9p8L1/csVuyaJtN1TyaBZVvUOhTO1a/lqk25vl6Q
	gscl2R3irc+BncUGxXkndgG1y/sMn7k5tA5PRLxJnCGgK87NxyciMYpWxpoDZdY/SgdHvSbGtuJ
	chVG6HvXnDKtEALuB3q6AVll2H/Sn4tADUe+GblyjenxM+Lc34dotVCYry+JdDc6opBQdTqIrjM
	LdMpVFMGabOZn5xrX/1S/KlsrcNaSXXSzytXtKWXfyW2IGYf9uqkuFi
X-Google-Smtp-Source: AGHT+IFENMHtBxMqOYbLnyZklK8TxKhy57F1FhvRUtYUInQIrUA9rU8ymAx4xYOehq+j+0FGzA2uug==
X-Received: by 2002:a17:903:41d1:b0:217:8557:5246 with SMTP id d9443c01a7336-219e6f4979amr721019265ad.55.1736268612929;
        Tue, 07 Jan 2025 08:50:12 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f7d83sm314319215ad.226.2025.01.07.08.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:50:12 -0800 (PST)
Date: Tue, 7 Jan 2025 08:50:11 -0800
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
Subject: Re: [PATCH bpf-next v4 1/4] xsk: Add launch time hardware offload
 support to XDP Tx metadata
Message-ID: <Z31bQ6xEkyQvbutN@mini-arch>
References: <20250106135606.9704-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106135606.9704-1-yoong.siang.song@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_085014_661584_C6A89EFB 
X-CRM114-Status: GOOD (  35.51  )
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
> Extend the XDP Tx metadata framework so that user can requests launch time
> hardware offload, where the Ethernet device will schedule the packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  Documentation/netlink/specs/netdev.yaml      |  4 ++
>  Documentation/networking/xsk-tx-metadata.rst | 64 ++++++++++++++++++++
>  include/net/xdp_sock.h                       | 10 +++
>  include/net/xdp_sock_drv.h                   |  1 +
>  include/uapi/linux/if_xdp.h                  | 10 +++
>  include/uapi/linux/netdev.h                  |  3 +
>  net/core/netdev-genl.c                       |  2 +
>  net/xdp/xsk.c                                |  3 +
>  tools/include/uapi/linux/if_xdp.h            | 10 +++
>  tools/include/uapi/linux/netdev.h            |  3 +
>  10 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> index cbb544bd6c84..e59c8a14f7d1 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -70,6 +70,10 @@ definitions:
>          name: tx-checksum
>          doc:
>            L3 checksum HW offload is supported by the driver.
> +      -
> +        name: tx-launch-time
> +        doc:
> +          Launch time HW offload is supported by the driver.
>    -
>      name: queue-type
>      type: enum
> diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
> index e76b0cfc32f7..3cec089747ce 100644
> --- a/Documentation/networking/xsk-tx-metadata.rst
> +++ b/Documentation/networking/xsk-tx-metadata.rst
> @@ -50,6 +50,10 @@ The flags field enables the particular offload:
>    checksum. ``csum_start`` specifies byte offset of where the checksumming
>    should start and ``csum_offset`` specifies byte offset where the
>    device should store the computed checksum.
> +- ``XDP_TXMD_FLAGS_LAUNCH_TIME``: requests the device to schedule the
> +  packet for transmission at a pre-determined time called launch time. The
> +  value of launch time is indicated by ``launch_time`` field of
> +  ``union xsk_tx_metadata``.
>  
>  Besides the flags above, in order to trigger the offloads, the first
>  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
> @@ -65,6 +69,65 @@ In this case, when running in ``XDK_COPY`` mode, the TX checksum
>  is calculated on the CPU. Do not enable this option in production because
>  it will negatively affect performance.
>  
> +Launch Time
> +===========
> +
> +The value of the requested launch time should be based on the device's PTP
> +Hardware Clock (PHC) to ensure accuracy. AF_XDP takes a different data path
> +compared to the ETF queuing discipline, which organizes packets and delays
> +their transmission. Instead, AF_XDP immediately hands off the packets to
> +the device driver without rearranging their order or holding them prior to
> +transmission. In scenarios where the launch time offload feature is
> +disabled, the device driver is expected to disregard the launch time
> +request. For correct interpretation and meaningful operation, the launch
> +time should never be set to a value larger than the farthest programmable
> +time in the future (the horizon). Different devices have different hardware
> +limitations on the launch time offload feature.
> +
> +stmmac driver
> +-------------
> +
> +For stmmac, TSO and launch time (TBS) features are mutually exclusive for
> +each individual Tx Queue. By default, the driver configures Tx Queue 0 to
> +support TSO and the rest of the Tx Queues to support TBS. The launch time
> +hardware offload feature can be enabled or disabled by using the tc-etf
> +command to call the driver's ndo_setup_tc() callback.
> +
> +The value of the launch time that is programmed in the Enhanced Normal
> +Transmit Descriptors is a 32-bit value, where the most significant 8 bits
> +represent the time in seconds and the remaining 24 bits represent the time
> +in 256 ns increments. The programmed launch time is compared against the
> +PTP time (bits[39:8]) and rolls over after 256 seconds. Therefore, the
> +horizon of the launch time for dwmac4 and dwxlgmac2 is 128 seconds in the
> +future.
> +
> +The stmmac driver maintains FIFO behavior and does not perform packet
> +reordering. This means that a packet with a launch time request will block
> +other packets in the same Tx Queue until it is transmitted.
> +
> +igc driver
> +----------
> +
> +For igc, all four Tx Queues support the launch time feature. The launch
> +time hardware offload feature can be enabled or disabled by using the
> +tc-etf command to call the driver's ndo_setup_tc() callback. When entering
> +TSN mode, the igc driver will reset the device and create a default Qbv
> +schedule with a 1-second cycle time, with all Tx Queues open at all times.
> +
> +The value of the launch time that is programmed in the Advanced Transmit
> +Context Descriptor is a relative offset to the starting time of the Qbv
> +transmission window of the queue. The Frst flag of the descriptor can be
> +set to schedule the packet for the next Qbv cycle. Therefore, the horizon
> +of the launch time for i225 and i226 is the ending time of the next cycle
> +of the Qbv transmission window of the queue. For example, when the Qbv
> +cycle time is set to 1 second, the horizon of the launch time ranges
> +from 1 second to 2 seconds, depending on where the Qbv cycle is currently
> +running.
> +
> +The igc driver maintains FIFO behavior and does not perform packet
> +reordering. This means that a packet with a launch time request will block
> +other packets in the same Tx Queue until it is transmitted.

Since two devices we initially support are using FIFO mode, should we more
explicitly target this case? Maybe even call netdev features
tx-launch-time-fifo? In the future, if/when we get support timing-wheel-like
queues, we can export another tx-launch-time-wheel?

It seems important for the userspace to know which mode it's running.
In a fifo mode, it might make sense to allocate separate queues
for scheduling things far into the future/etc.

Thoughts? No code changes required, just more explicitly state the
expectations.

