Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A88ECE8E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3myP44Gfgp7TWDQVK9qQgIFcWGayxiKS6l53Uoqwyyg=; b=DtjAYmJ0nRH7J4pqLRxstP4oCt
	PM+WBXI9BbYyDbTUUIShCuA8WR1BUGRRYwX3Wk5c1lgkgcFHqE34t/H/tdRDTvx0IfqV2ZHe3Gadm
	77Lyfye6zf5CDUIJD9SNdPI3cBETP0sdpzSnB1VUc5B/EYVgcSHDbCmHs0hmiHOAQKtPpRNp3gFJk
	kgNvJbky93LBnUPdg0s5oqxKiNaGXKkdSGqK/ANAtjkM9tgU/BfC9/7IDdJLbmoD5zuIiBFb/Prm8
	ZotaQoJpLglo4inzyP8ofL+gNu5n3edXD0bqw5bvemcHJL2+SpWkFxwsiiWOLb1gzRSK7fuZ0au/U
	Oa0lB9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yHd-00000000ai9-0AqQ;
	Thu, 24 Oct 2024 13:53:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yCf-00000000ZyC-1E62
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 13:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3myP44Gfgp7TWDQVK9qQgIFcWGayxiKS6l53Uoqwyyg=; b=hQMbYTxZAJvskYeOC5cLMCanyS
	3P6RaVvSJPhOA1/TNYfJuxxrMXtg9GO7HWHc+cXqLhRcVvz5QiqgWZyCGsVFtNXE3TAnECjUK0jiA
	sFZIlbqZQ1uzuasOTU3MjY+tDRyRdC97DlvmZJoC7/w9kzYH/w+LK9FBZ734NEJ6dscM9hxwG4wWz
	QgyK0Gqm8jJsNlwR/QhlhC6Sp1bPLez8AsjhXSo3ZIM/jLHJ//1XlNRBUwJh4adIMAq7Oe/E6rfy/
	UD/KLHRJVIKSWThlt/4pLbjGmBzSS/oB3DLbwCiPe7gH3kEiwARIpmE2UW8NdAfMOXIVhcSswP082
	CcrO0D3Q==;
Received: from [31.94.13.30] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yCW-00000008ft3-3b4H;
	Thu, 24 Oct 2024 13:48:33 +0000
Date: Thu, 24 Oct 2024 15:48:26 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: Miguel Luis <miguel.luis@oracle.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>, Shuah Khan <shuah@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Francesco Lavra <francescolavra.fl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_6/6=5D_arm64=3A_Use_SYSTEM=5FOF?=
 =?US-ASCII?Q?F2_PSCI_call_to_power_off_for_hibernate?=
User-Agent: K-9 Mail for Android
In-Reply-To: <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com>
References: <20241019172459.2241939-1-dwmw2@infradead.org> <20241019172459.2241939-7-dwmw2@infradead.org> <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com>
Message-ID: <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On 24 October 2024 14:54:41 CEST, Miguel Luis <miguel=2Eluis@oracle=2Ecom> =
wrote:
>Perhaps spec=2E F=2Eb=2E could be accommodated by first invoking SYSTEM_O=
FF2 with
>PSCI_1_3_OFF_TYPE_HIBERNATE_OFF and checking its return value in case of =
a
>fallback to an invocation with 0x0 ?

I wasn't aware there was any point=2E Are there any hypervisors which actu=
ally implemented it that way? Amazon Linux and Ubuntu guests already just u=
se zero=2E

We could add it later if such a hypervisor (now in violation of F=2Eb) tur=
ns up, I suppose?

