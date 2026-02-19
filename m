Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61034E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zr+ipSe2JI/bVAdF+U0i0LKlqmPPpt9S/CIaY7IYQqU=; b=ILPBcK1bXb76fUmtFOid/Qtjk4
	bhETNMcWIR8LQKswzewVWfsFXtCB6j5P5Lh87QbFSecnQdwsw/3G/qQyMWmIfEkbDAE20V9KJLgPd
	W1C9+33CV0h5HeWbZwva3o7dYjP+GUHyVLOU+fvO5VlgCM4aeZqvSCzo/GczX4LTN+Dj4k3td1KUn
	1xesCcUaBt0RdsJEleX5SLhPA3g0smdiQOeLwsV7fDQqP6lwxvfo8XusqPH8Wrs+0zzIcC4pxTPSU
	gpboNID8EhNGVhtcv3JnI0tGdu7GUUss32IuZCFooF3piYaPFOKIWEaGEE6NAJxr/P4icpwayoK7B
	u/9uBP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt441-0000000BOWH-3Wq0;
	Thu, 19 Feb 2026 13:27:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt43y-0000000BOUl-01Xf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABFE044453;
	Thu, 19 Feb 2026 13:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06406C116C6;
	Thu, 19 Feb 2026 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771507645;
	bh=dCrBPubZIKcbvmgILfm1PhzeloMsfYN/6KzdN4upxjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iup8LWX8ognOvISD9w5llksSOwW3xkoq4ytdQwtwtRTKriqn1u6/Aj9VxoXNDsEsi
	 /0ndxj7apEWcVsezZ02z/cffyAh+UW4Uu6qoTRsLIHwNxalzk5aWXbdhVod0HoOFXA
	 thvLOmgzaa9+T3j7FlxQ4LT/7K00Yxs8bLoN26iSv2gIGxMv/aIbnwrueSmUvTf2EF
	 d+eH1gqbQdqHtWOFaSPtkOKTFjupXJteyxM1fE9CRAavnF+BdgfZXkdPPIvAP9CP7u
	 ryttfjXpMtj49qm1aAYuUkzwTrtQnVinGEI9p/J+HitNp7Ck/lnaMp8LIO2wo+qy0p
	 akI6aeJNUaX/g==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyesoo Yu <hyesoo.yu@samsung.com>,
	Quentin Perret <qperret@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Force the use of CNTVCT_EL0 in __delay()
Date: Thu, 19 Feb 2026 13:27:13 +0000
Message-ID: <177150437545.2426887.1189373653228730903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213141619.1791283-1-maz@kernel.org>
References: <20260213141619.1791283-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_052726_067065_1B4D460E 
X-CRM114-Status: GOOD (  10.47  )
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

On Fri, 13 Feb 2026 14:16:19 +0000, Marc Zyngier wrote:
> Quentin forwards a report from Hyesoo Yu, describing an interesting
> problem with the use of WFxT in __delay() when a vcpu is loaded and
> that KVM is *not* in VHE mode (either nVHE or hVHE).
> 
> In this case, CNTVOFF_EL2 is set to a non-zero value to reflect the
> state of the guest virtual counter. At the same time, __delay() is
> using get_cycles() to read the counter value, which is indirected to
> reading CNTPCT_EL0.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Force the use of CNTVCT_EL0 in __delay()
      https://git.kernel.org/arm64/c/29cc0f3aa7c6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

