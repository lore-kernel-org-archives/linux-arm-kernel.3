Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEFDF31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=me5YO/Z98Xo/CnJEc58EgRSQPAwm8XJvQ17AhbPdrgA=; b=Xk/fgCaSFqSUQvYlumrSnfksq5
	t8Z6HlPgPIfWnDfAOuBj7/pj9A6ePYkDHFh5ZH/7xOPVcj3vMxLoGkZHLTXjgAxYY8DglpQLsGTRf
	CgmSlFE0U1c45/ptxytUk8d44FKIpzM8hCc9mC1m8qEAzhsPbj8posWqyuT/VHQoblVc3E7lNKek5
	ZeYl6TiNZLa5CTtQQ7FVCdMxAZx7nfNAbdYhPChYRJa5NG2ERPiteh4+s6etamcXNCL+1ojf1e2NK
	ci5HTJYRsot0KLh5n6WzDSGXYtwopLZFjWDnuoTLw5t0aJebQUJFQl8ExuyoW8pbFGHNGE8qDORqD
	j71eazuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqZM-0000000Aimd-410n;
	Thu, 09 Apr 2026 14:41:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAqZK-0000000AimA-3Mx6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:41:20 +0000
Received: from skinsburskii.localdomain (c-98-225-44-182.hsd1.wa.comcast.net [98.225.44.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6C26F20B710C;
	Thu,  9 Apr 2026 07:41:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C26F20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775745676;
	bh=me5YO/Z98Xo/CnJEc58EgRSQPAwm8XJvQ17AhbPdrgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyTp/+V3zug1H1eKD8Y+lqErBGhVzyZqiXJvVdC5BNnw4e6X/hzd27rqaaDkrvcX2
	 iXSe8ig/44rWzZANK4AaFJXUBGzYFW5AnwrCbIKgEuPTDF3ur5xB+WTGM+F7sD6B7L
	 HVysnLWmifu4NpQwPkS5atVyXedHP7VyIvA4xTbA=
Date: Thu, 9 Apr 2026 07:41:13 -0700
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
Message-ID: <ade6iYUcODxEjl0Q@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-7-mrathor@linux.microsoft.com>
 <aW-oniY3VpagQMPb@skinsburskii.localdomain>
 <c30ede65-46c4-02b1-756a-868f9a265cf1@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c30ede65-46c4-02b1-756a-868f9a265cf1@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_074118_876232_7B4017DE 
X-CRM114-Status: GOOD (  34.14  )
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

On Tue, Apr 07, 2026 at 10:41:12AM -0700, Mukesh R wrote:
> On 1/20/26 08:09, Stanislav Kinsburskii wrote:
> > On Mon, Jan 19, 2026 at 10:42:21PM -0800, Mukesh R wrote:
> > > From: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > 
> > > Add a new file to implement VFIO-MSHV bridge pseudo device. These
> > > functions are called in the VFIO framework, and credits to kvm/vfio.c
> > > as this file was adapted from it.
> > > 
> > > Original author: Wei Liu <wei.liu@kernel.org>
> > > (Slightly modified from the original version).
> > > 
> > 
> > There is a Linux standard for giving credits when code is adapted from.
> > This doesn't follow that standard. Please fix.
> > 
> > > Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> > > ---
> > >   drivers/hv/Makefile    |   3 +-
> > >   drivers/hv/mshv_vfio.c | 210 +++++++++++++++++++++++++++++++++++++++++
> > >   2 files changed, 212 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/hv/mshv_vfio.c
> > > 
> > > diff --git a/drivers/hv/Makefile b/drivers/hv/Makefile
> > > index a49f93c2d245..eae003c4cb8f 100644
> > > --- a/drivers/hv/Makefile
> > > +++ b/drivers/hv/Makefile
> > > @@ -14,7 +14,8 @@ hv_vmbus-y := vmbus_drv.o \
> > >   hv_vmbus-$(CONFIG_HYPERV_TESTING)	+= hv_debugfs.o
> > >   hv_utils-y := hv_util.o hv_kvp.o hv_snapshot.o hv_utils_transport.o
> > >   mshv_root-y := mshv_root_main.o mshv_synic.o mshv_eventfd.o mshv_irq.o \
> > > -	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o
> > > +	       mshv_root_hv_call.o mshv_portid_table.o mshv_regions.o \
> > > +               mshv_vfio.o
> > >   mshv_vtl-y := mshv_vtl_main.o
> > >   # Code that must be built-in
> > > diff --git a/drivers/hv/mshv_vfio.c b/drivers/hv/mshv_vfio.c
> > > new file mode 100644
> > > index 000000000000..6ea4d99a3bd2
> > > --- /dev/null
> > > +++ b/drivers/hv/mshv_vfio.c
> > > @@ -0,0 +1,210 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * VFIO-MSHV bridge pseudo device
> > > + *
> > > + * Heavily inspired by the VFIO-KVM bridge pseudo device.
> > > + */
> > > +#include <linux/errno.h>
> > > +#include <linux/file.h>
> > > +#include <linux/list.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/vfio.h>
> > > +
> > > +#include "mshv.h"
> > > +#include "mshv_root.h"
> > > +
> > > +struct mshv_vfio_file {
> > > +	struct list_head node;
> > > +	struct file *file;	/* list of struct mshv_vfio_file */
> > > +};
> > > +
> > > +struct mshv_vfio {
> > > +	struct list_head file_list;
> > > +	struct mutex lock;
> > > +};
> > > +
> > > +static bool mshv_vfio_file_is_valid(struct file *file)
> > > +{
> > > +	bool (*fn)(struct file *file);
> > > +	bool ret;
> > > +
> > > +	fn = symbol_get(vfio_file_is_valid);
> > > +	if (!fn)
> > > +		return false;
> > > +
> > > +	ret = fn(file);
> > > +
> > > +	symbol_put(vfio_file_is_valid);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static long mshv_vfio_file_add(struct mshv_device *mshvdev, unsigned int fd)
> > > +{
> > > +	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
> > > +	struct mshv_vfio_file *mvf;
> > > +	struct file *filp;
> > > +	long ret = 0;
> > > +
> > > +	filp = fget(fd);
> > > +	if (!filp)
> > > +		return -EBADF;
> > > +
> > > +	/* Ensure the FD is a vfio FD. */
> > > +	if (!mshv_vfio_file_is_valid(filp)) {
> > > +		ret = -EINVAL;
> > > +		goto out_fput;
> > > +	}
> > > +
> > > +	mutex_lock(&mshv_vfio->lock);
> > > +
> > > +	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
> > > +		if (mvf->file == filp) {
> > > +			ret = -EEXIST;
> > > +			goto out_unlock;
> > > +		}
> > > +	}
> > > +
> > > +	mvf = kzalloc(sizeof(*mvf), GFP_KERNEL_ACCOUNT);
> > > +	if (!mvf) {
> > > +		ret = -ENOMEM;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	mvf->file = get_file(filp);
> > > +	list_add_tail(&mvf->node, &mshv_vfio->file_list);
> > > +
> > > +out_unlock:
> > > +	mutex_unlock(&mshv_vfio->lock);
> > > +out_fput:
> > > +	fput(filp);
> > > +	return ret;
> > > +}
> > > +
> > > +static long mshv_vfio_file_del(struct mshv_device *mshvdev, unsigned int fd)
> > > +{
> > > +	struct mshv_vfio *mshv_vfio = mshvdev->device_private;
> > > +	struct mshv_vfio_file *mvf;
> > > +	long ret;
> > > +
> > > +	CLASS(fd, f)(fd);
> > > +
> > > +	if (fd_empty(f))
> > > +		return -EBADF;
> > > +
> > > +	ret = -ENOENT;
> > > +	mutex_lock(&mshv_vfio->lock);
> > > +
> > > +	list_for_each_entry(mvf, &mshv_vfio->file_list, node) {
> > > +		if (mvf->file != fd_file(f))
> > > +			continue;
> > > +
> > > +		list_del(&mvf->node);
> > > +		fput(mvf->file);
> > > +		kfree(mvf);
> > > +		ret = 0;
> > > +		break;
> > > +	}
> > > +
> > > +	mutex_unlock(&mshv_vfio->lock);
> > > +	return ret;
> > > +}
> > > +
> > > +static long mshv_vfio_set_file(struct mshv_device *mshvdev, long attr,
> > > +			      void __user *arg)
> > > +{
> > > +	int32_t __user *argp = arg;
> > > +	int32_t fd;
> > > +
> > > +	switch (attr) {
> > > +	case MSHV_DEV_VFIO_FILE_ADD:
> > > +		if (get_user(fd, argp))
> > > +			return -EFAULT;
> > > +		return mshv_vfio_file_add(mshvdev, fd);
> > > +
> > > +	case MSHV_DEV_VFIO_FILE_DEL:
> > > +		if (get_user(fd, argp))
> > > +			return -EFAULT;
> > > +		return mshv_vfio_file_del(mshvdev, fd);
> > > +	}
> > > +
> > > +	return -ENXIO;
> > > +}
> > > +
> > > +static long mshv_vfio_set_attr(struct mshv_device *mshvdev,
> > > +			      struct mshv_device_attr *attr)
> > > +{
> > > +	switch (attr->group) {
> > > +	case MSHV_DEV_VFIO_FILE:
> > > +		return mshv_vfio_set_file(mshvdev, attr->attr,
> > > +					  u64_to_user_ptr(attr->addr));
> > > +	}
> > > +
> > > +	return -ENXIO;
> > > +}
> > > +
> > > +static long mshv_vfio_has_attr(struct mshv_device *mshvdev,
> > > +			      struct mshv_device_attr *attr)
> > > +{
> > > +	switch (attr->group) {
> > > +	case MSHV_DEV_VFIO_FILE:
> > > +		switch (attr->attr) {
> > > +		case MSHV_DEV_VFIO_FILE_ADD:
> > > +		case MSHV_DEV_VFIO_FILE_DEL:
> > > +			return 0;
> > > +		}
> > > +
> > > +		break;
> > > +	}
> > > +
> > > +	return -ENXIO;
> > > +}
> > > +
> > > +static long mshv_vfio_create_device(struct mshv_device *mshvdev, u32 type)
> > > +{
> > > +	struct mshv_device *tmp;
> > > +	struct mshv_vfio *mshv_vfio;
> > > +
> > > +	/* Only one VFIO "device" per VM */
> > > +	hlist_for_each_entry(tmp, &mshvdev->device_pt->pt_devices,
> > > +			     device_ptnode)
> > > +		if (tmp->device_ops == &mshv_vfio_device_ops)
> > > +			return -EBUSY;
> > > +
> > > +	mshv_vfio = kzalloc(sizeof(*mshv_vfio), GFP_KERNEL_ACCOUNT);
> > > +	if (mshv_vfio == NULL)
> > > +		return -ENOMEM;
> > > +
> > > +	INIT_LIST_HEAD(&mshv_vfio->file_list);
> > > +	mutex_init(&mshv_vfio->lock);
> > > +
> > > +	mshvdev->device_private = mshv_vfio;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* This is called from mshv_device_fop_release() */
> > > +static void mshv_vfio_release_device(struct mshv_device *mshvdev)
> > > +{
> > > +	struct mshv_vfio *mv = mshvdev->device_private;
> > > +	struct mshv_vfio_file *mvf, *tmp;
> > > +
> > > +	list_for_each_entry_safe(mvf, tmp, &mv->file_list, node) {
> > > +		fput(mvf->file);
> > 
> > This put must be sync as device must be detached from domain before
> > attempting partition destruction.
> 
> Like I said in 6.6 PR, this does not attach or detach devices.
> 

You are mistaken. It absolutely does.

Thanks,
Stanislav

> > This was explicitly mentioned in the patch originated this code.
> > Please fix, add a comment and credits to the commit message.
> 
> That was ".detstroy" hook which is gone.
> 
> Thanks,
> -Mukesh
> 
> 
> > Thanks,
> > Stanislav
> > 
> > 
> > > +		list_del(&mvf->node);
> > > +		kfree(mvf);
> > > +	}
> > > +
> > > +	kfree(mv);
> > > +	kfree(mshvdev);
> > > +}
> > > +
> > > +struct mshv_device_ops mshv_vfio_device_ops = {
> > > +	.device_name = "mshv-vfio",
> > > +	.device_create = mshv_vfio_create_device,
> > > +	.device_release = mshv_vfio_release_device,
> > > +	.device_set_attr = mshv_vfio_set_attr,
> > > +	.device_has_attr = mshv_vfio_has_attr,
> > > +};
> > > -- 
> > > 2.51.2.vfs.0.1
> > > 
> 

