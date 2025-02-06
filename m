Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1184C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bcl7WjWH0ga0feZ9cdjBxJ88YKE5Vz+6PyKwqg4g9gc=; b=t8o9r1wfB2o3PcIUaSHLiZrPiB
	1bGtaKrftclJKT5xPX0ztvJkLYCmLEIE3AD21072WETyMhYc2eweVoqs/tsuv0sWCiZ+R5FEFUtP2
	w+CV9M0cRuYURgTRRPpNobohN3yGxfob8EUNk12IB7OcTDLIX0slhhXAOPAG1fz1LgJSLUdFo2aGl
	r197m3SBMXWYlmjHeEWYvFpqHkXbRxU84hXgxiyBzGyMqy8bNH2q1k9xXZ+GYA3lPyDoFNESOd2/D
	bQEkL391OrQtm5OvDRC+L45Wc/umBJGtLQ6W1BtDZkcThCfUsq3dFLlEalKh6vuVShV0G6s+gzsb3
	7bFG6jyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1bS-00000006Lq6-2fKr;
	Thu, 06 Feb 2025 13:07:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1ZU-00000006LVc-1AQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:05:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0079F5C4C47;
	Thu,  6 Feb 2025 13:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423A4C4CEDD;
	Thu,  6 Feb 2025 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738847131;
	bh=rE1sy+FfaAGMIzwM8EZBoJ3Dv8Fmfq/jdRSMzL/N0zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=reHjMAq+muONPXIODduR0Z1IFIXihk/zEBurSpK6NU3cj6eHgP8XSkMWe8cgq16nn
	 2Eq9+Msb4OXBJeQBkgf+VIOZvprx3ykRrLqbhaEO5ZCa3VBDfm9H3ln+I8jlviwYml
	 L1q4qEZ5g4wo754Htix+d5qrmMaDXkxnW/DLpg3/Q0nhE9lpD1KWqjngA2k6+JghHR
	 kT1Tf6v2RRSWQjphLkxr2B6m5IpfUeKhG/wy+SOzOlXYIv8pfQGOt4jMgWxx5qM3ps
	 9H7D98c322tzHKBc32/i4H11zTyWs0Kj6tcQrED0+JvYrlRK71DoP05bz/dxEEqesn
	 Bz58iDr4nW08A==
Date: Thu, 6 Feb 2025 13:05:26 +0000
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Handle .ARM.attributes section in linker
 scripts
Message-ID: <20250206130526.GB3204@willie-the-truck>
References: <20250204-arm64-handle-arm-attributes-in-linker-script-v2-1-d684097f5554@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-arm64-handle-arm-attributes-in-linker-script-v2-1-d684097f5554@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050532_404878_190534A5 
X-CRM114-Status: GOOD (  20.17  )
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

Hi Nathan,

On Tue, Feb 04, 2025 at 10:48:55AM -0700, Nathan Chancellor wrote:
> A recent LLVM commit [1] started generating an .ARM.attributes section
> similar to the one that exists for 32-bit, which results in orphan
> section warnings (or errors if CONFIG_WERROR is enabled) from the linker
> because it is not handled in the arm64 linker scripts.
> 
>   ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'
> 
>   ld.lld: error: vmlinux.a(lib/vsprintf.o):(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: vmlinux.a(lib/win_minmax.o):(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: vmlinux.a(lib/xarray.o):(.ARM.attributes) is being placed in '.ARM.attributes'
> 
> Discard the new sections in the necessary linker scripts to resolve the
> warnings, as the kernel and vDSO do not need to retain it, similar to
> the .note.gnu.property section.
> 
> Cc: stable@vger.kernel.org
> Fixes: b3e5d80d0c48 ("arm64/build: Warn on orphan section placement")
> Link: https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Discard the section instead of adding it to the final artifacts to
>   mirror the .note.gnu.property section handling (Will).

Thanks for the v2. Just a minor nit:

> - Link to v1: https://lore.kernel.org/r/20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org
> ---
>  arch/arm64/kernel/vdso/vdso.lds.S | 1 +
>  arch/arm64/kernel/vmlinux.lds.S   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
> index 4ec32e86a8da..8095fef66209 100644
> --- a/arch/arm64/kernel/vdso/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> @@ -80,6 +80,7 @@ SECTIONS
>  		*(.data .data.* .gnu.linkonce.d.* .sdata*)
>  		*(.bss .sbss .dynbss .dynsbss)
>  		*(.eh_frame .eh_frame_hdr)
> +		*(.ARM.attributes)
>  	}

Can we chuck this in the earlier /DISCARD/ section along with
.note.gnu.property? i.e.


diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
index 4ec32e86a8da..47ad6944f9f0 100644
--- a/arch/arm64/kernel/vdso/vdso.lds.S
+++ b/arch/arm64/kernel/vdso/vdso.lds.S
@@ -41,6 +41,7 @@ SECTIONS
         */
        /DISCARD/       : {
                *(.note.GNU-stack .note.gnu.property)
+               *(.ARM.attributes)
        }
        .note           : { *(.note.*) }                :text   :note


Will

