Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBD2CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXsBVw7ca2OpdpyMISLXvOTwXQTS99J1W4wBLGIhQiQ=; b=MzWNj4w5AJ1WbgZ1wrPIQC2col
	0pNENPcYrikM0ZE789qi5mbHSlQU7QZjVgCX770OQR4nhvMNvuU6Z+7tiuoYDtNdSoQ3+EYywOo7W
	zpuW4GaTR/Avke7Dvegy/uAuQzOyulKo3z313vj0g+8JsLO4MbPHgZhqd9wL8lLj4aUtmQ4M3Jcfn
	McdE+/XEVmIBOXDtlR6LVJOmOxMuO/qkdED0PT95TKOqiQldX5cdQT/bM5is+WE5IpFIJ7OLXn4bO
	Wh8yJUeoILJ9Fvsf6qqGH/A2ANvaVcaggoU4qyCZT9DMztL7EedVDO3UYB3Y688O3/MoG0yJGgJr2
	gZ9fz/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbKI-0000000CnCK-0YK1;
	Tue, 13 Oct 2026 12:09:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbKH-0000000CnCE-0qi6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:09:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED98841A55;
	Tue, 13 Oct 2026 12:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823F11F00898;
	Tue, 13 Oct 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791893388;
	bh=lXsBVw7ca2OpdpyMISLXvOTwXQTS99J1W4wBLGIhQiQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=EpiPXkx6OtiRXxsTIP3ensKDGVlH6jh13A2aaMIbWt0wM7XXjMf+3FVrr5izwi5PK
	 7mI+ZWuufqoRMWUNAkhQcO68EyC+QXnaFudUNpUA5nlEgJup4Z0vSWbfxY4Sa5ghdd
	 7etPDqo4jScYtGRLB++eJIdE4eGsbKsxbogaPP+sU8qj0RvK/kfsbqauP8eIvGeZaA
	 ixiKkHcW4WClS6kYJxPTqxDHZ5n9m+GBBZbzb4hETuqYC8/JnIWGNUNZ5mhgRWOIJy
	 i6CrCYmm0J+Q9Luq3aUM+LamygI3BCLgJnSt6uFpGykdJku3LtOdMuj+D8ULuZLSFj
	 +UVenTJySoGtQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260428132708.95998-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260428132708.95998-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [RESEND PATCH v2 1/2] PCI: mvebu: Simplify with scoped for
 each OF child loop
Message-Id: <179189338514.10165.14307528512397626624.b4-ty@b4>
Date: Tue, 13 Oct 2026 17:39:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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


On Tue, 28 Apr 2026 15:27:09 +0200, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.

Applied, thanks!

[1/2] PCI: mvebu: Simplify with scoped for each OF child loop
      commit: e473e430ec31e2605227eb5e30be3712d6338da1
[2/2] PCI: mvebu: Keep child node refcnt for probe duration
      commit: 20d227f309b6810179cff40499490618d4b731c7

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



