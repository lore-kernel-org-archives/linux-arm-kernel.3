Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C67C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8ZQiTN586DKOzGjE0xQTVjSc0oG6CWcbCqpe2Jy2M4=; b=X5Yh07SC4AZiUfIG5y3PJJPbie
	Hl+CF7FDePuv+j0n7xhtpZHVbwgiq7sZGxZVeuNdNfzMMjwf849oTW/nmuUIMxIB6/ykZ3IZYVUbz
	q6oLyejwYZcj4pJNJ5Xh9pj+D8y/oL/jioeJ3B+QlGJETIBkqUpkIMPHMMNSawt5oNOYADfcNF10O
	EBg0GVEuSQ+3GWirPCHFnvY/n7TjMubHjIXpSslbuZHx2dDgVcPdbxuB/j+HYY5zwMIPeG6Z+YyVK
	vNxQ41o7EJlDmaYzre7Wg5Y/WZzN2MkRFJODaJJL0UfJSAmTmNz2c4fNvmJQIYpYYKzTYMYLbKFBO
	1wI9O7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5MY-00000008j9F-0M54;
	Tue, 21 Jul 2026 07:58:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5MW-00000008j8s-2jCX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:58:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CF784510E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1491E1F01560
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620680;
	bh=y8ZQiTN586DKOzGjE0xQTVjSc0oG6CWcbCqpe2Jy2M4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JTzAvTvrEZMMKQCko+0HPPhkpoj5NWd5ycVDtjgNCicdqaixDwIGJDkzLLwYat9TM
	 C9mR1HA+lbm5tGRpNv7yM7oowRCtR49RpldiZ0s0afqG/fHGPWWe5xE71/IdDcn9jZ
	 YvOak8XUWsPiyTPrbh1iy0CO9ZAW9R0tD6PfLce5NdPZWTdcnsA+7XPw0glvkYBIEd
	 wbwpZeCK/YPSMdyfZhH8MYA3+1ywQebQPPxSKHhCM3gsSxU0zlYzEjWz2K94m1HN3N
	 PmwyjR1LUtCfqiZB2b+99HhnojNuzzDu6aEbXMs8lFfKr7CmOPyWnQUl39S7FgLjK0
	 gl1RxyLdRIb8g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aec201b582so11102340e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:58:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6vWhO3hxQHlq0V5O8hKc6Yx7W9e6bsQAv3uRbMkCQq5zfuv4BEj9PVgP9ePOlwHJscSio9xM8iLqLrY/uaJSL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq/hHzCA177PLQD3/NfioF2iztF7OZ9PouWlV7kieVW9qx8np1
	8Q2cTEnbpvWMnx+Ffm0vJR6YlvlsW8s47DkMUeGSYoxExFVmou+GYlA+n7gokQ82Prf+BcCA2k8
	DqD3oJBM+MGhEJhkOTdIPXxbV6SfqPdBFIRLgpGhNzg==
X-Received: by 2002:ac2:554c:0:b0:5ae:bcf8:e7d0 with SMTP id
 2adb3069b0e04-5b28f9bd551mr2209166e87.55.1784620678478; Tue, 21 Jul 2026
 00:57:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:57:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:57:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <3e14e41f-ecd5-432b-9f52-690a05b38a8a@lunn.ch>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-7-2dee93f42c54@oss.qualcomm.com>
 <86b2aba7-b049-47e6-bc94-6cb499b30ce4@lunn.ch> <CAMRc=Mduv_KiB42d4AZddTrFSHmKogd2wh6vBDXomW6ssdfq9A@mail.gmail.com>
 <3e14e41f-ecd5-432b-9f52-690a05b38a8a@lunn.ch>
Date: Tue, 21 Jul 2026 00:57:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md_zUwYW5KL+p=BRixSaf3Rrc5jnBA3x8Ze+fK+fAOctQ@mail.gmail.com>
X-Gm-Features: AUfX_mxrzWF5f1w8uOBbvKVmYCYI9DGFBZVEBrX2uI1sc7agH6iCfKo0CQST8Mw
Message-ID: <CAMRc=Md_zUwYW5KL+p=BRixSaf3Rrc5jnBA3x8Ze+fK+fAOctQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] net: mv643xx: use platform_device_set_fwnode()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 20 Jul 2026 20:28:39 +0200, Andrew Lunn <andrew@lunn.ch> said:
> On Mon, Jul 20, 2026 at 06:01:37PM +0200, Bartosz Golaszewski wrote:
>> On Mon, 20 Jul 2026 16:43:40 +0200, Andrew Lunn <andrew@lunn.ch> said:
>> > On Mon, Jul 20, 2026 at 11:24:54AM +0200, Bartosz Golaszewski wrote:
>> >> Prefer the higher-level platform_device_set_fwnode() over the
>> >> OF-specific platform_device_set_of_node() for dynamically allocated
>> >> platform devices.
>> >>
>> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> >> ---
>> >>  drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
>> >> index 9caa1e47c174c9d7a161b7f2e2ee12a829b813d4..2f2d6cce8d852b9ec3ab42678a04a7915d1f00cc 100644
>> >> --- a/drivers/net/ethernet/marvell/mv643xx_eth.c
>> >> +++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
>> >> @@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
>> >>  		goto put_err;
>> >>  	}
>> >>  	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>> >> -	platform_device_set_of_node(ppdev, pnp);
>> >> +	platform_device_set_fwnode(ppdev, of_fwnode_handle(pnp));
>> >
>> > This is definitely an OF only driver. There are no other calls to
>> > fwnode functions in this driver, so this is the wrong thing to do.
>> >
>> > Sorry, NACK.
>> >
>>
>> I'm not going to die on this hill but drivers are OF-only until they're not.
>> For example, Qualcomm is now working on a hybrid ACPI-OF approach for
>> laptops[1] and we may end up needing to start converting drivers to fwnode
>> after all.
>>
>> There's no real benefit to sticking to OF-specific APIs unless you need to
>> iterate over all properties of a node or use some other functionality not
>> available in fwnode. The overhead is minimal and it's never a hot path.
>
> There is a lot of benefit to sticking to OF specific APIs, because
> within the kernel OF is well maintained, has active maintainers, there
> are tools to validate bindings, etc. ACPI is a Wild West, each driver
> is a snow flake, there is no review, no binding documentation, no
> validation tools etc.
>
> I hope you allow plenty of time to convert any networking drivers,
> where Linux is driving the hardware, to ACPI. Your first stop will be
> the UEFI forum making a proposal for MDIO busses, because that
> currently is not part of ACPI. You will then need to spend time
> understanding the DT bindings, and figuring out which properties are
> deprecated so need to stay OF only, and which can be converted to dual
> OF/ACPI. I've seen too many naive attempts which blindly convert
> everything, copying all the past errors in the DT binding into the
> brand new ACPI binding. That will get NACKed.
>
> OF != ACPI
>

I've never said that and ACPI is actually irrelevant to this discussion. Fwnode
is the abstraction layer and OF happens to implement it. Unless you need
fine-grained control (only exposed by the lower-level abstraction) or
performance - neither of which is the case here - you should use the top-level
API. As I said: there's no good reason to stick to OF-specific interfaces for
drivers that don't really require it - and even then, we should strive to fill
the gaps in the fwnode API instead.

Bart

