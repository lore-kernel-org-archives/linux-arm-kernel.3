Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A31C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vYR1TcwvnTPht4v+OQXxn5wwuqMsvo/ScQAZ8XRdUY=; b=UOfPhlngFf3UowrsHWZnzMQbF3
	KI7dq3VfP+xfy1hfDu4ll7yWnXlRkAMHbIYvWy9nWf2dlr5iAaO5ntRaxC8b23tEyyYxAVKQji3Yj
	cSqDnyyjBXrej+4PwcJmdK9S+jgkyrr7SJTxE1gmV8sDTP4LUIaKXUYJ97VBjxTtkBqUqZUSmZyJu
	1a3iXpdnxZjafzTLRgOrh9nn77OljFZD/tExe0mH/CfdMTpc734w/WriX8piRjmwWakHbTqD8qAto
	QghnF74Y62z/Eia2EIz3N5SuyiZGwvuQSLDD+UQi725q5HHZIkXQTt8TxSDyHvA4jMDV7QoQVg38F
	NAR8HVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TdN-0000000Dy5O-3ZS1;
	Thu, 17 Apr 2025 18:06:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TI2-0000000Du0M-1NRp;
	Thu, 17 Apr 2025 17:44:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZdlXZ0x45z67KPG;
	Fri, 18 Apr 2025 01:40:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BADD6140520;
	Fri, 18 Apr 2025 01:44:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:44:31 +0200
Date: Thu, 17 Apr 2025 18:44:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: David Lechner <dlechner@baylibre.com>
CC: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, "Cosmin
 Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
	<tduszyns@gmail.com>, Jean-Baptiste Maneyrol
	<jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, "Petre
 Rodan" <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
Message-ID: <20250417184429.00002403@huawei.com>
In-Reply-To: <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
	<aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
	<f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_104442_512091_2C33F462 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, 17 Apr 2025 12:07:37 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/17/25 11:59 AM, Andy Shevchenko wrote:
> > On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:  
> >> Align the buffers used with iio_push_to_buffers_with_timestamp() to
> >> ensure the s64 timestamp is aligned to 8 bytes.
> >>
> >>  drivers/iio/accel/bmc150-accel.h | 2 +-
> >>  drivers/iio/imu/adis16550.c      | 2 +-  
> > 
> > Looks like a stray squash of the two independent commits.  
> 
> Oops, sure enough.
> 
> > 
> > ...
> >   
> >>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
> >>  	struct mutex mutex;
> >>  	u8 fifo_mode, watermark;
> >> -	s16 buffer[8];
> >> +	s16 buffer[8] __aligned(8);  
> > 
> > As for the code, would it be possible to convert to actually use a sturcture
> > rather than an array?  
> 
> I do personally prefer the struct pattern, but there are very many other drivers
> using this buffer pattern that I was not tempted to try to start converting them.

For drivers like this one where there is no room for the timestamp
to sit earlier for minimal channels I think it is worth that conversion
if we are touching them anyway. 

Jonathan


> 
> > 
> > ...
> >   
> >>  	struct iio_poll_func *pf = p;
> >> -	__be32 data[ADIS16550_MAX_SCAN_DATA];
> >> +	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
This one is more complex as you need to take the
available scan masks into account to figure out that it
always has enough channels enabled to ensure the timestamp
ends up in the 3rd 64 byte position.

We get 7 channels for each of the available scan masks.
So fine, but hard to see that, so this one I'd be less tempted
to change.


> >>  	struct iio_dev *indio_dev = pf->indio_dev;
> >>  	struct adis16550 *st = iio_priv(indio_dev);  
> > 
> > Ditto.
> >   
> 
> 


