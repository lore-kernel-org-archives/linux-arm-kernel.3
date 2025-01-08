Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E144E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UgRZVE5SmlfB7hv+1sPLQlVP4osoiiy3aJxt4yMsxc=; b=fQGfUFpYJcLsjlAKIVE1t2W07N
	vGVRITWC8pULX9sWHMYPizpPaPJc9Oliuxeca7H4RT/KYTUKDdKh6H3VreH4qG4rc7zBGutmN1Ond
	A0c7FZOkJGYEr8OHt1kWeHdNiUBfDzq5I9zYPDWBfGzHJ1O0a2ar22ivIfwxr/F0XBhEM9xPFRuGA
	k4EE4LCu/rp8lI39EsNptpf9efJ5ONeOXK9sqM8yn9rVhOMUq+AaiB83X/r6wIMzzA4OsURW/jMgg
	Tl02gPc5+cuLv5VcysMtxdbCSQN0Gect/CpSShsQ3rKO5wcMK51XMasNzojsdQw5UbIVjzRbdmjt9
	z6kRQWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUvq-00000008NG3-3NO2;
	Wed, 08 Jan 2025 12:13:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUGb-00000008DNL-07Rc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BF855C04BD;
	Wed,  8 Jan 2025 11:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4DCC4CEDD;
	Wed,  8 Jan 2025 11:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736335828;
	bh=HUdFC7Hf2pRtsZcJxVfCVEoY1Puhr6jHWvWn6H9ruzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6MlDSuadJi/y6lmLBuKQ6Ir6CB8/QwDVNr+geV71IC0dG8K2RwbvobNb/N4kZ6gb
	 +ioUBzDYibCPRoQvDWCeuF7pda3P84eZrFQ0wIErfW5ue90uByGA9TtK5D+j5L5S8Z
	 +btE5UL+8aRZ2o7R5dz/ecoWgLA0JfVx0nit8jrjmnaJ8SPZI0fRlfhPOeMOvBXSVc
	 Gfki7iT0z3a7uyw0srndTodh3gDpRY30nmrsbp+L6m+WLLOuOox2Twlht1LHeR7anG
	 PC32MxhzD6INlRrWj3BkMLjVrJ6HahYbM1JP0zLFj6EhPrkM4qW5ynJqCiHtmnE6Sg
	 gUTKulsKRzixQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tVUGX-00A7ZH-Ej;
	Wed, 08 Jan 2025 11:30:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: will@kernel.or,
	broonie@kernel.org,
	mark.rutland@arm.com,
	Kalesh Singh <kaleshsingh@google.com>
Cc: kernel-team@android.com,
	android-mm@google.com,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Wang Jinchao <wangjinchao@xfusion.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	"Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2] arm64: kvm: Introduce nvhe stack size constants
Date: Wed,  8 Jan 2025 11:30:19 +0000
Message-Id: <173633579711.13074.2906615105628133376.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241112003336.1375584-1-kaleshsingh@google.com>
References: <20241112003336.1375584-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: will@kernel.or, broonie@kernel.org, mark.rutland@arm.com, kaleshsingh@google.com, kernel-team@android.com, android-mm@google.com, will@kernel.org, catalin.marinas@arm.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, ardb@kernel.org, scott@os.amperecomputing.com, wangjinchao@xfusion.com, ankita@nvidia.com, andreyknvl@gmail.com, puranjay@kernel.org, madvenka@linux.microsoft.com, rdunlap@infradead.org, ptosi@google.com, bhelgaas@google.com, ryan.roberts@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_033029_109421_C795595E 
X-CRM114-Status: UNSURE (   8.18  )
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

On Mon, 11 Nov 2024 16:32:50 -0800, Kalesh Singh wrote:
> Refactor nvhe stack code to use NVHE_STACK_SIZE/SHIFT constants,
> instead of directly using PAGE_SIZE/SHIFT. This makes the code a bit
> easier to read, without introducing any functional changes.
> 
> 

Applied to next, thanks!

[1/1] arm64: kvm: Introduce nvhe stack size constants
      commit: 38f9e4b905a00047a96fbdc6cefe9ceb4dae34c3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



