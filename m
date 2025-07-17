Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V01+KF8a9IHAJvE8BewLO6ClnfFMhIiJ6ZeATdljIkw=; b=KBwE5UXwLtO97fj3OEtstMmVN+
	IBW2KfF//JUWycpSywfabdm2BdIUxxrfVt8e5PPwnbmlUPwYMWUZK1nz0mjkmduobsi4SCLPVSt8+
	SeBWWHpxSye7LZTYQhHvb+pKFnLPucFPG85f94wJFj8Fz2Pm7NrowTGzl0ronenIAP+POWKrZzXnT
	WKsdKXiZph1k1vTZc1BRqvOcIMsMxv1QJJRK1xm80LI3EQAgehcxPSyYUJtS1NIvTwNDdy3a6JZT6
	cgdsXrP5dRvYAgF4WbJxjvsxeQhSB4tTGoDMcuTLPH2IBh8KzhSQ2+0ghOtub+VWDQH5eEDjYK4tJ
	HbkwIUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOKR-0000000ADO0-0brH;
	Thu, 17 Jul 2025 13:07:15 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN3b-0000000A0Ts-3Ca8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 11:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752752714; x=1753357514; i=markus.elfring@web.de;
	bh=V01+KF8a9IHAJvE8BewLO6ClnfFMhIiJ6ZeATdljIkw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=da74g/1GtCU5ta03o36d5OUgayZPsRSrtDJXZIZ+FhVJFWp1qSxOIE+Bkqr5EIGQ
	 GjwCWb5zoeSTJIdKliW7T8kEhTGFDAtDsdnHqPRIR5Q+Brk5prLZMQG4jbWHA+oh6
	 1g6HMkBFWpY0C4POGh1f4jhAmVApYtvcYygg6CGrPK5ISiUcbj/7ksTItWvfduk7m
	 qTL7m0dDCBrR8tVUWCGTazRj/RSp0sWerzX8VJ0VYfiPgX/+88EK5MztdgYZtE3fi
	 8OjHSKFKdK1i5WdsFD67r9IJGcznbUx7008XRbkKUtQbZ2giZ6AjIpUj5IIPB4oSt
	 HSaCWOygel8dIAc1Tg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.185]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXoYQ-1u6OqD3a4C-00PVS3; Thu, 17
 Jul 2025 13:45:13 +0200
Message-ID: <9193ef71-72b6-4946-a830-14fbbc786658@web.de>
Date: Thu, 17 Jul 2025 13:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Toan Le <toan@os.amperecomputing.com>
References: <20250708173404.1278635-12-maz@kernel.org>
Subject: Re: [PATCH v2 11/13] PCI: xgene-msi: Probe as a standard platform
 driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250708173404.1278635-12-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZS5exfGNy6KtdZVO/OQDO62VlMiktUHS7WcHUisLbXD81vNhEp3
 /Rxe6amp2XFgBRilgLdDPRSUd69OI5FSHF/N8zLnb15kF2QYY83PZvsICD3t5hZcIQ7Ytuq
 z6CfiMWMZF6YSKkm/VFHKroSQjtbj8GdoL9oCMnpzvKse3ax4RaivAL+vccbXflWmjy5O2V
 eEYgdLQ6VufuuP+noJ17g==
UI-OutboundReport: notjunk:1;M01:P0:QmdD5IpOxaI=;BjyUsHmV6ZDWUJ5skvw1xKTeOPU
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_044548_107021_AF96AAC5 
X-CRM114-Status: UNSURE (   4.01  )
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

> Now that we have made the dependedncy between the PCI driver and
=E2=80=A6

                            dependency?

Regards,
Markus

