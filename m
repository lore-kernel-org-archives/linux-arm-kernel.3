Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0682CF8863
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gvAEll9gBhXwVo47o+gtCJqAPN1yNTF/Lu4NkpPhdg=; b=cSM3zSP3e7LO0Fes0m1P5LSLCf
	ozYxxxc7rOb+823eHDVj1TatlhEVIq39oiGRX6zxcCB/jBVw7+hX4PrveVtsEUhTa595gT4Ck8mEI
	+SCoEDjHmwigqoB36AFXyAJuUXduheWHizRefcGF134r7lLJ4YixxspxUyHA3ywKdtc6QJb2E3gwi
	3oCsX/Hs+8v0NQUMaZFBH65Om6Wh9/dN1Thq2JhEphZwa2XMT+Ijzodg8fRVZaNnbsyQhJDBG4MBr
	c5XM/79LGChWVQimNAUUG3ZIF24uF3hfdoh/U0D3OLYGafwpe6GN8RgbselkGvwhGIJ9MbDSg074U
	ZS9k6aFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5aF-00000006q5f-20mL;
	Thu, 20 Nov 2025 14:24:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5aC-00000006q5G-2X8Z;
	Thu, 20 Nov 2025 14:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C745D42A1A;
	Thu, 20 Nov 2025 14:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA43C4CEF1;
	Thu, 20 Nov 2025 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763648663;
	bh=idUoaT1Yr1mM8Z9iABa9AY6Vy23rIl0ZA0+ANq8UVpk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NJCEJ6VEnwFuwLqo6v6iqlblCt/rkzwdbeYcXE3G+jdXDlzFs/2Hk6YQrDhvf2Zc7
	 QtZVVPZrJI3N5YvLNF4A78pmchqfqf23HnAPZ5JrDwXK5Uf9lPbagYAtdPCl4S/GMa
	 egDdE8WZQ5KTDXkplxgSJ9gFELef4m5+1CBKgavh4OJkvjjRZ0tuP1p1OX8q1GeTeB
	 gNEASZhYK88IHo6e05Ft378YDsQXyK79riZDuSClH+OXTvWKEcPlWvfml7XRwpTQ+n
	 eZtY0kmcQV+EpLPjGqG0c1Zm4U/8yfHTLTl5cuo41C/QkCsiLlFqKyVpgRTEAXyQ2p
	 YZU5Co4VTIn0Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251118121427.583-1-vulab@iscas.ac.cn>
References: <20251118121427.583-1-vulab@iscas.ac.cn>
Subject: Re: (subset) [PATCH] mfd: mt6358-irq: Fix missing
 irq_domain_remove() in error path
Message-Id: <176364866187.729271.10385218837985508921.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 14:24:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_062424_885210_FC1E3AB5 
X-CRM114-Status: UNSURE (   5.72  )
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

On Tue, 18 Nov 2025 20:14:27 +0800, Haotian Zhang wrote:
> If devm_request_threaded_irq() fails after irq_domain_add_linear()
> succeeds in mt6358_irq_init(), the function returns without removing
> the created IRQ domain, leading to a resource leak.
> 
> Call irq_domain_remove() in the error path after a successful
> irq_domain_add_linear() to properly release the IRQ domain.
> 
> [...]

Applied, thanks!

[1/1] mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
      commit: 384bd58bf7095e4c4c8fcdbcede316ef342c630c

--
Lee Jones [李琼斯]


