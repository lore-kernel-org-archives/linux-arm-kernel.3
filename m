Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90010C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14VcNoUJr90x9H/vOdtzsbSAUeaTA109Ea7TEEPJP+Y=; b=EkwNwoxN8fabBR1OHiNSePEs0c
	jmAxGYJtlWjy2oOlVP5PuJO41czTtzJgGd6CJ0nYmIGyF1fX0mc4ttRCQIjOV1Bf7JsWuKtRnXxKL
	IfQNTOQC/e4k8Wjbwq3A3HPT6LEUf2rsQkOykCbGHvNDFAqXo/CIw7n86k+V9Xg4bc+gTn3pzOyic
	cZM1bunt7o2MBEXiZK/gAZGoxB2WNFHNJYS8JMFg321sv0cgCc/lbqeT73Fd16Z3Q+oZwDrS9B++V
	ZHGoJP5FVgmIfrb08sp9VJeTr7HmMNHQ6dnK3QOFrAciUCMQ1Sm4isVQo21g6L5AM6ZkuYVA2oQS9
	4tlO6fwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeuo-0000000FPuO-2SOJ;
	Wed, 06 Aug 2025 14:14:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeog-0000000FOqg-35tC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 14:08:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bxsXC32XSz6K5sk;
	Wed,  6 Aug 2025 22:06:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1F8D714044F;
	Wed,  6 Aug 2025 22:08:22 +0800 (CST)
Received: from localhost (10.81.207.60) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 6 Aug
 2025 16:08:21 +0200
Date: Wed, 6 Aug 2025 15:08:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/msi-lib: Fix fwnode refcount in
 msi_lib_irq_domain_select()
Message-ID: <20250806150818.00004a84@huawei.com>
In-Reply-To: <aJHNeP2E76liHqUr@lpieralisi>
References: <20250804145553.795065-1-lpieralisi@kernel.org>
	<87y0ryf9uj.ffs@tglx>
	<aJHNeP2E76liHqUr@lpieralisi>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.60]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_070830_922102_B8652077 
X-CRM114-Status: GOOD (  23.83  )
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

On Tue, 5 Aug 2025 11:23:04 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On Tue, Aug 05, 2025 at 10:31:32AM +0200, Thomas Gleixner wrote:
> > On Mon, Aug 04 2025 at 16:55, Lorenzo Pieralisi wrote:  
> > >
> > > msi_lib_irq_domain_select() is used in other arches, I could not
> > > test on those (don't know if they have non-[DT/irqchip/acpi] specific
> > > fwnodes) - from a fwnode interface perspective I think that this patch
> > > does the right thing, it should not add any issue to existing code
> > > to the best of my knowledge but it has to be verified.  
> > 
> > fwnode handles are architecture and firmware agnostic.  
> 
> Yep, though to make sure this does not trigger regressions I started
> checking (ie I am adding an additional fwnode_handle_get/put() in there),
> some fwnode helpers (eg fwnode_find_reference()) returns an error
> pointer rather than NULL on error, it looks like calling
> fwnode_handle_put() on that value when OF is in use is not a good idea
> (ie of_node_put() checks for NULL and dereference).
> 
> There is code out there that implicitly assumes what fwnode types
> are used behind the fwnode_* interface or I am missing something.
> 
> It is not arch dependent but it looks like it depends on what fwnodes
> arches use - that's where my caution stems from, nothing else.
> 

For the many DEFINE_FREE() uses there is a check of IS_ERR_OR_NULL()

E.g. Here it would be 
DEFINE_FREE(fwnode_handle, struct fwnode_handle *, if (!IS_ERR_OR_NULL(_T)) fwnode_handle_put(_T));

IIRC this one was an early use of DEFINE_FREE() and later discussions
argued for always adding that check purely to allow the compiler
to potentially optimize away the call.  Sounds like it would be
more generally helpful here and I can't immediately spot any negatives.

Jonathan


> Thanks,
> Lorenzo
> 


