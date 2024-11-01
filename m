Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B4E6F073
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y07SB1TuXdL795s5ElJ7O8+eAoqssEVD+WBZMB5y8D8=; b=qnkZx0+GKCs2iSlVK8uQxLbCwi
	0I9wnfvy/siBGK8OnnmSL2AujIuJ95pS1vq9ffmRQHVYAdGsm9zsajHpLx42xI/nbv+GuRfNVgMDd
	yEpCQGhlD+iVSfVpnSEfvtigiQBpOqHZRtyB6JujvDQNDuXqEgjxJIM3uT7/XsFT2f6DWkwM9BUQZ
	D+mUllJBQHpsctEzvU4PebJr6n7l+G+ACYvYGJlW1B+QG8FLPFVP/3z88KZv2TIzkWdqsGCI8inKJ
	2Jc8ql0Hye5qo/KQHqY9um9VSMDQQZU8R38hYxlYkOcpHUQtKY4XCXBYtsivbHoSZRmMgl78985UP
	Ll9B+IGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vc7-00000007rjX-34HL;
	Fri, 01 Nov 2024 17:39:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vZO-00000007rK4-0PhD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99D06A43F6E;
	Fri,  1 Nov 2024 17:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C98CC4CECD;
	Fri,  1 Nov 2024 17:36:19 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: mark.rutland@arm.com,
	will@kernel.org,
	oliver.upton@linux.dev,
	kristina.martsenko@arm.com,
	ptosi@google.com,
	Liao Chang <liaochang1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: Return early when break handler is found on linked-list
Date: Fri,  1 Nov 2024 17:36:16 +0000
Message-Id: <173048223688.1108539.1091476619283409059.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024034120.3814224-1-liaochang1@huawei.com>
References: <20241024034120.3814224-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103622_222644_CA829879 
X-CRM114-Status: UNSURE (   8.97  )
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

On Thu, 24 Oct 2024 03:41:20 +0000, Liao Chang wrote:
> The search for breakpoint handlers iterate through the entire
> linked list. Given that all registered hook has a valid fn field, and no
> registered hooks share the same mask and imm. This commit optimize the
> efficiency slightly by returning early as a matching handler is found.
> 
> v2->v1:
> Remove all WARN_ON(!hook->fn) in v1 as Will suggested.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Return early when break handler is found on linked-list
      https://git.kernel.org/arm64/c/9a0e3b92b02e

-- 
Catalin


