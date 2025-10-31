Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95992CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FYJ8D7u/k2qYxeAygyymY1Npb81FPaF+arFjgRUBeE=; b=CHPGvwSpyAVM4R
	CRiw7BRwDANE0CMJLeD+oWAdfLb683nK2vXreQqkhu9od+pgcP0F7n83VAzhoPkRe9WpECq9j30vb
	iLZThYBnGur0U29Nei1BQwhWW3kic1/6QLb93rLtsRjezBKoF29I/67u9wBQJ8esoxjeDJYGTfzfJ
	kyIxTTEuWzcT1a0yrgrRPxo9ADf41rWcHIDw+ssYcd0d4aAU62bl1Qjn1riJRhsHSPm3jaRkbstxL
	sN+66LVZAgA+b4aAKD+DiI4vqBpSMxmqGbkVdhVkgdKMhJYPZn7M2XUbNb9Y9+2TPEI5OVpgTJbeS
	bwcg0wUqdr314VWULVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEq8g-00000006Eq0-2Gec;
	Fri, 31 Oct 2025 14:30:02 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEq8d-00000006Eoy-38cI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:30:01 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59VAeDFj020435;
	Fri, 31 Oct 2025 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=3FYJ8D7u/k2qYxeAygyymY1Npb81FPaF+arFjgRUBeE=; b=Y4qMl8JoZzer
	yH6/q35F5s+n7af0ZiP+QCDepNQbt/fPaEDky2DC4OcPgbKrLNVq1ZwQBw0Utk3Z
	l3OuVF9p5KbH59Lk4s/Jcog7TDqplCTSD9ZOW/JelScqZxa42uEHxJqboL69udYr
	LNDwnh1ytzieHzthjC5WHIITj3o0bonSeoJ2yhZjeITxsDuEGi7n0MHRgs1pOf9I
	ujma6LGPVgtGib0O/liqPtObc42PuOE5JOcNlxNkHnZbyTTZfaw89Xie8/371/0i
	FYuPBINiKEk6Hw3vGANlB1blUEk/qmt5JTQV7zaY2ZzFewMizRhD6Wgf7wF6zVoq
	yXybkFbVCw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agx16w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 14:29:52 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59VCdnES023847;
	Fri, 31 Oct 2025 14:29:51 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a33vxen11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 14:29:51 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59VETpsH4326218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Oct 2025 14:29:51 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E677958063;
	Fri, 31 Oct 2025 14:29:50 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DCB458059;
	Fri, 31 Oct 2025 14:29:50 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Oct 2025 14:29:50 +0000 (GMT)
MIME-Version: 1.0
Date: Fri, 31 Oct 2025 15:29:50 +0100
From: Harald Freudenberger <freude@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Ard
 Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Holger Dengler <dengler@linux.ibm.com>,
        Herbert Xu
 <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] SHA-3 library
Mail-Reply-To: freude@linux.ibm.com
In-Reply-To: <20251030171453.GA1624@sol>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com> <20251029163216.GA1603@sol>
 <fa8bc10f36b1aeb9ffe1abf6350adbc1@linux.ibm.com> <20251030171453.GA1624@sol>
Message-ID: <4f5cf63500da3e528d0ce74d617e0110@linux.ibm.com>
X-Sender: freude@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=K+gv3iWI c=1 sm=1 tr=0 ts=6904c7e0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JeQ386FCg45pv_AdrM0A:9 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: vyIPV_xetAk4YBfMUewVVdQoSnHuXhgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX2FoWJt0PTPb9
 7crTsLmcXlg4EqL/OH9R2ksrPM1sL+Sv+Jwm0gGMjACiipBKA5enOO+Gj4ZJrJQZzuUzLvKarI5
 zvmy3ThN5lgH1Cu6kyxSQvxn1Iatso+e40rc0Cq+uP4PyhuDb+zdsvHEsyeRboc6d869TQ4NZro
 TsX4XAgIIvb9X++uVOl5/12RibwFtCSujdrfwwko8cZnL6YCy7YO0NLJhjJlof/+ZS0kvG8XMQH
 EM6C3J4sTKC2+W0gJwIcjG8o+7gzBgnjrASpt+yXlsFAh1tjKLvyfqrumsJz2VXL8zG/PLAoXAw
 8LAY4yEj9IHR0lciVp+Rohw74aiF9NlqZ9sBLsfYQBWozC/RKarDEt+coZ61W7G72Pp3szi/5Iu
 C8Nj9qvKomB1ADxhipqPDwdYWNX47w==
X-Proofpoint-GUID: vyIPV_xetAk4YBfMUewVVdQoSnHuXhgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_072959_916998_69C8F760 
X-CRM114-Status: GOOD (  48.74  )
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
Reply-To: freude@linux.ibm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025-10-30 18:14, Eric Biggers wrote:
> On Thu, Oct 30, 2025 at 11:10:22AM +0100, Harald Freudenberger wrote:
>> On 2025-10-29 17:32, Eric Biggers wrote:
>> > On Wed, Oct 29, 2025 at 10:30:40AM +0100, Harald Freudenberger wrote:
>> > > > If the s390 folks could re-test the s390 optimized SHA-3 code (by
>> > > > enabling CRYPTO_LIB_SHA3_KUNIT_TEST and CRYPTO_LIB_BENCHMARK), that
>> > > > would be helpful.  QEMU doesn't support the instructions it uses.  Also,
>> > > > it would be helpful to provide the benchmark output from just before
>> > > > "lib/crypto: s390/sha3: Add optimized Keccak function", just after it,
>> > > > and after "lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
>> > > > functions".  Then we can verify that each change is useful.
>> > [...]
>> > >
>> > > Picked this series from your ebiggers repo branch sha3-lib-v2.
>> > > Build on s390 runs without any complains, no warnings.
>> > > As recommended I enabled the KUNIT option and also
>> > > CRYPTO_SELFTESTS_FULL.
>> > > With an "modprobe tcrypt" I enforced to run the selftests
>> > > and in parallel I checked that the s390 specific CPACF instructions
>> > > are really used (can be done with the pai command and check for
>> > > the KIMD_SHA3_* counters). Also ran some AF-alg tests to verify
>> > > all the the sha3 hashes and check for thread safety.
>> > > All this ran without any findings. However there are NO performance
>> > > related tests involved.
>> >
>> > Thanks!  Just to confirm, did you actually run the sha3 KUnit test and
>> > verify that all its test cases passed?  That's the most important one.
>> > It also includes a benchmark, if CONFIG_CRYPTO_LIB_BENCHMARK=y is
>> > enabled, and I was hoping to see your results from that after each
>> > change.  The results get printed to the kernel log when the test runs.
>> >
>> 
>> Here it is - as this is a zVM system the benchmark values may show 
>> poor
>> performance.
>> 
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel: KTAP version 1
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel: 1..1
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     KTAP version 1
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # Subtest: sha3
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # module: sha3_kunit
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     1..21
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 1 
>> test_hash_test_vectors
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 2
>> test_hash_all_lens_up_to_4096
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 3
>> test_hash_incremental_updates
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 4
>> test_hash_buffer_overruns
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 5 test_hash_overlaps
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 6
>> test_hash_alignment_consistency
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 7
>> test_hash_ctx_zeroization
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 8
>> test_hash_interrupt_context_1
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 9
>> test_hash_interrupt_context_2
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 10 
>> test_sha3_224_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 11 
>> test_sha3_256_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 12 
>> test_sha3_384_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 13 
>> test_sha3_512_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 14 
>> test_shake128_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 15 
>> test_shake256_basic
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 16 
>> test_shake128_nist
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 17 
>> test_shake256_nist
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 18
>> test_shake_all_lens_up_to_4096
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 19
>> test_shake_multiple_squeezes
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 20
>> test_shake_with_guarded_bufs
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=1: 14
>> MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=16: 109
>> MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=64: 911
>> MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=127:
>> 1849 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=128:
>> 1872 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=200:
>> 2647 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=256:
>> 3338 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=511:
>> 5484 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=512:
>> 5562 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=1024:
>> 8297 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=3173:
>> 12625 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=4096:
>> 11242 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     # benchmark_hash: 
>> len=16384:
>> 12853 MB/s
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel:     ok 21 benchmark_hash
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel: # sha3: pass:21 fail:0 
>> skip:0
>> total:21
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel: # Totals: pass:21 fail:0 
>> skip:0
>> total:21
>> Oct 30 10:46:44 b3545008.lnxne.boe kernel: ok 1 sha3
> 
> Thanks!  Is this with the whole series applied?  Those numbers are
> pretty fast, so probably at least the Keccak acceleration part is
> worthwhile.  But just to reiterate what I asked for:
> 
>     Also, it would be helpful to provide the benchmark output from just
>     before "lib/crypto: s390/sha3: Add optimized Keccak function", just
>     after it, and after "lib/crypto: s390/sha3: Add optimized one-shot
>     SHA-3 digest functions".
> 
> So I'd like to see how much each change helped, which isn't clear if 
> you
> show only the result at the end.

Yea, let's see ... Monday maybe ...

> 
> If there's still no evidence that "lib/crypto: s390/sha3: Add optimized
> one-shot SHA-3 digest functions" actually helps significantly vs. 
> simply
> doing the Keccak acceleration, then we should drop it for simplicity.
> 
>> > > What's a little bit tricky here is that the sha3 lib is statically
>> > > build into the kernel. So no chance to unload/load this as a module.
>> > > For sha1 and the sha2 stuff I can understand the need to have this
>> > > statically enabled in the kernel. Sha3 is only supposed to be
>> > > available
>> > > as backup in case of sha2 deficiencies. So I can't see why this is
>> > > really statically needed.
>> >
>> > CONFIG_CRYPTO_LIB_SHA3 is a tristate option.  It can be either built-in
>> > or a loadable module, depending on what other kconfig options select it.
>> > Same as all the other crypto library modules.
>> 
>> I know and see this. However, I am unable to switch this to 'm'. It 
>> seems
>> like the root cause is that CRYPTO_SHA3='y' and I can't change this to 
>> 'm'.
>> And honestly I am unable to read these dependencies (forgive my 
>> ignorance):
>> 
>> CONFIG_CRYPTO_SHA3:
>> SHA-3 secure hash algorithms (FIPS 202, ISO/IEC 10118-3)
>>  Symbol: CRYPTO_SHA3 [=y]
>>   Type  : tristate
>>   Defined at crypto/Kconfig:1006
>>     Prompt: SHA-3
>>     Depends on: CRYPTO [=y]
>>     Location:
>>       -> Cryptographic API (CRYPTO [=y])
>>         -> Hashes, digests, and MACs
>>           -> SHA-3 (CRYPTO_SHA3 [=y])
>>   Selects: CRYPTO_HASH [=y] && CRYPTO_LIB_SHA3 [=y]
>>   Selected by [y]:
>>     - CRYPTO_JITTERENTROPY [=y] && CRYPTO [=y]
> 
> Well, all that is saying is that there is a built-in option that 
> selects
> SHA-3, which causes it to be built-in.  So SHA-3 being built-in is
> working as intended in that case.  (And it's also intended that we no
> longer allow the architecture-optimized code to be built as a module
> when the generic code is built-in.  That was always a huge footgun.)  
> If
> you want to know why something that needs SHA-3 is being built-in, 
> you'd
> need to follow the chain of dependencies up to see how it gets 
> selected.
> 
> - Eric

Thanks

