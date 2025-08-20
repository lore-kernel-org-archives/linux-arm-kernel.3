Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215ABCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+xAES4ksR5IY7QvzcvRpGvVOPtaXnPBzVj9ciizyr4=; b=w2vrCx0AFYPJSpS11vHYsjka2l
	753wCmexoYUwDUpupSbNdFhxzb0f9WOu+pqK9OO/1/rp2x/y+ssY/of6I51Dmld7iaMTk8q11KF5P
	NbdKf/7sboxh4/6tG/uGLzR1F5zMTNkY0d9mxNwdXK8/RsWv6ktBr8YitudEJuVVtbLRnj3uUZKW6
	qpjg6ccvpC9aN0RfvtVonIhkCljPu0ybtyEvUfDfU2HyrOTv+5AUrXyrxdb8P+XgEWTpgOnVMmubX
	qrqRPwT0gxtx/tMLYSQaiaSKZltIbKayslTueAlzKliWqYmA97Wk36WUrDefDETDJ3LroXFCpKUN+
	ilzMMJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiyk-0000000DpLK-2RLF;
	Wed, 20 Aug 2025 13:35:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiPa-0000000Dh5T-2UMO;
	Wed, 20 Aug 2025 12:59:32 +0000
Received: from ideasonboard.com (mob-5-90-62-213.net.vodafone.it [5.90.62.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E72ED24AB;
	Wed, 20 Aug 2025 14:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755694711;
	bh=xeBOmvCFwizoGSZtMTSjmpEINhZWEE0c85+xZ21sl3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbznrUC6b3AlFHhBQm3GCCEt4Ai7JLMzV/tv00+xg2LnRY/dUv/K2QlvSqOo3Vziz
	 fx8BcA8Bx8Na6g1sWICTklXLjrYYAXB2y23HkUMCQ5QmzzXlHWq539HcNDNNEGv64+
	 JrNYx+QLfBjeBON4FNPfOQDSNap69aLkCpErMnEM=
Date: Wed, 20 Aug 2025 14:59:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <fx5klk52nulqouum7rteyfkvbmxjq63z3mgjkgnjtc563fsr2z@mhq7glvsopvp>
References: <20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com>
 <20250819-extensible-parameters-validation-v3-5-9dc008348b30@ideasonboard.com>
 <aKT4vz-XeTgSo125@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKT4vz-XeTgSo125@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_055930_915261_8C220F33 
X-CRM114-Status: GOOD (  52.67  )
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

Hi Sakari

On Wed, Aug 20, 2025 at 01:20:47AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> In the subject:
>
> s/common/params/
>
> On Tue, Aug 19, 2025 at 04:54:46PM +0200, Jacopo Mondi wrote:
> > Add to the v4l2 framework an helper function to support drivers
> > when validating a buffer of extensible parameters.
> >
> > Introduce new types in include/media/v4l2-params.h that drivers shall
> > use in order to comply with the v4l2-params validation procedure, and
> > add a helper functions to v4l2-params.c to perform block and buffer
> > validation.
> >
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                           |   2 +
> >  drivers/media/v4l2-core/Makefile      |   3 +-
> >  drivers/media/v4l2-core/v4l2-params.c | 123 +++++++++++++++++++++++++
> >  include/media/v4l2-params.h           | 165 ++++++++++++++++++++++++++++++++++
> >  4 files changed, 292 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 91df04e5d9022ccf2aea4445247369a8b86a4264..008f984c0769691f6ddec8d8f0f461fde056ddb3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -26385,6 +26385,8 @@ M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >  L:	linux-media@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
> > +F:	drivers/media/v4l2-core/v4l2-params.c
> > +F:	include/media/v4l2-params.h
> >  F:	include/uapi/linux/media/v4l2-extensible-params.h
> >
> >  VF610 NAND DRIVER
> > diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > index 2177b9d63a8ffc1127c5a70118249a2ff63cd759..323330dd359f95c1ae3d0c35bd6fcb8291a33a07 100644
> > --- a/drivers/media/v4l2-core/Makefile
> > +++ b/drivers/media/v4l2-core/Makefile
> > @@ -11,7 +11,8 @@ tuner-objs	:=	tuner-core.o
> >  videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
> >  			v4l2-event.o v4l2-subdev.o v4l2-common.o \
> >  			v4l2-ctrls-core.o v4l2-ctrls-api.o \
> > -			v4l2-ctrls-request.o v4l2-ctrls-defs.o
> > +			v4l2-ctrls-request.o v4l2-ctrls-defs.o \
> > +			v4l2-params.o
> >
> >  # Please keep it alphabetically sorted by Kconfig name
> >  # (e. g. LC_ALL=C sort Makefile)
> > diff --git a/drivers/media/v4l2-core/v4l2-params.c b/drivers/media/v4l2-core/v4l2-params.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8eeb12414c0981c13725a59d1668c5798b9fcf50
> > --- /dev/null
> > +++ b/drivers/media/v4l2-core/v4l2-params.c
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Video4Linux2 extensible parameters helpers
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#include <media/v4l2-params.h>
> > +
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size,
> > +				v4l2_params_validate_buffer buffer_validate)
> > +{
> > +	size_t header_size = offsetof(struct v4l2_params_buffer, data);
> > +	struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
> > +	size_t payload_size = vb2_get_plane_payload(vb, 0);
> > +	size_t buffer_size;
> > +	int ret;
> > +
> > +	/* Payload size can't be greater than the destination buffer size */
> > +	if (payload_size > max_size) {
> > +		dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Payload size can't be smaller than the header size */
> > +	if (payload_size < header_size) {
> > +		dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Validate the size reported in the parameter buffer header */
> > +	buffer_size = header_size + buffer->data_size;
> > +	if (buffer_size != payload_size) {
> > +		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> > +			buffer_size, payload_size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Driver-specific buffer validation. */
> > +	if (buffer_validate) {
> > +		ret = buffer_validate(dev, buffer);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
> > +
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers,
> > +				v4l2_params_validate_block block_validate)
> > +{
> > +	size_t block_offset = 0;
> > +	size_t buffer_size;
> > +	int ret;
> > +
> > +	/* Walk the list of parameter blocks and validate them. */
> > +	buffer_size = buffer->data_size;
> > +	while (buffer_size >= sizeof(struct v4l2_params_block_header)) {
> > +		const struct v4l2_params_handler *handler;
> > +		const struct v4l2_params_block_header *block;
> > +
> > +		/* Validate block sizes and types against the handlers. */
> > +		block = (const struct v4l2_params_block_header *)
> > +			(buffer->data + block_offset);
> > +
> > +		if (block->type >= num_handlers) {
> > +			dev_dbg(dev, "Invalid parameters block type\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (block->size > buffer_size) {
> > +			dev_dbg(dev, "Premature end of parameters data\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* It's invalid to specify both ENABLE and DISABLE. */
> > +		if ((block->flags & (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > +				     V4L2_PARAMS_FL_BLOCK_DISABLE)) ==
> > +		     (V4L2_PARAMS_FL_BLOCK_ENABLE |
> > +		     V4L2_PARAMS_FL_BLOCK_DISABLE)) {
> > +			dev_dbg(dev, "Invalid parameters block flags\n");
>
> There's also hweight*(); up to you.
>

I ended up leaving it the way it is.

ENABLE/DISABLE are mutally exclusive, while other flags might be not.

Let's wait to see what other flags we'll need

Thanks
   j

> > +			return -EINVAL;
> > +		}
> > +
> > +		/*
> > +		 * Match the block reported size against the handler's expected
> > +		 * one, but allow the block to only contain the header in
> > +		 * case it is going to be disabled.
> > +		 */
> > +		handler = &handlers[block->type];
> > +		if (block->size != handler->size) {
> > +			if (!(block->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) ||
> > +			      block->size != sizeof(*block)) {
>
> You could merge the two conditions.
>
> > +				dev_dbg(dev, "Invalid parameters block size\n");
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> > +		/* Driver-specific per-block validation. */
> > +		if (block_validate) {
> > +			ret = block_validate(dev, block);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +		block_offset += block->size;
> > +		buffer_size -= block->size;
> > +	}
> > +
> > +	if (buffer_size) {
> > +		dev_dbg(dev, "Unexpected data after the parameters buffer end\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_params_blocks_validate);
> > diff --git a/include/media/v4l2-params.h b/include/media/v4l2-params.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a8a4cc721bc4a51d8a6f9c7c009b34dfa3579229
> > --- /dev/null
> > +++ b/include/media/v4l2-params.h
> > @@ -0,0 +1,165 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Video4Linux2 extensible parameters helpers
> > + *
> > + * Copyright (C) 2025 Ideas On Board Oy
> > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > + */
> > +
> > +#ifndef V4L2_PARAMS_H_
> > +#define V4L2_PARAMS_H_
> > +
> > +#include <linux/media/v4l2-extensible-params.h>
> > +
> > +#include <linux/device.h>
>
> Alphabetic order?
>
> > +
> > +#include <media/videobuf2-core.h>
>
> Please use forward declarations instead of including the entire header
> here.
>
> > +
> > +/**
> > + * typedef v4l2_params_block_handler - V4L2 extensible format block handler
> > + * @arg: pointer the driver-specific argument
> > + * @block: the ISP configuration block to handle
> > + *
> > + * Defines the function signature of the functions that handle an ISP block
> > + * configuration.
> > + */
> > +typedef void (*v4l2_params_block_handler)(void *arg,
> > +					  const struct v4l2_params_block_header *block);
> > +
> > +/**
> > + * struct v4l2_params_handler - V4L2 extensible format handler
> > + * @size: the block expected size
> > + * @handler: the block handler function
> > + * @group: the device-specific group id the block belongs to (optional)
> > + * @features: the device-specific features flags (optional)
> > + *
> > + * The v4l2_params_handler defines the type that driver making use of the
> > + * V4L2 extensible parameters shall use to define their own ISP block
> > + * handlers.
> > + *
> > + * Drivers shall prepare a list of handlers, one for each supported ISP block
> > + * and correctly populate the structure's field with the expected block @size
> > + * (used for validation), a pointer to each block @handler function and an
> > + * optional @group and @feature flags, the driver can use to differentiate which
> > + * ISP blocks are present on the ISP implementation.
> > + *
> > + * The @group field is intended to be used as a bitmask of driver-specific
> > + * flags to allow the driver to setup certain blocks at different times. As an
> > + * example an ISP driver can divide its block handlers in "pre-configure" blocks
> > + * and "run-time" blocks and use the @group bitmask to identify the ISP blocks
> > + * that have to be pre-configured from the ones that only have to be handled at
> > + * run-time. The usage and definition of the @group field is totally
> > + * driver-specific.
> > + *
> > + * The @features flag can instead be used to differentiate between blocks
> > + * implemented in different revisions of the ISP design. In example some ISP
> > + * blocks might be present on more recent revision than others. Populating the
> > + * @features bitmask with the ISP/SoC machine identifier allows the driver to
> > + * correctly ignore the blocks not supported on the ISP revision it is running
> > + * on. As per the @group bitmask, the usage and definition of the @features
> > + * field is totally driver-specific.
> > + */
> > +struct v4l2_params_handler {
> > +	size_t size;
> > +	v4l2_params_block_handler handler;
> > +	unsigned int group;
> > +	unsigned int features;
> > +};
> > +
> > +/**
> > + * typedef v4l2_params_validate_buffer - V4L2 extensible parameters buffer
> > + *					 validation callback
> > + * @dev: the driver's device pointer (as passed by the driver to
> > + *	 v4l2_params_buffer_validate())
> > + * @buffer: the extensible parameters buffer
> > + *
> > + * Defines the function prototype for the driver's callback to perform
> > + * driver-specific validation on the extensible parameters buffer
> > + */
> > +typedef int (*v4l2_params_validate_buffer)(struct device *dev,
> > +					   const struct v4l2_params_buffer *buffer);
> > +
> > +/**
> > + * v4l2_params_buffer_validate - Validate a V4L2 extensible parameters buffer
> > + * @dev: the driver's device pointer
> > + * @vb: the videobuf2 buffer
> > + * @max_size: the maximum allowed buffer size
> > + * @buffer_validate: callback to the driver-specific buffer validation
> > + *
> > + * Helper function that performs validation of an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * extensible parameters buffer size correctness.
> > + *
> > + * The @vb buffer as received from the vb2 .buf_prepare() operation is checked
> > + * against @max_size and its validated to be large enough to accommodate at
> > + * least one ISP configuration block. The effective buffer size is compared
> > + * with the reported data size to make sure they match.
> > + *
> > + * If provided, the @buffer_validate callback function is invoked to allow
> > + * drivers to perform driver-specific validation (such as checking that the
> > + * buffer version is supported).
> > + *
> > + * Drivers should use this function to validate the buffer size correctness
> > + * before performing a copy of the user-provided videobuf2 buffer content into a
> > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver.
> > + *.
> > + * Examples of users of this function can be found in
> > + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> > + */
> > +int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
> > +				size_t max_size,
> > +				v4l2_params_validate_buffer buffer_validate);
> > +
> > +/**
> > + * typedef v4l2_params_validate_block - V4L2 extensible parameters block
> > + *					validation callback
> > + * @dev: the driver's device pointer (as passed by the driver to
> > + *	 v4l2_params_validate())
> > + * @block: the ISP configuration block to validate
> > + *
> > + * Defines the function prototype for the driver's callback to perform
> > + * driver-specific validation on each ISP block.
> > + */
> > +typedef int (*v4l2_params_validate_block)(struct device *dev,
> > +					  const struct v4l2_params_block_header *block);
> > +
> > +/**
> > + * v4l2_params_blocks_validate - Validate V4L2 extensible parameters ISP
> > + *				 configuration blocks
> > + * @dev: the driver's device pointer
> > + * @buffer: the extensible parameters configuration buffer
> > + * @handlers: the list of block handlers
> > + * @num_handlers: the number of block handlers
> > + * @block_validate: callback to the driver-specific per-block validation
> > + *		    function
> > + *
> > + * Helper function that performs validation of the ISP configuration blocks in
> > + * an extensible parameters buffer.
> > + *
> > + * The helper is meant to be used by drivers to perform validation of the
> > + * ISP configuration data blocks. For each block in the extensible parameters
> > + * buffer, its size and correctness are validated against its associated handler
> > + * in the @handlers list. Additionally, if provided, the @block_validate
> > + * callback is invoked on each block to allow drivers to perform driver-specific
> > + * validation.
> > + *
> > + * Drivers should use this function to validate the ISP configuration blocks
> > + * after having validated the correctness of the vb2 buffer sizes by using the
> > + * v4l2_params_buffer_validate() helper first. Once the buffer size has been
> > + * validated, drivers should perform a copy of the user-provided buffer into a
> > + * kernel-only memory buffer to prevent userspace from modifying the buffer
> > + * content after it has been submitted to the driver, and then call this
> > + * function to perform per-block validation.
> > + *
> > + * Examples of users of this function can be found in
> > + * rkisp1_params_prepare_ext_params() and in c3_isp_params_vb2_buf_prepare().
> > + */
> > +int v4l2_params_blocks_validate(struct device *dev,
> > +				const struct v4l2_params_buffer *buffer,
> > +				const struct v4l2_params_handler *handlers,
> > +				size_t num_handlers,
> > +				v4l2_params_validate_block block_validate);
> > +
> > +#endif /* V4L2_PARAMS_H_ */
> >
>
> --
> Regards,
>
> Sakari Ailus

