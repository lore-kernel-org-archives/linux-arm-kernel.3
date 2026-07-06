Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0F6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMZ9xp7y5bHKEdOaS2kXZI2hSTQYBvR28eonKzc//j4=; b=r/JgsgkgRZWWPV
	/a+A4GXGzhfEEVOZtYQVhkVw/caLSQoZlSCAGWkcsYPil7ZLdimjvhJEEqsb6hZ4Eo9g1tDOmB4R6
	iXZwFDdF8mK2FDQYpnu6xcQWgFobx8tlOluYJSJy3SuTnPr23T+rpybfrwwe6uRecGJXxx9d8tQsj
	dZHdGBNJIzsYlJlggLFJlwjwN4+xeU7f6VU46ni3uh90vrTpy3qKw2ZLsQ1jbgr64ng7nM0hzLIgU
	E0/9ZxalsDWfPH4SRYDSjmBrbk3Zec5+FrzUiWEpCmMb4xKasfG3fTUTbXN3Rlm10rNg3N8wj0FO3
	UhW6Rx+dHZo6nwQ3EcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOz-0000000ClCy-1dxe;
	Mon, 06 Jul 2026 14:34:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkOw-0000000ClBR-1o0o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:34:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E092BCB;
	Mon,  6 Jul 2026 07:34:21 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83E53F905;
	Mon,  6 Jul 2026 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783348465; bh=Vs1EJjWipMEUQx/EtTmy21EQD4uqVPjCq3MCJhBMO2w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LK2C9n//iu5QSQzGMG8mUBP0RartY9DTplEpZcskp779RdHPQFp+0rxS9vi/ZCl2p
	 Dmb+R5JgRLR31dtmYA0Q8xoK3o6FA9h9GSC37PKZzt5xOIpRg5PkycZUF5yHmCGS+G
	 pwB/CcvqArQvcZWGbisRTZzcTBjtJxSerYgSLIDs=
Message-ID: <bb6127e7-d650-4bc1-8a4b-a6c21107f66f@arm.com>
Date: Mon, 6 Jul 2026 16:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] firmware: smccc: lfa: Add auto_activate sysfs file
To: Nirmoy Das <nirmoyd@nvidia.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-7-andre.przywara@arm.com>
 <483b7983-44c8-4a17-9db5-61b950a41ffa@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <483b7983-44c8-4a17-9db5-61b950a41ffa@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_073426_554436_7AE9F570 
X-CRM114-Status: GOOD (  29.46  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nirmoy,

thanks for your replies and comments, I think I incorporated every one 
in the v3 post. However this one here is a bit tricky ...

On 6/24/26 21:45, Nirmoy Das wrote:
> Hi Andre,
> 
> On 17.03.26 12:33, Andre Przywara wrote:
>> The Arm LFA spec places control over the actual activation process in
>> the hands of the non-secure host OS. An platform initiated interrupt or
>> notification signals the availability of an updateable firmware image,
>> but does not necessarily need to trigger it automatically.
>>
>> Add a sysfs control file that guards such automatic activation. If an
>> administrator wants to allow automatic platform initiated updates, they
>> can activate that by echoing a "1" into the auto_activate file in the
>> respective sysfs directory. Any incoming notification would then result
>> in the activation triggered.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/ 
>> lfa_fw.c
>> index f20ea45cdbd9..5dc531e462eb 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -101,6 +101,7 @@ enum image_attr_names {
>>       LFA_ATTR_FORCE_CPU_RENDEZVOUS,
>>       LFA_ATTR_ACTIVATE,
>>       LFA_ATTR_CANCEL,
>> +    LFA_ATTR_AUTO_ACTIVATE,
>>       LFA_ATTR_NR_IMAGES
>>   };
>> @@ -115,6 +116,7 @@ struct fw_image {
>>       bool may_reset_cpu;
>>       bool cpu_rendezvous;
>>       bool cpu_rendezvous_forced;
>> +    bool auto_activate;
>>       struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>>   };
>> @@ -561,6 +563,28 @@ static ssize_t cancel_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       return count;
>>   }
>> +static ssize_t auto_activate_store(struct kobject *kobj,
>> +                   struct kobj_attribute *attr,
>> +                   const char *buf, size_t count)
>> +{
>> +    struct fw_image *image = kobj_to_fw_image(kobj);
>> +    int ret;
>> +
>> +    ret = kstrtobool(buf, &image->auto_activate);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t auto_activate_show(struct kobject *kobj,
>> +                  struct kobj_attribute *attr, char *buf)
>> +{
>> +    struct fw_image *image = kobj_to_fw_image(kobj);
>> +
>> +    return sysfs_emit(buf, "%d\n", image->auto_activate);
>> +}
>> +
>>   static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>       [LFA_ATTR_NAME]            = __ATTR_RO(name),
>>       [LFA_ATTR_CURRENT_VERSION]    = __ATTR_RO(current_version),
>> @@ -571,7 +595,8 @@ static struct kobj_attribute 
>> image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>       [LFA_ATTR_CPU_RENDEZVOUS]    = __ATTR_RO(cpu_rendezvous),
>>       [LFA_ATTR_FORCE_CPU_RENDEZVOUS]    = 
>> __ATTR_RW(force_cpu_rendezvous),
>>       [LFA_ATTR_ACTIVATE]        = __ATTR_WO(activate),
>> -    [LFA_ATTR_CANCEL]        = __ATTR_WO(cancel)
>> +    [LFA_ATTR_CANCEL]        = __ATTR_WO(cancel),
>> +    [LFA_ATTR_AUTO_ACTIVATE]    = __ATTR_RW(auto_activate),
>>   };
>>   static void init_image_default_attrs(void)
>> @@ -640,6 +665,7 @@ static int update_fw_image_node(char *fw_uuid, int 
>> seq_id,
>>       image->kobj.kset = lfa_kset;
>>       image->image_name = image_name;
>>       image->cpu_rendezvous_forced = true;
>> +    image->auto_activate = false;
> 
> 
> I think sysadmins should be able to automate setting this at boot and
> after firmware inventory changes.
> 
> A udev rule matching /sys/firmware/lfa/<uuid>/auto_activate did not work
> when I tried it, since those entries are plain kobjects under
> /sys/firmware. The arm-lfa faux device worked better as the event anchor,

I like that idea, however with the change from faux device to the SMCCC 
bus this doesn't work as easily anymore. There would be still a device 
somewhere, but I don't know how this is mapped to udev.
Since you seem to know more about it, can you please check how the 
changed patch set behaves in this respect? And ideally let us know what 
it would take to adapt the uevent code the new version?

Cheers,
Andre


> with something like:
> 
>    if (lfa_dev)
>            kobject_uevent(&lfa_dev->dev.kobj, KOBJ_CHANGE);
> 
> Then userspace can use:
> 
>    ACTION=="add|change", SUBSYSTEM=="faux", KERNEL=="arm-lfa", \
>            RUN+="/usr/sbin/lfa-auto-activate"
> 
> What do you think about adding such a notification in v3?
> 
> Regards,
> Nirmoy
> 
> 
>>       set_image_flags(image, seq_id, image_flags, reg_current_ver,
>>               reg_pending_ver);
>>       if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
>> @@ -709,7 +735,8 @@ static int update_fw_images_tree(void)
>>   /*
>>    * Go through all FW images in a loop and trigger activation
>> - * of all activatible and pending images.
>> + * of all activatible and pending images, but only if automatic
>> + * activation for that image is allowed.
>>    * We have to restart enumeration after every triggered activation,
>>    * since the firmware images might have changed during the activation.
>>    */
>> @@ -728,7 +755,8 @@ static int activate_pending_image(void)
>>               continue; /* Invalid FW component */
>>           update_fw_image_pending(image);
>> -        if (image->activation_capable && image->activation_pending) {
>> +        if (image->activation_capable && image->activation_pending &&
>> +            image->auto_activate) {
>>               found_pending = true;
>>               break;
>>           }


