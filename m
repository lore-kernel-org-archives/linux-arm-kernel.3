Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D8BE74AD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX0GguvZKrEj/syUfVgTWwIkQJAMcVc70jlkNNstVew=; b=znQpX+NtlZBsnPt1TcRFnRGxut
	KdeFUvwtm61ewWLh6DrD6HFbzL5iy+IhA745kYySy8gGZgw7FspB2UHJeq995xKYckReDodRyy4Zd
	qPO8maSHD1xTOIB2VL+f1+Ist8rTIsPiLXZS9ic59MSXKfUPaecmMkPGpKbmbVHMYkJW7OI4HTLOr
	iLt9IWJPaIjvsKdJs6xFNoiRQi0no9z+G6hsLrnal6mSBs4tfqqsrutHJJ3UQGjud6yXAktnwfAef
	Et93MtwWYBByKOay7YRJuteZX/DTwzRTIBszI2IXecHTHgRaRHnLgt85YkaO1J2ZuNhrOq2Hu47ia
	ji0A1KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaLA-0000000AmNf-29GU;
	Tue, 03 Dec 2024 21:21:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaJJ-0000000AlyR-3uKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64E0F5C6D6A;
	Tue,  3 Dec 2024 21:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE44C4CECF;
	Tue,  3 Dec 2024 21:19:55 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: Keir Fraser <keirf@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 0/2] Minor tweaks to arm64 CoCO guest support
Date: Tue,  3 Dec 2024 21:19:53 +0000
Message-Id: <173326077458.517002.938138434185834868.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202145731.6422-1-will@kernel.org>
References: <20241202145731.6422-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_131958_008379_75CD6F38 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, 02 Dec 2024 14:57:28 +0000, Will Deacon wrote:
> Here are a couple of minor tweaks to the CoCO guest support on arm64.
> 
> The first enables protected guests under pKVM when pvmfw is not being
> used (and therefore MMIO guard is not enabled). This is useful for pvmfw
> development and for testing a VMM outside of the Android Virtualisation
> Framework APIs.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/2] drivers/virt: pkvm: Don't fail ioremap() call if MMIO_GUARD fails
      https://git.kernel.org/arm64/c/d44679fb954f
[2/2] MAINTAINERS: Add CCA and pKVM CoCO guest support to the ARM64 entry
      https://git.kernel.org/arm64/c/92230596252a

-- 
Catalin


