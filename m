Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA52606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 00:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwB08eqk;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=mv7SX9h2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8/qTbI62mjIsuFversGAlrB/yJw9VmdLUTb4PF/KWfU=; b=XwB08eqkCw9nHy
	fq2msmURP7HWi6mBPfL/Q7Mwl4+E/90CA3qXG13qsjRxOfNHlezn4r0oOdjtNDTD9u7rTqmzbT/5B
	d8A+AKIrvSOgCb1AzSXIMVW9Zwi8UVH9S4ejWYsdi9DhI26bisEsffzUiyvXZ8kJvaNtErHQFNLku
	axuU4mf4akQQVl11v4wzhvIClqJs881pe0RJRlj+OGpba341qogc0qb2AUG+t0lbOvRbnoHHICEt/
	WLi0j0+cDkU9t79azL93k+h19FlKphNHX/F5kGQSrZVM1e+QWmR2k0Zkvtk1hXDiRuTZ+085F3ini
	qyaUTLoEG9dAQkDBv5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEJn-00000008763-1vuT;
	Thu, 29 Oct 2026 00:48:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEJj-0000000875D-2HrK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 00:48:32 +0000
Received: from [192.168.0.15] (unknown [52.172.102.253])
	by linux.microsoft.com (Postfix) with ESMTPSA id DCA8C20B7167;
	Wed, 28 Oct 2026 17:48:14 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DCA8C20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793234897;
	bh=8/qTbI62mjIsuFversGAlrB/yJw9VmdLUTb4PF/KWfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mv7SX9h2iXoe0BNxs9zhVTBplDrTb9yhTnaUHzak2ekbF6K5Rw5fV0RPI98Pac0uF
	 nwQNyyReUqBj9pZhnqwNE1pPy6qvtpR+yH9TPflgQqjej45De3SXK67xEEcFwFyXe8
	 p86EWPHYun9frPQyZfA5vztB4ETPkbcdAhU0QQRQ=
Message-ID: <c363c01d-b99b-4b87-adc1-0f706b417330@linux.microsoft.com>
Date: Wed, 28 Oct 2026 17:48:23 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] arm64: rsi: Add RSI host call structure and helper
 function
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-2-kameroncarr@linux.microsoft.com>
 <20261022074138.GA1512710@liuwe-devbox-debian-v2.local>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <20261022074138.GA1512710@liuwe-devbox-debian-v2.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_174831_618718_963EB354 
X-CRM114-Status: GOOD (  11.64  )
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

Hello ARM maintainers,

On 10/22/2026 12:41 AM, Wei Liu wrote:
> On Fri, Oct 02, 2026 at 02:57:20PM -0700, Kameron Carr wrote:
>> Add struct rsi_host_call to arm-smccc-rsi.h, which represents the host
>> call data structure used by the Realm Management Monitor (RMM) for the
>> RSI_HOST_CALL interface. The structure contains a 16-bit immediate field
>> and 31 general-purpose register values, aligned to 256 bytes as required
>> by the CCA RMM specification.
>>
>> Add rsi_host_call() static inline wrapper in arm-rsi-cmds.h that invokes
>> SMC_RSI_HOST_CALL with the physical address of the host call structure.
>> This will be used by Hyper-V guest code to route hypercalls through the
>> RSI interface when running inside an Arm CCA Realm.
>>
>> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
>> ---
>>  include/linux/arm-rsi-cmds.h  | 22 ++++++++++++++++++++++
>>  include/linux/arm-smccc-rsi.h |  7 +++++++
> 
> ARM maintainers, I think this needs an ack from you?
> 
> Wei

Do you have any issues with this patch?

-- 
Regards,
Kameron

