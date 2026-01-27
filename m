Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01767D2D8FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKD54RPFTb1ncRbwZbH+LUnfNI8nemki6y+VDR3YVF8=; b=N1EHLb2gwTzOr34z5o92KeEdPo
	/uiPTIP8OyK2sZHJot9CHs9X4l+hKFKQ7t/xX13PS95hOwyGQV5NBz6HFZH0YcL8IcFUk/vusi0Nu
	QGn8Ra4aNymKQfYbzSwxK/teHgrtLl9BaVweS0agl1ZNkMNUxSv90qGiLNSYAtBcpqQNAoKYgiLTr
	PQnrjJoGl6hZjFt1wDMPTkcu26QGZzwYqQmdirMU2WAj4XnRoruVdA1QEQ45wM2UoMm9kPgXzusZs
	eOaT58INWzGDgovsD+FFF/A4LTHaExEAT+2E7yz8mRof/g/xaZu6JemqSUVhyl4CXh0KHF5OWMYIa
	gCdUhTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh0K-0000000E8lX-3Qx7;
	Tue, 27 Jan 2026 11:13:04 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkh0G-0000000E8l1-3HOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:13:02 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AKD54RPFTb1ncRbwZbH+LUnfNI8nemki6y+VDR3YVF8=;
	b=MtGVz4T44pN4RgSR18/qzdlCY1Cb+eX0bpfP31QMracnZhtitkvKactilsgEEt0Oj4InpevXJ
	Gn2BSxvYjnFH/PibfT4oZFgyOtfvXMvSEnWTrcDeZFqjn+EYgbOZtF2p8uk/0KihFHRheelF/V8
	EzB0vO/OvRX330bvM+N2hkA=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f0jP60Kdrz1P7PD;
	Tue, 27 Jan 2026 19:10:17 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0jR329fGzHnH7b;
	Tue, 27 Jan 2026 19:11:59 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id B575340539;
	Tue, 27 Jan 2026 19:12:44 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 11:12:43 +0000
Date: Tue, 27 Jan 2026 11:12:42 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/13] arm64: mm: Re-implement the __tlbi_level macro
 as a C function
Message-ID: <20260127111242.00007fcd@huawei.com>
In-Reply-To: <20260119172202.1681510-2-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-2-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_031301_407871_8B6E6156 
X-CRM114-Status: UNSURE (   9.25  )
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

On Mon, 19 Jan 2026 17:21:48 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> As part of efforts to reduce our reliance on complex preprocessor macros
> for TLB invalidation routines, convert the __tlbi_level macro to a C
> function for by-level TLB invalidation.
> 
> Each specific tlbi level op is implemented as a C function and the
> appropriate function pointer is passed to __tlbi_level(). Since
> everything is declared inline and is statically resolvable, the compiler
> will convert the indirect function call to a direct inline execution.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Does what it says on the tin.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


