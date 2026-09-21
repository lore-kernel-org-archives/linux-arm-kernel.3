Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C43C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPW2dZAxEbH0+g92u4hCAhJCZWv/yfUo0ZYM9OdlpBM=; b=W7Tn6go0qYNbytrBHqnRpS0rlR
	99cllXOOXj1ErCAusdWTgtC2r0yUu0y+XWzs9HF711IyyPWxwqQSTYDXnvS6W5HpV4W5imdNvTTrP
	116bFL6YNWJ/WUpmtghuM0b0u8TiMK6bL7v3Bn7Zv3W/EB4I5/MUKR2Az2TFlPdiN4g09rfLkVspb
	I82s+JZGICY7NCS9IAnKDDU1ETXW4wXJ+3pTv5XvvLK3furdgVrPdxLfURG/uCAnpR+QTP9pRU6kO
	/6OxOkBD1gqZD0iezk7ooVjrAr7439uIWH8B2HGzv7DxXE3SCNVxi49wLeUttjAoLSEVDmLAn6C35
	p/1PCWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZhT-00000001OQi-1HdL;
	Mon, 21 Sep 2026 08:48:35 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZhP-00000001OPd-0hLB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:48:32 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-03 (Coremail) with SMTP id rQCowADX2zlW77BqMptFCA--.6452S2;
	Mon, 21 Sep 2026 16:48:22 +0800 (CST)
Message-ID: <0da2ef7f08b23e916869d5c08267b3802d5a631d.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2026 16:48:22 +0800
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
X-CM-TRANSID: rQCowADX2zlW77BqMptFCA--.6452S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyfCFW8JFyDXFWkKw4fAFb_yoW8Cw15pa
	9rKas0kr4kXr1Ik397Cw48tayFgrWrJ3y7JryrGr1vk398tr1xJFyrKayfuFW8Grs3Gw1a
	qF4qyr98CFWDCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_014831_582469_D6C15487 
X-CRM114-Status: GOOD (  16.45  )
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
> dt-bindings patch, targeting the current vs_primary_plane.c directly,
> so the ops-table patch just carries the already-corrected code
> forward
> into vs_dc8200.c. Agreed that's faster than round-tripping.
>=20
> On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200
> still
> has a real per-variant operation there (clearing FB_EN + commit),

Well I propose to remove _ex because there's no real non-per-variant
operation.

Thanks,
Icenowy

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


