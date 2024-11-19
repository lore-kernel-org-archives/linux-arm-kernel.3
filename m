Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F243D6C29B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJbKdr+f0VDDO/ejnIbaUHdviK/XWrKSVw2/dgyOuv4=; b=upNPnSaWnipxH5hc6ekdlSOE9D
	OAyRbsU4W51qlCIDTOe6Ql+QGzB34O/zBPAFHewNHL1utCxzPAxFoKw782ZK0Td+FyRmKTaLJV3hL
	YMWH4FRLx6OR1faxFzFk7qYWNVZRVT7OLhC8ex1UEUNvLu2o555t7ypzyxbzfVL/ZY8ZDlUTV5Tja
	vkKPdJAp8hCJ5E82+4ga1QQGrD9STrkRJEf90KqsE2eyazOx5yiWt44CMjKnJr/SaNuIrAtkut6SL
	BZ97+u5K00J0cDS4I63wcTzBq+AxUqLSQRX/oReQO5Ax5vhdtr+Ni+Br0pNo3POylPRpz+wcwP4Fj
	9iqwP5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVeH-0000000Dnow-13ek;
	Tue, 19 Nov 2024 21:20:37 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVdK-0000000DnjB-1jup;
	Tue, 19 Nov 2024 21:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1732051176; bh=tJWJ6glvL8iioR1yFCOIXYRhx3OL9I4eFIpYdN8Ak8Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=btVzf4WCHSa/LZE5ys/D4KYV7XgRNO4J8jO0O06I2JQcRyYGU8QIr+YaKPY+GFDzB
	 KJXJm2jTEca2HzRag93Oo7Bav0y0GIDbsTKGuUVCP0MsZYV3gjMSi6gouIQeWTbOMz
	 6oq9uvYLjuNy8+AJqYPn5YEzEggr86BhOP00pKlNYIoWJFbfWVbczwJtd//yhsrQdN
	 dnzY/hcJBURtBuPnFZbMyvXQFNYPLezEVRNQYBYBd4DKNX3QKvbjf+LfAxwNSsxDjB
	 knxRAbhwrh09QubzpRr7SLOf7KPgmgsKMetMRGUVTVJMKy0xEeTlrnHnTgVa+eZ7bQ
	 PKpYdvsxiw5MqDndzYA9ciw911pjFDOdZrQgVDnMWB6oewYO67zR9wbjxsq3a/CPap
	 /gG0EaqU+0tJilDJKPyypWX2Y4DUPTrKyI58Fj61JBrNFV9PPcpdLKN5s1uHaarZwQ
	 uA+gvz58VIyed6Pu5zNY4nMA3SLQLwiVHQaPi1KSTl7JR+x5B13tkX0irPAAIIRgl+
	 mNmSUeTkBBO2yWgux26+2xgKQMDhndSZ+oE4vV8kucEasFn8zhTdm4WLvGU9uZufcW
	 1sFE9mAJF1ZqlD/qMPd7293bEymLyjgwodwq1uOlftzDaAYZ65AuJ5x8KkfrrkNZbo
	 OSy6QmqZXVu9VbgwMEyWNrbg=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 85DFF18E0A9;
	Tue, 19 Nov 2024 22:19:36 +0100 (CET)
Message-ID: <89b5778b-d251-4777-bb6c-54f56740d277@ijzerbout.nl>
Date: Tue, 19 Nov 2024 22:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i3c: Use i3cdev->desc->info instead of calling
 i3c_device_get_info() to avoid deadlock
From: Kees Bakker <kees@ijzerbout.nl>
To: mtk25126 <defa.li@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, mingchang.jia@mediatek.com,
 yuhan.wei@mediatek.com, hao.lin@mediatek.com
References: <20241107132549.25439-1-defa.li@mediatek.com>
 <72410501-657b-40ec-b959-a736c913c486@ijzerbout.nl>
Content-Language: en-US
In-Reply-To: <72410501-657b-40ec-b959-a736c913c486@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_131938_588858_C51D4532 
X-CRM114-Status: GOOD (  16.51  )
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

Op 19-11-2024 om 21:51 schreef Kees Bakker:
> Op 07-11-2024 om 14:25 schreef mtk25126:
>> From: Defa Li <defa.li@mediatek.com>
>>
>> A deadlock may happen since the i3c_master_register() acquires
>> &i3cbus->lock twice. See the log below.
>> Use i3cdev->desc->info instead of calling i3c_device_info() to
>> avoid acquiring the lock twice.
>>
>> v2:
>>    - Modified the title and commit message
>>
>> ============================================
>> WARNING: possible recursive locking detected
>> 6.11.0-mainline
>> --------------------------------------------
>> init/1 is trying to acquire lock:
>> f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: i3c_bus_normaluse_lock
>>
>> but task is already holding lock:
>> f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: i3c_master_register
>>
>> other info that might help us debug this:
>>   Possible unsafe locking scenario:
>>
>>         CPU0
>>         ----
>>    lock(&i3cbus->lock);
>>    lock(&i3cbus->lock);
>>
>>   *** DEADLOCK ***
>>
>>   May be due to missing lock nesting notation
>>
>> 2 locks held by init/1:
>>   #0: fcffff809b6798f8 (&dev->mutex){....}-{3:3}, at: __driver_attach
>>   #1: f1ffff80a6a40dc0 (&i3cbus->lock){++++}-{3:3}, at: 
>> i3c_master_register
>>
>> stack backtrace:
>> CPU: 6 UID: 0 PID: 1 Comm: init
>> Call trace:
>>   dump_backtrace+0xfc/0x17c
>>   show_stack+0x18/0x28
>>   dump_stack_lvl+0x40/0xc0
>>   dump_stack+0x18/0x24
>>   print_deadlock_bug+0x388/0x390
>>   __lock_acquire+0x18bc/0x32ec
>>   lock_acquire+0x134/0x2b0
>>   down_read+0x50/0x19c
>>   i3c_bus_normaluse_lock+0x14/0x24
>>   i3c_device_get_info+0x24/0x58
>>   i3c_device_uevent+0x34/0xa4
>>   dev_uevent+0x310/0x384
>>   kobject_uevent_env+0x244/0x414
>>   kobject_uevent+0x14/0x20
>>   device_add+0x278/0x460
>>   device_register+0x20/0x34
>>   i3c_master_register_new_i3c_devs+0x78/0x154
>>   i3c_master_register+0x6a0/0x6d4
>>   mtk_i3c_master_probe+0x3b8/0x4d8
>>   platform_probe+0xa0/0xe0
>>   really_probe+0x114/0x454
>>   __driver_probe_device+0xa0/0x15c
>>   driver_probe_device+0x3c/0x1ac
>>   __driver_attach+0xc4/0x1f0
>>   bus_for_each_dev+0x104/0x160
>>   driver_attach+0x24/0x34
>>   bus_add_driver+0x14c/0x294
>>   driver_register+0x68/0x104
>>   __platform_driver_register+0x20/0x30
>>   init_module+0x20/0xfe4
>>   do_one_initcall+0x184/0x464
>>   do_init_module+0x58/0x1ec
>>   load_module+0xefc/0x10c8
>>   __arm64_sys_finit_module+0x238/0x33c
>>   invoke_syscall+0x58/0x10c
>>   el0_svc_common+0xa8/0xdc
>>   do_el0_svc+0x1c/0x28
>>   el0_svc+0x50/0xac
>>   el0t_64_sync_handler+0x70/0xbc
>>   el0t_64_sync+0x1a8/0x1ac
>>
>> Signed-off-by: Defa Li <defa.li@mediatek.com>
>> ---
>>   drivers/i3c/master.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 6f3eb710a75d..bb8a8bf0c4c7 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -282,7 +282,8 @@ static int i3c_device_uevent(const struct device 
>> *dev, struct kobj_uevent_env *e
>>       struct i3c_device_info devinfo;
>>       u16 manuf, part, ext;
>>   -    i3c_device_get_info(i3cdev, &devinfo);
>> +    if (i3cdev->desc)
>> +        devinfo = i3cdev->desc->info;
> Now you have left devinfo unitialized if i3cdev->desc == NULL
> You have to figure out what to do in that case.
It looks like it is old prolem, already introduced in 2017, commit 
3a379bbcea.
There is a similar problem in modalias_show() and mctp_i3c_setup()

To be honest, I don't know the driver well enough. Maybe i3cdev->desc should
never be NULL. Perhaps we need a WARN_ON or WARN_ON_ONCE instead
of a simple NULL check. Still we need to exit the function if the unexpected
happens.
>>       manuf = I3C_PID_MANUF_ID(devinfo.pid);
>>       part = I3C_PID_PART_ID(devinfo.pid);
>>       ext = I3C_PID_EXTRA_INFO(devinfo.pid);
>


