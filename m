Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F7ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CB/Z4bzbsyrd+gSXXFc5hMEcaetYVQ+7kd0CfM+SH9M=; b=0mTMA++H89gwkDSDAl0/VG3vyL
	nRFh6bHZBlp18RSTV3JbSIdoiKAvRV98xU2Y+89xXq5ZlKIRn6dkmqKTi0yjGr2uYCwkOX0pe8OOb
	OdukHHcQroeNvCb5nLffZgAnst/N2D86VHIFW7GCRilFZ2kjAEzD6BDQvUvSLb/SjZZVKfmILhCcA
	/NetWEk161IqTqSwpyXxxKQUB9VlR0d9qLQYWJ3Y67VFLazWKuSKecRK+orzeLUJT9CcxvqgK8EO7
	GLWd/F0lIK6GG9daLMwSl8Bgsb9oKK4W7uLcmcWlRPs6HUJ41vncrtF63D6PMWGy5xEquFPeRDeT2
	hHnC48uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg6Y-00000004ZUA-0vNG;
	Wed, 20 May 2026 12:32:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPg6V-00000004ZT9-2zIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779280368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CB/Z4bzbsyrd+gSXXFc5hMEcaetYVQ+7kd0CfM+SH9M=;
	b=VWbNaaJSOypZLncC0ZxScuqtuizzh8UtOSSdMf8MfSRtrK7kWDgwD+J+xqBLOZLFR89Z1k
	aPnwSw393OhtSJN6RFsOW8dA06o6rHayfseV4mfizad+G8oSHBJPlbs8UrB4lz174LFWLe
	HwKwGpHevLfFgIURNOHfzHQk8cdbasE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-OFz8t6rZN3-_6eMhLI993A-1; Wed,
 20 May 2026 08:31:13 -0400
X-MC-Unique: OFz8t6rZN3-_6eMhLI993A-1
X-Mimecast-MFC-AGG-ID: OFz8t6rZN3-_6eMhLI993A_1779280271
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3E3A1956096;
	Wed, 20 May 2026 12:31:09 +0000 (UTC)
Received: from thinkpad (dhcp-64-111.muc.redhat.com [10.32.64.111])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 271F01800465;
	Wed, 20 May 2026 12:31:03 +0000 (UTC)
Date: Wed, 20 May 2026 14:31:00 +0200
From: Felix Maurer <fmaurer@redhat.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, MD Danish Anwar <danishanwar@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Meghana Malladi <m-malladi@ti.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	David Carlier <devnexen@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Kevin Hao <haokexin@gmail.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <ag2phK4k7PuyBo5B@thinkpad>
References: <20260514075605.850674-1-danishanwar@ti.com>
 <20260514075605.850674-3-danishanwar@ti.com>
 <20260518184506.694c584e@kernel.org>
 <E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
MIME-Version: 1.0
In-Reply-To: <E30AAC96-01D2-4A23-B562-126087DEB7FA@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: XXSdtmYdulHZBqS_sXpwPBKByXhTmfUrEZKWQn_A9dM_1779280271
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_053251_819858_19585EC9 
X-CRM114-Status: GOOD (  28.25  )
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

Hi everyone,

On Tue, May 19, 2026 at 07:55:55AM +0200, Luka Gejak wrote:
> On May 19, 2026 3:45:06 AM GMT+02:00, Jakub Kicinski <kuba@kernel.org> wrote:
> >On Thu, 14 May 2026 13:26:05 +0530 MD Danish Anwar wrote:
> >> Add new firmware PA statistics counters for HSR and LRE to the ethtool
> >> statistics exposed by the ICSSG driver.
> >>
> >> New statistics added:
> >>  - FW_HSR_FWD_CHECK_FAIL_DROP: Packets dropped on the HSR forwarding path
> >>  - FW_HSR_HE_CHECK_FAIL_DROP: Packets dropped on the HSR host egress path
> >>  - FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES: Frames with duplicate discard
> >>    skipped
> >>  - FW_LRE_CNT_UNIQUE/DUPLICATE/MULTIPLE_RX: LRE duplicate detection
> >>    counters
> >>  - FW_LRE_CNT_RX/TX: LRE per-port frame counters
> >>  - FW_LRE_CNT_OWN_RX: Own HSR tagged frames received
> >>  - FW_LRE_CNT_ERRWRONGLAN: Frames with wrong LAN identifier (PRP)
> >>
> >> Document the new HSR/LRE statistics in icssg_prueth.rst.
> >
> >To an untrained eye these stats look like stuff that could
> >be standardized across drivers.
> >
> >Luka, Felix, others on CC, do you think we should expose these
> >from HSR over netlink as "standard" offload stats different drivers
> >can plug into or not worth it?
>
> Hi Jakub,
> I think there is a case for standardizing part of this, but I would
> not standardize the whole set as-is.
>
> The LRE counters look generic enough to me, especially:
>  - unique rx
>  - duplicate rx
>  - multiple rx
>  - rx / tx
>  - own rx
>  - wrong LAN, PRP only

I'm very much in favor of having standardized stats for hsr hardware
offloads that the drivers can supply. The list above looks about right,
I'd add "frames with errors" and "(proxy) node table entry count" as
well and that "own rx" is HSR only.

In general, I don't think we need to standardize this ourselves but can
adapt to the counters that the SNMP MIB for IEC 62439-3 [1] already has.
It's part of the standard and IMHO we should gather these counters from
offloads (and later supply the same set from our sw implementation, but
the current netlink interface for hsr is quite messy). For reference,
the list in the MIB is (no need to fully adopt this naming):
- lreCntTx{A,B,C}: Sent frames per-port (for A,B only tagged frames)
- lreCntRx{A,B,C}: Received frames per-port (for A,B only tagged frames)
- lreCntErrWrongLan{A,B}: Received frames per-port with wrong LAN ID
  (only for PRP)
- lreCntErrWrongLanC: Received frames on interlink port of HSR-PRP
  RedBox with wrong LAN ID
- lreCntErrors{A,B,C}: Received frames with errors per-port
- lreCnt{,Proxy}Nodes: Nodes in the (proxy) node table
- lreCntUnique{A,B,C}: Frames only received once, per-port
- lreCntDuplicate{A,B,C}: Frames received with exactly one duplicate,
  per-port
- lreCntMulti{A,B,C}: Frames received with more than one duplicate,
  per-port
- lreCntOwnRx{A,B}: Frames received per-port (A,B) that originated from
  this node, only for HSR rings

Note that we can not currently completely distinguish
Unique/Duplicate/Multi in the kernel implementation and their meaning is
not entirely clear to me from the MIB.

The explanations in the MIB in [1] are otherwise quite explicit for each
of the counters but we may want to adapt the meaning of "port C" to the
counters. For example, there is lreCntRx{A,B,C} for received HSR/PRP
tagged frames (by the LRE). Port A and B are clear, but for port C the
meaning is "number of frames received from the application interface of
a DANP or DANH or the number of number of frames received on the
interlink of a RedBox". IMHO, we should consider separating "application
interface" (what the kernel calls master) and the interlink port because
these two are not mutually exclusive in the kernel (nor in the NICs that
support hardware offload).

Thanks,
   Felix


[1]: you can find it for example here: https://mibbrowser.online/mibdb_search.php?mib=IEC-62439-3-MIB


