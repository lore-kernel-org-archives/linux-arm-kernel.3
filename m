Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132D9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUjehzOidtlCeQWzsi/kx3qwFl9les0ft/DMai2HzGU=; b=s3BUKDQ9HNuSW/RKz2yRGF4Tgz
	lTEaQa7+Fmp8vKFlH3O2ZN/OViRxMhE73VSGjR4ZWCtrN8YkJih3PXmZfKxZ1TpZlYB4Yzm7tix25
	GUpNI8yUBrcmY0Hg9UNytB3d3mgB7KEQ7yj4wA1kfhikA5OcXr7mwborGG1phmKBlxIUhLjsnz7Cl
	SCHOGc9+NLvAJaZumNYZxBORgTFLI3AgRg/+ZOnVpMNEAncTnSruXGg9YQODwjfxmIpQGV3sAtw1w
	5P8F1S8HWUusvjwJDKT8IaenI4/5KhqzY0zGMa6JTWt62ngtzuR6cLdsO21rigVvr43fnb8vg0ZkH
	AEJtkyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6N3-00000000y4a-0LcC;
	Tue, 06 Oct 2026 14:42:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6N1-00000000y4C-0YgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 14:42:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E9221516;
	Tue,  6 Oct 2026 07:42:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F17503F66F;
	Tue,  6 Oct 2026 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791297737; bh=udMZNc2rFXHRjE0ZMq9xLrLXkBz9N8T7j5eymUhKYZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXW6LAiw954MpsAgRH1UxdfDyygnEfgf0qkNRQia3YM0uMvWEYfnXpMvRZ2ZOczLR
	 EBykdxQHQMqQ41NSG5q+NRArJ94p7gEK0FPqaKjQtRZL3ujKyCDKQXDvVQ/3Z/LXgW
	 yyHeedbEDcNa/IjCMPkSXI5QthI1gznt5ADjQupg=
Date: Tue, 6 Oct 2026 15:42:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
Message-ID: <asUIxt-XzxfWBW4N@arm.com>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_074219_234881_5C7DC685 
X-CRM114-Status: UNSURE (   8.34  )
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

On Thu, Sep 10, 2026 at 08:00:41PM +0100, Mark Brown wrote:
> The API has been updated to return the more permissive -EPERM rather
					      ^^^^^^^^^^
"descriptive" like in the first patch?

-- 
Catalin

