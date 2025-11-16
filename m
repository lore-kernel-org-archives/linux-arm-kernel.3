Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003E0CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzP7wxhTeAxzhdg8HhtFXlTCOKKv3JTHOUYVOcZdWGs=; b=fBJW8GMVSowvjwut9KRxftXbNB
	zpWddH3oJBmeWS81gTVjviEunFqBvzZXM0jdZ/xHXdZuyOEKujr5jwRnYFzRziZxMY/0OSuM1Vj84
	q3t67jUGTIQLQqYPnAttyld6zDJvRttSNfbkGoR/MQsyBUxKGLbjtIYuU2JAr84RxVmpxX4afu5qR
	WvfWcnlwiC4t2vkHObB6VIPZnqzOB0/QbJHKRVPBXot7RivNYsaSL/lVcw4cjZcynZ0UfOI4oIqLt
	tBlgV7xX/Y+vTT6owYZUkHfLD8BhTAan0XXY+9Te1YqI59s7/MmvuyIQ4ePMeJeE6/En2cXMCUtn2
	RjlrZQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgMq-0000000EyRD-16OB;
	Sun, 16 Nov 2025 17:16:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKgMm-0000000EyQd-2zBm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 17:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D947B601F5;
	Sun, 16 Nov 2025 17:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D668C116B1;
	Sun, 16 Nov 2025 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763313403;
	bh=VzP7wxhTeAxzhdg8HhtFXlTCOKKv3JTHOUYVOcZdWGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHtRDR2y0eMCYeVh6K5xl1YDcW0uGrybT2sGMwQB7JGTyJa3QW/bzPLTh0WYWAU83
	 FgGvxGFcr5oIhccUAy4DlBI8VLRVxCITyFuFXo9GK1X/YTgDii0G44RhnJQkZ5On7G
	 Ygle6K0IHqruF9HhGS7VM0GyeGhyX+J904pET7Uxe4hF94TcWnHRto4ugA4+8RO4Ca
	 lDrtuJn1xLJPKOKOiEdfI1838p7m+osWaKc3zQ3xUuVw6avLdLgcXQ/aHQ9SOofHRP
	 wHT9RpxZ5RhtUX6nyd1Aoop7neGlOsfahE8o5sekc5f5L8zqjCNtEBfQewjJ3q5F5C
	 VQ72U//e5tYww==
Date: Sun, 16 Nov 2025 09:16:41 -0800
From: Drew Fustini <fustini@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com, catalin.marinas@arm.com,
	dakr@kernel.org, dave.martin@arm.com, david@redhat.com,
	dfustini@baylibre.com, fenghuay@nvidia.com,
	gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
	jeremy.linton@arm.com, jonathan.cameron@huawei.com,
	kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	peternewman@google.com, quic_jiles@quicinc.com, rafael@kernel.org,
	robh@kernel.org, rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
Message-ID: <aRoG+UptQg9mix+7@x1>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
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

On Fri, Nov 07, 2025 at 12:34:17PM +0000, Ben Horgan wrote:
> Hi all,
[snip]
> The rest of the driver can be found here: (no updated version - based on v3)
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc1

Does anyone know of a hosting platform that offers ARM machines that
have MPAM?

I see there are Ampere systems on Oracle but I wasn't sure if those have
MPAM.

I'm getting a RISC-V QoS patch series ready (Ssqosid ext and CBQRI spec)
and I'd like to get a better understanding of how resctrl works on MPAM
in practice.

Thanks,
Drew

