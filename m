Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54701C83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N5ixXzYqAsxEa59PwExtdaf3MvivnU2rrVqhDnhb4w=; b=GgAw89A6WNYqmRC9bS11NdYMP4
	csDVAO1+NsMuc9fxCsl3ew0+FP3Al0M80HwVsdS4JSEQ4hRp2H9m2/YZPN/KDoInXaGY1+BC/cqG7
	NX69Me2nMqUotOYB68lm0UwrOUTEfWAh+XXbmKZt3KxALLJpddeu74YwoC54l6vuLcy4pXiqzLSg5
	8iNCz5xdOK0B8UcSG9/uzi7Up7oGhmEjHo4UP/HVpuQbT9RYe8dlw65qfhWT5YKgsDv3gxK/yW5ag
	7xmVbbQPd31orZVT9Ak9Kom6G1xkMp9OjnsHAEkbjacNb2Tu/wmTfCvQv2uwqV7ppVKuBRZYps5kw
	5mOkr0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBT-000000061QJ-0svl;
	Tue, 15 Jul 2025 19:19:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiRA-00000005jkq-2kx5;
	Tue, 15 Jul 2025 16:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6N5ixXzYqAsxEa59PwExtdaf3MvivnU2rrVqhDnhb4w=; b=OXgz+WsUaq4+gRqOqnKuH/Wbz6
	Bo6LBXtPMDToszQi/KI8NR7ZMQ4OTfo3Vm1SCrfjsWvYq4NBR2VFHyAtTqQh7bPqEROAU078VBAd7
	fi88CgzqGT4k3QZLNXgDabf6+liSQKfoXytvH8++pUiX8gj+FDaWzsMMcp5yGbap+OEo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubiQx-001bi0-BD; Tue, 15 Jul 2025 18:23:11 +0200
Date: Tue, 15 Jul 2025 18:23:11 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sayantan.nandy@airoha.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: airoha: fix potential use-after-free in
 airoha_npu_get()
Message-ID: <230d2600-bd9b-4144-81c5-b79dcbb42b46@lunn.ch>
References: <20250715143102.3458286-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715143102.3458286-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_092324_692069_B55F13F6 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, Jul 15, 2025 at 07:30:58AM -0700, Alok Tiwari wrote:
> np->name was being used after calling of_node_put(np), which
> releases the node and can lead to a use-after-free bug.
> Previously, of_node_put(np) was called unconditionally after
> of_find_device_by_node(np), which could result in a use-after-free if
> pdev is NULL.
> 
> This patch moves of_node_put(np) after the error check to ensure
> the node is only released after both the error and success cases
> are handled appropriately, preventing potential resource issues.
> 
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

