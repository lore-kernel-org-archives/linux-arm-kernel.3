Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667A8C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=; b=IB6/M83bZeeCrDnEza8bp+F9BU
	5T9EUVJgZY5NIZeDK7x/AebsK5BpyYn8+IGUmjBEecj/FYXmxjAogVS/q8Ls5u9ibDSmcZeOj7sUh
	lRV0m0iutSLkpu64gg3KG67DINbLBDqqSH4XzDTosk1HXnuhd6deJZSTfFWkvKjdZVrz5uVbK7EoH
	VLzCsBTvLujf3/S/dcIcZwJagm39V5poT2EKWgB2wuZ9qtAZeNFrUOE9QYfZ0zHGSlhxxgMgPNDf3
	ITN0I/FUdVVjfkMxk1iHa+YDV6jYOk1idgm1EtYgYAMjuFC7kJnIxgdA1M2wqAkOFCtDtI5JiMHcT
	h6AllD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAgI-00000001rnV-2d2f;
	Thu, 22 May 2025 18:30:14 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIAFz-00000001ovP-2z3r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 18:03:05 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c5b8d13f73so955513485a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747936982; x=1748541782; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
        b=TqgGTHL3z24NSgbHjy+RRbZ2OzWCNOzMJSLa+9/iemlJRKdk5fJkVMc40hyUdGy7fI
         1GubMYRk/IJlDmBM8+y64FdurexMh1/LiPLUiwqOTGliyYpPNHPRAhgcFes35VshhJ6Y
         nxoYe8TddFTAICvCIF1VFcMmhh8EZDc1es9BFR2QXZgfEGHhPJ781EVsXUcFn9m+nSct
         ebz52mTFFo068q4PVORUhK2iTuk5ZdVph3zsi7/vKVXXtHWNEl9RKQ1zidkXG1s5uq54
         Z+9BtE9rj5gDxROGlTsDqM7pA069kTFJ3jZT9KznrYJKcgBJi2ufdRQJfXHWoXWnQX3j
         OzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936982; x=1748541782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
        b=ep74L5Ufi+2Vt6ItzqOeCMgUcCVWhkh+XHV3EvKxovoRD8OB4AEpuAM59w07vaHqdQ
         euklKSD89o8XgSbY0ZDcZKz0vuE9Z6NtaJ9AS/ZEqsp/LL8o0Em6cevmc1pEnqZ60Ubf
         osDHLmRSdSwFM/ZvGWn1O91RWyEO+ivcKVl8u40UqrYM/PGlZWPNotIe4w056+B+YMcm
         aKprAddjMrTl+qf0tYVs09Wr8cCl5K9mPbmTIq6KT2K8OvVQtHWKHlZPNcC+lFOmVHG8
         EiktpaGRFULIGOXDYlkvAbAj1ovvn/jF1bAm2U5YTXwJ3KzAylDbA5Ke99LO7SpA6/6M
         VKeA==
X-Forwarded-Encrypted: i=1; AJvYcCWCrsp0VbQPoJh4JEt8gvNhhZBaWFWUQnmu2IKo2qTH0SLd+iRNR8aNCwgYgm4pYacBqK3vJWbNo+MO+wFUI3XJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzaR/Mnw5FBuZH9V3i9Xl2EOqyod9g42ys9TpKJp/L3jIprdFP3
	zDDXvrk7KB6u6DvB+3zExF4v/yVKSRc5MQEKJuBKZo0GdaDoP8ssmRzT9Ljf7hfRLLk=
X-Gm-Gg: ASbGncuRxuEdp/mej5kQWPaHFqSjTszroiVJfMZlONfLxL5YdvAeqrLCeq0fP7UW59Q
	zrkLiMyKy6h5zLiMQ0t9cwpnp6RLqGNtAKlbcO7KY1Wg5MVzroUn7HcRswIv+eVaTZGploG2aSi
	0XE4ZljKXzKHYCjrc6Xv5dHjLB8nHd4zguLNFCBXjhoLWEL4nwWngtQOK//yIcrwXx2S+ci1hpl
	5qpY8Vt2/LOaFQRlIum2okwxLZJNWEAd25gkvxyDFRt7i+R9rFdbePySJGGjBEXiyU0c+yWs1Tq
	EUdF8cSRHdTjcJ49kUZeomonS+nwcUMFHNXRZ4ipba1ZkTAoUgCPmzmMJkisES3gdQs=
X-Google-Smtp-Source: AGHT+IHh4iw4dgUV3S3EY22uzVTY0YQII61ellrTPDPBr9fV911fwzk1oNA0AI/vndoigz6Eq9Za+A==
X-Received: by 2002:a05:620a:d8d:b0:7c5:60c7:339 with SMTP id af79cd13be357-7cd46718a88mr4026950085a.9.1747936981809;
        Thu, 22 May 2025 11:03:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b62ecsm1052642185a.82.2025.05.22.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:03:01 -0700 (PDT)
Message-ID: <0c261c9aad759d791e0a576a47bbd064f28148e9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org,  Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Heiko
 Stuebner <heiko@sntech.de>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,  Simona Vetter
 <simona@ffwll.ch>, linux-rockchip@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Thu, 22 May 2025 14:03:00 -0400
In-Reply-To: <174742024812.3649303.12389396177218408388.robh@kernel.org>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
	 <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
	 <174742024812.3649303.12389396177218408388.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_110303_946471_DAFF1B2D 
X-CRM114-Status: GOOD (  21.46  )
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

Hi Rob,


Le lundi 19 mai 2025 =C3=A0 06:35 -0500, Rob Herring (Arm) a =C3=A9crit=C2=
=A0:
>=20
> On Fri, 16 May 2025 18:53:15 +0200, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >=20
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> > =C2=A0 IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >=20
> > v3:
> > - Split register block in its constituent subblocks, and only require
> > =C2=A0 the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > =C2=A0.../bindings/npu/rockchip,rknn-core.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 162 +++++++++++++++++++++
> > =C2=A01 file changed, 162 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

Yes, and it found and reported it 25 times, can you fix it please ?

Nicolas

>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.yaml: properties:reg-
> names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too long
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too short
> 	False schema does not allow 3
> 	1 was expected
> 	3 is greater than the maximum of 2
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): compatible: 'oneOf' co=
nditional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core-top', 'rockchip,rknn-core-top'] is too long
> 	'rockchip,rk3588-rknn-core-top' is not one of ['rockchip,rk3588-rknn-cor=
e']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): reg: [[0, 4255842304, =
0, 36864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): compatible: 'oneOf' condit=
ional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core', 'rockchip,rknn-core'] is too long
> 	'rockchip,rk3588-rknn-core' is not one of ['rockchip,rk3588-rknn-core-to=
p']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): reg: [[0, 4255907840, 0, 3=
6864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250516-6=
-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

