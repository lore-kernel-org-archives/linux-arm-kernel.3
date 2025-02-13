Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43B9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIeMG9bs/dcz1kbPefEI+pv3QdBpkm4MIKpBoQkfy9A=; b=Fkoe/mZmIcKuTyslyjOaMmXrHf
	0XjEoh07ngY9+aEn9WMX68G3juSLlWZ4jyMzaZ7xCBLrqENfUpzTgIOGr/v4rzQbTwOpUHJ8SwkeR
	RJVEjcx8Jsv+aBgEtuD+v8hvMaK7s69B99O4RPdMQKbL9cLs+JAxahc0aBmkaDLH1KdJJGOiviC3x
	6LJz78lrlcrwj+NZA3C+EZ6OYyfuSuntirnP62r/fyFNaOqz1IcUCyHPq+/JkqDfIEpahLVIOFCYT
	/0D7PgEKyqz8rV2Bhgg6xoSkcBqulpTSxoTMfYjaNCG3c9yEFC3klVNmEy37kf5QmxHFm6OEAhUcK
	gSaVuMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZq9-0000000BFlh-12Ug;
	Thu, 13 Feb 2025 14:05:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZkN-0000000BEPT-0dUP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28585A42544;
	Thu, 13 Feb 2025 13:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D265FC4CEE8;
	Thu, 13 Feb 2025 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739455158;
	bh=+yOaOrU3SfpDJ08BIfLD5TlmYaKF+rtZSYB5MoqJ7iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JAwhYkup5eKlG2Xz6cQXi9HNC/yphKU1h/lW3n9rqNux8T2iM8CXW4RCb5NOGjjbR
	 PZWvmCdXQ+Jgt7079SBSvV/Fwf7aSoytMLIC88CBu2CAnOQvAJ1DuEZe155IBuJBew
	 UQsmwW8Z3XJ+na7FaxgZXDy6TCqhby7tBdP5BcuaUde4rPps/sbWdGJWDP8ZMndljR
	 iPwO3eBZG4l6wHuesirxe1+hhYj4dnYrUBDoel1Cttmg8ke0TFWhThvUtjUS0r9xpU
	 Tuyi7RtzcdtaydK8ZvxBSvAQGzje7kw7gOMlfXLP3wZK06asvU10m+jqrs84NRZ07x
	 ApWRLwUfiaa+A==
From: Will Deacon <will@kernel.org>
To: linux-acpi@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers array count
Date: Thu, 13 Feb 2025 13:59:04 +0000
Message-Id: <173944516851.2607091.1871789456035802538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250128001749.3132656-1-oliver.upton@linux.dev>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055919_256210_200546CB 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue, 28 Jan 2025 00:17:49 +0000, Oliver Upton wrote:
> Perhaps unsurprisingly there are some platforms where the GTDT isn't
> quite right and the Platforms Timer array overflows the length of the
> overall table.
> 
> While the recently-added sanity checking isn't wrong, it makes it
> impossible to boot the kernel on offending platforms. Try to hobble
> along and limit the Platform Timer count to the bounds of the table.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] ACPI: GTDT: Relax sanity checking on Platform Timers array count
      https://git.kernel.org/arm64/c/f818227a2f3d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

