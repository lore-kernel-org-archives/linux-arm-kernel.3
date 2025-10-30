Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4421CCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asHTuwHQMlsaIwxd7fRvxE9E6RLII85FGsjE8sF6u2s=; b=HIYZotWTPpRWsaim25KEmo2LMo
	QRS1Syb+DAt4DIOCaCB8dMxUqmV/SPUgUweh9xbs5o6UEHCwlMNRim+Rbl9YYud4NNu80L5i136ZZ
	WL3bZGgr8lgs7ZpMDrFF1SDfQ4/wSp3+GUOWeLk9Jvcuxe8xptjlkNG3WMwO+IRxxd9FSKYXuAH+2
	Aa7YDbPb+JNSx3U7VRZSzFHKkH3oDgq0J5AzmbvCODgozwoKZEIR9LNu88VI/IstmX+H5xQX9Rjuj
	YaNQ02bKDEblSy7NPf2v4jiV2DCEO1XK39Spuert6KfDWMg5zU+QHvfAItpAF0WVuCH+BKuYy1Y2t
	neg96TrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVyR-00000004VKd-3vlM;
	Thu, 30 Oct 2025 16:58:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVyO-00000004VJT-1B9y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 16:58:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4283be7df63so668935f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761843482; x=1762448282; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=asHTuwHQMlsaIwxd7fRvxE9E6RLII85FGsjE8sF6u2s=;
        b=vm5XvT9xQ3HzbfuQebNvuhNQ/4kI4qMITwM3/wACW3UOu+3Kkz0JObvsd9jWN+PNo4
         DRMbk286g9B/7ZMk0+5sw5ZlupB4CrX1k6DvOeGRXWJBshLAgG+6jH2bJu1pU2Ywzwf5
         4+mwfXgJnQ+49V0RdRBhrJA83YtAUjFq1tVabjhLwAFinpziRwYGcU4EP6C55PbDCWtX
         Rtd1WGrTBNi1De7w82xkwKe6hVHbqw5rJCKOhfB1pAYxrFd52VU8kiXe8fh+x5C8sT4T
         PSY4s+03PDmhgzkbPGy/1xXw4cY+jKo/CxoOv36vFXgReXZL128TdXzJiV/Et9f8aBEe
         krgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843482; x=1762448282;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asHTuwHQMlsaIwxd7fRvxE9E6RLII85FGsjE8sF6u2s=;
        b=rNdZaPRjXHLQqyAKElo8clF44Uuj+ESLjDoWX8glComlc2UToutasztF311GKKwybX
         hl1vXUw9rjPsayzqrbUXDw4KYKB7wRtQNioM8Ed0BfdGg23NDNBgd/7MFRfl8yf0EjTO
         /qDrvU+m+68hkHnSS70jQRoaF7IOsbXQ5lKJkPdkfs6qdqO3Bb+yvMt4DgRIxn08HfVU
         G5di/F9e8a+v9+8vTnPo9IUO+6WJ3w9PK7bsXbmjjfwhLMPNZP/spQOqdGw8hH36v7ZF
         XpSvMSD2FBzbGx3kGjP+hI7vEc3KT2ge/n3NhfZDCUb4AHLv6nQddAcFp7bYRJC9/m45
         2O6w==
X-Forwarded-Encrypted: i=1; AJvYcCVcaiGrO035lg/H1DeNU00UgpvHjRtehr3FoQuOBC/92i1hK8HyaVhvSCds+RfKtQVNzvKMhW8ZWXWbiahoXhVD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/Zr/OERhwgiloj/02zpRJ3Sk8zU/keY7iu5w/iX5Z5gjcPDK
	CWvxevRB6qQwqRyS84R6Q+uIegKAyzhOR6HqdvC9OfTMyT8quYwB5TKOfH1SZjSx4M0=
X-Gm-Gg: ASbGnctQE6CvUkC1czTwTRAldTQ+HP6SE2Q5s/86wl9tW7i0iguuemuuLjm/GXWu7Uy
	3M1TdoRv4G4nEPepQFD8pYCpylDRWgt3x7I8Jwh2n8nlX1VcGnHW1qJHeIz86AczK38PYdGurRK
	qaN47wUz/1+OPAe01VYXTIGdKJbQUEhLrzb93l51bc0+ObT3RZ5z+0esostEMx7144Gqs7Bukye
	qCy8F2L0nAV6dYl5dVuSEICJ1+QQdl86QYdmWkJNp+zUaqcusiqHdpUV3F/n7VfKz92YSzjOMTE
	0N6C8oyi2FZYjBuvQ4zC1YIrTZvgqWq8Xigsrjk/SAOTuR6bamj8yeyXPTbQCt8XEsFP680AeY+
	1/mtJInpDO7GLGEqCenN+htyZtQkWwEVZhPJlyWXGsNVrt2RjdUWTW7HFzTzsqWn9aP6a9cOX4i
	PN1Ko=
X-Google-Smtp-Source: AGHT+IFqi7Xpp7w622mR0rNuKijgJ6z8TIArkNB6daVO26Go88Si98M7vPyCpKED2icvujDHVbXEhw==
X-Received: by 2002:a05:6000:26c3:b0:427:690:1d84 with SMTP id ffacd0b85a97d-429bd69e14bmr268308f8f.32.1761843482254;
        Thu, 30 Oct 2025 09:58:02 -0700 (PDT)
Received: from localhost ([195.52.63.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm32814036f8f.43.2025.10.30.09.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 09:58:01 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=752930e6c5b8c7be54d7a69ae03bc5b16c5525c23708b9d108f2a94d97cf;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 30 Oct 2025 17:57:53 +0100
Message-Id: <DDVTDY4T9I21.2MG05Z8984M5T@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 1/3] firmware: ti_sci: Remove constant 0 function
 arguments
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Andrew Davis" <afd@ti.com>, "Markus Schneider-Pargmann (TI.com)"
 <msp@baylibre.com>, "Nishanth Menon" <nm@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Santosh Shilimkar" <ssantosh@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com> <20251030-topic-am62-partialio-v6-12-b4-v9-1-074f55d9c16b@baylibre.com> <1b3f183f-3923-4183-a237-861e4f886958@ti.com>
In-Reply-To: <1b3f183f-3923-4183-a237-861e4f886958@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_095805_388330_EECDF2D1 
X-CRM114-Status: GOOD (  21.04  )
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

--752930e6c5b8c7be54d7a69ae03bc5b16c5525c23708b9d108f2a94d97cf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andrew,

On Thu Oct 30, 2025 at 3:13 PM CET, Andrew Davis wrote:
> On 10/30/25 4:26 AM, Markus Schneider-Pargmann (TI.com) wrote:
>> ti_sci_cmd_prepare_sleep takes three arguments ctx_lo, ctx_hi and
>> debug_flags which are always 0 for the caller. Remove these arguments as
>> they are basically unused.
>>=20
>
> They might not be used today, but the TI-SCI command does support
> passing them, so why remove that ability from the wrapper function?

Thank you. I removed the arguments as I prefer something like

  return ti_sci_cmd_prepare_sleep(&info->handle,
                                  TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED);

over

  return ti_sci_cmd_prepare_sleep(&info->handle,
                                  TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
                                  0, 0, 0);

As this function is not part of any API and only used by
ti_sci_prepare_system_suspend I didn't see a problem in removing it.
Also I don't know of any code that will be using these arguments.

If you prefer I can drop this patch.

Best
Markus

>
> Andrew
>
>> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
>> ---
>>   drivers/firmware/ti_sci.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 49fd2ae01055d0f425062147422471f0fd49e4bd..24ab392b4a5d0460153de76f=
e382371e319d8f2e 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -1661,14 +1661,10 @@ static int ti_sci_cmd_clk_get_freq(const struct =
ti_sci_handle *handle,
>>    * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
>>    * @handle:		pointer to TI SCI handle
>>    * @mode:		Device identifier
>> - * @ctx_lo:		Low part of address for context save
>> - * @ctx_hi:		High part of address for context save
>> - * @debug_flags:	Debug flags to pass to firmware
>>    *
>>    * Return: 0 if all went well, else returns appropriate error value.
>>    */
>> -static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle,=
 u8 mode,
>> -				    u32 ctx_lo, u32 ctx_hi, u32 debug_flags)
>> +static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle,=
 u8 mode)
>>   {
>>   	struct ti_sci_info *info;
>>   	struct ti_sci_msg_req_prepare_sleep *req;
>> @@ -1696,9 +1692,9 @@ static int ti_sci_cmd_prepare_sleep(const struct t=
i_sci_handle *handle, u8 mode,
>>  =20
>>   	req =3D (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
>>   	req->mode =3D mode;
>> -	req->ctx_lo =3D ctx_lo;
>> -	req->ctx_hi =3D ctx_hi;
>> -	req->debug_flags =3D debug_flags;
>> +	req->ctx_lo =3D 0;
>> +	req->ctx_hi =3D 0;
>> +	req->debug_flags =3D 0;
>>  =20
>>   	ret =3D ti_sci_do_xfer(info, xfer);
>>   	if (ret) {
>> @@ -3689,8 +3685,7 @@ static int ti_sci_prepare_system_suspend(struct ti=
_sci_info *info)
>>   			 * internal use and can be 0
>>   			 */
>>   			return ti_sci_cmd_prepare_sleep(&info->handle,
>> -							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
>> -							0, 0, 0);
>> +							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED);
>>   		} else {
>>   			/* DM Managed is not supported by the firmware. */
>>   			dev_err(info->dev, "Suspend to memory is not supported by the firmw=
are\n");
>>=20


--752930e6c5b8c7be54d7a69ae03bc5b16c5525c23708b9d108f2a94d97cf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQOZERsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOM
vgD/bew27FQMEeji6OeLZOJJgA8vPqrL/NU4DrIdV/zVC98A/iLGQiDwd2GnsjGV
gXIBqqIameTAi7bsnPw9wg9lVhcN
=fkwa
-----END PGP SIGNATURE-----

--752930e6c5b8c7be54d7a69ae03bc5b16c5525c23708b9d108f2a94d97cf--

