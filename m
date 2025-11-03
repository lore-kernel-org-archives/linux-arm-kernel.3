Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E0ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev+FutBx57/FNBFPUNtXOR1Qu8cLklW5P/s1yrMZQhc=; b=sB2VqPF3Wqg0D0n0xEEZtibmup
	hbkQojWHsKgbo84PJFyPFfAFF5FhxO6hK8WPqtC6x50ZP22vEhucqM28E4BsgTMPEKvGkJW0t8opb
	C1/FizzpXxFKUZSGgb5azNEXzb/tnbb1mDpDNEzBEwzjEMLuQ6uNryRFtmBfHkBKk2uD9k0LKeNXU
	8tv+t3F3OJSV7chkiyr+TtleevAImMw0NzOW3TDiXledKiw1GY9F+CuxwkB5rayY0JZDoWQoYaqWm
	frpLfPgkW1DvSNnvRCVHjYSo78/n2HZ6M3cp+O7xC8hHbJGLBLG5y7V+eCuB2mKtENtLwElviScb0
	fqmlS3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrqm-00000009dfq-0EiG;
	Mon, 03 Nov 2025 10:31:48 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrqi-00000009dfQ-27kG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:31:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b6d2f5c0e8eso861121466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762165902; x=1762770702; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev+FutBx57/FNBFPUNtXOR1Qu8cLklW5P/s1yrMZQhc=;
        b=Y704hRg3aLzUaN4hVqOAKeE6UQDwaVzDxSs7ukC4U9/NnAi6943RlS1IT7jpyxKf+w
         R9k15MqIik69/HN4iJl4Eomc4/wPy72LybvC3RJfbFbedTNftgiGK62N4E63JUQjOfpp
         vXaP9t/WJaWQiPbfmxyPa5Ir3IxH418EMA7OzZwAjnMDdPAPJErxUz+kIQN3qBGD3pSi
         hCJyoEzjP/QQ+JgGmSp9XWbWe4b5eaPLx2f5uJ2B/8bTOIAyl4YPgg6MUDAcmKVFAqqb
         khQ5ELXe015N9vtYSB/IrT7SAIkUNOV4+1GENHmuQBpYKKkDQAE9B0GWIW3WipjxmPNN
         K4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165902; x=1762770702;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ev+FutBx57/FNBFPUNtXOR1Qu8cLklW5P/s1yrMZQhc=;
        b=YSExy286OFnYocqW3emM8iLoE2rvK4rMrQTJNnp9itAIwuUnWNopOmSeL6ohNfC5uV
         lavu29V047LpFHaME+14y2zZCfj/0CMak9x5x66tC0bN02bbZgdYXMWW0T2XNEKczMB5
         pMpfdLdcyUGVhEP1ihnZG6UaOyQp5jGVJQy3Qi65qa9afDqRI7eLaDQO75vNwD8+cXef
         VFpTXPqvutPSsDiL+tw1OEXtLlhqr5kZtEz/6GXl5+VtHS1bEP66QCIjvsyR6co402jh
         z5khgi9uKr6Pcff8OF7zNbEszKt4nJa5RIWyDt/qjzKVjtcMzhw12diZfcIqo7v9OZEo
         Y3HA==
X-Forwarded-Encrypted: i=1; AJvYcCXoyH5t1MS/rsQQ1K/i5al1eJ97HdRsjhppjOVkiMMrw/r4tI4CbyarzmppodVJyptIfM2UfFSbKi1LbBKLGvVM@lists.infradead.org
X-Gm-Message-State: AOJu0YxmhITnWVMD0FdrxeX6sLUwhS0lfFCl4x9+FINyE2G4Bo9KzVlZ
	Hs+VOyGiI44eS2DXH1L5ufG7Deiu4gLh19CeXIROxVbaSyVvuQdhZUquAHsoXcP9bU0=
X-Gm-Gg: ASbGnctH4NfAbxkIWjATuHk/0cDd/vlhQIszbguoARCNVwlsoNkWQuFVDONSITTdRaj
	y/d4AIJxv9JsO6vifYKe22fZhw+evL4jPZHdafIFgCih5CdfpU6f2UfbWpygODW8xL7uxfVXtOq
	F6hrwFF990zG3c+ap6j6/kuGdSArXsX11PrsMzAjNiispFuzNulwFphYG40XUHGn5OfVgVEQyol
	jKNe98ZbHoCpO6GzJEnQLITUAW2617vWcyQgBgSwOLcRJhtS8w9ayFX4DqNd9PXRSQVeU37y3ci
	uKI53BXxcL2LuRHxKyhZr2UJmzbQ3zxkAxsESzqTHCpiQNyDA0PIiMoMC9bbsed/7xZgBUK+hiV
	l14r33eHHzrGrxUghks1Hvn6IZnKmsf20S3CxgE5M+1qHuAJZ5ZD3JEftPNUrHhFhnWWR
X-Google-Smtp-Source: AGHT+IE11zTQ7CCDiBUde1gGw8+g3Hsu0UVIKx9O4gSlkL+kMqtUKG4Migng/Rjq4y9baGdVTMcXrg==
X-Received: by 2002:a17:907:3c8d:b0:b30:ead5:56d0 with SMTP id a640c23a62f3a-b707087a3f3mr1190934066b.61.1762165902387;
        Mon, 03 Nov 2025 02:31:42 -0800 (PST)
Received: from localhost ([62.246.251.40])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b438afasm9367567a12.30.2025.11.03.02.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:31:41 -0800 (PST)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d3b267eaf3d3b01695c425cab7bcb0fa2d52bdf1620d5ecf21626e95c9b6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 03 Nov 2025 11:31:35 +0100
Message-Id: <DDYZOCXFX1J2.30UFCSI059R9V@baylibre.com>
Subject: Re: [PATCH v9 3/3] firmware: ti_sci: Partial-IO support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Andrew Davis" <afd@ti.com>, "Markus Schneider-Pargmann (TI.com)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Santosh Shilimkar" <ssantosh@kernel.org>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com> <20251030-topic-am62-partialio-v6-12-b4-v9-3-074f55d9c16b@baylibre.com> <d3209c85-dc30-4f9a-8ea5-3c3e19330afd@ti.com>
In-Reply-To: <d3209c85-dc30-4f9a-8ea5-3c3e19330afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_023144_851430_9EE7F98F 
X-CRM114-Status: GOOD (  35.35  )
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

--d3b267eaf3d3b01695c425cab7bcb0fa2d52bdf1620d5ecf21626e95c9b6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Oct 30, 2025 at 3:24 PM CET, Andrew Davis wrote:
> On 10/30/25 4:26 AM, Markus Schneider-Pargmann (TI.com) wrote:
>> Add support for Partial-IO poweroff. In Partial-IO pins of a few
>> hardware units can generate system wakeups while DDR memory is not
>> powered resulting in a fresh boot of the system. These hardware units in
>> the SoC are always powered so that some logic can detect pin activity.
>>=20
>> If the system supports Partial-IO as described in the fw capabilities, a
>> sys_off handler is added. This sys_off handler decides if the poweroff
>> is executed by entering normal poweroff or Partial-IO instead. The
>> decision is made by checking if wakeup is enabled on all devices that
>> may wake up the SoC from Partial-IO.
>>=20
>> The possible wakeup devices are found by checking which devices
>> reference a "Partial-IO" system state in the list of wakeup-source
>> system states. Only devices that are actually enabled by the user will
>> be considered as an active wakeup source. If none of the wakeup sources
>> is enabled the system will do a normal poweroff. If at least one wakeup
>> source is enabled it will instead send a TI_SCI_MSG_PREPARE_SLEEP
>> message from the sys_off handler. Sending this message will result in an
>> immediate shutdown of the system. No execution is expected after this
>> point. The code will wait for 5s and do an emergency_restart afterwards
>> if Partial-IO wasn't entered at that point.
>>=20
>> A short documentation about Partial-IO can be found in section 6.2.4.5
>> of the TRM at
>>    https://www.ti.com/lit/pdf/spruiv7
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
>> ---
>>   drivers/firmware/ti_sci.c | 132 ++++++++++++++++++++++++++++++++++++++=
+++++++-
>>   drivers/firmware/ti_sci.h |   5 ++
>>   2 files changed, 136 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 4db84a92a517b0aa7bb8d47e809d9848a16e2cc4..f2922fccfbe748a436cb9aa0=
a8c8e5f48db02ef9 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -6,6 +6,7 @@
>>    *	Nishanth Menon
>>    */
>>  =20
>> +#include "linux/dev_printk.h"
>>   #define pr_fmt(fmt) "%s: " fmt, __func__
>>  =20
>>   #include <linux/bitmap.h>
>> @@ -3663,6 +3664,116 @@ devm_ti_sci_get_resource(const struct ti_sci_han=
dle *handle, struct device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
>>  =20
>> +/*
>> + * Enter Partial-IO, which disables everything including DDR with only =
a small
>> + * logic being active for wakeup.
>> + */
>> +static int ti_sci_enter_partial_io(struct ti_sci_info *info)
>> +{
>> +	struct ti_sci_msg_req_prepare_sleep *req;
>> +	struct ti_sci_xfer *xfer;
>> +	struct device *dev =3D info->dev;
>> +	int ret =3D 0;
>> +
>> +	xfer =3D ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
>> +				   TI_SCI_FLAG_REQ_GENERIC_NORESPONSE,
>> +				   sizeof(*req), sizeof(struct ti_sci_msg_hdr));
>> +	if (IS_ERR(xfer)) {
>> +		ret =3D PTR_ERR(xfer);
>> +		dev_err(dev, "Message alloc failed(%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	req =3D (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
>> +	req->mode =3D TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO;
>
> This whole function is almost identical to ti_sci_cmd_prepare_sleep() oth=
er
> than you use a different mode here, which this different mode can be pass=
ed
> into ti_sci_cmd_prepare_sleep() just the same. Only other difference woul=
d
> be the NORESPONSE flag which you could just check "mode" passed in and
> use the right flag for the mode.

I thought this to be nicer as it avoided ifs, but as Kendall and you
both requested this, I changed it for the next version.

>
>> +	req->ctx_lo =3D 0;
>> +	req->ctx_hi =3D 0;
>> +	req->debug_flags =3D 0;
>> +
>> +	ret =3D ti_sci_do_xfer(info, xfer);
>> +	if (ret) {
>> +		dev_err(dev, "Mbox send fail %d\n", ret);
>> +		goto fail;
>> +	}
>> +
>> +fail:
>> +	ti_sci_put_one_xfer(&info->minfo, xfer);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Iterate all device nodes that have a wakeup-source property and chec=
k if one
>> + * of the possible phandles points to a Partial-IO system state. If it
>> + * does resolve the device node to an actual device and check if wakeup=
 is
>> + * enabled.
>> + */
>> +static bool ti_sci_partial_io_wakeup_enabled(struct ti_sci_info *info)
>> +{
>> +	struct device_node *wakeup_node =3D NULL;
>> +
>> +	for_each_node_with_property(wakeup_node, "wakeup-source") {
>> +		struct of_phandle_iterator it;
>> +		int err;
>> +
>> +		of_for_each_phandle(&it, err, wakeup_node, "wakeup-source", NULL, 0) =
{
>> +			struct platform_device *pdev;
>> +			bool may_wakeup;
>> +
>> +			/*
>> +			 * Continue if idle-state-name is not off-wake. Return
>> +			 * value is the index of the string which should be 0 if
>> +			 * off-wake is present.
>> +			 */
>> +			if (of_property_match_string(it.node, "idle-state-name", "off-wake")=
)
>> +				continue;
>> +
>> +			pdev =3D of_find_device_by_node(wakeup_node);
>> +			if (!pdev)
>> +				continue;
>> +
>> +			may_wakeup =3D device_may_wakeup(&pdev->dev);
>> +			put_device(&pdev->dev);
>> +
>> +			if (may_wakeup) {
>> +				dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO=
\n",
>> +					wakeup_node);
>> +				of_node_put(it.node);
>> +				of_node_put(wakeup_node);
>> +				return true;
>> +			}
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static int ti_sci_sys_off_handler(struct sys_off_data *data)
>> +{
>> +	struct ti_sci_info *info =3D data->cb_data;
>> +	bool enter_partial_io =3D ti_sci_partial_io_wakeup_enabled(info);
>> +	int ret;
>> +
>> +	if (!enter_partial_io)
>> +		return NOTIFY_DONE;
>> +
>> +	dev_info(info->dev, "Entering Partial-IO because a powered wakeup-enab=
led device was found.\n");
>> +
>> +	ret =3D ti_sci_enter_partial_io(info);
>> +
>
> No need for newline here.
>
>> +	if (ret) {
>> +		dev_err(info->dev,
>> +			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n=
",
>> +			ERR_PTR(ret));
>
> Why cast this int to a pointer before printing it out?

I am casting this to an error pointer to get the resolution of the error
value to a symbolic name with %pe. This will print 'EBUSY' etc.

Thanks!

Best
Markus

--d3b267eaf3d3b01695c425cab7bcb0fa2d52bdf1620d5ecf21626e95c9b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQiEhxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNB
ewEAzqNa+34X6+y+Ev+PL2U/s/P4kMziVU1jKpfSLWY12XQBANXHThqEN3gUgXRw
ba7ULqDxdztsMTeTll24hghNKqIA
=zC3u
-----END PGP SIGNATURE-----

--d3b267eaf3d3b01695c425cab7bcb0fa2d52bdf1620d5ecf21626e95c9b6--

