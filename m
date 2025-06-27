Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D8EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5Pf8BL2tCnVPb3xDACb1a2370hbZXXKOHcE0CfoCrM=; b=wxNQ+DxyeraVR3zlzhSEiagX2V
	upl7x7xhu8WqANNvzcRLQHcr4aiLWcoJtRoyipje+Anz7Nl/b5yl5DPq0glYU/J1jwEveLAw/y7LL
	obJcQjziI9XQ87tHYxkgkV2XFFvLkfUcb7V1i7kXs5+kOmtFPB4q5aGyMhR1izXNvxSsZtnEE0Ydz
	l+XuEX7gLCudotSZLVL1CkmI6h+iX5qS0R6/oz3e2799gP5TbaBGpycxemGNasH89jlewwr2Pt/EC
	pT+QYpDH9agPYMg2hd7SwyAK1UTpInc5d+4ZZHrVzpyhZ1l1w9w0R+vmjqD6fIeBrioMlxywWbUBH
	8jHxRnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6nq-0000000ENmT-0Z0q;
	Fri, 27 Jun 2025 10:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6aA-0000000EKgH-3yu1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Jun 2025 10:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y5Pf8BL2tCnVPb3xDACb1a2370hbZXXKOHcE0CfoCrM=; b=G5iW8y2p6kLPyNtBI8Pe9C2yvP
	X5AmXmUS9kcNN3UYVnfLtutdCa431sZMNuxEcM+qT8J1kIFdoekrbefhsF/Znd1FIj42o71K5KzON
	gBUfG4VE5BGiA/+ZzrdqTWmojaoU5YeXeuvZr1Tms3YyPK43l49AuSWPBr47aii2zkM4Q/VU/0KTI
	H+U3DxxQyH7MUtdsDZfd+WpluS+UwsZF5NmxdS/qVcMdgc04PsBPh1aO/239kfNjiQwA8WaaSnvWq
	wIQ+mC1/nayawEv2Ri87jP6ThB50IZqUki40W2AnW+U8fwi80wuwu35NBjCUE259syanqsoAPMbTx
	05yXSr0A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV6a7-00000006IST-3gUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 10:45:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D31A1A00;
	Fri, 27 Jun 2025 03:45:00 -0700 (PDT)
Received: from [10.163.36.129] (unknown [10.163.36.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A64A3F58B;
	Fri, 27 Jun 2025 03:45:14 -0700 (PDT)
Message-ID: <af5cbd48-6312-481d-8e91-7739612493c1@arm.com>
Date: Fri, 27 Jun 2025 16:15:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/arm64: Prevent build warnings from
 -Wmaybe-uninitialized
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625020138.3777454-1-anshuman.khandual@arm.com>
 <dd3dee5a-b030-4658-8cef-c777928368d4@sirena.org.uk>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <dd3dee5a-b030-4658-8cef-c777928368d4@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_114520_283567_291567B2 
X-CRM114-Status: GOOD (  14.22  )
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



On 25/06/25 3:54 PM, Mark Brown wrote:
> On Wed, Jun 25, 2025 at 03:01:38AM +0100, Anshuman Khandual wrote:
> 
>> @@ -96,7 +96,7 @@ static int write_sleep_read(void)
>>  static int write_fork_read(void)
>>  {
>>  	pid_t newpid, waiting, oldpid;
>> -	int status;
>> +	int status = 0;
>>  
>>  	set_tpidr2(getpid());
>>  
> 
> This will shut the warnings up, but it's a bit of a heavy hammer that
> means that the warning can never trigger warnings for that variable
> being unused.  Is it possible to fix this by updating the control flow
> such that the compiler can tell that the initialisation follows the use?

The problem might not exist in reality. In the test function test_fork()
in the file tools/testing/selftests/arm64/gcs/basic-gcs.c there does not
seem to be a path where WIFEXITED(status) might get called when 'status'
has not been initialized as there is a preceding waitpid() which would
ensure 'status' gets set. Similar scenarios are present in fork_test_c()
and write_fork_read() as well. 

But the compiler still throws these build warnings. Seems to be false
positives and this fix just works around that.


