Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F507C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD8IaHb1Os1/I0eMQ/TTV6buZJRhJ/ZWgz0ZxoW6/Ig=; b=vCVSG16KBIadzpDu2ot8F8Q4Ol
	542QHZCh0XsYbRq6CZXiPIqSg89/oTrK+Coz1J3WYaoeHZWbTJrJREXLSiO3brb3MFt7WRjm72fL3
	YPA8c6wabxkKPPBwxcmqsdnBRif+bzqhMbcyhGFheDsaZcMt1U7ahlGs6mQb2oXgFhhdfqseiipIk
	NOGxLj7XzxQmz8khuCOIcx/ywLP5A/qQvu+epaikOHSBvY1AdildyThuYWcTMvIOFNv3oNM/aP6Li
	zz0PDEdnTdlePx/ivX2zAxKjihQ18KKAZOXVWIXZ+gFzcer8Q2gf1NaRk4vOVYtaA32R0tQkPY/vd
	LaB07Q8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7LQ-0000000DfDS-2NKj;
	Fri, 25 Sep 2026 14:56:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7LO-0000000DfD1-06v0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:56:11 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowAAXhD5+i7Zqv8FECQ--.59835S2;
	Fri, 25 Sep 2026 22:56:00 +0800 (CST)
Message-ID: <fde43d758a66a8feefc50274f3573e33a67d43f2.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2026 22:55:57 +0800
In-Reply-To: <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
	 <20260918030125.315978-8-a0987203069@gmail.com>
	 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
	 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
	 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
	 <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXhD5+i7Zqv8FECQ--.59835S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyfCFW8JFyDXFWkKw4fAFb_yoW8CFyxpa
	97Ka90krs7Xr4Ik392kw48taySgrWrJ3yUJryrG34vk398tF1xJFyrKayfuFWxurs3Ww12
	qF4qkr98CFWDuwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_075610_435995_A5CC3A47 
X-CRM114-Status: GOOD (  17.41  )
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

=E5=9C=A8 2026-09-21=E4=B8=80=E7=9A=84 15:49 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> Icenowy Zheng =E6=96=BC 2026/9/21 =E4=B8=8B=E5=8D=88 03:30 =E5=AF=AB=E9=
=81=93:
> > Maybe it's better to just make it the 2nd patch in this patchset,
> > just
> > after the binding change.
> >=20
> > Waiting for something into drm-misc-fixes again will need another
> > fixes
> > pull and another RC back merge, which can consume weeks and miss
> > the
> > current merging window.
> >=20
> > In addition, it's possible that `drm/verisilicon: introduce per-
> > variant
> > hardware ops table` also gets backported for a more clean primary
> > plane
> > atomic_update disabling fix.
> Understood. I'll fold the FB_EN fix in as patch 2, right after the

Should I just apply this revision of patch with this reorder?

Thanks,
Icenowy

> dt-bindings patch, targeting the current vs_primary_plane.c directly,
> so the ops-table patch just carries the already-corrected code
> forward
> into vs_dc8200.c. Agreed that's faster than round-tripping.
>=20
> On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200
> still
> has a real per-variant operation there (clearing FB_EN + commit),
> while
> DC8000 leaves it NULL and does nothing, so the suffix still reflects
> an actual per-variant difference, not just structure introduced by
> the
> refactor.
>=20
> While testing the cursor plane, I found the same class of bug there:
> the disable register write was being triggered from the plane's
> atomic_update() invisible-branch using the old plane state to look up
> the CRTC/output, which can be stale or NULL on a plane's very first
> commit if it's already invisible then. I've fixed it locally by
> having
> atomic_update() derive the CRTC/output from the state it already
> holds
> before checking visibility, instead of falling through to the
> old-state-based disable path. Just flagging it here for now -
> vs_cursor_plane.c isn't touched by any of my patches.
>=20
> Thanks.


