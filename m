Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60729C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NIOLbVSdtD9xC/mViEpaZph0MzATZYojJF4Y2F0Gjs=; b=WwaZz/PwCFcgyOe3lZvDQTegk2
	aAsPCakywaM8uV2Wn8PpnoqadiOxIpPoHwc6S1vGJAMsuNdQzsmGgOP5KtR2/aeWMFuRGytDDMu1w
	PVKFfuzSvoBurHMT3xXDP7sohuhzpRb9lQo1k4dGNwdc3HcqQ4yOCPye4HaL42y4amNOO2X+sRkqW
	TOSnp6+upVMAcHke8zf7b0PhyxtigqGljwOPd8M8u7X5xvJzUhFRgtgsCy6XwnDPHux3alX/FvRhr
	S0VpubKQK6PzvnBU7la2wKnQpzLOKA5RLji9IwmC4tFOuscCXINU9TZ7xrzf8lR4z6LOSINI6o163
	pBJWmYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Bv-0000000Gr5S-0oRG;
	Thu, 03 Sep 2026 08:53:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Bt-0000000Gr4l-3bYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:53:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01242600C8;
	Thu,  3 Sep 2026 08:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171501F000E9;
	Thu,  3 Sep 2026 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425580;
	bh=+NIOLbVSdtD9xC/mViEpaZph0MzATZYojJF4Y2F0Gjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Z/VHVvaXXGNq5eWgAGggJ5dcRik5/rmwz31m13V6pp/I9Sxp8SyGbteSRpXmVtUKD
	 GG+FxfHzitEE/M70c7KsLVTO/px4zMPOVh5bsqxyiLexmK3Cx6CE7q695amjBB74bc
	 fEBL6W6v9GlMReJvynaYQ//XbXouE7CUKwzq2kGTzUp8tG9nkb1kmvgRSH8zwaX3Mb
	 q4XAZXvlIFj24ZfiflRq7L6krDmsYPdQQO3fIvJle3EP1frNpOawT8W269wMLrvy/U
	 fGnldtS2a5nal/dUxAI+XZu8SY5GHlYMw9lYZf7kDlPHsMf8leIc2F6/UAowOvegUM
	 0Grvgsnx6sn5Q==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <178794567779.4159892.8785590655735217125.b4-review@b4>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
Date: Thu, 03 Sep 2026 14:22:51 +0530
Message-ID: <yq5ay0diyavw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@nvidia.com> writes:

>> [ ... 143 lines skipped ... ]
>> +struct arm_smccc_device *arm_smccc_device_register(const char *name)
>> +{
>> +	int id, ret;
>> +	struct arm_smccc_device *smccc_dev;
>> +
>> +	if (!name)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	id = ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
>> +	if (id < 0)
>> +		return ERR_PTR(id);
>> +
>> +	smccc_dev = kzalloc_obj(*smccc_dev);
>> +	if (!smccc_dev) {
>> +		ida_free(&arm_smccc_bus_id, id);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	smccc_dev->id = id;
>> +	if (strscpy(smccc_dev->name, name) < 0) {
>> +		kfree(smccc_dev);
>> +		ida_free(&arm_smccc_bus_id, id);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
>> +	smccc_dev->dev.release = arm_smccc_release_device;
>> +
>> +	ret = dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);
>
> The bus seems well constructed, but this is a little bit odd, was it
> deliberate?
>
> For identifying the module alias and labeling the bus devices it is
> typical to use a fixed HW value, because it tends to turn into
> uAPI. So the hex func_id would have been a logical choice:
>
> 		.func_id        = SMC_RSI_ABI_VERSION,
>
> Ie 0xc4000190 as the device label.
>
> For example lets imagine that ARM defines a call to give a list of
> (func_id, version) for everything the FW supports. This would be
> great, then no need to probe every item in the table anymore. However
> if you define strings here then it doesn't work so well, the string
> table all has to be built in..
>
> Though handling ARM's version scheme could be tricky.
>
> Not opposed to this, but think about it carefully since this is
> basically making a uABI decision that probably cannot be taken back.
> comment about that above the table at least.
>
> What is this idr and name mangling doing? The names have to
> be unique because they are 1:1 with func_id, which must be unique by
> how SMCCC works, so what is the purpose of the IDR?
>
> Now instead of getting a machine stable device name like c4000190 or
> even arm-rsi-dev we get arm-rsi-dev.X where X is unpredictable and
> might change on kernel upgrades. That's not cool.
>
> smccc_dev->id isn't used for anything else. Drop it?
>
>> [ ... 47 lines skipped ... ]
>> +struct arm_smccc_device {
>> +	int id;
>> +	char name[ARM_SMCCC_NAME_SIZE];
>> +	struct device dev;
>> +};
>
> It is common practice to put the containing struct at the top and is a
> micro optimization since container_of becomes a NOP. Same for the
> driver below.
>
> Why have two copies of name? dev->name is already enough?
>

I have updated the bus to match devices using func_id.

static int arm_smccc_bus_match(struct device *dev,
		const struct device_driver *drv)
{
....
	id_table = to_arm_smccc_driver(drv)->id_table;
	if (!id_table)
		return 0;

	while (id_table->func_id) {
		if (smccc_dev->func_id == id_table->func_id)
			return 1;
		id_table++;
	}
...

file2alias.c now have

modified    scripts/mod/file2alias.c
@@ -1351,9 +1351,9 @@
 
 static void do_arm_smccc_entry(struct module *mod, void *symval)
 {
-	DEF_FIELD_ADDR(symval, arm_smccc_device_id, name);
+	DEF_FIELD(symval, arm_smccc_device_id, func_id);
 
-	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "%s", *name);
+	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "f%08X", func_id);
 }
 
 /*

