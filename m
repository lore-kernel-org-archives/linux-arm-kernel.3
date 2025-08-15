Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD41CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRGw/KGLI4QXhygoMdzbTFBYV5yWW9JOCGKM+InTuNw=; b=PCG+6RJzj/hZIsUxHQSpkLt9oj
	zXChYIp3udno93P4/Ed14iJCTdp0c62lKfNmCwUyEdk0xJQUwfQ+dtmegoyAG7f/QeKyMd9QeZLpA
	frG5WzgZ/OL15oW7Kt6qZ3CrjHmRPRra0uLe0H1qLNFuq2QZobn5jGNF/3DyBsZ8eeb1CqE7cijH8
	gAI272r1oyNS/6yvDhYzPe/Kjo6EezaKAEMUlIkP+YjRExpE4SDHIk3u4aQqs4r2dXIr14X0F7Fmu
	VWXUX8DuWzoCyA+00ljAFwNAGgaYj7nfmt4aOfHgp/wpARbIlnmQbOnmNv1RL4quhZq8jNVJJU6Z5
	uuTD+L3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un2Ck-00000003Zqv-2yJv;
	Fri, 15 Aug 2025 21:43:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un2A8-00000003ZWk-3lpT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 21:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bRGw/KGLI4QXhygoMdzbTFBYV5yWW9JOCGKM+InTuNw=; b=iIZdPBpCuqMr6a9UH5qG0AYom4
	n2gQ+NzG9gZsNGj4U/pIppYM/gpgMGxYAMLPZ3cxZLHZgyY7m7L3f/bVd+rH+bWWcemm1fR8aLWkn
	AkrKIO9Qyzy9YWz6RS274SJVRWLIwwXmQQO5rsPyUxk+RGV+WHzLh6Ui7fAY/6N1QRHmS4j0bPkWo
	Z+/LV3IgRBIzYx8fNCRiCzQUJHSHW+yevhBLEXXlZZ6bCfxqvQb0H14Er5pAHl3dtJKaq4GhypEzz
	pKIaiuqRS1BBFN0whTMnmD3FVaGdPX2pHhSuh2EacGvwLe1YUW8dG07/N1yEJ+cqCnGTAEJrekL7j
	hGYQhEdA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un29V-0000000Gqa0-0jQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 21:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B387A418D1;
	Fri, 15 Aug 2025 21:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766E1C4CEEB;
	Fri, 15 Aug 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755293985;
	bh=RHSgGU/H2Md4KfOMvY3PmLoZ4WtUGhjnNbXf3Vo1KWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LcWMctY5bFdFnyiObAHh3RpTUuciXUOWOTB2M/Xo6pbxF65Gg9q0lwJspO/Frdcc/
	 DCnL8KtVE3tWNaFP5lasyMPGASNluN/ufhhjJewGZfKYyp0MvHO06EX7Zje5PuAjJ7
	 nt08RGfoz9uzuNG9ZBQkWq1RbpS8U1SauSSw6m3tG6sjls/jQIRaCbp04Uk9B3SG2h
	 4xRtg66Qz6KoNt967pUjLWXs+sa8u5vZDEhJ5HcFGzrpA11vCsmOM6DRciIuDuqgio
	 qbs/QaJcaclaqtL/5l1JFCi12PCvtX2tpAQgBajmqOZqoRXYOmOkGbnWR+8GO4NufF
	 H8k78ZjkWTiuw==
Date: Fri, 15 Aug 2025 16:39:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org, Tai Nguyen <ttnguyen@apm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: perf: Convert apm,xgene-pmu to DT schema
Message-ID: <175529362733.3232575.8797760861967373560.robh@kernel.org>
References: <20250812181422.68286-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812181422.68286-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_224032_439061_218A924B 
X-CRM114-Status: GOOD (  10.18  )
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


On Tue, 12 Aug 2025 13:14:20 -0500, Rob Herring (Arm) wrote:
> Convert the Applied Micro X-Gene PMU binding to DT schema format. It is
> a straightforward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/perf/apm,xgene-pmu.yaml          | 142 ++++++++++++++++++
>  .../bindings/perf/apm-xgene-pmu.txt           | 112 --------------
>  2 files changed, 142 insertions(+), 112 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/perf/apm,xgene-pmu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
> 

Also updated MAINTAINERS and applied, thanks!


