Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8309BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVgkhTlafty+L/vxHX/GEJpdSDDX7Jm+wl7HFwI8zi8=; b=b6nAHCQbq7Ib8v24L8yJlgQzNW
	F4iDhnrqHa6kEVrB/6Yh4KvzGPZsg/JH0oAHwHBJVLBFX26XZOB0Au9oydrBahiW0X25K5MWdh902
	VtWEPNa6NXbuKIE3at0NoygxpXUvLtaeBAs3g3M2mwLE2UKuq1WkH5ED7xiYl5/EgozRUZ/EDZdxT
	NGmf540HumQNZU87xh6L4a/LiAL7xtvef1I8dk3isRMqBa3OVSW0NpTmyf27YAZXixCbJ/4ny9u8p
	H1BxPZOOLse8Q7SaZtWwW0oF9wb3+ZxSagYPg3zpzOx5MCXUG/JKtscESxK7obQ0oGSrqjF2/Q0RG
	Po1y3Cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEar-00000002VJ5-43rJ;
	Wed, 30 Jul 2025 21:44:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEG0-00000002Th3-04kB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753910560; x=1785446560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sMf4Lo8mFFoam81Ms38b19tARdJKE66DvP2/RGQEHo=;
  b=I17Ss5w62F5Z6nByH9O50dV6kjTVw5AjQyR1e9QmZB9uIK9Z4+zn+Wno
   brXRb0j+68cyOUoByhyTvKG4LYCqvZcv8JFws/Zio10BwxbcDkC4ZtDMZ
   irsQwkidot6y9KtZV05GcdfkmsDIdKRbU6FWcaQ094ELoJvPVpvjdW+31
   lzE7Kenu4RoLGB120zKwul1agyjnfo62jFBpXCiYR/DOCvHFqwVOhuMDP
   Khohj6Tk0XCp4X0x9axE3yq+WN/kF4sgNjBeXIxCnNWH4cKm6+S8ivioo
   063j18B/ZXwTskS6bDVu1KrvUpIXYaHNW4cU96wHFMfhNhaIGthCGlOon
   Q==;
X-CSE-ConnectionGUID: KNhe9QC3T4m/sHd3OWx1wQ==
X-CSE-MsgGUID: zsTuyG6WQwGOSmgJ8NE8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56156622"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56156622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:22:39 -0700
X-CSE-ConnectionGUID: YcaH1nJ9QGWY2SSMHcC6EQ==
X-CSE-MsgGUID: eGvSTNbzQQqzHkTvZOEp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="168377951"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.173])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:22:35 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EBD5611F97D;
	Thu, 31 Jul 2025 00:22:32 +0300 (EEST)
Date: Wed, 30 Jul 2025 21:22:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v11 18/19] media: platform: Add mali-c55 parameters video
 node
Message-ID: <aIqNGObJlU-YCgPC@kekkonen.localdomain>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-18-bc20e460e42a@ideasonboard.com>
 <aIot2pmuIIidZORo@kekkonen.localdomain>
 <7b6dbaab-ec40-4b84-8e8f-b53062568838@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6dbaab-ec40-4b84-8e8f-b53062568838@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_142240_098620_D22EFB62 
X-CRM114-Status: GOOD (  31.49  )
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

Hi Dan,

On Wed, Jul 30, 2025 at 10:11:22PM +0100, Dan Scally wrote:
> Hi Sakari, thanks for the comments
> 
> On 30/07/2025 15:36, Sakari Ailus wrote:
> > Hi Daniel,
> > 
> > Thanks for the update.
> > 
> > On Mon, Jul 14, 2025 at 04:06:44PM +0100, Daniel Scally wrote:
> > > +static int
> > > +mali_c55_params_validate_buffer(struct device *dev,
> > > +				const struct v4l2_params_buffer *buffer)
> > > +{
> > > +	/* Only v1 is supported at the moment. */
> > > +	if (buffer->version != MALI_C55_PARAM_BUFFER_V1) {
> > > +		dev_dbg(dev, "Unsupported extensible format version: %u\n",
> > > +			buffer->version);
> > > +		return -EINVAL;
> > > +	}
> > Is there anything else to validate here?
> 
> 
> Not at this stage; the rest of the validation is done by Jacopo's new
> framework
> 
> > 
> > I guess nothing is done with the information other than the value is being
> > checked above, but if it had an effect on something, one would need to copy
> > the information to memory not accessible to the user.
> 
> 
> Thats done later in .buf_prepare()

Ah, thanks; I missed that earlier.

> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > > +	struct v4l2_params_buffer *config;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_params_buffer_validate(
> > > +		mali_c55->dev, vb,
> > > +		v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
> > > +		mali_c55_params_validate_buffer);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Copy the parameters buffer provided by userspace to the internal
> > > +	 * scratch buffer. This protects against the chance of userspace making
> > > +	 * changed to the buffer content whilst the driver processes it.
> > > +	 */
> > > +	config = vb2_plane_vaddr(vb, 0);
> > > +	memcpy(buf->config, config, v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
> > > +
> > > +	return v4l2_params_blocks_validate(mali_c55->dev, buf->config,
> > > +					   mali_c55_block_handlers,
> > > +					   ARRAY_SIZE(mali_c55_block_handlers),
> > > +					   NULL);
> > > +}
> > > +
> > > +static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
> > > +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> > > +	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
> > > +
> > > +	spin_lock(&params->buffers.lock);
> > > +	list_add_tail(&buf->queue, &params->buffers.queue);
> > > +	spin_unlock(&params->buffers.lock);
> > > +}
> > > +
> > > +static void mali_c55_params_return_buffers(struct mali_c55_params *params,
> > > +					   enum vb2_buffer_state state)
> > > +{
> > > +	struct mali_c55_params_buf *buf, *tmp;
> > > +
> > > +	guard(spinlock)(&params->buffers.lock);
> > > +
> > > +	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
> > > +		list_del(&buf->queue);
> > > +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> > > +	}
> > > +}
> > > +
> > > +static int mali_c55_params_start_streaming(struct vb2_queue *q,
> > > +					   unsigned int count)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > > +	struct mali_c55 *mali_c55 = params->mali_c55;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > +	if (ret)
> > > +		goto err_return_buffers;
> > > +
> > > +	ret = video_device_pipeline_alloc_start(&params->vdev);
> > > +	if (ret)
> > > +		goto err_pm_put;
> > > +
> > > +	ret = video_device_pipeline_started(&params->vdev);
> > > +	if (ret < 0)
> > > +		goto err_stop_pipeline;
> > > +
> > > +	return 0;
> > > +
> > > +err_stop_pipeline:
> > > +	video_device_pipeline_stop(&params->vdev);
> > > +err_pm_put:
> > > +	pm_runtime_put(mali_c55->dev);
> > > +err_return_buffers:
> > > +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void mali_c55_params_stop_streaming(struct vb2_queue *q)
> > > +{
> > > +	struct mali_c55_params *params = vb2_get_drv_priv(q);
> > > +	struct media_pipeline *pipe;
> > > +
> > > +	pipe = video_device_pipeline(&params->vdev);
> > > +	if (mali_c55_pipeline_ready(pipe))
> > > +		media_pipeline_stopped(pipe);
> > > +
> > > +	video_device_pipeline_stop(&params->vdev);
> > > +	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
> > > +}
> > > +
> > > +static const struct vb2_ops mali_c55_params_vb2_ops = {
> > > +	.queue_setup = mali_c55_params_queue_setup,
> > > +	.buf_init = mali_c55_params_buf_init,
> > > +	.buf_cleanup = mali_c55_params_buf_cleanup,
> > > +	.buf_queue = mali_c55_params_buf_queue,
> > > +	.buf_prepare = mali_c55_params_buf_prepare,
> > > +	.wait_prepare = vb2_ops_wait_prepare,
> > > +	.wait_finish = vb2_ops_wait_finish,
> > > +	.start_streaming = mali_c55_params_start_streaming,
> > > +	.stop_streaming = mali_c55_params_stop_streaming,
> > > +};
> > > +
> > > +void mali_c55_params_write_config(struct mali_c55 *mali_c55)
> > > +{
> > > +	struct mali_c55_params *params = &mali_c55->params;
> > > +	struct v4l2_params_buffer *config;
> > > +	struct mali_c55_params_buf *buf;
> > > +	size_t block_offset = 0;
> > > +	size_t max_offset;
> > > +
> > > +	spin_lock(&params->buffers.lock);
> > > +
> > > +	buf = list_first_entry_or_null(&params->buffers.queue,
> > > +				       struct mali_c55_params_buf, queue);
> > > +	if (buf)
> > > +		list_del(&buf->queue);
> > > +	spin_unlock(&params->buffers.lock);
> > > +
> > > +	if (!buf)
> > > +		return;
> > > +
> > > +	buf->vb.sequence = mali_c55->isp.frame_sequence;
> > > +	config = buf->config;
> > > +
> > > +	max_offset = config->data_size - sizeof(struct v4l2_params_block_header);
> > > +
> > > +	/*
> > > +	 * Walk the list of parameter blocks and process them. No validation is
> > > +	 * done here, as the contents of the config buffer are already checked
> > > +	 * when the buffer is queued.
> > > +	 */
> > > +	while (block_offset < max_offset) {
> > > +		const struct v4l2_params_handler *block_handler;
> > > +		union mali_c55_params_block block;
> > > +
> > > +		block.data = &config->data[block_offset];
> > > +
> > > +		/* We checked the array index already in .buf_queue() */
> > Not a lot seems to be done there in terms of validation.
> > 
> > Even if that had been done, you can't trust the buffer contents as it
> > remains mapped to the userspace.
> 
> Ah; a hangover of an earlier iteration before using the new v4l2-params
> helpers; the validation is done by those functions in .buf_prepare() now and
> the userspace buffer is memcopied to a scratch buffer.

Ack, I'll take a look at Jacopo's set and get back to this. It looks nice
overall.

-- 
Kind regards,

Sakari Ailus

