Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E23FEA824
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfwgsxyetvVkWkjw944geP0YTgRPzBiFxhuEI/7Qh9U=; b=VNI/I83QyyvHOpbw0xxh8kXQJ4
	unERZokSRFEN0/PCFbjwLq5jdRR9DXxEtjZyFCMp3ELZKd5LeWfKhEpM6fm9J0A+x8JzZoIPWWzXg
	ysSipQ7udjprWWKB1Ti8Np3BDZAG4J9AHoahn2MW2UOnODYI5sVUGOOBKRIfPovolWrNZ5ETH5BjS
	OlaQsEUJ9mjw0nCMyfx+oEm9z13OgCHvlWv594geu8koeCIudAmhYAHfAxTm+ZqRoVns60EuKU9RK
	KR+vWDxdXex1DfT6V5Rg8M/k3AqWTBc/u0ilPeRPXd8ID7FF2jfuvfjUGz1kqRAutVO5AqTajt7ep
	FugYd2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LKO-000000037ln-3axq;
	Wed, 25 Mar 2026 10:19:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LKM-000000037lG-2x8S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:19:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDCCB16F2;
	Wed, 25 Mar 2026 03:18:58 -0700 (PDT)
Received: from [10.57.19.213] (unknown [10.57.19.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053C03F836;
	Wed, 25 Mar 2026 03:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774433944; bh=z7tv9NcJS0qO3APJoE8vhUUNkvrk5Nt5zInLK2D4mxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hANLq+zeBzW+3wlPHL7ZX55WYoA/35oe2P20QMKE0DqDwN8qkCD34iOnCidV/ru/K
	 iDJdcWPHt+TYLnTqwg22RAFzI4GKNAGHp/qwEJag+ejsQereYzujsOBJkYBawlvnyB
	 F0yaIm3DAJukfM+r+aoPQTlT0zV4Siz/r8dpQviA=
Message-ID: <21441277-b13a-4736-a268-f6e913d71779@arm.com>
Date: Wed, 25 Mar 2026 10:19:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, Steven Price <steven.price@arm.com>,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <779079e1-7193-46e9-b18c-9ab5e69bb077@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <779079e1-7193-46e9-b18c-9ab5e69bb077@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_031906_782196_76C3ABD0 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Gavin

On 25/03/2026 04:07, Gavin Shan wrote:
> Hi Steven,
> 
> On 3/19/26 1:53 AM, Steven Price wrote:
>>
>> This series is based on v7.0-rc1. It is also available as a git
>> repository:
>>
>> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
>>
>> Work in progress changes for kvmtool are available from the git
>> repository below:
>>
>> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v11
>>
> 
> Could you please share if we have a working qemu repository on top of this
> (v13) series? The previous qemu repository [1] seems out of dated for long
> time. I heard Jean won't be able to continue his efforts on QEMU part, who
> is going to pick it up in this case.
> 
> [1] https://git.codelinaro.org/linaro/dcap/qemu.git    (branch: cca/latest)

Unfortunately not at the moment. We have moved on to a simpler UABI,
which drops most of the previous configuration steps.

> 
>> Note that the kvmtool code has been tidied up (thanks to Suzuki) and
>> this involves a minor change in flags. The "--restricted_mem" flag is no
>> longer recognised (or necessary).
>>
>> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
>> use the following branch:
>>
>> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
>>
> 
> I'm seeing error to initialize RMM with the suggested RMM branch 
> (topics/rmm-v2.0-poc)
> and the upstream TF-A [1]. It seems the problem is compatible issue in the
> RMM-EL3 interface. RMM requires verion 2.0 while TF-A only supports 0.8. So
> I guess I must be using a wrong TF-A repository. Could you please share 
> which
> TF-A repository you use for testing?

See the other thread with Mathieu.

Kind regards
Suzuki

