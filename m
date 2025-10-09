Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81AFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8IQGlvE0B/h1nhDsu/zo01pRlwkuXubZg9MqyCi1WQ=; b=biLH0lBrt595AksxiTAF/DlnjO
	Mu9eOZjoqoAeLgp/mYdZCQW0czgGA6v+bm2DZZZ3CSGBS0QoGXpvaC9ZTnj8++IEmefepI2GCDrj9
	F0iPfhaR3xmlq1N7pYWJU76jB2laJbDDeWuszYeqNgrpQJrhs5yDim2+72KXcOjk0AUDpnU8vMbqE
	rGD/cjYSyJCA2uFkiqzi1wLMRelzeQXz/lAJEq82Gy/i6zoo2hvWbd1FyEvK0rYMxp7Z8q6pD7Nft
	9f5tSFxrbiBYLaL0bjzbSekqi+0CO6hISsAeLLMWrY28GruiQfgKdEisqakSXqbZ3Ksm8YlY+kcNI
	c5pgoy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6x2v-000000073rB-3viw;
	Thu, 09 Oct 2025 20:15:29 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6x2t-000000073qQ-0VcK;
	Thu, 09 Oct 2025 20:15:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760040913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bUWbL/cbdYkJTVmJ/Ol4gXBFFOtUjIChX1rQYBVzQ+ybQSn5FjVpe8WwDFV4wxBirRm1AtyCwkzfvhrbWgbOU4avyQKHwewc2gG8u9Kye2OurxHN0SSnjZS5UEY4YgdPXoevlcBuPkcI88rZXqWm3mBQHlMyMsJy/cgBy1jJ/7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760040913; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m8IQGlvE0B/h1nhDsu/zo01pRlwkuXubZg9MqyCi1WQ=; 
	b=VPsvC9byf0knFT2/3fkR6VQ8fMPDHOk6/yh6BX3L/1cJSJnMqinRCDTsO8CPHIB4RCKpA8rxnQa0+DQxg1Aciq1V1vflLwn2MA7iA/zTgHddanaFYwqOJak93C/js48S/wilM7uT3Tai51OBO6wYCj1/PikTRZHHjaZ5ql0pW7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760040912;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=m8IQGlvE0B/h1nhDsu/zo01pRlwkuXubZg9MqyCi1WQ=;
	b=IREbUvkASyuJRRlJKCxFgy+8vM2XJYSaxRGe0c2fcHRLn26ofrTkacnwB+/DOp7c
	ia+TEJ7nCIV1WbnZducwJLlm+IzPXTwxLsBumFm1c8gnJXxM8djjaJXQms5dHWaqWUG
	RUnFlCta3Pkxp/zjK8t8/+86UeIy24pB4Imwc7PQ=
Received: by mx.zohomail.com with SMTPS id 1760040910661484.0419438507935;
	Thu, 9 Oct 2025 13:15:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, igor.belwon@mentallysanemainliners.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v8 9/9] drivers: mfd: Add support for MediaTek SPMI PMICs and
 MT6363/73
Date: Thu, 09 Oct 2025 22:15:01 +0200
Message-ID: <14451186.uLZWGnKmhe@workhorse>
In-Reply-To: <20251003091158.26748-10-angelogioacchino.delregno@collabora.com>
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
 <20251003091158.26748-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_131527_411092_D588E72F 
X-CRM114-Status: GOOD (  30.28  )
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

On Friday, 3 October 2025 11:11:58 Central European Summer Time AngeloGioac=
chino Del Regno wrote:
> This driver adds support for the MediaTek SPMI PMICs and their
> interrupt controller (which is present in 95% of the cases).
>=20
> Other than probing all of the sub-devices of a SPMI PMIC, this
> sets up a regmap from the relevant SPMI bus and initializes an
> interrupt controller with its irq domain and irqchip to handle
> chained interrupts, with the SPMI bus itself being its parent
> irq controller, and the PMIC being the outmost device.
>=20
> This driver hence holds all of the information about a specific
> PMIC's interrupts and will properly handle them, calling the
> ISR for any subdevice that requested an interrupt.
>=20
> As for the interrupt spec, this driver wants 3 interrupt cells,
> but ignores the first one: this is because of how this first
> revision of the MediaTek SPMI 2.0 Controller works, which does
> not hold irq number information in its register, but delegates
> that to the SPMI device - it's possible that this will change
> in the future with a newer revision of the controller IP, and
> this is the main reason for that.
>=20
> To make use of this implementation, this driver also adds the
> required bits to support MediaTek MT6363 and MT6373 SPMI PMICs.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/mfd/Kconfig         |  17 ++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/mtk-spmi-pmic.c | 410 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6363.h  |  26 +++
>  include/linux/mfd/mt6373.h  |  21 ++
>  5 files changed, 475 insertions(+)
>  create mode 100644 drivers/mfd/mtk-spmi-pmic.c
>  create mode 100644 include/linux/mfd/mt6363.h
>  create mode 100644 include/linux/mfd/mt6373.h

Hi Angelo, came across something suspicious here while debugging why
I ran into IRQ parsing from DT issues here.

>
> [...]
> diff --git a/drivers/mfd/mtk-spmi-pmic.c b/drivers/mfd/mtk-spmi-pmic.c
> new file mode 100644
> index 000000000000..512b53bdb0d1
> --- /dev/null
> +++ b/drivers/mfd/mtk-spmi-pmic.c
> [...]
> +
> +static int mtk_spmi_pmic_irq_xlate(struct irq_domain *d, struct device_n=
ode *ctrlr,
> +				  const u32 *intspec, unsigned int intsize,
> +				  unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +	struct mtk_spmi_pmic *pmic =3D d->host_data;
> +	struct device *dev =3D pmic->dev;
> +	struct irq_fwspec fwspec;
> +
> +	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
> +	if (WARN_ON(fwspec.param_count < 3))
> +		return -EINVAL;

What's the point of fwspec here? The caller in
irqdomain.c::irq_domain_translate has an fwspec, converts it to an
of_node with the intsize/intspec args, then passes it to this function,
which builds it back into an fwspec just to check fwspec.param_count,
which is equal intsize.

fwspec is then never used again.

Just check intsize instead, it's precisely that value.

spmi-mtk-pmif.c::mtk_spmi_rcs_irq_xlate does the same thing, which also
seems pointless.

> +
> +	/*
> +	 * The IRQ number in intspec[0] is ignored on purpose here!
> +	 *
> +	 * This is because of how at least the first revision of the SPMI 2.0
> +	 * controller works in MediaTek SoCs: the controller will raise an
> +	 * interrupt for each SID (but doesn't know the details!), and the
> +	 * specific IRQ number that got raised must be read from the PMIC or
> +	 * its sub-device driver.
> +	 * It's possible that this will change in the future with a newer
> +	 * revision of the SPMI controller, and this is why the devicetree
> +	 * holds the full intspec.
> +	 */
> +	*out_hwirq =3D intspec[1];
> +	*out_type =3D intspec[2] & IRQ_TYPE_SENSE_MASK;
> +
> +	dev_dbg(dev, "Found device IRQ %u chained from SPMI IRQ %x (map: 0x%lx)=
\n",
> +		intspec[1], intspec[0], *out_hwirq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops mtk_spmi_pmic_irq_domain_ops =3D {
> +	.map =3D mtk_spmi_pmic_irq_domain_map,
> +	.xlate =3D mtk_spmi_pmic_irq_xlate,
> +};
> +
> [...]

Kind regards,
Nicolas Frattaroli





