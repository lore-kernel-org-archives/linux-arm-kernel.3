Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8C4D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wKcNy5FCGaqY9FV62oZYjgf+u3MGcY8a3yEAdQ09gg=; b=amccF4Ih+sJ0hbs2Hg5ZcY5f6p
	qz6R26MD1nG0gUr8FvarE0vNSEtji3BqYj+Y89wRydlUxYhZgthw5kHVkjzMcZIup6AZnV3FRndWy
	NU3lg1yCFBSkMTKUCMlxYKMCaAqpp4O43d5ml22R0eFQs1WcJFzeRoJ7jEAOYyheOiuvV6Wh0Mbe0
	0ZEBacC3C/RoIHWCFdgLCj/SoF3VXcgBGgg7LQpet82NVx+/iKEyVg4gULgzj9L/7fhhXYkISd8/t
	SJ67IV0dgzLEoMl1t2LIf716r0oMoni1MemJ1X2p3Q2aKs4rG/Vr5jr1kDuHUeoVBPcV1MLHU6mGx
	EjAjJqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOICZ-0000000FHPi-0RLv;
	Wed, 26 Nov 2025 16:17:07 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOICX-0000000FHO8-08Cq;
	Wed, 26 Nov 2025 16:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=0wKcNy5FCGaqY9FV62oZYjgf+u3MGcY8a3yEAdQ09gg=;
	b=OS4HJrS2AI3Mq9+R1ebwCF7RSLe0YDcy9vKKM7EgPNueQa5eKfuFJcNqGQt/+a
	FPmV2XYlcxtPlEa7HwrepPyZX2FZvOXuDWKb/q6VEoKYSWiyBiMpQYO5wXPlJTLG
	3xYALoktHnRmfdQQwX4sg8mMV78vnwIW+DNg0tWNCdDEE=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3b++sJydpfQcMAA--.52027S2;
	Thu, 27 Nov 2025 00:15:42 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: tglx@linutronix.de
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	conor+dt@kernel.org,
	dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn,
	devicetree@vger.kernel.org,
	frowand.list@gmail.com,
	guo.chang2@zte.com.cn,
	hu.yuye@zte.com.cn,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.qingtao2@zte.com.cn,
	liu.wenhong35@zte.com.cn,
	maz@kernel.org,
	ni.liqiang@zte.com.cn,
	ni_liqiang@126.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	saravanak@google.com,
	sunilvl@ventanamicro.com,
	wu.jiabao@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Thu, 27 Nov 2025 00:15:40 +0800
Message-Id: <20251126161540.6460-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87qztmgj32.ffs@tglx>
References: <87qztmgj32.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3b++sJydpfQcMAA--.52027S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjeHqDUUUU
X-Originating-IP: [111.162.113.123]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbirwES5WknGuiyWgAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_081705_475936_F5BEF06D 
X-CRM114-Status: GOOD (  14.75  )
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

Hi, tglx

> > We've noticed that PCIe enumeration order tends to vary across system reboots (for example: first
> > boot showed PC08->PC06->PC10->PC07->PC11->PC09, while second boot showed
> > PC09->PC06->PC08->PC11->PC07->PC10), even though the ACPI firmware consistently reports the root
> > bridge sequence as PC06->PC07->PC08->PC09->PC10->PC11.
> 
> > In our testing, we found that adjusting the registration priority of the aplic driver seems to help
> > ensure the interrupt controller initializes before PCI enumeration, leading to more consistent
> > device ordering.

> The ACPI table does not provide a sequence, it provides a collection and
> it's nowhere written in stone that this collection has to be processed
> in order.
> If you want a sequence then put dependencies into the table and be done
> with it, no?

Thank you for your suggestions. 

Through our validation, We have observed that the current kernel appears to lack an effective
dependency resolution mechanism between ACPI PCIe host bridge devices.

The specific manifestation is as follows: when establishing dependencies between host bridges via
the _DEP method (for example, PC07 depends on PC06), only PC06 is enumerated successfully, while
PC07 is skipped. Our investigation reveals that the root cause lies in the current limitation where
ACPI PCIe devices have only a single opportunity to resolve dependencies—specifically within the
acpi_dev_clear_dependencies function inside the APLIC driver. PC06, having its dependency resolved
earlier by the APLIC driver, is asynchronously processed in the system_unbound_wq queue. At this
point, PC07 still depends on PC06, which has not yet completed enumeration. As a result, PC07 cannot
proceed and subsequently misses its enumeration opportunity.

To address this issue, we have introduced the following dependency resolution mechanism at the end
of the acpi_pci_root_add function in the kernel's PCIe enumeration path to achieve the desired
fixed-order enumeration:

#ifdef CONFIG_ACPI
if (!acpi_disabled)
acpi_dev_clear_dependencies(device);
#endif

We have observed that other drivers in the kernel also utilize acpi_dev_clear_dependencies to handle
device dependencies. We seek confirmation on whether this approach is reasonable and welcome
feedback regarding alternative effective solutions.

Best regards,
Liqiang


