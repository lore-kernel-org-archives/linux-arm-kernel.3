Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B546CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+h5guwEJBXYPr6x/4BoU3yk32WsocIYZRObOc2SD7E=; b=s5l2nWWxYYaXrpYILHBwAg+263
	mlVRBTUmZ2rW0WkldscB08pBNkDIjTPuF7IClLg/yrmhgtJiJPVI9SeMEAHzNtBMwt0TqbbRDicbr
	8oUIp1CtcfPLz8bKb2pKVTXqGUd4OG+O8pcfoAjbnL7bpvFe4Lev11FfTW0WBHYzhEMnB4wXtrRQ3
	jTkMCuBx7f8CkUibwMTbDSp3Gvogn1VU9y9wRAqfifOfZoRVoh3Ry1y0HGq8R9rhGvwrC4vrob3HQ
	YEDCJywAu5gplOjnlaZVcwiu2UElfBVaFDzbJwKgG2VB7USZFwS+qztcS5AMlfpLAZ76GhR+eebmR
	aBf8FOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFD2-000000001Vy-28ZQ;
	Thu, 18 Sep 2025 14:02:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFCz-000000001V1-32ZU;
	Thu, 18 Sep 2025 14:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758204103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nYwqjkuaJd7z0MOkUp0DgfN53CXjxJ8VD6pq4qgAghNfmvnA3vgnX5pK17ASOg1fr82DmoBQiEwzoIcEOU0kMcH/IXTOc3x4mOmsA1BE4UWokJ5VwMw3JbW0UIGi57KnolqmBLNbrQF08F9nxwd01FMcbj6E2CAqV15MVEGLk+s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758204103; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D+h5guwEJBXYPr6x/4BoU3yk32WsocIYZRObOc2SD7E=; 
	b=Cu5B0fFQGxjhlexh70bmK9sj0JsAbY8IHD9Sn6ukiIq6IIBUQ85Y7OgndtebASrN5nnDV54v8AUXQIN3AwUH8rQQhSs12nsRNRvVSOr+hsO/WCgXWFyUGK+tUKLwuoRVNCCi35FZC0QANVXWBuJVQoja3ApO8EM2o7hXGv3cCVM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758204103;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=D+h5guwEJBXYPr6x/4BoU3yk32WsocIYZRObOc2SD7E=;
	b=hAogMFSPwKq/tEvbgDxEAdbZWwp+FACMmjl1d2HM2d9ucBx6Nct3HTBzQRdCcPX3
	Q14+J4hiqYfWRQ+3mZzqx1+2bVa9ts2cpR1a2MFl28notvkZLDxQ8Zk3A2H/iVa1V7j
	vMYYWOob+ruYusn+fJBEnGV4TP2+rk+mU3Mntpco=
Received: by mx.zohomail.com with SMTPS id 1758204100007491.1116048037495;
	Thu, 18 Sep 2025 07:01:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Date: Thu, 18 Sep 2025 16:01:31 +0200
Message-ID: <5749727.31r3eYUQgx@workhorse>
In-Reply-To: <20250918-festive-chowchow-of-joy-5a51de@kuoka>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-1-c4ede4b4399e@collabora.com>
 <20250918-festive-chowchow-of-joy-5a51de@kuoka>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_070201_822121_3BFF542B 
X-CRM114-Status: GOOD (  26.10  )
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

On Thursday, 18 September 2025 02:30:09 Central European Summer Time Krzysztof Kozlowski wrote:
> On Wed, Sep 17, 2025 at 02:22:32PM +0200, Nicolas Frattaroli wrote:
> > The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> > control the power and frequency of the GPU.
> > 
> > It lets us omit the OPP tables from the device tree, as those can now be
> > enumerated at runtime from the MCU. It also means the mali GPU node
> > described in this binding does not have any clocks in this case, as all
> > clock control is delegated to the MCU.
> > 
> > Add the mediatek,mt8196-mali compatible, and a performance-domains
> > property which points to the MCU's device tree node in this case. It's
> > required on mt8196 devices.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > index 7ad5a3ffc5f5c753322eda9e74cc65de89d11c73..ccab2dd0ea852187e3ab75923e19739622b2b3b8 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -38,7 +38,6 @@ properties:
> >        - const: gpu
> >  
> >    clocks:
> > -    minItems: 1
> 
> I don't understand why.
> 
> Best regards,
> Krzysztof
> 
> 

I am executing a Convex hull algorithm on the 3D space of "dt-bindings
maintainer opinions" to get a convex hull of acceptable dt-bindings
choices where two different choices are functionally equivalent.

With this additional opinion on the krzk axis, I now know that having
the base properties accurate for the general case is not required if
the per-compatible case sets the property to false anyway.

I hope no two opinions are collinear, as this would surely be my
undoing.

You get to pick which axis (X, Y, Z) you are. Right-hand rule, of
course.

Kind regards,
Nicolas Frattaroli



