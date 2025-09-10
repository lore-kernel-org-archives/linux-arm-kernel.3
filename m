Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F3DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g9SqMhLUUY5OWEkbJI62B9o1oK6Cw9puvU0A/SCA4o=; b=zbMbjDt2HKvcRi1wGiNfns+HKl
	TtQIHadoJEn8Sw2gIysBMnlPREilNNvWb2OGfSxGz3AvkUK1fOJyGt+uraBr1rRMWa8HWeA3+0tRV
	zjmtRKR22DmlROAL5r6rqX8L7Va0tpdNdzEyjy1muontCAAjrC/xgkVBE4LaCibbYoUsJbvQVPItb
	SOJAmHrUcX3aNAxm8x9YJJPcrMAeEGwT8iJ6Cbsx8RtGlPUL8X1GsgKzPruuCAlM0zOIMkKOpXyJz
	R62VdjCCgo2SnK4RTM2Qf3Kemn5j8xu7/ZCknQ+0PaLhNbK/JnS91kfSdoqIFHG/5VErIWx2T0qN+
	cdVExUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIHf-0000000Da2E-0s6v;
	Wed, 10 Sep 2025 10:42:39 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIHc-0000000Da09-2YCi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 10:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1757500940;
	bh=2g9SqMhLUUY5OWEkbJI62B9o1oK6Cw9puvU0A/SCA4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKcOtrWeRpFVvSeF5GCNO133+5B6ZvqaXNXzV45vA3lJvkzVtzFWbiWnBOx/AezUZ
	 kMIyisSIVdUV0F9VZd6S67kmAx80S1MS+KqDzlYF4m9ffw9tfsvqdJiJN4J6aJUgqU
	 L2qBiOjvH1drJje0rA5tTn5QaYJ6SETm0WwqSVw0=
Received: from localhost ([112.94.75.165])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id A929FED7; Wed, 10 Sep 2025 18:42:18 +0800
X-QQ-mid: xmsmtpt1757500938tef4mg7kx
Message-ID: <tencent_7731B6630F8BF7EC0292D2F3ADAEA6F70207@qq.com>
X-QQ-XMAILINFO: OGZxhFXqN7PJ0OGUSKzaot3PkSIPfgVcLkJCNRpHiuJ/wDe1agEPYkkDgLl2Hi
	 VOLH3oLeXitQpuBvQSjVDLTenk7gOXKMWl5lIUdIurYWrfPcJfqoxIlMbwDa0NCVvD/fpfwctQ4W
	 dlK9X4VxXrG7MZypC2CsplwMvnT0QSoTIRbDK/PMKORm4o/XfhIUQzRmmgh1p6zV9KMUBUDDlxxe
	 7QiAGhORxfs6JdFSuF1CK/yMvtm3LKEeWHFAOkrOtx+/pQlaQ1KvAkMrnnQ0kofZ+7DM+METOhsF
	 J0A1iiFDrnSTAK6HqAfofrs00ucqqsMDGFwHyxDy58hE0EC4s2DjhkNvLFOWC+i7EVgr5krq/Xsw
	 jkbCVMlOSlPDeoU/ld01iXgQz+A8thbNZNMkJUeN4HQpFsLa2AMOet7cnlAmmr+EIFlGZseu13OX
	 p3EX36p5+2qlaV2ZSSqSjj5lxzQRmefkqiQTjai6y80FGFidMEQsOnwil/dqtAoA5lg9Btk/mgSr
	 IzLe9cdt2rPWbMaB36jw75vSDnopXHJTlmmyAHKei+sQgpdV/E/ZCvWG+stiNU5e0h+6EmsXn23S
	 xl6rZr63f7g/xOceAsyUYfcnG/qW7YR3qcT0dqdHS+BK5ZWJGOmKG+wa+RTDypNQrsjutbM3DC0v
	 CIZi00R9lMW3QWiloZRV1r5MM3JkInK9GunpWu+qwMnHMsb/tBCqS+3U9IfWSMMROzRHWEJPdYLX
	 gsj0D3vQ4jaYVaAUGpvKNwl9rW8zP3F30rm6CoHC06oNSDol+pZKrCf7gAu+8LCzZ03K+GrXoHk5
	 uFcVtNUdpTenn9iFEjhgpP9nvOTWOHyNxxeqjTDhgqaR0V+sMwduna4mUAeKmLzyfwCX1SLkZ98Y
	 jwyV3LptUlbJY901E7btNys4ibMQqCqYb0x42NGAwncT97apaNR8dB5BltdiakC2+Ks5Em5Siobs
	 Fr7wWd2LPZgHgdvQMwvFosqJk5CsFqEnf+SEGw9lEVTd8xbCkqnC5GHvpJ+CgYdSTNCuzSJsRerA
	 cL9uGeROqA7nvG09ZHTetWJgw1ONKke/Z2AYJAxw==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Date: Wed, 10 Sep 2025 18:42:18 +0800
From: Conley Lee <conleylee@foxmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: vkoul@kernel.org, davem@davemloft.net, wens@csie.org,
	mripard@kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
X-OQ-MSGID: <20250910104218.GA1760035@ubuntu-server>
References: <20250904072446.5563130d@kernel.org>
 <tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
 <20250908132615.6a2507ed@kernel.org>
 <tencent_0DDFF70B944AC1B7CE9AC20A22D8DA3C4609@qq.com>
 <20250909181547.0782840f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909181547.0782840f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_034237_143477_1CF0E7D0 
X-CRM114-Status: GOOD (  17.81  )
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

On 09/09/25 at 06:15下午, Jakub Kicinski wrote:
> Date: Tue, 9 Sep 2025 18:15:47 -0700
> From: Jakub Kicinski <kuba@kernel.org>
> To: 李克斯 <conleylee@foxmail.com>
> Cc: vkoul@kernel.org, davem@davemloft.net, wens@csie.org,
>  mripard@kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
>  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
> 
> On Tue, 9 Sep 2025 14:36:42 +0800 李克斯 wrote:
> > Thank you for the suggestion. I've reviewed the documentation, and
> > setting the reuse flag while reusing descriptors might be a good
> > optimization. I'll make the changes and run some tests. If everything
> > works well, I'll submit a new patch.
> 
> To be clear if you're saying the driver is buggy and can crash right
> now we need to fix it first and then optimize it later, as separate
> commits. So that LTS kernels can backport the fix.
> 
> The questions I'm asking are because I don't understand whether the
> upstream kernel is buggy and how exactly..

After carefully reviewing the documentation and how other drivers use
dmaengine, I think that if the reuse flag is not set for the descriptor,
manual release is unnecessary. Therefore, the current driver implementation
does not contain a bug. This fix patch was a mistake.

Thank you for your thorough review.


