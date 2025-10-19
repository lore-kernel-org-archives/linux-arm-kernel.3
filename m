Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF0FCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 17:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/nsvhglHKGLgE5m2owBDC86h0qZvLVX6ICR4qKSu14=; b=dTVF1jmst6+r3WEQy+akipGUAM
	S579qpcFAVW19i4Iv4pdL0v29i3s7bnTx2agSNJPjgfxEiu/giNNYCzaPVLmRD86x8bY0F/W/XpYd
	PkRDTsYI1CupeCok0xriaS12Gfuv3lFWjpad2lniG0f2EkSQG9slqDe4Ou4zy25F1nJFT6h6paDm5
	1Kmt5SA8tHX1doKh94fPvL3+dOQ5DeVHzIaXEIW2ndLB3Tas/TH/zLMBx6AVmDXM6v6Pbr9HEMzWv
	PSjQz+Osm6jD/tTxO3oqzOCG9PtRj7HpgzjZxZophpbjNKUK3ThcPDlQiAy2Wp8Osxu7xMBLcp5H/
	4HODgGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWyP-0000000BF1g-0d0Q;
	Sun, 19 Oct 2025 17:13:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWyN-0000000BF1I-1W3g
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 19 Oct 2025 17:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2/nsvhglHKGLgE5m2owBDC86h0qZvLVX6ICR4qKSu14=; b=V3VUYkCIzFfIVPQOBl9Np/ulzz
	csJaVknCtHSAxahwF5FnecbKi15svupf7ZjYv2e+ZVl/+d8Dyi3exphUbyM5i97aV0C4FJMmg5l3V
	NGvmkOXSEfqePwyiE6cL3jZrqHzs1kRySUjX+GITUK5eiEU6XHGb2tnPCF9GZJoGHP84iow44Ph6G
	wm6RNQo3g7obTWZLMbXhcavyg97k9iXad4iszCMnARJF9+ea4WthTFtf0284AUWwM5NKRjBWO7VgD
	QHOTkymRcCNXvuYyGvjXB0iVKySNMqUqAuHfJl7VjJao1Mx41Dr1qc+Y+WFVdu7hQItpJgkTprz1Q
	5FgJm3Xg==;
Received: from mout.web.de ([212.227.17.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWyH-00000009BEY-2KfG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 17:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760893985; x=1761498785; i=markus.elfring@web.de;
	bh=2/nsvhglHKGLgE5m2owBDC86h0qZvLVX6ICR4qKSu14=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KMQNfqs8Oq+hcrIKjnp5nS1uXZaSfp4P8B4kSvJiX6N/z2B0kX7NLYsRf+PRZ77s
	 MKNzt/i8jPWzZBNUxxDaLENYS9jKyTHZrsxOd6rBQBHodpSFVsBVwpWR2vGlbwvsV
	 Rdx4e2Qv45877c1ZtCuLZcwPypdY6pNitwH6AuobJQHrQdkfjXRExGDA+8GbezfH1
	 rpzohRREeQkdfxNfnNfpUgh142Zdv14AYcxP/ZqWJTj2DjUkvq5PHpv9dS8/OO6aj
	 kPV+a5CKnc5hQyq1SJp1rAOp8tlONVmIwn8RbUVVcZp1+2/nJQ+vqlORrSb70myYa
	 ZtJc2L3qkmXdbdSVSQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.180]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gbY-1u7JMB1tfm-00yA5J; Sun, 19
 Oct 2025 19:13:05 +0200
Message-ID: <a6de463a-6ebe-445f-bc06-32e74a8e5a66@web.de>
Date: Sun, 19 Oct 2025 19:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Anand Moon <linux.amoon@gmail.com>, kernel-janitors@vger.kernel.org
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <26975dab-9631-4661-aaf4-afa213104a13@wanadoo.fr>
Subject: Re: [1/3] PCI: j721e: Propagate dev_err_probe return value
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <26975dab-9631-4661-aaf4-afa213104a13@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r8HwqWYbZxus8y8tOlbmEE39V6Tk1oUKvw7AwUiMSY8yZMi2x1E
 ZfOWkd/4R/hczF/6SR0Z9xTxKxFrdE+59jSHjzFwZBsU5R/YPAjXJAVf5HpdOdtXLiv4t2o
 DeiBfuR0OicFooKwmI3eLChmze+NxsboUe/aE3Me0NgkbTdWln+sd5jha778zndLbkUxjgp
 NFc3P4tveXj/QDnPDAXNw==
UI-OutboundReport: notjunk:1;M01:P0:VNqRzb13YEI=;1EHcRGKETxQlU+QrRRaTgNutrUe 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 c01+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_181331_883777_34BA2E41 
X-CRM114-Status: UNSURE (   5.32  )
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

> > As Dan Carpenter pointed out - " Wait, no, this doesn't make sense.
> > It's just assigning ret to itself."
>=20
> Yes, Dan is right.

Would you become more interested in an other source code transformation?
https://lore.kernel.org/cocci/fe93e337-7d8e-4b82-b187-b5a67b627544@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2025-10/msg00020.html

Regards,
Markus

