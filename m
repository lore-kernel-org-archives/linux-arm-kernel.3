Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A46C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alUgsH5oqgqePgoF/9tZ8EZruI/VR2Lka7gVu683YBo=; b=porgINsjwrbs/try+NpvdWLzpq
	nU1R6EeMTs+++dRvBTLI8mVE7aGG4IyuACZ/+sSmiJ2qtK0j8kNIlqf5NjY7dB3MykaHiwqNcK3kP
	dqVpghiWdjzUOSCHLK4w/ZXKP9r5d882DtxUDdxd8gFtIqmmnDNokrsuiAu9tjML5Gd9nqkIngk+r
	Zg0tiCctyBs9boloswsnoImqYfyuGqSV4hq+P9glNMlaXSN5JDmUttBROPoWsjFUOmTQQZRzlGvZu
	mujmIFWRWZX4Vz8HLrYkRWjIl1qjXJLMYKmQLLkPBONCdFV9dPEYdj/UMid0Sq7UrsCaBm8eSgus/
	8jeJT8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oLX-0000000Grjh-2ocy;
	Fri, 18 Apr 2025 16:13:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nEw-0000000GZQ5-3fgT;
	Fri, 18 Apr 2025 15:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AA0D4361A;
	Fri, 18 Apr 2025 15:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B5BC4CEE2;
	Fri, 18 Apr 2025 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988570;
	bh=w2SpzO0xz6fx5J/fpntEEf1UqwhZaVfP36baHvy0z+4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mEwhf/fzByQdSLeT3Cu00zEzaaOGeQnOsE8nqnjaQioNNFWBeo4YURAhkgXffpi2W
	 hnT9ZrvKsEpJaQs4Q5p1UIU0nK/DHdfHyQQMWSbcg09goV0uTlBLCoRKXLgRPT3P1R
	 8+ik9tBNd8aSreN+sX9TOb445OFww7oWo3ICiCCA3JBvgzkcMq8m6M0DC6zMGXwDbA
	 WDU6SQo647rlTslsurH7D7xF029OAGqfTgH/Xm3V70F13gFetzh1C56cHqS+JX9djB
	 A+0Eedl8HHYigtnzfgDJAYilMm777v0sKsD5fqvIqgJCm9THRSQ0XKMkHVBXMqGPnl
	 wFZi67jUe48Gg==
Date: Fri, 18 Apr 2025 16:02:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Andy Shevchenko
 <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin
 Tanislav <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 7/8] iio: imu: inv_mpu6050: align buffer for timestamp
Message-ID: <20250418160238.204701e7@jic23-huawei>
In-Reply-To: <FR3P281MB175712512B0A88FAC9DFA009CEBF2@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-7-eafac1e22318@baylibre.com>
	<aAEzlZoZTsQuWgZa@smile.fi.intel.com>
	<20250417184620.00006ae6@huawei.com>
	<FR3P281MB175712512B0A88FAC9DFA009CEBF2@FR3P281MB1757.DEUP281.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_080250_958734_53238D3B 
X-CRM114-Status: GOOD (  23.64  )
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

On Fri, 18 Apr 2025 11:26:39 +0000
Jean-Baptiste Maneyrol <Jean-Baptiste.Maneyrol@tdk.com> wrote:

> On Thu, 17 Apr 2025 19:46:00, Jonathan Cameron wrote:
> > On Thu, 17 Apr 2025 20:00:05 +0300
> > Andy Shevchenko <andy@kernel.org> wrote:
> >   
> > > On Thu, Apr 17, 2025 at 11:52:39AM -0500, David Lechner wrote:  
> > > > Align the buffer used with iio_push_to_buffers_with_timestamp() to
> > > > ensure the s64 timestamp is aligned to 8 bytes.    
> > > 
> > > Same question as per previous patch.
> > >   
> > In this case I don't think we know the position of the timestamp
> > so a structure would be misleading.
> > 
> > The comment above the define certainly suggests it is variable..  
> 
> I confirm timestamp position is changing depending on channels enabled. It
> can be at address 8, 16 or 24.
> 
> If there is only 1 sensor enabled (6 bytes of data), timestamp is at address
> 8. 2 sensors (12 bytes of data), timestamp will be at address 16. 3 sensors
> for MPU-9xxx (19 bytes of data), timestamp will be at address 24.
> 
> If the buffer is aligned on 8 bytes, it will always work without any problem.
> 
> > 
> > /*
> >  * Maximum of 6 + 6 + 2 + 7 (for MPU9x50) = 21 round up to 24 and plus 8.
> >  * May be less if fewer channels are enabled, as long as the timestamp
> >  * remains 8 byte aligned
> >  */
> > #define INV_MPU6050_OUTPUT_DATA_SIZE         32  
> 
> Thanks,
> JB

I applied this one as it stands with fixes tag and +CC stable.

Fixes: 0829edc43e0a ("iio: imu: inv_mpu6050: read the full fifo when processing data")

I thought about seeing if all the cases that are fixes are separable enough
to take through togreg-fixes whilst the with_ts() series goes through togreg
in parallel.  I might see if that is doable easily.

Jonathan

