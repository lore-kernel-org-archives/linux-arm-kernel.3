Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC6EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNl7tnAMl7nkr7Gi2tTSL3Q1eKtYp5WOaoWJus3+fR8=; b=ufLprfaYiKg/HzRiBOaZQAxsgn
	eZlQJPSHVOWYBbeEiPk/B5rfR1fTq1w6LuDh/aWTZwXAsdH6Ybojvn5jJaoyCQ2dsoArUIGko04d+
	Bcon/qt2onYVoNXFcRld/1d94MgiR0o78OuH1P1bzStSVj1WRNE6xXXEnX8oCqLw1xv4Hhap6j/Qf
	B9l2rTIXh8ozERikOSr3VW6DfEoRGFTCiHT6y4vLHdm1xdMmGxk30U2u43C0Tft3nuY5moMXZWTOe
	I26dfxMbgd8I+MYct+VcrTG9gyw1ZmSMR/94Jjw8/IJIj4jBlWSmb8Y27m+ifb+FshylPy4oJ91zQ
	ARNb+dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUrn-0000000455X-20bz;
	Mon, 27 Jul 2026 23:36:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUrl-0000000455R-1Wxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:36:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1860C417E0;
	Mon, 27 Jul 2026 23:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3C61F000E9;
	Mon, 27 Jul 2026 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785195371;
	bh=PNl7tnAMl7nkr7Gi2tTSL3Q1eKtYp5WOaoWJus3+fR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U/IG3Rg8OTRvEqGn97og+yiQdS9ry3Y7jaoYmnjhZJ1IZ92STvCSYyFdghqFjtiu2
	 LmNW2JZ21w5IfTJMu9EMxOKGudUkSzOoqfyYFoeG6KzgBRYTd8OtzefC3OlaZBH7pM
	 mXrpyipnDZu3mHI7vAAwgVzBSqhpHit4P7hh2k1Ec5414t18x3xfQ09pVWhnjuo9KN
	 7ECnCAMi5mggx1aDth9yZYQO2/e/G1KUVhCEtksif9ALPE9SqSmwS7eSCJtrup0ZG6
	 NiyUUh1kc8QWYfY/qZG0kngMFQAZBObEsMyJq3+kab034dd/Ii892bCDlWqNuO/LEo
	 7FNPXp8b5/jXw==
Date: Tue, 28 Jul 2026 00:36:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
 <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan
 <ben.horgan@arm.com>, Reinette Chatre <reinette.chatre@intel.com>, Fenghua
 Yu <fenghuay@nvidia.com>, Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>, Trilok Soni <tsoni@quicinc.com>,
 Srinivas Ramana <sramana@qti.qualcomm.com>, Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC
 support
Message-ID: <20260728003606.14386844@jic23-huawei>
In-Reply-To: <4faf0089-4615-4fb1-bc07-e52b4d43f073@oss.qualcomm.com>
References: <20260723155454.1760823-1-andre.przywara@arm.com>
	<20260723155454.1760823-11-andre.przywara@arm.com>
	<4faf0089-4615-4fb1-bc07-e52b4d43f073@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 27 Jul 2026 21:57:15 +0530
Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com> wrote:

> On 7/23/2026 9:24 PM, Andre Przywara wrote:
> > The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> > registers through a firmware interface. This requires a shared memory
> > region to hold the message, and a mailbox to trigger the access.
> > For ACPI this is wrapped as a PCC channel, described using existing
> > ACPI abstractions.
> >=20
> > Add code to parse those PCC table descriptions associated with an MSC,
> > and store the parsed information in the MSC struct.
> > There can be multiple PCC channels, and each channel can serve multiple
> > MSCs, so we need to keep track of the channel usage, using a list and
> > a refcount.

Blank line for consistency

> > This will be used by the MPAM-Fb access wrapper code.
> >=20
> > [1] https://developer.arm.com/documentation/den0144/latest
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>

> > diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devi=
ces.c
> > index fea3161ffbe9..fc4b5f87fbe9 100644
> > --- a/drivers/resctrl/mpam_devices.c
> > +++ b/drivers/resctrl/mpam_devices.c

> > +static void mpam_pcc_chan_release(struct kref *ref)
> > +{
> > +	struct mpam_pcc_chan *cur =3D container_of(ref, struct mpam_pcc_chan,
> > +						 refcount);
> > +
> > +	pcc_mbox_free_channel(cur->pcc_chan);
> > +	list_del(&cur->pcc_chans);
> > +	kfree(cur);
> > +}
> > +
> > +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> > +					       int subspace_id)
> > +{
> > +	struct mpam_pcc_chan *cur;
> > +	int ret;
> > +
> > +	guard(mutex)(&pcc_chan_list_lock);
> > +
> > +	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
> > +		if (cur->subspace_id =3D=3D subspace_id) {
> > +			kref_get(&cur->refcount);
> > +
> > +			return cur;
> > +		}
> > +	}
> > +
> > +	cur =3D kzalloc_obj(*cur);
> > +	if (!cur)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	cur->pcc_cl.dev =3D dev;
> > +	cur->pcc_cl.tx_block =3D true;
> > +
> > +	cur->pcc_chan =3D pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
> > +	if (IS_ERR(cur->pcc_chan)) {
> > +		long err =3D PTR_ERR(cur->pcc_chan);
> > +
> > +		kfree(cur);
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	/* Timeout based on the "nominal latency" from the PCC ACPI table. */
> > +	cur->pcc_cl.tx_tout =3D cur->pcc_chan->latency * 5;
> > +
> > +	ret =3D devm_mutex_init(dev, &cur->pcc_chan_lock);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > + =20
>=20
> Here, devm_mutex_init() ties the lifetime of pcc_chan_lock to dev, which=
=20
> is &pdev->dev of the first MSC to call mpam_pcc_chan_get(). But
> mpam_pcc_chan is shared across multiple MSCs via kref, so it can
> outlive that first device.
>=20
> If a second MSC has incremented the refcount and is still active when
> the first MSC's device is removed, the devm cleanup on the first device
> would call mutex_destroy() on pcc_chan_lock while the second MSC may
> still be inside:
>=20
>      guard(mutex)(&pcc_chan->pcc_chan_lock);
>=20
> I am not 100% sure this is reachable in practice =E2=80=94 it may depend =
on
> the order in which platform devices are unbound, and whether that can
> happen with MSCs sharing a channel. I also note that devm_mutex_init()
> is a no-op on non-debug kernels, so this would only be observable with
> CONFIG_DEBUG_MUTEXES=3Dy. But it felt worth raising in case
> it is a real path.
>=20
> If my understanding is correct, would it make sense to use a plain
> mutex_init() here instead, and move mutex_destroy() into
> mpam_pcc_chan_release() where the kref guarantees no concurrent users
> remain?

Good spot and fwiw Sashiko shouted about this one as well!
https://sashiko.dev/#/patchset/20260723155454.1760823-1-andre.przywara%40ar=
m.com

It also called out the lack of error handling should this fail, but that
becomes irrelevant if the code is updated as you suggest.


>=20
> > +	cur->subspace_id =3D subspace_id;
> > +	kref_init(&cur->refcount);
> > +
> > +	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
> > +
> > +	return cur;
> > +}
> > +

Thanks,

Jonathan

