Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnG+0XDws3NnDGYdrEF+fT5VwwoGblIyqeGEyFrxjhA=; b=lQH2LK5Pyjsqh1Yijaqi9kjrFJ
	DzOsBJye16BKcPsmBeFot8DDNCd8ddlp5nthoWsKzKGEEt9HFX7Ks/43NOEMSd1fIinITbu7J47k/
	7NP89TAXWFd9fXNJeRlngEnnhO7xBCWMKPPil+8NJHvyUfWdQOAAn8wQ1RXGpTlJv0aiF0b7Qeu+b
	35953pF5KnY5xN278zSBEsa8qWVfTv4+onlaLVMxNPTMy2CZWSJZmSMKx3n1xrgrbls+34eLjOstc
	w30ovcORFjnMUBOeNtE8sOicHPVOkX1b5VExUEbyjLP2GqW6E8DXmqwaTQVV14EKBbb1vSF0CYfWm
	Qx0fOUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKw16-00000000762-1PO0;
	Fri, 30 May 2025 09:27:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvyF-000000006ji-3c0Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:24:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ED8416F2;
	Fri, 30 May 2025 02:23:54 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF2DC3F5A1;
	Fri, 30 May 2025 02:24:04 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: dev.jain@arm.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	steven.price@arm.com,
	surenb@google.com,
	suzuki.poulose@arm.com,
	vbabka@suse.cz,
	will@kernel.org,
	ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	anshuman.khandual@arm.com
Subject: Re:  [PATCH 0/3] Enable huge-vmalloc permission change
Date: Fri, 30 May 2025 14:54:00 +0530
Message-Id: <20250530092400.19586-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250530090407.19237-1-dev.jain@arm.com>
References: <20250530090407.19237-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_022411_937864_259E0038 
X-CRM114-Status: UNSURE (   3.64  )
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

Brilliant, after running get_maintainers I forgot to Cc the
most imp people for this :( +Yang and Ryan, along with
Anshuman.


