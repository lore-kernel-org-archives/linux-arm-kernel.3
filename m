Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3101DCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zALWSTZnD0miNW/ksHJ9EMAP89ltv5CaAY2GmdBEiYY=; b=h93uAaiT8+pQJL/XX4jZLROGmv
	7bAt65qP+0pStW0O5lR2OtbBrRAe2NjL/bKBJoxGNthcH0VA0540STa4lifhw5F3SzASxWGJUwoy6
	6/P8NJno8cWSWN+MOxvnDUhI+tJkE7aHcReI/UT1qWG3rj9QnTuL7cVQT2WHvu4AhclmWqBoZhFvw
	Txe6hOiI5Z6LA3pLV/nhZ0VuJpq9kBuGqGQCtta68dlkUmrwZ+n7NdxNSsECHRyF0nV6uTkwZzrKV
	sRtTkHLqJpqLZ45ZniRUBfBQEZiuh3WlXjH2L0AfB/larsre4glVzKdaJ0QX80EuR5AASLuK1imK/
	UFk8FNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdj5-00000004PWO-2I4h;
	Tue, 29 Sep 2026 19:42:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdj4-00000004PVj-1WQA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 19:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zALWSTZnD0miNW/ksHJ9EMAP89ltv5CaAY2GmdBEiYY=; b=M1QhZLtZV8fCkyBq2eoYT+MqQA
	x+DtOxmoZiJZ5y4eC2jtaIf5fztXg5rtongXp4g8LFeYfB34p1mUPNN1aSI4Zz7v9EdjO64ZN8m4n
	WWn4DZaM2Uv8jzyVd9pDBEwbvLFeLyjO/6dA2z/hIJ+kSJeOLrjrqwKv0oj11TPJ7jh4oL0TSlQM9
	n8qAOw0dOm0f5XR+YsbdlBOzM1Ux70HiNswNLdGrnKZvBpAuEvtXofAbp8i57RBzc6bkcVDHaHnov
	YCt5KVHBJdrmGnafvnV1IL+kP9+SUmWevGjMxoQFENHfa1nbv3bqckDa0LNjtIya+YJIZ2xDJNU/s
	WXTU4PPA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBdis-000000031ju-1xzk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:42:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABF91143D;
	Tue, 29 Sep 2026 12:42:36 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1CB3F763;
	Tue, 29 Sep 2026 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790710960; bh=ESSzXC3ElNzYM9W3zJWJEtqXMttntxbSA8BNS/JPV1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OW6eCzziJsXe5B/0ftjUDaCx3pFCKpJogr2XrGrjGlj1HY+KgAsmzP7q4kQK7ZnN4
	 PL7WBZj8nkyQhI73V4GkNOAeaa7sRHwBarJjE7iZp9Nks4KCR6HMvkmyAYOulajdvO
	 bL2B8Zq5Y+dWNg6ATfPqUeVF5ny7R9B49G0hqokQ=
Date: Tue, 29 Sep 2026 20:42:36 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <arwUrOYn0NVySdzm@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929192051.GN163130@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929192051.GN163130@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_204243_124223_0569CEF0 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Sep 29, 2026 at 04:20:51PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> > This series adds support for Arm Confidential Compute Architecture (CCA)
> > measurement registers in the Linux kernel, enabling guest Realms to
> > access, extend, and expose measurement values for attestation and runtime
> > integrity tracking.
> 
> I'd prefer not to add any more tsm_measurements users until we bottom
> out on the attestation subsystem.. Mainly because it establishes uAPI
> that doesn't really do everything people need from this stuff..

Tend to agree. However, I think this seems like an integration with
the attestation subsystem.
IOW, although the functionality and interface are currently scattered,
the functionality of the TSM MR doesn't change —
showing the current measurement register status and generating
a token with a challenge. Therefore, even if the subsystem is refactored,
I don't think this would be a burden for it, and personally,
I'd like to see this patch series emancipated from almost six months of waiting ;)

> 
> The actual code seemed reasonble from a quick glance.

Thanks!

-- 
Sincerely,
Yeoreum Yun

