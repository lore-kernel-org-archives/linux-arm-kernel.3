Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D20CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/go128rmErNISgmXs9cmoyd/VORO9f4PkvOsc4cy53U=; b=nnQ2RHSvqVR/dE+funi0W62SJs
	djDrVq0+cJ+KBXWg0mM6T+iDHI7EpZCSN10mm+8A2G6U1YC1RoqeCMMHwe4I92vcOiMm7GGUD3Vfq
	LpY7ueFOCJ4emwNJ56mCWAOEaUHWOpSsd8VF9fxb+rg+YtAISKjhQ6Dpw6Fgl1IbeWTay+UEMzR6U
	IUFZkR5SywO40rVdMSYwbqHf4P7NXgAqC4ppM8VQjb/bVcHK5GG1+DMqeSWkSOzrp1nTnqdgCQ7Ej
	OvxexIwKPRsnejveAnUUreLtnNIQtHKro4EAD2NW0lsu1S/MHdpL7WEOHOTxptDdDEIvoQ07gBB+S
	STJ1YSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlL-0000000AM6B-2cx2;
	Fri, 12 Jun 2026 04:44:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtlI-0000000AM5s-3yUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:44:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3C722E91;
	Thu, 11 Jun 2026 21:44:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E073D3FAF5;
	Thu, 11 Jun 2026 21:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239493; bh=SQA3Q3+/82oh45oJTME91UR/PdPgdrsuA9Fdpn4kolY=;
	h=From:To:Cc:Subject:Date:From;
	b=C5jJ/wIWZzhIUGdGO9T1hGV6rroAbSN3pDV9MfJilf8tLHrAckiL0S/LKO41BXhZH
	 TcYl95kWuiBGL2H9XMsb2TGyjHPdch3DNT1yTG9y+K52Dm55IzVzSy+Ru4qjMsWBbB
	 MevnQMAJu19h7w8r6XSGIR3dzkoJ3W1yPt0WeTnE=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at allocation time
Date: Fri, 12 Jun 2026 04:44:22 +0000
Message-ID: <20260612044425.763060-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_214457_148578_7201D7F3 
X-CRM114-Status: UNSURE (   7.92  )
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

Introduce a boot option to tag only at allocation time of the objects. This
reduces KASAN MTE overhead, the tradeoff being reduced ability of
catching bugs.

Now, when a memory object will be freed, it will retain the random tag it
had at allocation time. This compromises on catching UAF bugs, till the
time the object is not reallocated, at which point it will have a new
random tag.

Hence, not catching "use-after-free-before-reallocation" and not catching
"double-free" will be the compromise for reduced KASAN overhead.

This is an RFC because we are not clear about the performance benefit.

Android folks, please help with testing!

---
Applies on Linus master (9716c086c8e8).

Dev Jain (2):
  kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
  kasan: hw_tags: Add boot option to elide free time poisoning

 Documentation/dev-tools/kasan.rst |  4 +++
 mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--
 mm/kasan/kasan.h                  | 23 +++++++++++++++-
 3 files changed, 69 insertions(+), 3 deletions(-)

-- 
2.43.0


