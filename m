Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B61DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaS8l847UngA2FOp5KsZtRuIyVlfPyrLMCLxIIpL5CA=; b=Ht0uJWebRnGX9xD1ks6AVoskzc
	RE3bUIVo9bBZG9ls5jNEI8B+FSvPeIRfmqnp6l8B8WerWmI8Wo5QNzg4MReRtowOaJhcETdtVCrNc
	/7UGENGtTdpJn+coU9xWrDy5xNMA0EUv2hXvTVbpqDVwepnLIyvq9Qe4Q2hig5n2IG39goH3J2EaW
	Wchvh41nJKsvm4SUzB/45PFa9AQZwyzr3dZ78RTToXtBXQypZMnazXacdqRsBJ4oP6+DrnzIUxZkv
	5P7ILe2pR9ijnlq9l6WOY0mgNeORhCUjQtfkTAnI3AlkBQry+Gmhnhdy4jPmRhQDxdBJS9l2Q2oPc
	LSYflEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NjN-00000007uwu-3uQ8;
	Sun, 21 Sep 2025 17:20:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NjL-00000007uwJ-1Fsj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97BF24156D;
	Sun, 21 Sep 2025 17:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DFAC4CEE7;
	Sun, 21 Sep 2025 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758475206;
	bh=nZFmlP/P0juGPtOeZk5oTehlfMx9ii7tpf1fA/FVz1s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lyjmj1GLsZgcmTM/xErQpkAWiJsfqG74gTDr58NQ3iRoeTaRrrJm3x1fqe5xyzp4s
	 7uCBE1j4SHEYaWLo2nnhMFvuDKfEFWr/vGAL/wOeFA63LqBy6rO/HDNc0Y8vrTXuK9
	 eGcHTReOSVkA0DqwkFeEm8am/HXXAyY6OvdBcV/7xSPBeAux9q2fN/EndSWhICrp5N
	 Oa8xXMiWFxYE0tXINsU8Fsi4brW/QEcc/fA33rkfD9D9PIe1GW3yyjQsh0epUySM5x
	 yhPWSL8OwAUEgVHdK+q59NgKowEoFIyWNwYo6M0Mr36LdUD74DAgvQVpf/oFdSqPBg
	 Cva0Y3s7JvAlg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250814035317.4112336-2-wenst@chromium.org>
References: <20250814035317.4112336-1-wenst@chromium.org> <20250814035317.4112336-2-wenst@chromium.org>
Subject: Re: [PATCH v2 2/2] clk: Use hashtable for global clk lookups
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 21 Sep 2025 10:20:04 -0700
Message-ID: <175847520494.4354.5422042536281886650@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_102007_358097_A7566F6A 
X-CRM114-Status: GOOD (  14.84  )
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

Quoting Chen-Yu Tsai (2025-08-13 20:53:16)
> A clk lookup using clk_core_lookup() is currently somewhat expensive
> since it has to walk the whole clk tree to find a match. This is
> extremely bad in the clk_core_init() function where it is used to look
> for clk name conflicts, which is always the worst case of walking the
> whole tree. Moreover, the number of clks checked increases as more
> clks are registered, causing each subsequent clk registration becoming
> slower.
>=20
> Add a hashtable for doing clk lookups to replace the tree walk method.
> On arm64 this increases kernel memory usage by 4 KB for the hashtable,
> and 16 bytes (2 pointers) for |struct hlist_node| in each clk. On a
> platform with around 800 clks, this reduces the time spent in
> clk_core_lookup() significantly:
>=20
>           |      PID 0      |     kworker     |
>           | before |  after | before |  after |
>     -------------------------------------------

Applied to clk-next

Can you send a followup that adds a unit test for clk_core_lookup()? We
don't want __clk_lookup() to continue being used, so maybe we can add a
test only exported function like clk_hw_lookup() that uses
clk_core_lookup() underneath while grabbing the prepare lock. It can
make sure a registered clk_hw is found and a non-registered name isn't
found and assert that the not yet registered name isn't found.

