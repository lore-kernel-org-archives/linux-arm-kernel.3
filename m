Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DF1CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiCeC8KmiIM1YvH4w0dfK1GNGdzfBIn9teZ75xYOvlI=; b=mZdUlApfEhrD9SwDlzp764oUwM
	i5kevDRXZ72tZlkHTBW6tm9aZBLQ1NuY51+BTghfSV/ns02kuFlnuIuTiFNk+znYLjPfVOqmgwPhK
	YDIuHzhq9IMWNNIlKlw8aXZVbBK4CwM7SAobCyB+UdoJRHhpyoM8htUU6XK6RmZjO+FF0cGTHBzn/
	DcYXh4lLCS/QTGbGBaL3H1fFJVS1atPVDJmkOXWVjEgOZuw4Pkwj4/hLFlsS7lj+0vPUdKbZ45sGR
	r3TYQ275LVGTt20EdlHvwdyvZUjE1B1+Wy8nIPAu5ltckZVpEDGqufb8qFIIff3DZwcsjUXoaNodo
	QXn+gzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QJx-00000005HWo-46st;
	Thu, 16 Oct 2025 15:55:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QJv-00000005HVl-3Zm1;
	Thu, 16 Oct 2025 15:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F3FA45700;
	Thu, 16 Oct 2025 15:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A0BC4CEF1;
	Thu, 16 Oct 2025 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760630115;
	bh=mUd/cKwzucs5sz4MLIoHp3MJMXcZOqAnIjxG8j8Iy6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNDMTo7AK5kSVF306sECe0SdK8OIZY1DeC5SQzKnfh8vIOZVH6SicOMXWlgWCcwgD
	 VOkoVQSS5KPJankKA92WwI5ULiPm0ondHbrarrDxd1gO6jd3yIcxIcPX7nfiiyV62z
	 3jht84mMTOW49pguSl7/B9m/tykDQowSYRTPFX8y7Grbmsb2G2xXvJ/ZsIq77ut3hU
	 nmZeGfN0zaBAul4IdbhxayFqEErErCvxH6zXT9nT3VysNfD7WH5IbgLXkMWhdiO33X
	 kM3ltWOvaZn4TtEwIYXXKmXLgnk/I6A4CnBp+ffJWL9NY1gzyjkpq1NkoIkojF+uD9
	 5cJ5QdZJVE+LQ==
Date: Thu, 16 Oct 2025 16:55:10 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 03/13] net: airoha: Add
 airoha_ppe_get_num_stats_entries() and
 airoha_ppe_get_num_total_stats_entries()
Message-ID: <aPEVXhTE2_qFz5zz@horms.kernel.org>
References: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
 <20251016-an7583-eth-support-v2-3-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-an7583-eth-support-v2-3-ea6e7e9acbdb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085515_907603_C6392D7E 
X-CRM114-Status: UNSURE (   9.38  )
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

On Thu, Oct 16, 2025 at 12:28:17PM +0200, Lorenzo Bianconi wrote:
> Introduce airoha_ppe_get_num_stats_entries and
> airoha_ppe_get_num_total_stats_entries routines in order to make the
> code more readable controlling if CONFIG_NET_AIROHA_FLOW_STATS is
> enabled or disabled.
> Modify airoha_ppe_foe_get_flow_stats_index routine signature relying on
> airoha_ppe_get_num_total_stats_entries().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


