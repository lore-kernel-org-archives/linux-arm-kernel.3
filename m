Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF9C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5x59HniqPBqKKUIe7KYWznQqiJ8WVEBPJBvvS+VQjM0=; b=O3F/Yc/YM1WCTIZ4tgjGZnIRph
	7CLKTAB24qB8ANkaIAznvsCXimvPgG/GXhMeVEyAHpDZGzJtQknOEIHKzLSBHeEIcU5t+NGHA1gf7
	oOEq+iy2KCmP+0F6O4jhqrAo8amI/j+gtI0jwNRgR283SEq/JJhrPDvtITH0XxghBb0jZ3iYCsu7n
	m8G7l2l2oL3G/ztGeUy0QEkoYXoNcdcaISemsfJotKfBK0b4a8ev4Fr9bUOc1aomqjElEr6HdpMLL
	L//BNYKsugpsv9mdRqT8ACp5eu4ldPJ+fgzOV518goJYgST/HFZwnTriDxSNtQtG5qZldSat7PPdM
	e7aetbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjk7-00000008ZZn-4Bj1;
	Thu, 27 Feb 2025 19:40:26 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhGm-000000089xV-3wnM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:01:58 +0000
Date: Thu, 27 Feb 2025 12:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740675714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5x59HniqPBqKKUIe7KYWznQqiJ8WVEBPJBvvS+VQjM0=;
	b=Kera79ZW3++yznfu3mAeSIAL6eOLHyPpNcGQKzcrdDdDb73e2Fh0TwnZ9Yq00rcKdFJNFQ
	5z1fb483MJ22YqTgDZOzt3kjh4/VwlPwvfvNt3VtNAoygbgrzMJG1iq206e4g+LgyCkZRi
	eomuOu1bEz4CFNaQfLF84y/U8KV1kvVxWDiAhcrDLrtTauVh7hLBJ/ZIQJeTKCHsddI1zI
	oKodu9pwXf6cr01Udyk0uXEzbjd/TdgQmHGwCp37InptMozO5CwDZkQ0Kn2HZ592bfdEFs
	321icTewVkrwRzENiVe6VErW1A4HQJ3TpaGfyVtncVF0tST5jW1zUP2XoiMdGA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/2] iommu: apple-dart: Allow mismatched bypass support
Message-ID: <Z8Cae58jLqcGwF8S@blossom>
References: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
 <20250227-isp-dart-v1-2-161e91ef4f46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-isp-dart-v1-2-161e91ef4f46@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090157_441377_736F5D53 
X-CRM114-Status: UNSURE (   5.93  )
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

> +		/* Will be ANDed with DART capabilities */
> +		cfg->supports_bypass = true;
...
> +	if (!dart->supports_bypass)
> +		cfg->supports_bypass = false;

Probably better to write

   cfg->supports_bypass &= dart->supports_bypass;

To match what's in the comment!

