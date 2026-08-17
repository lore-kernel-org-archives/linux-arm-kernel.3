Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27199C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KjWXP+qZdAduuExhW3Uw0m7asrTX1tGFHFZbEdR7hI=; b=LcP7StLleaoL0ZSaTCxAHQv2qB
	bGMx3+XpNjscGsjkp4l9l4KBe2OtRObHIjCXBuxJxDcgHVio6f1abTFIcN4H5F5GSGbflAYJeDIjb
	QH2TNMLBjMKQ51i8Gab64yeJJJyQQpraxRHczfoDKGM/qPYSFL4PY9+zBuRh6sRVNwFtsqu359L4i
	HeSOo4Niu0mbxNnpTyHji5iPGGUoSU+pNe7INyTTUnTxQ41aiYaFKJV8Bs5c8yTYEMWfDsxBPmc22
	SQmJp+ZyXFL3IJ/tIhFjz65gUq5Lkea7jqdBtb1ZlO8s8VL+Hg4O7GsK+1uOZEvhO/K26ZD0nlpBw
	hsDRzS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwYR-000000068DP-3gxR;
	Mon, 17 Aug 2026 12:35:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwYP-000000068Cb-1LCq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:35:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso35841525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786970099; x=1787574899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KjWXP+qZdAduuExhW3Uw0m7asrTX1tGFHFZbEdR7hI=;
        b=hgpArzpw53i+//axkcitv71p9FMAMwZXkBnDShkLqYawfd9K125Vi76Or5OYyJ/Kd/
         qynSOS3CmePYWo+y5DaJ1kYWFI5AuXZa/IkZi3nfv967xvSBI7mb1XM45a64We2ygSGl
         H5VUSdafdqhZ7C85h8rrp/S9pIK0yziA0dyOfxiKmmGZbUfyHATO5zCMPqGgPy3JcGVH
         iwjvdqgcYE+vygMQcBmUnmK/DDBByOtBX/BCeHn/XPNSOO7UtSdYxYxw/smizZkEyDoE
         O/KzQ3YYLTyhU/ufTb1jObM9boRHFW6ulq3jsnvi2bBHeq/fTn9sl41tQFuwC/o23arp
         xKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970099; x=1787574899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KjWXP+qZdAduuExhW3Uw0m7asrTX1tGFHFZbEdR7hI=;
        b=fJpSuFhCeEfG9+VE0Udf36XS7S4BY59ElhTz+dVBwonpbJhmoT+5a3hIAbM++FN0np
         JkS1qagbo6wHkh9iUXqDe2M2lKCKUcGwNowf+YfaoEeh50HdwsFxiuJR+xpAz43LWW9B
         M1A+wV2M4ssna9QhjGFGOqXhPggC9lZgRqbC13sWim6rYcp2HIwCd2hBfbQDUq8qZKz+
         7oa5x2xqHuKMcca5oIXMlgmJUD/a07HQqlf8MVFMKIlVJSOqOVuptVab0Pz5piKhziaW
         uWxXoPupyc2vkm/fRJ2jgLfJwYwLbyCe6D74fx+rp2xd7+ycEDXFXJo2oM/bGsy5lwoF
         6O2w==
X-Forwarded-Encrypted: i=1; AHgh+Rrz4ikYx95V/QGrQCLCqCcRlcWox8bZhBM6Qhn+xpz3SpJhMUIRhZfgOtf5vP1crbddcB4k7/799yEW6Lno+E+W@lists.infradead.org
X-Gm-Message-State: AOJu0YzpJnRFKq+q1f2/QuVK9o6ciVhG06CUYg/UxvlY/SsrJVfsXBxh
	OikDfUjncBTGrsw68dr4WFlBW/L89tJ5T/aUz+R6B4x3j5EOtOAeczk7
X-Gm-Gg: AR+sD100xe6OtbiGnAPTqTWYHnOQkCNnjR/ZLrMCVLVPZYoSLi5gsvS57X6VDTcCFci
	bXRAVWz36OntnL+2UxtIspqGUF+bPhYuPJjGA8oefNNeZsAEYDVbfvYsq4q7pSxsINjEc2Ic2eC
	RrpCB522zjBFEUk3QaBS4umkuJz88xOeGFNGGXJGNWpf7O9NK+ftyC3lGjYvN8Y45XVT7sEOUmx
	7Gw8L2tDj8/TiMWdAYbihTKobQeT9xWtmO+/DpkjpCadWuiQY8zQZbQDsloShqOcjfAXaWBBXvX
	UDCi+gNKaR5kohJ8maYK5epws39lH9vt9Jv82HQnW6kyxCWSfeeBujA+PTdEhJXb2gzVhZxhHsb
	EyDxnuoHU8/6ve01g27sDhXnk5ktVs8Jj9KnN8SXAOU1x8BU/1YH6pAQyuSoQSZIRfttU3JRKuT
	7BfH+zM40dTBSTj8JzXaATcv7CGi6tmgYa3Fktd5krWpZd5j6umKUabdwoLsn6PAbXMtRs0jEU/
	l7lUN7ef6U44wsC9w==
X-Received: by 2002:a17:902:d4cf:b0:2ca:660:b1d with SMTP id d9443c01a7336-2d3b0d5eccfmr253638745ad.11.1786970098817;
        Mon, 17 Aug 2026 05:34:58 -0700 (PDT)
Received: from [10.26.143.42] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb511b0esm4947915ad.26.2026.08.17.05.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:34:58 -0700 (PDT)
Message-ID: <79ec6855-6764-407f-bf46-add1bdf36b69@gmail.com>
Date: Mon, 17 Aug 2026 20:34:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] KVM: selftests: Improve sea_to_user test
To: Marc Zyngier <maz@kernel.org>, Jiaqi Yan <jiaqiyan@google.com>
Cc: oupton@kernel.org, sebott@redhat.com, gshan@redhat.com,
 yuzenghui@huawei.com, rananta@google.com, joey.gouly@arm.com,
 suzuki.poulose@arm.com, pbonzini@redhat.com, shuah@kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130192837.890688-1-jiaqiyan@google.com>
 <86y0le9cvz.wl-maz@kernel.org>
Content-Language: en-US
From: Like Xu <like.xu.linux@gmail.com>
In-Reply-To: <86y0le9cvz.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_053501_383161_1DD7352D 
X-CRM114-Status: GOOD (  31.35  )
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

On 1/31/26 8:37 PM, Marc Zyngier wrote:
> On Fri, 30 Jan 2026 19:28:37 +0000,
> Jiaqi Yan <jiaqiyan@google.com> wrote:
>>
>> Several improvments to the test for KVM_EXIT_ARM_SEA:
>>
>> - Refactor run_vm to catch GUEST_FAIL, instead of causing confusing
>>    unhandled MMIO kvm exit.
>>
>> - Sync far_invalid to guest.
>>
>> - Exit test with KSFT_SKIP or KSFT_FAIL when should.
>>
>> - Add comment about VM backing memory type.
>>
>> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
>> ---
>>   .../testing/selftests/kvm/arm64/sea_to_user.c | 94 +++++++++++--------
>>   1 file changed, 53 insertions(+), 41 deletions(-)
> 
> Overall, this test is still pretty broken.
> 
> For example, on my Altra box:
> 
> maz@filthy-habits:~$ ./sea_to_user
> Random seed: 0x6b8b4567
> # Mapped 0x40000 pages: gva=0x80000000 to gpa=0xff80000000
> # Before EINJect: data=0xbaadcafe
> # EINJ_GVA=0x81234bad, einj_gpa=0xff81234bad, einj_hva=0xffff41234bad, einj_hpa=0xbad
> ok 1 # SKIP EINJ table not available in firmware
> 
> Well, not quite. EINJ *is* available, it is just that this test,
> contrary to *all* the other tests, requires some insanely high
> privileges. But the test is making stupid assumption.
> 
> But that's not all:
> 
> maz@filthy-habits:~$ sudo ./sea_to_user
> Random seed: 0x6b8b4567
> # Mapped 0x40000 pages: gva=0x80000000 to gpa=0xff80000000
> # Before EINJect: data=0xbaadcafe
> # EINJ_GVA=0x81234bad, einj_gpa=0xff81234bad, einj_hva=0xffff41234bad, einj_hpa=0x80041234bad
> # echo 0x10 > /sys/kernel/debug/apei/einj/error_type - done
> # echo 0x2 > /sys/kernel/debug/apei/einj/flags - done
> # echo 0x80041234bad > /sys/kernel/debug/apei/einj/param1 - done
> # echo 0xffffffffffffffff > /sys/kernel/debug/apei/einj/param2 - done
> # echo 0x1 > /sys/kernel/debug/apei/einj/notrigger - done
> sh: 1: echo: echo: I/O error
> Bail out! Failed to write EINJ entry: Success (0)
> # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Failed? Or Success? Who knows...
> 
> But frankly, the whole "embedded shell script" is disgusting. What is
> wrong with driving the injection from the test itself, rather than
> this access()+popen()? popen() itself is a liability (see the man page
> for system()), and should never be used for this sort of things.
> 
>>
>> diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
>> index 573dd790aeb8e..4a3511fa1f940 100644
>> --- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
>> +++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
>> @@ -12,6 +12,11 @@
>>    * including the notrigger feature. Otherwise the test will be skipped.
>>    * The under-test platform's APEI should be unable to claim SEA. Otherwise
>>    * the test will also be skipped.
>> + *
>> + * The VM backing memory is tied to HugeTLB 1G hugepage so far. Make sure
>> + * there are more than 4 1G hugepage on the system. They can be allocated
> 
> Why *more than*? Isn't that *at least* instead?
> 
>> + * at runtime by:
>> + *   echo 4 > /sys/kernel/mm/hugepages/hugepages-1048576kB/nr_hugepages
>>    */
> 
> Why can't you provide an adequate diagnostic instead of this stuff:
> 
> maz@filthy-habits:~$ ./sea_to_user
> Random seed: 0x6b8b4567
> ==== Test Assertion Failure ====
>    include/kvm_syscalls.h:58: mem != MAP_FAILED
>    pid=887 tid=887 errno=12 - Cannot allocate memory
>       1	0x0000000000405b4f: __kvm_mmap at kvm_syscalls.h:58 (discriminator 3)
>       2	 (inlined by) kvm_mmap at kvm_syscalls.h:65 (discriminator 3)
>       3	 (inlined by) vm_mem_add at kvm_util.c:1036 (discriminator 3)
>       4	0x0000000000402373: vm_create_with_sea_handler at sea_to_user.c:290
>       5	 (inlined by) main at sea_to_user.c:336
>       6	0x0000ffffb0dc229b: ?? ??:0
>       7	0x0000ffffb0dc237b: ?? ??:0
>       8	0x00000000004027ef: _start at ??:?
>    mmap() failed, rc: -1 errno: 12 (Cannot allocate memory)
> 
> What is preventing you from not requiring huge pages? And not
> requiring 4kB as the base page size?
> 
> Given how broken this is, I'm likely to disable this test until you
> fix it for real.

Pls help review the expect output:

# selftests: kvm: sea_to_user
# Random seed: 0x6b8b4567
# # Mapped 0x40000 pages: gva=0x80000000 to gpa=0xff80000000
# # Before EINJect: data=0xbaadcafe
# # EINJ_GVA=0x81234bad, einj_gpa=0xff81234bad, einj_hva=0xffff41234bad, 
einj_hpa=0x2141234bad
# 1..0 # SKIP EINJ debugfs interface not available; run as root with 
CONFIG_ACPI_APEI_EINJ and firmware EINJ support
ok 1 selftests: kvm: sea_to_user # SKIP
# 1 skipped test(s) detected.  Consider enabling relevant config options 
to improve coverage.
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:1 error:0

, and the diff behind:

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c 
b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index a23d74ed45035..7e86cbeb55291 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -86,25 +86,32 @@ static u64 translate_hva_to_hpa(unsigned long hva)

  static void write_einj_entry(const char *einj_path, u64 val)
  {
-	char cmd[256] = {0};
-	FILE *cmdfile = NULL;
+	char buf[32];
+	int fd, len, ret;

-	sprintf(cmd, "echo %#lx > %s", val, einj_path);
-	cmdfile = popen(cmd, "r");
+	fd = open(einj_path, O_WRONLY);
+	if (fd < 0)
+		ksft_exit_fail_perror(einj_path);

-	if (pclose(cmdfile) == 0)
-		ksft_print_msg("echo %#lx > %s - done\n", val, einj_path);
-	else
-		ksft_exit_fail_perror("Failed to write EINJ entry");
+	len = snprintf(buf, sizeof(buf), "%#lx\n", val);
+	ret = write(fd, buf, len);
+	if (ret != len)
+		ksft_exit_fail_perror(einj_path);
+
+	close(fd);
+	ksft_print_msg("%#lx > %s - done\n", val, einj_path);
  }

  static void inject_uer(u64 hpa)
  {
-	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
-		ksft_test_result_skip("EINJ table no available in firmware");
-
+	/*
+	 * Reading the ACPI EINJ table requires CAP_SYS_ADMIN, so a plain
+	 * access() check gives a false negative for unprivileged runs. Probe
+	 * the debugfs EINJ interface instead: it is only present when both
+	 * firmware and the kernel EINJ driver support error injection.
+	 */
  	if (access(EINJ_ETYPE, R_OK | W_OK) == -1)
-		ksft_test_result_skip("EINJ module probably not loaded?");
+		ksft_exit_skip("EINJ debugfs interface not available; run as root 
with CONFIG_ACPI_APEI_EINJ and firmware EINJ support\n");

  	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
  	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
> 
> Thanks,
> 
> 	M.
> 


