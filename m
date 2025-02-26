Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08ECC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEoVyBpUX3lFNfnp2cCHlhOnrwe2QxwgEqIvC2X/3iA=; b=i6SWDK2VwCy4kTRG8PEP8iufpi
	6DvbXrMUtBguTrTUnpTMS+1X2D0EekCDFFAIqyLGN9k/u1XpYUV1oJyK96clTb/oiF9jGGlepRGfo
	Fmn+YfUlOaDhQARk/A8LqZ6nf5y1cvyJ94fQSR44H4ozIDtmlGWbcHiDr+ZoR3bNRSAGudYP+a6p3
	lO7a0GpuaHY5PoPhaYU2Cg6ENnjfPHaWkVTlcvWqBA//55v9Bei8uayTJi22r4RS6Qgv4aLEVcHTW
	0f1VWhQi2H+2r+xkBzHqmEvKX8+SGMYOvNMd5jcbKM9UTpOUElRtr8sF/nTVH8zp2z/PKJwddu2FT
	xkRCPrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQwH-00000005iQm-07c0;
	Wed, 26 Feb 2025 23:35:41 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQtV-00000005i8P-0eiD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:32:50 +0000
Received: from skinsburskii. (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 223BD210EACA;
	Wed, 26 Feb 2025 15:32:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 223BD210EACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740612768;
	bh=UEoVyBpUX3lFNfnp2cCHlhOnrwe2QxwgEqIvC2X/3iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8bNHDOiYxdhtkrKYYPEHNFQaugrm+RMCXnNNSdB2RRQ/3V5aZ3xAM0koem6RCFog
	 XFnYZAwbK6QiyU9Vz7GUQsFS6+VK8cfImWj+EAswlp23akzSKX+WKDelQ3BKFQAL1F
	 aBaVrx3PzGTFxsRWJxIicYnnv4RjcyTmGvoHGjrw=
Date: Wed, 26 Feb 2025 15:32:45 -0800
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
Subject: Re: [PATCH v5 06/10] Drivers/hv: Export some functions for use by
 root partition module
Message-ID: <Z7-knarBxqxRIqVE@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-7-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_153249_216646_A39C281F 
X-CRM114-Status: UNSURE (   6.04  )
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

On Wed, Feb 26, 2025 at 03:08:00PM -0800, Nuno Das Neves wrote:
> get_hypervisor_version, hv_call_deposit_pages, hv_call_create_vp,
> hv_call_deposit_pages, and hv_call_create_vp are all needed in module
> with CONFIG_MSHV_ROOT=m.
> 

Reviewed-by: Stanislav Kinsburskii <skinsburskii@microsoft.linux.com>

