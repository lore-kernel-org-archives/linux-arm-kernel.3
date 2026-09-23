Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C82C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RV1NtqO516Apv2E+ZHJwj1viG7WQSDMwoxKdXtbB6o=; b=ilrlUoL3N+s2oPJgIHScDjEESu
	FceUhW7R0sAG8TCLYKR15SoFBnGS2Oor3hmCntSnC4g+dlfKgybRaSYoPWvlPhCE6fdCdgy+h/mLr
	L1xW2VKL0xHqo/Sjhh/w3rOn+vwEbICnrKbyrF3geaMONahN2Uo48Q3oi2y+nXPJ2McgGfcE2BWC1
	AwR93XabH+FE3Z7lZOKaFLvfLtFM7ZsvujOXYKBHaNRqV8tUlqJxosJQy49hwmSy9e9J3Ve3KhsQQ
	kvuzhtH4Da8eKYDnax+Vhr25eiReUR+8t1U29d2wZjbuEk6tOvu1LwaOA2aO57XX6MK1Th99Iq+Za
	Eie92RVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Il0-00000007cbL-1Bq0;
	Wed, 23 Sep 2026 08:55:14 +0000
Received: from mail-106104.protonmail.ch ([79.135.106.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ikw-00000007cZe-3tRk;
	Wed, 23 Sep 2026 08:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790153705; x=1790412905;
	bh=+RV1NtqO516Apv2E+ZHJwj1viG7WQSDMwoxKdXtbB6o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TddZoA5a2tvh6qDgOx31P0FId/1ImmOvUijMw4UcdlZAxbIKMlwSSkPacNUyYp7su
	 4GC0alVCait4/DHOVWKKBglFKI3rhy9tEaxAKE2QPLIeIOYAMyjgqrF4AE4/7IksDy
	 E5c6JVh0l9ydPMBaafkBTCCwXo1NSJelsyWOLyeKQIz/Cu9JUbk+KS622BJzId+T3i
	 OLn+M69WHww1/Vh23eUvxCjFpY7DAPIN2KO5owmJqSf8tveTkVIIDzIYgMxgwLaJ08
	 NzW+wXxC1RGgnttWbwQ0JGg+yWbBCl/p6oyZ1tpvwkFMgbxPHlJJCCixlXJDt789Lx
	 3hl+C5He5SH0Q==
Date: Wed, 23 Sep 2026 08:55:01 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] cpufreq: mediatek: add support for CPU speedbin
Message-ID: <wJbd2H75Mz4krM43MhNiVFaZUbIFOf9VaWE1d_3svO1Vwk6_da6fdLG8kp7T2rDjyLkI6mmY6avYGuhJVWjYeqvoKDmCn0_3a9kCdDFQUoE=@protonmail.com>
In-Reply-To: <c4908f1a-878c-4958-aaac-9960aae11879@collabora.com>
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com> <20260923-6572-cpufreq-v1-1-41f7af6d6d1a@protonmail.com> <c4908f1a-878c-4958-aaac-9960aae11879@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: a1dd8bb99c550ed6bf477e6127df214386284e9e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015511_150337_B9BB7E3D 
X-CRM114-Status: GOOD (  26.52  )
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

Hi Angelo,

On Wednesday, September 23rd, 2026 at 11:31 AM, AngeloGioacchino Del Regno =
<angelogioacchino.delregno@collabora.com> wrote:

> On 9/23/26 09:23, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > MediaTek SoCs are often released under the same marketing name, but wit=
h
> > different suffix for the speedbin. For example, mt6572m has 1 GHz limit=
,
> > mt6572a - 1.2 GHz, mt6572w - 1.4 GHz.
> >
> > Add code to support per-cluster 'opp-supported-hw' property. The DT is
> > expected to pass a CPU speedbin using standard 'nvmem-cells' property
> > under the CPU node.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/cpufreq/mediatek-cpufreq.c | 50 +++++++++++++++++++++++++++++=
+++++++--
> >   1 file changed, 48 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/media=
tek-cpufreq.c
> > index 052ca7cd2f4f..f15135b2898b 100644
> > --- a/drivers/cpufreq/mediatek-cpufreq.c
> > +++ b/drivers/cpufreq/mediatek-cpufreq.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/cpumask.h>
> >   #include <linux/minmax.h>
> >   #include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> >   #include <linux/of.h>
> >   #include <linux/of_platform.h>
> >   #include <linux/platform_device.h>
> > @@ -57,6 +58,7 @@ struct mtk_cpu_dvfs_info {
> >   =09const struct mtk_cpufreq_platform_data *soc_data;
> >   =09int vtrack_max;
> >   =09bool ccifreq_bound;
> > +=09int opp_token;
> >   };
> >
> >   static struct platform_device *cpufreq_pdev;
> > @@ -381,6 +383,38 @@ static struct device *of_get_cci(struct device *cp=
u_dev)
> >   =09return &pdev->dev;
> >   }
> >
> > +static int mtk_cpu_parse_speedbin(struct mtk_cpu_dvfs_info *info, int =
cpu)
> > +{
> > +=09struct device *cpu_dev =3D get_cpu_device(cpu);
> > +=09struct dev_pm_opp_config config =3D {};
> > +=09u32 val, opp_hw_ver;
> > +=09int ret;
> > +
> > +=09ret =3D nvmem_cell_read_variable_le_u32(cpu_dev, "speed_grade", &va=
l);
>=20
> Let's keep consistency with cell names: for example, on the GPU side, the=
 node
> in devicetree is called "gpu-speedbin@1234", and the panfrost node has
>=20
> nvmem-cells =3D <&gpu_speedbin>;
> nvmem-cell-names =3D "speed-bin";
>=20
> Check MT8186 and MT8188 devicetrees ;-)

Not sure if it works like that. speed_grade comes from the arm/cpus.yaml.
Indeed I'd prefer some other name, but this means either modifying cpus.yam=
l
schema or making something like qcom's custom opp table binding.

>=20
> > +=09if (ret) {
> > +=09=09if (ret =3D=3D -ENOENT)
>=20
> if (ret !=3D -ENOENT && ret !=3D -EOPNOTSUPP)

Ack.

>=20
> > +=09=09=09/* speedbin is optional */
> > +=09=09=09return 0;
> > +=09=09return dev_err_probe(cpu_dev, ret, "cpu%d: failed to read speedb=
in\n", cpu);
> > +=09}
> > +
> > +=09/* Convert the raw value to a bitmask */
> > +=09if (val >=3D 32)
> > +=09=09return dev_err_probe(cpu_dev, -EINVAL,
> > +=09=09=09=09     "cpu%d: invalid speedbin value %u\n", cpu, val);
> > +=09opp_hw_ver =3D BIT(val);
>=20
> If you look at nvmem/mtk-efuse.c there is a mtk_efuse_gpu_speedbin_pp() f=
unction
> that is doing (almost) *exactly* what you're doing here.
>=20
> Check if the same constraints as GPU speed binning applies to the CPU: if=
 they do,
> just allow "cpu-speedbin" as node name in the fixup function, otherwise a=
dd a new
> post processing function for the CPU and act accordingly.

...right. Should this go as separate nvmem patch or include it in this
series?

>=20
> > +
> > +=09config.supported_hw =3D &opp_hw_ver;
> > +=09config.supported_hw_count =3D 1;
> > +
> > +=09info->opp_token =3D dev_pm_opp_set_config(cpu_dev, &config);
>=20
> It's way easier if you use
>=20
> devm_pm_opp_set_supported_hw(dev, &opp_hw_ver, 1);

Ack

Best regards,
Roman

