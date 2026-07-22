Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90959C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIKqOF0CXddp2THXSgq1DAjEmO1R0dy2OSrDEgdTcbs=; b=awPvLHugpbYaoXQgC3DsbpqT/p
	aEHIP6BvBA1APEonHuj06bxP64ay7DFATrrKxvG3vTujxAUuaXvTTh5/+KopdM8BWu//M20kTBhMt
	83la9c9c+guWilA2mxgIU60csXqEc/wF+Nwmo52WCpolZM0gbA7cwiNG/0Pn8IvsmIpTbwFNTLOVu
	YB05PhQzPoLm9cEw42U/C8UlzjCHLdGiYSzO0jPnxBE81RKKyqHmEGmgvzYwOPoJclBflZhwyqwWb
	NWxxHHN70PSLgklVqmuAymeWXVF22+rHWMf+ZpNjT7NQkt9YJUDIY6yo+W1EjTK2HrCctGbPV9ssC
	u0VpnW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWNR-0000000BnVm-0p5p;
	Wed, 22 Jul 2026 12:48:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWNO-0000000BnUz-3Lhv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784724517;
	bh=vIKqOF0CXddp2THXSgq1DAjEmO1R0dy2OSrDEgdTcbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=R9upcpzKFwjE3zypvDbDNyhzISJKXUqpL5pqjiZIt7xyNwYP6KqwEGDnJhZqMYW8L
	 BTYDMLVHSxPVJNyN64VY4wgQMzjFYtBT3Zn48cAvjDjszCI1mZD6FYkndKLxNrHS5N
	 HpfJkpQRxFKox61fswDA0BAry2c3fuytzrfn4lPtnGNowZdtiVC/k6DpBF8VjdNZyj
	 1UyMEw3sq6nKoRQyIqXrfIvLqphPmNcaSmHBhfMZBj9juums+YKqhhMJxHp6ODLEij
	 htlprRN+JSIqPz6q8IuUe/sKpE+MbqC1j7LjZ/EnbqwgYVVMyjtfI721uNC3GnrxDI
	 5ZD9Rh3Edw+Jg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 58590662E1;
	Wed, 22 Jul 2026 20:48:36 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, Kees Cook <kees@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260612190744.172638-1-karthiproffesional@gmail.com>
References: <20260612190744.172638-1-karthiproffesional@gmail.com>
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
Message-Id: <178472451625.1415280.9493751198445442679.b4-ty@b4>
Date: Wed, 22 Jul 2026 22:18:36 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_054843_033404_A6A576BC 
X-CRM114-Status: UNSURE (   7.28  )
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

On Fri, 12 Jun 2026 19:07:43 +0000, Karthikeyan KS wrote:
> put_fifo_with_discard() acts as both producer and consumer on the kfifo:
> it calls kfifo_skip() (advances out) and kfifo_put() (advances in) from
> the IRQ handler without synchronizing with snoop_file_read(), which also
> consumes via kfifo_to_user(). On SMP systems this concurrent access can
> leave (in - out) larger than the ring buffer, so __kfifo_to_user()'s clamp
> to (in - out) is ineffective and kfifo_copy_to_user() can attempt a
> copy_to_user() past the kmalloc-2k backing store:
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


