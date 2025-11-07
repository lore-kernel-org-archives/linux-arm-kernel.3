Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F85CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LVrY8hEMW3dd5Z7rGEnvxZhEh6jLwG/2MWRpn0iONU=; b=srYuKeinuHyu+8cr44EC8a/dZ3
	VxcjPq9zbo/+K5euMgWAWcuUEkVKqBf0PxC4JaV5w6gQsU7j3c9USV1Zn2m7T9h9MW7bMUptdnJmm
	AB1SkvMkEnF/SwmJGCZRzarWrSl4Iz3U5ST/niSVGQAkaBRQehEYf8sws3lm8Hc60RWNTHNawBSUH
	MM2+V29IVOAGSYFKYDGZC8bCLy2yus+QeAz6iBYi4bi00zAFZksivHkAuJUOLfNusf6LU6882WuDv
	A/KTcmYPhg7bTBKNWVMurYhYGEjrHoHVCvchZtPILiKTlr2cQ/D/7+adG6FPnSirzlp0Xsk4vrA5u
	+/Nlj+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmr-00000000119-2HB0;
	Fri, 07 Nov 2025 15:54:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOmo-000000000zK-3Yb5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87A5E40557;
	Fri,  7 Nov 2025 15:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF71C4CEF7;
	Fri,  7 Nov 2025 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530842;
	bh=lQKtc6BdFbB7ZvGXIikc/Mmj5z9LnBKsOwLvwGnv1pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XRnwBL5s5J7coCWXOS2ZQz+cPHxb2arH6z9tBdk4nXvzFBK2nbiMjmODvznt9wLjH
	 kWJmp4PDF2ITpH5j3+vf0iV1d0FEYzfzpYpH7ckRY/oFSIQ4DOitXHGm3LeIRr1FEa
	 7Z/IdRO+HolNN4l71GtpCFUohxtNiF0hds4r726sz6+9hjMVeMxL7rWUpBgWnvN6Hb
	 kM/sk1oZLtPZdfSoKiGNDzR+9Ex1jh5kFXuZgch9uhiV0/3l/9Pi+JwjTcxyifHNW+
	 fDBcc852IkLdpdgAQi/UMq0k0JgvrTY21I3yA33aQ7wk049u7CXyy2c3DABvulm4nU
	 F3YUNQZR79Z2Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Punit Agrawal <punita@qti.qualcomm.com>,
	chenl311@chinatelecom.cn,
	liuwei09@cestc.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: acpi: Drop default console log message when using SPCR
Date: Fri,  7 Nov 2025 15:53:44 +0000
Message-Id: <176252541421.592251.6144901758020788544.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
References: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_075402_905907_6B306B1D 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, 31 Oct 2025 11:11:36 +0000, Punit Agrawal wrote:
> Based on feedback, I've updated the original patch[0] to instead drop
> the default console message when using SPCR.
> 
> The first patch reverts the incorrect assumption about the return
> values of acpi_parse_spcr(). The second drops the logging.
> 
> Thanks,
> Punit
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
      https://git.kernel.org/arm64/c/eeb8c1989695
[2/2] arm64: acpi: Drop message logging SPCR default console
      https://git.kernel.org/arm64/c/7991fda619f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

