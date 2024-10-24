Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F20D0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP+M+Toi9abevFpevEQ7WlDU8eoWXS+kvczDQCx+IVQ=; b=2rTRnCsJZ771Ut7qWvgUQgljko
	vdK9rfrpIK+TCSLPpfUG+SKc09G5kukaBs6TbquOlOfsQcOVUeitaFFy23x2ZY77jvbZ6qXEPkr0L
	MrOQ8LulO8NF0cALk/mm8q7quhP09sVVPAAgwM9tFgY8OMe7UTUc7+vl9BX1Edzhb2yvDFhZLm4gy
	avtB4FLojEKEZcVEf75DZGRTMLgxbbX683q3a6oNPrYqHhr6l1BmVpQowAm2RBo7l+aZFyo8q91AP
	AhHExFE1d8eVKnBzFWh8fFoqiUJshhmpjGXYwkt8jRxtRb8QFfTwwn6IoJOTv+SqIQ50XW1KRB0KE
	739EoGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sAk-0000000H4a2-13Cg;
	Thu, 24 Oct 2024 07:22:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rxC-0000000H1lt-276A;
	Thu, 24 Oct 2024 07:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE0AB5C5570;
	Thu, 24 Oct 2024 07:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659C3C4CEC7;
	Thu, 24 Oct 2024 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729753696;
	bh=PKc1Ezq4d15KDwftSYsYrCXzavd/TwVvK03GAg5yH8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXDsSjLYy/i5gU8PDLYZ96TpQdUoX/l3LzwwOhNGiQ1i+55LFSBuh0KUoAjION0q1
	 3/eyAr6Zj4/7bU9Gcyj+8Ai+3vS1gTwNeUYvxBUXoUwnGvVSURyPzfUtq7S8GHfSBw
	 CQqZiDGcF6YDPG6noOQlLhky4XPIh7s+ddxatdR4=
Date: Thu, 24 Oct 2024 09:08:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/3] A few minor fw_devlink fixes
Message-ID: <2024102457-manager-counting-ff68@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_000818_609886_F0D9366D 
X-CRM114-Status: GOOD (  11.22  )
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

On Wed, Oct 23, 2024 at 11:13:41PM -0700, Saravana Kannan wrote:
> Probably easiest for Greg to pull in these changes?
> 
> PSA: Do not pull any of these patches into stable kernels. fw_devlink
> had a lot of changes that landed in the last year. It's hard to ensure
> cherry-picks have picked up all the dependencies correctly. If any of
> these really need to get cherry-picked into stable kernels, cc me and
> wait for my explicit Ack.

You can do that with the correct tag in the commit as per the stable
documentation if you really want to :)

But why would these not be able to go backwards?  What changed to
require them now and not be ok for older kernels?

thanks,

greg k-h

