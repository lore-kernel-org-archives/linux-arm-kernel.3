Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2581ACAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT5t6ucLqo2+WWLHTFlQ7Kr4Iv/gKjrmOLnc/cG6P3U=; b=pQvKqYyql68GxXbqZGN7OjxEP2
	FM/umDte0wiFiiDoXEYw7g1xFw2NoEwCrAl2UzKtcm/yboeyocNMn8cxlGNZjTdotjyj6jzETnTlp
	F3P/B+hOLzlALLSGCPU9sXN/RXWJCY+F6sKfvJFFdOZLINnorIgNBoFM0b3nWVwOSpfX2n9truKtf
	PVHkizVCvD+aQ1HHfXl6vZaQOL0rfwezd2gSL3b6GliQC9fFlstC6FqqUMWjWzDB26xSopbuBIOaa
	uN3LUFTxNcZfGNBG/0Z9DUfzewauiIi+JEfEtc1cnd+mcubU887fJXA5bfUdAORi7A2xOjocWh5kH
	CR1Q0hnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuJJ-0000000Cpdn-1CwO;
	Wed, 17 Sep 2025 15:43:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuJG-0000000CpcL-2ua6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:43:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FF0340751;
	Wed, 17 Sep 2025 15:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F892C4CEF5;
	Wed, 17 Sep 2025 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123786;
	bh=CrTcWSmw57vJDB60Q5vonaC865reIzum69JAsoQCNPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jop6rJto9GEsm7cFXyzefBfFgQAn0sfHoO+ZiQgz2Avl+ct+g2MyCb0TajI5KM2c4
	 cK+yR8+1cFAKPkcBF2XqvCYSV1L+S8hk+Y1OjTweGUmQnqP4Nwv/xXBpwcAzu1UFks
	 WDjTdp6sU18RmauydJJbFSD9R/bpVUfEfuLU0obc6epH1xXahmszVwnBjVDJTjrMQn
	 ZHG0PgHfFiNAoHYPmiNjkH+rUzw8qAMUFlZjvMTO6o6F9YOOJsXaYXO2KtIiZsqMo3
	 HrmRBYe1bhYrP8NaYMoYNczpyRv640lt0Lt+LI5ylXx4AOC+YWauZ+mL8178jzkzwO
	 /4GLfmjiNMJ+A==
Date: Wed, 17 Sep 2025 16:43:00 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, ryan.roberts@arm.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
	jthoughton@google.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aMrXBArFNLTdwWs3@willie-the-truck>
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aMk8QhkumtEoPVTh@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMk8QhkumtEoPVTh@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_084306_749345_02436084 
X-CRM114-Status: UNSURE (   9.30  )
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

On Tue, Sep 16, 2025 at 11:30:26AM +0100, Will Deacon wrote:
> I'm currently trying to put together a litmus test with James (cc'd) so
> maybe we can help you out with that part.

Here's what we came up with. There's not a good way to express the IPI
from kick_all_cpus_sync() but it turns out that the ISB from the TLB
invalidation is sufficient anyway. Does it make sense to you?


AArch64 ptdump
Variant=Ifetch
{
uint64_t pud=0xa110c;
uint64_t pmd;

0:X0=label:"P1:L0"; 0:X1=instr:"NOP"; 0:X2=lock; 0:X3=pud; 0:X4=pmd;
                    1:X1=0xdead;      1:X2=lock; 1:X3=pud; 1:X4=pmd;
}
 P0				| P1				;
 (* static_key_enable *)	| (* pud_free_pmd_page *)	;
 STR	W1, [X0]		| LDR	X9, [X3]		;
 DC	CVAU,X0			| STR	XZR, [X3]		;
 DSB	ISH			| DSB	ISH			;
 IC	IVAU,X0			| ISB				;
 DSB	ISH			|				;
 ISB				| (* static key *)		;
				| L0:				;
 (* mmap_lock *)		| B	out1			;
 Lwlock:			|				;
 MOV	W7, #1			| (* mmap_lock *)		;
 SWPA	W7, W8, [X2]		| Lrlock:			;
				| MOV	W7, #1			;
				| SWPA	W7, W8, [X2]		;
 (* walk pgtable *)		|				;
 LDR	X9, [X3]		| (* mmap_unlock *)		;
 CBZ	X9, out0		| STLR	WZR, [X2]		;
 EOR	X10, X9, X9		|				;
 LDR	X11, [X4, X10]		| out1:				;
				| EOR	X10, X9, X9		;
 out0:				| STR	X1, [X4, X10]		;

exists (0:X8=0 /\ 1:X8=0 /\	(* Lock acquisitions succeed *)
	0:X9=0xa110c /\		(* P0 sees the valid PUD ...*)
	0:X11=0xdead)		(* ... but the freed PMD *)


Will

