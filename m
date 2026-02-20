Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831BEC55ABE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCP4S7nW1w6rXQ4VX/NQCO9pkK1t1/d43vAMdFSN+pM=; b=YLq/misqi22VodhanpVkoWWeFc
	RNvXDuBHFLTfnMPWpgr+PiMprMLOqnsJNN7by5t26mxMlZ0c+61hWemvYS6XH7SKo7aII4N39blh9
	qfJ5GkGnU5JX8uvTh2ZBcJL02CAoV3A4xuxsnUHTa5gkRf9K8ZysSzyi+pXcwiD9algUTRNWnGHzQ
	PyNre4VFXSgLixsrZB+OUvXMNFFp8LBe/laNM4ijyycgLyuOTP6a5kZY7zDq+YaRI+Z4n/+RMog+A
	U2oGOT4zHcV8dkNAJnikJXzMdA/bH8BiyUrrLYNx+wONgMOfayeI/mG9KHuxRhXIaLvCjSL4tLeK+
	D/X1LLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQrX-0000000EaQc-1Mot;
	Fri, 20 Feb 2026 13:48:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQrU-0000000EaNu-1gYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:48:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 85A624E4088C;
	Fri, 20 Feb 2026 13:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5AEB75FA8F;
	Fri, 20 Feb 2026 13:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9CF810368C65;
	Fri, 20 Feb 2026 14:47:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771595278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCP4S7nW1w6rXQ4VX/NQCO9pkK1t1/d43vAMdFSN+pM=;
	b=gYGSVqCzaJvVEVp+sFsTycrhl0mJ8c2PcZZl4bwwhJCsEVmK9CCMEIcQtlkeuaAmMqJ74j
	N4k+s6/ucf3JrJ5oIuy1QjzX9xjKGRmtJng5sRgtiaHKae8t+kum5WU0hzEnYOcz+8af25
	rDN/obkkLjkz0PU6ZG3O8y0UuWEdIfB8w7o7nRmoBh8AOb6g11RnN7ni+7N0IhmqRW/zMb
	HnL71OKtAf1ja5YFWpa8yXbdI2mbu9JUHwaZb6oJ8fnW0X/570n8/HWbaNwSOM+NvRBo5R
	7RNjUaXb3Htyht1NNPW+zoXLKhT+JwkMHJ5Zz0OkdF+C0z1bRx/606OmTTRnVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
In-Reply-To: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
	(Gabor Juhos's message of "Fri, 20 Feb 2026 14:27:02 +0100")
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 20 Feb 2026 14:47:56 +0100
Message-ID: <875x7rsf03.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054804_571875_655DDCE7 
X-CRM114-Status: GOOD (  11.95  )
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

Hi Gabor,

On 20/02/2026 at 14:27:02 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Since the USB core code handles the generic USB PHYs automatically, the
> optional PHY handling code has been removed from the 'ehci-orion' driver
> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
> initialization"). However, the devm_phy_optional_get() call has been kept
> so the driver still gets the PHY even though it is not used for anything
> in the driver.
>
> Drop the remaining code, and also remove the 'phy' member of the
> 'orion_ehci_hcd' structure to simplify the code.
>
> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")

The fixes tag makes no sense here, this is pure cleanup. I do not
remember if this was needed or not, it is probably safe to drop today.

Cheers,
Miqu=C3=A8l

