Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B596EF06E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 05:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SnKV8rhcT2ZNmnJKCkjYW6cLKKaFbPhTH5lMKC71Qg=; b=hMqgd20RFsCK0VA366dmGicQ20
	FLR2ZXcSbG/8eUJadrGa3TCbd0cxAkE8To6TpH7k//X/CgM63lR7AwOXttXVZkYPeVJqVtZQJNt47
	K8Ki6zmtxVmff91v7o/nKS+PBJw7EbchVgitAhojI5YpWIBwnCrBZdewRPhDJOthSLyxuXaPbP7UD
	bCih8GwxYLnn88RZwRcvHjuHwZoz8v7cPQgXJttHosjvWfBs2KeFIRAA6bJ+2Fec+fJHywb5TAIp/
	0kClltI/DzkIrSF597ThEOigD0xyKr3tdEAZw3+PBNG4fgja4dDgMR4aZasIAZvxuqYiBg7IZ5WYl
	8jZsyP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJdB-0000000EqB1-1kqm;
	Mon, 09 Feb 2026 05:16:17 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpJd8-0000000EqAe-3qFa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 05:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770614172;
	bh=4SnKV8rhcT2ZNmnJKCkjYW6cLKKaFbPhTH5lMKC71Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bpEHbih1GKL8CIJ9fFpS11yPIkuEIjzwOyOaEu79fUx1bOiEmVcT0TNuTRHg0DMtG
	 7v5m6mxyUC8T6fOHUkawaISBXOvtEn9eLuby54o7FCjlAr1f/R2civgd0vdggITMnC
	 2YGbs+BsHW6+MLDJIM64I6Vy2u3cfNYDrVVDrWxoWi+uvWRZSglz2D9UTuVXxTWYVZ
	 VLiC06XxYl5m2015lhJ5r4hyA/YMaB5YYNNNyuOE66C4IYF9DAmEbQGrlhvpB+2Wg+
	 0GLayJy5ZjSvtjuv3iX3x4+rHT5b2ho8IpfgtorOuST+1Bk+pXGbodhWS22gHX277S
	 ZNz1GsjrBnAxw==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCF016024E;
	Mon,  9 Feb 2026 13:16:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, Potin Lai <potin.lai.pt@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20260122-soc_aspeed_name_fix-v1-1-33a847f2581c@gmail.com>
References: <20260122-soc_aspeed_name_fix-v1-1-33a847f2581c@gmail.com>
Subject: Re: [PATCH] soc: aspeed: soninfo: mask table entries for accurate
 SoC ID matching
Message-Id: <177061417170.926448.9969681893139297177.b4-ty@codeconstruct.com.au>
Date: Mon, 09 Feb 2026 15:46:11 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_211615_157681_DB8DED6E 
X-CRM114-Status: UNSURE (   8.59  )
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

On Thu, 22 Jan 2026 16:37:56 +0800, Potin Lai wrote:
> The siliconid_to_name function currently masks the input silicon ID with
> 0xff00ffff, but compares it against unmasked table entries. This causes
> matching to fail if the table entries contain non-zero values in the
> bits covered by the mask (bits 16-23).
> 
> Update the logic to apply the 0xff00ffff mask to the table entries
> during comparison. This ensures that only the relevant model and
> revision bits are considered, providing a consistent match across
> different manufacturing batches.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


