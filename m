Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E19CEA3C5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kQcmwdG6QXGNqHhvyATkAq0gNlzbTkugog2hKOxlQo=; b=IlT3Yrxp5YpwnxOUDwQAKns++X
	hWlpLzK1s11Yif/ZQUkIiSBHw4nSGqgsz3co32DmMRKgb2p1RPk6atV0lcFTa1dTTnHL5MoRVelnx
	jICSzqfYP+MspXxqOiXGpiAiwePMAe/yH8aC5wxcbcA02TPgQRjjO8V68o+ysiYOSB+MiWOF2xwSB
	LpJ023l8Vy1LJoz+cZKwQTxTvdPD+dUuQjX4AXoDR3wZWYfbgZJmkjw6EppsuLHWimnh0jypaxH6x
	VMhykpx3u8zQgvi5b41VKjNcmpO3ELP8PXRZms5sBLwB8UHe6edLdtviISjGFI+ooh8SXoWFtdsQA
	51B0emjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApwT-0000000AdDO-1IHd;
	Thu, 09 Apr 2026 14:01:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApw8-0000000AdBE-403S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 14:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775743247;
	bh=8kQcmwdG6QXGNqHhvyATkAq0gNlzbTkugog2hKOxlQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YsbZZX967IbI31BbbquqZ1PcEV/O5Tsa6A7f2P1bl11OYlZGG3GZk8YNTjAp1qKWf
	 t0/cIInrE5IlfZ2R8gOKUWCj/EvfIq4hqUThaMO+6eYf/7MbX9znGPxiVtdK0h6JPC
	 3Bd1yvTz12d9caUXF/e+zfAdb0pIM7KShrsvnAR5KyR8Pv3/h0INsuNPOZIgLcv3qe
	 MkrCliVR6W7eglK6vhLvwnUmWG6R/ZiPd2Zb5YhF6f26GmkbC7tX7eRHwR8r4QKDDO
	 S7P6pq73R65MQtk9EieW3tvaGOR9Yb9e/giJmwWQF2fPB5Fk27xGb0Cu7BP87Qs/rq
	 ETVYncB2jjnKA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F47217E0C83;
	Thu,  9 Apr 2026 16:00:45 +0200 (CEST)
Message-ID: <f18928df8aeb6afb27b88a15cfdde99ec632e266.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland	 <samuel@sholland.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 10:00:44 -0400
In-Reply-To: <20260409223000.0-cedrus-h264-active-reply-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
	 <20260409223000.0-cedrus-h264-active-reply-pengpeng@iscas.ac.cn>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5OVr67ceBJnzsgX5dAdF"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_070055_435344_E7B45AB2 
X-CRM114-Status: GOOD (  11.15  )
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


--=-5OVr67ceBJnzsgX5dAdF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 22:30 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> Hi Paul,
>=20
> Thanks, that makes sense.
>=20
> I agree Cedrus should not silently skip an invalid index in the active
> portion of ref_pic_list0/ref_pic_list1.
>=20
> I'll respin this to keep the check at the Cedrus use site rather than
> cedrus_try_ctrl(), but return -EINVAL when one of the active reference
> entries points past V4L2_H264_NUM_DPB_ENTRIES. Entries beyond
> num_ref_idx_l0_active_minus1 / num_ref_idx_l1_active_minus1 will still
> be ignored as before.

Please, let the discussion continue before respinning.

Nicolas

>=20
> Thanks,
> Pengpeng
>=20

--=-5OVr67ceBJnzsgX5dAdF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadexDAAKCRDZQZRRKWBy
9OpVAQCP3WR3RB5KJ7O/QZ7D8FigNAJs7B9yunh7U+RQR3hX9AEA+EjzVzLfQMAu
cRpZtv69oZ3RMZw21gi99TaCU4LTiwA=
=YIxt
-----END PGP SIGNATURE-----

--=-5OVr67ceBJnzsgX5dAdF--

