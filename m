Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1715BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OcPZ0Ucw1okByzNGmf7IO+mBf7QUuTP6TAjK8en5rw=; b=bmSQW6Gzb0ygNg/Dm8hp1CTvxY
	NmKTb2UZF4OkLbvTv9Y/tMFAdUPArUrapysGU9pNenn9RYMefyld9UachHX+h+c3p9taUTzmq9ya9
	K/mRWHt4JMC8NDKR1pObcpf/jjKmUnzwLCMLM9MKpXl4qE8IO7Bu0H3X6X74nDuHaNlVDOrIFbsng
	75jSKZZiy2bICP3ok6tlfrPHMNTWrPCAO9Ep7A7WRUC+8w35Ax9ghuEsfGYuCy28cvsfZXmgGg1DJ
	ou4IqcHWTZc3UXVnjJWskYU+ERWQKvVJ8ViQcuwWT7MlsK8FCOI8FFDfwHCMYJlC1Pziz421LRx/7
	qVPj0HBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO8L-0000000AAqQ-35hh;
	Thu, 17 Jul 2025 12:54:45 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMjZ-00000009yQU-0YFk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 11:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752751498; x=1753356298; i=markus.elfring@web.de;
	bh=8OcPZ0Ucw1okByzNGmf7IO+mBf7QUuTP6TAjK8en5rw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JRBirgXZoqHs7ciKoNImLi5fWfh040hoVidCtoyw7bfo0YpnUyoc5mRg/t1M4qGz
	 47bnJr9RNYBGdQH66Y9zI2CyYoR5Q0onmFRs/mAGq7Q2JDPWzguSHOy3VQvYTXAYH
	 C/hF1HmD4KJy5Ey7KJju4zC+t4DrFwrrv7h2eYgjK6+MhLI6JFsoAvl8XOuRsrso2
	 dpd5nhMOy40yN32CitPJEPKXeiTVtnZ6oFghlG5f4fuO9j/RiKuYvxA5gyqJlCLNt
	 BFzC18ft3viZkmHS99vfgQFrWnFF8K2hppa5MDGBOSf+SSKIZuIplH2+1Up9Ss9r4
	 nDiXUZG8j+HRwDEARg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.185]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8kAN-1uYDs032o5-00EyOC; Thu, 17
 Jul 2025 13:24:57 +0200
Message-ID: <fe0d27b2-cc86-4681-b089-b214afbbd3fc@web.de>
Date: Thu, 17 Jul 2025 13:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Toan Le <toan@os.amperecomputing.com>
References: <20250708173404.1278635-7-maz@kernel.org>
Subject: Re: [PATCH v2 06/13] PCI: xgene-msi: Drop superfluous fields from
 xgene_msi structure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250708173404.1278635-7-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FgQynEO40w9zI3vDeDUCbwgqIxMItoKDVDQm4BSC3xqahQfs1Zk
 nbQ+37U9hYGSSCcrHfGt5XPJycP9qZi+0hXezt0JQCAxiVmQqO/9KQpeG8VFL1XJe0VAeLW
 dMwwsmuhfGxZB1Ov8rmspCQ8eF7Y/oIrRDoFfkY9Op73xyl+juCJcg273FcGrWyc+GjHTCH
 FfvEPpOEOYUvA6xSVFtGg==
UI-OutboundReport: notjunk:1;M01:P0:AeAtWUZA79U=;q+ItQTMz043vZWcIX4O0CV2z6CD
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_042505_473755_915CB66E 
X-CRM114-Status: UNSURE (   4.45  )
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
> +++ b/drivers/pci/controller/pci-xgene-msi.c
=E2=80=A6
> @@ -214,7 +212,7 @@ static void xgene_irq_domain_free(struct irq_domain =
*domain,
>  	mutex_lock(&msi->bitmap_lock);
> =20
>  	hwirq =3D hwirq_to_canonical_hwirq(d->hwirq);
> -	bitmap_clear(msi->bitmap, hwirq, msi->num_cpus);
> +	bitmap_clear(msi->bitmap, hwirq, num_possible_cpus());
> =20
>  	mutex_unlock(&msi->bitmap_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&msi->bitmap_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.16-rc6/source/include/linux/mutex.h#L2=
25

Regards,
Markus

