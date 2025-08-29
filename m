Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD6CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMeXDFVGR/9Ki+05emD4cN7qoUvEGzwRqloEtgQvvfA=; b=nBghrx6cqYMe2fg+PY+CdyD4L1
	48S6a6Qq3s/zHGJeoJwK21JTnUjQ5B4+NlRyuYMk6rmhNBtDtg1rwzToBeuTkH7q3ICa11SWOtYgK
	S7alr29UYOM6zZRRotlCGz0vP+JkLuJ4TAsdj/LQP2QjConjG7gO4kEbt3VFNXeK8OJZscgAaxdir
	78xKUhfJLRsq4DIXiX2JIETaSCWqUZ8Cnl3/8uEONfZi+RLGLVRJ8ymBTqhRIIi8DtQhNZiq9o5mr
	w7v9AQkDGlN6I7GN64UGp/vs8lwlNNF5Cq9Nec/Jsun8X+p9491tRQfTtVtcYkJ5fibybQ5TcPCtO
	K6L35cVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1Lf-00000006I4m-3mYR;
	Fri, 29 Aug 2025 15:49:07 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryKY-00000005gEk-0Zzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:35:47 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57TCZfPc2214201;
	Fri, 29 Aug 2025 07:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756470941;
	bh=YMeXDFVGR/9Ki+05emD4cN7qoUvEGzwRqloEtgQvvfA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Tk57L5po0BFIwaihbCd69YgO9O3FHszFUGt8fgCLzBvtXKXzBU1SqdUDz0hUvgmr4
	 yBKhFWIT+CAm/7D1vil0UFQyZRE2JuXKUdgfx8cfviDd4pNyfpLal3pw2LuOsypbnp
	 Go3rdyCDyjA/OLnyGbAL+BHAhMhLBsIDGmbQQMo8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57TCZfGN020241
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 07:35:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 07:35:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 07:35:41 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57TCZfx52065041;
	Fri, 29 Aug 2025 07:35:41 -0500
Date: Fri, 29 Aug 2025 07:35:41 -0500
From: Bryan Brattlof <bb@ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/4] Add support for TI AM6254atl SiP
Message-ID: <20250829123541.332xfrmzgar2dn4y@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250814134531.2743874-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250814134531.2743874-1-anshuld@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_053546_347655_F870D9EA 
X-CRM114-Status: GOOD (  15.22  )
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

On August 14, 2025 thus sayeth Anshul Dalal:
> Hi all,
> 
> This patch series adds support for AM6254atl SiP (or AM62x SiP for short)
> to the linux device-tree.
> 
> The OPN (Orderable Part Number) 'AM6254atl' expands as follows[1]:
> 
> AM6254atl
>      ||||
>      |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
>      ||+--- Device Speed Grade (T indicates 1.25GHz/1.4GHz on the A53 cores)
>      |+---- Silicon PG Revision (A indicates SR 1.0)
>      +----- Core configuration (4 indicates A53's in Quad core config)

It stinks we put the integrated DRAM density so far down in the part 
code. But I guess there isn't much we can do about it now. :/

> 
> AM62x SiP provides the existing AM62x SoC with 512MiB of DDR integrated in a
> single packages.
> 
> This patch set adds the new 'k3-am6254atl' SoC level dtsi alongside the
> 'k3-am6254atl-sk' dts for the EVM (Evaluation Module board). The newly added
> 'k3-am625-sk-common' dtsi includes the common hardware between the existing
> AM62x EVM and the new EVM for AM62x SiP.
> 
> Regards,
> Anshul
> ---
> [1]: https://www.ti.com/lit/ds/symlink/am625sip.pdf Page#21
> Product Page:
>     https://www.ti.com/product/AM625SIP/part-details/AM6254ATLHJAMKR
> ---
> Anshul Dalal (4):
>   arm64: dts: ti: k3-am62*: remove SoC dtsi from common dtsi
>   dt-bindings: arm: ti: Add binding for AM625 SiP
>   arm64: dts: ti: Introduce base support for AM6254atl SiP
>   arm64: dts: ti: Add support for AM6254atl SiP SK

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

