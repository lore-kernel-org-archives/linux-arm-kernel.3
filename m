Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mhspKlEs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPmoTco4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+FdbV1fygpkQa5AYOrs49bje7EWIBa53juEdskXuHwU=; b=mhspKlEs5Apxjj
	SU12Ibt+PV0B8TPdak29KZAfzMYqmOEboL5f8lQ7SVUgwgbWvh4TsEUk/usFeeuEOkFU8O/DvnT9S
	ZKq1y2JtaiQWCsC6bdM+pNUVFTonOqs1rvo7YOo3wuRfyiQcUWTokncpfqETOC1YbDmKpD6n/2sJY
	NZBjOvmqTj3na7rGV9axPFAzx6RILGwtZziXXwLAe9+XUbmkxFREcAeEVUOQEgf2VRjKJg9FegmO6
	0J30oP7g8Ru8ecK/gm7eCqsYU88bXjDr1SjY95Qxkoww3GkTYGymXjjYrAVdMgtHpHqEfrpwHEOeC
	Nel0Z3D8AH0JoOcClLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfMK-0000000FGg9-1C82;
	Sun, 01 Nov 2026 23:53:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNfMJ-0000000FGfi-37RV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:53:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA674601FF;
	Sun,  1 Nov 2026 23:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785891F000C1;
	Sun,  1 Nov 2026 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793577186;
	bh=+FdbV1fygpkQa5AYOrs49bje7EWIBa53juEdskXuHwU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WPmoTco4mk4LgWTTkVTV2hDqSITZ518aq3iHHoMFevxLyCh6xCDcBiL/ge82h347W
	 usFpr9+SgHiuFrYPzA6XxL9Sr21lWT6t+pIIyrBEHhoQgf4rA77XYoGLv7ayfLfcHu
	 9+fYC6kndRxa/UBm2istlaUjrOWIUfoNquMq9dielufemC0GeaOlTIoW5sI1Y1HUL2
	 gyNY02y5mYc5lrC7NgOHZ1zIOPVroOYr3tJzb8KdjD5o9E/u/46UzkwJlk+vM/YdlL
	 41lO4lNPnyNJxW4LKExWDoswQYB7EGTxPzI852RaupVVBAqXqjkm46GBm+olVztdm2
	 6i8uL06R50hcA==
Date: Sun, 1 Nov 2026 23:52:59 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Conall O'Griofa
 <conall.ogriofa@amd.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses
 when parsing channels
Message-ID: <20261101235259.27b3b43c@jic23-hlaptop>
In-Reply-To: <20261023185652.195025-1-kapoorarnav43@gmail.com>
References: <20261023185652.195025-1-kapoorarnav43@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 24 Oct 2026 00:26:48 +0530
Arnav Kapoor <kapoorarnav43@gmail.com> wrote:

> ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
> ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
> channel specs and lets ams_init_module() fill them for the AMS node and
> each of its children, without telling it how much room is left.
> 
> For the PL-SYSMON node, ams_get_ext_chan() appends one channel per
> "channel@N" child after the 10 fixed PL channels. The binding allows
> reg values 20..50, so a PL node can have up to 31 such children, i.e.
> up to 41 PL channels, while only 31 are budgeted for it. Together with
> the 13 PS and 7 AMS control channels, this writes past the end of the
> buffer. Since the modules are filled in device tree order, the fixed
> channel blocks copied after the PL node can overflow as well.
> 
> ams_get_ext_chan() also only checks the upper bound of reg. ext_chan is
> unsigned, so a reg below 20 makes it wrap and ams_pl_channels[] is read
> far out of bounds.
> 
> Pass the remaining capacity down to ams_init_module() and
> ams_get_ext_chan() and fail with -ENOSPC when a module does not fit,
> instead of writing past the buffer. Also reject reg values below 20, as
> the binding requires.
> 
> Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
AMD Xilinx folk, please take a look at this one.

Thanks,

Jonathan

> ---
> Changes in v2:
> - Fix the truncated subject line (Andy)
> - Drop the paragraph about an earlier report, I could not find that
>   thread again to reference it properly
> - Pass the remaining capacity as unsigned int and drop the casts (Andy)
> - Keep the ams_get_ext_chan() call on one line (Andy)
> - Rebase on fixes-togreg
> - Drop the bouncing @xilinx.com and @huawei.com addresses from Cc
> 
> v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/
> 
> Compile-tested only (W=1); I don't have ZynqMP hardware.
> 
>  drivers/iio/adc/xilinx-ams.c | 54 ++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
> index 158e6133abf5..7f0f7778d6aa 100644
> --- a/drivers/iio/adc/xilinx-ams.c
> +++ b/drivers/iio/adc/xilinx-ams.c
> @@ -144,7 +144,14 @@
>  #define AMS_PL_CSTS_ACCESS_MASK		BIT(1)
>  
>  #define AMS_PL_MAX_FIXED_CHANNEL	10
> -#define AMS_PL_MAX_EXT_CHANNEL		20
> +/*
> + * The external PL channels are addressed by their channel number. The
> + * binding allows the range from AMS_PL_EXT_CHANNEL_MIN to
> + * AMS_PL_EXT_CHANNEL_MAX. AMS_PL_EXT_CHANNEL_MIN maps onto the first
> + * ams_pl_channels[] entry, AMS_PL_EXT_CHANNEL_MAX onto the last one.
> + */
> +#define AMS_PL_EXT_CHANNEL_MIN		20
> +#define AMS_PL_EXT_CHANNEL_MAX		50
>  
>  #define AMS_INIT_POLL_TIME_US		200
>  #define AMS_INIT_TIMEOUT_US		10000
> @@ -1142,20 +1149,31 @@ static const struct iio_chan_spec ams_ctrl_channels[] = {
>  };
>  
>  static int ams_get_ext_chan(struct fwnode_handle *chan_node,
> -			    struct iio_chan_spec *channels, int num_channels)
> +			    struct iio_chan_spec *channels, int num_channels,
> +			    unsigned int max_channels)
>  {
>  	struct iio_chan_spec *chan;
> -	struct fwnode_handle *child;
>  	unsigned int reg, ext_chan;
>  	int ret;
>  
> -	fwnode_for_each_child_node(chan_node, child) {
> +	fwnode_for_each_child_node_scoped(chan_node, child) {
>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg > AMS_PL_MAX_EXT_CHANNEL + 30)
> +		if (ret)
> +			continue;
> +
> +		/*
> +		 * Anything outside of the range of channel numbers allowed
> +		 * by the binding is not a valid channel.
> +		 */
> +		if (reg < AMS_PL_EXT_CHANNEL_MIN ||
> +		    reg > AMS_PL_EXT_CHANNEL_MAX)
>  			continue;
>  
> +		if (num_channels >= max_channels)
> +			return -ENOSPC;
> +
>  		chan = &channels[num_channels];
> -		ext_chan = reg + AMS_PL_MAX_FIXED_CHANNEL - 30;
> +		ext_chan = reg - AMS_PL_EXT_CHANNEL_MIN;
>  		memcpy(chan, &ams_pl_channels[ext_chan], sizeof(*channels));
>  
>  		if (fwnode_property_read_bool(child, "xlnx,bipolar"))
> @@ -1183,7 +1201,8 @@ static void ams_iounmap_pl(void *data)
>  
>  static int ams_init_module(struct iio_dev *indio_dev,
>  			   struct fwnode_handle *fwnode,
> -			   struct iio_chan_spec *channels)
> +			   struct iio_chan_spec *channels,
> +			   unsigned int max_channels)
>  {
>  	struct device *dev = indio_dev->dev.parent;
>  	struct ams *ams = iio_priv(indio_dev);
> @@ -1191,6 +1210,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
>  	int ret;
>  
>  	if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-ps")) {
> +		if (max_channels < ARRAY_SIZE(ams_ps_channels))
> +			return -ENOSPC;
> +
>  		ams->ps_base = fwnode_iomap(fwnode, 0);
>  		if (!ams->ps_base)
>  			return -ENXIO;
> @@ -1202,6 +1224,9 @@ static int ams_init_module(struct iio_dev *indio_dev,
>  		memcpy(channels, ams_ps_channels, sizeof(ams_ps_channels));
>  		num_channels = ARRAY_SIZE(ams_ps_channels);
>  	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams-pl")) {
> +		if (max_channels < AMS_PL_MAX_FIXED_CHANNEL)
> +			return -ENOSPC;
> +
>  		ams->pl_base = fwnode_iomap(fwnode, 0);
>  		if (!ams->pl_base)
>  			return -ENXIO;
> @@ -1213,9 +1238,14 @@ static int ams_init_module(struct iio_dev *indio_dev,
>  		/* Copy only first 10 fix channels */
>  		memcpy(channels, ams_pl_channels, AMS_PL_MAX_FIXED_CHANNEL * sizeof(*channels));
>  		num_channels += AMS_PL_MAX_FIXED_CHANNEL;
> -		num_channels = ams_get_ext_chan(fwnode, channels,
> -						num_channels);
> +		ret = ams_get_ext_chan(fwnode, channels, num_channels, max_channels);
> +		if (ret < 0)
> +			return ret;
> +		num_channels = ret;
>  	} else if (fwnode_device_is_compatible(fwnode, "xlnx,zynqmp-ams")) {
> +		if (max_channels < ARRAY_SIZE(ams_ctrl_channels))
> +			return -ENOSPC;
> +
>  		/* add AMS channels to iio device channels */
>  		memcpy(channels, ams_ctrl_channels, sizeof(ams_ctrl_channels));
>  		num_channels += ARRAY_SIZE(ams_ctrl_channels);
> @@ -1245,7 +1275,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
>  		return -ENOMEM;
>  
>  	if (fwnode_device_is_available(fwnode)) {
> -		ret = ams_init_module(indio_dev, fwnode, ams_channels);
> +		ret = ams_init_module(indio_dev, fwnode, ams_channels, ams_size);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -1253,7 +1283,9 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
>  	}
>  
>  	device_for_each_child_node_scoped(dev, child) {
> -		ret = ams_init_module(indio_dev, child, ams_channels + num_channels);
> +		ret = ams_init_module(indio_dev, child,
> +				      ams_channels + num_channels,
> +				      ams_size - num_channels);
>  		if (ret < 0)
>  			return ret;
>  
> 
> base-commit: 2ef6f5c4ee56e90c237c5f7687f09e635f7d30a9


