Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5255CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIZ7bzfOU+32o456dducA6V77xDpYZ8q7ZzTpg2VDtM=; b=frx1CfBlpjk0nQM6s3FT/Z3B/u
	cTVjpLVCAOaWo/h9ai5m5QCb6gogGqP6Gsnd2gNZjgffzWlEqOZihnYdC8jxUl5PpaOJLx9I+bT3I
	xZgCdKsjeaxIZcmRQM39CM0JI7psanggRCjNhcRuqyxIVM8+ufV9lZpVeNHaRSCqSKHR/ta72R5Ie
	ikEaHHkWn5wl+tkH+ub5OZPY4CrT2mkO4GCRIs9nG/BlCvG6S2oo8ljy+56NviFbYnG52Y8letbmt
	G4S9gMHSEuBF0L2xH3L7JeFFOP1SIoVLhNDkDCmEkFDH6BXcl8QEbWe2Kocv5ik76NtG1Okv2AFOU
	xiiQJuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEHy-000000048Er-2mbh;
	Tue, 20 Jan 2026 16:09:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEHv-000000048Dt-3Bl7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:09:04 +0000
Received: from skinsburskii.localdomain (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2544020B7167;
	Tue, 20 Jan 2026 08:09:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2544020B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768925342;
	bh=iIZ7bzfOU+32o456dducA6V77xDpYZ8q7ZzTpg2VDtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDJga7K0N+4P68lcEAZIkzvNWr/d4a4erZoM6A9oDmUjDtDW8qpeY2QlJaVLNMMho
	 AjVJWrCGPrMN01TJa64q6v0vAEqXHMR6+xcTbpJMwqsm9W/h3tQqNtNaYNf0kDWpBb
	 Npz5ZO5vyjcIirlciM5xur4auzAEdCskgnwCgqtk=
Date: Tue, 20 Jan 2026 08:09:02 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 06/15] mshv: Implement mshv bridge device for VFIO
Message-ID: <aW-oniY3VpagQMPb@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-7-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-7-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080903_856740_D790F867 
X-CRM114-Status: GOOD (  28.75  )
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

On Mon, Jan 19, 2026 at 10:42:21PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> Add a new file to implement VFIO-MSHV bridge pseudo device. These
> functions are called in the VFIO framework, and credits to kvm/vfio.c
> as this file was adapted from it.
> 
> Original author: Wei Liu <wei.liu@kernel.org>
> (Slightly modified from the original version).
> 

There is a Linux standard for giving credits when code is adapted from.
This doesn't follow that standard. Please fix.

> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> ---
>  drivers/hv/Makefile    |   3 +-
>  drivers/hv/mshv_vfio.c | 210 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hv/mshv_vfio.c
> 
> diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
> index a49f93c2d245..eae003c4cb8f 100644
> --- a/drivers/hv/Makefile
> +++ b/drivers/hv/Makefile
> @@ -14,7 +14,8 @@ hv_vmbus-y := vmbus_drv.o \
>  hv_vmbus-$(CONFIG_HYPERV_TESTING)	+= hv_debugfs.o
>  hv_utils-y := hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
>  mshv_root-y := mshv_root_main.o mshv_synic.o mshv_eventfd.o mshv_irq.o \
> -	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o
> +	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o \
> +               mshv_vfio.o
>  mshv_vtl-y := mshv_vtl_main.o
>  
>  # Code that must be built-in
> diff --git a/drivers/hv/mshv_vfio.c b/drivers/hv/mshv_vfio.c
> new file mode 100644
> index 000000000000..6ea4d99a3bd2
> --- /dev/null
> +++ b/drivers/hv/mshv_vfio.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * VFIO-MSHV bridge pseudo device
> + *
> + * Heavily inspired by the VFIO-KVM bridge pseudo device.
> + */
> +#include <linux/errno.h>
> +#include <linux/file.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/vfio.h>
> +
> +#include "mshv.h"
> +#include "mshv_root.h"
> +
> +struct mshv_vfio_file {
> +	struct list_head node;
> +	struct file *file;	/* list of struct mshv_vfio_file */
> +};
> +
> +struct mshv_vfio {
> +	struct list_head file_list;
> +	struct mutex lock;
> +};
> +
> +static bool mshv_vfio_file_is_valid(struct file *file)
> +{
> +	bool (*fn)(struct file *file);
> +	bool ret;
> +
> +	fn = symbol_get(vfio_file_is_valid);
> +	if (!fn)
> +		return false;
> +
> +	ret = fn(file);
> +
> +	symbol_put(vfio_file_is_valid);
> +
> +	return ret;
> +}
> +
> +static long mshv_vfio_file_add(struct mshv_device *mshvdev, unsigned int fd)
> +{
> +	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
> +	struct mshv_vfio_file *mvf;
> +	struct file *filp;
> +	long ret = 0;
> +
> +	filp = fget(fd);
> +	if (!filp)
> +		return -EBADF;
> +
> +	/* Ensure the FD is a vfio FD. */
> +	if (!mshv_vfio_file_is_valid(filp)) {
> +		ret = -EINVAL;
> +		goto out_fput;
> +	}
> +
> +	mutex_lock(&mshv_vfio->lock);
> +
> +	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
> +		if (mvf->file == filp) {
> +			ret = -EEXIST;
> +			goto out_unlock;
> +		}
> +	}
> +
> +	mvf = kzalloc(sizeof(*mvf), GFP_KERNEL_ACCOUNT);
> +	if (!mvf) {
> +		ret = -ENOMEM;
> +		goto out_unlock;
> +	}
> +
> +	mvf->file = get_file(filp);
> +	list_add_tail(&mvf->node, &mshv_vfio->file_list);
> +
> +out_unlock:
> +	mutex_unlock(&mshv_vfio->lock);
> +out_fput:
> +	fput(filp);
> +	return ret;
> +}
> +
> +static long mshv_vfio_file_del(struct mshv_device *mshvdev, unsigned int fd)
> +{
> +	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
> +	struct mshv_vfio_file *mvf;
> +	long ret;
> +
> +	CLASS(fd, f)(fd);
> +
> +	if (fd_empty(f))
> +		return -EBADF;
> +
> +	ret = -ENOENT;
> +	mutex_lock(&mshv_vfio->lock);
> +
> +	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
> +		if (mvf->file != fd_file(f))
> +			continue;
> +
> +		list_del(&mvf->node);
> +		fput(mvf->file);
> +		kfree(mvf);
> +		ret = 0;
> +		break;
> +	}
> +
> +	mutex_unlock(&mshv_vfio->lock);
> +	return ret;
> +}
> +
> +static long mshv_vfio_set_file(struct mshv_device *mshvdev, long attr,
> +			      void __user *arg)
> +{
> +	int32_t __user *argp = arg;
> +	int32_t fd;
> +
> +	switch (attr) {
> +	case MSHV_DEV_VFIO_FILE_ADD:
> +		if (get_user(fd, argp))
> +			return -EFAULT;
> +		return mshv_vfio_file_add(mshvdev, fd);
> +
> +	case MSHV_DEV_VFIO_FILE_DEL:
> +		if (get_user(fd, argp))
> +			return -EFAULT;
> +		return mshv_vfio_file_del(mshvdev, fd);
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static long mshv_vfio_set_attr(struct mshv_device *mshvdev,
> +			      struct mshv_device_attr *attr)
> +{
> +	switch (attr->group) {
> +	case MSHV_DEV_VFIO_FILE:
> +		return mshv_vfio_set_file(mshvdev, attr->attr,
> +					  u64_to_user_ptr(attr->addr));
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static long mshv_vfio_has_attr(struct mshv_device *mshvdev,
> +			      struct mshv_device_attr *attr)
> +{
> +	switch (attr->group) {
> +	case MSHV_DEV_VFIO_FILE:
> +		switch (attr->attr) {
> +		case MSHV_DEV_VFIO_FILE_ADD:
> +		case MSHV_DEV_VFIO_FILE_DEL:
> +			return 0;
> +		}
> +
> +		break;
> +	}
> +
> +	return -ENXIO;
> +}
> +
> +static long mshv_vfio_create_device(struct mshv_device *mshvdev, u32 type)
> +{
> +	struct mshv_device *tmp;
> +	struct mshv_vfio *mshv_vfio;
> +
> +	/* Only one VFIO "device" per VM */
> +	hlist_for_each_entry(tmp, &mshvdev->device_pt->pt_devices,
> +			     device_ptnode)
> +		if (tmp->device_ops == &mshv_vfio_device_ops)
> +			return -EBUSY;
> +
> +	mshv_vfio = kzalloc(sizeof(*mshv_vfio), GFP_KERNEL_ACCOUNT);
> +	if (mshv_vfio == NULL)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&mshv_vfio->file_list);
> +	mutex_init(&mshv_vfio->lock);
> +
> +	mshvdev->device_private = mshv_vfio;
> +
> +	return 0;
> +}
> +
> +/* This is called from mshv_device_fop_release() */
> +static void mshv_vfio_release_device(struct mshv_device *mshvdev)
> +{
> +	struct mshv_vfio *mv = mshvdev->device_private;
> +	struct mshv_vfio_file *mvf, *tmp;
> +
> +	list_for_each_entry_safe(mvf, tmp, &mv->file_list, node) {
> +		fput(mvf->file);

This put must be sync as device must be detached from domain before
attempting partition destruction.
This was explicitly mentioned in the patch originated this code.
Please fix, add a comment and credits to the commit message.

Thanks,
Stanislav


> +		list_del(&mvf->node);
> +		kfree(mvf);
> +	}
> +
> +	kfree(mv);
> +	kfree(mshvdev);
> +}
> +
> +struct mshv_device_ops mshv_vfio_device_ops = {
> +	.device_name = "mshv-vfio",
> +	.device_create = mshv_vfio_create_device,
> +	.device_release = mshv_vfio_release_device,
> +	.device_set_attr = mshv_vfio_set_attr,
> +	.device_has_attr = mshv_vfio_has_attr,
> +};
> -- 
> 2.51.2.vfs.0.1
> 

