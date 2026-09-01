Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5A5C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVSTupzsKDeKcaOCfLgTue1jYvMasSEVlpq2JV9+6jU=; b=hLM8eNkb3jFh4ruM8akzAZR4d1
	msG5eVDPOZeyEJyxH0VHJmy6UJyL1tybZFXV5j7Ic5yHUVikzFinFa+w1j/1scrJj7073nxVTWZlD
	cZI3Q6iTWBILmaLj0Syjfv0IZ1igltVKom/mOU9V9lB36d3V7ysd3jA6BE/fglvgehcCEv4k/8IC6
	vIUJFqf31WTjY9wCxx0OQDlFWFeSDRGHyok4c5vTpLURExA4g2Or1wlfqjCNbbZBB0xBH46EvMsR1
	SMLVUZc9sj4rfKJUhomPylBnPP+luZ1BNhHZKdPJi0ms//mXtg5USExK8ljzEBtxjJbYX0KF4UAvR
	5k1D96mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KOc-0000000BMb1-0iTG;
	Tue, 01 Sep 2026 09:03:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KOY-0000000BMZr-21fY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:03:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A5FA1A1932;
	Tue,  1 Sep 2026 09:03:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9DBB6053C;
	Tue,  1 Sep 2026 09:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D87A811C78AAE;
	Tue,  1 Sep 2026 11:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788253381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dVSTupzsKDeKcaOCfLgTue1jYvMasSEVlpq2JV9+6jU=;
	b=MJWBBoD56GD1gKMxyfsPWLPEUcE9vRgAYgIRAzg6cwJmDCdtzke3j7KuygdQYD6AU8JGr2
	GKaqslm1ZTFs7QX6di7xfUjopH+ur8ijdXPU+7mUuK2qP20jf7QVXnuGj49QQfQ66R9gca
	erGt/XmynmF26FIUFylqf9oX93o85jP7XixnI2CREKpsQMDfxrPz0P3o6UCQU4sJhxTbKp
	kTogl93s2G648lT1wsMR3IqLntJDyzoGI6/F6E94dNQcA4iXw5rzr7e7v7KOm8wRDNcb6D
	JNUCnN9+S3v2NQdc9/dqN1pOuR6iAm9gowwws49ZVMJLRqPs3htZL0sZIQTOqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
In-Reply-To: <DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 11:46:14 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
	<DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 01 Sep 2026 11:02:56 +0200
Message-ID: <87qzjd8htr.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020306_662262_9F5894D6 
X-CRM114-Status: UNSURE (   9.76  )
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

Hello,

>> +static const struct spi_nor_fixups winbond_nor_partname_fixups =3D {
>> +	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
>> +};
>> +
>> +static bool is_w25qxxrv(const struct spi_nor *nor)
>> +{
>> +	struct sfdp_header *sfdp_h =3D (struct sfdp_header *)nor->sfdp->dwords;
>
> nitpick, spi_nor_sfdp_get_header()?

Yup.

>> +	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
>> +	 *
>> +	 * Chips are very similar, W25QxxRV brings mostly performance and power
>> +	 * consumption improvements. The RV family does not require the multi
>> +	 * die fixup.
>> +	 *
>> +	 * They can be distinguished based on their SFDP minor revision:
>> +	 * W25QxxJV:        JESD216A, minor revision =3D=3D 05h
>> +	 * W25Q512/01/02JV: JESD216B, minor revision =3D=3D 06h
>> +	 * W25QxxRV:        JESD216F, minor revision >=3D 0Ah
>> +	 */
>> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
>> +}
>> +
>> +static bool winbond_jv_match(const struct spi_nor *nor)
>> +{
>> +	return !nor->sfdp || !is_w25qxxrv(nor);
>
> So how do we know if nor->sfdp is already there for a given fixup.
> Without having looked at the code, there could potentially be fixups
> before SFDP is parsed (and the nor->sfdp is populated), right? Might
> be worth to be mentioned somewhere.

You are right, it is worth mentioning. In practice only default_init()
is too early.

Thanks,
Miqu=C3=A8l

