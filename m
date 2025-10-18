Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13374CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cn18gVEv8LUVX5SOWaN3l+0XFDVqIgAa7PHNiyYdPz4=; b=DKeznzKdMbIdXdG/opZD27pbJ1
	NtXKtgWT4K1NhMlHs3uOk6xVy97TtKnjsI6weF+bXu1qnr8CeZwbKgN7Aud8AVhvj7vHrmDvGndMU
	9cHvtBcBgou6q97k7IVVYAaSjb/QnhOEqrz2Ql1VOrueKEbi7P7u9DrbNUd0Dmvvjgu9x1Ixmisd8
	Fx8czdOUzFRyM4AWQWBfjrGA5lWu2p7adFmPsWB3x5br60x22TJSAhVKDPzlFiHN7JchGbK72W6vl
	ftbeRuUQgdjSbW9tjfcQCb9ihCh4aL7j6WpqQgr9uxSjWKZpLIMPeJhcQjkk6xODawXmcsYMjixp5
	3IBvPIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA4PD-00000009ot0-3ACF;
	Sat, 18 Oct 2025 10:43:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA4PC-00000009osq-1mxG
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 18 Oct 2025 10:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cn18gVEv8LUVX5SOWaN3l+0XFDVqIgAa7PHNiyYdPz4=; b=l6YsguApyMZm+hA3k1pQedX/5F
	viJkWw0n7brNfEHSKZkWWUAGtExbx2T5dBXe6d/hAS/8nrzbntFRibxhJTe0tufIH5ihj9V1pUXNL
	AeTj4ygFWK/du3EwGR79wjU65tZB4I+R9IwmwkwdXQuu6Jv+vnoK4CPFa/77+H56QejxKQa9y5nSX
	dFORpv9shWJ2QfUFAE3SBGnwpG5dX4Y0jxbPqkp5v98q2oX1ePnNnGVRAmpARgluUSvW2VFH/taH+
	3hzn/jl+iUICoCjYdhAuOPksHn8WperGExLiv45kQQnpRk68uCQJCwRBjRhDYDCUQKrSW7rNlZDYx
	ZvTdWwlA==;
Received: from mout.web.de ([212.227.17.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA4Ov-00000008JUu-2umj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 10:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1760784177; x=1761388977; i=markus.elfring@web.de;
	bh=cn18gVEv8LUVX5SOWaN3l+0XFDVqIgAa7PHNiyYdPz4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AFB8Nax6FtWLuRVj+nsHEQ+z/ML7//Q0vDQUqhI6VyqI6415SForIroMBVO4ivex
	 4mAqTpih4R570kXovzbwxzQQfrS/KUREkRKTgoKRe4r+suL6xjle3WniE6Bneodx0
	 8zQrFwICbGMTCb7wQF0k9g9FfEbHRpb3DwjwxVB407n5BkvfySxqZFnnq3/UeqT+n
	 nqB5heu9+aL7L0ZHyo9pU5GhZEeM5/euoOm0e2UHzITZBDUsHtMCRyU83+NZf9Bd5
	 icVcdSncNFV9iyI/G1wBJzGNzCKLrsG/S+oQ42ZSieLi1qYGu56UkEinDavQCabub
	 yvTAgHDmVbHYUNyOFg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.233]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1uMLzo2bPx-011EfC; Sat, 18
 Oct 2025 12:42:57 +0200
Message-ID: <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
Date: Sat, 18 Oct 2025 12:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20251014113234.44418-2-linux.amoon@gmail.com>
 <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
 <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1lIM1h5WLjuYfsMemPwgtC/4pl1bjIrYBTed8hKPBz4TXvf6OQu
 6UNChvXyR7fIoOLzDg4PMaeZSAqWgCpzBCzlCtBLLMuuOd+Xy9FOQ4fToDJMt5F361wJ599
 7BsTRipmslb55SF0DIua1M0SzmlmyHBmolxoX3zdgcIo0/ncP0Qmjk7lK9B9dIsyS3GOR4T
 3kMBXhNj/6W2bdqPDkbdA==
UI-OutboundReport: notjunk:1;M01:P0:q3LJM0LNTFo=;wcDgREHGski+81RTw2KTX8OaFoA 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 ABUICcnqhgYJZg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_114306_412267_0ADA9E65 
X-CRM114-Status: UNSURE (   6.46  )
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

>> I propose to take another source code transformation approach better in=
to account.
>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L50=
31-L5075
>>
>> Example:
>> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller/=
cadence/pci-j721e.c#L444-L636
>>
>>         ret =3D dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie), =
"Failed to init phy\n");
>>         if (ret)
>>                 goto err_get_sync;
>>
> No, the correct code ensures that dev_err_probe() is only called when
> an actual error
> has occurred, providing a clear and accurate log entry. =E2=80=A6

Where do you see undesirable technical differences?

Regards,
Markus

