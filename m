Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B81CC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfOry45ulwe7v6KhpB1GY36EGtm0Agssnch6yIRMUe4=; b=UEvBCyqGPnN2hvBmF/4DODEHs+
	H9B1nJu8LN4ykoXlAosNr3ZqzYzd6Io5SfQbYP+sWleQURaVe1kxz0cXQLyDZEVMXkYeKWEwKFOPh
	XBHvR3w8GzSM0EE/haJYkgVBBbpGW60fpPssiZ/pVugJhJ+936ZU5gX4cTXftRxaoZKnbaPlcHfsv
	KUezGNg+Lcf/n0vmjMSVI4kns7ay66BmCqN83Y2ip0MjdLEOcyGAbTkBMO75AuijrDkPKJ0pW/29y
	clRiapGvAhAPOYk+WPt+JNewrTAEw1xiCGRXZUCviyM1OMrIloXNklx0ZaOXHDki8qrsyT8/qO0Yg
	1GSsiVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLBM-00000008CfM-0diL;
	Tue, 18 Aug 2026 14:52:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLBK-00000008Cf9-27RF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3919440756;
	Tue, 18 Aug 2026 14:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AD11F000E9;
	Tue, 18 Aug 2026 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787064770;
	bh=rfOry45ulwe7v6KhpB1GY36EGtm0Agssnch6yIRMUe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b0SfcLM6JEf6E/47tSLKjlfUE6vghA2jIi0YE4aBIWmYEOi+XJaKj2Gy5zITLhDNl
	 bwOY3xmAj2j7iE1R/U3RGb0anQjroUiL6EO2F8srtMum4HmUhbOpfVpHV1+A1bvjSQ
	 FsRfhRcC282dWj7xyp2nPI5S1UEhWtl6rm9nSm2ROmsh+WMRHyiwtrHhUQ/GJ0M/Xz
	 BiJhu++JLTWJv2I+Xx1SHX/XzvtFLbMb7tMBvUEmp68nZfcjrRHc+T/H83VyzT6qeS
	 lMGPO8MkEHeW6IQ5VN24qLkgqu44YjuY8hPXP8QwgUxfjShQGGxFE+BEQWjlacLejK
	 9Ez04mzrj+/OA==
Date: Tue, 18 Aug 2026 16:52:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiawen Liu <1298662399@qq.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] i2c: i2c-s3c2410: fix runtime PM cleanup
Message-ID: <aoRq_1DgSUrmR_i_@zenone.zhora.eu>
References: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_692077742B9CE600137EC92B0FEA258A8C09@qq.com>
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

Hi Jiawen,

On Tue, Aug 18, 2026 at 05:11:57PM +0400, Jiawen Liu wrote:
> Keep clock enabled until adapter teardown.
> 
> The remove path disables the controller clock before unregistering the
> I2C adapter, so adapter teardown can run after the hardware clock has
> already been turned off.
> 
> Move I2C teardown before clock release (pm_runtime_disable,
> clk_unprepare) in s3c24xx_i2c_remove.

This last paragraph is actually useless. Perhaps you can write:

"
The remove path disables the controller clock before
unregistering the I2C adapter, so adapter teardown can run after
the hardware clock has been turned off.

Fix the ordering in s3c24xx_i2c_remove() by calling
i2c_del_adapter() before pm_runtime_disable(), keeping the clock
enabled until adapter teardown is complete.
"

This way we also mention that the ordering between PM runtime and
i2c_del_adapter() has also changed.

Does it work for you?

> Signed-off-by: jiawen <1298662399@qq.com>

Please, next time write your full name, not "jiawen", but "Jiawen
Liu".

Besides this can also be considered as a fix and needs to add:

Fixes: 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA deadlock by keeping clock prepared")
Cc: <stable@vger.kernel.org> # v3.19+

No need to resend, unless there are other reviews. Please just
let me know whether the changs I am suggesting work for you.

Thanks,
Andi

> ---
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1136,11 +1136,9 @@
>  {
>  	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
>  
> +	i2c_del_adapter(&i2c->adap);
> +	pm_runtime_disable(&pdev->dev);
>  	clk_unprepare(i2c->clk);
> -
> -	pm_runtime_disable(&pdev->dev);
> -
> -	i2c_del_adapter(&i2c->adap);
>  }
>  
>  static int s3c24xx_i2c_suspend_noirq(struct device *dev)
> 

