Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE9CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFEQ6Jvqg8zxhLp0H6oiyajuwS0jJDK62kNSimaPeVY=; b=m7DwmTT8mPa8+yNWTy22T+vMC+
	LzHU+MYI6Mu2wp9+vDsPvrOSj8EJvSFXra/IGR9CGG8QCoLdumW770dPz0YuGWSJ+USLunDvhajts
	5gww475n5P/AakwbL+LysMvAfITzGZMh5Q8X7Iik+w8mkElukZUjBSNaNm7WYJvQy3RJfjV7gHfuN
	pd9KKgUIISbO05q7ausnsU5n+Jr0vJyMH8TBAq5gghMh6gaN4jztei7LPxG2OgtEudZ5yp34bJJ6Z
	Nel1QocImc5VCYQw2SnBDfkWUFDO5/3ziewRbFCvL53YLsRWU2Jv6LrEIlbwrGcHIrzVnHjBSKU3T
	s+KT/MEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwY-0000000CqXH-05JS;
	Mon, 06 Jul 2026 15:09:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkwX-0000000CqWi-0I8e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:09:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5DB543BFD;
	Mon,  6 Jul 2026 15:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358651F000E9;
	Mon,  6 Jul 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783350548;
	bh=RFEQ6Jvqg8zxhLp0H6oiyajuwS0jJDK62kNSimaPeVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CBNXdRyYi4VeB2kuzdVU7OsMlkFmTfM3ZH+WRmQe5P1iYgzuKqXKYbLA/YtSlrz2z
	 YDDWblOeEaaa5JVOdYfounIsSFsEiVNi2JMm3+0UlVx+9ajofPLwceyrEBd8owVGKx
	 l720FtjH6DSmYZ43rg2Iy9iwuAL21st5UbK6bJhnPC+2J8GiUA/bq7MguD95Hb8TpA
	 vGqDQFQN9b0bWO2rYPso6r1UOK4ILEQhjypsp4MnTriE8nzgNQ8B5NIC1BJS7o4oJr
	 h1g/U2zI8z+qKsLSZ8+P4nm++NYlkzZlb4xo02UlcvN7jAC1cRGJvLgiqbJDP86FOw
	 3SqZS8+EtJ9Xw==
Date: Mon, 6 Jul 2026 16:09:04 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v7 1/6] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260706-camouflaged-quaint-harrier-764b3b@sudeepholla>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-2-aneesh.kumar@kernel.org>
 <20260706-belligerent-excellent-saluki-a4e431@sudeepholla>
 <yq5a4iici3u3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a4iici3u3.fsf@kernel.org>
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

On Mon, Jul 06, 2026 at 08:05:00PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
> > On Thu, Jun 11, 2026 at 06:34:24PM +0530, Aneesh Kumar K.V (Arm) wrote:
> 
> ...
> 
> >> +#define to_arm_smccc_driver(d) \
> >> +	container_of_const(d, struct arm_smccc_driver, driver)
> >> +
> >> +int arm_smccc_driver_register(struct arm_smccc_driver *driver,
> >> +		struct module *owner, const char *mod_name);
> >> +void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
> >> +struct arm_smccc_device *arm_smccc_device_register(const char *name);
> >> +void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
> >> +
> >
> > I may be overthinking but what will happen if HAVE_ARM_SMCCC_DISCOVERY=n
> > and some driver is compiled using this header ? It should be fine if it
> > fails to compile, just thinking out loud if we need to handle that are not.
> > As long as all the drivers using these depends on HAVE_ARM_SMCCC_DISCOVERY
> > it should be fine I think.
> 
> This will result in a build failure. The driver should either select
> HAVE_ARM_SMCCC_DISCOVERY or depend on HAVE_ARM_SMCCC_DISCOVERY.
> 

That should be fine for now.

> >
> >> +#define arm_smccc_register(driver) \
> >> +	arm_smccc_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
> >> +#define arm_smccc_unregister(driver) \
> >> +	arm_smccc_driver_unregister(driver)
> >> +
> >> +#define module_arm_smccc_driver(__arm_smccc_driver) \
> >> +	module_driver(__arm_smccc_driver, arm_smccc_register, \
> >> +		      arm_smccc_unregister)
> >> +
> >> +extern const struct bus_type arm_smccc_bus_type;
> >> +
> >> +#endif /* __LINUX_ARM_SMCCC_BUS_H */
> >> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> >> index 23ff24080dfd..c9cee8c5a0b2 100644
> >> --- a/include/linux/mod_devicetable.h
> >> +++ b/include/linux/mod_devicetable.h
> >
> > This file seems to be reworked recently, so you need to rebase it moving
> > smccc specific changes to separate file I think.
> >
> 
> Do we need to add a separate file? I was able to rebase the series on
> 7.2-rc1
> 

Then could be something changed between -rc1 to -rc2, I couldn't apply the
patch.


[...]

> >> +
> >> +/**
> >> + * struct arm_smccc_device_id - Arm SMCCC bus device identifier
> >> + * @name: SMCCC device name
> >> + * @driver_data: driver data
> >> + */
> >> +struct arm_smccc_device_id {
> >> +	char name[ARM_SMCCC_NAME_SIZE];
> >> +	kernel_ulong_t driver_data;
> >
> > Can't find any users of the above driver_data ?
> > Is it for future ? If so, can you add details on how it is supposed to be used
> > if you don't want to drop it.
> >
> 
> That would depend on the driver, wouldn’t it? I was comparing this with
> struct auxiliary_device_id, and very few drivers use driver_data;
> mei_gsc_probe() is one example.
> 

Indeed, but I don't see any attempt to use it currently which is fine but
I also fail how this can be used in future in SMCCC context.

IIUC driver_data is a per-match-entry cookie. It is useful when one driver
supports multiple IDs and wants each ID to select  slightly different
behavior.

The issues as I see are:
1. No driver is using it in this series.
2. The SMCCC bus match code finds the matching table entry, but then
   throws it away. It is not passed to probe for example.

> I am not sure there is a generic rule here. IIUC, it provides a place
> where a driver can add driver-specific data that can be used during the
> probe routine.
>

How is that possible unless we either add a function like

  |  const struct arm_smccc_device_id *
  |  arm_smccc_get_device_id(struct arm_smccc_device *sdev);

to get the pointer to the id_table or that driver_data from the probe.

Or change probe to receive the matched ID/driver_data:

  int (*probe)(struct arm_smccc_device *sdev,
  	     const struct arm_smccc_device_id *id);

Please drop it if you have no plans to use it or see any future usage.

-- 
Regards,
Sudeep

