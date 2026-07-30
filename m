Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB2C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtGBUghZ3NVIAEOKhEMfE4OWjyrtG5sqoDoPPz9NCKI=; b=bbhOQJng76e+5KKttyAdJpR6EP
	zFb16q7DdW8JQa3hO7x+Wx2gkEyAh8oyuuretgG8mxrH6cbNNcDpgDzxWRwIwN5t7Xvn4uYWG/g10
	HYDKZ1uj0Oq7Vjp0VVSDxDVgObDdcx7Bx6rAC0CcN4SJcZojJ34UoZSBCcv6e1XbEte3sbHO6JBuW
	BlPJ19zGg3DHMBy90oPefh7dIilVX5rOKOMN3YeGQitUSzZ/rK8ohZ/2M8bNo0pDbKplbiN/hiLiw
	swQYK+fu81qDu1psv44m40jMiIco8JdZ7wV5GhbVeACNUdII/n+7RpkcVXuo9uuCLa7OPtOVSl/uk
	N5C00qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN4s-0000000A0kw-17h3;
	Thu, 30 Jul 2026 09:29:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN4o-0000000A0id-3bhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:29:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C50B4E41001;
	Thu, 30 Jul 2026 09:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E530A602B8;
	Thu, 30 Jul 2026 09:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 074B311C15912;
	Thu, 30 Jul 2026 11:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785403749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BtGBUghZ3NVIAEOKhEMfE4OWjyrtG5sqoDoPPz9NCKI=;
	b=lHRpTryOpV8JKVIpccrVl2dKXfsUls7y1AdqNdu+lbrNBdtrNAs6PeL/OlQ7OxIRNx/Dwq
	hSoYbDY+ObMspxRJIPdg8y+9840xOr+OvewITwTLqWvJiKVwz/+Rz1NEwWP73Z4KURSzox
	b96T/fWI9sr1mMgS3MSzmKgVti/5PCxnIx0VFJnocoufsgrdaz7JheIudlYyWGmAkwGPLQ
	lAFLyag3CjNETsoxAIiqN3q4P9aW38M37y8u1eMIoEUu/IZ5vAc9dJek1a3w0ujpookQaW
	PGFESeP4ZrCZLJ3/Q0kfpee/sk2QAcVYqbaTlIq9/TFvZRx5FyzfGFEC7H5qHA==
Date: Thu, 30 Jul 2026 11:29:05 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, Paul
 Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
Message-ID: <20260730112905.23a4b2f2@bootlin.com>
In-Reply-To: <0e5628ae-886a-4a8e-8a35-6402737ad65a@kernel.org>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
	<20260729172156.4371a8bc@bootlin.com>
	<0e5628ae-886a-4a8e-8a35-6402737ad65a@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_022919_040367_324C3216 
X-CRM114-Status: GOOD (  31.21  )
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

Hi Christophe,

On Thu, 30 Jul 2026 10:11:29 +0200
"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> Hi Hervé,
> 
> Le 29/07/2026 à 17:21, Herve Codina a écrit :
> > Hi Christophe,
> > 
> > On Wed, 29 Jul 2026 16:10:36 +0200
> > "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> >   
> >> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> >> proper platform driver") qe_add_gpiochips() was walking the device
> >> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
> >>
> >> After that commit the discovery is handled by the platform core,
> >> therefore it is necessary to call of_platform_default_populate() on
> >> the par_io node.
> >>
> >> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
> >> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> >> ---
> >>   drivers/soc/fsl/qe/qe_io.c | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
> >> index a5e2d0e5ab51..02ca556c8db0 100644
> >> --- a/drivers/soc/fsl/qe/qe_io.c
> >> +++ b/drivers/soc/fsl/qe/qe_io.c
> >> @@ -15,6 +15,7 @@
> >>   #include <linux/errno.h>
> >>   #include <linux/module.h>
> >>   #include <linux/ioport.h>
> >> +#include <linux/of_platform.h>
> >>   
> >>   #include <asm/io.h>
> >>   #include <soc/fsl/qe/qe.h>
> >> @@ -184,3 +185,17 @@ int par_io_of_config(struct device_node *np)
> >>   	return 0;
> >>   }
> >>   EXPORT_SYMBOL(par_io_of_config);
> >> +
> >> +static int __init par_io_populate(void)
> >> +{
> >> +	struct device_node *np = of_find_node_by_name(NULL, "par_io");
> >> +
> >> +	if (!np)
> >> +		return 0;
> >> +
> >> +	of_platform_default_populate(np, NULL, NULL);
> >> +	of_node_put(np);
> >> +
> >> +	return 0;
> >> +}
> >> +arch_initcall(par_io_populate);  
> > 
> > 
> > The par_io node is a sub-node of the soc@xxx node.
> > The soc@xxx node is simple-bus compatible. This child node should be
> > populated.
> > 
> > Why do we need this additional of_platform_default_populate?
> > 
> > Also par_io node has a compatible. Maybe the related driver should call
> > of_platform_populate() to populate children of par_io if needed. If this
> > driver is missing, maybe it should be created.
> > 
> > Do I miss something?  
> 
> As discussed together off-line, at the time being the par_io driver is 
> not a platform driver. par_io_init() is called from setup_arch() by some 
> board setups.
> 
> In order to fix the regression, I keep it minimal with an 
> arch_initcall() function which is equivalent to what we had before 
> changing this driver to a platform driver. It will also ease applying 
> the fix to stable without too much churn.
> 
> It will still be possible to rework par_io driver in a follow-up patch 
> and change it to a propoer platform driver.
> 

Yes, indeed, this makes sense.

Thanks for the clarification.

Best regards,
Hervé

