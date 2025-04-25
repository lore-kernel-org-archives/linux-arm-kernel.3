Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92DEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w/n2hhCwZkNSqAYh0Yx8uPPUzbk+9gJJIu48qyqz8M=; b=j4cr7nQM8q01pNfaJbVyBGyIsh
	Z9nmAJxdSLou1xLtQCCDqOMbmhsz4ccde4Pbu3Aw0EhprOzzvlyBs42x2m27deioJfFqQnSK15wXG
	uIV3O15NeMiyKAU9SlWwgPFxPLmpyoyOjh1ca9m1iyXrGvMJ7eDKEbWSfXjWHGcwzAMmPZL8rgu13
	uCXqV1Y6dQaiitDdckUVANK3T8XYKr03sb6Pqn0kjtTy/Ovmo558SPyVw8YgLD8zLbAlEKM1JUxX5
	0KTNXXW4A5Nm3IrTkSMTGsHRyeTV0it1if3jihIffcosME0f2WQN0kpCQ6xnQRZjXkU8EpkGd0XMK
	BpiD89vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hpt-0000000H47N-1iXg;
	Fri, 25 Apr 2025 12:07:17 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GCr-0000000Giaf-3CrN;
	Fri, 25 Apr 2025 10:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5w/n2hhCwZkNSqAYh0Yx8uPPUzbk+9gJJIu48qyqz8M=;
	t=1745576571; x=1746786171; b=bALT0dHaAD2qTkQ2yvNcj73CqgxhQSn+aPh5NJWr1MAREu3
	+KtOzMJv53Vh3C3skb7OsLzKYOVAm23TkDd83cLB7qHnKPLQf8x+90lMGY7KmvJztti4r+wz4hHWN
	tMuwpzpjKW540ft7F2ApbfiGKNzRIzhidCZSnK7n8oZAODcBd5GbREUHmKLgwWURGH94mxLGrXdx6
	MaCmMxq5pS1MYKw9pcOZkarbYUZqimzEQs8sKq2BAcpB+wREFiFq0Euvhsc1Onm0eYw0ehnI/UhNB
	zQUUzSPMud5fae0p3E4RMkdtG2qItrOvSSC5ttVYnPkTmPtU5sAHY9iXJekg+1Kg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u8GCl-00000001N3X-2DsJ;
	Fri, 25 Apr 2025 12:22:47 +0200
Message-ID: <da41cb80e0acb08fd25c38876a29156b69322249.camel@sipsolutions.net>
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: annotate RCU release
 in attach()
From: Johannes Berg <johannes@sipsolutions.net>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 25 Apr 2025 12:22:46 +0200
In-Reply-To: <20250425102050.GO3042781@horms.kernel.org>
References: <20250423150811.456205-2-johannes@sipsolutions.net>
	 <20250425102050.GO3042781@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_032253_803086_DD4287FC 
X-CRM114-Status: GOOD (  20.76  )
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

On Fri, 2025-04-25 at 11:20 +0100, Simon Horman wrote:
> On Wed, Apr 23, 2025 at 05:08:08PM +0200, Johannes Berg wrote:
> > From: Johannes Berg <johannes.berg@intel.com>
> >=20
> > There are some sparse warnings in wifi, and it seems that
> > it's actually possible to annotate a function pointer with
> > __releases(), making the sparse warnings go away. In a way
> > that also serves as documentation that rcu_read_unlock()
> > must be called in the attach method, so add that annotation.
> >=20
> > Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>

Thanks :) Looks like Jakub already applied it, FWIW.

> Thinking out loud:
>=20
> * Without this patch I see the following, but with this patch I do not.
>=20
>   .../mt7915/mmio.c:636:5: warning: context imbalance in 'mt7915_mmio_wed=
_init' - wrong count at exit
>   .../mt7996/mmio.c:302:5: warning: context imbalance in 'mt7996_mmio_wed=
_init' - wrong count at exit

Right, that's what I was trying to get rid of.

> * The only implementation of this callback I found is mtk_wed_attach
>   which is already annotated as __releases(RCU);

Indeed, but sparse doesn't check that for function pointer
compatibility.

> * The only caller of this callback I could find is mtk_wed_device_attach(=
)
>   which takes rcu_read_unlock(). And the the callback needs to release it
>   to avoid imbalance.
>=20

Right, pretty sure that's all intentional (though I don't understand
it), hence this change to document it a bit better and get rid of the
warnings.

johannes

