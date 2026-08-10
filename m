Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isdQD57jHgyTIBMiE4dTMqFI8UmNUWzlh68yHBIB5NU=; b=uiVSv/bGRJRh/7H+45E25aDfX/
	0eYTHt8ZJaOg09m14ZfVrSdD/K5e5aOCk6IeOJO2N8z1qK0emb4bVl5ypi00Tp2Y+KBn+Klg44yJJ
	Vz0VrzN7nDEJsiGXhoKz3rz6ZA+mLF73aEOyHQguVX4gH9m06rYLJa3qNqXRrnlXpa4IGRV+GyfaT
	98I8KcHz4AXlttzHVfMX7peoXDDpir3YC9Ax0sY7YbG/0hnPaXKfNsM1YQkQOwgARq0MPugsHsIYh
	qr9pvFUc1douXdUy8gaQEhQO3WSkkIE69EFfezsF/HF+eyeG9pdUZzUhm4T7dVLlrLhoTz324I0RW
	av36fvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMPe-0000000BPm8-0WSl;
	Mon, 10 Aug 2026 09:35:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMPd-0000000BPm1-1ReH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA8EE41750;
	Mon, 10 Aug 2026 09:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A541F000E9;
	Mon, 10 Aug 2026 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786354516;
	bh=isdQD57jHgyTIBMiE4dTMqFI8UmNUWzlh68yHBIB5NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PxxHfsMCqLn69dXi7Q0/a6J1VN4E06pelY/bq5MnIpTAIrUMbYQ5Kal2P8gowM4kg
	 o0PkCyUO1VdmJVmk2KCmrSeCIHECwptAOjDeuZGIfD9d0oL5CLrHP0knXiA7Gl34VE
	 88rZa367wzgb/WMhb6fn/5SgUPhnH9mycFWs9KyMDTEL8y2YZ0XrpoFsMk/y4+iQ2J
	 POUI21hFg1EKr8VXjWsXvpzUD7y3tEjJodbsWGODgxUrx2JqRpKrmo+ES29fzXgXv3
	 MRvwENCmYa3p4Ev5huNbaqJzNfMakFdDilbXItljAC/9sWKYEMZsQ1C8s5hBTFoeLj
	 AvjdizNpAnTuQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <yq5awlu43gg6.fsf@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com> <yq5awlu43gg6.fsf@kernel.org>
Date: Mon, 10 Aug 2026 15:05:08 +0530
Message-ID: <yq5ase4miaib.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Catalin Marinas <catalin.marinas@arm.com> writes:
>
>> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>> Changes from v8:
>>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
>>> * Rebase onto the arm64 for-next/core branch.
>>
>> Was there a dependency on anything in for-next/core? We normally apply
>> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
>> and merge everything together in for-next/core. We (and many other
>> maintainers) strongly prefer series posted on top of an -rc kernel
>> (typically -rc1 to -rc3) unless there's a dependency on a different
>> branch. Never based on -next or -next like branches (which is what
>> for-next/core is, as the name implies).
>>
>
> The reason is that these two patches create conflicts. Since this series
> involves file movement, resolving those conflicts was not
> straightforward. Therefore, I rebased the series on top of both of the
> following commits:
>
> commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
> commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")
>

Any chance of getting this picked up for the next merge window?

A few patch series depend on this patch:

1. The rest of the CCA DA series
2. LFA: https://lore.kernel.org/all/20260706134455.132091-1-andre.przywara@arm.com
3. Realm support for Hyper-V: https://lore.kernel.org/all/20260625173500.1995481-1-kameroncarr@linux.microsoft.com

-aneesh

