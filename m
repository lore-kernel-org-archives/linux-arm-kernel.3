Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12502C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omre5G+1IVFVJgioXgIJvnCCA+bVgDIYK1GdW1E1tBs=; b=lemw+OM34AoioqKSWJopwcGTYZ
	OxvKlG7zgB0FyQwka4tjgDQs/Q9r/wA1spz8MxSQNtpfj7/PyGKn6juJoZUN4QbB+kR5G2SDeiJRl
	blVhsvcuYWGtsRniGOVtXHn1ncXrePjhNUhmN0NGmBLHtiR1Bfood0tdt465E19YZBXbsbg6zRUfL
	y5D6L6s0waLsxZjbCl1v3JsKr1F9AC6FxMaDadMpfEBD5MY43zvpmV4yFGuMfCLHFj68JrBvd+6wC
	PyQ9xCI4ZMZupvhzY1A6Kmf9eutbnQC40edJknkZVxjS0qVs3E/jc7az/wkVGcmoubTu+KRg4z6WD
	fcTB0Ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZyL-000000096qO-3dEb;
	Wed, 19 Aug 2026 06:40:25 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZyH-000000096q0-1FJY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:40:24 +0000
Received: from zju.edu.cn (unknown [10.97.62.103])
	by mtasvr (Coremail) with SMTP id _____wCnvny_T4VqtJ6nAA--.36202S3;
	Wed, 19 Aug 2026 14:40:00 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.62.103])
	by mail-app2 (Coremail) with SMTP id zC_KCgB35cq8T4Vqfrz9Aw--.39095S2;
	Wed, 19 Aug 2026 14:39:56 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown
 and remove
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <46936686-3bdd-4d36-9124-e8d3376ad5ea@kernel.org>
Date: Wed, 19 Aug 2026 14:39:45 +0800
Cc: Fan Wu <fanwu01@zju.edu.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C6A3233A-A352-45AC-A498-0DED1EC57147@zju.edu.cn>
References: <20260819021916.442827-1-fanwu01@zju.edu.cn>
 <46936686-3bdd-4d36-9124-e8d3376ad5ea@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID: zC_KCgB35cq8T4Vqfrz9Aw--.39095S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?su+KKgXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfncGSG+szpQCInt5Y8rbJUI3EaNafmokmxSGacB/SiOKcuO416gdgVifUJNAsz9S/YwSp
	Wt05rizKujXnc7uVicOp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy3XF47AF13Xr1rCw15Awc_yoWftFc_u3
	4UAw1kuw1q9F4xA3W5Gw1kZrW7tF429FyktryFyry3t3yrWF9xJFn2k34Iqry8X393ZF9r
	Cr9FkFyI93W29osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7gAwDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_234021_481593_32D7D838 
X-CRM114-Status: GOOD (  14.48  )
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


> On Aug 19, 2026, at 12:26, Jiri Slaby <jirislaby@kernel.org> wrote:
> 
>> serial core does not call the
>> driver shutdown on every path that reaches remove().
> 
> Could you be more specific on what path it does not?
> 
> thanks,
> -- 
> js
> suse labs

Hi Jiri

Yes. The relevant path is a console port whose last TTY user closes it
before the device is unbound.

tty_port_shutdown() skips port->ops->shutdown() for console ports. The
last close then clears the active state and dissociates the TTY, so the
later tty_port_tty_vhangup() in the remove path has no TTY to hang up
and cannot invoke the driver shutdown.  That is the path the cancel in
imx_uart_remove() covers.

trigger_stop_tx can already be pending at that point: after TXDC,
imx_uart_stop_tx() starts it for delay_rts_after_send, whereas the close
path only waits for TXDC.

I can add this to the changelog if you would prefer the rationale to be
spelled out there.

Thanks,
Fan


