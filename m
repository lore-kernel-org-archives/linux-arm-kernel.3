Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C994C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV85aXzZjjVnNwqYktMBTA7s+qiPqgMbSaekctZ/drg=; b=idApFLoevisvwgsGMY36cgkGW8
	+Fk1e/adwCZVMJ5AgyX8t1x06FhPgPoYaAL8b4Z18+lZYmHsTCtt8s/TymJbymTy54ox/MvQYUCEj
	XZhTxsd3vCSxPqy3Ff38tkBv/SQWJml7ZnfT3eBEAySl6KOFQ1uYwN6zAw6LW0VUYTK5lBjO5Iljk
	8reZ6Zek3jTlxLnUC6CD1c8lkwBTfBMsxYF+0XF8QVOxc2eX9LpxH4jn8h9oHCJhEGb/LK1knAeeg
	yLbinMGejAcWfKU9ixNqPK7tgyM6kjQonJeBC1i6At4cO1Z48Pv0eBk012RtrCPj0jNClfVe+LKl3
	Jd0WfIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt0d-00000007gXC-2hoM;
	Mon, 20 Jul 2026 18:46:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt0c-00000007gX3-1um2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 18:46:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B6C960051;
	Mon, 20 Jul 2026 18:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777B21F000E9;
	Mon, 20 Jul 2026 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784573193;
	bh=jV85aXzZjjVnNwqYktMBTA7s+qiPqgMbSaekctZ/drg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=N/NWFSrA88AaQ1EF1EB3CUo1xXTh5k88kac/WL5wdINpSTXnZXLy6P5yGg7GLaUec
	 O6Qp/JuOZmt2pmZqxCK+BhNUDtTEcZwslIx5+rvyjgy0mdGXJZQs9k6Co0FJ5T7RtB
	 9X98rfcwlu4+yYFV5UAp9naXS4new9gj+gwK+3dBprv/2D5DsSxWCIFtV/qruWc2YD
	 s2rcMnXMU0tqSifxO6ebx4VmUs/oJs5oRwH4hb3qx35SRl2IqUNlQ5y3/rNFw3S1J4
	 f93VHPIo+shY3H81pZbsGyZ8VqcZJtc+c0jFuOTYdQq/F50mvzPZNUPNUVdW6fJNmq
	 pjJtrwzjU0amQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org,
 jason@lakedaemon.net, lpieralisi@kernel.org, radu@rendec.net
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kemeng Shi <shikemeng@huaweicloud.com>
Subject: Re: [PATCH v5 0/4] Some Minor fixes and cleanups to irqchip/gic-v3-its
In-Reply-To: <20260720071215.50705-1-shikemeng@huaweicloud.com>
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
Date: Mon, 20 Jul 2026 20:46:30 +0200
Message-ID: <8733xdmrcp.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Jul 20 2026 at 15:12, Kemeng Shi wrote:
>
> Kemeng Shi (4):
>   irqchip/gic-v3-its: Fix memleak in its_probe_one()
>   irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()

Why are you resending already merged patches? You got an email
notification about it, no?

