Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B439C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tS3/CGAByUQ4+I5LX/qP7QKpxIhInZkcD8IlTZBt+LU=; b=qHINIV8kry8cdM7UfGyQFb0YEK
	2DFZ63kB8g14i3UA2Wwl+dF7EVe/kvrrigkPl/L2g8bKVobPNGSB67VOadlAji66bQck7k2wrVGUx
	HbO+sIaeSKD4LdSMrVVH+AgfkvYqc9aVFoaReg69LCvQjeOVB8wo1UA7/oK6wLe2euDjcs9HIu7eq
	ckgnLBJnKdqoYsNwt4cC4X6Jp+4PEcBf02EuUg4JZZroREJGFEnKlkpjHgshwBxJrhqeksfUEK4DT
	DmqCfXFRW/O5/p3OWdhvfssXbNQsftROQehwf2LqkYgp9Esdq0pAlzKPemoBJzPAtI/GpBU/y2uxG
	BOidPq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfBY-00000002UUK-02EM;
	Mon, 23 Jun 2025 11:18:00 +0000
Received: from hours.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdYA-00000002BcP-0ncm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:33:16 +0000
Received: from localhost (unknown [10.0.8.3])
	by mail.tkos.co.il (Postfix) with ESMTP id D2125440242;
	Mon, 23 Jun 2025 12:31:55 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1750671115;
	bh=BwJm+0ENa935xRL7dXx302SmtpFL0P2DqD3scehu6WE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sLhqgFiZcJISa68ATcz9tShQKzw7d5hrONv1+tv9N0xSWbwfsYvidBFxdtdILjsGN
	 owCdjhmCYIRgaNs5D3SA1mylaf20D8gHGmUGorWAjOf5kttKzVBGPkyauEUlE2QJhO
	 YlL4REHjr0naMXgdoPGzEOsbmyZxkYCB3JYcWDhmEJyr+DFxuN6qNdtJqmt06zrFzK
	 RUg4UtNhrVhOtu5RSXmN27cIv0aKTDzaJXXnS9feEOR9K3Ksc1A68BSD6Iy0vJPs5k
	 dwIqxsyoqk2i8ZOfjB61OeuVhCXkIMd4H+Ro3M/6V1VAA02GSXxbZxm+dof55tNtRu
	 sQV10oFZB1Nyg==
From: Baruch Siach <baruch@tkos.co.il>
To: Steffen =?utf-8?Q?B=C3=A4tz?= <steffen@innosonix.de>
Cc: stable@vger.kernel.org,  Srinivas Kandagatla <srini@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Dmitry Baryshkov <lumag@kernel.org>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvmem: imx-ocotp: fix MAC address byte length
In-Reply-To: <20250623084351.1734037-1-steffen@innosonix.de> ("Steffen
 =?utf-8?Q?B=C3=A4tz=22's?=
	message of "Mon, 23 Jun 2025 10:43:45 +0200")
References: <20250623084351.1734037-1-steffen@innosonix.de>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 12:33:05 +0300
Message-ID: <87ldpikdke.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_023314_708559_40F7DB1C 
X-CRM114-Status: GOOD (  17.00  )
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

Hi Steffen,

On Mon, Jun 23 2025, Steffen B=C3=A4tz wrote:
> The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
> extension of the "mac-address" cell from 6 to 8 bytes due to word_size
> of 4 bytes.
>
> Thus, the required byte swap for the mac-address of the full buffer lengt=
h,
> caused an trucation of the read mac-address.
> From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14
>
> After swapping only the first 6 bytes, the mac-address is correctly passed
> to the upper layers.
>
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
> Cc: stable@vger.kernel.org
> Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
> ---
> v2:
> - Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
>  drivers/nvmem/imx-ocotp-ele.c | 2 ++
>  drivers/nvmem/imx-ocotp.c     | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e..3af7968f5a34 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const cha=
r *id, int index,
>=20=20
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes =3D 6;

Maybe better use ETH_ALEN instead of magic number?

baruch

>  		for (i =3D 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);
>=20=20
> diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> index 79dd4fda0329..63e9974d9618 100644
> --- a/drivers/nvmem/imx-ocotp.c
> +++ b/drivers/nvmem/imx-ocotp.c
> @@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const cha=
r *id, int index,
>=20=20
>  	/* Deal with some post processing of nvmem cell data */
>  	if (id && !strcmp(id, "mac-address"))
> +		if (bytes > 6)
> +			bytes =3D 6;
>  		for (i =3D 0; i < bytes / 2; i++)
>  			swap(buf[i], buf[bytes - i - 1]);

--=20
                                                     ~. .~   Tk Open Systems
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

