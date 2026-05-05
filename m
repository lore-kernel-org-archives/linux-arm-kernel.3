Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB29BFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=; b=Fzoz0B8Mfg09bcB6Usq9bZiUbW
	ZttnA6EedB9H/L1ks/J/Tav0/z0RyyOqrAOSvyxb0s8wMX0M2QRqw1hMSAVTq+Cq+7otqoMmAF/fI
	N2lcGNTNvycHbFItUCSDBjD3U5Gf05GEFEPLSgVmy3ZY2qx6WY6foHwQiZTBssB4Pk7B9sr9DetJN
	niwAxTubZbJSx5IKEC4lfYsID4I1EeYTfScbilocsS26VsXILB6lXrS+jiFFqfhj173noG5GTuoAA
	50bmpGZjU7gL96jRhiudd6GKxx3YKQgG3w+9oWxFmbcc1jZ0SyNynnI0eusdInQI2Hxc/likPASaj
	vCySXu3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJt-0000000FhHc-2fGR;
	Tue, 05 May 2026 09:44:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCJq-0000000FhFu-2kOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777974237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
	b=dmaJ5jtdLJSdH9PZjrm+u5GTvfAiIM5WnJ5pZV7AxMxDAp13oCSR8MJ4clZAMBaG11nIxF
	V8XMZmIbxNu7zOPnMlIOHDZK7ycUwLxFzLNaCnf7FSzL37NXYkdnocz5I9Li2F5gCgDaou
	iKWnxA73AGYgd16jh6XY0Wxns1UJyno=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-RDPB0-QWNxSlIsat2cmtHA-1; Tue, 05 May 2026 05:43:55 -0400
X-MC-Unique: RDPB0-QWNxSlIsat2cmtHA-1
X-Mimecast-MFC-AGG-ID: RDPB0-QWNxSlIsat2cmtHA_1777974235
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48d035e8593so13286185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777974234; x=1778579034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyJRtAdai9pCgAp5lRpf5bBAJMr8C8LzYPKP+rHxUU=;
        b=cZXSTIWKMAS4TPp2xXiyfI5maSgZGKP1OpQYu45DzGDjUgNRItO0WVQhhLM3uLXuUj
         sQtnOIVpZw4Oe/22m558mCgXx/tUjuPKR/mua/+O1YD+3KrKnggZsxlsewPzBj9GD0H1
         Sbz7FJvjODvMv2NhEoWEyQmkI/wurvQ82Ip+tvinDYclUC8Hsy4MZL0BViZJ5oQW5zD8
         OJzZyN6Ttd9d/gulyUDmF2pbEBKgXluRtcBu9AywEgtY6Kx+5rRFT+zq6pnBho3vWzX8
         2kUStZ9+h38CI0LkuK/0L35Zv1hEDPZntB5xiBjCv3BzafMCJh2RamnFdfarlvNwXIhd
         M+LA==
X-Forwarded-Encrypted: i=1; AFNElJ8weYhK0u9MRuOHsEMHzI87NuFvx1ekwoJU5hy9c6g3vHz9xsCgeBfYBjXOa57+uElj7xjF43s1nNIZeGnz4pWX@lists.infradead.org
X-Gm-Message-State: AOJu0YxteqBmFgoerXRoHxfUNwjSigv230oT9onSQBM2mqBoHvLjfNwl
	RG55gkGu52dlZGLh5InVRVVsiYAnYpXeH9Ee470EWOf97bmH7I9Nw4IcMmhbAWb08XSfmEXt8Ia
	YHwK9xA8f8bb5FU87Hlq0u9T6UITy29VHvEuMmHd8VIn3nr+BRjT21fj1uS0J0ZJSbpjAfArowB
	3z
X-Gm-Gg: AeBDieuGQHzamESKcFPK5nnon34KGB+HzZhpU68EmpvyyoKK4+DmMJatHxXb97DZarK
	4ha+HVfaMFYp+um72UtvXGVVGgThI4tQNVuBJpltFiwy+Uwi2bexocmVnLKZKjj8cKIW/iIb85E
	kcS4BhzNdtSf8EVzID3wmMB/YpddpQ3PczW7SELwNFl+XTz34MPZ3A1ONa4GwyYL2zlH6ja/s9p
	XZeuo/hzHRoC6uRt13OayX/CSstxwSqw8gFJLrdRV0Zsdq5cmWAUm8lr8do2th7XAD0qTf0IEF7
	JnSrCv/Kd2HFuiCCaxrvuQLKashlEJPk1PHr7bvobZWtGeJOPrcbQWXQlS8GpsrR9ZTjgCfLBKi
	uFCnmQvBOulbMaHmy+FBChGl9RJSFtFJVQRsrKuLDCXTMC0Ak7KjBqs9zkU6mN05GtKw=
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218126815e9.29.1777974234574;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48a988ca441mr218126385e9.29.1777974234170;
        Tue, 05 May 2026 02:43:54 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm603894855e9.1.2026.05.05.02.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 02:43:53 -0700 (PDT)
Message-ID: <37382811-ba47-4432-9911-6c39acea4f86@redhat.com>
Date: Tue, 5 May 2026 11:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 15/15] net: dsa: netc: add support for ethtool
 private statistics
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
 frank.li@nxp.com, chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20260430024945.3413973-1-wei.fang@nxp.com>
 <20260430024945.3413973-16-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260430024945.3413973-16-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bG0KjuelY7U7_ITUWmbD4heCsr0bQUDjH3-xZoPmP-Q_1777974235
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_024358_794711_17CE64E3 
X-CRM114-Status: GOOD (  16.92  )
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

On 4/30/26 4:49 AM, Wei Fang wrote:
> Implement the ethtool private statistics interface to expose additional
> port-level and MAC-level counters that are not covered by the standard
> IEEE 802.3 statistics. The pMAC counters are only reported when the port
> supports Frame Preemption (802.1Qbu/802.3br).
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/dsa/netc/netc_ethtool.c   | 107 ++++++++++++++++++++++++++
>  drivers/net/dsa/netc/netc_main.c      |   3 +
>  drivers/net/dsa/netc/netc_switch.h    |   9 +++
>  drivers/net/dsa/netc/netc_switch_hw.h |  58 ++++++++++++++
>  4 files changed, 177 insertions(+)
> 
> diff --git a/drivers/net/dsa/netc/netc_ethtool.c b/drivers/net/dsa/netc/netc_ethtool.c
> index ac8940b5a85c..8d04db534347 100644
> --- a/drivers/net/dsa/netc/netc_ethtool.c
> +++ b/drivers/net/dsa/netc/netc_ethtool.c
> @@ -19,6 +19,56 @@ static const struct ethtool_rmon_hist_range netc_rmon_ranges[] = {
>  	{ }
>  };
>  
> +static const struct netc_port_stat netc_port_counters[] = {
> +	{ NETC_PTGSLACR,	"port gate late arrival frames" },
> +	{ NETC_PSDFTCR,	"port SDF transmit frames" },
> +	{ NETC_PSDFDDCR,	"port SDF drop duplicate frames" },
> +	{ NETC_PRXDCR,		"port rx discard frames" },
> +	{ NETC_PRXDCRRR,	"port rx discard read-reset" },
> +	{ NETC_PRXDCRR0,	"port rx discard reason 0" },
> +	{ NETC_PRXDCRR1,	"port rx discard reason 1" },
> +	{ NETC_PTXDCR,		"port tx discard frames" },
> +	{ NETC_PTXDCRRR,	"port tx discard read-reset" },
> +	{ NETC_PTXDCRR0,	"port tx discard reason 0" },
> +	{ NETC_PTXDCRR1,	"port tx discard reason 1" },
> +	{ NETC_BPDCR,		"bridge port discard frames" },
> +	{ NETC_BPDCRRR,	"bridge port discard read-reset" },
> +	{ NETC_BPDCRR0,	"bridge port discard reason 0" },
> +	{ NETC_BPDCRR1,	"bridge port discard reason 1" },
> +};
> +
> +static const struct netc_port_stat netc_emac_counters[] = {
> +	{ NETC_PM_ROCT(0),	"eMAC rx octets" },
> +	{ NETC_PM_RVLAN(0),	"eMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(0),	"eMAC rx frame errors" },
> +	{ NETC_PM_RUCA(0),	"eMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(0),	"eMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(0),	"eMAC rx packets" },
> +	{ NETC_PM_TOCT(0),	"eMAC tx octets" },
> +	{ NETC_PM_TVLAN(0),	"eMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(0),	"eMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(0),	"eMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(0),	"eMAC tx packets" },
> +	{ NETC_PM_TUND(0),	"eMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(0),	"eMAC tx invalid octets" },
> +};
> +
> +static const struct netc_port_stat netc_pmac_counters[] = {
> +	{ NETC_PM_ROCT(1),	"pMAC rx octets" },
> +	{ NETC_PM_RVLAN(1),	"pMAC rx VLAN frames" },
> +	{ NETC_PM_RERR(1),	"pMAC rx frame errors" },
> +	{ NETC_PM_RUCA(1),	"pMAC rx unicast frames" },
> +	{ NETC_PM_RDRP(1),	"pMAC rx dropped packets" },
> +	{ NETC_PM_RPKT(1),	"pMAC rx packets" },
> +	{ NETC_PM_TOCT(1),	"pMAC tx octets" },
> +	{ NETC_PM_TVLAN(1),	"pMAC tx VLAN frames" },
> +	{ NETC_PM_TFCS(1),	"pMAC tx FCS errors" },
> +	{ NETC_PM_TUCA(1),	"pMAC tx unicast frames" },
> +	{ NETC_PM_TPKT(1),	"pMAC tx packets" },
> +	{ NETC_PM_TUND(1),	"pMAC tx undersized packets" },
> +	{ NETC_PM_TIOCT(1),	"pMAC tx invalid octets" },
> +};

Sashiko says:

Are these standard MAC and interface statistics being duplicated in the
driver-private ethtool strings?
The networking subsystem guidelines indicate that statistics which have
a standard uAPI must not be duplicated in ethtool -S. Standard
interfaces like struct rtnl_link_stats64 or struct ethtool_eth_mac_stats
already exist for counters such as rx octets, rx packets, dropped
packets, and FCS errors.
Could these metrics be exposed through the standardized interfaces
rather than adding them to the private string sets?

Other comments are AFAICS false positives.

/P


