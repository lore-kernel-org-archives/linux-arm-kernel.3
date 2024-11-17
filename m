Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC3D6DDC4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 12:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp2Q+8b3zGUBih3afpuzhAn88G4uKrpXKwQ9ivMWqHM=; b=U0N51qq8qyrhua20VLW9z/N8UP
	hb6qdV54nL6tLpIMjwfJzlct6P5kWmIDYqAEGqc6fZTDhROz/KY2DAwFhKLJ2hi8QZDMTWOv4s8jn
	pb54qcPrJWf5hutyD9t3TziV45vbQKuWCoJ5IpuEBjILI3ehiMWONaSTbY9ftleqYxdIuxTJJICdI
	8muf8infrwQff1jhF0a1k5croaYiJoOZtPzrf5iJE2VsZUa8ehG/fR1O5jg0YgZlztpQIahw+jXb7
	P84BOS+Vf+ZUhYmdcmjEl7Zyu7t19oThRxLIegopa5gl9WSH4HgY1xFl4IvVLIrooAxGRDAumWqC9
	zSFsOKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCeMD-00000007Ipj-2hJq;
	Sun, 17 Nov 2024 12:26:25 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCeLG-00000007ISA-1LNV;
	Sun, 17 Nov 2024 12:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846322;
	bh=tp2Q+8b3zGUBih3afpuzhAn88G4uKrpXKwQ9ivMWqHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mTU1+u6copmZDAjfqnXWv+2ujIPjQ3JtoGu9so550WGMXDTKHgPRUtKWL5WTQKacA
	 ukYIXyZnvXaIaM7phYyg2ffevuNcZwkVM+fGzA0yJe4hA6ivVJfsyMN2k5es56Dca2
	 xnyEpYxwi2vRkSTSXt4SDnE54vHeCtrhpgtS0p+MhXC1a/iPqUZ6noNUE4xD/tX6x3
	 9xyLmagErBzssEeKDZj2zkr4owFCFT2YctuTq6qJ9KGCJplX90TRwhVHol5EujIAFV
	 JLHuHIFQhKPYuj26daIFU9Gqj0sP+YYyQFfmqJ5wJevMLVh4tXn5ub20TQGEUboHP9
	 4WeeB6bi4EbDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhp5Zp2z4xf5;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-mm@kvack.org, maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, Sanyog Kale <sanyog.r.kale@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.
 net, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173184539760.890800.14513086226459117952.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_042526_519102_9AA81BCC 
X-CRM114-Status: UNSURE (   7.08  )
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

On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied to powerpc/next.

[11/35] powerpc/ps3: Reorganize kerneldoc parameter names
        https://git.kernel.org/powerpc/c/276e036e5844116e563fa90f676c625bb742cc57

cheers

