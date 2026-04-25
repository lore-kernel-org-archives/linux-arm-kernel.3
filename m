Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBA3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6rxqb2f278iGTGU/7sMH9FbEKwwMCCocICHWINsPdM=; b=K8q4xrnMO7JygIDz4nM8bN4RMQ
	wuPot4rZWWUnvWx/d8q1bLma2xjggr5YrUAI7s/XqMqFiCxK5uQkOzWZK6aULZNqVUoqkU/4aWFQN
	28yKGCMSF7Z9vDbCbKInCpeWfO49z2jaKbKsL5lADUqsEwyXTPx/BlxcYqDPXjfT0P2FAqEFgfwq/
	Oc6BklM/GrZz1AbQyicAnw1q2wuBl48VadsMhEpC/Kyp9tEU3TNOx7+HKfGV/kNm8HQNcUX+qPGN6
	m8wtf82SX+lhhg94BmjExhZSOTr/QzrhLpLL8XAXut/CSkQeWusAXDPXRpNcyOaVG2Y/4vLtM3ocZ
	VERn3OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZ2Y-0000000EGlr-29c5;
	Sat, 25 Apr 2026 09:11:06 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZ2V-0000000EGl0-11n9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=j6rxqb2f278iGTGU/7sMH9FbEKwwMCCocICHWINsPdM=; b=PFouws7o5doLAYVrlIoXV/9ww5
	d4iXXPdRwm17lO0bbEn5PHzf49HJBIdNDLUsugiKPZkJ5h5nSwbHUQ1Xq2+5ABLaJ07o8zATneKKF
	w+UtT4JkUFt2KJkkfhcZ0nFa3Mqatf1iCNpJMiYXw2+7rbdwpoWMkemT2W/v4xZ5XZweXR2wG6icq
	vNY729gWq41ni9koXEUoRD+hV1lsY+neB7jIdnofYL7YzbQ0iwxIBVZ8jvgkWg3dkYsni9qGV6wRC
	pa+gbrXFIYlAcUqJw6/tPrrN5vfjA7qHE4sGi1aKYyGDEj+XAJQNrBCoow2mnGmFdsY6gE8534edj
	HMC6xTeA==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1wGZ2O-00000006EIj-3k1D;
	Sat, 25 Apr 2026 10:10:57 +0100
Date: Sat, 25 Apr 2026 10:10:56 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH v3 2/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
Message-ID: <aeyFIP4Ph57LvPqe@earth.li>
References: <cover.1777036497.git.noodles@meta.com>
 <5552c20c6d6d2ae3bbb6b35124af5d98d2f79163.1777036497.git.noodles@meta.com>
 <43ff6ca37df45ed53061dad46e9d31a5118e5714.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43ff6ca37df45ed53061dad46e9d31a5118e5714.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_021103_613337_C1A83933 
X-CRM114-Status: GOOD (  12.25  )
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

On Fri, Apr 24, 2026 at 04:25:31PM -0400, Mimi Zohar wrote:
>Thanks, Jonathan!
>
>On Fri, 2026-04-24 at 14:24 +0100, Jonathan McDowell wrote:
>> -static int __init init_ima(void)
>> +static int __init init_ima(bool late)
>>  {
>>  	int error;
>>  
>> @@ -1247,10 +1247,26 @@ static int __init init_ima(void)
>>  		return 0;
>>  	}
>>  
>> +	/*
>> +	 * If we found the TPM during our first attempt, or we know there's no
>> +	 * TPM, nothing further to do
>> +	 */
>
>Perhaps it's just me, but the comment wording is a bit off.  Could I change it
>to: If we either found the TPM or knew there's no TPM during our first attempt,
>nothing futher to do.

No objections to that updated wording from me.

>Otherwise the patch looks good.
>
>Mimi
>
>
>> +	if (late && (ima_tpm_chip || !IS_ENABLED(CONFIG_TCG_TPM)))
>> +		return 0;
>> +
>> +	ima_tpm_chip = tpm_default_chip();
>> +	if (!ima_tpm_chip && !late && IS_ENABLED(CONFIG_TCG_TPM)) {
>> +		pr_debug("TPM not available, will try later\n");
>> +		return -EPROBE_DEFER;
>> +	}
>> +
>> +	if (!ima_tpm_chip)
>> +		pr_info("No TPM chip found, activating TPM-bypass!\n");
>> +

J.

-- 
Revd Jonathan McDowell, ULC | Run like hell!

