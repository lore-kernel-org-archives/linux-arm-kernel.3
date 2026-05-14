Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD40CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoChJozCd8KUxZ0csGAjeOwVnefnLhcFSARdTB2pQh0=; b=3jyNf8bgmJjE81RWpKWnsa+UdY
	wAIydgNrpruf6qtub4jIxQHlExa4WoR4u6b8WJbVVxuNDic4Dg/YBsNsGgCLnBAPA+vHNsgwxH/Xa
	d1lY3DSxrxglqGTwOYPYMstBLnf7N2HjhoVb+upOtyspzXjar5+Jcm2UvgWjVNjsInHvtBFpOUxnG
	vDYgvVAl7Z4Vo9c7ft2yp0BICRvN1hdoO8VilI4P4G8prSSn4nhgXm3NC5CrHdRUp/04PEvb6Zt9G
	1Qchl3m3/1KuQuBbRfGGcupF2ucssGWFu1RSRnJBUSxCxVBM6KeLfTVmYSYwBxWHalpWHL4G1bPm6
	6cMUd1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXBy-00000005kwp-3YHI;
	Thu, 14 May 2026 14:37:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXBw-00000005kwI-49SL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2429460132;
	Thu, 14 May 2026 14:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB1C2BCB8;
	Thu, 14 May 2026 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769455;
	bh=5W0K9iBEUCn46xSeJ55rbYqtqOk71IxZe2qy8fAmrOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=flgII5oQWod75/+VvpbrvPqurD+8EQsFF/6rslkO5JrORlOD9psM56EQMXrt6gwRK
	 dKkUd6eh5KOY1supt5mwl8Df622Chcvfj8FieTa+8Vxfl1Ii51BFJAq86fw7QlsJja
	 6m4VvaEyCWJLEs39SdUoj0mtZycgGHPRn1Y8Gxh1jiKP8N5kbGGBABQ0etGH2SBJcV
	 x9n1WguF8hbJty5QgGAvBNLVBrnz4uPH0ygRt5Rnh3mT5oVeFZR13INQapEVKwdDLb
	 SL72FxcYfLTFtkUGEEPTB+iuhHa8UecHZ0SWPOuY96MnOZmXhoxPDDK0Z12chCEw61
	 p+Fa1cKojq0jA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
In-Reply-To: <2026051420-amusement-drove-73e6@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
 <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
 <2026051420-amusement-drove-73e6@gregkh>
Date: Thu, 14 May 2026 20:07:27 +0530
Message-ID: <yq5alddm5a6w.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Thu, May 14, 2026 at 12:04:13PM +0100, Suzuki K Poulose wrote:
>> Hi Aneesh
>> 
>> On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
>> > Make the SMCCC driver responsible for registering the arm-smccc platform
>> > device and after confirming the relevant SMCCC function IDs, create
>> > the arm_cca_guest auxiliary device.
>> > 
>> 
>> There are a few changes squashed in to this patch. Please could we
>> split the patch in the following order ?
>> 
>> 1. Add platform device for arm-smccc
>
> Do not make any more "fake" platform devices please.
>
>> 2. Move TRNG to Auxilliary Device - (Even though it is a later patch, move
>> it before the RSI changes)
>
> No, move it to the faux api please.
>


Maybe I was not complete in my previous reply. I did not want to repeat
the entire thread, so I quoted the lore link for more details.

1. We have platform firmware-provided SMCCC interfaces. Based on the
support/availability of these function IDs, we want to load multiple
drivers.
2. This patch series adds a platform device to represent the
firmware-provided SMCCC resource.
3. Different SMCCC ranges are now represented as auxiliary devices.
4. Different subsystems, such as TSM, can autoload their backend drivers
based on the availability of these SMCCC ranges, which are now
represented as auxiliary devices.

You had agreed to all of this in the previous discussion here:
https://lore.kernel.org/all/2025101516-handbook-hyphen-62ec@gregkh

-aneesh

