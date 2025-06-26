Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25155C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGJfnFa/Vq6txVzQN3Jod8Bh/axuRRv3ukpWPkLWS9Q=; b=rjGScUH+ZYqwmc6h/GElntzr5S
	prUS/6JSiNMy4aksBlpHiZLF9Jo6ppu6PMctiMhXXYRhouudW9yEmtSZ3V4vC93LU/pPuUgqWGoAP
	/RJ+Tlbvuv9HSSiWliF4Jd8JFdUyZK0/qFYno9F4x7DbVsyvVRTt8pe93jv/tLmAK8u6SnIAdpBQI
	Q5OU9QU7uPB2fTyxSgAqcFNGSmYUM7YppoMr8WX1iwwsqgvtiblhG3gwM2R2/T8loja1G2tUd4DkL
	WLu4MWME4d5H+MkGkEtZT523CVQJrlK9Bz4V7Md/DRN5cBgOBHhGTawKVcuajQab4i/Q8tuZjr8JB
	IzphYmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvcu-0000000D0ih-48TH;
	Thu, 26 Jun 2025 23:03:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtcy-0000000CmpY-0Yu3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DFC05C555A;
	Thu, 26 Jun 2025 20:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2BDC4CEEB;
	Thu, 26 Jun 2025 20:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971323;
	bh=hLlzonJAvNms9VG34BSVk9UF0cfYYAcLzKIDWMr15GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBjC28nNB+FQqzQqdq3y1XK41BqrcL25ES1u4oYjPVI7GTgB9BhF3Lq7KWZLOwt4g
	 TqCtGs3icQjmKKYk5VxgNmY1X+W34f4Jx4x96dB2ZDdP2dlMkRyLH6jfy0ZSdzTQh2
	 pjZGkdA5yul1P5FHh2b21af1hqz5fZRb21TaMnq8+g3cmsR9ehUpoJZS4V8k2rl5gO
	 IJ2JQEvx2gOni2azjZVh+zrdSpxC3yNGiI79jCtlpD4aEhL7QX1ItVkcXOSH1GIpFD
	 HxjYYOXV67WTcpQtf5+h9s/JPGDUOQwc/56IAhn0KKcr5YY3eca40aIOS01WLkhlsS
	 rX8eBRwoyqqzw==
Date: Thu, 26 Jun 2025 22:55:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: long.yunjian@zte.com.cn
Cc: pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, 
	ouyang.maochun@zte.com.cn, fang.yumeng@zte.com.cn
Subject: Re: PATCH] i2c: stm32f7: Use str_on_off() helper
Message-ID: <tfj32n5ex5ss4lj52oglc6rnj5bvwxhgabcc5xe4w2nreehgsv@j2dh3bcsov5q>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_135524_214674_EA1F8D01 
X-CRM114-Status: UNSURE (   6.44  )
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

Hi Yumeng,

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

merged to i2c/i2c-host.

Thanks,
Andi

