Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E9DCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/7KnSoEHO6Q+y10Pw4nJ0Fx1mX0Xj32P5DNhE4ALAw=; b=gmYcaHugkVa+pXSOZ3ps/mahJN
	3Rzgr7PS+LqIGYHfXGvP3UladNecBu134ftD+53Rc+lTA/8J0IMIVcPL4lMWvHGcG6XiM2CQl+CT5
	9ZfPopbjwwrHWkCFfE5GpUz9hML0gdmod3nq9ewRhlhQxf3WS0bustTU03yfcCPneEEVhR3zHuwdC
	4qKUDLGruAkuc3D4pcXwxH21eIf95w2mkh3j6vD4pW9yMQf8GSTLzTmXxbzC7Zgqlr2bACv7dCsCI
	51PPKNHAtv8lNU35503fdpqpRuoUqewxpVbCzODftpPPLtTmTnAloSStDSEow03jvE1BGoGcTkGZp
	vJRKx1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24hg-0000000HXXL-0fcp;
	Fri, 26 Sep 2025 09:25:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24hc-0000000HXU5-1caB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:25:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62fa99bcfcdso3820039a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 02:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758878718; x=1759483518; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k/7KnSoEHO6Q+y10Pw4nJ0Fx1mX0Xj32P5DNhE4ALAw=;
        b=t9Ds2MeXxOD5HcOGv7cQgTnSTLEEPg9UtuB1r43Ww1rOPxCTp5DyXI877pix7k5arg
         N4PNMqu6l5Bse5zC1Qxpk4DT7l6cbpudZ6eLa1Etk4dZoj6zyxmz1pnr1PWhCeaClD2c
         1jVZF2AlRAXX9aATPs1JYM4oFFDSkSjgbugjPlk0lbD07SrlwQslX4Xg3G44kXuQAGbL
         r+ukp9v1RcutgKS4ngYDox5s2Dv/ZyuEtaE/bnoaRgHjGWvQPceR548X3rV7t4algdwQ
         o6IaKh0k1QaRsayDdfGzzX4L4hW5n3CD5tabDwGYnXMkbM98vIJmG/b7XEpLUFexkhDj
         kg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878718; x=1759483518;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/7KnSoEHO6Q+y10Pw4nJ0Fx1mX0Xj32P5DNhE4ALAw=;
        b=dw9OwJNNX31pE63EUEGk00fQk0h/Fle7Z95uJqoRqIB35Fgq2/DBwooJGpwaq1Crgi
         9pPkKLmbmfz5J/w+2TdUq/MrC8o00dmJQrtLuLz0TASHFpW3BIRFLiNHBWpVCmLRihak
         H8rfxJx9zKcRBKH05Ooob/XOa3f1YREi5yw4NGGez+93GGOJ2BtbdF9eXOeRqOuc/uvK
         jJEDXkpDlB8tvJ1JEzhakG31wLkyaoKbyvt6sPnWL2ipQTInCQuwmplJnVcRj86xNiAP
         1+k8J7bl+PT2XsripYkldRz2m+xbtOh0IX61y8Toi8/O3txY0W/tVM9qsGtYQHqUJ3q+
         49pA==
X-Forwarded-Encrypted: i=1; AJvYcCW43rmHo20RhbcpabXrjJnlAbF9N40WYegwn7HMXIEwEYK2034/Kh2WZjRZR3vP1vH03dUGLrikGoegGrDRNL4A@lists.infradead.org
X-Gm-Message-State: AOJu0YzIO2mOkaTyMog2w9cKc2RdZAWQRMdFqOeBFUtuyZGhAYiXuu/z
	Y8BzUIKO6rU4UIWfcIJ5d9abdNG/A66cikzbug0XSCXo8MsemdoR+z5GfOgKz3SZCyc=
X-Gm-Gg: ASbGncsbId5xRUpTUV/iKlTt4qpaTVv7W+ifDy8tVFlrE5BE4YEZz64Z2ScFyiapBTR
	mR0o5JKPPqm+JPVAuEGtLWm5FSmRPCeBk6RRw/IjYjRAN1P30yOMTDZVg9whZ8ZwaaMlv7G4WPP
	4fwNhsRoW6QuEJqRn/osL3EveO8uiL2191dNzffTrIrKIrdyaycZ/ry4DqZ2aEzjj9aU9KSLkTg
	s0wC5NL44ch6VlMdxZzOxizv0CoK0LqzZyBqNzNdiwUQBAsGDts+hjJ2WsujtVPaMk4Ry0C2H3/
	IJApOCQy5uJOsAHfnRZ+8Kmc/6/StJZU2hAFI2AXUdF+ZBS9CZTXBXcN4/O+osgktZLMj6wUFjs
	yD0IeKZZRlo/s/js/aNFgJvZcILfFKWGFEYJe
X-Google-Smtp-Source: AGHT+IEJQrKUnSzYQN5L/Z3qQi8ycCnSGseY5gC0pPJuGx7RQ4p3T8BSAU1abLUUr8cnY3qJZ6eTXw==
X-Received: by 2002:a17:907:9451:b0:b2d:a098:ad01 with SMTP id a640c23a62f3a-b34bbebe257mr719981766b.51.1758878718079;
        Fri, 26 Sep 2025 02:25:18 -0700 (PDT)
Received: from localhost ([195.52.63.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-634a364fd05sm2553079a12.13.2025.09.26.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 02:25:16 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=49a9f11264181de2036887cb7d9491dd520f43cb0d8ef1d42acfc07ce21a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 26 Sep 2025 11:24:56 +0200
Message-Id: <DD2MGMEFW5NT.1L6C0O4J23ZE5@baylibre.com>
Cc: "Nishanth Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Santosh Shilimkar" <ssantosh@kernel.org>, "Vishal Mahaveer"
 <vishalm@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Dhruva Gole"
 <d-gole@ti.com>, "Sebin Francis" <sebin.francis@ti.com>, "Akashdeep Kaur"
 <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] firmware: ti_sci: Partial-IO support
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Kendall Willis" <k-willis@ti.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com> <20250812-topic-am62-partialio-v6-12-b4-v7-2-ac10865c2d87@baylibre.com> <20250923174904.s6jqj35uizclpsxd@uda0506412>
In-Reply-To: <20250923174904.s6jqj35uizclpsxd@uda0506412>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_022520_696836_482052C5 
X-CRM114-Status: GOOD (  33.78  )
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

--49a9f11264181de2036887cb7d9491dd520f43cb0d8ef1d42acfc07ce21a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Kendall,

On Tue Sep 23, 2025 at 7:49 PM CEST, Kendall Willis wrote:
> Hi Markus,
>
> On 11:19-20250812, Markus Schneider-Pargmann wrote:
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
>>   https://www.ti.com/lit/pdf/spruiv7
>>=20
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> ---
>>  drivers/firmware/ti_sci.c | 131 +++++++++++++++++++++++++++++++++++++++=
++++++-
>>  drivers/firmware/ti_sci.h |   5 ++
>>  2 files changed, 135 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index c187fb714b3a4c658d0593c844716d4b160e4fa9..fb6f3d7f7413917cf9534ba6=
5f0a9786d1183c71 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -3750,6 +3750,116 @@ static const struct dev_pm_ops ti_sci_pm_ops =3D=
 {
>>  #endif
>>  };
>> =20
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
>> +	req->ctx_lo =3D 0;
>> +	req->ctx_hi =3D 0;
>> +	req->debug_flags =3D 0;
>> +
>> +	dev_info(dev, "Entering Partial-IO because a powered wakeup-enabled de=
vice was found.\n");
>> +
>
> IMO this print should be in the ti_sci_sys_off_handler since that is
> where the check is to find the wakeup-enabled device.
>
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
>
> Just something to think about: another way to implement this function
> would be to change ti_sci_cmd_prepare_sleep to add a parameter of flags
> for ti_sci_get_one_xfer in order to be able to choose if the
> TI_SCI_FLAG_REQ_GENERIC_NORESPONSE or TI_SCI_FLAG_REQ_ACK_ON_PROCESSED
> is used. This would make it so there's not duplicated code and
> ti_sci_cmd_prepare_sleep could be used to enter partial IO.

Thanks for the suggestion, I just tried your approach and I personally
prefer the code as it is. I needed two additional ifs to switch to a
different rx_message_size and handle or not handle a response. In the
end there is not much common code left. Also the pattern is quite common
between many of the functions doing transfers.

Thanks for your review, I fixed the rest.

Best
Markus

--49a9f11264181de2036887cb7d9491dd520f43cb0d8ef1d42acfc07ce21a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaNZb6BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlN7
9gD+MBLHhYe5W5TwXxMM41fCqweBpTb+287RKDd7uveEnkoBANYk3/Jp+jqTvqmL
4kBV9d8V0PxSPIA9hkCuwvPCoo4I
=GyNH
-----END PGP SIGNATURE-----

--49a9f11264181de2036887cb7d9491dd520f43cb0d8ef1d42acfc07ce21a--

