Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76899C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZ3E+5souZzEPiYJbVzmQCUTfZvvmbhYWDHQXsHNWFw=; b=hej3gFER+FlFxUL5Fd/kcIbAG1
	KzAFkt4kVCl59SrwCJsZQuR0QXaNbx5N/VsEgBdcm1uY7lbR64t1gUd3s9HzxXCzOz2gUDG1wSeS0
	kl/2OAIepf8tzU6GFNxa/t5vOzFP4Mrvou1vKMpx6Y4p4PiimZNxm16QhxgfZWqoXLjBrnq09j1Q5
	P9q6UPwdaGWGZMbw17eqHgsjmRQrSO3T4xfRMxV7owiv5H9ghF7GySRgBImejl6FChSmnQ5+WP7tX
	MvsCsUCfc34SUR1YNmgo+Fr1SY6K+UbZPLxdy64DhU8GPgFjHzvqWGtfH3m7L2zZPAOwSsLsmyXY1
	PRmCCDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0l9-0000000DHtr-11l1;
	Thu, 10 Jul 2025 23:32:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZy6D-0000000Cy3n-1a98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 20:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54D3C60051;
	Thu, 10 Jul 2025 20:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1EC4CEE3;
	Thu, 10 Jul 2025 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752180151;
	bh=BpIBt7eblRXITiqTHVrVf1FbQ5odVkzWjqspIqG0ueA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckmPXk/DBZJ+DmlX/iLC83i64AisYBuNzUN5NyBK6Torw2sewABKTz9+EasOwkJf1
	 wCrCX8uuyd2EC+2CHW4Nycitegtj7ffSe3JVjfsBnHTccoPgKSmjXCrW1OyDWI6iPy
	 23uTX7yB2uitsfKsgpVn65ZD/lzuyn1sWptqIL6IPtirLkU+iAexRGzHWaVFSZUrav
	 mH4YAp5WN29YGdTDag1qpl9b6mHJmOaPnG4oVO8dPn7YyVLrexSwxhIo0p9rRysQrL
	 BtTaDintTWpA9s1ejOt8/CDqkfLUQuyMo7Qy1aFJY+UNjcAbrNmSSPpw5V1FBJ8IWc
	 8cg3QkSxuJGmQ==
Date: Thu, 10 Jul 2025 22:42:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709042347.550993-1-rongqianfeng@vivo.com>
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

Hi Qianfeng,

On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The 'Suggested-by' tag implies that the patch was suggested by
Jonathan, which is not the case here. Jonathan reviewed the patch
and proposed improvements, but the patch itself comes from you.

For this reason, I will remove the 'Suggested-by' tag. If
Jonathan wants to add his Acked-by or Reviewed-by, I will gladly
include it.

Thanks, Jonathan, for the helpful reviews, and thanks to Qianfeng
for promptly following up on the feedback.

Merged to i2c/i2c-host.

Thanks,
Andi

