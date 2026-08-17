Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A3C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjHlsmYEYzijKqgNs4Mx5SPcKYbT3PPdor0Bf0avHyQ=; b=yeAeqCTo/t4ZGD0xl8hlCqpPAs
	7l42E4+ikE+/BcG+6/cAOWj/Qy1QesjK+wuLf1OVRiSicUAKDNOJkEunITg/S29iGxR1EudwrOCQI
	BVSNc2be4SH27FNRzmmzbVzjs7whwGOYXU2Bg5fY98nErIwKd9YJgcO9M2+0d2PoEd8RJNj3Zumb2
	cw5mR7AJtg2boHjAIwc1C4J5uVu4p7baishPzu5cH5cP3OCX/IGzAkUbK2o9CUA9Eh8bZUH8PB6Bz
	ABkKdjtFhSvDtQhVJjBxCu+aotar9f0ug8JjynujMFCe9qXVS3sBDSMd/GLIYu4dmGj1jqinSxIM/
	FbMUmg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvc0-0000000629j-2xTT;
	Mon, 17 Aug 2026 11:34:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvbz-0000000629S-2KrP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:34:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E226601E0;
	Mon, 17 Aug 2026 11:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201CD1F00A3A;
	Mon, 17 Aug 2026 11:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966478;
	bh=FjHlsmYEYzijKqgNs4Mx5SPcKYbT3PPdor0Bf0avHyQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Cnp3ospn5OkaQDkq5Itjxg8hE1vg3hKPqo3W1GsUtdWTAuWaglKlTfpS7mmzKn/RE
	 5L9LOcJFa5CKuT15jpEpNj7kWcSxhQ1OsCJuYGZFC5lmR5eosXS9tLP2Jn7lqiMFLs
	 453H6l686fx70UqrrPHtC9+BfnpTSws3cdb3olIZv5K0CRAKB6AYIHBcrMiVFelfYF
	 TyN88E+2IML5T0Mh+5enCkekscNd2AOX+GhmXU2IoQ3uRiMy9u67+tnCaFzc+W1kkm
	 oZ2xgOvlp7FHZmmLN1WdzPUbIqM/icgNPOTA4/H5yVtQ84DiIKga1pRz2u0OYXCcXY
	 CLWfYteKQ4ClA==
Message-ID: <c4047dcc-c0d4-4b53-aa89-a126d81445e0@kernel.org>
Date: Mon, 17 Aug 2026 14:34:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i2c: pnx: fix device_node refcount leak in
 i2c_pnx_probe()/i2c_pnx_remove()
To: Liu Zhenlong <dragonliu2018@gmail.com>, andi.shyti@kernel.org,
 chris.packham@alliedtelesis.co.nz, jochen@scram.de, maddy@linux.ibm.com,
 piotr.wojtaszczyk@timesys.com
Cc: mpe@ellerman.id.uk, npiggin@gmail.com, chleroy@kernel.org,
 grant.likely@secretlab.ca, neelegup@linux.vnet.ibm.com,
 benh@kernel.crashing.org, wsa@kernel.org, stigge@antcom.de,
 linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
 <20260815181204.2321-6-dragonliu2018@gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20260815181204.2321-6-dragonliu2018@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/15/26 21:12, Liu Zhenlong wrote:
> i2c_pnx_probe() calls of_node_get() to take an extra reference on the
> platform device's of_node when assigning it to the adapter device, but
> none of the probe error paths nor i2c_pnx_remove() drops it.
> 
> device_release() does not call of_node_put() and i2c_adapter_dev_release()
> only completes a struct, so the extra reference is never released, leaking
> the device_node on every probe failure and every adapter removal.
> 
> Add the matching of_node_put() to all probe error paths (the three early
> return paths before clk_prepare_enable(), and the out_clock label which
> covers the wait_reset(), platform_get_irq(), devm_request_irq() and
> i2c_add_numbered_adapter() failure paths; dev is devm_kzalloc'ed so
> adapter.dev.of_node is NULL and of_node_put() is a no-op when CONFIG_OF
> is not set) and to i2c_pnx_remove().
> 
> In i2c_pnx_remove(), i2c_del_adapter() clears adap->dev with memset()
> at the end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
> removal")), which zeroes adap->dev.of_node before of_node_put() runs.
> Cache the pointer before calling i2c_del_adapter(), the same approach
> used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
> ("mtd: core: Fix refcount error in del_mtd_device()")).
> 
> Compile-tested with gcc on arm64 defconfig using COMPILE_TEST; no
> hardware available for runtime testing.
> 
> Fixes: b41a216dafe4 ("i2c: Add device tree support to i2c-pnx.c")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>

Reviewed-by: Vladimir Zapolskiy <vz@kernel.org>

-- 
Best wishes,
Vladimir

