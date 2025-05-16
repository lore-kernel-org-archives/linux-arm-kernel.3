Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E6DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58NXwrm/gGbr1Kw6sR3XLKAtscB7PDyI/ZJiPhBlNgQ=; b=EXmsBu5kadrD7TuH532f4wjCK1
	1Z6g6TkMuDrgVheOdItRg3/k3FwnJbqQ+7p8ePzrFMT21tTBbAICZg8naXkBgY4uAlobaVHRmPovI
	oCHc4pU815h6CJZkDfqzh2GA3C4/Di9NWJS2JTGFZqjrcd0UjIUd4ssqO6MbMHfmBYfwt11w0UgoZ
	qcPjRdAXJ+oriw9/ItfBDh4rPalJWVXO5O/PHizcni/IXFpGHla/H7h6v/C0ZUIu0K7OYgFo/V7qx
	k75H3YF4SHNHe3BwbjrTBOspNLakJaqLhm7AsHUxktgi47Y9obfejoV1vlhENPZh1pi6j2LP/38aj
	OGPJBA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxY5-00000003xnm-2DLV;
	Fri, 16 May 2025 16:04:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8L-00000003sdW-3mhu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F8A25C599E;
	Fri, 16 May 2025 15:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5042C4CEF8;
	Fri, 16 May 2025 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409881;
	bh=jWNvYz+zqkaA7TqzGqTcYg2figdY5U1juqFUFBIhnks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSWKXFQjJHH6DqPAP2ki5ul6F3e3Tn7sIUDEVmsDMZ6wVehQ0p4YUaf2lMiHRYCaP
	 IAkOxSPYYBmZsjrOiMZt0GMNVtCJgUdw4zqfiejVqTUIISYHineeqslDLO7u96XEmU
	 pT3tomaMqHHOnWlV9VSD/t3McW5b5lIFQzfmuKKlfjij2cZsNhzoN8lbr2sZ/7A2W+
	 yV5B38ABa8s41qQ5G68JIvrNF2I6bCD7WsNRlKkoMPd2fbwKkt+FhFT2tNmqzDmRg4
	 27ONeR54uivYUhwxzP35JNHXRUcHa745uR6+XGxBJcZTxgwpEgKBVFRoRCy2qTu8MZ
	 0bySiFZUW7bgw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: Re: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
Date: Fri, 16 May 2025 16:37:46 +0100
Message-Id: <174740461415.2575604.10045637964283416849.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250508085251.204282-1-gshan@redhat.com>
References: <20250508085251.204282-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_083801_978220_053C5C7D 
X-CRM114-Status: UNSURE (   6.58  )
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

On Thu, 08 May 2025 18:52:51 +1000, Gavin Shan wrote:
> pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
> a positive pmd_val(pmd) according to their definitions like below.
> 
>   #define pmd_val(x)       ((x).pmd)
>   #define pmd_present(pmd) pte_present(pmd_pte(pmd))
>   #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
>   #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
>   #define pte_present_invalid(pte) \
>           ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: Drop redundant check in pmd_trans_huge()
      https://git.kernel.org/arm64/c/13c63ce35883

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

