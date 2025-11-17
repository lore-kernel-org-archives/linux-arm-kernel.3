Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED899CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Rzi95j/ii3442LTjJt7qKRpPbd8pTuc9RoBcA9kf80=; b=UE2Qdx4pkVvzM94VE4XwTIxJYk
	jgPtcIOU5tQjUIOf0caqmG4o1Np+NHr1WtGrART7RvT9FZopo7IEKwVSKs/UQfilIr+9wvrUNlIxt
	iyd2yotGani3cYH2cbs0Yu9bOlpp6w4p9EFJcmwjABIpjnhULsgdTOsVhlckGsZQAI+n4XJI6znLd
	sfM59bJWLycUGFX6x8SenL8PCO07Z7dJygxq6fHogfN1T33lfcg4KgZr4KeJ9DoZ0ASIj+U7IQ4ra
	DIpatVxfjffOUmwByoF48oRrUAWCZc8LaPmiLyN0fiqRYwxoekALQLj5Z62kpe2wiGGNP8V3DtdwH
	zFF4Eumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Fe-0000000Gmwn-2o9d;
	Mon, 17 Nov 2025 19:51:02 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Fc-0000000GmwP-0lv3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763409044; x=1764013844; i=markus.elfring@web.de;
	bh=/Rzi95j/ii3442LTjJt7qKRpPbd8pTuc9RoBcA9kf80=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kLByB0B1QMppmmYnii1l+vzb5IazEFn+63VzewqVXInT2xgCRlotLinQhJh5rLLt
	 QLhIxV66iSzKOveXkG035r9VjSXp+n+QPN4+iHdjYLj0yYmjfkT9302LY72+S5Ny0
	 5Hof9jb4uW5F4RWdbIjnJ35pkeQUuE6bXbepNeZhhp1of7prhnRlxsglW+GDwY0UK
	 Oon8xMk5cYZLVjXbKJvYyhLiiGAZkwtZA9pLl/g/DDjYvPtzrCZBgPVh2gyoqspFa
	 CzS2MMMuogO22Dq2hPvZhqs2LUUins93qYAVFP/3C3D0bcw2EknPrreJppeykh/He
	 zRpfSScPtoT9yIEhuw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.218]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mt8gP-1w9Syj2r05-0159sU; Mon, 17
 Nov 2025 20:50:44 +0100
Message-ID: <a5306f5a-92b0-437d-b384-40863fbed6d8@web.de>
Date: Mon, 17 Nov 2025 20:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Amit Singh Tomar <amitsinght@marvell.com>,
 Baisheng Gao <baisheng.gao@unisoc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
 David Hildenbrand <david@redhat.com>, Drew Fustini <dfustini@baylibre.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Gavin Shan <gshan@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, Jamie Iles <quic_jiles@quicinc.com>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Koba Ko <kobak@nvidia.com>,
 Len Brown <lenb@kernel.org>, Linu Cherian <lcherian@marvell.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Newman <peternewman@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Will Deacon <will@kernel.org>, Xin Hao <xhao@linux.alibaba.com>,
 Zeng Heng <zengheng4@huawei.com>
References: <20251117170014.4113754-11-ben.horgan@arm.com>
Subject: Re: [PATCH v5 10/34] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251117170014.4113754-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A2dlYlgnzV5SDjKzeDedg66tdw1Uv3ideeCIl65EUdbfBaJGhEw
 +X+Uwub3iTzAHJJfI/uC0WO3yy+SEhgkxqbx45WnP87SggGoX1scC4+F/YJBJD/i/RLdNfU
 N2DeoBv2q47PAaialipUz3/Y5T1SiuEF2S4FqKzZDCa93tCIwbXSA+r4We2fI1qnbellFOe
 St30GhaTVkdgKbJboHgmg==
UI-OutboundReport: notjunk:1;M01:P0:f+fTHHIJ/hw=;RN6IAv8RsmLFMellpHwHGUy3PQ0 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_115100_602685_FC976170 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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

=E2=80=A6
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -0,0 +1,190 @@
=E2=80=A6
> +static int mpam_msc_drv_probe(struct platform_device *pdev)
> +{
=E2=80=A6
> +	mutex_lock(&mpam_list_lock);
> +	msc =3D do_mpam_msc_drv_probe(pdev);
> +	mutex_unlock(&mpam_list_lock);
=E2=80=A6

Does anything hinder you to integrate statements like =E2=80=9Cguard(mutex=
)(&mpam_list_lock);=E2=80=9D here?
https://elixir.bootlin.com/linux/v6.18-rc6/source/include/linux/mutex.h#L2=
28

Regards,
Markus

