Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F2CD4335C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWfO8QKNiUh3tSfBP+ujLCZPjULvdzRieaxb7RSVPps=; b=eKhTgYF/tsLcj4ri6IZfmeEvu2
	6Ht6BD2hnIx17AihEG9uI2hXkDkG9mtYkCs5lJeWCjlWiKGb7Ryp3aGCX/U7iQiaOyFvXjROzAH5w
	ijAeKUJen/95TLtdafsbF7zXNufbFmAZhGq6F/9/EEyghs/XRe/cU2Wg5KeRpJ7cbg8maR+nXP/rP
	0LEzBFp4zhFzBg5gGehzn+Z+wvhBCB7A82rmbTOTrKJjxU9gGmGJEdBn0XRYH1fsKqAXQmMbxkWwf
	2Gk7e9hqpwNlNkhArL2KTbK+GwiQ7ScGMyfOriCzLx0IBtZJomMKeOifK4mPAiQ9d+NZvnpqu2Lo2
	/lk0yzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Eir-000000091HX-2ngE;
	Fri, 08 Nov 2024 02:27:41 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Eh6-0000000916v-47QX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 02:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1731032748;
	bh=SWfO8QKNiUh3tSfBP+ujLCZPjULvdzRieaxb7RSVPps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LDk3ByizwoL7zjEeeTcxEYJJESMkTxCPLUA0Y932pS5cSm5Ew4HvCFiFPXxbWPJhO
	 8StFtu5g+LHwDbqoUfxUBf7f+nDADFp0kHR6o6hl0GGu2FiSbDph71/atX/OSq99wD
	 GOoRyf4NvcCIL7iuxPuyc6g0s8/ptAX0XuSTp/Tc=
Received: by gentwo.org (Postfix, from userid 1003)
	id D7D454027B; Thu,  7 Nov 2024 18:25:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id D4546400CA;
	Thu,  7 Nov 2024 18:25:48 -0800 (PST)
Date: Thu, 7 Nov 2024 18:25:48 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org, 
    daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de, 
    lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com, 
    mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org, 
    misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [RFC PATCH v9 14/15] arm64/delay: move some constants out to a
 separate header
In-Reply-To: <20241107190818.522639-15-ankur.a.arora@oracle.com>
Message-ID: <db90518c-a0e4-02cb-87c8-ea2609960dc4@gentwo.org>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com> <20241107190818.522639-15-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_182553_126812_3A3C5ED4 
X-CRM114-Status: UNSURE (   6.11  )
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

On Thu, 7 Nov 2024, Ankur Arora wrote:

> Moves some constants and functions related to xloops, cycles computation
> out to a new header.

Constants are correct...

Reviewed-by: Christoph Lameter <cl@linux.com>


