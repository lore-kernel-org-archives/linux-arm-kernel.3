Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B2CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQh+YpaHfdrK1kjIhTBoMDrV84DSrT9CIwd9K0b6WSE=; b=hrPgzL/obcQNU0VYrr03SXrV4Q
	eYaidB6BjdPvYDPCPqESwXmZ3KPB9lYdPT98SnZHzr8/3IXd5RHYpVdKICoHb6Zses+jprLaJno/+
	loHxFwd+Juygpd7KjCtacVPySjxnFpiLzqOq5WvCzEfPktwUa6138cENWJW+4DdKpzY/hqbfuyoMl
	x+Hi4+r786HlT6lhQUlyVlgGqFG5m321jWXhos0oInu4p93qVoBnkgWY0fvFRv6VR1+nfxxj74zb+
	aUl0p6znjteoUA47oPKCDH2Kfs/G5vavb3geuKJx2AkeM2W3i4AHLPHEAtbq1FUEYwEXCFYpZyyXY
	Z7tk5uzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmCD-000000036tM-1dZb;
	Tue, 11 Feb 2025 09:04:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm6F-0000000361k-1EF0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:58:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C72091477;
	Tue, 11 Feb 2025 00:58:55 -0800 (PST)
Received: from [10.57.83.200] (unknown [10.57.83.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FBD13F5A1;
	Tue, 11 Feb 2025 00:58:28 -0800 (PST)
Message-ID: <d009306c-eb1c-48ca-ab8e-d891b413d55f@arm.com>
Date: Tue, 11 Feb 2025 09:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 8/8] mm: Add basic tests for kpkeys_hardened_cred
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Howells <dhowells@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
 <20250203102809.1223255-9-kevin.brodsky@arm.com>
 <202502062024.BCB0DED1D5@keescook>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <202502062024.BCB0DED1D5@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005835_467351_9803C4BC 
X-CRM114-Status: GOOD (  31.12  )
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

On 07/02/2025 05:52, Kees Cook wrote:
> On Mon, Feb 03, 2025 at 10:28:09AM +0000, Kevin Brodsky wrote:
>> Add basic tests for the kpkeys_hardened_pgtables feature: try to
>> perform a direct write to current->{cred,real_cred} and ensure it
>> fails.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  mm/Makefile                    |  1 +
>>  mm/kpkeys_hardened_cred_test.c | 42 ++++++++++++++++++++++++++++++++++
> Current file naming convention[1] would be to name this as:
>
> 	mm/tests/kpkeys_hardened_cred_kunit.c

I wasn't aware of those guidelines, thanks for the pointer! I got
inspiration from various existing tests, it unfortunately looks like the
conventions in [1] have not been universally adopted. I'll try to follow
them in the next version (of both RFC series).

> [...]
>
> +static void write_cred(struct kunit *test)
> +{
> +	long zero = 0;
> +	int ret;
> +
> +	ret = copy_to_kernel_nofault((unsigned long *)current->cred, &zero, sizeof(zero));
> +	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
> +			    "Write to current->cred wasn't prevented");
> +
> +	ret = copy_to_kernel_nofault((unsigned long *)current->real_cred, &zero, sizeof(zero));
> +	KUNIT_EXPECT_EQ_MSG(test, ret, -EFAULT,
> +			    "Write to current->real_cred wasn't prevented");
> This is a good negative test. I would include a positive test as well.
> i.e. make sure you can run copy_from_kernel_nofault() to read it
> successfully. Otherwise you don't know if you're just getting a bad
> address -- we want to distinguish between them. (This is more true for
> the next suggestion, since current->cred being broken would be much more
> obvious.)

That's a fair point, I've actually run into this sort of issues with the
page table tests (in the other RFC series). I can add positive tests
with a regular read (e.g. reading current->cred->uid directly) - no
fault is expected to occur in that case.

> While current->cred is good and easy, I would like to see prepare_creds()
> exercised too to get a new cred and validate that it is equally directly
> readable and directly not writable, and then use the correct accessors
> to perform a successful write to the cred, read back the change,
> etc. (i.e. validate the expected behavior too.)

prepare_creds() does not allocate protected memory, see the introduction
in the cover letter and patch 6. However I could certainly add such
tests for the new helpers protect_creds() and prepare_protected_creds(),
which are meant to be used with override_creds().

>> +}
>> +
>> +static int kpkeys_hardened_cred_suite_init(struct kunit_suite *suite)
>> +{
>> +	if (!arch_kpkeys_enabled()) {
>> +		pr_err("Cannot run kpkeys_hardened_cred tests: kpkeys are not supported\n");
>> +		return 1;
>> +	}
> Instead of failing ("return 1") I think this should be a "skip" (it is
> expected to not work if there is no support) in each test instead:

kasan_suite_init() uses this approach if KASAN is disabled, but skipping
does seem to be a better idea - this way it doesn't show up as an error.

> 	if (!arch_kpkeys_enabled())
> 		kunit_skip(test, "kpkeys are not supported\n");
>
> I'm very happy to see tests! :)

Thank you for the review and suggestions!

- Kevin

