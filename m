Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D806C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lHMws1Z1gT8osFbNr/ifk0g3X6AfrrHIOGRFkPcVcg=; b=RYTXlZ0kzekqIwJ2vBJs9UOf15
	Ly2pzvawSoAs9DpEP35av/IggVmf1bG/g4Z1tgxhHi/lXRqKk08U9Mi2fTmRzXOJMAk11Dj9aYDY+
	S91zISikFXh65odUSoATpvsNGKSHCCN4FuWo0wof3RtxywAEMTYZwkR029NxEUFirF4FLO01Uwl3q
	eveYGGYmhHVQ4gmcJj5ZctpeWFkK0Vn9pPOEjsSsYGnzulrTQTwvXi9ax0EFC7rolQrjMXxvzIx9D
	DQw+LvB2ZYr81FgmOBR2OJAouylxrJDajbL2ohUMiwqyfdJ205dGJq+JYEB2TMw0g4fgQuynBPeEA
	UUDPlwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQqF-00000005hnb-1Db6;
	Wed, 26 Feb 2025 23:29:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQnw-00000005hTv-1gUR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:27:05 +0000
Received: from skinsburskii. (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC33C210EACD;
	Wed, 26 Feb 2025 15:27:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC33C210EACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740612424;
	bh=7lHMws1Z1gT8osFbNr/ifk0g3X6AfrrHIOGRFkPcVcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbI0KQsELJKepq9/o/2xxN8OIDClMvCwA1i5LbFoimxlZ2tF92fgjUX30efR9NQWD
	 /TWf9hUkilLCn2PdeUwnWr7zE9I9Cc4gU50NkfKdXo9dbrAku841jUkwRWmZ8qbgCy
	 YrK4NjKN4l6/h+fvv0o4Gwb6vJwMp8BYsu9kw8MY=
Date: Wed, 26 Feb 2025 15:27:01 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
Message-ID: <Z7-jRek8DsTY-hCk@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_152704_463501_01112E9C 
X-CRM114-Status: UNSURE (   8.21  )
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

On Wed, Feb 26, 2025 at 03:07:56PM -0800, Nuno Das Neves wrote:
> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> 
> Extend the "ms_hyperv_info" structure to include a new field,
> "ext_features", for capturing extended Hyper-V features.
> Update the "ms_hyperv_init_platform" function to retrieve these features
> using the cpuid instruction and include them in the informational output.
> 

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

