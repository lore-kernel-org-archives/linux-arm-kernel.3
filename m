Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646E7C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kl+bPaD4PaQFBmaUCjR6vm4GXg7ogX+Oac8DkWGxKR8=; b=U4MmnzQDkHm5RYuvlwBV1CwtTs
	c+W5tX3Ewd0ZOF6V3U2ISonWYqXP+aIvBrSJI7OXlefj2b9/kkXuJZ9YGqr4+9fRDIDWa660wsAEq
	kOvf94Ey8i0neaCjukZM1yZqh87zuvRPpquIAb4I+wv5nKtsg3INRWsXn3n/OAzChElnWFLlsYXTl
	jypbzsjg06D7W6WteAgzMcQCl/F35XRMLsvsjHCl5bTny1sHjzJ7VAI8OmUAnMKXRWcv/PJtRNMg3
	lqyKroxmK6NxdXGcSZ+1oFJLFi40MyZGQo5qKty2VXOo2+trStppl1E/LG4PgtFuchJGLUYtQnce1
	DSuD1n7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FvG-0000000BUMc-3t3J;
	Wed, 09 Sep 2026 10:52:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FvC-0000000BULo-2QX9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788951172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl+bPaD4PaQFBmaUCjR6vm4GXg7ogX+Oac8DkWGxKR8=;
	b=KEvWgeWz6yUVfnsVVOTpg1WJ8GJprO0e71kZGkv6mYUzdC0Uy1NAqYgWncsEEXsVpUH4Se
	BH19A5ow2af9MzMmT944rewan77KJdZvTsxwbA9J5A3kgm9itBjGvu2o2H1+HkIoqRuRRw
	+j6c5h38bD4A4DGmQC4PLnrzA5E+VCA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-Ebo--eEaMLyCKuE-ewwEIA-1; Wed, 09 Sep 2026 06:52:48 -0400
X-MC-Unique: Ebo--eEaMLyCKuE-ewwEIA-1
X-Mimecast-MFC-AGG-ID: Ebo--eEaMLyCKuE-ewwEIA_1788951168
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so10966895a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 03:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951167; x=1789555967;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlII6PmLS6Fy2IEhFtMVBBXGY0oZneRlW8U4Qxok/SY=;
        b=fzhJex2IcwN6G9ICML7ZmzMVz8sXvhGnfQzv1XbGcu2dEPrJwFCyxUDu8YJjYQpbRj
         AVgD5jKXnXRjbeO8XXQd5EXkgF7SNRqYaa4mWh3yOzzACfiY9KrQz7VpaP7AUt62amIW
         MmuLll6xVNErldXfD3jXvZDqmq0MsMsiYlut3ruLs1FO640kzEMnVY11AEsCxieAXI1i
         R282YlKYz0ojDnhxCi1lhwYMOeMNKLoAhlN427xFfunCpp9FGJ/oeCviePioCQj1WBqX
         0s/LgbhMQcq/C5XNQP7Egxhs8dbVZBYwHzNC9IwBOAMEqYEypQG3/ThDg/BpQI3CiFId
         1pMA==
X-Forwarded-Encrypted: i=1; AKwUvBzAZ8i0tpENFnhbz3GBwObJarH1dQ+8GjxRsR6X1XJ54Pnop8qLNtc+1onaLDoZPs6gXdMHD7aH0ox1p9EALgrd@lists.infradead.org
X-Gm-Message-State: AFuF++lv9JqS9M21N5VQLpr9VeEv/6y4UtaKs2Oa+9DTs6FC4/hHQhvA
	+EZm/rDKMq4QJLcXBwBbpUpoPQLZ4JWM9o8TvD/Lp2WFxuh/uzZ2bCE4tUGznp7FQlEKQBoMyp8
	fJPyCEMiBt1PPaleEpuMRUrt+lRAWEHs7kk4JTEmy6zQtjjXq6BQBgWqcY0dT2F9Xtem1nLHJE2
	gq
X-Gm-Gg: AYBFou3knnjOgBC7me6pH6jdCGx/yyAcpYXKVYIjqEhHDD7k2mTtqjSJueanTW0SrjF
	Rjy9ssjZMBdGXJALfZZRxMnKSVfCkHcpv8hWEQSIHA20YQkdyBsorefBAigp83UgMnyGRasXruE
	QtmLP+bWzGsg0IOv91B0yOCrPU7x3217emUG8EH9iGgKFQPLdOawAwtDsG+dXkbxhyVgQPG6Z6e
	xb6jtFGmBkr8cGgeycvZpuuGB80HKLGDN8rmp0/aXGu3M71/s8tGE0n0L7LzxcpMjoQDaRhXMAD
	QPHGssI9alyVlNOyMyJCC/BbulAu4pH4htkPmAZcAaC5RPhY+jzfqZuNhIv1lblVLKOPVy8FuR9
	nmutlKdgLrN7m54huOUiyE6RWojIdMbwkG5fqeSkFJg==
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr51714290a91.9.1788951167279;
        Wed, 09 Sep 2026 03:52:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr51714221a91.9.1788951166708;
        Wed, 09 Sep 2026 03:52:46 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm31417683a91.10.2026.09.09.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:52:45 -0700 (PDT)
Message-ID: <9086ca6a-5dce-493f-ac76-487dedc60758@redhat.com>
Date: Wed, 9 Sep 2026 20:52:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
To: Kohei Enju <enju.kohei@fujitsu.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
 gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
 alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
 lpieralisi@kernel.org
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <ap-C6NLnxuWWTMzi@FCCLS0092175.localdomain>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ap-C6NLnxuWWTMzi@FCCLS0092175.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0yZUT4C9zw5FT0Oy6oZ2emUhtrHap9YsBrHpxoYnW1c_1788951168
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------ARHmqz6kmyRmg021RcSq0ymY"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_035254_891130_957B91B9 
X-CRM114-Status: GOOD (  22.52  )
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

This is a multi-part message in MIME format.
--------------ARHmqz6kmyRmg021RcSq0ymY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kohei,

On 9/8/26 2:09 PM, Kohei Enju wrote:

[...]

>>
>> [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
>> [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v17
>> [3] KVM CCA v17 integration branch: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/kvm-integration/v17
>> [4] Gmem inplace conversion https://github.com/googleprodkernel/linux-cc/tree/guest_memfd-inplace-conversion-v12
>> [5] TF-RMM https://git.trustedfirmware.org/TF-RMM/tf-rmm.git main (commit: 134266ae)
> 
> I understand that QEMU-virt is not intended to model a realistic
> production platform and that QEMU-SBSA is generally preferred. However,
> I sometimes use QEMU-virt to test functionality quickly because it runs
> slightly faster than QEMU-SBSA.
> 
> I tested this series with QEMU-virt and found that RMM initialization
> failed during boot:
> 
>    [...]
>    INFO:    BL31: Initializing RMM
>    INFO:    RMM init start.
>    ERROR:   RMM init failed: -8
>    WARNING: BL31: RMM initialization failed
> 
I also ran into same issue and attached TF-A patch leads to a successful
RMM initialization, please have a try to see if it can resolve your issue.


Thanks,
Gavin

--------------ARHmqz6kmyRmg021RcSq0ymY
Content-Type: text/x-patch; charset=UTF-8; name="tf-a.patch"
Content-Disposition: attachment; filename="tf-a.patch"
Content-Transfer-Encoding: base64

RnJvbSBjMjJkZGM0MzY4NjUwNTUwODQ1Zjg2MmZjMDdjYjM1Yjk5OGZiYjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgpEYXRlOiBX
ZWQsIDkgU2VwIDIwMjYgMTk6NTg6MzcgKzEwMDAKU3ViamVjdDogW1BBVENIXSBwbGF0L3FlbXU6
IGFkZCBwbGF0X3JtbWRfcmVzZXJ2ZV9tZW1vcnkoKSBmb3IgVklSVCBwbGF0Zm9ybQpNSU1FLVZl
cnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU2lnbmVkLW9mZi1ieTogR2F2aW4gU2hhbiA8Z3No
YW5AcmVkaGF0LmNvbT4KLS0tCiBwbGF0L3FlbXUvcWVtdS9pbmNsdWRlL3BsYXRmb3JtX2RlZi5o
ICB8ICAzICsrKwogcGxhdC9xZW11L3FlbXUvcGxhdF9ybW1fbWVtX2NhcnZlb3V0LmMgfCAyOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKwogcGxhdC9xZW11L3FlbXUvcGxhdGZvcm0ubWsgICAg
ICAgICAgICAgfCAgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwbGF0L3FlbXUvcWVtdS9wbGF0X3JtbV9tZW1fY2FydmVvdXQuYwoK
ZGlmZiAtLWdpdCBhL3BsYXQvcWVtdS9xZW11L2luY2x1ZGUvcGxhdGZvcm1fZGVmLmggYi9wbGF0
L3FlbXUvcWVtdS9pbmNsdWRlL3BsYXRmb3JtX2RlZi5oCmluZGV4IDA2MDE4ZTdiMi4uYzNlZDk4
NmNmIDEwMDY0NAotLS0gYS9wbGF0L3FlbXUvcWVtdS9pbmNsdWRlL3BsYXRmb3JtX2RlZi5oCisr
KyBiL3BsYXQvcWVtdS9xZW11L2luY2x1ZGUvcGxhdGZvcm1fZGVmLmgKQEAgLTM2OCw2ICszNjgs
OSBAQCBDQVNTRVJUKChQTEFUX1FFTVVfTDBfR1BUX0JBU0UgJiAoUExBVF9RRU1VX0wwX0dQVF9T
SVpFIC0gMSkpID09IDAsCiAjZGVmaW5lIFJNTV9TSEFSRURfQkFTRQkJCShSTU1fTElNSVQpCiAj
ZGVmaW5lIFJNTV9TSEFSRURfU0laRQkJCVBMQVRfUUVNVV9STU1fU0hBUkVEX1NJWkUKIAorI2Rl
ZmluZSBQTEFUX0FSTV9STU1fUEFZTE9BRF9TSVpFCVVMKDB4NjAwMDAwKSAgICAvKiAyICogM01C
ICovCisjZGVmaW5lIFJNTV9QQVlMT0FEX0xJTUlUCQkoUk1NX0JBU0UgKyBQTEFUX0FSTV9STU1f
UEFZTE9BRF9TSVpFKQorCiAvKgogICogV2UgYWRkIHRoZSBSTU1fU0hBUkVEIHNpemUgdG8gUk1N
IG1hcHBpbmcgdG8gbWFwIHRoZSByZWdpb24gYXMgYSBibG9jay4KICAqIEVsc2Ugd2UgZW5kIHVw
IHJlcXVpcmluZyBtb3JlIHBhZ2V0YWJsZXMgaW4gQkwyIGZvciBST01MSUIgYnVpbGQuCmRpZmYg
LS1naXQgYS9wbGF0L3FlbXUvcWVtdS9wbGF0X3JtbV9tZW1fY2FydmVvdXQuYyBiL3BsYXQvcWVt
dS9xZW11L3BsYXRfcm1tX21lbV9jYXJ2ZW91dC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMC4uYzY4Y2EyNDNkCi0tLSAvZGV2L251bGwKKysrIGIvcGxhdC9xZW11L3FlbXUv
cGxhdF9ybW1fbWVtX2NhcnZlb3V0LmMKQEAgLTAsMCArMSwyOCBAQAorLyoKKyAqIENvcHlyaWdo
dCAoYykgMjAyNiwgQXJtIExpbWl0ZWQgYW5kIENvbnRyaWJ1dG9ycy4gQWxsIHJpZ2h0cyByZXNl
cnZlZC4KKyAqCisgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTMtQ2xhdXNlCisgKi8K
KworI2luY2x1ZGUgPGxpYi9zcGlubG9jay5oPgorI2luY2x1ZGUgPHBsYXQvY29tbW9uL3BsYXRm
b3JtLmg+CisKK3N0YXRpYyBzcGlubG9ja190IG1lbV9yZXNlcnZlX2xvY2s7CitzdGF0aWMgdWlu
dHB0cl90IHRvcF9tZW0gPSBSTU1fTElNSVQ7CisKK3VpbnRwdHJfdCBwbGF0X3JtbWRfcmVzZXJ2
ZV9tZW1vcnkoc2l6ZV90IHNpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ25tZW50KQoreworCXVpbnQ2
NF90IGFsaWduX21hc2sgPSBhbGlnbm1lbnQgLSAxOworCXVpbnRwdHJfdCBhZGRyOworCisJc3Bp
bl9sb2NrKCZtZW1fcmVzZXJ2ZV9sb2NrKTsKKwlhZGRyID0gKHRvcF9tZW0gLSBzaXplKSAmIH5h
bGlnbl9tYXNrOworCWlmIChhZGRyID49IFJNTV9QQVlMT0FEX0xJTUlUKSB7CisJCXRvcF9tZW0g
PSBhZGRyOworCX0gZWxzZSB7CisJCWFkZHIgPSAwOworCX0KKwlzcGluX3VubG9jaygmbWVtX3Jl
c2VydmVfbG9jayk7CisKKwlyZXR1cm4gYWRkcjsKK30KZGlmZiAtLWdpdCBhL3BsYXQvcWVtdS9x
ZW11L3BsYXRmb3JtLm1rIGIvcGxhdC9xZW11L3FlbXUvcGxhdGZvcm0ubWsKaW5kZXggMmUxMmY2
YmNhLi42NTVjYzY4M2EgMTAwNjQ0Ci0tLSBhL3BsYXQvcWVtdS9xZW11L3BsYXRmb3JtLm1rCisr
KyBiL3BsYXQvcWVtdS9xZW11L3BsYXRmb3JtLm1rCkBAIC0xNzUsNiArMTc1LDEwIEBAIEJMMzFf
U09VUkNFUwkJKz0JcGxhdC9jb21tb24vcGxhdF9zcG1kX21hbmlmZXN0LmMJXAogCQkJCSR7RkRU
X1dSQVBQRVJTX1NPVVJDRVN9CiBlbmRpZgogCitpZmVxICgke0VOQUJMRV9STU19LDEpCitCTDMx
X1NPVVJDRVMJCSs9CSR7UExBVF9RRU1VX1BBVEh9L3BsYXRfcm1tX21lbV9jYXJ2ZW91dC5jCitl
bmRpZgorCiBpZm5lcSAoJHtFTkFCTEVfRkVBVF9STkdfVFJBUH0sMCkKIEJMMzFfU09VUkNFUwkJ
Kz0JcGxhdC9xZW11L3FlbXUvcWVtdV9zeW5jX3RyYXBzLmMKIGVuZGlmCi0tIAoyLjU1LjAKCg==

--------------ARHmqz6kmyRmg021RcSq0ymY--


