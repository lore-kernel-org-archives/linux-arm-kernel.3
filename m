Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E08E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 00:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17Moma2cFVkUK2ZROZzXwCY3kicUanQTmC+8C4jydfg=; b=1d5TZQWda0wMbQnGYBwZ3vjUGv
	iOO8yxkPtVGrXg/7E6o/Z8Qv08ZSFgprEQjwJcuDmGztAvKnB9/5XuejvHzgEP4wZSyaAWWTpKEAw
	yhCWc00faZ5eXTye+159lgXZzhkD1Puze3VwNsh0me106TpOiHcc0sYbya883eI9SBSmCdXS1BZBz
	JzdTJBSzr8B/5YVGCNmiy7AOjoLr0uZeB6qb035CnB+Gylvz6cW3Ed+xtXSrakepCvImyOJrDi06Y
	4usQJb5fLAW4A+/wpbD45SjWv7xBheB2c9AEICIRC9trIRdfyxLPVaEyJBS9IQ9yLfxDETTcXzZPe
	yd+0UrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRIn-000000062yh-426O;
	Mon, 09 Dec 2024 00:07:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKRHk-000000062p8-3JaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 00:06:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 472DCA40217;
	Mon,  9 Dec 2024 00:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F2CC4CED2;
	Mon,  9 Dec 2024 00:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733702758;
	bh=KOSE2+0IJQr/pu3UWE4qE1sa7hIxtXcxZxP8jtFM2qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXF9NPn9POFP50emVFrAtfIHqq4k8Ait3jzAckDzNP4bGmUk6T8lv6B0EIk7fxs1U
	 u7pjIv1BdHmbkxLaCyDrqJ4fAw2qD+sefOnHMs79XCU1/ccDaVEsY8F86kazyBJr6M
	 PjJunvWrVykhl/mhPfkYR2UxjUex+regGgNhtDqxdKH+urlUjGi4XqeldagYnbQSxW
	 lSxM+nTE2m+KYy1gibCaV6aXWA2i8NfGqXbAcVKwqmjgyBrs7oKccYOETeAQKZYlwH
	 3qilQ0Q/zFmyj3DBqfn5svbmu/EaZbdsza73DiOz60mE4GWluNMmHLT061A3r4GXK8
	 TI1wK055FK+iQ==
Date: Mon, 9 Dec 2024 00:05:56 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	virtualization@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
	decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	sgarzare@redhat.com, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com, vkuznets@redhat.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	eahariha@linux.microsoft.com, horms@kernel.org
Subject: Re: [PATCH v3 0/5] Introduce new headers for Hyper-V
Message-ID: <Z1Y0ZB0J16oeHBbK@liuwe-devbox-debian-v2>
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_160600_979482_1053503E 
X-CRM114-Status: GOOD (  12.71  )
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

On Mon, Nov 25, 2024 at 03:24:39PM -0800, Nuno Das Neves wrote:
> To support Linux as root partition[1] on Hyper-V many new definitions
> are required.
> 
> The plan going forward is to directly import definitions from
> Hyper-V code without waiting for them to land in the TLFS document.
> This is a quicker and more maintainable way to import definitions,
> and is a step toward the eventual goal of exporting the headers
> directly from Hyper-V for use in Linux.
> 
> This patch series introduces new headers (hvhdk.h, hvgdk.h, etc,
> see patch #3) derived directly from Hyper-V code. hyperv-tlfs.h is
> replaced with hvhdk.h (which includes the other new headers)
> everywhere.
> 
> No functional change is expected.
> 
> Summary:
> Patch 1-2: Minor cleanup patches
> Patch 3: Add the new headers (hvhdk.h, etc..) in include/hyperv/
> Patch 4: Switch to the new headers
> Patch 5: Delete hyperv-tlfs.h files
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

Applied to hyperv-next. Thanks.

