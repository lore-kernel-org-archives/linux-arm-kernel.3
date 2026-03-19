Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD6A1090234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqg7Bg6kJ/lBh3mPGVMcJxUkJteTeiLK4JhXhZl+frg=; b=dBayvk1I30+Wh56E1Lx/B3+Swj
	iLEepHW0VKhafeql3SVhFswdE+cuFUE/4a8pm9F1vlCfW9ebowfaH6P0JgS81k8eB5Z4a7kFrAp/R
	dkcF8tJmqFYbXbzVEj1yxRjbW0q6YKv+8II2CxTD1cqgWtgOCZFEjavkzz430g/m8lmpcFJ4H8MUs
	RuG4LSQ69ivnA9dVwgjLS9cqNwSdyNWdTy7h8r3A+fBI4bT/0kxUnxTm+8UEyBsB3HmYmiBJKYUgF
	7WlkO9dVwzcupYTU0Pe3SYDFGB/xCfICRGubofVnzsmYq9MdxoS9YFoy4b2fbcKn8qCsQYOwwGSoG
	jpQ8d6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EqV-0000000Aqvg-1Hf6;
	Thu, 19 Mar 2026 14:59:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EqT-0000000AquY-1nlS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91A36438AA;
	Thu, 19 Mar 2026 14:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53334C19424;
	Thu, 19 Mar 2026 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932372;
	bh=wRKFuj1RBd5OZOCmeqHIDv8olqwZDaGYrjqF4N72VFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jW7rO0Qydnm24fZKKcNCk97+5Di3gMM+w16JSsYYW7tDtJp8J3pvi9WBBBzht7Zxh
	 dNFCYlDNcdV+fZwaxhrxXOFxyAJhHxe+vHCiZdVszjUQ5eoOuoP9OmqFA0zGMVzliZ
	 h3HPi7AKag3uiE8aF1QXJXkXLsNp0vgEZ+WH7Qmfw4+ljSIfnVFtuMu0/REh97DcxT
	 7iR6kJkVmbQgIKxp3tA04eOS4QpiNxsJ9oUo+gVw6J6QA+5Mg3ZILbvmV+swM1MKj/
	 XjUC87ffsuXDpc8EQPT37CLR67gh92yBtV1tpDAr22vxx6BSKO/Joi/klO/asPmBES
	 zjxeZO8y0oMVw==
Date: Thu, 19 Mar 2026 14:59:18 +0000
From: Simon Horman <horms@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wei.fang@nxp.com, netdev@vger.kernel.org, xiaoning.wang@nxp.com,
	vladimir.oltean@nxp.com, kuba@kernel.org, davem@davemloft.net,
	linuxppc-dev@lists.ozlabs.org, krzk+dt@kernel.org, frank.li@nxp.com,
	claudiu.manoil@nxp.com, chleroy@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, imx@lists.linux.dev, pabeni@redhat.com,
	f.fainelli@gmail.com, linux@armlinux.org.uk, edumazet@google.com,
	conor+dt@kernel.org, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next,13/14] net: dsa: netc: initialize buffer bool table
 and implement flow-control
Message-ID: <20260319145918.GF1753385@horms.kernel.org>
References: <20260316094152.1558671-14-wei.fang@nxp.com>
 <20260318145452.1898637-2-horms@kernel.org>
 <3dab3f5b-fb94-4c63-bcfd-aad4268e2ac3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dab3f5b-fb94-4c63-bcfd-aad4268e2ac3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_075933_489163_BB179854 
X-CRM114-Status: GOOD (  12.24  )
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

On Wed, Mar 18, 2026 at 03:56:39PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2026 15:54, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> 
> Why are you removing the "PATCH" part in the email subject?
> 
> This completely messes up with the filters and causes this email to pop
> up in places it should not.

Thanks for pointing this out.

I sent this patch using some tooling.
I'll look into why this happened.

