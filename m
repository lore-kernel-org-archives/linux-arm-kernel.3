Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E81CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDznzImR+9b+XJTCIZr9Pz79SZTSLcqvoXZNw6/wWNE=; b=oOxnQDA/3vKInh30H88SoHvqis
	ij4PTkVeJKF2M7DD7quox8aVfT0SCfTP8VM7TTQEkn0OQu/7283WBMRxNHVuy42/9hp5aRyLSf+nq
	Yf7+9efkeiec8t/d0v1sz3Dga/yi05CZjraifPnDxT2x/7oZgxbn2MJvMcDGzCt2e5Y9o5I86p8h+
	ObINhDVOsLdLAIeGp17MN2wRwdLTmk+iVCcZ10LX/abKJWb5WPpOuiPnC9O9RxRMSQ798lZs/FHQe
	kgHrFk7h0PueMr+h33XbTIlEB1JyevmsFY2jX9yD760DXGPXgJHDVHmq80PWInuNkNib0XJZ8KisD
	7xQ0HW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMKf-00000007jCd-1xj6;
	Wed, 24 Jun 2026 12:03:53 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMKc-00000007jBu-2X4O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782302573; x=1782907373; i=markus.elfring@web.de;
	bh=jDznzImR+9b+XJTCIZr9Pz79SZTSLcqvoXZNw6/wWNE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=R8Ycllx8bdq+1zQDKilLGFMHnqhXHW5xjtWjqlLE0txqOmRqkrzm3xf6jHu04tZT
	 fwpNvwqD3mfFANfIFueVxfaJkiQU99udlcWa/XiUXGiv1L+js47qYH4oP73KgIb15
	 XrGBf5uPhW9vbRDp36kR4wgCqWIgqdwSRNtufRufcEbsvr2o6QLvQu9VhF62caHsN
	 W7S8sDTc3ZVMIQF38kHEYkK29VeGjV+UpVHilDnq8LQ/nfo5AYeI2zm7unZrdPR9Y
	 Bt7VoitgvdTKtf+Nuaiv55fAqOO58c2aaRr3BVVYWuwfaWw8PXe23P+FSAP5UN6Tk
	 xo3EvoyzhiTP6WKCGw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mi53D-1x6lG02cjZ-00fhb0; Wed, 24
 Jun 2026 14:02:53 +0200
Message-ID: <e78c2122-d10b-41ce-af94-45f573306c43@web.de>
Date: Wed, 24 Jun 2026 14:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: YH Chung <yh_chung@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maciej Lawniczak <maciej.lawniczak@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
Subject: Re: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iJdliJcoGoSfPjjLZqKkVQPJNk+J6tQaDz1aQeOEtjoksIFcv9a
 aEub8HGMj5q6p+CAQ2e95cuuJUIy7JfJ0nlDbhRd8X45gnHAIF6uPY2VNuqm/u1uOVGgR+x
 HVWcn9k48hfuf19rAEcX0mrpDECHtW881JXd5evMqPuXk4K7UdM+aohu3CBhtvQEMyV7qH1
 /xpNq4TIZTk43L4UwV1mQ==
UI-OutboundReport: notjunk:1;M01:P0:O0OBJ9kjPg0=;Qk2lZVwnip2sfQuFMrD643G2UMF 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_050351_041008_93B2CCB7 
X-CRM114-Status: UNSURE (   6.57  )
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
> +++ b/drivers/soc/aspeed/espi/aspeed-espi-comm.h
> @@ -0,0 +1,62 @@
=E2=80=A6
> +/*
> + * eSPI cycle type encoding
> + *
> + * Section 5.1 Cycle Types and Packet Format,
> + * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
> + */
> +#define ESPI_FLASH_READ			0x00
> +#define ESPI_FLASH_WRITE		0x01
> +#define ESPI_FLASH_ERASE		0x02
=E2=80=A6

How do you think about to use an enumeration for such data?
https://en.wikipedia.org/wiki/Enumerated_type#C_and_syntactically_similar_=
languages

Regards,
Markus

