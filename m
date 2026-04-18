Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300D5F99C6D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVHuT39vJFq3z9p9Y8P4lQnO5Ygvg1D3+qSvKG01gbY=; b=tnnyi3ij7W8tvNUsig+thTVZHa
	DdGvRkHljhI+POCxsv7paPOHTxdc+X9IweFIljcTWb9QXefiw6xq8uZy9WK7D1tv/nHqs4R1D4aqT
	JH8grXZGnTP3pAKypeD+57xwOVuFqaXMYiVhoFnHKPojwiY+pBpzSi/shOxCcSrRa4Aco4JGHgXkg
	27SzLfyZ90LAgO/yMx7zdtw8VtMmgyFPfu4y/hORCoKO47jmBXaCog9LjwAkm7iyWosZrNVGZ9wGG
	rcJ1CYCxchibzbArAKOfQNup8RrxgP8XZETC/Q7hkMrJeywaMqZBG7iqu/qBY8oGERynNpA86LuwK
	agc11XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQl-00000004aNS-0g7o;
	Sat, 18 Apr 2026 00:21:03 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQj-00000004aLl-1dix
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:21:02 +0000
Received: from [192.168.0.88] (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3B96520B7128;
	Fri, 17 Apr 2026 17:20:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3B96520B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776471659;
	bh=GVHuT39vJFq3z9p9Y8P4lQnO5Ygvg1D3+qSvKG01gbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dYT9ZNDuycE39Rmok1I6PkVn+1fRDnnVG7AQULHoh8ka9lRpuZZfVcN3GE476KHCm
	 7q9IKowPidbuXTYdIZorG3mFjFlT9roQFkhQcwZt5HmGQogAfGL0LjONAQykbCKjkF
	 8HrR1mr46rqVdmR18Z3suICKceYTvClPyPCcdPKY=
Message-ID: <ffe33ce4-0a1b-44af-9e17-7f641fef9339@linux.microsoft.com>
Date: Fri, 17 Apr 2026 17:20:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v0 07/15] mshv: Add ioctl support for MSHV-VFIO bridge
 device
Content-Language: en-US
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
 romank@linux.microsoft.com
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-8-mrathor@linux.microsoft.com>
 <aW-pw7GlQdFv-lf5@skinsburskii.localdomain>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <aW-pw7GlQdFv-lf5@skinsburskii.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172101_536923_033AC3EE 
X-CRM114-Status: GOOD (  20.50  )
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

On 1/20/26 08:13, Stanislav Kinsburskii wrote:
> On Mon, Jan 19, 2026 at 10:42:22PM -0800, Mukesh R wrote:
>> From: Mukesh Rathor <mrathor@linux.microsoft.com>
>>
>> Add ioctl support for creating MSHV devices for a paritition. At
>> present only VFIO device types are supported, but more could be
>> added. At a high level, a partition ioctl to create device verifies
>> it is of type VFIO and does some setup for bridge code in mshv_vfio.c.
>> Adapted from KVM device ioctls.
>>
>> Credits: Original author: Wei Liu <wei.liu@kernel.org>
>> NB: Slightly modified from the original version.
>>
>> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
>> ---
>>   drivers/hv/mshv_root_main.c | 126 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
>> index 83c7bad269a0..27313419828d 100644
>> --- a/drivers/hv/mshv_root_main.c
>> +++ b/drivers/hv/mshv_root_main.c
>> @@ -1551,6 +1551,129 @@ mshv_partition_ioctl_initialize(struct mshv_partition *partition)
>>   	return ret;
>>   }
>>   
>> +static long mshv_device_attr_ioctl(struct mshv_device *mshv_dev, int cmd,
>> +				   ulong uarg)
>> +{
>> +	struct mshv_device_attr attr;
>> +	const struct mshv_device_ops *devops = mshv_dev->device_ops;
>> +
>> +	if (copy_from_user(&attr, (void __user *)uarg, sizeof(attr)))
>> +		return -EFAULT;
>> +
>> +	switch (cmd) {
>> +	case MSHV_SET_DEVICE_ATTR:
>> +		if (devops->device_set_attr)
>> +			return devops->device_set_attr(mshv_dev, &attr);
>> +		break;
>> +	case MSHV_HAS_DEVICE_ATTR:
>> +		if (devops->device_has_attr)
>> +			return devops->device_has_attr(mshv_dev, &attr);
>> +		break;
>> +	}
>> +
>> +	return -EPERM;
>> +}
>> +
>> +static long mshv_device_fop_ioctl(struct file *filp, unsigned int cmd,
>> +				  ulong uarg)
>> +{
>> +	struct mshv_device *mshv_dev = filp->private_data;
>> +
>> +	switch (cmd) {
>> +	case MSHV_SET_DEVICE_ATTR:
>> +	case MSHV_HAS_DEVICE_ATTR:
>> +		return mshv_device_attr_ioctl(mshv_dev, cmd, uarg);
>> +	}
>> +
>> +	return -ENOTTY;
>> +}
>> +
>> +static int mshv_device_fop_release(struct inode *inode, struct file *filp)
>> +{
>> +	struct mshv_device *mshv_dev = filp->private_data;
>> +	struct mshv_partition *partition = mshv_dev->device_pt;
>> +
>> +	if (mshv_dev->device_ops->device_release) {
>> +		mutex_lock(&partition->pt_mutex);
>> +		hlist_del(&mshv_dev->device_ptnode);
>> +		mshv_dev->device_ops->device_release(mshv_dev);
>> +		mutex_unlock(&partition->pt_mutex);
>> +	}
>> +
>> +	mshv_partition_put(partition);
>> +	return 0;
>> +}
>> +
>> +static const struct file_operations mshv_device_fops = {
>> +	.owner = THIS_MODULE,
>> +	.unlocked_ioctl = mshv_device_fop_ioctl,
>> +	.release = mshv_device_fop_release,
>> +};
>> +
>> +long mshv_partition_ioctl_create_device(struct mshv_partition *partition,
>> +					void __user *uarg)
>> +{
>> +	long rc;
>> +	struct mshv_create_device devargk;
>> +	struct mshv_device *mshv_dev;
>> +	const struct mshv_device_ops *vfio_ops;
>> +	int type;
>> +
>> +	if (copy_from_user(&devargk, uarg, sizeof(devargk))) {
>> +		rc = -EFAULT;
>> +		goto out;
>> +	}
>> +
>> +	/* At present, only VFIO is supported */
>> +	if (devargk.type != MSHV_DEV_TYPE_VFIO) {
>> +		rc = -ENODEV;
>> +		goto out;
>> +	}
>> +
>> +	if (devargk.flags & MSHV_CREATE_DEVICE_TEST) {
>> +		rc = 0;
>> +		goto out;
>> +	}
>> +
>> +	mshv_dev = kzalloc(sizeof(*mshv_dev), GFP_KERNEL_ACCOUNT);
>> +	if (mshv_dev == NULL) {
>> +		rc = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	vfio_ops = &mshv_vfio_device_ops;
>> +	mshv_dev->device_ops = vfio_ops;
>> +	mshv_dev->device_pt = partition;
>> +
>> +	rc = vfio_ops->device_create(mshv_dev, type);
>> +	if (rc < 0) {
>> +		kfree(mshv_dev);
>> +		goto out;
>> +	}
>> +
>> +	hlist_add_head(&mshv_dev->device_ptnode, &partition->pt_devices);
>> +
>> +	mshv_partition_get(partition);
>> +	rc = anon_inode_getfd(vfio_ops->device_name, &mshv_device_fops,
>> +			      mshv_dev, O_RDWR | O_CLOEXEC);
>> +	if (rc < 0) {
>> +		mshv_partition_put(partition);
>> +		hlist_del(&mshv_dev->device_ptnode);
>> +		vfio_ops->device_release(mshv_dev);
>> +		goto out;
>> +	}
>> +
>> +	devargk.fd = rc;
>> +	rc = 0;
>> +
>> +	if (copy_to_user(uarg, &devargk, sizeof(devargk))) {
> 
> Shouldn't the partition be put here?

No. anon_inode_getfd was successful and so it installed the fd already..
As a result the cleanup will happen in the file op release.

Thanks,
-Mukesh

> Thanks,
> Stanislav
> 
>> +		rc = -EFAULT;
>> +		goto out;
>> +	}
>> +out:
>> +	return rc;
>> +}
>> +
>>   static long
>>   mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>>   {
>> @@ -1587,6 +1710,9 @@ mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>>   	case MSHV_ROOT_HVCALL:
>>   		ret = mshv_ioctl_passthru_hvcall(partition, true, uarg);
>>   		break;
>> +	case MSHV_CREATE_DEVICE:
>> +		ret = mshv_partition_ioctl_create_device(partition, uarg);
>> +		break;
>>   	default:
>>   		ret = -ENOTTY;
>>   	}
>> -- 
>> 2.51.2.vfs.0.1
>>


