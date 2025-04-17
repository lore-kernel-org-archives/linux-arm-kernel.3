Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FFAC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zdNhKsXDPFcaKmSmdDSPiaW5/sB2tLL5jrq3GkzEX0=; b=R1ov5wtK7/MLWc0hFUGBAXXWbU
	pXleZnl1wd0gW+gS8HrzMZwX+CPWr5IN5acZT74uRnISqrPNTMbrXqMj5qjXHHYcalCF+Nd/1h89W
	RvBDByJIgACk0hpL2/2vJC3uBYF8KqWk8WwAH9quLCVVeNAHORUiku5D5+dnyXzoiu/U2hujTjbY6
	AiPCg+iPeLB1yn/Mn+vezByO/slmbOwMES7nskdt/uuyHPrW4XuaMNxu8n7cVPg/uUx1SMtu1Ggvx
	crytNjB5G3n/rvlIIy9buZqz/0I8o4QPlCi/hER8qY1vB2H3HAzBfTLMfbD/apj6K1DIMmlNG7t9L
	yjwXVkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tit-0000000Dyw1-1ZSX;
	Thu, 17 Apr 2025 18:12:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TJl-0000000DuJ8-1oQP;
	Thu, 17 Apr 2025 17:46:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zdlf138pWz6L53m;
	Fri, 18 Apr 2025 01:44:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6369D140121;
	Fri, 18 Apr 2025 01:46:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Apr
 2025 19:46:21 +0200
Date: Thu, 17 Apr 2025 18:46:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andy Shevchenko <andy@kernel.org>
CC: David Lechner <dlechner@baylibre.com>, Jonathan Cameron
	<jic23@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
	<lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, "Cosmin
 Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
	<tduszyns@gmail.com>, Jean-Baptiste Maneyrol
	<jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>, Petre
 Rodan <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 7/8] iio: imu: inv_mpu6050: align buffer for timestamp
Message-ID: <20250417184620.00006ae6@huawei.com>
In-Reply-To: <aAEzlZoZTsQuWgZa@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-7-eafac1e22318@baylibre.com>
	<aAEzlZoZTsQuWgZa@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_104629_615296_94BAD958 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, 17 Apr 2025 20:00:05 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Thu, Apr 17, 2025 at 11:52:39AM -0500, David Lechner wrote:
> > Align the buffer used with iio_push_to_buffers_with_timestamp() to
> > ensure the s64 timestamp is aligned to 8 bytes.  
> 
> Same question as per previous patch.
> 
In this case I don't think we know the position of the timestamp
so a structure would be misleading.

The comment above the define certainly suggests it is variable..

/*
 * Maximum of 6 + 6 + 2 + 7 (for MPU9x50) = 21 round up to 24 and plus 8.
 * May be less if fewer channels are enabled, as long as the timestamp
 * remains 8 byte aligned
 */
#define INV_MPU6050_OUTPUT_DATA_SIZE         32

