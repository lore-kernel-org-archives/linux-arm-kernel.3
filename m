Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DC606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6A2mCAJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSaHLEWP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MZ8NpIYPnlGXMQOlUfqmQ9hbqT25RKQJ31W0QHbqyC4=; b=K6A2mCAJPUt8iFGaT7QDVT+6EE
	1/qs5xtQscvOMum1B6jjFpO7+qS0PF6nJOnJx1GAIEeSy/nXrl++hZmiQ8sA0tVWgU21tMJjacn5C
	5E/VHTtufbJNBjssr8vhLgMPfpRrfIX+jKkiHNP+8GQj+aaixKBQKd3FE3oSo0I4LhaIzTJGnn8eV
	mkqv17pt+0FasrhjT8YwRPZudpFMxHugr9lsbdtgQb/HPwNNi0gF+Yjc6ojNmzCJjFLArTG4vWwkF
	KhwNPPL+g3aQ6YCQJHQwVGul1sSOX3VYicrZFj40M31jS/0ybl+3OF8a8zMDKWCcwiZcmsQGG9N5u
	pCVn83CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCuR-0000000GBgW-2guK;
	Fri, 23 Oct 2026 10:54:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCuQ-0000000GBgG-2b1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:54:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07ED541F1E;
	Fri, 23 Oct 2026 10:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBCA1F01825;
	Fri, 23 Oct 2026 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792752841;
	bh=MZ8NpIYPnlGXMQOlUfqmQ9hbqT25RKQJ31W0QHbqyC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mSaHLEWPI9H8m0bPTSzjL1qh53dmhcdPOwx60K4UZ2rMjMqoIxTXdT0WLjExSSW4z
	 s9tfW85JTIznEhF18GRfFhrP8TtTnUburywjmV9IzSGkhboGz1+siHMm/0lc2exLgx
	 Q5fOWEBs1kZql/XTMDT3HRmjgK4bES6KbaSvtfKcKwgv10ul7UX5K/hOacF+3U4NME
	 J8rmMM9k8T2is6arL3SKVUsr0Zlv7oTYQa5qgItEhSEhrmfcGtjJxY77EdgGOvBpDT
	 kwUcBB556cbjnoJaaFPepBQgIMf7btxZmtxClKx2etV9wyQ0seg5sNoe7/Ifrbw9uk
	 V39Xd9/A1bdJg==
Date: Fri, 23 Oct 2026 11:53:57 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Jens Emil Schulz =?utf-8?Q?=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: sparx5: fix tx DCB index drift in fdma xmit
Message-ID: <20261023105357.GI708417@horms.kernel.org>
References: <20261021-sparx5-fdma-last-dcb-v2-1-7b8fabdb9239@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-sparx5-fdma-last-dcb-v2-1-7b8fabdb9239@microchip.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 04:04:59PM +0200, Daniel Machon wrote:
> sparx5_fdma_xmit() advances dcb_index before checking that the FDMA is
> done with the DCB, and does not undo the advance when the check fails.
> Before commit f4aa7e361ae2 ("net: sparx5: use FDMA library for adding
> DCB's in the tx path") the next DCB was always the one after last_dcb.
> Since then dcb_index drifts one DCB further away from last_dcb on every
> failed transmit.
> 
> While the ring is full, this drops frames even though completed DCBs
> sit behind dcb_index. After a run of failures, dcb_index can also land
> on last_dcb itself. Re-adding last_dcb loses the frame, because the
> FDMA has already passed the tail of the chain, and that DCB is never
> completed again.
> 
> Fix this by making dcb_index the next DCB to use, and advancing it only
> after the DCB has been added, as the rx path does. dcb_index and
> last_dcb now only move together, so dcb_index always points at the DCB
> after last_dcb.
> 
> The issue was found by an AI code review agent. It was reproduced on a
> sparx5 PCB135 board with a modified kernel that forces 63 consecutive
> transmit failures. Afterwards, about 1 in 64 frames is lost for good.
> With the fix, the same test loses no frames.
> 
> Fixes: f4aa7e361ae2 ("net: sparx5: use FDMA library for adding DCB's in the tx path")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
> Changes in v2:
> - Advance dcb_index only after the DCB has been added, instead of
>   rejecting last_dcb. This fixes the drift itself (AI review).
> - Reword the subject and commit message to match.
> - Link to v1: https://lore.kernel.org/r/20261020-sparx5-fdma-last-dcb-v1-1-fb9a956196dd@microchip.com

Reviewed-by: Simon Horman <horms@kernel.org>


