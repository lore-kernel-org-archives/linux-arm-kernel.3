Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB45C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vrdSXW1mmp3zS/IFgwJNUwNIOlU9xB5BhTKmjF/3N0=; b=YvlCvfx8W2nE2SWDXUSr5ycvzM
	dot7y5bKSlzaWFppXCbHgU6qbIGjPfjlStmQ2nhg3cu2sgihMetASJdPEXKxAWzLroC/l0vLmx3vg
	s9H0RH7TQfK4dHkYs+e0b+QUr2tPR+0Jad6+U6GxCMNhjUSEHpnzpGfJ+6Kj9cNgVHNHG6N+5XJw2
	lOxJaJoPO8XTPbIJ7ADhcKzTOIR3n8Rlwd3filpdSkCYYtASJNWHcQLBWOHefVSycpZ+48G8yAZhd
	Ys/GY1UItcZXfgSpmtM30LsRuGLeGx1BYnrO/sUyRqlTWLIbuiZxZzuLwaJQZC38UU/ni1dki65Zw
	u9duI71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqpT-00000008CoD-2ibg;
	Sat, 22 Feb 2025 14:50:07 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqa6-00000008BAE-0Z9O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:34:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-307c13298eeso35170461fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740234851; x=1740839651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vrdSXW1mmp3zS/IFgwJNUwNIOlU9xB5BhTKmjF/3N0=;
        b=AVrhEpc0GXcPkIh4jLqIcWabUVMITE3ljqDtppyPrRAw3ZNtZ2xNls1NliOsmfTq+T
         RsxO0MW+RnvsL5um/cnFRt6v7WDspOqGYwnE8eK1YPNgoeBdfjPpbOoEG2NmA03PgDgl
         NF+AxSOQu2O8cFnh3Zu7KC6c+k9DMKR+JttrbdfxX4mnYzDGM2t8xoAqPQ0P2GVUmYps
         /TqBBz5VeBOhpYn3rW4KtNfij3VzsPM29O3PM+vD7OL8X53aC4SzKo8CwbwgTB0R9U8n
         XyZg64t8IZvJacNnsUFgVQs8Q7EYPTbBhH4wsmmLN4RrW5V7NZvQqs9WU2/OmoYPX0Kn
         yoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740234851; x=1740839651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vrdSXW1mmp3zS/IFgwJNUwNIOlU9xB5BhTKmjF/3N0=;
        b=HiCU/OqdDRFuZpNnrhfYCkPkx5OzOKBF8DP5U58luy8n93l637KoDl8Bhv+T2cMtZK
         CkCI7qWZ2t6/R/5faiulZTFS8RmJYxLyWxKLmdYo/IXxBwyrEVCWf0R17G6YffbZrpo0
         5kECzRGAA0NoEATR9bnZrmCPTCvCV84PrOrUntr6WFFanIdTsG295g8rl3TswfHqZtuw
         2qTuByLH6PWOq+uG1WIhuUEKuo2WAZ2PaLek2DxAnL5y3lNJkid909lUuiL9unp7HaJ7
         hA7PHC+lGUV1RW1CdcF7wFZ7J6V2FiYR1eMHYevhjTr6OJcopBBJWRT/kpQq61Escdm+
         vOwA==
X-Forwarded-Encrypted: i=1; AJvYcCVS0mtSNILSqbDKQxUIvMjM7sA7z0GX3j0z4WLJdF8D+x2yj9T6EhKJX08AWLtJlNPHI5EjID++bkeQS5qJta42@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs5VwGmyMA/CRlgJyvPjpOI+0Qv1S75I3UX1JFshMQ9Sg+WV1d
	/XSJk4MB3zx+LpWoX5kSoKcmqiM+qf5Dr+8yZuA1cuJdWS2jq0Hg
X-Gm-Gg: ASbGnctRSpluqu+lhXNRtfXebf/jfTSS4N7gYgv/MgJ8yJrzIB4PCEi1Gclw+vd2VEV
	QG5shpKlG5jwB4eZ3SB8/b7m/HsQeV7fxfRVum4UAtp4Gkumk9Ru8b0LD8YwxtQJzj6SVSUgYVU
	6690p7jxG9iHUAlfLYpNg7y3Q53ZQOTCrZ9xCyuAgE0A7otpWym/7vAFoX9/vhSQoXJ0w0TZo+6
	oWmZ8Gq1W8cEEfuKfdh+hYgONcfyRLSQr1XsQ3t2CPAfsgsS3T3iNaG5naY2AyFDpJP+yttNzX7
	vCM6Pyfp9JvZYUXLFu8yyz5lSGch+/6T2bOZf92sfsSfnuqswFIyIX9MnQCPuQpUUdzXqEfetTV
	zwfObIHE=
X-Google-Smtp-Source: AGHT+IF11dH2rQC2NJCETGFCFh/ZYMG0LizvaxBdfngaTtH1JMigzvLXrgg3UsQOEuocptmLKqGKmQ==
X-Received: by 2002:a2e:994c:0:b0:308:f53a:ed31 with SMTP id 38308e7fff4ca-30a5985a1b0mr25889691fa.3.1740234850519;
        Sat, 22 Feb 2025 06:34:10 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309231bb973sm27149761fa.82.2025.02.22.06.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 06:34:08 -0800 (PST)
Message-ID: <ecfa1b0b-8224-4ae9-ba72-141dfbc12431@gmail.com>
Date: Sat, 22 Feb 2025 16:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
 <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
 <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
 <Z7isoU9hKXlgsu33@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7isoU9hKXlgsu33@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_063414_186601_57A4B0BE 
X-CRM114-Status: UNSURE (   9.99  )
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

On 21/02/2025 18:41, Andy Shevchenko wrote:
> 
> Sure, but it's not only about these helpers, it's about the style in general.
> Spreading unneeded characters in the code seems to me as an attempt to put
> _your_ rules over the subsytem's ones. Whatever, let's Jonathan to judge, we
> will never agree on a keep growing list of things anyway...
> 

Hey, let's look at the bright side - there has been also a number of 
things we have agreed :) Besides, even if I don't agree with every thing 
you bring-up, I do still appreciate your reviews! I do think many of 
your comments have indeed improved the code. We may never agree on every 
point, but I am positive we can _understand_ each others stance. I do 
appreciate hearing your view on things.

Yours,
	-- Matti.

