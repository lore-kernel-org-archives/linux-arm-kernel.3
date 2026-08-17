Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67174C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy5aeHD8d+Jx1qMGwwl5D/7Bi3rGEWzbwGp1Tk7bSPw=; b=XXop5Zw9L7HaQsVncqrvIl9yBl
	30gPRJMb7+IzgOAljR2rK+H07j20Exm0hC295Ok43YSYj8btXOBxL0uD/N0I/ZnHUHCQ/4s5Td4/E
	JRFQ/h3fkK1FhkEhk0A0i+1pCiRoCX/nCMPqgk/DT74YXHZMDG3Gy5O43QYDCGZSZEYbsRHyTgeEO
	tpldGuORYQKh6hTu8CGThY1iWkS0f6dfjS+rrtPhQVXB7XdgnvgE6oBol1XlAkJaH4ylDt+4PIW9n
	v0Gag0X1XsroIW4dQZgDpmUq1g/40nu/cesAfwIj+bMdluAFyh5QVS4ewgC5t1pPDTxZ6tnJTphs7
	k+8kvvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww20R-00000006eyl-3gzG;
	Mon, 17 Aug 2026 18:24:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww20Q-00000006eyX-2gGR;
	Mon, 17 Aug 2026 18:24:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4351601DE;
	Mon, 17 Aug 2026 18:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC171F000E9;
	Mon, 17 Aug 2026 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786991057;
	bh=vy5aeHD8d+Jx1qMGwwl5D/7Bi3rGEWzbwGp1Tk7bSPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j33J8SpBIEotOP8DhEHOuKEtjOPRTXcET4HUd1Twrbxoy70DMh3OJGmKV0UiW9o+c
	 k7CokEMVkmuueB5Q0+qu5IK0i6uP5PvWwcDGHf50qkDYe1x9BltWLSZfdqdS4A8FfQ
	 FaE8QNl6MpnFogd+K8VaKN1pMU28jwtT42Eax3ht91iyEAq9yfNtcu076eUyKWlxyP
	 TFgopx0VgjUrNMJV4sCmFlXvkdnTGObyHxw6nRhW+O0fLTu1eVkvj+pc9ZTpq4S/Jm
	 TCzuzEJA79IBPBGpwb/EHkytvYnEcscqDeVIysh4wOQpz0WFPV0EOpJ4Tk654icHpQ
	 JBFFkHdQ8khhg==
Date: Mon, 17 Aug 2026 11:24:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org (moderated
 list:AIROHA ETHERNET DRIVER), linux-mediatek@lists.infradead.org (moderated
 list:AIROHA ETHERNET DRIVER), netdev@vger.kernel.org (open list:AIROHA
 ETHERNET DRIVER), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH net v2] net: airoha: npu: load the firmware without the
 sysfs fallback
Message-ID: <20260817112414.0e82a395@kernel.org>
In-Reply-To: <20260811181717.19339-1-sochnev.v.74@gmail.com>
References: <20260811181717.19339-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 11 Aug 2026 19:16:59 +0100 Vitaliy Sochnev wrote:
> airoha_npu_load_firmware() maps a missing firmware file to -EPROBE_DEFER
> so that the NPU can be brought up once the rootfs carrying /lib/firmware
> has been mounted. That mapping holds only as long as request_firmware()
> reports -ENOENT.

Okay, but AFAIU this is a hack. AFAIU PROBE_DEFER is not meant to
be used for FW loading. The driver module should live on the same
'partition' as the firmware. Either have them both available in initrd,
or have neither?

