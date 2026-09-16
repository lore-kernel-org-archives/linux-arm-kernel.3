Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2678EC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYakI41YOepUCc8Ox+8Jq/FeqJw1dMrVoS2gQCRrOmU=; b=lyU6TJoUFS3WMYbyJyhJpb0RU3
	CFbKa3fN3PkqtYFOWyQx2mE3k9dWvn/QgyNOFeUr3PynqDESIu+/uyBiwD/e2QeKljY6rY9JL9dbx
	L6rwigwnLIRIKEpTKB9gx+3RYGXVZdsJBqofJmEWjp9ZVydJwpLUW9zhtsV5Ua5EirJUzO4KE6MBR
	bXKDkDviJ5lOuyF/FvoMKV7GeFql2w5z4aEwNNeOUCuVAtsRUSp22Fft3CG76KYELh/Z8QPd4/2Ww
	kxNEh5nn4qRfhDEY94BAQCjJy9NTNnBX+DKeUye/QTpR9gKjMZLuuIPt5LCzZfHo7QvzuYsYhJXd3
	40JfDZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zVS-0000000AHyW-0E2I;
	Wed, 16 Sep 2026 23:57:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zVQ-0000000AHyM-0xqE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 23:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FBE341A64;
	Wed, 16 Sep 2026 23:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB0F1F000FF;
	Wed, 16 Sep 2026 23:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789603055;
	bh=qYakI41YOepUCc8Ox+8Jq/FeqJw1dMrVoS2gQCRrOmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g/DMyAUfIuO+zZ4KVeJlkf2CXBHROPnONq8wvWi9xtEHbmPQHI3R2V+YC41W4sh0T
	 ek9xnCTFj5uoKxcDTBnYJsu9T7KVTCBFTZcpHYR/Sd5NW6fPM4P1ttvnZ4uYQYa5nY
	 Wuh5Czk0aIs+QpuUQ6FqvACgxaTY7TBZd4KAc0QTEV+y2o/zMTloDXPLbfKwH46bmw
	 zjLEwxXooqkKtJhd6Jnek/YP1gTI6ATU9BiSuYbxiHFgK9YyDFNZeLDOkWHFechVf9
	 rIr/XX/xdoh5sRsn5YW6VFRzNDMkJYTLulXD8O+B/gZK3uPj0lnkfePoJQX1rI5bp7
	 1XivUqq/hAr9Q==
Date: Wed, 16 Sep 2026 16:57:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Neeli, Srinivas" <srneeli@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>, Nagadheeraj Rottela
 <nagadheeraj.rottela@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Subject: Re: [PATCH net-next v2 0/8] Add Xilinx TSN Endpoint Ethernet MAC
 driver
Message-ID: <20260916165731.19ff3f94@kernel.org>
In-Reply-To: <cab3aede-940d-4ebb-80ac-41f4755d6d78@amd.com>
References: <20260909-patches_v2_external-v2-0-3a40babaff4c@amd.com>
	<20260915172232.04df37b2@kernel.org>
	<cab3aede-940d-4ebb-80ac-41f4755d6d78@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 16 Sep 2026 13:31:26 +0530 Neeli, Srinivas wrote:
> On the data path, DSA maps onto the hardware cleanly. On RX, the EP DMA 
> path delivers the source port in sideband metadata, which feeds DSA's 
> existing metadata-based
> demultiplexing to the per-port netdevs. On TX, the normal data path has 
> no destination-port selector and the switch has no independent per-port 
> forwarding mask, so
> standalone isolation is done with a private VLAN containing only the 
> selected port and the EP. The next version uses DSA's tag_8021q helpers 
> to manage those VLANs, insert
> the destination port's VLAN tag (which the hardware strips before wire 
> egress), and handle the transitions between standalone and bridged 
> operation.

Oh, well, that probably makes DSA justifiable here.
Please provide more details in the cover letter for v3.
Given the TSN focus I was expecting that the "EP" will
have the ability to apply metadata to control the treatment
of the egress packets, but sounds like quite the opposite :(

