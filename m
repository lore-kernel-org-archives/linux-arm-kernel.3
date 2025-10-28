Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B32CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdIRR0gXLsfY+ml4e6FTsMbQ2ZMNFqfdd/SP4uiFbHQ=; b=MgGmj17agcdQKrFITJTnMhsgvD
	Em+rNbuw2UGmsovkpsr6OrrvZnlPrD5kqFtD/leQc0DDLZoVHFDEG4S8lvlq+ktp5zavHmJYvjEgm
	FfilavUVoMUCiYdlOtPhQzdAuy6RoP2WEB4qcz3qPvNamHnUTRryGxFHWkkRsGZ2+aSXSRXgx2XZZ
	hzTsQFqEV0fX2vHqfSBhhtWBMIXAyfLlUF/vLqo4AhP7i+Ltbq+86K+CL8cmtCWcHpGueZg5UC1uM
	SPWBtO5sYpbteglgK7oQDZyBepnOP3MHHEWDCg29pTGX4xL7mIYtlV7i5s+OlQJ/TwQTi9vMQi8qS
	uuC9/z5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpqO-0000000GZzj-3N3H;
	Tue, 28 Oct 2025 19:59:00 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpqL-0000000GZzK-3sYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 19:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761681530; x=1762286330; i=markus.elfring@web.de;
	bh=vdIRR0gXLsfY+ml4e6FTsMbQ2ZMNFqfdd/SP4uiFbHQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QEaoSiPP636YYOq6d88ShbND4a30gRXnYrWtdwAWa5M6Wz6UvLwF8X584yhH8O12
	 4nZ5s6d5EeCSEvk99XBlG6zeihRtzrs65iHMpvlBmnKrnTHDilslPdGnMRfBV1FP/
	 dkQavOrozDi5HJ60j1iNUgMtg5hYzaOsOO7ImiDfCHp3mPHN3bfQNJyyc5Bsdyiyg
	 AKYXuie4X4YY2/l0k7MwK4p9ftwDUhWx9MzOvSw0x5W6TqRIp06wxBtzdsDM0t0xC
	 iUHt4cl9EUx8LxA6kAC1xEXYPSdSWrNRxwvyohAI/AfXaZgSE8Xbo0zFBswcXhrY+
	 Uiq+oomAhj9XCiS+bg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.187]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N5CQT-1wEQwR18aL-00vyJ0; Tue, 28
 Oct 2025 20:58:50 +0100
Message-ID: <e6c75370-b127-4b41-8aef-e5012150ec94@web.de>
Date: Tue, 28 Oct 2025 20:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v? 2/2] PCI: j721e: Use inline reset GPIO assignment and
 drop local variable
To: Anand Moon <linux.amoon@gmail.com>, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
 <20251028154229.6774-3-linux.amoon@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251028154229.6774-3-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:flSGfgFEBOxbSY1So0TI+gtIAxqlRfdGBuByOYvGGECjWy8/VDB
 zo3R/pCdXPN1mIzcxFZQA819z1SjecdZcI8drNpMT39Z1SunQGD5jWDrdY8kTi3T4pS9Pgr
 p6I7aQr1a2N1n6KyqhiL5UCNWV7Wwp6YbS/Ccn9FfwtbM/+i6GzCJy1L+Uk3PEDmUDNr66u
 MHA6r5AwylJdMs3juvp1w==
UI-OutboundReport: notjunk:1;M01:P0:mZvD4arytxA=;wCyUmGLHaeE9Sh5y+7jyCoOiYPp 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_125858_265474_419091A3 
X-CRM114-Status: UNSURE (   3.92  )
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

=E2=80=A6> Thus removes a superfluous local variable, which simplifies con=
trol flow

       remove?                               Simplify?


> and improves code clarity without affecting functional behavior.

      improve?


Regards,
Markus

