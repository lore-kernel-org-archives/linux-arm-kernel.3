Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173C8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQPymT7DNMnjyCVx21Yl46BqrLZSkSJWkjcpXnWXL4k=; b=qe0fKGbUfSGoY3VhTnatOwrDh5
	y1PRNjNm21btJzX5piQuol+vMThoO93rD0QEgLtpAlTjlUoeEOQ10N6zVE5N9anAmvwFPIBz1z+GS
	X6asn3fgx1WLOn4C9YKUqjo0ZreEaDjh/3j+JWqUdMMYJqa5+9XEUIZ76psOJncw4CIGePVKdEqhT
	N8dGsjwKHNbke2g2Hx+smByokF1TzBu0B4tAxKbqZgx4uZu6lbwF80wOsH7WslrT86KYvHXfVPU61
	mkrVIpljF5Ru2JE0E/0oVlPhBQVlxT1vqa5uoCmKfF4u3GC8s4lEjSPPnT4xzSOMqpnb8SVc9fHZE
	o9aTmSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9xz-0000000F35p-3CQ7;
	Fri, 14 Mar 2025 18:41:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9uj-0000000F2ky-1mvw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3ABFA4884D;
	Fri, 14 Mar 2025 18:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0F7C4CEE3;
	Fri, 14 Mar 2025 18:37:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH V3] arm64/mm: Define PTDESC_ORDER
Date: Fri, 14 Mar 2025 18:37:39 +0000
Message-Id: <174197745246.735540.15365076503205188211.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311045710.550625-1-anshuman.khandual@arm.com>
References: <20250311045710.550625-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_113745_527564_51518499 
X-CRM114-Status: UNSURE (   8.33  )
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

On Tue, 11 Mar 2025 10:27:10 +0530, Anshuman Khandual wrote:
> Address bytes shifted with a single 64 bit page table entry (any page table
> level) has been always hard coded as 3 (aka 2^3 = 8). Although intuitive it
> is not very readable or easy to reason about. Besides it is going to change
> with D128, where each 128 bit page table entry will shift address bytes by
> 4 (aka 2^4 = 16) instead.
> 
> Let's just formalise this address bytes shift value into a new macro called
> PTDESC_ORDER establishing a logical abstraction, thus improving readability
> as well. While here re-organize EARLY_LEVEL macro along with its dependents
> for better clarity. This does not cause any functional change. Also replace
> all (PAGE_SHIFT - PTDESC_ORDER) instances with PTDESC_TABLE_SHIFT.
> 
> [...]

Applied to arm64 (for-next/pgtable-cleanups), thanks!

[1/1] arm64/mm: Define PTDESC_ORDER
      https://git.kernel.org/arm64/c/51ecb29f7a65

-- 
Catalin


