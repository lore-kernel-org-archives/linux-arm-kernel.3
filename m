Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2010F9961
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FM5faRZgi+dOURfcIc4ctpfJOsA3gRJtGY+K82Gs4Jo=; b=vzQJb1ZSjHykoZ62dlJ2L1DMoS
	NLWCq14VK8EAnM8DpRHIH9Vvz/vAZNANOqqwxmG7xqcExrrCj7AMQLv6pBBlrM0mPvOVc5ekuYSt5
	3CCEMnnd8SmULTO4y9FQVqR89gcoieIaMpGNy2ynWv6qE+ZBS9uA1jmUHGSF1kwfE5lpPNHFPh4fd
	Oq0SabMcULiPfn1mgt8GZo/ySPfmSIlW3JndAaKUF8M7KiryKlGRFbKFqCT7SnzbS4PUUpl8C1XbK
	r+MwcAkTQbRN6wVb0Fm6CxExejdn1jscHZGm6PRFfZ8gmZB/sxuSeYzxArB7ZTenxEhFTfnJ9+lw1
	lv0swYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWhh-00000009BiU-1XYX;
	Wed, 08 Apr 2026 17:28:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWhd-00000009Bi0-3WFl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:28:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 933E21682;
	Wed,  8 Apr 2026 10:28:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D3C03F641;
	Wed,  8 Apr 2026 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775669312; bh=wjTlw5LmgfsJrLhfZXBxbsfLz0rkkTTTcNY+w5J7qKk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=n6s1AVys0qP0SqBILflzRDkrusg1uIiCf7x/3QHa10anr7L0zwO3xckoUUMjb6tx8
	 x/5UZkUsCvyt7g2lQ89P1vUhajTW8a8FHCgQA/6D5Q6hVW/nl1wSY0YSh3cuer+0cO
	 LOhwfH+zJiklEusDkZpSV3VrwQ9OJNfcGv70NB9I=
Date: Wed, 8 Apr 2026 18:28:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, mrigendra.chaubey@gmail.com, pasha.tatashin@soleen.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Wang Wensheng <wsw9603@163.com>
Subject: Re: [PATCH] arm64: kexec: Remove duplicate allocation for trans_pgd
Message-ID: <177566917204.3319966.11432678759055705075.b4-ty@arm.com>
References: <20260405114231.264761-1-wsw9603@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405114231.264761-1-wsw9603@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_102833_917506_41613B26 
X-CRM114-Status: UNSURE (   6.60  )
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

On Sun, 05 Apr 2026 19:42:31 +0800, Wang Wensheng wrote:
> trans_pgd would be allocated in trans_pgd_create_copy(), so remove the
> duplicate allocation before calling trans_pgd_create_copy().
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: kexec: Remove duplicate allocation for trans_pgd
      https://git.kernel.org/arm64/c/ee020bf6f140

-- 
Catalin

