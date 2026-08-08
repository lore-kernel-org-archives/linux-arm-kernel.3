Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3A3C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QT5V9DnroqFF7LhVXu5utoVefBI3jbPAXKoqn/bo8rk=; b=HdgQsqxdNs5Cfsp/dXIIWeaQ9C
	XSVctMX5nN9XTUpvVsEdhW6M68BkNwSn5lSBffsdQu9sGteWHb5X5SuxwXPFThTN3caWBuV5s5oyZ
	7dSB+NQ4zgpA5f3vuQKkfVrmPaYHtWIXEVn3lGW9VgI4KZev8/kIRuMkHq0vEhFZmSBEwP8e+Ddqj
	rHsrbamR5Hd7aZMa/Sbma1wBfI6etLowryWjFI/PQ57u8vdUejyIzE5wefvp0SDPOIcqDWOvYWbbi
	trl9TTsPS7fJQcZHQRvAoO7nY7rhYITZRczJVmgx/v8d6iuyV/dw8vJSI/KC0vzhS42XuRWoYu4Eb
	vRPx9s9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1y-00000009fRb-2V2y;
	Sat, 08 Aug 2026 19:48:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsn1w-00000009fOp-0KZT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:48:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D0243EBA;
	Sat,  8 Aug 2026 19:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD7E1F000E9;
	Sat,  8 Aug 2026 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786218507;
	bh=QT5V9DnroqFF7LhVXu5utoVefBI3jbPAXKoqn/bo8rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OQJ5N09t9DuXBthTGuDN63DLQj81u7xaV1bbKBf6q7Jrw39/ys395wzOXO6nfTIVL
	 0mtz6gs1hgi0wiy/YnboNKyzelnRwq+vNlhWlMrZC4EJzjB3rTefTl3EvAkZ/JAqMl
	 ms4+lNojvOnD2tNPOPruH+YIpSLWBzalTeKlZ+8E44hpBUGTbZwtCURmbNympGHeMJ
	 Qzz9PJRdZ7RVj2UJTs+jVOnLr61fHAlX1SLan9tkVxFs9aWQZlmObWP7TNAib+LBT9
	 r0ExVQLVx+xcZFj8OTRdXNODVTcrYXmN187Foc4XPjOcMymd2gFOrQ0NOMxa1sVbHw
	 mCyWwTzQP5+Pg==
From: Jakub Kicinski <kuba@kernel.org>
To: nagadheeraj.rottela@amd.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	srinivas.neeli@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	michal.simek@amd.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	git-dev@amd.com
Subject: Re: [PATCH 09/20] net: dsa: tag_xlnx_tsn: add skeleton tag protocol
Date: Sat,  8 Aug 2026 12:48:26 -0700
Message-ID: <20260808194826.132977-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807104431.157230-10-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-10-nagadheeraj.rottela@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: dsa: tag_xlnx_tsn: add skeleton tag protocol

This adds DSA_TAG_PROTO_XLNX_TSN and a new tag driver for the AMD/Xilinx
TSN Endpoint Ethernet MAC, which carries port classification out of band
via a METADATA_HW_PORT_MUX metadata_dst instead of an in-band CPU tag.
The tagger is described as a no-op, with the PTP TX intercept deferred to
a later patch.

A few questions below.

> diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
> index d5e725b90d78..8ca48ce46ec1 100644
> --- a/net/dsa/Kconfig
> +++ b/net/dsa/Kconfig
> @@ -221,4 +221,13 @@ config NET_DSA_TAG_YT921X
>  	  Say Y or M if you want to enable support for tagging frames for
>  	  Motorcomm YT921x switches.
>  
> +config NET_DSA_TAG_XLNX_TSN

[Severity: Low]
Should this symbol sit between NET_DSA_TAG_VSC73XX_8021Q and
NET_DSA_TAG_XRS700X instead of after NET_DSA_TAG_YT921X?  The Makefile
change in this same patch does place it alphabetically:

  obj-$(CONFIG_NET_DSA_TAG_VSC73XX_8021Q) += tag_vsc73xx_8021q.o
  obj-$(CONFIG_NET_DSA_TAG_XLNX_TSN) += tag_xlnx_tsn.o
  obj-$(CONFIG_NET_DSA_TAG_XRS700X) += tag_xrs700x.o

so the two lists no longer correspond.  This ordering is still the same at
the end of the series.

> +	tristate "Tag driver for AMD/Xilinx TSN Endpoint Ethernet MAC"
> +	help
> +	  Say Y or M if you want to enable support for the AMD/Xilinx TSN
> +	  Endpoint Ethernet MAC IP. The IP does not insert an in-band CPU
> +	  tag; port classification is conveyed via metadata_dst attached on
> +	  RX by the EP MAC driver, and PTP TX frames are intercepted in the
> +	  xmit hook to be steered into the per-MAC PTP TX register window.

[Severity: Low]
The help text tells the user that "PTP TX frames are intercepted in the
xmit hook to be steered into the per-MAC PTP TX register window", but
xlnx_tsn_xmit() added by this same patch is a bare pass-through with no
ETH_P_1588 classification and no tagger_data->ptp_tx() call, and the file
does not include <linux/dsa/xlnx_tsn.h> yet.

Would it make sense to add the second sentence of the help text together
with the later patch that implements it?  The commit message itself says
"A later patch adds the PTP TX intercept", so at this revision menuconfig
describes behaviour that is not present.

The mismatch does go away at the end of the series, where
xlnx_tsn_xmit() gains:

  net/dsa/tag_xlnx_tsn.c:xlnx_tsn_xmit() {
      ...
      if (eth_hdr(skb)->h_proto != htons(ETH_P_1588) ||
          skb_vlan_tag_present(skb))
              return skb;

      tagger_data->ptp_tx(dp, skb);
      return NULL;
  }

> +
>  endif

[ ... ]

> diff --git a/net/dsa/tag_xlnx_tsn.c b/net/dsa/tag_xlnx_tsn.c
> new file mode 100644
> index 000000000000..de352aa3d9a8
> --- /dev/null
> +++ b/net/dsa/tag_xlnx_tsn.c
> @@ -0,0 +1,33 @@

[ ... ]

> +static struct sk_buff *xlnx_tsn_rcv(struct sk_buff *skb,
> +				    struct net_device *dev)
> +{
> +	kfree_skb(skb);
> +	return NULL;
> +}

[Severity: Low]
Could this drop be documented and made visible?  The commit message and
the Kconfig text describe a "no-op tag driver" that "has no tag bytes to
add or strip", but xlnx_tsn_rcv() destroys every skb it is handed, with no
drop reason, no counter and no comment.

The hook does look mandatory for the design, since the conduit RX
interception only happens when .rcv is non-NULL:

  include/net/dsa.h:netdev_uses_dsa() {
      return dev->dsa_ptr && dev->dsa_ptr->rcv;
  }

but that rationale is not stated anywhere in the file.

For frames that do carry the metadata dst attached by the EP MAC driver:

  drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c:ep_dma_rx_cb() {
      ...
      skb_dst_set_noref(skb, &ep->port_md[port_id]->dst);
      ...
  }

dsa_switch_rcv() takes the METADATA_HW_PORT_MUX branch and never reaches
this function.  Anything else falls into:

  net/dsa/tag.c:dsa_switch_rcv() {
      ...
      } else {
              nskb = cpu_dp->rcv(skb, dev);
      }
      ...
  }

so a conduit frame whose metadata dst was stripped, for example by a tc
ingress action on the conduit, disappears without showing up in
ip -s link, dropwatch or drop-reason tracing.  Would
kfree_skb_reason() plus a short comment explaining that the hook exists
only to make netdev_uses_dsa() true be preferable here?  This body is
unchanged at the end of the series.

