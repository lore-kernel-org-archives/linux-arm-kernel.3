Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930C5CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WVWwGvjeB+DyYiuN6DmLwEzSAjU4qCfoJ5PSSBVzPc=; b=cF2kTxBIJUhHXqasy9d4ytlUEh
	jyGq04VkgudBQ6ajy7po0xj9QAEciFpgkbyWoz6vGLXX5tPwmM1C0dCsLi2TnHgc6HzHx4abX55Tf
	lMRlC74PtcAiIIRozs95n7yMw8jswMv6cxNXj8a2LBvYOqbjil+HuNmPfutswgLkhvwtOLDr0PBCU
	g1uoKCywFEtOXTUfjN55CXFb7pJl1pNrwMB4IPyEavyRZBj3KxPt/4gFw6uGbtQqhkTSUMXgdL6ZV
	GHyKaGMVa1dwFPxZU8VgW6aSmNVyvfPR+Qsho48ioRx/jLErsmjRaq3MAcz1dxlQkmkk9USxhHFdn
	sMXdW/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSkn-00000002g04-0Q12;
	Tue, 29 Sep 2026 07:59:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSkl-00000002fzg-1LXa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 07:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1WVWwGvjeB+DyYiuN6DmLwEzSAjU4qCfoJ5PSSBVzPc=; b=N2gjWDpsFyGBNylA7TNGsbl5x9
	Sj1IOB89QxzJr/F3JnY+xSv0fmfSv6NvB++6IdHzeK2RYDQxh9jEWnOfR47UwXretRKTYO7BQHv4l
	2+ultL6fHhDAJJ/UgiF1s1xy4elpu2ttwQUdZhDr+XI+3DAU020xYQJHf8JE/UyO39Vt/QM1XRpO7
	nOOReXMIYAvSgkRMjnMC++nnQ04VR6XiqHtDuGm6VGek8o+Qvy6vI4cCcu8/ChDzyKYxXYQOdvaDW
	z6yiWoG3PKYi3Phu3XRnDP2E1tdQ3raFhZROVfOtL7Rq9XNlcZzvjK38vFjxH20t6+WZRZhYM/v9r
	PpF+gVQQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBSkh-00000002JuM-0DCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:59:54 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-05 (Coremail) with SMTP id zQCowACH9D7mb7tqciuoCQ--.6684S2;
	Tue, 29 Sep 2026 15:59:35 +0800 (CST)
Message-ID: <0b09267b78f84770db80b2d7e2c30f85c8538821.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 15:59:35 +0800
In-Reply-To: <ed35ac8d-ebcb-4f7f-aafd-c1b1eb3616b7@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
	 <20260918030125.315978-8-a0987203069@gmail.com>
	 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
	 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
	 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
	 <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
	 <fde43d758a66a8feefc50274f3573e33a67d43f2.camel@iscas.ac.cn>
	 <fc425e648644d94276bce7d3d4dac8b0acd4c5d8.camel@iscas.ac.cn>
	 <ed35ac8d-ebcb-4f7f-aafd-c1b1eb3616b7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowACH9D7mb7tqciuoCQ--.6684S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4xCF4UuFW8WF48Cr1rWFg_yoWrAF18pF
	W7Ca45Kr4kJryFvwn2kw1kX34YkrW8J3yDXr1rGr10k390yF1xJFWxGrW5uFyxWr1UGw12
	vr40yr93uryDA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [120.85.96.244]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_085951_760637_EDD248ED 
X-CRM114-Status: GOOD (  41.49  )
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

=E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 09:45 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> Icenowy Zheng =E6=96=BC 2026/9/26 =E4=B8=8B=E5=8D=88 12:48 =E5=AF=AB=E9=
=81=93:
> > =E5=9C=A8 2026-09-25=E4=BA=94=E7=9A=84 22:55 +0800=EF=BC=8CIcenowy Zhen=
g=E5=86=99=E9=81=93=EF=BC=9A
> > > =E5=9C=A8 2026-09-21=E4=B8=80=E7=9A=84 15:49 +0800=EF=BC=8CJoey Lu=E5=
=86=99=E9=81=93=EF=BC=9A
> > > > Icenowy Zheng =E6=96=BC 2026/9/21 =E4=B8=8B=E5=8D=88 03:30 =E5=AF=
=AB=E9=81=93:
> > > > > Maybe it's better to just make it the 2nd patch in this
> > > > > patchset,
> > > > > just
> > > > > after the binding change.
> > > > >=20
> > > > > Waiting for something into drm-misc-fixes again will need
> > > > > another
> > > > > fixes
> > > > > pull and another RC back merge, which can consume weeks and
> > > > > miss
> > > > > the
> > > > > current merging window.
> > > > >=20
> > > > > In addition, it's possible that `drm/verisilicon: introduce
> > > > > per-
> > > > > variant
> > > > > hardware ops table` also gets backported for a more clean
> > > > > primary
> > > > > plane
> > > > > atomic_update disabling fix.
> > > > Understood. I'll fold the FB_EN fix in as patch 2, right after
> > > > the
> > > Should I just apply this revision of patch with this reorder?
> > Oh I think more fixes are coming.
> >=20
> > There's one more DC8200-specific problem (which might be
> > problematic on
> > DC8000 but I am not sure): The vs_dc8200_panel_disable_ex sequence
> > must
> > be executed before vs_dc8200_panel_enable_ex, because some timing
> > parameters seem to be latched when the value going from 0 to 1, and
> > when a stale state is programmed before the driver is loaded (e.g.
> > a
> > firmware driving the display) and the timing isn't the same with
> > the
> > timing of the first modeset, the modeset will fail.
> >=20
> > I'm thinking about sending a fix patchset first, which will pick
> > the
> > FB_EN fix here, implement a fix for the stale state problem and
> > maybe
> > implement fixes for the old state dereference problems for hidden
> > planes in their atomic_update callback (although this fix will
> > introduce a helper, which will then be moved and renamed in the
> > DC8200
> > ops patch).
> >=20
> > Thanks,
> > Icenowy
> Understood, happy to hold the DCUltraLite series until your fix
> patchset lands, and rebase the ops-table patch on top of it then.
>=20
> On DC8000: its panel enable/disable path just toggles a plain
> FB_CONFIG_RESET bit, not the staged PANEL_CONFIG/PANEL_START latch
> registers DC8200 uses, so it doesn't look like it shares this
> specific
> ordering hazard from the register layout alone. I'll run the tests
> again=20
> after
> applying our variant on top of it.

Ah it's not race -- it's that some timing configuration is latched when
it starts, and the programming won't take effect if the panel isn't
shut down once.=20

This only becomes a problem when the firmware also powers on the
display, and sets a different timing. On real DPI panels this problem
seems to be not happening because they cannot adapt to different
timings (but monitors can sync to different timings).

Thanks,
Icenowy

> > > Thanks,
> > > Icenowy
> > >=20
> > > > dt-bindings patch, targeting the current vs_primary_plane.c
> > > > directly,
> > > > so the ops-table patch just carries the already-corrected code
> > > > forward
> > > > into vs_dc8200.c. Agreed that's faster than round-tripping.
> > > >=20
> > > > On primary_plane_disable_ex - I'll keep the "_ex" suffix.
> > > > DC8200
> > > > still
> > > > has a real per-variant operation there (clearing FB_EN +
> > > > commit),
> > > > while
> > > > DC8000 leaves it NULL and does nothing, so the suffix still
> > > > reflects
> > > > an actual per-variant difference, not just structure introduced
> > > > by
> > > > the
> > > > refactor.
> > > >=20
> > > > While testing the cursor plane, I found the same class of bug
> > > > there:
> > > > the disable register write was being triggered from the plane's
> > > > atomic_update() invisible-branch using the old plane state to
> > > > look
> > > > up
> > > > the CRTC/output, which can be stale or NULL on a plane's very
> > > > first
> > > > commit if it's already invisible then. I've fixed it locally by
> > > > having
> > > > atomic_update() derive the CRTC/output from the state it
> > > > already
> > > > holds
> > > > before checking visibility, instead of falling through to the
> > > > old-state-based disable path. Just flagging it here for now -
> > > > vs_cursor_plane.c isn't touched by any of my patches.
> > > >=20
> > > > Thanks.


