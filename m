Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B41ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmBk33M4y7xFKP5NO2El21lgRmx7Ak6ZMPGiwj7gGZw=; b=AvNWCxBh4hNikVhDq4BYqEDQFJ
	PxRQj2jYi9mmcKWdUWH/BG6eSQi9bMi0G6VqlCzGSi4dmXFyfah8QKOLp4tb/+BsA229r2+tMiwAk
	kNMxdzGkqPfDgDMt9nKWSaC4470s8GoQvJNDRKXN/YcoMwxqjOrHTiHv9MtHtZuJz5OoHZtgF2GVc
	FWt5bmf/tAG/8QNWqX+uUD0EjtqKBhoQs5EwNrHhsCj8UnUZmojew+GCjG2QrdY8w0gCC/YaK+A77
	8uQ7nhZo+VMRHwxS7tukrqLamrQZaT9fwsT08/oggOChnawNB4gwDYq7q4Gl4C6+aU+iAdpSylbiN
	C6z4C4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eGc-0000000A8Vo-0sps;
	Mon, 22 Sep 2025 10:59:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0eGa-0000000A8Vf-3eZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE997601E3;
	Mon, 22 Sep 2025 10:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7644DC4CEF0;
	Mon, 22 Sep 2025 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758538770;
	bh=o1lDqlMsk1yFq192R+5MhB3fFWbg6PgdL1q31dVJ8go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJHyDnugZam9/507Uer/BvX23Rt/Zp0pHkiESat+GwwtnWps2p1Sjrpudl9DV8NAx
	 S4kku1VpodBdzRdhUrVzMoEsgeFc3HFPmf4mi59eTjMX8gH2LqWV28ZSROcOj+S38D
	 B8TiNfCAA6O0xueTRmuO+ht9Dk/fsoxxZFlDDl2eWVrINFaIQDlso2i9qp+XKtF7Vv
	 igAWDWAEFrWLdaiZH7l+LX+HQt5gmn8WiVKt9UAToaewkq3mXH9eyoUE5mxFxdJFs/
	 pWoiE1gmzCafpQLJXq1sKUJ07+zdq1eU2qmiBD1Vc6JK0SowncgqnInGpMsQZJQRwF
	 F383Vse4cjD3g==
Date: Mon, 22 Sep 2025 11:59:26 +0100
From: Will Deacon <will@kernel.org>
To: Li Qiang <liqiang01@kylinos.cn>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: add unlikely hint to MTE async fault check in
 el0_svc_common
Message-ID: <aNEsDswLSpBkf-5S@willie-the-truck>
References: <20250919033327.1942730-1-liqiang01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919033327.1942730-1-liqiang01@kylinos.cn>
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

On Fri, Sep 19, 2025 at 11:33:27AM +0800, Li Qiang wrote:
> Add unlikely() hint to the _TIF_MTE_ASYNC_FAULT flag check in
> el0_svc_common() since asynchronous MTE faults are expected to be
> rare occurrences during normal system call execution.
> 
> This optimization helps the compiler to improve instruction caching
> and branch prediction for the common case where no asynchronous
> MTE faults are pending, while maintaining correct behavior for
> the exceptional case where such faults need to be handled prior
> to system call execution.
> 
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> ---
>  arch/arm64/kernel/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Does this result in a measurable performance difference?

Will

