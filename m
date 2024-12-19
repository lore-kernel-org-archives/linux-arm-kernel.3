Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E81E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 14:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hznEU/JjySVcox1z/n7FV7JgkYJK5W8i7mk0QDaA+1o=; b=qCapToTC1jnEt8cwr+ADzSljka
	w/g8YU1E92l7/PsJjVHqJIdVHBjU9jKcYXPZiGP12tJ8CNYANGganmuyfY/n+zel4yufhLxi63qXi
	Wi+cLUzrjehI3xzyDM4QKzb6go885q6WuEJbgMCjw6Dr73SZXEt4UXvpJ+OuvfgUhVJFuWw8q5SV+
	yPjrq6sm26WIfcfjuTGQ8GpDXE2yji0HxWN0th4tYPl0pwud7lhspl8Qfjs6Rw6/3vbSDHxB2Ch83
	gwlMyE/b07b9HURSYMMIEryrhaNRnz4yRtcLxY88tFj3vZwe3CKL6SlyVv6Oofboni4Jz39HfivXf
	LDRBInJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHHZ-000000021tp-2p36;
	Thu, 19 Dec 2024 14:13:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHGS-000000021kT-3SQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 14:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734617552; x=1766153552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rL4bZKisA1ewY6FNSKjR35HRt9SyWoP4I/W6Geur4+Q=;
  b=zPKefTSV4TDq7c9DUpS+D8hlolthQb24Br23tYqKDVNxsHQ4o2tFL/vf
   jUFaulqGiutwCn2THhsiUDCRf7Qqz0bYnCe11HIqocwgYdCqMh13yC18E
   CBtc/EV5uREEPVxJGdWFRLxUsD6VNQfjqW8hPJgYZ3JPGD1m5idzXO2LF
   UzY6/GLu7sJatGjkqLbeFWb5WNzio4SmbASvqcIf3F1ItUssaUwmEsUPB
   oifHsQyktx21CE35DRVsghg+20LGaSU+px29iOMxZrjV4QLH4M/9CIjC7
   oO+QceJ0D3XN5PPeMsW0YjuO7LVwjU34CdyoG6dD/9Is/I00lubtHs2UV
   A==;
X-CSE-ConnectionGUID: duLIUFe6TgyylrqHBIcnZA==
X-CSE-MsgGUID: IHx9uQXnT4KVcyij0LTx5Q==
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="asc'?scan'208";a="39491699"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Dec 2024 07:12:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 19 Dec 2024 07:12:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 19 Dec 2024 07:12:25 -0700
Date: Thu, 19 Dec 2024 14:11:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<andre.draszik@linaro.org>, <peter.griffin@linaro.org>,
	<kernel-team@android.com>, <willmcvicker@google.com>,
	<daniel.lezcano@linaro.org>, <vincent.guittot@linaro.org>,
	<ulf.hansson@linaro.org>, <arnd@arndb.de>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add support for referencing
 controllers solely by node
Message-ID: <20241219-recent-everyone-865b19864693@wendy>
References: <20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org>
 <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AgDRwXcwVb4K00Cs"
Content-Disposition: inline
In-Reply-To: <20241219-mbox_request_channel_by_args-v1-1-617a6910f842@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_061233_088925_FD9C9E05 
X-CRM114-Status: GOOD (  20.63  )
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

--AgDRwXcwVb4K00Cs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 01:07:46PM +0000, Tudor Ambarus wrote:
> There are mailbox clients that can discover the mailbox channel ID at
> run-time. For such cases passing the channel identifier via DT is
> redundant. Add support for referencing controllers solely by node.

I don't really get your implementation, why not just allow #mbox-cells =3D =
0?
That's what's done for things like fixed frequency clocks that only have
a single output.

Cheers,
Conor.

>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/mailbox.txt | 19 +++++++++++++=
++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Docu=
mentation/devicetree/bindings/mailbox/mailbox.txt
> index af8ecee2ac68..0c4295a62f61 100644
> --- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
> @@ -5,9 +5,10 @@ assign appropriate mailbox channel to client drivers.
> =20
>  * Mailbox Controller
> =20
> -Required property:
> -- #mbox-cells: Must be at least 1. Number of cells in a mailbox
> -		specifier.
> +Optional property:
> +- #mbox-cells: Must be at least 1. Number of cells in a mailbox specifie=
r.
> +               The property becomes mandatory for the cases where the cl=
ients
> +               reference the controller via the mboxes property.
> =20
>  Example:
>  	mailbox: mailbox {
> @@ -19,7 +20,11 @@ Example:
>  * Mailbox Client
> =20
>  Required property:
> +Clients must reference the mailbox controller either via the mboxes or m=
box
> +properties.
>  - mboxes: List of phandle and mailbox channel specifiers.
> +- mbox: phandle pointing to the controller. Used by clients that can dis=
cover
> +        the channel identifiers at runtime.
> =20
>  Optional property:
>  - mbox-names: List of identifier strings for each mailbox channel.
> @@ -29,7 +34,13 @@ Optional property:
>  	  communication between the mailbox client and the remote.
> =20
> =20
> -Example:
> +Example using mbox:
> +	power-management {
> +		...
> +		mbox =3D <&mailbox>;
> +	};
> +
> +Example using mboxes:
>  	pwr_cntrl: power {
>  		...
>  		mbox-names =3D "pwr-ctrl", "rpc";
>=20
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20

--AgDRwXcwVb4K00Cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2QpqQAKCRB4tDGHoIJi
0jNPAP4jwBK4hw6Sni3HTWgBfvx9OY6ivkQ6KxloApXofanz+gD+LuAhHCXALmhe
kUsX/G4V8KQ7n/DEcofRph3WgvdBCg4=
=Kz4z
-----END PGP SIGNATURE-----

--AgDRwXcwVb4K00Cs--

