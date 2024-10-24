Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFE7CE8E6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaB8aFj2Ht3u6kDuLsZN5ogpt87zOQuM5ZYebSBe+hU=; b=rUKymjVQwqZtcdDqxdT/soWLh4
	dExfCtt+LWFJiEJej9Io0WFHhI6kt0/F6uw7crCVGahEZ9qiCynveaF091n32bAG8ufQ4hTKq46m+
	kq2d4E1j3iESH4LcmZrn8kvFxo9d0Bpl6aEbAFEB2D05gYy04Yraw7xdlp8C9pEEedOqs8CynZnIW
	hzpTSY8JtTJMESIZjZoxB/bdOOPBV8Qs8bOChIhCR16gCZtCgm7BL5p6C4ntpjgNMS36jjoZ9Ynaq
	srIePfJzkmxB9s/8u21Tx/xM36jGlOYKXsL9MafnMiwOcpSr495nSPe14MiBH17CEGaUkcztx0KO+
	IFdA6eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wxK-00000000L1b-109f;
	Thu, 24 Oct 2024 12:28:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wuI-00000000Ki3-1eKk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53C955C5915;
	Thu, 24 Oct 2024 12:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A3CC4CEE4;
	Thu, 24 Oct 2024 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729772737;
	bh=Fr7inD2Iqs0A99RN+MrWbC0MZ5NUxnu0ZpJwaCBLb2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IcaLTi4jI2EvY9DwSFCV+9f2bRi3JeLk9qnDH+Fx570+yygvdfFa4EtKABWL66yC+
	 hs2QD3Dj9kDT+mgFeVffsTKUn7YLbRpIwsvwogeH41ZrpSUI4FZCeFb2txqIUmOQIC
	 R/1Mkr6JVK2i+HZCo1emQ+sA5s7mmrJm6qQ+TasAQjdLTDE4BO6h7Xr9cBoBbogv9l
	 1reoNCw7dfj3XXJHgv3dgD4nuCRU2XBpHZLXAeIcSEMqyupKfwx+5ljgEFRFmqK68k
	 Kd2dyOi1jFOALnQjxcMeWVUhxZq+Bei+o0GBb1VHvLW0dGoaqAb0hjAj+W99vtIG+S
	 t1snir3OIhdKg==
From: Will Deacon <will@kernel.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/dwc_pcie: Convert the events with mixed case to lowercase
Date: Thu, 24 Oct 2024 13:25:28 +0100
Message-Id: <172976985183.3761088.10462811188399686482.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241016210136.65452-1-ilkka@os.amperecomputing.com>
References: <20241016210136.65452-1-ilkka@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_052538_495478_5BCDE108 
X-CRM114-Status: UNSURE (   7.84  )
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

On Wed, 16 Oct 2024 14:01:36 -0700, Ilkka Koskinen wrote:
> Group #1 events had both upper and lower case characters in their names.
> Trying to count such events with perf tool results in an error:
> 
> $ perf stat -e dwc_rootport_10008/Tx_PCIe_TLP_Data_Payload/ sleep 1
> event syntax error: 'dwc_rootport_10008/Tx_PCIe_TLP_Data_Payload/'
>                      \___ Bad event or PMU
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/dwc_pcie: Convert the events with mixed case to lowercase
      https://git.kernel.org/will/c/759b5fc6cc3e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

