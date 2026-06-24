Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F5CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 04:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=; b=NfQJEYkug3jLwnKRgPlRKHpN1C
	APjPmZk1+fqlArpjQyMDTN9NQacsjcSL6A1SU9SKQzSQLZk91cjYfEuxHErmlZA1JjvH9zQ45NkM4
	UDKDH18FL5i7C05bbnQ71h9+Vl1wPE6Mg5OMe8H7RSAwMQYK/K+CB/I5RihpKaELau5r10977i6Bk
	mY70WUxETkf+GzryCapY0tedwOMm6XdD1AmeT8s1GQf6ml8O8Ipmx+sLylfeXbDUrjxfwh9lwdWEb
	RjoRopDbDzT4EAwkZyJpnMA7l9I2PsBCgFj8+MPjjw83xpt890wpLoPVjNs2J9jLPUPT8Hs8KZGef
	+fVaIuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcF0a-000000077HY-0oXQ;
	Wed, 24 Jun 2026 04:14:40 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcF0X-000000077Gi-0Wh6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 04:14:38 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-139b914bab6so676033c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782274476; x=1782879276; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=;
        b=QD+wXeX2AQmbdjvDbU1MmIoH/1JVYUGzXK/h/nrzFi63kw5EIhgh2lq3HDBAogM5j8
         mBpTriNdPsWExfyn9NMa6rVAAlocVrjE91EYE/3EPi5jR0iIVatYSg7fke/AeSVdHd0m
         ZRlk1rU4U3iDGuaFWQ803/Jx/yd/gb7w6CPTqkv+uZS9DqgkZsy6H16GcEJFugukx0v4
         5GvcrhLlMu9wFyge+4/qtw6LEMN+r2JraxoVyAKRPVAQQ1i14ehMtpAVGC9OQiJ6NYzs
         psKy6MFzQaowWjFB2pSoLE8BzBEcziGQ1rcOSvOyPFZmL+5E3dmdt3qOwhoNtrDDo4UW
         L55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782274476; x=1782879276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKtWlzZGcSqpr4oYtvBHGz8mTHnWwBOUsRR1pMRsq7A=;
        b=aF47yPiecQ40ivI3fws4Rweg869A8pbK0xO1FnFnm4w4MkpAt4GMEtzJLjOq6H6ksp
         m0RTH/aIyRUhBL1JFIIwmv6xme+dHD7SJRGeM1v4mY5ZgAfiv1RJOViyHwWpsxO0gQFE
         pL46C0V/8IExyISGQJfb1ZPGuWxrp8UyU+Ct8kY7YxIxsjEecEUckkmYvEKKd4haXxGk
         AFS3LHjwqRdIjzZWeUovko0/v0Nh8IJNNC9AcCS6t09t0gAWcJhzejdiTUC8828gePzj
         Z3qK8N2HBH7cXXN7ySnbL6vltC7fO2iK9DK++On3U6hwPnkAhDwt3NqdqnzWL8N/tUki
         dfpw==
X-Forwarded-Encrypted: i=1; AFNElJ+IiYaqMCte9Oa1p0Soe4dZC49Bh8l8aojlgaJvyw2EDVkasrzvK7ybppOOegmbs5v3pJ79TgRj+nR5Tav1ISuT@lists.infradead.org
X-Gm-Message-State: AOJu0YyFSz/rROFsMrmAuY/G9lf/W6KGpZF33y0dz62hqMHjqdK/tKIN
	HJEPpxeczrzPZiH7hrjFG0iCd9fzNTwBXMvH2hXEgtvfpaksVjEMx2Vm
X-Gm-Gg: AfdE7ckmqvZg6Qb2FTK8uWEAZrlPiERDwVN1RlTB4x1tf5G7x2OQ+oQWKngCaezXVWM
	CP1FmVGCkAIdDddqyASZGIfsmEnqT5Kb3ONj8HdZjTLxwNSDkSGOHR9VRAU/+06NSILnhhGPgYN
	E3YRdP2tp2SJDoJINmUfhAUBH4qtYNbvF8hCt0NvtQi2GRp1dCjpCI1wC1tZUIzhjmBXtXu89GA
	5Wclene12gAIa2QBJRe4EiniXOp7qcv0PDg36ZYPI+7P0PUFnVJd8GCrHPUn5OjNz4kZQulfy6r
	UGaQZP0r5YksdCGXpHGOHvhmw5NMTAk37/nQ+ihhtv5G3e6seGXjMHBt49EBYniEAjfUvOwo4ly
	kh1uwszmAzLEc/pJLiT/W7zWDK+X36Hp/rcRPvQeUQYaKLUNme90asJ4TYnyY5qS+zhMqR+4Qpt
	v6Qv8MjMu88ZhqPU4AezntSRQZL4OPJJyJ7MPHdJJixKN32kPdncwwkQ==
X-Received: by 2002:a05:7022:128f:b0:138:5049:cb7c with SMTP id a92af1059eb24-139d0cd9467mr1322277c88.36.1782274475590;
        Tue, 23 Jun 2026 21:14:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:6026:1e6d:4a80:9bd0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d6edsm20547205eec.14.2026.06.23.21.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:14:34 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:14:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] Input: mtk-pmic-keys: Count available keys during probe
 instead of pre-counting
Message-ID: <ajtX-cVWFmmkVO7M@google.com>
References: <20260528235600.312045-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528235600.312045-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_211437_201170_1559B18D 
X-CRM114-Status: GOOD (  27.39  )
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

Hi Rosen,

On Thu, May 28, 2026 at 04:56:00PM -0700, Rosen Penev wrote:
> Replace the separate of_get_available_child_count() pre-count and
> validation step with a single pass through for_each_child_of_node_scoped().
> Skip unavailable child nodes and bail out if more than
> MTK_PMIC_MAX_KEY_COUNT available keys are found. Set nkeys after the
> loop so suspend/resume iterate only over initialized entries.
> 
> Also use a key variable in the loop for clarity.
> 
> Use of_device_get_match_data() to fetch the PMIC key register data directly
> instead of open-coding an of_match_device() lookup.

Please split this out into a separate patch.

> 
> This also lets the driver drop the of_device.h include.
> 
> Assisted-by: OpenCode:BigPickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 53 ++++++++++++--------------
>  1 file changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c78d9f6d97c4..e34856693ee2 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -16,7 +16,6 @@
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -147,6 +146,7 @@ struct mtk_pmic_keys {
>  	struct input_dev *input_dev;
>  	struct device *dev;
>  	struct regmap *regmap;
> +	unsigned int nkeys;
>  	struct mtk_pmic_keys_info keys[MTK_PMIC_MAX_KEY_COUNT];
>  };
>  
> @@ -267,7 +267,7 @@ static int mtk_pmic_keys_suspend(struct device *dev)
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
>  
> -	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> +	for (index = 0; index < keys->nkeys; index++) {
>  		if (keys->keys[index].wakeup) {
>  			enable_irq_wake(keys->keys[index].irq);
>  			if (keys->keys[index].irq_r > 0)
> @@ -283,7 +283,7 @@ static int mtk_pmic_keys_resume(struct device *dev)
>  	struct mtk_pmic_keys *keys = dev_get_drvdata(dev);
>  	int index;
>  
> -	for (index = 0; index < MTK_PMIC_MAX_KEY_COUNT; index++) {
> +	for (index = 0; index < keys->nkeys; index++) {
>  		if (keys->keys[index].wakeup) {
>  			disable_irq_wake(keys->keys[index].irq);
>  			if (keys->keys[index].irq_r > 0)
> @@ -325,24 +325,23 @@ MODULE_DEVICE_TABLE(of, of_mtk_pmic_keys_match_tbl);
>  static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  {
>  	int error, index = 0;
> -	unsigned int keycount;
>  	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
>  	struct device_node *node = pdev->dev.of_node;
>  	static const char *const irqnames[] = { "powerkey", "homekey" };
>  	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
>  	struct mtk_pmic_keys *keys;
>  	const struct mtk_pmic_regs *mtk_pmic_regs;
> +	struct mtk_pmic_keys_info *key;
>  	struct input_dev *input_dev;
> -	const struct of_device_id *of_id =
> -		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
>  
>  	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
>  	if (!keys)
>  		return -ENOMEM;
> -
>  	keys->dev = &pdev->dev;
>  	keys->regmap = pmic_chip->regmap;
> -	mtk_pmic_regs = of_id->data;
> +	mtk_pmic_regs = of_device_get_match_data(&pdev->dev);
> +	if (!mtk_pmic_regs)
> +		return -EINVAL;
>  
>  	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
>  	if (!input_dev) {
> @@ -356,31 +355,26 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	input_dev->id.product = 0x0001;
>  	input_dev->id.version = 0x0001;
>  
> -	keycount = of_get_available_child_count(node);
> -	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> -	    keycount > ARRAY_SIZE(irqnames)) {
> -		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
> -		return -EINVAL;
> -	}
> +	for_each_available_child_of_node_scoped(node, child) {

Let's keep using for_each_child_of_node_scoped() and check
of_device_is_available() inside the loop. This will allow marking a key
as disabled without shifting it's meaning (power key vs home key).

In the rest of the driver we should be able to determine if key is set
up checking for key->irq > 0.

Thanks.

-- 
Dmitry

