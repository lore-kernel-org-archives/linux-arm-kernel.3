Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CBBD3B7F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Blme6XgEQkOt33/62FRieigeYk+tLe1AihTkO7s3Fxw=; b=erpyusGdFXSBZPu8iFJCqNHBJI
	e0wkt3t29BXwK5Dwe7J05/Mb1apIyopWwvYugjFswV3XUSz/TVgP3VxNWQuY2CbmplbaRJkXuc+aQ
	JYbgVTCE5pIFYNlnjuAk/veIcTJiPO+YGxU38hzhWS3khMAH38O1GPC/l9jGTGrpfyIsysYmU2EiJ
	lO6Y3Ntgdnx7gq8PuhdkUFGvquqBMaWxgUKMMqk81d3qxq8/QwOttVsyKxelIWhy8mRMZDY+/o1AG
	J5+3dpnvAWDjxdTnVIbDqWCSxmCL/URXbK5QkfZV3RhB/kUTSYcTZBp6O7+8ig1ALlDj1kh0fbVpe
	vLP0mD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdHL-0000000DFRW-16jC;
	Mon, 08 Dec 2025 15:35:59 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdHI-0000000DFQz-35Eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1765208152; x=1765812952; i=markus.elfring@web.de;
	bh=Blme6XgEQkOt33/62FRieigeYk+tLe1AihTkO7s3Fxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MMK8DB5CJqguA0Nv+BQCKmF9J1Z2jA4FlkjGtVbE+8Fr74ekQSCntLnZHL6WA4Pa
	 oH6eJdEEg6ycoCormXnJyRBlCtDTWktJOufrONaxMkRW5+ihTKwix4cfJ6kkTQCqR
	 aTNMgMTkUpmPkRf7gxRBixETtsiEhatRs2utQOaSH0sNfuUVRqMGzCjx8UE4kajem
	 VF4ZVhDHus/3/PEqvKIsUg5T0YtVahOdDVfSMhoPxzTXFIHInHC563YvG58Px3uX7
	 MSGDMvk8k6S5rtR6K/pzC48tPvetncI4c2oJJ97CCqZ6d1mQzGki5f9C8MP8yeMmW
	 Cj8iNr1SYa+WjzsvMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.237]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Meler-1w0sEX2BUb-00meyK; Mon, 08
 Dec 2025 16:35:52 +0100
Message-ID: <eaee9a11-bf8b-4f83-ac92-1d3a32eeb240@web.de>
Date: Mon, 8 Dec 2025 16:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251208094242.17821-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] pmdomain: imx: Fix reference count leak in
 imx_gpc_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251208094242.17821-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6nPzKeZkh6j3xytEpXlN0Uo0t+AZ6iwyJ6qLiQqh4pGLpsD8KLB
 /Undl/2mtFWgrn5zQpeq98HbiH8YF5tHSCqHwUN/myr/q449/Mx/bgHE1TZsBEiA+eW3dHY
 UAXU1v587WKGs43Ytv24TMsKICbCLLgkZG+iEq3/lZg3SswJluGPvEMypSnyPkAFZYsIoTv
 qYdkZIa2eiEn2xv3YWlcg==
UI-OutboundReport: notjunk:1;M01:P0:jxmKxt7unLs=;H4Ylet+lhbUAz0eebnFS1Fr3slG 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_073557_055820_86557446 
X-CRM114-Status: UNSURE (   5.61  )
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
> @@ -495,12 +501,17 @@ static int imx_gpc_probe(struct platform_device *p=
dev)
=E2=80=A6
>  	}
> =20
> +	of_node_put(pgc_node);
>  	return 0;
> +

A duplicate statement can be avoided here.

	ret =3D 0;


> +err_free:
> +	of_node_put(pgc_node);
> +	return ret;
>  }


Regards,
Markus

