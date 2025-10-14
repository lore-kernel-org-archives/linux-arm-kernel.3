Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF84CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+J7CGWA+Rn0M9X0tPytaTQdkqtaZ1USzIfewvswO9Ac=; b=nrrTDxQFX4CW6DckTjx8Ac9fw1
	J6NFDWhpUdU4YDBZFfdNVY/nbRLf6hkRjMzqye9o+Rv2SVnjq0RXNkUn/usv3ckMBczdpcun3IeN6
	EHdKqIlUx8VrIDb9eoeRjmsuNEzZ/Wk2hLv7rWfDp1mIXkG+TI7xr5EWlgkHPQiERQmbK31yGCGP+
	Nx91CHbBzuWpkGX+/uZwYXw9/sYI2YKCcLXDdzvEkch2Um9H+KztN9Zm6zQHqu8Nd99BN1eNg/XzV
	8W+mQ0niGScSCHfs+YZyGR/GiWxaHC7i5YzOENYVNDrZTHc6RQmkAtf9qo0NsbgaaoyA5MKGZTsM1
	dclDFLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8kuB-0000000HIP9-1rLl;
	Tue, 14 Oct 2025 19:41:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ku8-0000000HIOq-2y7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 19:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+J7CGWA+Rn0M9X0tPytaTQdkqtaZ1USzIfewvswO9Ac=; b=UkjdMtAWrq/Pyzg9TTmoVY6vWA
	xlVAnfh9JG6yIcEQku5IfrtOtRxgChhBlekd4mzHa6W3ACZNP7ufmRIy+3a03RwaZSF6MOdne/NlZ
	iBooVZq8+eJ8FwOG8AgM/23ynMjhrVw8DWOpZ7F8HLekXOs2ZEPpPqqoFQqb3/5SUzZY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8kty-00Awtc-2U; Tue, 14 Oct 2025 21:41:42 +0200
Date: Tue, 14 Oct 2025 21:41:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, danishanwar@ti.com,
	rogerq@kernel.org, pmohan@couthit.com, basharath@couthit.com,
	afd@ti.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pratheesh@ti.com,
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com,
	rogerq@ti.com, krishna@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v3 1/3] net: ti: icssm-prueth: Adds helper
 functions to configure and maintain FDB
Message-ID: <1e16ab86-ccc1-433a-a482-76d9ba567fb9@lunn.ch>
References: <20251014124018.1596900-1-parvathi@couthit.com>
 <20251014124018.1596900-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014124018.1596900-2-parvathi@couthit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_124152_763403_9A38B16E 
X-CRM114-Status: UNSURE (   9.40  )
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

> +/* 4 bytes */
> +struct fdb_index_tbl_entry_t {
> +	/* Bucket Table index of first Bucket with this MAC address */
> +	u16 bucket_idx;
> +	u16 bucket_entries; /* Number of entries in this bucket */
> +};

Please drop the _t. That is normally used to indicate a type, but this
is actually a struct

> +void icssm_prueth_sw_fdb_tbl_init(struct prueth *prueth)
> +{
> +	struct fdb_tbl *t = prueth->fdb_tbl;
> +
> +	t->index_a = (struct fdb_index_array_t *)((__force const void *)
> +			prueth->mem[V2_1_FDB_TBL_LOC].va +
> +			V2_1_FDB_TBL_OFFSET);

You cast it to a const void * and then a non-const fdb_index_array_t *?


