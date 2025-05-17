Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A11C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpIvoovaLHQgEEEBmEzf8Pj9rIFdLD6mZz9+mU93GAA=; b=oim+lOqBpkIt3slfsptSRVqMVM
	oGrxfa3Il1jUOUpQb76PrfJpEZGudcg6sRbWULDUG10jzF2Ey0EgfzQ8GmYq/UDdTvbk9TphjLHwD
	t9YPIq4FFKoEEa/3cUU69OytcfcVr507ttTIehIdQxgWCsdwO7PS2LM4JEB3cKGuj4RZDtPKtU/gX
	HCAu2Az3PyImk2oufXWJ8s3BwSBbVvEdGM7qtNk3lLadG81CL0zvjxS+lNuxu91nMpxRZJDA4cwwd
	MBhWM7J57uRQ3F9RtaIO338R1sj9DnRTt3gSwIPvq3XaTdoLpmT8utmqreQ0mUqLctIXV6NzB9ysn
	FkayZxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGF9s-00000005a07-48Tg;
	Sat, 17 May 2025 10:52:48 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGF7l-00000005Zcj-28MP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 May 2025 10:50:39 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00Lw4Q8Lz9sWd;
	Sat, 17 May 2025 12:20:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAQGIddjf2x1; Sat, 17 May 2025 12:20:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00Lw3gtmz9sVS;
	Sat, 17 May 2025 12:20:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 778DB8B768;
	Sat, 17 May 2025 12:20:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LHtpXwaBRXOP; Sat, 17 May 2025 12:20:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 40D948B763;
	Sat, 17 May 2025 12:20:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAK3Eq013312
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:03 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAK04l013287;
	Sat, 17 May 2025 12:20:00 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <kees@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sean Anderson <sean.anderson@linux.dev>,
        Camelia Groza <camelia.groza@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qbman: Remove const from portal->cgrs allocation type
Date: Sat, 17 May 2025 12:19:35 +0200
Message-ID: <174747706460.12970.18215881041765719309.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250426062040.work.047-kees@kernel.org>
References: <20250426062040.work.047-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=823; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=hNTrwDECXwzB0w5bCYwkYV4UpWwqz6HdVtTVORZF/Fw=; b=mFKsjfXcvpGeGE31KGr09d6oDBkiSjZI94a2MDnCQHBHukcnmeqcKT4xhZFmPL+AOOsVnsPBU ZAVkzoD/un4B/P+9R6d8wR5yHjP/i80Y1UZC5JifRFWXwlPuejDEQbq
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_035037_706044_D2150834 
X-CRM114-Status: UNSURE (   8.88  )
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


On Fri, 25 Apr 2025 23:20:41 -0700, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct qman_cgrs *", but the returned type,
> while technically matching, is const qualified. As there is no general
> way to remove const qualifiers, adjust the allocation type to match
> the assignment.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qbman: Remove const from portal->cgrs allocation type
      commit: 5ddac92be4209f29ec26b3ec59a08fc76afe9ab1

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

