Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D78CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GyRbe+8t9Qx3vOYKAfgP9Hg3BnwoylvXSDWp38DlcgQ=; b=ZWqHI4xSptVRDWzsxqVxkkmCMT
	lFbbyeVNWYklpIdyrZYm/FKkxWGw/syq1S7nMWUdHKv6ArF1STE7MoiXae5ZeykvwgYYhfL9tJ8PY
	aH5AS2whcjcT3a3zqBFzHr0lB+NbpvpurtoJS5aB82uV07JBMwrNMgU2W6m17hoftVNKVxCpGuad0
	/TLiygOML0rydH7BylimlLxxtOPBik6PkNcnw2ojN+jnXicaVV58l5E/3JQnAyIIXKnF9UfKMWtZR
	ptBck0jWMpHdWjm50MFQrSSV5o9VJNmNqzyHl3ojRXx2WFlSARDt9C0l88rC1bNKAe4+KG/Xa1XsM
	0dbnup6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXdB-00000008i6V-1Ue6;
	Thu, 11 Jun 2026 05:07:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXd8-00000008i5x-1f3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781154415;
	bh=GyRbe+8t9Qx3vOYKAfgP9Hg3BnwoylvXSDWp38DlcgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lClyaaPM5lDcE3g5Glq3XQLIx86iO6NcjaNXhDeR5Z5LYRMPRMwIcEx4GxUaMuj6u
	 C8SK6XqZ7engUuff59cS8Gx48DxyEVjtdLBpTeviDDeYDK1BTwn7FkfbgivHbKCYvT
	 wJqF38FTY5slwLr/A6GL+zqmog22WNjamQYPuxfH/8u+ZpucqJ9ubXB8razfCTNUmx
	 mjkw7RY6YxsoPLPRaDa2O5tRWb627uslqGlZTj+DR5C4lt6YbUHmtkXPj1Y82DNSPY
	 NRzgnHu+7HaCDMjRi+zJNos3TU6q8CSN0/M8dyCkdDI0aLCwFTgSCiJvFaOYRh6jKJ
	 LFEgR7mVEesMQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 164E96450D;
	Thu, 11 Jun 2026 13:06:54 +0800 (AWST)
Message-ID: <a4f09170d3d618d285f7019c82e63142b268d6ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: check endpoint DMA
 allocation
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ruoyu Wang <ruoyuw560@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 11 Jun 2026 14:36:53 +0930
In-Reply-To: <20260610121022.3-1-ruoyuw560@gmail.com>
References: <20260608081948.3-1-ruoyuw560@gmail.com>
	 <20260610121022.3-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_220702_628747_3CF4D88B 
X-CRM114-Status: UNSURE (   9.30  )
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

On Wed, 2026-06-10 at 20:10 +0800, Ruoyu Wang wrote:
> ast_udc_probe() allocates a coherent DMA buffer used as the backing store
> for endpoint buffers. ast_udc_init_ep() derives per-endpoint buffer
> pointers from udc->ep0_buf, so a failed allocation is dereferenced during
> probe.
>=20
> Check the allocation before endpoint setup. The existing probe error path
> called ast_udc_remove(), which unregisters the gadget unconditionally and
> is not safe before usb_add_gadget_udc() succeeds. Add a local cleanup
> helper for probe failures so pre-registration failures only unwind the
> resources that were actually initialized.
>=20
> This was found by a local static analysis checker for unchecked allocator
> returns while scanning Linux 6.16. The change was checked by applying it
> to current mainline and by running checkpatch. I do not have access to
> Aspeed UDC hardware, so no runtime testing was performed.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

