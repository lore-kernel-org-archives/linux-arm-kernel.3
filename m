Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686A0C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=; b=xShWs59FjgzPqlLWP38mSurfIU
	umVY4uWDb4tk1l62j9dvggrcnwr6/xboA5o76qdG7Tv9D4ppWI3wc3FaGh9Vi9rt2BfhpgZhEqEW8
	Ey6U30y7jPYi5/guUGnQevajH4D9BYekG4yB5dBiRfF6nfdaSeZyQQrGgcqg0jcKVk/QqHLvzaNFg
	/QsIvVLKn+yZra0Qc1UPBnFHb7Rb21iZyHRvBiJYDtzhpoEvfZwmvcHgBOW90UW//ylGjZR4a1zT4
	I8ngxkrSQJjQx8z4zaRoth3T1rvl+zAIxOJJKyLnz7EU7F7dc+DsPn7YCsanOC65l2P3RnDLegjID
	DUPiar6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fo8-00000002aWv-3tbv;
	Mon, 21 Sep 2026 15:19:52 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fo6-00000002aWF-0oa2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:19:51 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso2608637f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790003987; x=1790608787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=bu5y3mvF0ieimWTxGAcBhbc/9GNkbXRX6p54xmHrsaqVvur3ZsmfkEvF0J9wbQTNaW
         C+QukFANyTF7dBS8DdW+gLG5dL3dU0u3UXKGrRPkdoaTPmfPUPu8hA5k2hLNULgF9Igw
         rqQgn4d9qj11jSs0d5dj5wwodXf58TkKTYs2g87KW8BzkgbFTVeeA4uNfzRtIuW3C6Yl
         DX39uLmQLpCPVN2uYIokEjzWSC5qu2Ig/PhCIIFVddUTE5TaXxZVtFqMnZvCO9HtOi8X
         yN5LSm136XhCQLj5XU0q0tLYqbkLbbMleL9gB25THFA1nva4W4pZApjQ5YqB4GA2R2Nk
         FZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003987; x=1790608787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV/yPDzhsjcBqB0No8n/B1gnDkpysOLtRQGRvwg7ZOw=;
        b=l5U3rTNsqU+KO9FhLtMXfThZmeEujqRXRgxuti0sn3juSpjiMRSzjmnuPcCO7BVVYR
         F4W5cOAzc83t95CMu3ml0ZVvJY3kddLUZwKKKodX7vZEIekV/pQ4A4IinEpVVLq7NwQV
         sYzhm60uD5imugzTFhk9KDLmVlKl/IAIX/0azg2aiquStXUkb7fXcKMHtf3O63UL1c3q
         D+MOp7Lb8msgcpe9HpXX8fNgsgKC0/v8MM4/UGrI685MeCq3Vlc7PGrXAt82yacUPowz
         w16Q9JAJE+Yskdqko7BXZYoEIOtRsR+ZIpkqQM7ru7NTVBaRDQK7O9D7kDoeQNpe14vH
         l6Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwvcqsIdqV7MZm7TNWXspoDG+9LMnxRWvZqyrsryzqqArG1w95jMaLm7jo2A5raB9W0SNW63aPX8GpVZIOeUpFZ@lists.infradead.org
X-Gm-Message-State: AFuF++mcuTuWfBxrcVud4DnwzQoWJyDcdPqebZEDFHGldbrfNKmGuOhF
	53MiNDgboxEPppETiptMxlNF9+HrV5RyJ7oVXeIUgqVKYrKkfhrzwY8sm04lm8ZjEqo=
X-Gm-Gg: AYBFou08LDCWUe2uDlsChPT976bDcuyXuQCgFIlDt9v7JZFPbl36i0Cl5zmzjxP0Lm7
	4B7FkcVJ33HSDH04tVO999rT3y7ZrOZSyT1wO1kGrbwhfC6PUaLktIwkJ15WFb2rHzyyCuBsGhM
	mAbiptUcPu2C6UcSH0Mk3QFNJQtBNhfKbZJmKgT4cnolU+b6rsCfjJTz0Q58hpop59rh8uPt64I
	y+KDY1s4NrS4N0jiFqOcAoIUXFZ1+PIoZCxNoSv+hGwQfvQR2lWkVbOviI6p0LjzAXG+EI4I5Jj
	tEwjlWf4gkA3ohqHSNGrMFRgb4F2jnDryO4uB5b9/1QZKgNyCAy5WdmE6fOrgoQfUaRJdJtORSY
	pavmBeuVoOjo8ytKPy4tQ+Owu9L35HuZMIhIGIH9LQu7WsmqBaTV9DNHQhmdNAvylekX1oS2dOp
	S56QbTqvnPmqftjSFhcCmr9L4eByN7ksZpbVyf39DSBpzliR8zVe4aQMLwHI7xighN16hfdvpyP
	L552j7anX3vdR2+kWwlpdq1vMKGewDMoRWmJduF10+l/iqB21nxnmMknh7c0A==
X-Received: by 2002:a05:6000:420a:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-4871e244c95mr16766538f8f.12.1790003987507;
        Mon, 21 Sep 2026 08:19:47 -0700 (PDT)
Received: from localhost (p200300f65f19a904d4f76eed31f2ef79.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d4f7:6eed:31f2:ef79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48724591eaasm23509562f8f.26.2026.09.21.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:19:46 -0700 (PDT)
Date: Mon, 21 Sep 2026 17:19:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
Message-ID: <arFKVhlgJge5EZyj@monoceros>
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x3f53yyge7gbc6ag"
Content-Disposition: inline
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_081950_297865_048123ED 
X-CRM114-Status: GOOD (  37.76  )
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


--x3f53yyge7gbc6ag
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:29:50AM +0200, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>=20
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
>=20
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
>=20
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
>=20
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
> Changes in v7:
> - Rebase on top of v7.3-rc3
>=20
> Changes in v4:
> - Drop unused driver_data member from struct scmi_device_id (Uwe)
> - Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
> - Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)
>=20
> Changes in v3:
> - Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
>   headers")
> - Add '\n' to modalias_show() output, matching other subsystems' modalias
>=20
> Changes in v2:
> - Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
> - Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8d=
d52ab2@oss.qualcomm.com
> ---
>  MAINTAINERS                       |  1 +
>  drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
>  include/linux/device-id/scmi.h    | 17 +++++++++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  5 +++++
>  scripts/mod/file2alias.c          | 12 ++++++++++++
>  6 files changed, 46 insertions(+), 16 deletions(-)
>  create mode 100644 include/linux/device-id/scmi.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2414447892c..f351ec56a2ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26604,6 +26604,7 @@ F:	drivers/pmdomain/arm/
>  F:	drivers/powercap/arm_scmi_powercap.c
>  F:	drivers/regulator/scmi-regulator.c
>  F:	drivers/reset/reset-scmi.c
> +F:	include/linux/device-id/scmi.h
>  F:	include/linux/sc[mp]i_protocol.h
>  F:	include/trace/events/scmi.h
>  F:	include/uapi/linux/virtio_scmi.h
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/=
bus.c
> index e060edbe7e83..51de50fbc382 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -12,11 +12,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
> =20
>  #include "common.h"
> =20
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
> =20
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct =
scmi_device_id *id_table)
>  	const struct scmi_device_id *entry;
>  	int ret;
> =20
> -	for (entry =3D id_table; entry->name; entry++) {
> +	for (entry =3D id_table; entry->name[0]; entry++) {
>  		ret =3D scmi_protocol_device_request(entry);
>  		if (ret)
>  			goto err_unrequest;
> @@ -205,7 +206,7 @@ scmi_protocol_table_unregister(const struct scmi_devi=
ce_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
> =20
> -	for (entry =3D id_table; entry->name; entry++)
> +	for (entry =3D id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
> =20
> @@ -219,10 +220,10 @@ static int __scmi_dev_match_by_id_table(struct scmi=
_device *scmi_dev,
>  					const struct scmi_device_id *id_table,
>  					bool skip_transport)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
> =20
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id =3D=3D scmi_dev->protocol_id &&
>  		    !(skip_transport && scmi_device_is_transport(scmi_dev)) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -266,7 +267,7 @@ scmi_child_dev_find_get(struct device *parent, int pr=
ot_id, const char *name)
>  	struct device *dev;
> =20
>  	id_table[0].protocol_id =3D prot_id;
> -	id_table[0].name =3D name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
> =20
>  	dev =3D device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -300,8 +301,7 @@ static int scmi_device_uevent(const struct device *de=
v, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
>  	return add_uevent_var(env, "MODALIAS=3D" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
> =20
>  static ssize_t modalias_show(struct device *dev,
> @@ -309,9 +309,8 @@ static ssize_t modalias_show(struct device *dev,
>  {
>  	struct scmi_device *scmi_dev =3D to_scmi_dev(dev);
> =20
> -	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
> =20
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scm=
i.h
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

I wonder if you tried to keep this a char *. ISTR someone did something
similar recently and they claimed it worked. That would get rid of the
artificial name size limit and simplify this patch.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..ba53302d95f5 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_SCMI_PROTOCOL_H
> =20
>  #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
> =20
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
> =20
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-=
offsets.c
> index b4178c42d08f..91ec3704ee2b 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #define COMPILE_OFFSETS
> +#include <linux/device-id/scmi.h>
>  #include <linux/kbuild.h>
>  #include <linux/mod_devicetable.h>
> =20
> @@ -144,6 +145,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
> =20
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
> =20
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..5379b1def07b 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -121,6 +121,7 @@ typedef struct {
>  /* Big exception to the "don't include kernel headers into userspace, wh=
ich
>   * even potentially has different endianness and word sizes, since
>   * we handle those differences explicitly below */
> +#include "../../include/linux/device-id/scmi.h"
>  #include "../../include/linux/mod_devicetable.h"
> =20
>  struct devtable {
> @@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void =
*symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
> =20
> +/* Looks like: scmi:NN:S */
> +static void do_scmi_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, scmi_device_id, protocol_id);
> +	DEF_FIELD_ADDR(symval, scmi_device_id, name);
> +
> +	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
> +			    protocol_id, *name);
> +}
> +
>  /* Looks like: i2c:S */
>  static void do_i2c_entry(struct module *mod, void *symval)
>  {
> @@ -1491,6 +1502,7 @@ static const struct devtable devtable[] =3D {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},

I wonder if this is supposed to be ordered alphabetically ...

Best regards
Uwe

--x3f53yyge7gbc6ag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxSw8ACgkQj4D7WH0S
/k5lIQf+Pk0pBFCMv2UlNFoYrcnt7sDd37qCqzSchh+C4VDUQJUrS+U3++VDP+w9
qQ1uz0pIZ08N7xrsAvI2b21w1QjBsVGfuA2K79Q66sHHNPWk2x4jLyXebehylwj7
RqUjmFBRQ6OlpZtdOfcLG0mCopgIcOa+3LMWCkac4VENvzFOQ8aHkYLCM6F8Zr3T
QHSpbWMHoPvXSbjW2ZgFDgQZbr9fVvHMcCiX1ronBbv2mqBXRzAOrjcR0IS4fqjM
0Wt+9Tibbskx3/E7EaOFar9w+dVwvg89nGCWvz9ke6FgJhqfsM9UFyz0Vv7R1kbz
gnmskjzm0NxgGlfZSipyOdiObLtMnw==
=ZEo+
-----END PGP SIGNATURE-----

--x3f53yyge7gbc6ag--

