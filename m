Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DA606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1iLIQ4IT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=TO39YtUd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9R7rn27BTvQI3HlJKKfu8p/MBYgn8iEr6X7HO0Xk9Xo=; b=1iLIQ4ITZYzFg0
	sD2PAjvpG0eRgflJCmZ9sU0NaDLJ5KnO7j84SWSz0JAUFF9mklY2rHTFkQZmBw8BRbQWMRiHzYYCo
	lA3AWR/ysq2/lCNemjQ4yZIYu2Qgd1xBbth+NVX9y+WwplFTDsLvwOcMDljWxI4ASUNSbnFZtd4Fr
	VvS1eBuf0gNdM58TAjnraLkV2sFY/xDgORl1J0dAxROAFzzDvgzyxmSwHxQcrNJb1q/029xiy+qSp
	AXSoJonVMCo+05VLiWKg25J+n/K8+07h1WQh5571hEk6aw0vWv/u/LxE9JiyNIUNyOyGPDvNUeLHW
	J5L8F6lNA/kGUzNXaN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxgt-0000000069r-46UR;
	Mon, 02 Nov 2026 19:27:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxgs-0000000069C-01z5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:27:35 +0000
Received: from [10.4.158.9] (unknown [131.107.174.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6549D20B7166;
	Mon,  2 Nov 2026 11:27:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6549D20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793647638;
	bh=9R7rn27BTvQI3HlJKKfu8p/MBYgn8iEr6X7HO0Xk9Xo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TO39YtUd3Cf/StF0QdPN6j/y4FbKs8B4iukuDInUIKTsVQ1LEzXCfdknb5uZ9yR6g
	 3ho611vKzzuwp3vFYIg+aRD3vGJGC8lACS0ButV7faA5pYvf3tsTfix5VvL1wLluTa
	 L28VqbIrKkdSC4GVW4GL5tz22IwvjhYGEzwbQOdg=
Message-ID: <c87dc2c3-9211-46d2-9301-46a03d4b0ad7@linux.microsoft.com>
Date: Mon, 2 Nov 2026 11:27:37 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] arm64: hyperv: Detect Hyper-V via RSI host call in
 CCA Realms
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: decui@microsoft.com, haiyangz@microsoft.com, mhklinux@outlook.com,
 wei.liu@kernel.org, arnd@arndb.de, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, mark.rutland@arm.com,
 sudeep.holla@kernel.org, thuth@redhat.com, will@kernel.org
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-3-kameroncarr@linux.microsoft.com>
 <auh-KP-4gFxHtO1z@arm.com>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <auh-KP-4gFxHtO1z@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112734_073296_FA0FF363 
X-CRM114-Status: GOOD (  12.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

On 11/2/2026 4:12 AM, Catalin Marinas wrote:
> On Fri, Oct 30, 2026 at 05:14:08PM -0700, Kameron Carr wrote:
>> When booting without ACPI, hyperv_detect_via_smccc() detects Hyper-V by
>> querying the SMCCC vendor hypervisor UID. In an Arm CCA Realm the SMCCC
>> call is handled by the RMM rather than by the hypervisor, so the
>> query never reaches Hyper-V and detection fails.
>>
>> When running in a Realm, forward ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID
>> to the host with RSI_HOST_CALL instead, which is how Hyper-V hypercalls
>> are issued from a Realm.
>>
>> This is done in the Hyper-V code rather than in the generic
>> arm_smccc_hypervisor_has_uuid() because the other users expect different
>> behavior.
>>
>> hyperv_init() is an early_initcall and runs before the secondary CPUs
>> are brought up, so a single __initdata host call structure is used
>> without locking.
>>
>> ACPI-based detection and non-Realm guests are unaffected.
>>
>> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
> 
> This works for me, thanks. I replied to Dexuan clarifying my objection
> to v5 do the UUID check generically.

Thank you for your review and suggestions.
Your clarification makes sense.

Is this a "Reviewed-by" or an "Acked-by"?

-- 
Regards,
Kameron

