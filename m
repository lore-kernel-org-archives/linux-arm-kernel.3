Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283AEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 03:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKYhG73DgTzdzGbCDN3buAMRRvqorJzXDUPZ8hgusWg=; b=Uaho5ixDt48DX5+5X34FdhPNeF
	3oHYDr40bSgIar/nyqeHgJC96tGVM1ef1GJOniWsFY3n6mDkqGOArlp7S8ZHMNheGZ2h0l8zxxKbw
	j7BYhui06CmlkS4WMuQZAgj5rM5xhsRf6k7l//QwQfbbVKTblSHHkUEdGcyXMMHf1r73jQ+NmCE5I
	WoN+pi2OGPrwWi3AYXsbUmjPNn4Tfc3BowvmChpZYW+d6Z95xEuBt/AgS5DE40+9YbbtOgS9EczS7
	ghqYRIrZfkhL36Sd7dSAamh9YIgvM9RPgYM/XfIlUxUEN2xBuqWrENymVDuqU5Z/YxiqHId61CHYW
	tP/tCNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEKHe-00000008JGu-3Ubo;
	Mon, 12 May 2025 03:56:54 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEKFb-00000008J5N-0SnP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 03:54:48 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BIftvB020816;
	Mon, 12 May 2025 03:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QKYhG7
	3DgTzdzGbCDN3buAMRRvqorJzXDUPZ8hgusWg=; b=piKulDmQFceuNnPByx+JJK
	NFwRc//jrMpfzH/+Qi7AKY8dTwt7IvHZAzjz5sm4FzEo5nHu57rvHkRK2sJDuwEH
	4NlwIvp9uVrYEHZgK2CuZnrtx4dLEd96ro1txixgXCE7G6EKaUI1NJZBkwJzGH1c
	lYUPWw9D9wblqlgR0b5DqVnBJWgQcIUrOkS7M7EotdhjtEsCxzDEoAJ2z2lW0ncb
	I/6Fq56SFaOFS+hS9gZQnSd5r5XIovYcUfaiF3MpkjRU9bHDSVzEHjbTyt8oDgzn
	Y7NDrlQqumZ0GbPngQfuv/U3YcuGcle3LZRCPQc3p21dbhvL7EqZSxaJSyYgVvPA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jue6a1yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:54:23 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54C3lJmk029084;
	Mon, 12 May 2025 03:54:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jue6a1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:54:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C0UGDc024537;
	Mon, 12 May 2025 03:54:22 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jjmkv3ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:54:22 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C3sKRD21234270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 03:54:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6BC958052;
	Mon, 12 May 2025 03:54:20 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A404258056;
	Mon, 12 May 2025 03:54:12 +0000 (GMT)
Received: from [9.61.250.60] (unknown [9.61.250.60])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 03:54:12 +0000 (GMT)
Message-ID: <fb39efbc-9045-4fbd-a5d6-ababc320b9ef@linux.ibm.com>
Date: Mon, 12 May 2025 09:24:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Fix bpf selftest build error
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-next@vger.kernel.org
Cc: ast@kernel.org, hbathini@linux.ibm.com, maddy@linux.ibm.com,
        andrii@kernel.org, daniel@iogearbox.net, mykolal@fb.com,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, shuah@kernel.org
References: <20250509122348.649064-1-skb99@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250509122348.649064-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dwbpe1-9DBWSf9jxrLtyGxDhLR4w5eDv
X-Authority-Analysis: v=2.4 cv=TbmWtQQh c=1 sm=1 tr=0 ts=682170ef cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rOUgymgbAAAA:8 a=CcSt_Cs7RvpnTRKdI0oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: SeUpvmWKQ7SNL2oqQIzFx069GANDB4xi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAzNSBTYWx0ZWRfX3J8rMnm/4r9H a0X0lU/EeRTB1mLTX2WUe+0QgUN24/RoQqRhs0vDdGXUqwTH8/+iz1Ua0KqbDUcJTds7p/U7QzT +LOPZE8lLZ2ukU2lmI2LSuln9WJorDH68S4U64NIMm2fFORAGCWIsxtVC8Awm5lja8kefPVK2DS
 5s4aVMViIYF9KhffoOMF3xMo/rB/Qk8EiobUYCWvElyT3TXqn36hHcQJjmXd8RnOyq4KAunfKsM JUzo3Oqe5gketyDlF/2f0wqwmg9fWMzl1XbhjE5yRQ9DYG5w4+BCIdraYT4u6IWhpPX7iAYqto6 22QraxsSY620kNR1hv6Eq3h1bS/SBOcJlDVDMv4cuVB3Y4WS9OSnZevp+nPoR+sXTX9W/uoNH6P
 TeCleuUGv/7/4MCJV5YaavhL1dCPphxr44dIEgQdvHVRPwohTAWsN4Bb6lvmqGC5YSqkNIzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_205447_362778_1BA1B7D1 
X-CRM114-Status: GOOD (  22.25  )
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


On 09/05/25 5:53 pm, Saket Kumar Bhaskar wrote:
> On linux-next, build for bpf selftest displays an error due to
> mismatch in the expected function signature of bpf_testmod_test_read
> and bpf_testmod_test_write.
>
> Commit 97d06802d10a ("sysfs: constify bin_attribute argument of bin_attribute::read/write()")
> changed the required type for struct bin_attribute to const struct bin_attribute.
>
> To resolve the error, update corresponding signature for the callback.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/e915da49-2b9a-4c4c-a34f-877f378129f6@linux.ibm.com/
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index 2e54b95ad898..194c442580ee 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
>   
>   noinline ssize_t
>   bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>   		      char *buf, loff_t off, size_t len)
>   {
>   	struct bpf_testmod_test_read_ctx ctx = {
> @@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
>   
>   noinline ssize_t
>   bpf_testmod_test_write(struct file *file, struct kobject *kobj,
> -		      struct bin_attribute *bin_attr,
> +		      const struct bin_attribute *bin_attr,
>   		      char *buf, loff_t off, size_t len)
>   {
>   	struct bpf_testmod_test_write_ctx ctx = {


Tested this patch by applying on top of next-20250508 and if fixes the 
build issue. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


commit f48887a98b78880b7711aca311fbbbcaad6c4e3b (tag: next-20250508, 
origin/master, origin/HEAD, bpf_arena)
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu May 8 18:45:50 2025 +1000

     Add linux-next specific files for 20250508


After this patch:


   TEST-OBJ [test_progs-cpuv4] xdp_flowtable.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_info.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_link.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_metadata.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_noinline.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_perf.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_synproxy.test.o
   TEST-OBJ [test_progs-cpuv4] xdp_vlan.test.o
   TEST-OBJ [test_progs-cpuv4] xdpwall.test.o
   TEST-OBJ [test_progs-cpuv4] xfrm_info.test.o
   BINARY   bench
   BINARY   test_maps
   BINARY   test_progs
   BINARY   test_progs-no_alu32
   BINARY   test_progs-cpuv4



Before this patch:


   CLANG 
/root/linux-next/tools/testing/selftests/bpf/tools/build/bpftool/profiler.bpf.o
bpf_testmod.c:494:17: error: initialization of ‘ssize_t (*)(struct file 
*, struct kobject *, const struct bin_attribute *, char *, loff_t,  
size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, const 
struct bin_attribute *, char *, long long int,  long unsigned int)’} 
from incompatible pointer type ‘ssize_t (*)(struct file *, struct 
kobject *, struct bin_attribute *, char *, loff_t, size_t)’ {aka ‘long 
int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, 
long long int,  long unsigned int)’} [-Wincompatible-pointer-types]
   494 |         .read = bpf_testmod_test_read,
       |                 ^~~~~~~~~~~~~~~~~~~~~
bpf_testmod.c:494:17: note: (near initialization for 
‘bin_attr_bpf_testmod_file.read’)
bpf_testmod.c:495:18: error: initialization of ‘ssize_t (*)(struct file 
*, struct kobject *, const struct bin_attribute *, char *, loff_t,  
size_t)’ {aka ‘long int (*)(struct file *, struct kobject *, const 
struct bin_attribute *, char *, long long int,  long unsigned int)’} 
from incompatible pointer type ‘ssize_t (*)(struct file *, struct 
kobject *, struct bin_attribute *, char *, loff_t, size_t)’ {aka ‘long 
int (*)(struct file *, struct kobject *, struct bin_attribute *, char *, 
long long int,  long unsigned int)’} [-Wincompatible-pointer-types]
   495 |         .write = bpf_testmod_test_write,
       |                  ^~~~~~~~~~~~~~~~~~~~~~
bpf_testmod.c:495:18: note: (near initialization for 
‘bin_attr_bpf_testmod_file.write’)
make[4]: *** [/root/linux-next/scripts/Makefile.build:203: 
bpf_testmod.o] Error 1
make[3]: *** [/root/linux-next/Makefile:2009: .] Error 2
make[2]: *** [Makefile:248: __sub-make] Error 2
make[1]: *** [Makefile:18: all] Error 2
make: *** [Makefile:282: test_kmods/bpf_testmod.ko] Error 2


Regards,

Venkat.


