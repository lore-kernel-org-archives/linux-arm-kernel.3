Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94501C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3LcQ71JUTkjBfz0PYA91Zf87tMp7dO0XJfdEfiSW+Y=; b=NkwjbtYnv43AUDLADSWFapAyvX
	6yIIelrrB9DLUbdRZQPd3SpHHKMlSlX02lK9EYM/n8EJav6rmKnjcvYFSJ33fIDyAPsv12qZ8reAC
	jz7JG4wmHp7Fj7ycnkMOyzhnDgOQHB4jSvNHLWetoDiwY9Iqpj4lLXhqOwzJu72DkBjQQNYkNm2Dm
	KdtKI/SrZpH0tqhP3xbDtEvyaX8i0nC7gE3G2bB/3ioHz6cVYzN8VmpUMoPVEOQ2aAjypvtY8Wcdo
	RGaM5YkYeO81lyveJtbunfzcOus9yNr2uiZ5aqbOy7cVjcWGQQa/8LQjqsxcZLKVKdq7mTesYv+Jf
	vVQfuVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti48o-000000068vo-471B;
	Wed, 12 Feb 2025 04:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti45Z-000000068Wo-0xeJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 04:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 048C45C54B5;
	Wed, 12 Feb 2025 04:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58C7C4CEDF;
	Wed, 12 Feb 2025 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739333464;
	bh=k7vtiKJkTWMbOT4Z1lA+9eriWHA4AQxXpXh6m2Skn5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mdsbx6vQ5V1ATwNJsubQqPXCS8b/odPRww54GW2qBMKPnIVllZ9OjkvN8pZd+p5s9
	 ebDZ2OC+tyK7I4v/g+4CkJtWI6BApTR1y45rhZiKfyGGfl7ey65/+HWfl6MfQpLQGV
	 kuVxLqQzMQKQ4BoCLXkl8zIAcg4wCuxsnC6B9HOn+mydTAFPemrXFQrL8Bz9Y7FrXx
	 Vn2WdvuWQ04I6iWlB1K8sBftAGRuwKPWjGaOO2sLR09OOuQdzDV+6Rtl27uDgg0CoY
	 dlGM23iqM8M7WkDxb6rf76dJgr1n0na1a4kV+sQlBLTN6hxwq6jPL0PlcUoy/+Et8O
	 dHlQfCz4sNPng==
Date: Wed, 12 Feb 2025 04:11:02 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	wei.liu@kernel.org, mhklinux@outlook.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com
Subject: Re: [PATCH v3 2/2] hyperv: Move arch/x86/hyperv/hv_proc.c to
 drivers/hv
Message-ID: <Z6wfVl89EioBB8ou@liuwe-devbox-debian-v2>
References: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1738955002-20821-3-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_201105_310550_B89B3004 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, Feb 07, 2025 at 11:03:22AM -0800, Nuno Das Neves wrote:
> These helpers are not specific to x86_64 and will be needed by common code.
> Remove some unnecessary #includes.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>

One comment about the ordering of the tag. You should order them in
chronological order in the future, so the "Reviewed-by" should be after
your SoB.

Thanks,
Wei.

