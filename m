Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C09CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ekrnY8bS2wg8D8B4NCNKhUtGyKfpA7Tqmni8Tj9DMM=; b=fyDJLW/yPo3/Is3gHFwJS8u/7x
	sL/1AuuEdLqtv5DfcrgzIg1I8GE2fFUs1NunIUc1NOUfqB4uIvW0ebMdQyBphSz+2Oa8WkzrzOcw9
	1hWRk0/KWeZadUV+XgfuToYN0ABtn+IgbVnOQh9OG+fTHh5V10jthUJ0tYmU5vUUmyY+DnwO2XpbQ
	iIvAKpbk4ihfOhZtv0IOfy8MYGkqjVmtTWFTrsxtBD32yAMktYTkDcjsDV4ew+qByNwbkNVO3ql8/
	RJ+FL+oLuuZ6i/zqg7GeTwXUMgcVxbhJVeIEFeM2htV1jmNH+QosoiHS12hP/2PHyu9lNgjh/tPEd
	Fo2mteqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTQ1-000000080x1-0SEl;
	Mon, 11 Aug 2025 14:22:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSx1-00000007tE6-2I3A;
	Mon, 11 Aug 2025 13:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754920340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CaqPVfLpXcf6B3O12hrTnSBLjueivtQ2cS9H7Od1BEg7ajGWiBFa9Kj4kYSKP9SnBiOJZrTfLe8xsTKVMcRq9a+wrFmAwjROCNmcvq9eQhB1W0M2zbayrVS18vqxb0kiMa9zZe/8jAYfN91vbuMUUsLU/0REhplvyUxv44xGAr4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754920340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ekrnY8bS2wg8D8B4NCNKhUtGyKfpA7Tqmni8Tj9DMM=; 
	b=T/PvQ64xlProZ9xS9pl4ZV2yYQ5nxGLPQqE8JeS1ukafk63rv2FWFT00C7Bt95P92U0TZfTim6zQ2NtzxGlYsnANP0bJhododQ+6bZMv4f9JUfm7rmYzjLFDpJc8eMxYHpdiknTcKUzIiVBaJ0CLo1nFNf789wYOEiQ6qmu6QKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754920340;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1ekrnY8bS2wg8D8B4NCNKhUtGyKfpA7Tqmni8Tj9DMM=;
	b=M4Xglp6eh7wYhZIOFhxuU2u93kfh4IuyjPWi2ovC/ABS/TriM8O4Tx1hjE/DqTsU
	kMNHmXxE0jC3XliupwVsZ3pxPX/Ho81gAjbyasLtVxdXRhgRjaZ7Pn7ez6g+g9gz3BW
	LKjw4MlOlUuY4Gf+hMeiGNxFFw3022udiSodcooQ=
Received: by mx.zohomail.com with SMTPS id 175492033739913.395742187955989;
	Mon, 11 Aug 2025 06:52:17 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 05/12] media: rkvdec: Add per variant configuration
Date: Mon, 11 Aug 2025 09:52:15 -0400
Message-ID: <5911981.DvuYhMxLoT@trenzalore>
In-Reply-To: <9fbc63d4-a12b-420e-8c99-f2f5fca5a9eb@kernel.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-6-detlev.casanova@collabora.com>
 <9fbc63d4-a12b-420e-8c99-f2f5fca5a9eb@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065235_654157_36536B1B 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Krzysztof,

On Monday, 11 August 2025 02:13:04 EDT Krzysztof Kozlowski wrote:
> On 08/08/2025 22:03, Detlev Casanova wrote:
> > This is to prepare for adding different variants of the decoder and
> 
> Prepare for...

Sounds better indeed.

> > support specific formats and ops.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> 
> ...
> 
> >  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
> >  {
> > 
> > +	struct rkvdec_config *cfg = ctx->dev->config;
> > 
> >  	unsigned int i, nctrls = 0;
> >  	int ret;
> > 
> > -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> > -		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> > +	for (i = 0; i < cfg->coded_fmts_num; i++)
> > +		nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
> > 
> >  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> > 
> > -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> > -		ret = rkvdec_add_ctrls(ctx, 
rkvdec_coded_fmts[i].ctrls);
> > +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> > +		ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
> > 
> >  		if (ret)
> >  		
> >  			goto err_free_handler;
> >  	
> >  	}
> > 
> > @@ -1119,8 +1127,13 @@ static void rkvdec_watchdog_func(struct work_struct
> > *work)> 
> >  	}
> >  
> >  }
> > 
> > +const struct rkvdec_config config_rkvdec = {
> 
> Why isn't this static?
> 
> > +	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
> > +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
> > +};
> > +
> > 
> >  static const struct of_device_id of_rkvdec_match[] = {
> > 
> > -	{ .compatible = "rockchip,rk3399-vdec" },
> > +	{ .compatible = "rockchip,rk3399-vdec", .data = &config_rkvdec },
> > 
> >  	{ /* sentinel */ }
> >  
> >  };
> >  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> > 
> > @@ -1144,6 +1157,9 @@ static int rkvdec_probe(struct platform_device
> > *pdev)
> > 
> >  	mutex_init(&rkvdec->vdev_lock);
> >  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
> > 
> > +	rkvdec->config =
> > +		(struct rkvdec_config *)of_device_get_match_data(rkvdec-
>dev);
> 
> If you need a cast, your code is wrong.

Right, some const/static addition is needed. I'll fix that :)

Detlev.





