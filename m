Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5962C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+FcsRjQ5TosDI3RFuNWgdaM3bBs4wxJVmkcmTsYLMs=; b=BlaB0xcJXrvo8l8b35HdD/6C+X
	+S8NUcUpGW2bFR3QIx6BG6bXo/TjwnH/kILEDwkhWfOPX4TGRmtfhNX6xoYch3iu2oJmhWcqtOTwU
	IxJSSrWtQCUErXKNcmLG82YNH/OyOE/iIHJ/GfH+pm1ZO65E8ZNgUjAW6PjgqYE9zuQQPueVVvol8
	FG1calWeww3S4yWDw/asLMqC10+0JBZRvdmGD0nvHMDR702wvT7nfCO+m8xJJ+C2TBYYQOROOhfLi
	TQOmuAZjp6kyicqLDp7ckt9JqL8CHQSXKTPNT0Ew9T8QeowonILQusIvXcgtZ3E90SrxoRVW3Bjzt
	5eXzPj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2l9-00000005go5-148U;
	Tue, 25 Mar 2025 11:47:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2f9-00000005fZW-1M4M;
	Tue, 25 Mar 2025 11:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57B2BA4A65D;
	Tue, 25 Mar 2025 11:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078DFC4CEE4;
	Tue, 25 Mar 2025 11:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742902902;
	bh=zUelcqDDriz9SHJ6HG975vlFXTHLgPVDZutVhZothAA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UjIcrAY75aMFN3vXVfik+OFX0Uy5JnrBVRd5fjFX94lL3SFrNbHkKgQcaIA2VC/uF
	 c2d7+SrvjPHqi3AbZvmgxIvY1UxRQw1jAJGd9d3ejma7XAkMJ9jHVUr0VdOT7lBd3B
	 7FPhJeSfb/hWEt/mJCtOzTE4a5iZPKQyCm1dsixrg+kYQkSNd82p/JF1V6m1cUw/ZC
	 Lcg/MJdd6r8tQjuNkSp6keZMt6LC86vUeKhTm2Ohaw2PdtTPuxtGB0ImPQpkjXtbmf
	 H5elHwkT2m/vYSAJ7IqPJXyDiyrnd51xugQZFl94GUFuKOXJFsN97DLbXN66xX352G
	 iZxetGKtfiGvQ==
Date: Tue, 25 Mar 2025 04:41:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Russell King <linux@armlinux.org.uk>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Masahisa Kojima
 <kojima.masahisa@socionext.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "K.
 Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Siddharth
 Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, Michal Kubiak
 <michal.kubiak@intel.com>
Subject: Re: [PATCH net-next v2 4/7] net: octeontx2: Add metadata support
 for xdp mode
Message-ID: <20250325044126.1c0f9b83@kernel.org>
In-Reply-To: <20250318-mvneta-xdp-meta-v2-4-b6075778f61f@kernel.org>
References: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
	<20250318-mvneta-xdp-meta-v2-4-b6075778f61f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_044143_426358_01CD0F96 
X-CRM114-Status: UNSURE (   8.15  )
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

On Tue, 18 Mar 2025 12:46:08 +0100 Lorenzo Bianconi wrote:
> @@ -1514,13 +1518,14 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
>  
>  	hard_start = (unsigned char *)phys_to_virt(pa);
>  	xdp_prepare_buff(&xdp, hard_start, OTX2_HEAD_ROOM,
> -			 cqe->sg.seg_size, false);
> +			 cqe->sg.seg_size, true);
>  
>  	act = bpf_prog_run_xdp(prog, &xdp);
>  
>  handle_xdp_verdict:
>  	switch (act) {
>  	case XDP_PASS:
> +		*metasize = xdp.data - xdp.data_meta;
>  		break;
>  	case XDP_TX:
>  		qidx += pfvf->hw.tx_queues;

This one handles ABORT and invalid return codes as PASS not DROP.
That should probably be fixed separately?

