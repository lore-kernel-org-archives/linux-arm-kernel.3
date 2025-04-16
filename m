Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F100C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 03:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvfhS4L9VPLgpQMlZsGnnnvMRtC4Bx+nHRlD/3eukhM=; b=P0rP8MiqlVmL2QpiHhVB59LxXM
	wY0ZFmR4JIAxY+EbHu6MRowMdpURcoP5Xc/lFFzvCYjPu7s3a2jXSoQHvGkmlNdFiiwGfx4wMdlY3
	rL8Gdloe3NP2cfv32geCdbHdLN8yRskGR4aHbxDcEzPY+9nZx7Ac5K3QaTspc6SkhqyGiOzhv8sB7
	KXvNK9N8dNiZD5GwfBchynxo8oIqvpSVUy9uzNY2kMLQpT1BYeCe3ual+NaUkox/BUFOLmmbpCIbl
	gt0Exg7Q6d1SUQXESm2OCvvCuWuZ2Q44NI0PI68OX86elhDLErMWtrcRbfa71vsrSZYfvadso2I4d
	bQPquwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4thU-000000084W4-2T6F;
	Wed, 16 Apr 2025 03:44:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4tfc-000000084AF-4A0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 03:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFF664497D;
	Wed, 16 Apr 2025 03:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B85DC4CEEA;
	Wed, 16 Apr 2025 03:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744774959;
	bh=nBws4V36RnH91dCzptgVsPeT41zfd8Mcsqg5oOphTmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MBVvEAlYhsk3J9rwRldL2+ieUj/bNTseHBxu1+7L3Me3kDQ17RGcYprgU9YHSvXGL
	 5lToJG+oaBS6Nht1qX4i9QUIQUfCi1CWMF1S4cOol8GrXNBwycIR3hguSmXPgIY8/z
	 CsEVLaRu/In1lPNQzpki0+FvVwthusn3MmW5QB4F78Tl/c6kNVAn2Te+bmjyXt841Q
	 nhEnNYjeHkXgNeucnss2P43xdj7lRULMSPMH//6GX8eEFLDqBFsqieOBOK4kPZ3TYU
	 /JjHBJZlVd25Cu67lR2jdKefmJ1e2yvoXqeXp+Uw1ogZRrF0I6/ra3XMgZO4r1GdR6
	 /UvBsgYY/9nBQ==
Date: Tue, 15 Apr 2025 20:42:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250415204238.4e0634f8@kernel.org>
In-Reply-To: <20250411095752.3072696-5-wei.fang@nxp.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
	<20250411095752.3072696-5-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_204241_054793_47FEE963 
X-CRM114-Status: UNSURE (   5.74  )
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

On Fri, 11 Apr 2025 17:57:42 +0800 Wei Fang wrote:
>  	enetc4_pf_netdev_destroy(si);
>  	enetc4_pf_free(pf);
> +	destroy_workqueue(si->workqueue);

I think that you need to flush or cancel the work after unregistering
the netdev but before freeing it? The work may access netdev after its
freed.

