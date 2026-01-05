Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69DCD0425
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+GTpRiUM+/ggPCREhaDVp84qP9r3baOmAsUZG91WP0=; b=4WXhyg+/ll+Fo2RLHbzGnnzx5b
	pYGMiaTmmUuWNT+NNF86vyzJYgBgQ55Kx7kUdgv6F2DcwEjp5xVwom++ALcFsAmSJN4BPJRxZSDrQ
	VEgveyUc7ceQpQym9Yf/zDb6FcafcgsBG0SolMxgc7wjXmlmCKsOp/s9Y0YmZL40XguXpil81WWeW
	8a7zj4sOkwuxXvO+Nsvi+NoC05F0b5QhtXk6iM388DnlGILtovFCTPjXyIckWhc0+lFu1rR+cgxJF
	zuV74K3Vg6NGuex0AtxIIBTW00Vv/aY59fVWUeUp0aE8A1YcKtZapQP9yjSU+4tnlq0/P6vfAKE9E
	Ay4wNr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXE-0000000CCp8-008k;
	Mon, 05 Jan 2026 22:58:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXC-0000000CCoQ-1w1B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:58:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 277C040217;
	Mon,  5 Jan 2026 22:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E59C116D0;
	Mon,  5 Jan 2026 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653926;
	bh=I75yBkyRZFLocoE/u51IEgfXbNSVrc/zHh5vjuWZwpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXNSeifYz813CLe1GeFmNGfCX5t2eaQzTkz6RS98k6tl9CDHvlO2Kd895HobyzOPe
	 WPH7JbkyXXegYe+MVkR7mP5cQSv7mKhk4bevY+Muqlri+3CsBbhJ9nYzbYcxbPlTkl
	 XZrT0OSVxu+lZWxT23pTWFpgNypGvHwo0DAWQXea07iS+PF+l+9dW9T4iv+dVStueB
	 ttCrj2jUVDXya9plVK59DoBFiifUtleG5JUSidjrfHDM78l77cQRSaZaIOqA0Jv/O8
	 CE95OcsiFyL908v1PF2rL8jDqa+vqIh5QEQvFuNc/GrK5cdJUwNxnEoDTG/8+bbfhm
	 GoQMFp9mUpvxw==
From: Will Deacon <will@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@aa.jp.fujitsu.com>,
	Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5] ACPI: AGDI: Add interrupt signaling mode support
Date: Mon,  5 Jan 2026 22:58:21 +0000
Message-ID: <176764598538.1443384.12447831892240359560.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222065359.27330-1-fj1078ii@aa.jp.fujitsu.com>
References: <20251222065359.27330-1-fj1078ii@aa.jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145846_523548_FEDA01C6 
X-CRM114-Status: UNSURE (   9.01  )
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

On Mon, 22 Dec 2025 15:53:34 +0900, Kazuhiro Abe wrote:
> AGDI has two types of signaling modes: SDEI and interrupt.
> Currently, the AGDI driver only supports SDEI.
> Therefore, add support for interrupt signaling mode.
> The interrupt vector is retrieved from the AGDI table, and call panic
> function when an interrupt occurs.
> 
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/1] ACPI: AGDI: Add interrupt signaling mode support
      https://git.kernel.org/arm64/c/9296d4fd190f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

