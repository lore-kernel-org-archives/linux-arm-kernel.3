Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7CBC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX2wgBTb57YNhQ0Dx2z58i0VYdMln4e5I4vq7Id/u/8=; b=qa1GVDnOikuKti51RyuC7TtcmT
	FUhWa6XEUJGTK89TaRJP3rqHOMgQnQUeqXOPscaK+pjWe9WoSzhr1L7YFljWuyJmFseqZLbpchtbo
	FZMS2SIb0+0Abi1tzGqe8Z+NAomWlludNFucC6KEMC+T/zkkhKEMsbCL+RxDUpoLsBxJYAx5OXz4Y
	rUm20F0Ms5Urx3lCLevqlKgtmVu2lYDqbfhBPn0K1cCutyS1TXtkHjT086+oCs1s5u0PqsJ1derGB
	JipYmgeF1Nhtb9Z5yB9Vxh261dsHtSsgVE9uZBUI654bWvwVLbUEeNHQNSjZoEJbIE9C0fd+86jLO
	7p/D33Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjgP-0000000Cp7E-3rjD;
	Wed, 19 Feb 2025 13:00:09 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjb0-0000000CnDD-1qVC;
	Wed, 19 Feb 2025 12:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739969668; x=1740574468; i=markus.elfring@web.de;
	bh=NX2wgBTb57YNhQ0Dx2z58i0VYdMln4e5I4vq7Id/u/8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ojhv1gYnRx2oJvMCOW/7S5ogYi96h1eNZmBVjkDZE6HIgfn2bII237fhxN/7KZsD
	 TbJx6YTDA0wj+xQ01ee78LN1sBK+MH13PGLGB/C2RrJh/biFIvTeFPRkrML/4qQfw
	 13mbxKPnYqG1ZEAAxz45Af1J+rnwzpyRElAJ5GGPXFlyUjrngYViYaCA2uzkrzaBe
	 u7F1I8C/D0N2pLh3o5zqFrKhTyf1zdui4pGYEY//aVIcyQyfTzj7y/RylJsBhEhm5
	 OY6nKHp6dqx0f94VeuS+NaVOSVPC1/zKK2qHQQ4yS5cIyEasMyvXo9g9vArg3PRx8
	 yEDdFZZg0UFaQfEtOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MZjEJ-1toFzn27IF-00OMPN; Wed, 19
 Feb 2025 13:54:28 +0100
Message-ID: <218b109e-a05f-42f2-b0bf-1b15d1a28b50@web.de>
Date: Wed, 19 Feb 2025 13:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Val Packett <val@packett.cool>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250219-v6-8-topic-rk3568-vicap-v4-5-e906600ae3b0@wolfvision.net>
Subject: Re: [PATCH v4 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-5-e906600ae3b0@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QIH6bMsC4SL6tM5FXvxmKgSOSHYCPU+Qy2oNfHkFEGuXlyilvv/
 IFsq49vVgAZ/Pz+LhRUXX39v0QsqT4VJ0lzMuThOjmq2AA6jbH631PmDEgT1rfrLNEJUcyz
 fVzOl/gOx3F9fxs0UJNOZNUdE4T49CZVR/EQoWROi04wkD8GyzY3YidoSpCPlyoa8a/6rNh
 ZlaRJ7Sc+nD/ATpgRsMUw==
UI-OutboundReport: notjunk:1;M01:P0:irdIEICfqUI=;IsbIQ2vMNaB35dqJ5SZn3/+Sp3+
 mXwNV2aM8hxp6dDAjuGUyS+Y0n0nQfiuRYj7EjV5dbJJPQ1qgTA/aoOsbdgHzr4anJUz1urak
 1Fy4Ld/li3SbQBe+1bTlAnjy45NtgK6c32v9JDO15iuqxJH/8sBokEUieuUTpvpqmTWGqHrGK
 LMhCNWRZ4fMI4B/hcCNE9611FTaENHqw0wZt2QxPmiIHc0dEw42A3IGY9A/eEP35n2QyTML9P
 TPMoN+DzXd5uFBST/7zzYvoG74g0tgseOgdVpdCoLMpSOyD0mw2kLzIM59mPaj/FA2tRif03b
 4jeH+E2Ox5p7mJ6ZPxVdBGY8QrqoJH+/TjcT3OgP+JtNSeHzc9rlnjJ6I2svyQhCJ3CfJjsYb
 VnKSQs3Sfa8gJUEkrlcJ/ZIiPEX7UCvqDWO2xJmwBeAZbpzZ4CsKXlG6nuhNUK2Q7YTODUogH
 RSaVLVg3S3X4dY5dV4s73smx3kDb92+vxtH1rJaUkchMdy+XiRpJaeKk1/smFaHtEdou/4iov
 Ouv0TiV2K51V5KrGuB6kBsUw9cnqsSZQ2HnMvYJ57Q99QYx62BjMGj0hHh8m+87+QfP1p2EFK
 Vo7oh4O1UO7pD/IRenTP0pWWqG+mIMSNe78luOBp5MW7CPBqharvXE4pfuNjCRS+rDoHsrfSy
 m4OGd8g9l9eSJDAr7q/tunzX5ksrBN2N0ao4evDDKf4MopkrUavi3wrJEfL5Kd0vwp8NDtHze
 gmbelQPmuIwtKsHfIQwa3tsLfhZPN9w+leySKkJr541BKuGe77AL5SHeqMrix/GoWZPA25pgX
 aBAtiVUz0l67QHVN3xoTZWA53me/9XxuLwA3uyO0q8lRXKn3kHfFqWQFRXNNDOJqmE12CvkuW
 alJmeRxP6SumTbWDk0NE2AnNTMCRBVeVRF/rUVbT7tL05ILNmU7T/0Uu8xTDW546L2dl/JxT9
 DFMOejqdbzQIeTDxXRePaLbcU/K8nrZLFPlyd/7SFu7ea/RrO4OXChCQS9jQZn/JN+irxc1fY
 gMboO6kG+hEvwl8jERbxhjBsSAEyow55ijMMdRhw95xogj6GOXRzrJnaTsm2Dztd7PVGSyigj
 wc0NLwrTQBoyyi7649VfhzDAXWIpM3twStyRwnpnGuBT2fq+fDjqVYZjygyKf7XZXtf6r/9cB
 BIS5BDKPY6DZ936Q7thnh//IRKWVRex5o7810MS3lZSXHj95gH/V5fi/YiFjKl/AP6u1NgM3T
 vOkzaJ75n2J2bhfyPcRZKe9dKlnwPDYX/8V2vCOnW+vU3YrLbMkuoEzXU2FWgTHiJwrPZ/RTj
 R8uij/kRfK+pF5NIn3HrXTvpiwjcG9qSnZqDrHjhd6sZKd6/PoUFsVg59irRrleUNQBlSru64
 Odc/rgs2jkQRD3fDWxGBjl116fQCxh3SHnRa5aJ8Wb9/66RHlNepWfOmVn6FCCAkL/tCEzuad
 Ok5fKh33orINRYSUGyKpM0Vp7u50=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_045434_845374_A49F39CC 
X-CRM114-Status: UNSURE (   6.92  )
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
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -0,0 +1,622 @@
=E2=80=A6
> +static void rkcif_stream_push_buffer(struct rkcif_stream *stream,
> +				     struct rkcif_buffer *buffer)
> +{
> +	unsigned long lock_flags;
> +
> +	spin_lock_irqsave(&stream->driver_queue_lock, lock_flags);
> +	list_add_tail(&buffer->queue, &stream->driver_queue);
> +	spin_unlock_irqrestore(&stream->driver_queue_lock, lock_flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&stream->driver_queue_lock);=E2=80=
=9D?
https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/spinlock.h=
#L572

Regards,
Markus

