Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AECCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qzhck0gw9pgwJJr+ZjjO323vwaaYqicFxNlPj8CzbAU=; b=OmA21Yyj/cp33CDrjHtAPDpI0g
	34cXBd8XNGPJOq4E5uqT6SiiT8s0OkF0nOePUbu5sDfWmhJqV1gQCvcVOk+0JF932i/4BmsBV/2Wk
	0xcK8RxrMLlK30tVIOX4NPGgfu8g0yXLfJYy4Pz7jhlrJvgoGpZ/X/JtWrNFOlnvsUksVrwOebKNB
	UPEIHPg8rBl1KZxUPuKJdOrO9YlfxMVSshvoHnZ+XS3kCCsSTHbuSkYogg4Kgwc0VDwkztCSr4VWR
	lip7b+6uZX6FphJil/OaZ3Z7Nhm4P37yGM7ydvWnZ5VAzMNOXrDRtywO3KnGzMhdpnOVHo5xIm+GV
	113wqBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEYO-00000004E4d-0Xbr;
	Wed, 27 May 2026 13:44:12 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEYH-00000004E3P-3qN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779889439; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Qzhck0gw9pgwJJr+ZjjO323vwaaYqicFxNlPj8CzbAU=;
	b=jW1Tm5jC9vRGaX/pQDf7yWqXUnnvzypjojAHC9XeBLiHjD+ZVefCJriMa4EYS/zVZa+/bfiuqKG17UYqPZYSJqaGaI3KHn8phHacsqkoxhAqS0UDJ0iX9xIK9dgA+KMrPDekR7VAEHohFKMD85CyUqaYZ/A0O+esONMTGBAj6Tk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0X3jnw6a_1779889436;
Received: from 30.246.179.14(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X3jnw6a_1779889436 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 21:43:58 +0800
Message-ID: <f75d7ff8-d965-4f17-8548-2525512a400a@linux.alibaba.com>
Date: Wed, 27 May 2026 21:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/8] lib/test: memcpy_kunit: add copy_page() and
 copy_mc_page() tests
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, tony.luck@intel.com,
 guohanjun@huawei.com, mchehab@kernel.org, tongtiangen@huawei.com,
 james.morse@arm.com, robin.murphy@arm.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
 <20260518084956.2538442-7-tianruidong@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260518084956.2538442-7-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_064407_040596_84925CAC 
X-CRM114-Status: GOOD (  19.09  )
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



On 5/18/26 4:49 PM, Ruidong Tian wrote:
> Add KUnit tests for copy_page() and copy_mc_page(), modeled after
> the existing memcpy_test() style: a static page-aligned src and a
> two-page dst, filled with random bytes plus non-zero edges, then
> verify byte-for-byte equality and that the adjacent page is
> untouched. The copy_mc_page() case additionally checks the return
> value is 0 on clean memory and is gated on CONFIG_ARCH_HAS_COPY_MC.
> 
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
>   lib/tests/memcpy_kunit.c | 67 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
> index d36933554e46..85df53ccfb0c 100644
> --- a/lib/tests/memcpy_kunit.c
> +++ b/lib/tests/memcpy_kunit.c
> @@ -493,6 +493,67 @@ static void memmove_overlap_test(struct kunit *test)
>   	}
>   }
>   
> +/* --- Page-sized copy tests --- */
> +
> +static u8 page_src[PAGE_SIZE] __aligned(PAGE_SIZE);
> +static u8 page_dst[PAGE_SIZE * 2] __aligned(PAGE_SIZE);
> +static const u8 page_zero[PAGE_SIZE] __aligned(PAGE_SIZE);
> +
> +static void init_page(struct kunit *test)
> +{
> +	/* Get many bit patterns. */
> +	get_random_bytes(page_src, PAGE_SIZE);
> +
> +	/* Make sure we have non-zero edges. */
> +	set_random_nonzero(test, &page_src[0]);
> +	set_random_nonzero(test, &page_src[PAGE_SIZE - 1]);
> +
> +	/* Explicitly zero the entire destination. */
> +	memset(page_dst, 0, ARRAY_SIZE(page_dst));

    init_page() memsets the entire two-page page_dst to zero, and the
    test then asserts the second page is still zero. A buggy copy_page()
    that overwrites the second page with bytes that happen to include a
    zero byte would still pass.

    Please fill page_dst with a non-zero sentinel (e.g. 0xA5) instead
    of zero, and check the second half against that sentinel using
    memchr_inv():

        memset(page_dst, 0xA5, ARRAY_SIZE(page_dst));
        ...
        KUNIT_ASSERT_TRUE_MSG(test,
            !memchr_inv(page_dst + PAGE_SIZE, 0xA5, PAGE_SIZE),
            "copy_page overflow into adjacent page");

    This also lets you delete page_zero[] entirely, which on
    PAGE_SIZE=64K configs (arm64) saves a non-trivial amount of BSS.


> +}
> +
> +static void copy_page_test(struct kunit *test)
> +{
> +	init_page(test);
> +
> +	/* Copy. */
> +	copy_page(page_dst, page_src);
> +
> +	/* Verify byte-for-byte exact. */
> +	KUNIT_ASSERT_EQ_MSG(test,
> +		memcmp(page_dst, page_src, PAGE_SIZE), 0,
> +		"copy_page content mismatch with random data");
> +
> +	/* Verify no overflow into second page. */
> +	KUNIT_ASSERT_EQ_MSG(test,
> +		memcmp(page_dst + PAGE_SIZE, page_zero, PAGE_SIZE), 0,
> +		"copy_page overflow into adjacent page");
> +}
> +
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +static void copy_mc_page_test(struct kunit *test)
> +{
> +	int ret;
> +
> +	init_page(test);
> +
> +	/* Copy and check return value. */
> +	ret = copy_mc_page(page_dst, page_src);

 From sashiko:

Does this introduce a build regression on architectures like x86_64 or
powerpc?
The CONFIG_ARCH_HAS_COPY_MC flag is selected by multiple architectures,
but copy_mc_page() is an arm64-specific API. Other architectures use the
generic copy_mc_to_kernel() API instead.
If the kernel is built with KUnit enabled on non-arm64 architectures, it
appears copy_mc_page() would be an undeclared identifier.


Thanks.
Shuai

