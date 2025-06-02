Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAABC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQvLHfHXUGBLwkIeWHYUyQX4wyC4f3t85/bPeF8ukBk=; b=v5G+5vn/XBchgiZhjxSbYRzEor
	NkBMzvvYKvSEYPe2g6/5KVZHXx7QRhY1/y1oY3OjkU5dDT5VqOF33mihjtoBEatHtnckTd3M9wMpz
	N9pbS7I0JO1Pji9VIbMrrE15hxRm7wJdwjoAAKS7OFYgOhgYEjXFidHLYbsa8/cHDe+du9wjb2KRN
	nF6Om+p12tXpjbvdBJrrlCTR8m4mu3kH9JJK5tVjJyOc0cgOq+Z1uBep3CVhDrQGJQFPisAhvi8j+
	LFwrMLyptWIsm1qfe+YkcZ8JnNckoP+iKEu1hgSd9oXhP30A8Imquk8dGIcCsG9T2XJabAhEs/CGa
	Ch1AH9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5ZD-00000007W6Y-3kQa;
	Mon, 02 Jun 2025 13:51:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Qg-00000007Uvj-1ajR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9E655C5D1F;
	Mon,  2 Jun 2025 13:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D6DC4CEEB;
	Mon,  2 Jun 2025 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871737;
	bh=QGP116vocQSl0XnSlDwq9B8Uh09Tx/0uFirdqmSCerk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vhted7lwJWdHYWPPoC+r65ItQeB21VPbcME3yg5VqfPf9Qr/yJGrNpMJVYqKY/Q0J
	 9vzjpLmhOOBmeFWwEwMcMjsH0WfA+nIZkxjJy1VeUIzOX4a53PKwQRi1egy5vp/EZE
	 v3a/yv5CsfsxPhNy9U+WO7wXA+cMSjBbV2+DqZvLwMqHTWPIuUeE2EAFifyY5ckZjA
	 Z07E7YYvEnbRNdDAS5nqFaCmLQWo6L02tBQ4Qm4u3YY60ZDUDxGWSeAz8ovUBFGCv1
	 uYDrAc5WE1SJ8fi3LXBL62bjtzl95dFUoM96vReCcwzte4bfp9giHRX3TmRY6ypmo1
	 e1X9sV0nvcFuA==
From: Will Deacon <will@kernel.org>
To: James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Xi Ruoyao <xry111@xry111.site>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: Re: [PATCH v4] arm64: Add override for MPAM
Date: Mon,  2 Jun 2025 14:42:05 +0100
Message-Id: <174886855062.2951814.2307723986328064576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250602043723.216338-1-xry111@xry111.site>
References: <20250602043723.216338-1-xry111@xry111.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_064218_456239_C9DBCCA7 
X-CRM114-Status: GOOD (  11.55  )
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

On Mon, 02 Jun 2025 12:33:21 +0800, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.  While upgrading the firmware should be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.  Allow
> overriding it so our devices don't become some e-waste.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Add override for MPAM
      https://git.kernel.org/arm64/c/10f885d63a0e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

