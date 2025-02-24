Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F54C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcSniXRgM+Ddmr47JfUfBW9xvN1HNe9i5drbqA1M/n4=; b=QIDro/DwQ89hZnaZBal0UJMUzI
	yaFMnn6txrO0jkR6HZR9X/is6EmQqXWPNW/HJMQ8lwyyNbt+eHPGUbh7LXkzilb4xAP/fL7XE9RNZ
	TchHA/f/o0+bdc4oVHEnnD5rt0drTJUK9Bfb8+vOyS4Aw1jd5JNKOsfD06zStYwetpZHMUOe8hIsh
	LcH9E3tCNC+8I6LV1rFBoZjJZvPmPGPX0KQ8Emi5YHekyqkjSUsQJr64nojHYZGsVJwzkajjoEgxx
	59bZn5MMLI43k+FuYG7t8HxvqK/RYYWRry4B06voJB29bRY9j5WCPYtGA0ULwh18P50g/Y/EXp3G+
	soFSZtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcp0-0000000EjFy-2ONQ;
	Mon, 24 Feb 2025 18:04:50 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcmi-0000000Eij4-1ePs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1740416264;
	bh=ZcSniXRgM+Ddmr47JfUfBW9xvN1HNe9i5drbqA1M/n4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QVK9OBJjeDjcboUGIJNsj1/Yd213YN4Cc+1uJUcOc0TH4pwHTurFfHQ+hHR+shN4c
	 NEtsVESYC4pMVHGrop80zFSssiVTh2QtP520C9PdZM4L/alnUbI8LUFfRCqpXt0Gdj
	 wGk/29IBVVg2djOspxa+EzOJhlsUNaJrOaYywbt0=
Received: by gentwo.org (Postfix, from userid 1003)
	id 41A2940A17; Mon, 24 Feb 2025 08:57:44 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 4069040195;
	Mon, 24 Feb 2025 08:57:44 -0800 (PST)
Date: Mon, 24 Feb 2025 08:57:44 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-acpi@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
    x86@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
    rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org, 
    arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com, 
    mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org, 
    misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH v10 08/11] governors/haltpoll: drop kvm_para_available()
 check
In-Reply-To: <20250218213337.377987-9-ankur.a.arora@oracle.com>
Message-ID: <6d035996-8b8f-3d3d-d41e-6573f8a76f31@gentwo.org>
References: <20250218213337.377987-1-ankur.a.arora@oracle.com> <20250218213337.377987-9-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_100228_470783_CE78A9F5 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 18 Feb 2025, Ankur Arora wrote:

> So, we can safely forgo the kvm_para_available() check. This also
> allows cpuidle-haltpoll to be tested on baremetal.

I would hope that we will have this functionality as the default on
baremetal after testing in the future.

Reviewed-by; Christoph Lameter (Ampere) <cl@linux.com>

