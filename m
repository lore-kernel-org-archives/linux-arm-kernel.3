Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF41C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smjit/QOli8nDcBTnlq+IXvVJxQjsbEgJ6Aw5iXyn/0=; b=b65pDWMo8C3R5BKHJimoAdSUku
	euUeNSrC9da/ZtJsm+u+Lv8ffFauV/nI8K6SArc18uk24u/zBdAkWkTwjYk9ch1rz7HvE9LY1SL7N
	ypb1RqeSBqj/twk5e0HDnnqSn5gEOfCxpOSAAcdEWfULBj0WutlIEPKkmqGDFQqNtsI2VONntJ3/E
	f8O27HxFWZ7NxKcwOmrtfRJPE7C/xOFg7L+8+ZvGFIh8RLLE4U+e8HEjcTHIyPf2Zsjy2Z8N0k3w1
	ohPTW432O99XAxuV1GMrpZAIbOoBpoDJT6NmJcRIrAbpV/in+Kmgsq2nCMruMXilGX2DAFAi+asRH
	mqbJgKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQul-00000005iKE-1c97;
	Wed, 26 Feb 2025 23:34:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQsL-00000005hzI-14Rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:31:38 +0000
Received: from skinsburskii. (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9C950210EACC;
	Wed, 26 Feb 2025 15:31:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9C950210EACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740612696;
	bh=smjit/QOli8nDcBTnlq+IXvVJxQjsbEgJ6Aw5iXyn/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9icv2OehF8C4IQm6v8VGElOql6Tl2Byga40BAnvuJFcSL21kP6EiJAZapo85yaEv
	 0z+DfrPz+nWW/C92EgQK94mRa2xtr+gXgtV7CR0P6fCXsYd3zisGZxIkHJ9S+LQo/Y
	 Fxf2YP+gaMG+c+MaB8mm2wGgwpFRD+e7/0qmWEYc=
Date: Wed, 26 Feb 2025 15:31:33 -0800
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
Subject: Re: [PATCH v5 05/10] acpi: numa: Export node_to_pxm()
Message-ID: <Z7-kVXsMrhhNV17S@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-6-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_153137_319551_AB036765 
X-CRM114-Status: UNSURE (   6.82  )
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

On Wed, Feb 26, 2025 at 03:07:59PM -0800, Nuno Das Neves wrote:
> node_to_pxm() is used by hv_numa_node_to_pxm_info().
> That helper will be used by Hyper-V root partition module code
> when CONFIG_MSHV_ROOT=m.
> 

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

