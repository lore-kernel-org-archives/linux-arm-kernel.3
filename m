Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31742C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NHzpHheExnUNitXK7gI2Jb+BINWBSz6yMNW9df3Tr8=; b=qKCwsE8Mn1YtipLzB2yPHR1+Wt
	4id5QR/M1aG9rZYLyapBzbW2x0W30WmAoJece0B4p89W8rZsilxBu2X4ax0qfd44YkCqiNvi+CKPt
	YVr/2hNn5kP6pYvYWwUv0asdeu8twtnHemcS0cPicVsQwelVXxj38Y1uIpt99tf+NwnEgVKfdFeMk
	EaccK+plrejjTJbxWdXNvxgXUyD6KoeRiJQ3TSK9ly0x2zdMBeGlGj7fYjMDC4DpQlcOuMsMix6wQ
	nsiJE2/xQhM3M3CN2n1IJL66Bl/CUrY1sEcZDEor1/sGrRBhknrqXogK7fm/54lu7/fypi9da3HTt
	cUiOml8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZebi-0000000AH3e-0Vfz;
	Wed, 09 Jul 2025 23:53:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeZO-0000000AGwi-1JAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FE5EA5428B;
	Wed,  9 Jul 2025 23:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4F3C4CEEF;
	Wed,  9 Jul 2025 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752105081;
	bh=iHHDdi61luMjOOB6cLZIe2NqS6hgH4l1r7NpDne4SJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWacwsk2dDys5dUjq5eKhC6vFLRjjzMaKYIRbg9sezsrHgTqzkp9ItcMIJU5H+EN4
	 EBeK0oVZGFl3JjKF4ktrsP5OVQz5KZjXDdlw1a1i7wFakVLu9cchydNeEV10/BVzdh
	 8LnGZMottz+MOntboVjxv2QH5IzEPZK7MRuBNizGuG/xj/PIGObD/HMoxFqmZLoeqi
	 TfFIksllkSLTBdPW1Oq4gX2V+lJ23Rg4EutgHkTwNIPEWiTG0SwMWzVjge5LEBJ9vH
	 0tTj0c/oegwXKGz2Fk2B73+CZtCxWekDDlNCYYcnZpOhGC+QSQrniTMN2cmsDGl18d
	 IruP939/zBCww==
Date: Wed, 9 Jul 2025 23:51:19 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	mhklinux@outlook.com, tglx@linutronix.de, bhelgaas@google.com,
	romank@linux.microsoft.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	jinankjain@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, x86@kernel.org
Subject: Re: [PATCH v2 0/6] Nested virtualization fixes for root partition
Message-ID: <aG8Ad0yeifapux5D@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_165122_405655_584C3254 
X-CRM114-Status: UNSURE (   8.46  )
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

On Thu, Jul 03, 2025 at 03:44:31PM -0700, Nuno Das Neves wrote:
[...]
>   PCI: hv: Don't load the driver for baremetal root partition
>   x86/hyperv: Fix usage of cpu_online_mask to get valid cpu
>   x86/hyperv: Clean up hv_map/unmap_interrupt() return values
>   PCI: hv: Use the correct hypercall for unmasking interrupts on nested
> 

These are applied to hyperv-fixes.

>   Drivers: hv: Use nested hypercall for post message and signal event
>   x86: hyperv: Expose hv_map_msi_interrupt function

These have pending comments so they are not yet applied.

Wei

