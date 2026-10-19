Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC860B3990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gDGbA+F9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PQtstQun
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZdr9+g7g3yBSEp8Q0dlokuJn/fy6MHL4T3a80Thsaw=; b=gDGbA+F9WbcgJo
	+GRBs4f8VQyBxVptowulnfLFI+m373oW7dXrFPRmsa17KnTw5g8yVZdG9dW5DjXiMunaaFydWF5X9
	iR+35eGOVeRWn4YAleidHsYibqUgfyJnUc5Thq/4EdALBYbbL7/o2U2rLUJ3bu/vL93dv85Db3cWO
	lvQcx4BZUHtnj2MdXdpHu2O56fJhrkzfSLcBqYseUHFKOqglLL4XhB9br3owO4L3wcm5ovWdpV2hZ
	ad1SH4aGpb6yaG7Z+h2kad/yfLuV0q3c93YcJiEn12bSVv/e1yoc9R5cMvQfu3vweoDSKyuTj0rIM
	DkO2aAHCSTiav+jXuBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpG3-00000007qUL-0e0K;
	Mon, 19 Oct 2026 15:26:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpG0-00000007qTy-1xUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F0681682;
	Mon, 19 Oct 2026 08:26:31 -0700 (PDT)
Received: from [10.57.14.104] (unknown [10.57.14.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6543F7D8;
	Mon, 19 Oct 2026 08:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792423594; bh=cL3qHThWa1njDRR6nIVmwjBUtd8ailifq2wyLdTNnBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PQtstQunEwAjlXCWtM940O0k/J/guOlKy6T26wtDH5Lv4hvIFMLUFpsmO/J091Mjp
	 ULEDxWPlwkl68eSZqIrw4znwcjmmVdObKldhvt5kLI62lJ/9fBxVWUb/r3V68G5mVW
	 D32fAJc4YU8bE7fDGZJonxsv5Uo5vGShjNnuguTM=
Message-ID: <4fcc7fd2-0314-49bf-8994-6ef570700c88@arm.com>
Date: Mon, 19 Oct 2026 16:26:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: insn: clean-up memory barrier types
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20261016165140.254791-1-ada.coupriediaz@arm.com>
 <20261016165140.254791-2-ada.coupriediaz@arm.com>
 <d8c784c0-ee8b-451f-879d-c3890f8dc63c@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <d8c784c0-ee8b-451f-879d-c3890f8dc63c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_082636_550577_4258FD3E 
X-CRM114-Status: GOOD (  13.17  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Barry Song <baohua@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Lucas Wei <lucaswei@google.com>, Andre Przywara <andre.przywara@arm.com>, Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

On 19/10/2026 11:07, Vladimir Murzin wrote:
> Hi Ada,
>
> On 10/16/26 17:51, Ada Couprie Diaz wrote:
>> Replace magic-numbers for offset and mask with shared defines.
>>
>> Re-order the types enum by value, matching the Arm ARM, and
>> define them with their proper values, simplifying their use.
>>
>> Arm ARM DDI 0487 version M.c[0] deprecated a number of types
>> used as options for the DMB and DSB instructions, with no change
>> in behaviour.
>> The deprecated types are not used in the kernel, so remove them
>> from our instruction generation framework and add the missing
>> `AARCH64_INSN_MB_OSH` case in `__get_barrier_crm_val()`.
>>
> Nitpick: this is slightly confusing since __get_barrier_crm_val()
> gets converted into  __is_valid_barrier_type()
Ah yes, as with patch 2 I did forget this when I reworked this part
of the changes, my mistake. Thanks !
>> This simplifies the switch-case and now covers all the enum types,
>> which allows for making the DSB and DMB generation non instrumentable
>> in a follow-up commit.
>>
>> [0]: https://support.arm.com/documentation/ddi0487/mc/
>>       (See C6.2.150, C6.2.152)
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> ---
>>   arch/arm64/include/asm/insn.h | 22 ++++++++----------
>>   arch/arm64/lib/insn.c         | 44 ++++++++++++-----------------------
>>   2 files changed, 25 insertions(+), 41 deletions(-)
>> [...]
> FWIW,
>
> Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Thanks for having a look !
Kind regards,
Ada

