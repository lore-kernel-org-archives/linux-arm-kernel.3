Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E913DCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFvCrRBIWF5b7VjJlzEl/8QN+53YJGJq2xeX3a/6Rg4=; b=ocqg5VGKJWuddet43szHI5gfyS
	IsT9abMuPW4o06Bf/DBTQ2l6AYPqd37sKP8vW+HDAdvOgln3VCQp7dhN+GiN9zwFpoDIJ0vST8Cht
	hUCBMK8XepqKiaAbcE6GgrcCUMW88X5yN6xO1xufGwRr6X15dwE5WcNxFi6QCoWgjyQ8D+U1A5Xv3
	8QpBdTdjW9UoMCweCbIiYa9nxdsFFveIfpjFM+AdwUd/QlS5YMjo0FyTGBU5repT/yBS7FJcofFJe
	YTFnjz1o0QUgv9oagby00OPQnXyJcFIPyGyPiapYnF5lD8f9cYbeNceGaZFQpPUTk746d1mhpD4yP
	rT/wwClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaLY-0000000BHrX-0iUw;
	Fri, 02 Oct 2026 10:18:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaLU-0000000BHr4-44om
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 10:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8D9842A5B;
	Fri,  2 Oct 2026 10:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678BC1F000FF;
	Fri,  2 Oct 2026 10:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936308;
	bh=EFvCrRBIWF5b7VjJlzEl/8QN+53YJGJq2xeX3a/6Rg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dO0QF7Fy9SVQ3Fa+3btBoie+pDM8Lk1+P79E8N59Q1N4IH9/niZ/8pXqQp02wWRIR
	 N76lMDD2MAON/2AcdCkav+7m03E7uXn8HvN7EMymSxBB167Fny+no+8iBoDnHQG2vX
	 FHO264uotXxe9vgawMJBX5THTKcXj3pDtbdSD+QW05kEP+XMADvBf5ngIP0JQR4yXf
	 jeZj/9IOUm/NrsSHNjBwCQaJfbiZ8ttVXj2WX4djoX9UzrvuCaQju70PQofstqfd2I
	 kSJ+ymDKob9aZKysEpcibgHoMz5AQ2XWO8DC4CPqMOyW2BqOnfd7JHx4MB9yXaJjU/
	 M651mDE9LyZyA==
Date: Fri, 2 Oct 2026 11:18:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Grapentin <gra@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "David Hildenbrand (Red Hat)" <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>, 
	Hariharan Mari <hari55@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Hendrik Brueckner <brueckner@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Nico Boehr <nrb@linux.ibm.com>, Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, 
	Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v9 23/24] KVM: s390: arm64: Implement basic page fault
 handler
Message-ID: <ar-EcynSFG0BfW1E@gremlin>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
 <20260930173441.66762-24-seiden@linux.ibm.com>
 <e2742ccb-6b91-463c-a148-30b7e2f41e9a@app.fastmail.com>
 <e1569c6e-94df-4609-8d94-d6319b4171cf@app.fastmail.com>
 <ar5udQI9qDAtYrGi@gremlin>
 <20261001153005.314717-B-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001153005.314717-B-seiden@linux.ibm.com>
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

On Thu, Oct 01, 2026 at 05:30:05PM +0200, Steffen Eiden wrote:
> On Thu, Oct 01, 2026 at 03:36:26PM +0100, Lorenzo Stoakes (ARM) wrote:

> > Ah the s390 <-> kvm emulation stuff.
>
> no, its not emulation :)
> We use a hardware based acclearaion approach.

Sorry my apologies, I did know this but mr. brain didn't engage there :) rushing
through mails (and been sick these last few days)...

> > Or both conditions? One for the s390 guys.
> >
> so just the initialized test.

OK cool, so Arnd's suggestion as-is, then. LGTM!

--
Cheers, Lorenzo

