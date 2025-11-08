Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65957CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VDEmqKvR+2+vB5u84GfGQoTfC3cnTXVPN+Vsjz3UEY=; b=WIFhgWEx4FCCjWbRMD5aMR6iOj
	5Usq/64z1Vwzg0eVwgfV3jAYh8GOOnGC+aXOzQ9vjAGax2cTrfKb5v1ogf7NW7uNayBdtQHdyj4Tm
	f1D99/KQmcT2K3hfaJFgvc3fAG03f7k5BWJ802O+EyviauLM65/9vABUCtg7n7llBsN2GGGUmLQUm
	CC6bR2wEvrpEHy2CG28SXmnUoTtFUGrK/CN6URxuo/bkcb8dNwouFTeAypOeyMq23FRWpDrPbi+dS
	ngAHzw27nyCqf8c0Fw+XPQgyIaZR2mgtqPkab4gCwcUZu6QYEriw6AaTcxVLKUdHdhXEB1D3S88zY
	ah+fqaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLd-00000003TVt-3q4U;
	Sat, 08 Nov 2025 21:19:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLZ-00000003TUA-1SoR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 151EB40A2F;
	Sat,  8 Nov 2025 21:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4FAC19425;
	Sat,  8 Nov 2025 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636784;
	bh=xwtOyHhUhjUtQS7W2RceLVNraeqZaBqVnVbwNj4o/gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDwjdXqW0uk/R0DFhRACQsFtHW0y3oSYLsNQHzoGf1orkq4mnD/KyY0VJomMupty5
	 YWUee0OgHX52VlLjsvdEYraS3mIWBfF65tsAGW4RTGlal90d2kRrKXFasl+X2LTRZH
	 V6renckqVcGJjpzjOiLfleGCCs9NSTmjF4Ll+7RL36P8W7GLCQCU08KGy/17jjiMgn
	 0R/4HkNk6n1sfQJ7BOmyoS/dAs/qX/7cBCB+584k/YPXc9QcZcI7uqMHIzbpuSNrlZ
	 kDzC6B/sQdvvqFTQna066tewF1w7xvmGJIQn38Gl8y4tk82KFDvW1W0wQ0y+y2GeyN
	 XTTbY446yDa4g==
Date: Sat, 8 Nov 2025 22:15:20 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] scripts/make_fit: Support an initial ramdisk
Message-ID: <aQ-y6CCg06lg39oq@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-3-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-3-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131945_405896_F0C8E108 
X-CRM114-Status: GOOD (  14.36  )
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

On Mon, Oct 06, 2025 at 05:01:53PM -0600, Simon Glass wrote:
> FIT (Flat Image Tree) allows a ramdisk to be included in each
> configuration. Add support for this to the script.
> 
> This feature is not available via 'make image.fit' since the ramdisk
> likely needs to be built separately anyway, e.g. using modules from
> the kernel build. A later patch in this series provides support for
> doing that.
> 
> Note that the uncompressed size is not correct when a ramdisk is use,

I think something is missing: "is in use" or "is used"?

> since it is too expensive to decompress the ramdisk.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

