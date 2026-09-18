Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E947FC982E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBA0E8AODEBadx1kh06AjWaY/QYpRulbt0rkULl2OkQ=; b=uoQxR0hJuxmk+4Mgcyv4ytA6u3
	bT8NvdxDV7JSHZGL41gkSv7/adomNSsC76dIGBPFzdOEv+UPSkOUxZebjL+5lEwingok8ELW1+3cE
	qE/e9fYLW6Bu5ZXCKLnem2Fh8RMYoQgZjKR245oCZuMf7Id1FGrQ8IEoROEb+8mKnCBV3cr+ET3u3
	MBHEuMR5JFmL+qLL01NqJrt47ZtxUvGhUG0D4SbOxfvmj7HrsxbI67fMaKHkyFYR/fe1/VZWXojn0
	zRrTuW6dVZ/fi/5dac9arzsBMkAoB90CjW9H0AZv4qNdwNZST/vMBYp24cbqvM8Bz7XrAdy5JIC1s
	zn6BlDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YiJ-0000000EYDA-2gty;
	Fri, 18 Sep 2026 13:33:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YhH-0000000EXOg-01Xy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FB0F404BC;
	Fri, 18 Sep 2026 13:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2851F000FF;
	Fri, 18 Sep 2026 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738330;
	bh=SBA0E8AODEBadx1kh06AjWaY/QYpRulbt0rkULl2OkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgoKnDJTFyKqWWSymRW9iF2B8lN//StBJtI/lM5LftfwpC/oAuS2Fg0k/8O4JRcwf
	 Tl7mBtu4h+LQRuWG0cPoWRV1dBwXHLGe9mclufmEq3resy0LAp8ku49P2lG5/qU+9e
	 ydZZbffbURfmQDXNwMq0V4Po/IbbKyQUdkGQBwmX7YWlrVsKOoIh8QXofE1j20kVxQ
	 PHx54Jc/GgLFS7u/pPAOhPkRtNTOFFSFIvRrcpilGtw/NeSRLgfZxxB5B91F+sdb54
	 VOw5poxNzPjxBrYZUU/iqcRsR5EqZii55rwBeRJr2ZsWYHJILgt1L+1x/ZGFD2RFe8
	 0wa6jemDP32qQ==
Date: Fri, 18 Sep 2026 14:32:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <20260918-impetuous-daring-barnacle-1ea4d0@sudeepholla>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
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

On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v7:
> - Rebase on top of v7.3-rc3
> 
> Changes in v4:
> - Drop unused driver_data member from struct scmi_device_id (Uwe)
> - Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
> - Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)
> 
> Changes in v3:
> - Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
>   headers")
> - Add '\n' to modalias_show() output, matching other subsystems' modalias
> 
> Changes in v2:
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
> ---
>  MAINTAINERS                       |  1 +
>  drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
>  include/linux/device-id/scmi.h    | 17 +++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  5 +++++
>  scripts/mod/file2alias.c          | 12 ++++++++++++
>  6 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 include/linux/device-id/scmi.h
> 

[...]

> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..1b4ccfa9dcc5
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */

You need to include this above file in include/linux/mod_devicetable.h
to avoid duplication of its inclusion elsewhere. That's the pattern followed
I see.

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..ba53302d95f5 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
>  
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>  
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index b4178c42d08f..91ec3704ee2b 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define COMPILE_OFFSETS
> +#include <linux/device-id/scmi.h>

Drop this for above mentioned reason.

>  #include <linux/kbuild.h>
>  #include <linux/mod_devicetable.h>
>  
> @@ -144,6 +145,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
>  
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
>  
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..5379b1def07b 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -121,6 +121,7 @@ typedef struct {
>  /* Big exception to the "don't include kernel headers into userspace, which
>   * even potentially has different endianness and word sizes, since
>   * we handle those differences explicitly below */
> +#include "../../include/linux/device-id/scmi.h"

Drop this for above mentioned reason.

-- 
Regards,
Sudeep

