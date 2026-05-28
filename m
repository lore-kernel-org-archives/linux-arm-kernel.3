Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA1ECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 03:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw74MRuVap+euim+m8O+eFhYn9p3tagNAama2H6na1E=; b=bzSEP7Nj0OuNjqZ2yJm+4Ecm+Q
	3UWs8kDzTjNRTCamXmMi8AXl+1kAKw9znveHJRjdcSe4795ntoiLJ8H9SEgEEtPBg65qGkVCYnYgi
	w3IQoxzqc+eN2uqlsH1wN4x+nzSFgxgagzm3944O8xGuGmeK+NPmHNPiiWSPv+ikwJvsV4VnUtC4+
	LZnSBMm5pXhfxSUL4jxKisGxjzTL3T6j2GQibvGiDLj3EnI3+EhhXa3Ik1TAulPKYjTCY+OntBD+t
	ni7o81sPDNX5ewLUj2tOm0h/CDCXUZAmsDYBj/7Qcy76M21o+0JzwTtba56jfVSBorJqPDWzSrcfK
	U3OzdiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRFQ-000000053CL-43NW;
	Thu, 28 May 2026 03:17:28 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSRFP-000000053Bn-14gi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 03:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779938244; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Aw74MRuVap+euim+m8O+eFhYn9p3tagNAama2H6na1E=;
	b=CT4Z/7f22hINI7jZkkInSCTpUM1PMRWh/HjcKOoxn5VwjCUaaz4Ez2QjQBPrDW0aC44O7Iw5NhiIkfSGKH769+14ThnPk28I4vbYIrYkv6dL2KzbB3iF/j9wd3Hb70yMAi0xhAOyGkCwOtPxKwcvAUMBuk///sfGjm1bpYex0lA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0X3lAIi6_1779938240;
Received: from 30.246.179.14(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X3lAIi6_1779938240 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:17:21 +0800
Message-ID: <2e413153-c9e7-41dc-ad8e-522871381bf7@linux.alibaba.com>
Date: Thu, 28 May 2026 11:17:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/8] lib/tests: memcpy_kunit: add memcpy_mc() and
 memcpy_mc_large() test
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
 <20260518084956.2538442-9-tianruidong@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260518084956.2538442-9-tianruidong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_201727_471823_56A5079D 
X-CRM114-Status: GOOD (  19.78  )
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
> memcpy_mc() is the Machine-Check safe memcpy variant that returns the
> number of bytes NOT copied on a hardware memory error, or 0 on success.
> 
> Add two test cases modeled after the existing memcpy_test() and
> memcpy_large_test() implementations:

Same build issue as with copy_mc_page_test: memcpy_mc() is an arm64-
only symbol.

1. Cross-architecture build break (BLOCKER, same as patch 6)

    These tests are gated on CONFIG_ARCH_HAS_COPY_MC, which is also
    selected by x86_64 and ppc64. Neither architecture provides a
    memcpy_mc() symbol -- they use copy_mc_to_kernel() directly.

    On x86_64:

        lib/tests/memcpy_kunit.c: error: implicit declaration of
        function 'memcpy_mc' [-Werror=implicit-function-declaration]

    Fix: guard with __HAVE_ARCH_MEMCPY_MC instead:

        #ifdef __HAVE_ARCH_MEMCPY_MC
        static void memcpy_mc_test(...) { ... }
        static void memcpy_mc_large_test(...) { ... }
        #endif


> 
> Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> ---
>   lib/tests/memcpy_kunit.c | 113 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
> index 85df53ccfb0c..b4b2dafb50f1 100644
> --- a/lib/tests/memcpy_kunit.c
> +++ b/lib/tests/memcpy_kunit.c
> @@ -552,6 +552,115 @@ static void copy_mc_page_test(struct kunit *test)
>   		memcmp(page_dst + PAGE_SIZE, page_zero, PAGE_SIZE), 0,
>   		"copy_mc_page overflow into adjacent page");
>   }
> +/*
> + * memcpy_mc() is a Machine-Check safe memcpy variant.
> + * Signature: int memcpy_mc(void *dst, const void *src, size_t len)
> + * Returns:   0 on success, or number of bytes NOT copied on MC error.
> + *
> + * In the normal (no-poison) path it must behave identically to memcpy()
> + * and always return 0.
> + */
> +static void memcpy_mc_test(struct kunit *test)
> +{
> +#define TEST_OP "memcpy_mc"
> +	struct some_bytes control = {
> +		.data = { 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +		},
> +	};
> +	struct some_bytes zero = { };
> +	struct some_bytes middle = {
> +		.data = { 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +		},
> +	};
> +	struct some_bytes three = {
> +		.data = { 0x00, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
> +			},
> +	};
> +	struct some_bytes dest = { };
> +	int ret, count;
> +	u8 *ptr;
> +
> +	/* Verify static initializers. */
> +	check(control, 0x20);
> +	check(zero, 0);
> +	compare("static initializers", dest, zero);
> +
> +	/* Verify assignment. */
> +	dest = control;
> +	compare("direct assignment", dest, control);
> +
> +	/* Verify complete overwrite. */
> +	ret = memcpy_mc(dest.data, control.data, sizeof(dest.data));
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	compare("complete overwrite", dest, control);
> +
> +	/* Verify middle overwrite: 7 bytes at offset 12. */
> +	dest = control;
> +	ret = memcpy_mc(dest.data + 12, zero.data, 7);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	compare("middle overwrite", dest, middle);
> +
> +	/* Verify zero-length copy is a no-op. */
> +	dest = control;
> +	ret = memcpy_mc(dest.data, zero.data, 0);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	compare("zero length", dest, control);
> +
> +	/* Verify argument side-effects aren't repeated. */
> +	dest = control;
> +	ptr = dest.data;
> +	count = 1;
> +	memcpy(ptr++, zero.data, count++);
> +	ptr += 8;
> +	memcpy(ptr++, zero.data, count++);


    This is a verbatim paste from memcpy_test(). The intent is to
    verify that the memcpy_mc macro doesn't double-evaluate arguments,
    but the test doesn't actually call memcpy_mc(). Please change the
    two memcpy() calls to memcpy_mc() and assert their return values.

Thanks
Shuai

