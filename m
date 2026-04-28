Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3441BFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg8b3sCp6BWhHu/HDXcHEHppoU3Ox7wcn4P4VdALIfI=; b=HZBrYONfu8tAb8Tp+cDUgDxNxi
	pHZU/IjDiGBCh4JlcWho+Zo8o6gN4WTVBdGp+3qalfwMhESL+IXnbdXr1qlwZ2MCrUNEuDdm6B+2K
	feOs2Riewe7bS8k+NsiBISPNvBusRF35exeul4F9XREhCUaUsYzUQN+n8PZbUXCvuVRRvHUXaqRoF
	XGIQfoTqN6q14wySrI5LMJTR4P3/srgU47daQwk3R3aU9h92tEbrgo6NbRFMAlcg9GizrSl2tqwL/
	wcipwSLxSAO1LemWLWHnc4NzisQxeJOfzbCgt21rGWu+BJIBf1ZDs/YYs+5crG+/YbZE+Qf6Uc4+M
	T9uR18Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWUG-00000000LnM-2DkC;
	Tue, 28 Apr 2026 00:39:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWUE-00000000Lms-0Iqe;
	Tue, 28 Apr 2026 00:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EABD242A3B;
	Tue, 28 Apr 2026 00:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE42C19425;
	Tue, 28 Apr 2026 00:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777336776;
	bh=MAMa6vTtoi7fNc4aPZiXN/+o69qBE5qG/vNxRIzbVq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zw0Gbr87pxsFVokdtBkbeZ9bq68xGjDw+5kvhWpP09imCFPucT1WlCr2qWrXAeFfu
	 8f5XD9YYjZV/mdfmaEAE6bt9LsJgKUKdcEWHk/6tNq0Oa4z5thUX0Nd9v5ccx67wrd
	 kybbxAECg5sKbVhwk727idDuZZn9PzTsDUdUZwkT3cMRe97pm2OzeqY9NR7TGvY0c+
	 CL+inC1bgBylJPVBy+NzYmMerFvXsHD/20rWqxR+TmbkuMTUfLQCHIHprLfD4y/6S8
	 GcCAIdWneunTY5PTNiHg+A4lGWmU+iXClVmFNaZkEdez4lIWHZ5NdyeBjBMioUJAzt
	 G4IO/DdQRUozA==
Date: Mon, 27 Apr 2026 17:39:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
Message-ID: <20260427173935.6a1e36ee@kernel.org>
In-Reply-To: <aezLa2POvT0It5AA@lore-desk>
References: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
	<aezLa2POvT0It5AA@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_173938_133555_368D090C 
X-CRM114-Status: GOOD (  13.77  )
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

On Sat, 25 Apr 2026 16:10:51 +0200 Lorenzo Bianconi wrote:
> - Does the TSO checksum calculation earlier in this function ensure the
>   TCP header is in the linear portion of the SKB?
>   This issue is not related to the current patch. Moreover, can we have a TSO
>   packet where the tcp header is not in the linear area of the skb?

Don't think so.

> - If dma_map_single() fails partway through a multi-fragment packet and
>   triggers this goto error_unmap, will it break the Tx ring contiguity?
>   This issue is not related to the current patch. Moreover, I guess the hw is
>   capable of managing out-of-order descriptors.
> 
> - Is it safe to map fragment data using dma_map_single() instead of
>   skb_frag_dma_map()?
>   This issue is not related to the current patch. I will post a dedicated patch
>   for it.

I don't think it's an issue. Unless you support DMABUF zero-copy 
the skb_frag helper is just for convenience. I wouldn't bother.

