Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E901C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f075M+FkaXFq6FQ+b283d+9CbB/IXNjPn2ZG7KSa2oM=; b=BG/Dw1uNGHOynK5Lxbu127BiON
	PCDaz92i+DlinMYK21HTgD0HbfS2jQEFvMf67XsM3EGFKuDRzxwPh7MTjsJm9W8wBOM/8V+pUoqhD
	kIg0+5LKpUaJ16HKEppnWUKYaUrUBHg2Wr2f5837+l9vtTES1vyO/dev5EIgnVMBLo4JIOHUR3tti
	vt4tfcKocqW65ofuVfWqwhUsA++qHwcbqyVb411LRLnqDQneX/6T77Q8Pgyj850RJLCl5IpTrbQzM
	MEHIgwIYakjIEjRNxJiy6g3TyCQY53KNxbbxC6FIQirMGPJwy+UukqoYbRtZ5OddzLyYb2HBaSqtw
	NAQxG0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IfJ-00000007aiJ-0POG;
	Wed, 23 Sep 2026 08:49:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IfH-00000007ai4-37kK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:49:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F42243575;
	Wed, 23 Sep 2026 08:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB811F00893;
	Wed, 23 Sep 2026 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153359;
	bh=f075M+FkaXFq6FQ+b283d+9CbB/IXNjPn2ZG7KSa2oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WVX9AkCHPtjL3cwKw6FP2SHlHp4k5uJL4DgzLsjaEIeku0zwp/COqWxMlvsIv7QeY
	 caIySluKoyNWvQUjY+Ur0uOs5MKCKAKCQwyIlHlrMu7IHTSGgPgdvQ3T/dE98Vyv7k
	 Yo7ULe8T55fqc/0GFtxZdY3OQvB3SFYPg6C19Do6PiaBfPB4hKCPeNOIgafTZLjfQL
	 4XFPYOy32Zijyos1O9dNvVHUOdbgCnKb9WR7+TOwEXkrQ3E+4n19+ZEpXk1eZc0Avj
	 AOnhA5I+tJLZY+EAy/bwfEiK7wC8zmWh06TpsTejkZPd5ciG4zB8ol0bNcrXFu6zD4
	 5Ep9Jojg9h7sQ==
Date: Wed, 23 Sep 2026 09:48:42 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 01/14] MAINTAINERS: add FDMA library to
 Sparx5 SoC entry
Message-ID: <20260923084842.GJ13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-1-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-1-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:53PM +0200, Daniel Machon wrote:
> The FDMA library under drivers/net/ethernet/microchip/fdma/ is shared by
> the lan966x, sparx5 and lan969x drivers, but is not covered by an entry
> in the MAINTAINERS file. A subsequent patch will add new files to the
> FDMA library, so let's make sure it's covered.
> 
> Add drivers/net/ethernet/microchip/fdma/ to the Sparx5 SoC entry, since
> I am already listed there.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


