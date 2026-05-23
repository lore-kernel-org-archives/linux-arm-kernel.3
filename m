Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755ADCD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=; b=I2I7YpaGe7GtgUEGYjXnpEr+7H
	fkeYvASFaHn1l2DAKRlZDwFlhR1S8ZX8UXyEBzYscqZXugKm/AxTza5TCebU+T6AnwI0wCNOW8BiG
	MIdgJp79loUbh7ZMc1oVEI++e/7X4hmKp9AxTTvJHy9crbpUivM10i/LEVELcBkMGA/5VYBjauLhh
	Yd/d2xOdo/tZWcWlJwnwYWsPhzJuqjmdsW0CQOLR7bZWsbvHkBOjshOu+z57HvCp97dPY5EmgwHR4
	2V98EoH+lJqniZME2R1ESbPg3Yez9yvrH5LinVzVi2AWWbj/wDZdX6Wm8gS3ddoTISv7rZ5Jm1LD7
	XEmgtQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlOi-0000000DE9H-0Jbn;
	Sat, 23 May 2026 12:24:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlOf-0000000DE8X-3Cgo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 12:24:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so84764355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 05:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779539045; x=1780143845; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=;
        b=SKtbNuZ+91ziXrPEqEK3s49PwwifuxAGUeLpuM9mTsNdrsQztuwCSSlI4hbLO5sPrP
         UVynnpBppW6yTaAXP9tniMXvZp2i77kKvpHlsfH2eO8oNOH4LKm11OJnKiT29Jn2HNOH
         i9MzX6U34ckfLFwnJu3N8a8YmM7shCFI/HnWrCbc5zeMPyQ+PJQlnXRraJe3H0NWFdHY
         sS9X6+Mx507SkY0wpjfeTcMd6frEjing1fFJcsQ60rNUM22sMEf1Qtn+PAyA7R1RVBqX
         TSBdmSg5DVu8PufGRQoroP5eQ6fsGY2KtLjIv4acyKpBwcPsD0mMJSqIj4jEsOTK7P21
         C6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779539045; x=1780143845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUftknpjAzJRHNFFrDtQsWg7bJX0Pe38bqsMwsZfQGk=;
        b=AsZMeLxnl2dQqAf9VUNSbAcZfMZ8HKu/MxyWXfge0zryVKtG9djgjRbdIzgzYUNfXy
         ox6k19ofMZ1TjY8/+qt6CxB2fyQiKPtbwjUOA9LQtP6OH5z+VaqlRQeaz2GD7OcfbgBy
         adIsWarulh8iYPI/UEdyVNCPBmVaV7smW+WH1slfFwt0estq2Wk5L/KOcP/aDfdE/Rv3
         +SV0Z+nIrvO64ChtoxmmkPfceIHLQZSCvVyipvNePCYBS/eXMQAu1MkeKt5ZuiXPccol
         aDsI+6/YJfhIz39a6T59StAmY0i4mgqQCkrbNhlWNRN0uJfKIJx+nZKX/zRvQ2x08t8g
         jMLg==
X-Forwarded-Encrypted: i=1; AFNElJ+8yhRye6KLfHRiEKHfYEDRTVcqSc33hFLqpTRRC0atDwsc3jSX2DHAnnGCiTL99YoX4ax8ZWsHGMUo3M3VFX44@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4faKbxjt6K2o49slWPOtl/+xkFkuh5sE7bcC/w9etAQ+JD9N
	Vsh6TUIBFxr/D4SrQPmBOw4uOhVnw0iogRLGph6cy3+OFJ8g6dtuhgOE
X-Gm-Gg: Acq92OEIjfRUxfoNxu5C/QEZxxiWvsDnw8gkxBa5Ljnw5qiMENvgdNWk7FwB+ayTrLA
	yJDihuwLwA9IMnZkKKr/6fjNso2zqyaURNUx5q0/FrmU/+Zxd6TYMRE1VC8qvoAXhiknO9an6BT
	oPUiK4MFzKyenQ4Gby3pI7pv9viEQKfIdthQGesuwdJTL3yqjglTaYOGiyFQelWwxUFbDBk6Faq
	KOFi1UHWcQECVOE7MMut1wyaoQgdr1Ac/QUca3djF6suZ+dfFO2Zl/eRuKHs9/uyhjCFlJ4Kk1s
	Z/D82y11GVkYZjvXM/B6hSHwfEditMgwcKB4Vsm1qGmpNpxR8cuHZVC7jOOp0nJEyFi0u3avciy
	DEcB1fT3cHHZmaKJwOW6f5QtOINN3TSCm7l7AOC8jwbB7l8HNzNgj+9IfFOWrCmBLhiWN+F94nS
	kbq+TOW7GtbUkM6ewLu0DeuxN19RWpR9ysQA==
X-Received: by 2002:a17:903:440f:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2beb0603fbemr81368385ad.28.1779539044856;
        Sat, 23 May 2026 05:24:04 -0700 (PDT)
Received: from [192.168.89.2] ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm45002225ad.49.2026.05.23.05.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 05:24:03 -0700 (PDT)
Message-ID: <5315a2f6-3504-4660-8a64-51f7f6b69a45@gmail.com>
Date: Sat, 23 May 2026 21:24:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add packet-mode ESP offload for Airoha/EIP93
To: Christian Marangi <ansuelsmth@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260523121522.3023992-1-hurryman2212@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_052405_801388_6134BB1C 
X-CRM114-Status: GOOD (  22.01  )
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



On 5/23/26 21:15, Jihong Min wrote:
> This series adds the missing plumbing for ESP offload engines that
> operate on whole ESP packets instead of only exposing AES/HMAC through
> the crypto API AEAD interface.
> 
> The normal ESP software path can already call into accelerated AEAD
> algorithms, but packet-mode engines such as EIP93 can also generate and
> consume ESP packet framing: padding, pad length, next header and ICV.
> That needs a slightly different XFRM offload contract so the netdev
> driver can hand the skb to a packet backend rather than trying to make
> hardware fit the software trailer layout.
> 
> Patch 1 extends the ESP offload infrastructure for packet engines while
> preserving the existing behavior for drivers that do not opt in.
> Patch 2 exposes an EIP93 ESP packet backend for encapsulation and
> decapsulation.
> Patch 3 wires Airoha Ethernet GDM netdevs and DSA user ports to that
> backend through xfrmdev_ops. ESP GSO and ESP TX checksum offload remain
> disabled.
> 
> Runtime testing was done on a Gemtek W1700K2 running OpenWrt with the
> same changes applied on top of a 6.18.31-based kernel.
> 
> Test parameters:
> 
>   - Static IPv4 transport-mode XFRM SAs between the AP and host.
>   - ESP transform: auth hmac(sha1), enc cbc(aes) with a 128-bit AES key.
>   - iperf3 TCP test, AP as client and host as server:
>         iperf3 -c <host_ip> -P 4 -t 10
>   - The host always used normal Linux XFRM software processing.
>   - With AP ESP offload disabled, the AP also used the Linux XFRM
>     software path; in this setup, EIP93-backed AEAD crypto was still
>     available to that path.
> 
> Network-relevant test setup:
> 
>   - AP: Gemtek W1700K2, Airoha AN7581/EN7581, 4x Arm Cortex-A53 at
>     1.4 GHz, 2 GiB RAM, airoha_eth wan (GDM2) netdev, 10Gb/s full-duplex,
>     MTU 9200, EIP93 crypto and IPsec packet engine present.
>   - Host: AMD Ryzen 9 9950X3D, 16 cores/32 threads, Open vSwitch,
>     MTU 9978, backed by a ConnectX-6 Dx 10Gb/s full-duplex link.
> 
> AP to host iperf3 result:
> 
>   AP offload      Sender          Receiver        Retransmits
>   on              918.2 Mbit/s    913.6 Mbit/s    0
>   off             782.4 Mbit/s    778.6 Mbit/s    3569
> 
> This is a 17.3% receiver-side throughput improvement for the AP TX ESP
> path in this setup, with retransmits eliminated in the offloaded run.
> 
> Jihong Min (3):
>   xfrm: extend ESP offload infrastructure for packet engines
>   crypto: inside-secure: add EIP93 ESP packet backend
>   net: airoha: add EIP93-backed ESP XFRM offload
> 
>  MAINTAINERS                                   |    1 +
>  drivers/crypto/inside-secure/eip93/Kconfig    |   10 +
>  drivers/crypto/inside-secure/eip93/Makefile   |    1 +
>  .../crypto/inside-secure/eip93/eip93-ipsec.c  | 1413 ++++++++++++++++
>  .../crypto/inside-secure/eip93/eip93-main.c   |   69 +-
>  .../crypto/inside-secure/eip93/eip93-main.h   |   38 +-
>  drivers/net/ethernet/airoha/Kconfig           |   11 +
>  drivers/net/ethernet/airoha/Makefile          |    1 +
>  drivers/net/ethernet/airoha/airoha_eth.c      |   51 +-
>  drivers/net/ethernet/airoha/airoha_eth.h      |   69 +
>  drivers/net/ethernet/airoha/airoha_xfrm.c     | 1474 +++++++++++++++++
>  include/crypto/eip93-ipsec.h                  |  132 ++
>  include/linux/netdevice.h                     |    3 +
>  include/net/xfrm.h                            |    8 +-
>  net/ipv4/esp4.c                               |    6 +-
>  net/ipv4/esp4_offload.c                       |   29 +-
>  net/ipv6/esp6.c                               |    6 +-
>  net/ipv6/esp6_offload.c                       |   29 +-
>  18 files changed, 3324 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/crypto/inside-secure/eip93/eip93-ipsec.c
>  create mode 100644 drivers/net/ethernet/airoha/airoha_xfrm.c
>  create mode 100644 include/crypto/eip93-ipsec.h
> 

One note I should have included in the cover letter:

The hardware behavior used by this series was studied from the out-of-tree
IPsec branch of the mtk-eip93 driver:

  https://github.com/vschagen/mtk-eip93/tree/ipsec

That code was useful for understanding the EIP93 packet-mode ESP descriptor
programming and SA record values.

This series is not a direct import of that driver. The implementation was
rewritten around the current upstream driver layout and the Linux XFRM
netdev offload model, with EIP93 exposed as a packet-mode ESP backend used
by the Airoha netdev driver.


Sincerely,
Jihong Min

