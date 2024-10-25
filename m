Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C8D116FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yqhk9X0Hpv5XLgEFxivgetJ23tlmLhIvDHYvaF3/RF0=; b=iZkz1UcK64I6T2/gOyofWdJ+12
	TP9b86VmDGL67Xt/dacarzAQ7uLO83SJkGeQ9WBBoKA9gUkl1q3h0cZHWocZyvhUj7pcRi4DJZL44
	DaBauKQE8l2bLBt9yCDjMu74f9t8IRS5hIcN+QqZKPcmHmUP+PaPqpyGIcz9qXdApXncUntc5Vv9p
	4W4i5aqr0VGI2GI/SutUcoKGlPX9hv0T/BXeggdZ1oGKvEDCK3chX/Y79TwO/3qGxsh54rN638BJS
	rNBk8UBECj7qrudLLV5h1afc6zES2gcvTA4SK3ZA5bg3A8IWhymwwxq2k2uuSBAeq9k8C7OATN2Zv
	WfFMnaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Db3-00000002ee4-11D3;
	Fri, 25 Oct 2024 06:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DZU-00000002eOe-3cMo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 06:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Yqhk9X0Hpv5XLgEFxivgetJ23tlmLhIvDHYvaF3/RF0=; b=M3Fp92MpdZcnNiNxDY5LYNlsfQ
	IkV4ivBXpPQQRb3Ck3yLPwIJm36djIj9TL9qKmD/XDH9tEQtYFPQ5pQ1MBDYjweS5LOEXo45X+W+W
	XuUcsZlVdUzZxT02yjYXjUP92vURayFIJZyNhHMoDAzZ6PMapzGiqmnRWFEbDEPsXEk/AEAkBDPy/
	6za1uQZx/Z5J3OQytaJImBEv5X5h7O6XY9Ha1/cI0wSOPo/EHJFlwUuPeKtdO+Z/jhp3n/mSnyi3l
	VkzFd3rYSufi9c937pkpMPCKAOSGu8PsMbT4Abnk4wjqduo8ISrlISGdJK1tkVdEr86/BQT8CdEvL
	kbF4CIbA==;
Received: from [69.6.35.226] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DZI-00000008qB8-1qL8;
	Fri, 25 Oct 2024 06:13:06 +0000
Date: Fri, 25 Oct 2024 08:13:03 +0200
From: David Woodhouse <dwmw2@infradead.org>
To: Oliver Upton <oliver.upton@linux.dev>
CC: Miguel Luis <miguel.luis@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
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
In-Reply-To: <ZxqmsiXV6ZYTANKY@linux.dev>
References: <20241019172459.2241939-1-dwmw2@infradead.org> <20241019172459.2241939-7-dwmw2@infradead.org> <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com> <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org> <ZxprcWDe2AXuLhD_@linux.dev> <691447A1-8F3F-4890-B00F-8068A14CA126@infradead.org> <ZxqmsiXV6ZYTANKY@linux.dev>
Message-ID: <627769A8-AF84-47A1-B4F9-5F44C75A8058@infradead.org>
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

On 24 October 2024 21:57:38 CEST, Oliver Upton <oliver=2Eupton@linux=2Edev>=
 wrote:
>On Thu, Oct 24, 2024 at 05:56:09PM +0200, David Woodhouse wrote:
>> On 24 October 2024 17:44:49 CEST, Oliver Upton <oliver=2Eupton@linux=2E=
dev> wrote:
>> >IIUC, you're really wanting to 0x0 because there are hypervisors out
>> >there that violate the final spec and *only* accept this value=2E
>> >
>> >That's perfectly fine, but it'd help avoid confusion if the supporting
>> >comment was a bit more direct:
>> >
>> >	/*
>> >	 * If no hibernate type is specified SYSTEM_OFF2 defaults to
>> >	 * selecting HIBERNATE_OFF=2E
>> >	 *
>> >	 * There are hypervisors in the wild that violate the spec and
>> >	 * reject calls that explicitly provide a hibernate type=2E For
>> >	 * compatibility with these nonstandard implementations, pass 0
>> >	 * as the type=2E
>> >	 */
>> >	 if (system_entering_hibernation())
>> >		invoke_psci_fn(PSCI_FN_NATIVE(1_3, SYSTEM_OFF2), 0 , 0, 0);
>>=20
>> By the time this makes it into released versions of the guest Linux ker=
nel, that comment won't be true any more=2E
>
>Then does it even matter? What is the problem you're trying to solve
>with using a particular value for the hibernate type?
>
>Either the goal of this is to make the PSCI client code compatible with
>your hypervisor today (and any other implementation based on 'F ALP1') or
>we don't care and go with whatever value we want=2E
>
>Even if the comment eventually becomes stale, there is a ton of value in
>documenting the exact implementation decision being made=2E
>

Eventually it won't matter and we can go with whatever value we want=2E Bu=
t yes, the goal is to be compatible with the hypervisor *today* until it ca=
tches up the changes to the final versions of the spec=2E I didn't spend mu=
ch time overthinking the comment=2E What was it=2E=2E=2E=2E

	/*
	 * Zero is an acceptable alternative to PSCI_1_3_OFF_TYPE_HIBERNATE_OFF
	 * and is supported by hypervisors implementing an earlier version
	 * of the pSCI v1=2E3 spec=2E
	 */

That seems to cover it just fine, I think=2E

