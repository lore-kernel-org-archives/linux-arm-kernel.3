Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D55E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6Gw0AX39hZKgDHXxv9Qp3FDLeF0px+FhZ38A7wP9Z8=; b=lYH0/LK61RWX2irpv8YI81+d83
	Zx1sYRbkVBwhWqIzvVBTYq4K2p4enT8EIbjzFIMaF/Kk5qKKyzgs4UijiPprpP/J6oEW9H7Wrc6ab
	WD74iNi3KrGT8JpFI6Uy+IwMA5TZ386QRN/qDRqzgOKSCQIEwDTl7zByQTfPTRxukY3XqCZFd2V6n
	653dfQcfno1qRj+OlN8xIfmcCQSIsUFQdF9uj3WvA3runJmXKf+c4Wx/8ZtDaJHGtHE6VcJJJZI9O
	DZ5QkHCziRuFiXzemw1h+DOFGDW3JUYtln/Z9WP1yOKza9u97Yzowj5XIMIPhAVX/mRr851FVQMdp
	9CODai1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1JM-0000000EWKL-3MDH;
	Thu, 05 Dec 2024 02:09:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1IK-0000000EWDg-1GcF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 02:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733364521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6Gw0AX39hZKgDHXxv9Qp3FDLeF0px+FhZ38A7wP9Z8=;
	b=fa+FaLFboPjNZ9sfW+l8fHsqA4+Bo4tSWMFOp2b2juBa9mb6MDJgqKwPdK9zHfrc4nMi7p
	NSIURG9ioOdnfKJSfOEiW5pu7wqQL3SvsLqs+JEuMJBL+F70NQAOtxnwbmH57nYHN0OOQF
	vQnPmEoUWzDQZ4sKEvA3+zIuApu+5aA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-l5bA0G3DNqWbp_bNyV7alQ-1; Wed, 04 Dec 2024 21:08:39 -0500
X-MC-Unique: l5bA0G3DNqWbp_bNyV7alQ-1
X-Mimecast-MFC-AGG-ID: l5bA0G3DNqWbp_bNyV7alQ
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-7eaac1e95ffso409776a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 18:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733364518; x=1733969318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6Gw0AX39hZKgDHXxv9Qp3FDLeF0px+FhZ38A7wP9Z8=;
        b=LsWrRAR8obajvnul3XErQytk/shL2jAXaTZLPhZ8UvXrR/dMvqyrBe94LiBiv8fMd+
         DkwSOQtVBTaVYb8D7Jxa4PpXGeB6bSFC952fTUECauyeTfWvNk21u2BQDiy/cH4MiXOE
         VW/KilZbDuxqCyFtBXik2e/ZuwqxlT4/oboh0JB6zpSCox4VFckmxaAVX3UtJKvwEy7F
         /L3DePXZtCLnzq5hzX9m8UB2hnQgwpzb3KXp6epxd3VK3W76X8aCQVlxcBPAJbcMy0kE
         bxYHiRl8BVhzbRS8TFgGh5WujKWxky1MNQl5dFkEU5g2ujZVHkADDsdInt9uPtz9xOFT
         PGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG+tm6RxoUzxqOaoWTfz62cok/ytwy3YhUXUOLjs2xM3p0mqLVB5UxcrjeWfJvnYmbU/cA6sjjrQR9HfMM2AOS@lists.infradead.org
X-Gm-Message-State: AOJu0YwySLFRbxFn3Tubfz7Pm7UYRZ1WkFlUJmhqTZZWdmeGGS1IjypW
	8LkkB6qVWJVGXyr5zVJyFpGexthBIrwNC2bLSD84NLfsQ3B+D+rGdxod7Lsl/4/C2bt59LNIMNd
	RDdhvRBmyricism4H89F0Cq/DTXnhkUZi+HNMKdTT+1ehSF7EIag50hoVUn/NfwgDHwEJjuyE
X-Gm-Gg: ASbGncsp5sw2twsPUbZB0YLXkPtzc3U3pM5Si45WAixX0afaw9N7Vmafaqc20aZpkP2
	pw61G9K8/moxeN8JZgz14/ieGHmM4cbMcxAEEBHyQeyCLAH4HG1MdVikzxfPK9gmRbql7r19D5i
	ivHexOVCWLZabH6YlE4ButUWwEjYevwmLBAVFwiJc7WORXJNdqmJKFSr4AMm0M7XVb9Gv5Ttv2l
	jD+I9uTttt8fnk/WW35VcOrwDgqqcXEFo1trE9yTdKzbfRZ19U=
X-Received: by 2002:a05:6a20:3d85:b0:1e0:ca95:2de8 with SMTP id adf61e73a8af0-1e16542f2b2mr12982091637.46.1733364518048;
        Wed, 04 Dec 2024 18:08:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDcSGGSElTLYdqdAj3uX++CbDOTLqJIwBzBiZJs+d3G5x5Z329XdRGvzzx2G+x78WocvU2w==
X-Received: by 2002:a05:6a20:3d85:b0:1e0:ca95:2de8 with SMTP id adf61e73a8af0-1e16542f2b2mr12982041637.46.1733364517252;
        Wed, 04 Dec 2024 18:08:37 -0800 (PST)
Received: from [10.72.112.152] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29c5ccesm172907b3a.12.2024.12.04.18.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 18:08:36 -0800 (PST)
Message-ID: <60ab506d-5374-484d-906e-3561fc895a6d@redhat.com>
Date: Thu, 5 Dec 2024 12:08:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Jeremy Linton <jeremy.linton@arm.com>, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-2-jeremy.linton@arm.com>
 <202412031348.bp5i3ws2-lkp@intel.com>
 <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
 <a64a21cc-6d10-4e8f-9ab9-87aca44ca858@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a64a21cc-6d10-4e8f-9ab9-87aca44ca858@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: skziJLmE5H069q8qVUNKiJ0LxL7yoXVTN7QdhHHsnvY_1733364518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_180844_415490_B67308BD 
X-CRM114-Status: GOOD (  20.35  )
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


On 12/4/24 1:30 AM, Jeremy Linton wrote:
> On 12/3/24 2:56 AM, Gavin Shan wrote:
>> On 12/3/24 4:03 PM, kernel test robot wrote:
>>> Hi Jeremy,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on arm64/for-next/core]
>>> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
>>> [cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/ arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/ linux.git for-next/core
>>> patch link:    https://lore.kernel.org/r/20241203000156.72451-2- jeremy.linton%40arm.com
>>> patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
>>> config: arm64-randconfig-004-20241203 (https://download.01.org/0day- ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
>>> compiler: clang version 20.0.0git (https://github.com/llvm/llvm- project 592c0fe55f6d9a811028b5f3507be91458ab2713)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2- lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
>>>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>           |                     ^
>>>     include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
>>>       356 | #define __maybe_unused __attribute__((__unused__))
>>>           |                                                        ^
>>>     include/linux/mod_devicetable.h:607:8: note: previous definition is here
>>>       607 | struct platform_device_id {
>>>           |        ^
>>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
>>>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>           | ^~~~~~~~~~~~~
>>>     2 warnings generated.
>>>
>>>
>>> vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>>>
>>>     222
>>>     223    /* modalias, so userspace can autoload this module when RSI is available */
>>>   > 224    static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>     225        { RSI_PDEV_NAME, 0},
>>>     226        { }
>>>     227    };
>>>     228
>>>
>>
>> The definition may have to be something like below, to avoid the compiling warning.
>>
>> static const struct platform_device_id __maybe_unused arm_cca_match[] = {
> 
> I should have tested this with clang rather than copy/pasting the utilization from somewhere else! It looks like a number of other kernel users are putting it before the '=', but its sorta annoying because it seems like the kind of warning that should be suppressed globally for this case (module device description in module that can be built in).
> 
> 

I think it also work by putting '__maybe_unused' before '='. It's also my personaly preferred style.
However, I don't see how the pattern 'struct __maybe_unused platform_device_id arm_cca_match[]' can
work because the affective scope of '__maybe_unused' is ambiguous to the compiler: 'struct platform_device_id'
or 'arm_cca_match[]'.

> 
>>         ...
>> };
>>

Thanks,
Gavin



