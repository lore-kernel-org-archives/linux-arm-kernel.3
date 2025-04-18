Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56D6C369D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ujkr31YJOU0i+vEy/KID/q33Ti6fzxSZz0g9mVmH9w=; b=XEzaKCFPFiJXX7CcJQmdjC96LP
	qNozEE3H9Y9TbxxugRItDsQXvtp+aVLkhoKqKFZnKDdOytH2/Yg6i6zPeGSaGc0fl1DPlOZF6VLkv
	bhPWnbplGSKeRQKY8Msx8n3f0TuGTiF0esFyU9Rj5SJt6BqCPoWUVDOyeTdkKbbDSRDrRLwQqlkJ2
	UU6qQIPB/n0Ky8sYzh2xsfBZ3n1tS+14KjksV3hxmNdFI/NIvq7b33rrICPNurwHI09gDPRWOxZ8I
	XWeSRuWSq+C7T8bc6Qiv9biMMP5Z9YtoMZP4TmtpIDKIiD/Ga7qUzVmwLkXGelyhUZDHuZN1yKrr4
	WEyDoXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8A-0000000GWxP-3QRX;
	Fri, 18 Apr 2025 14:55:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6G-0000000GWJb-02WN;
	Fri, 18 Apr 2025 14:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E42D61120;
	Fri, 18 Apr 2025 14:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB144C4CEE2;
	Fri, 18 Apr 2025 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988030;
	bh=g34gBYb6R4BnqUhzVUDHFk2+n+AlDlCAPcckXvBMohc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jAo1JDkb8KmWHnFshBsCPXK7197UdRywGCALDTHTnPjKS4ac7sOaPgTU9DHq08Ion
	 +mG44IldDVLUQ3NjyygzJ37ZBWDMTz2/lSLBr4VKI6HSO9TVoDKorJKD09nwDtRoDJ
	 bvQdppchkSYzPYKCVI1B90pstwj2JFyowpx+aDv3/WPW9Hs9pXdyVTzktGx55ovrdW
	 wyVOA8/UtTxvsCWeZc0uH+LcdogjLUkOE6bZIg5pyS372ASVCZX2NfEEYeHu1AIYV9
	 MTHvmZCGhUPl3/YWOIZ/Megi8WfA/tIwiEmIz+zV/O4co2gbiEiysYgg+mlHGk7TiJ
	 cDvc0PNcL2ejw==
Date: Fri, 18 Apr 2025 15:53:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 "Cosmin Tanislav" <cosmin.tanislav@analog.com>, Tomasz Duszynski
 <tduszyns@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Andreas Klinger <ak@it-klinger.de>,
 "Petre Rodan" <petre.rodan@subdimension.ro>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
Message-ID: <20250418155340.6d788efe@jic23-huawei>
In-Reply-To: <20250417183621.00001c67@huawei.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
	<20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
	<20250417183621.00001c67@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Apr 2025 18:36:21 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 17 Apr 2025 11:52:37 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
> > Follow the pattern of other drivers and use aligned_s64 for the
> > timestamp. This will ensure that the timestamp is correctly aligned on
> > all architectures.
> > 
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
> > ---
> >  drivers/iio/chemical/sps30.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
> > index 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24dab7f0e2611 100644
> > --- a/drivers/iio/chemical/sps30.c
> > +++ b/drivers/iio/chemical/sps30.c
> > @@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, void *p)
> >  	int ret;
> >  	struct {
> >  		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
> > -		s64 ts;
> > +		aligned_s64 ts;  
> Definitely a bug as we have no idea what is next on the stack
> so fixes tag needed.
Applied with:
Fixes: a5bf6fdd19c3 ("iio:chemical:sps30: Fix timestamp alignment")


> 
> >  	} scan;
> >  
> >  	mutex_lock(&state->lock);
> >   
> 


