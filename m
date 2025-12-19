Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE16FD7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YaQsv0P6TIlgHLkXT7+RR7CiuRLzcUpctEvPAChUrU=; b=I6/flSTfB/mYJeUJxU9GZfBfM6
	s7BFNnhrbaK72hYjyiMEo764MH4SG/eqMywsPx7m1CCDSNN7U+hJv6cyA9PmjP1TuGqtRU20JjpA2
	+Ie4R/vR9QOEOPVTtnmdiaSe4Wv0s2FJc/6DZCjDntagd+0Vqu67QZB7g/oHUU/Zu2Rq1mL6/hlgj
	iwk/LY//48jnvAeVPhx5IwTP88+K4yfvoonkZgtJ5rDnj96C+9GKag+or7rJMSMNt17Pte5gPuOmU
	taFw0M26x56QJBPD/+sNxDDc9LqAdT0KYRHY876JbP9xZ+68P3wm4CT2N2rINMlmDdENRkTHT2efj
	oJpdWMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf3o-0000000Ap6j-1cYJ;
	Fri, 19 Dec 2025 18:18:40 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf3m-0000000Ap6H-2rc3;
	Fri, 19 Dec 2025 18:18:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dXwlJ4rLTzlwmGv;
	Fri, 19 Dec 2025 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1766168313; x=1768760314; bh=6YaQsv0P6TIlgHLkXT7+RR7C
	iuRLzcUpctEvPAChUrU=; b=WcPiwhcMktItuTDX1xP5CHdeKoQ3q3USFL4H49Z2
	L2VM9oOm3EA+Dh6QJEnlJXnMrHQgr4uzApGsXMNO7a9rwr2HY9vpQp1wqSFZupll
	B48eenX94F/KvfKxzZNOl1XuBzjEngIJ+AWjCc3lpFAyflWMmpYYB4DsqvAlfUac
	9LrhFVMVmNz+/jWmmYwXNjXL0zp/TmKMOz44KbDQwJ++EayxKGxjRXc9wW6BK2i3
	Q2qHZrP1Hf/WrkIrh3SvT5mG/gwRTcQ6tAgQUED6B633sTOlgrUAqVUumSR+7Q4U
	t5f0KvE4E/A46OA0xL7Na+C24uzHpiSaTd5ne6Z7ZW/SGA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id jpw9X9Xft50J; Fri, 19 Dec 2025 18:18:33 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dXwlB3qcczlwmGq;
	Fri, 19 Dec 2025 18:18:29 +0000 (UTC)
Message-ID: <e49c1ea8-bc13-4881-bc6b-2e1a08b1184f@acm.org>
Date: Fri, 19 Dec 2025 10:18:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] scsi: Make use of bus callbacks
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
 <a54e363a3fd2054fb924afd7df44bca7f444b5f1.1766133330.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <a54e363a3fd2054fb924afd7df44bca7f444b5f1.1766133330.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101838_752422_2CE25733 
X-CRM114-Status: GOOD (  10.84  )
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

On 12/19/25 1:25 AM, Uwe Kleine-K=C3=B6nig wrote:
> +static int scsi_bus_probe(struct device *dev)
> +{
> +	struct scsi_device *sdp =3D to_scsi_device(dev);
> +	struct scsi_driver *drv =3D to_scsi_driver(dev->driver);
> +
> +	if (drv->probe)
> +		return drv->probe(sdp);
> +	else
> +		return 0;
> +}

If this series has to be reposted, please leave out the "else" statement
from the above function. It is uncommon in Linux kernel code to have an
"else" statement after a "return" statement.

Thanks,

Bart.

