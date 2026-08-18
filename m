Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=; b=xQDJ1q1HVD1qvVTvJYQy+p/fkN
	bxT/gSy9DNgH5UoudJiapNZ5Qm6Zs9o8sMlv/v6XiD7cDNL1w3dPEVlHQWLRVCQM1yhJ8yVaz+iZW
	16kZt9WiQBAcbaMkanbb7fSiMzHh5fzjyQJqiecXOA8VPzAtymBvz9INE8z3xCF0rX4KjR7Cmunki
	mBIgPLBakkXz7KhpIw7oRhV5eo8/QQV8Ew4FhYxnCYyPHDvQl8cWboamcyL9VBslF6YV0Er7LhZtg
	YbREKBPoVXMyvKL+KvG9Vc+aFOAEunnaonAN+lBal3Sym16yETXjXnFFOn5DL3EPJuomL/HfBToi2
	jRBa13aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRoj-00000008hg0-2sFk;
	Tue, 18 Aug 2026 21:57:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRog-00000008hfb-0cGG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:57:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbhdK3562321
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 21:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=; b=JlYOUUkVzm3vEXz/
	5mBT6rv83MXtScLI1UU4932QqojIgbCaBm9G8j43JXFBsv75PqiIE+fUSc/EV5zW
	WllbA9Nl3oTlzhOl7udifyPWv4coA9p/cOwOr8X3YXWcxbtjkSev4EdU3hIDRMdf
	eOv/ibIRSKKDkTUbVJ9xZESABlL8P8VrQiu+kmoZRh58VQqQ4EgoCWI+r8/rqTQm
	HHQ/4KDJ1WJ6PWbMqh6sUt5zrpM5pioIy/N0v31ZKlb9lWGbDmC88nDyu8uhMQQd
	x/lCS40MKyefj/c4AF6YLkx04NRr78ioNJ+jA+ZcqIw5r0zF+aJLxtbD7MJncryJ
	W0cf4A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm02g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 21:57:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so591111a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787090272; x=1787695072; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=;
        b=MWT5HL7JIqO6N95RhfCixoWKcFP4lHmxoZlasUj/xTEfWHOjyuiOXd6s2Qyh+1caXz
         D65tUE7/LJabD/xcV3xpqep2Zg9sCtXB02joDyk99i3gzQXam7y8HNRl0F0Zq0UltXcQ
         XJPCgxYXe5O0pYVic5jBRuAJ9ONyoQ9ONZDYt+7sWfDPcCF5e/TnCQD/Cynlzbdp3Cjg
         J75jYv/qRX2PNnVyrRxn3t60khYvRPptXzv1m08dvEJjfWbpccAL/eiOLkCLNraFPvi9
         E/Ai1dOj6GsTUqYj493y4rTe3E2QK6nKLLNVYJvxKR8Kly9Br2p9tCwGcmlOOcHYMXi1
         9dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787090272; x=1787695072;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGtUpEw5g+t+MNnli5I7AQhYnMcsIaCLD4XYq+ctu1Q=;
        b=K8NudcRmZvB+6oOBPXa8fUMiawucsqcPlr0wCxg/eLDkKNhKqbBvnOQm6XYB7pO64p
         RYQSwkaukUEriRhqMXGmr/oYhziacl+C0ZwO2VQTpUwIPkaRWBUlyYh73WLimqtVWMcT
         hFHuf7+iKVC9U0GTnRHOMk/ncGANO8iNWNrkItA/oFSAfozrjnc2b4zOEKTUk2VZc0iq
         txSu96yWjxhRnoY3BuU4uR+rBisxBbn0RBwMJD/pWYZ03LwYoP4kPKDkpRbJlXPFpRrX
         zM2cINXfzezhGMbJ+/IT/Cpy9IxgfZAeNZPNtEXAGi6HN3sqi1mHXTiFgEVFpb1pqkkQ
         LS1g==
X-Forwarded-Encrypted: i=1; AHgh+RpcoUzGQmrq+NITdYV7AK6jhPyOvXViLT40ha4h4pfhULCs+dxYxqxLsH9+HiQKPfur+P3kcZOFNeRaS8AVFl9m@lists.infradead.org
X-Gm-Message-State: AOJu0YzE3PWNB47SR1fTuUIlMYwFeaIy0upj3rVzI2pYqTP4WWGyEFp3
	8QGHKkQsxsLrLa/zBcUkypk1dxrWvAJkCMXGIBMcZ/22K2vkxl/zS26xn97dPNASqJ2Y+0m1AtQ
	Hl+w5ZgzrgJum+7D7hlAd+QUsi2v+X0BR6fTYenffFtwPTFitC6dgHeAQbqKZLgFGr0mfnjtOwQ
	Harg==
X-Gm-Gg: AR+sD12VKT5w2r13wOJweGiDUKWYab75KPwWzi8u5ZHAiAJFqPceqYRJUEo1Jpvijcu
	zG2aDHfyK9criCIGTA705KZavq59LZPW/kkJ3sJ3IXXS0rjSVEhG80/a0InMroqJrwz7DBb91vb
	VXPcza4eIfmHaMlRJtCueujfmOl5CcTjlaHCI7W7w7gF7hcKMpKH62Z8LnZ6YSCdWJRvpNAphoq
	vxVfeatlTnCe2Y7g58GnX6Y8cVuxFp0I1cKu2Z+K/r0sXrqPFuoPyL3/VH8SLWKHKBQGl6PcZS/
	IDoEVUsj4g77YagqMAZePHAQIx16j8tC+rLYO/qw5dhIDCW7Dg503WQt99DZOy6hMuC9rmfmcfj
	+Dd+tOUUnWkLC4s6Cxil4F0oRZQ==
X-Received: by 2002:a05:6a20:258e:b0:3c3:7cd0:fc27 with SMTP id adf61e73a8af0-3cd00d58d5emr482776637.3.1787090272100;
        Tue, 18 Aug 2026 14:57:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:258e:b0:3c3:7cd0:fc27 with SMTP id adf61e73a8af0-3cd00d58d5emr482715637.3.1787090271501;
        Tue, 18 Aug 2026 14:57:51 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm245946c88.15.2026.08.18.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:57:51 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:57:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-kernel@vger.kernel.org (open
 list:MAILBOX API),
        linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Allwinner sunXi SoC support)
Subject: Re: [PATCHv2] mailbox: sun6i: modernize probe and convert to fully
 managed
Message-ID: <20260818145748.000040a8@oss.qualcomm.com>
In-Reply-To: <20260814205553.39894-1-rosenp@gmail.com>
References: <20260814205553.39894-1-rosenp@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX8+c8Am0ae65p
 fBSVleGNj/gtunFi8+uxVqr9bax0+PdN9/IzC338R78Y3sbUTqFSP6R05SYBNsSVEXiJij8PbXn
 +cMYSm8OeXU8eoi0/CwgO0j6BeqB6gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX4i82A1QT92Jm
 bBWAQYMiWJsQ5iI0He3FcK5VeM8Ece4yUxRCzuzYuvH75aKUkuu1Op38Z6albFO2uB4TSZI8BjV
 qqC76F1sao3zv6Un2/2i1tXjuuoxlGkr4fhN2+H+fyvf2UTNXH+7XFlwqrzkZl320y5qF3+6h/2
 mMWDsSLsFNiiiAFAPweAbmprQ413KI1dljv0swQDpS4rmSRxPe1ht0ESsOqIA3HwDzpftnsYbgm
 flhhs+nR3WUid0ws8fnkRambRYI7h1tuw56y35MfM4DPYPbs+gqvglZsfYpERBM4mAPo8fjyRUm
 wGBoNDFKb584SNOQKfeL1W+H7WCEgqZSdgk++XZ/U1AUyfMgnB6iJWT/5BiBNNMhK8Ch28cEgSq
 oAPhOIj29R87+KzbrjrawxNjWNBQP2ec9hyNnuw2q96FlZg95awMF2b3+qD/pjhMGxhxU11ekIw
 2XqU4ATft234AWGa1QA==
X-Proofpoint-ORIG-GUID: hWeWj-KY0TcQJ2R2dqfiVrM_EgWGI5hY
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a84d561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=5cn5XzpzBu7RpU3fuqAA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: hWeWj-KY0TcQJ2R2dqfiVrM_EgWGI5hY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_145754_212405_51D9708B 
X-CRM114-Status: GOOD (  33.60  )
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

On Fri, 14 Aug 2026 13:55:53 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> Replace irq_of_parse_and_map() with platform_get_irq() and move both
> IRQ and MMIO resource acquisition to the top of probe, before any
> allocations, for early error exit.
> 
> Switch from devm_clk_get() + clk_prepare_enable() to
> devm_clk_get_enabled(), which combines both operations and registers
> devres callbacks for automatic disable/unprepare on unbind. This
> eliminates the manual err_disable_unprepare error path and the
> remove callback entirely.
> 
> Use devm_mbox_controller_register() for devres-managed controller
> registration, and drop the remove callback and platform_set_drvdata()
> which are no longer needed.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Drive by review whilst having coffee...

Looks good  - possible follow up suggestion inline + suggestion
to make a minor reorganization to avoid setting
mbox->regs = regs; way later than where it can be set.

> ---
>  v2: fix compilation
>  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
>  1 file changed, 18 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbox.c
> index 6ba6920f4645..3b838f6c837a 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
> @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	struct mbox_chan *chans;
>  	struct reset_control *reset;
>  	struct sun6i_msgbox *mbox;
> +	void __iomem *regs;
>  	int i, ret;
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);

Maybe do this just after mbox is allocated so you can set
mbox->regs if this succeeds.  Where it is now is a long way
from either mbox or regs being acquired.
>  
>  	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
>  	if (!mbox)
> @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	for (i = 0; i < NUM_CHANS; ++i)
>  		chans[i].con_priv = mbox;
>  
> -	mbox->clk = devm_clk_get(dev, NULL);
> +	mbox->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(mbox->clk)) {
>  		ret = PTR_ERR(mbox->clk);
>  		dev_err(dev, "Failed to get clock: %d\n", ret);
>  		return ret;

		return dev_err_probe(dev, PTR_ERR(mbox->clk), "Failed to get clock\n");
>  	}
>  
> -	ret = clk_prepare_enable(mbox->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to enable clock: %d\n", ret);
> -		return ret;
> -	}
> -
>  	reset = devm_reset_control_get_exclusive(dev, NULL);
>  	if (IS_ERR(reset)) {
>  		ret = PTR_ERR(reset);
>  		dev_err(dev, "Failed to get reset control: %d\n", ret);
> -		goto err_disable_unprepare;
> +		return ret;

		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");

and other similar cases - both more compact and correctly handles deferred probe and
skipping reporting of things like memory allocations failing (as those are very
noisy anyway).

>  	}
>  
>  	/*
> @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	ret = reset_control_deassert(reset);
>  	if (ret) {
>  		dev_err(dev, "Failed to deassert reset: %d\n", ret);
> -		goto err_disable_unprepare;
> +		return ret;
>  	}
>  
> -	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mbox->regs)) {
> -		ret = PTR_ERR(mbox->regs);
> -		dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> +	mbox->regs = regs;
>  
>  	/* Disable all IRQs for this end of the msgbox. */
>  	writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
>  
> -	ret = devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, 0),
> -			       sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -	if (ret) {
> -		dev_err(dev, "Failed to register IRQ handler: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> +	ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> +	if (ret)
> +		return ret;
>  
>  	mbox->controller.dev           = dev;
>  	mbox->controller.ops           = &sun6i_msgbox_chan_ops;
> @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device *pdev)
>  	mbox->controller.txpoll_period = 5;
>  
>  	spin_lock_init(&mbox->lock);
> -	platform_set_drvdata(pdev, mbox);
> -
> -	ret = mbox_controller_register(&mbox->controller);
> -	if (ret) {
> -		dev_err(dev, "Failed to register controller: %d\n", ret);
> -		goto err_disable_unprepare;
> -	}
> -
> -	return 0;
> -
> -err_disable_unprepare:
> -	clk_disable_unprepare(mbox->clk);
> -
> -	return ret;
> -}
> -
> -static void sun6i_msgbox_remove(struct platform_device *pdev)
> -{
> -	struct sun6i_msgbox *mbox = platform_get_drvdata(pdev);
>  
> -	mbox_controller_unregister(&mbox->controller);
> -	/* See the comment in sun6i_msgbox_probe about the reset line. */
> -	clk_disable_unprepare(mbox->clk);
> +	return devm_mbox_controller_register(dev, &mbox->controller);
>  }
>  
>  static const struct of_device_id sun6i_msgbox_of_match[] = {
> @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver = {
>  		.of_match_table = sun6i_msgbox_of_match,
>  	},
>  	.probe = sun6i_msgbox_probe,
> -	.remove = sun6i_msgbox_remove,
>  };
>  module_platform_driver(sun6i_msgbox_driver);
>  


