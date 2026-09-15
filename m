Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F34C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfhHpvUA3b43jqTj06bTwumUh4t1oQIVQ0w7f9l6ujk=; b=DmLflcOdeUisqyI7uisxF3S0WB
	Hnjj9auTHnl4HkvnGS4mWLPfOMAEkmsRL1npybnvZh+7pCQYooQtZmyxdQbLrg275GPQBTWbZGVuf
	zei+NSdNREQ0ND1nK+zZTg9m2SQAQH5WNlWpdzY2gjhJmfjvL6xkcODJTzbqc/fDDS335aw3Z089i
	5JAI0HGADpbbkUIeG7nSRoSu9b9Eya91LWHmumN+jT0wwA7pYPigBxXfwOouAV2+Gswtcf3XBAf61
	tHRFaBOJ2I+/vkoG29YFLchsJoejgvuK2w0FTG13UprYSrz6F8w4DLtWTK7LaSO5lk0CqzuCJONJY
	FGpj4PJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U5p-00000006vTu-2tUL;
	Tue, 15 Sep 2026 14:25:05 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U5n-00000006vSd-2hDT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:25:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8mB/84XSzLWci86yLhGv7ckIJ/MKNaS0kbBnHtIQq3I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789482301; v=1; x=1790087101;
 b=l3g1gFvKBEV+ujW1zQL621t++NUT8KUoYTP59bY5Gi2FOIhUU/oHs3kUd3ZapJ5Ng9Isay25
 Ro6tLcMCaAMCzMq+X9zf71qS+Snww4CPV8dCvnYGcsZl+60mzAH/a51H0ORU8gttxpKqeFKqsW3
 bd95jGsk4n+nSKJHTGQM4OBE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f9c25fe9eb818961;
	Tue, 15 Sep 2026 14:25:00 +0000
X-Mizu-Trace-ID: f9c25fe9eb818961
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so482e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4NFHroINDzSEUiXJ62DlnxIbn495k+P4YA1htCik2ANx8EgZNXh/VCGptS2/jAsBUpdSb1o1Trr9cMVFtIT1f@lists.infradead.org
X-Gm-Message-State: AFuF++numcs1uOzvQQmkSwGuf0rkawwXcloiaHpxpAwv7IzES4P7GFQp
	MqogSVtAIgsrVSj0vQmzjjY1CY/U5UFwphVd7o19yXabwh/po4cSrPy/+2nk8JD88zq8MDWAU0R
	X7qwD09bmqHDkCteQP+jhsiEmXH+qGgFx0aZUHzBb
X-Received: by 2002:a05:6512:224d:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b8b2d0dd46mr158308e87.2.1789482295897; Tue, 15 Sep 2026
 07:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-8-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-8-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 15:24:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxCEfXeS+HHyZTcz2noKDXpWh9ZNdKUvnKoRhsDh5gwGQ@mail.gmail.com>
X-Gm-Features: AcwNN1WdffUDGaH0K4qtZGCCLrjwJKbs1nT14K5OlGCk62Z_-efTBPCTagEvW6Y
Message-ID: <CA+EHjTxCEfXeS+HHyZTcz2noKDXpWh9ZNdKUvnKoRhsDh5gwGQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Shadow the ITS command queue and
 setup emulation
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_072503_837028_02B9C075 
X-CRM114-Status: GOOD (  15.22  )
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

Hi Seb,

The approach looks right to me. A few things I'd fix, though:

On Fri, Aug 07, 2026 at 04:43:16PM +0000, Sebastian Ene wrote:

[...]

> Co-authored-by: Bart=C5=82omiej Grzesik <bgrzesik@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Could you switch this to Co-developed-by: and add Bart=C5=82omiej's
Signed-off-by after it?

[...]

> +void pkvm_its_emulate_handler(struct pkvm_protected_reg *region, u64 off=
set, bool write, u64 *reg,
> +                              u8 reg_size)
> +{
[...]
> +        for (reg_handler =3D its_handlers; reg_handler->access_size; reg=
_handler++) {
> +                if (reg_handler->offset > offset ||
> +                    reg_handler->offset + reg_handler->access_size <=3D =
offset)
> +                        continue;
> +
> +                if (reg_handler->access_size < reg_size)
> +                        return;
> +
> +                if (write && reg_handler->write) {
> +                        hyp_spin_lock(&priv->its_lock);
> +                        reg_handler->write(region, offset, *reg);

The match could require the offset and size to be exact. The handlers
ignore offset, so a 4-byte access at GITS_CWRITER + 4 matches this
entry and runs as a full 64-bit one. (Sashiko)

> +static int pkvm_setup_its_shadow_cmdq(struct its_host_state *host_state)
> +{
> +        u64 start_pfn, num_pages, i;
[...]
> +        start_pfn =3D hyp_virt_to_pfn(host_state->cmd_host_copy);
> +        num_pages =3D host_state->cmdq_len >> PAGE_SHIFT;
[...]
> +        ret =3D __pkvm_host_donate_hyp(hyp_virt_to_pfn(host_state->cmd_o=
riginal), num_pages);

Should setup take the base and size from GITS_CBASER and reject a
mismatch? Nothing ties cmd_original or cmdq_len to it, so a wrong base
leaves the ITS on the real queue the host still writes, and a short
cmdq_len runs the cwriter_write() memcpy past the donated pages.
(Sashiko)

> +unshare_cmd_host:
> +        if (i =3D=3D 0)
> +                return ret;
> +
> +        for (i =3D i - 1; i >=3D 0; i--)
> +                __pkvm_host_unshare_hyp(start_pfn + i);
> +        return ret;

while (i--) would do it. i is a u64, so i >=3D 0 always holds and the
loop wraps at zero instead of ending. (Sashiko)

> +        priv_state->base =3D (void __iomem *)__hyp_va(dev_addr);
> +        priv_state->cmd_original =3D host_state->cmd_original;
> +        priv_state->cmd_host_copy =3D host_state->cmd_host_copy;
[...]
> +        its_reg->priv =3D priv_state;

An smp_store_release() here would order those writes and the memset
above against the region->priv read pkvm_its_emulate_handler() does
locklessly on other CPUs.

> +        ret =3D __pkvm_host_donate_hyp(hyp_virt_to_pfn(priv), priv_num_p=
ages);
[...]
> +err_with_priv:
> +        WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(priv_state), 1));

priv_num_pages should come back here, not one, or the rest stay
hyp-owned. (Sashiko)

Cheers,
/fuad

