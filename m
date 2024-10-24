Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E94CE8E91
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEyOjfWbUxIAyxFc/S0iV8ZJySQkSomEtN2A/QMyFoo=; b=Zv2hUkkC4Ptae82SpFaeungXVx
	qnX7Vop/drbRi7/C2M6l/28qlhCFc9qjmhsRx/d00Nv35EPJ0KsE0nIbRd2ZNLuNWfJl5JtlGtICl
	sURo+krZdzFyEE7m/fUXki64DgXL/EPgFSKOxaP/BPIVlQNaKrSq9rmo14lf7exDqV2NS0h/8qYcW
	PuP4zKHp+c2Qy8kU0ZbycfrDEXqlWXUb85B3hV7dNmtrsCFc7hlyzHdcj8G0FjklthAtPDRH9upvI
	lt+brnurYI2hTg96REDvHN7QHeYMjB4DH/SiuSc1Q0F219F0DFwe1H0r774i5lMfpt70BJNUws3SE
	vust0+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40LS-0000000122q-3QOu;
	Thu, 24 Oct 2024 16:05:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40CA-000000010Eu-3nWW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dEyOjfWbUxIAyxFc/S0iV8ZJySQkSomEtN2A/QMyFoo=; b=dV1S5ICZvgKROwZdemu1KjNcnX
	H3PJ1kv870MmHX+cSLKhiO93gvmgpf4iUgPsDWjuXUGE4eLZ+7r9bTGIFOm2yLb5LaKMQGqLh94D0
	8dhi6cIqeIo+wH6DLEdXQWs/W4/6mn5UAssAb4e+xJOAdyFIB2BqB21YhOcVMaM8UpsU+1Hktjq7Y
	rs0gdSvdtv+kmvv7Nxg2Pe23YWhAuFy+WkEleVxn7m/9ogbMWEbailZXgQ3yK4MUIP5bR6V/WPdBG
	6lz9VwVetW/w/vnbm5htiSBLov2HkYsYj/WjIFdhCNc16J7vGKufUwWD+gpgdM938TFmM0NsbzzW/
	bGhLnwTw==;
Received: from [31.94.24.214] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t40C6-00000008iBu-12hz;
	Thu, 24 Oct 2024 15:56:14 +0000
Date: Thu, 24 Oct 2024 17:56:09 +0200
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
In-Reply-To: <ZxprcWDe2AXuLhD_@linux.dev>
References: <20241019172459.2241939-1-dwmw2@infradead.org> <20241019172459.2241939-7-dwmw2@infradead.org> <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com> <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org> <ZxprcWDe2AXuLhD_@linux.dev>
Message-ID: <691447A1-8F3F-4890-B00F-8068A14CA126@infradead.org>
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

On 24 October 2024 17:44:49 CEST, Oliver Upton <oliver=2Eupton@linux=2Edev>=
 wrote:
>Hi,
>
>On Thu, Oct 24, 2024 at 03:48:26PM +0200, David Woodhouse wrote:
>> On 24 October 2024 14:54:41 CEST, Miguel Luis <miguel=2Eluis@oracle=2Ec=
om> wrote:
>> >Perhaps spec=2E F=2Eb=2E could be accommodated by first invoking SYSTE=
M_OFF2 with
>> >PSCI_1_3_OFF_TYPE_HIBERNATE_OFF and checking its return value in case =
of a
>> >fallback to an invocation with 0x0 ?
>
>This already complies with F=2Eb=2E
>
>The PSCI implementation is required to accept either 0 or 1 for
>HIBERNATE_OFF=2E Using 0 seems like a good choice for compatibility since=
 =2E=2E=2E
>
>> I wasn't aware there was any point=2E Are there any hypervisors which a=
ctually implemented it that way? Amazon Linux and Ubuntu guests already jus=
t use zero=2E
>>=20
>> We could add it later if such a hypervisor (now in violation of F=2Eb) =
turns up, I suppose?
>
>IIUC, you're really wanting to 0x0 because there are hypervisors out
>there that violate the final spec and *only* accept this value=2E
>
>That's perfectly fine, but it'd help avoid confusion if the supporting
>comment was a bit more direct:
>
>	/*
>	 * If no hibernate type is specified SYSTEM_OFF2 defaults to
>	 * selecting HIBERNATE_OFF=2E
>	 *
>	 * There are hypervisors in the wild that violate the spec and
>	 * reject calls that explicitly provide a hibernate type=2E For
>	 * compatibility with these nonstandard implementations, pass 0
>	 * as the type=2E
>	 */
>	 if (system_entering_hibernation())
>		invoke_psci_fn(PSCI_FN_NATIVE(1_3, SYSTEM_OFF2), 0 , 0, 0);

By the time this makes it into released versions of the guest Linux kernel=
, that comment won't be true any more=2E


