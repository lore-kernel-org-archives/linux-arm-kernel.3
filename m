Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDED26D75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGTy2vclztsb08eZ/Mx65TVH3n6FkY3SE18DkLcR9ZQ=; b=0IchhFt7PBygaUARnyQrb64LeF
	19x73Ho1y6RbjvTP0K2gDCkZVKHFsqHuRp0DIZro25idl3uv+cmBZpWAgMRx/4qsim4Aii+3gwe0n
	ORQnP9Avu0WeT2T9bNMHgrEtqmRjPRN9mqwnWQEFCTfCLaCaG+1PnmGthfwwcMvxM3a3ndVptaCop
	OKhMovc9fVG1N3B2fFUGgGpiO5oxhwZk9FJwDGnY6cYLyCv78kLWT3QSAKAY7slQUCV+W3YeyiAB1
	MNVGbi6yqVEMLcAZFPCcQkBAAODwaKRmFlvIJxrbqrf2/XvqwpFenmqOEaVdL7AQ6G2GUdonOJXDe
	MdN1YUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFXD-00000002dag-1tjz;
	Fri, 09 Jan 2026 16:40:23 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFXA-00000002dZn-3Fju
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767976809; x=1768581609; i=markus.elfring@web.de;
	bh=kGTy2vclztsb08eZ/Mx65TVH3n6FkY3SE18DkLcR9ZQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NxN7+j0U4Kh44ipeCzDwVilKuBB7tRcwzdJu0+LGkMyNoadP9L6jHud9wTWo1E/t
	 uevwU4N8JSoACjDzqIkuQOWlnYtnDv+JWX6BjKdIWbPLkNbGk2PB3/D/H7z1Rirms
	 Nv1BG7Oja6IpJ5SMTfm9DoxmfFNJvWL+WJAzv6LzMIf5+yMQh6sHFx5qhWGXGKp/H
	 GSnVMwC6CWJq8onvBU71SACsE8kksNktnjehClOEJxsGo1uWwmQuirMMK94qL6f2z
	 TfSjZY/tVTjJoje/IDkTWmTMw4mOtPf7f1mv47XVQmnPCw5dfAPLxDZHE3noUGsB5
	 hNPoPV3jpxhWSIZtFw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.182]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnpKq-1wBuJn1c8w-00hMyo; Fri, 09
 Jan 2026 17:40:09 +0100
Message-ID: <2819dc88-51a5-44f5-bedb-6759e7786fb2@web.de>
Date: Fri, 9 Jan 2026 17:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-arm-kernel@lists.infradead.org,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260109152016.2449253-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] soc: ti: pruss: fix double free in
 pruss_clk_mux_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260109152016.2449253-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kpdgxq+G7zmryzJXfdUcm+HtPSAFZfWQua3uu3HjgXwLUmSAoHh
 l/5jtZ7mZg95ZLpek7+dfy4ly8yDB8T9kScw2rsNPMLk1UMYs3RcoYEs/fgjJv5Pjw03MSB
 /ply0IrQK5iH/u2q16WlJez9/TXZt434jYjNDbUTdOzJh5jFEYgmSwp9h7RRKayXSeSuCSA
 MBKfeFH6P68hVtLD3ByiA==
UI-OutboundReport: notjunk:1;M01:P0:XWkbCrlBA5k=;Z8eYmzYOWNHYt5WhlZUvMvRXKhB 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_084021_121796_6E7E9468 
X-CRM114-Status: UNSURE (   6.85  )
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
> +++ b/drivers/soc/ti/pruss.c
> @@ -368,10 +368,9 @@ static int pruss_clk_mux_setup(struct pruss *pruss,=
 struct clk *clk_mux,
>  				       clk_mux_np);
>  	if (ret) {
>  		dev_err(dev, "failed to add clkmux free action %d", ret);
> -		goto put_clk_mux_np;
>  	}

You may omit curly brackets here.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.19-rc4#n197


> =20
> -	return 0;
> +	return ret;
=E2=80=A6

Regards,
Markus

