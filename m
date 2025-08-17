Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B86CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NnjoaUrv4zdmCQxJb3vMzSGFyP3tOI/u/3EG1PMtlg=; b=mSORGIV7g3Gd5f79XEn2xRTHiZ
	MvqwlOSozbrtS14LU4PPeZYKg8LpWfdZh2fIuSc+/6SLDlu/dTSxcIEPYRzlMDMaQbb8Jti053yud
	Lm/sQ/8ZJN2y0txcBHzqZlZfdNuoo9GvJbiskltERUenNnuHfh6pC+pRFZkfRZPfODJ6QC3yVlBMB
	GT3LmEs0aU2M6NqNimuWEF9bEBfwiQTcQy44HQ2Xzr5STFvoQdegaXEkPpvmZRsMAD4G2DKhJW++o
	n1DjXis4WezMBMRfj7kEmCLzMJuo4lb4Eb9SQdRf8KMo05N3pSS3j+aYNWU77kYx3AVLJ0ima1mjv
	g2TkCbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unkkJ-000000063pG-1PWI;
	Sun, 17 Aug 2025 21:16:55 +0000
Received: from mail.cock.li ([37.120.193.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unkhj-000000063hG-0OLk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 21:14:16 +0000
From: kemal <kmal@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1755465247; bh=2NnjoaUrv4zdmCQxJb3vMzSGFyP3tOI/u/3EG1PMtlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=At8x+lbKHKAPu3YkGWP4z+WIFgRLmAVEn8Mo6p1Yvgo5xWWiR/QTR/6pOAORCkOiW
	 N0OjDpfrFZq49uj6sLrva8orKsdsWdWsKE4MfCUxmNDHl0P+pRO3oJaSAzcXxSnzCK
	 Zd865AwmieP2l0NLjSWRXuZsOnVqBizLdJNJW4bDsaJrd18cU9fwqR/u/ovZkOoizb
	 qiGt3hHzQzbvjcwv8XH3JPls6TI4uamP/h0Oc8FgtxqMUZ27gDCkuFAKpEPvz8SIzJ
	 TPMKS0YZsPqrXi8IAz62dGAxgGq5hwK9Eu8BYpIG6Z+rRkB+iUWwOzEmPkH8YzXKsp
	 94b8lk2Y7zXgg==
To: ruanjinjie@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] arm64: entry: Convert to generic irq entry
Date: Mon, 18 Aug 2025 00:14:03 +0300
Message-ID: <20250817211403.31054-1-kmal@cock.li>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815030633.448613-1-ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_141415_670879_2978A532 
X-CRM114-Status: UNSURE (   8.92  )
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

Hello,

> Since commit a70e9f647f50 ("entry: Split generic entry into generic
> exception and syscall entry") split the generic entry into generic irq
> entry and generic syscall entry, it is time to convert arm64 to use
> the generic irq entry. And ARM64 will be completely converted to generic
> entry in the upcoming patch series.

I was trying to implement syscall user dispatch support for ARM64,
which is simply about converting arm64 to use the generic entry, and I
stumbled upon your patchset on Google. So I decided to write the code
for generic syscall entry on top of this patchset, and the code seems
to be working. (It boots, and SUD works, but I didn't test ptrace etc.)

Should I send the code here?

