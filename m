Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1146D41C03
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 06:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dWsx5nJGnXXSk2Ufj1TPsNBwAQF6kKooyg82zNLy88=; b=zELgKxAe7SNPt4Ho5+3Uwtemt+
	o4Tt/3ZRg8m/22TaYl4SjnA6YRquJyYnihS8zWSVo8VnYZDBQaTN3FS+3Swk/OfpfWesgGP+CFU7F
	PegxmSHkz+wdFFkEn0rKMrCmNi57zdPaw4VU1W6a79VjOKi4IHb/ceJ43HNuTV8WbB2jefgzMQEah
	sFL9ZTn2SqNyL9YhbnlE5TbtqbITul21dpbxbRwJxuqkRHZpNxPLcD4Id/G7MFuzb4rLSH3tuhuPU
	vxdMizwg8kGkknqMbTWTx5q/DoCN1GkOTfT5wx80IoNGTgqXHCSPSI53aElyF66fYj215jTaq8n5p
	3nV9pghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6is-00000005syi-3OIn;
	Wed, 13 Nov 2024 06:19:26 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6gR-00000005sfb-2a1m;
	Wed, 13 Nov 2024 06:16:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e31af47681so5263841a91.2;
        Tue, 12 Nov 2024 22:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731478614; x=1732083414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/dWsx5nJGnXXSk2Ufj1TPsNBwAQF6kKooyg82zNLy88=;
        b=M+JK/yWTbBkMLcuzP1FRj73QcbUmLVsa98YY8hchfWFXzxSwIoCxeGLB/zwUj2VJkD
         XBwxQ+cyYBjNQ600h+evAwFZ1OLt65HUJGcUJpmVA85D7HQkZ+K30H3bPpFKF9I2Yw1q
         z0KoKfpkSySF4rYTZCfJVJhtKVzlD111gc3H1WKa8Q/MD1Jv9p/BnLJF7HmLPakalqjn
         o3L+1I37SaFaIeT5/xnuEPSgPtYTdhnauN/HwtazrkDXF4bMc6VV/ZcIlK4Yujmuwk1C
         DHpBpJaqR5zi8edf04myFs3QbYUd7plO41nm4Yp8s4FTqpW065/T1vc+FfbG7kLDH/Ve
         Giqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731478614; x=1732083414;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dWsx5nJGnXXSk2Ufj1TPsNBwAQF6kKooyg82zNLy88=;
        b=gMID74y4Avhc93R+i8Ob8KnY/vBDwZ9zcXUILpsQRDdAaxLBFprCys4RttuDBy80Vw
         oBsP6bcZIEoD3Ahwul8tRvRb9W25Eh4ZLXSDUenoyVcCC4g2f8ExD/7g6qLiX1Yi7Ue1
         8E+fScpxgqaw72LBzKxd5M2wB1LkS5dim0vGfdhESzlrZ3xtpSAdxBqQDzqJqf2iT/hg
         gcMNsMlltp09cp7nAHK4bWvR5jLqc83oYVi4beO89NibBRpDEpAOdOTXbq1T8oJ8M98L
         xlBRigtyzfub9fE0Da6lEsZS2Q0QCu28HfCVi3fjCqLio1SADGUaXe2G4rKWIcoU5vK1
         VHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUoH7BxShGe/kwLnrtg+VYdARKTEW4A1I4H+HflTKnSszXwlSkMRdJXPiR8l7nnPIEy/FfSfM010URO@lists.infradead.org, AJvYcCX+XQxQfA/DUfax5ZKk6Fea9BVdLPf9TW5TLZhrieCvUeFeGiTc2s3xFJT72l9xlQywAK/bO/MB+xSmX/xaHzMh@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVKcoSCmhJhyRHQEiCLsDICmQ44PhzpmCXoMhkciR3sJkFQAx
	rbb1fYiBcV11qPWpuI9IItBJGeRWNN3eancHW3tqVGvnHlBTSbPokoKHXg==
X-Google-Smtp-Source: AGHT+IEDrczFgFYUt0SpNxIqMdH27qTt4lLwgzyYo/TRfEHiJZ3LxPGin4/itPwqN0UbsgxzaBid1Q==
X-Received: by 2002:a17:90b:524e:b0:2e2:d859:1603 with SMTP id 98e67ed59e1d1-2e9f2d5c5a7mr1978413a91.25.1731478614156;
        Tue, 12 Nov 2024 22:16:54 -0800 (PST)
Received: from [172.19.1.53] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3ec86d2sm642280a91.21.2024.11.12.22.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 22:16:53 -0800 (PST)
Message-ID: <245b6c20-d7c1-438a-8b8f-d80a2e5d2807@gmail.com>
Date: Wed, 13 Nov 2024 14:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH v8 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241023092617.108021-1-hpchen0nvt@gmail.com>
 <20241023092617.108021-3-hpchen0nvt@gmail.com> <87y11p1vhx.fsf@bootlin.com>
Content-Language: en-US
In-Reply-To: <87y11p1vhx.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_221655_679975_B1788EC7 
X-CRM114-Status: GOOD (  22.25  )
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

Dear Miquel,

Thank you for your reply.


On 2024/11/12 上午 02:22, Miquel Raynal wrote:
> Hello,
>
>> +static int ma35_nand_attach_chip(struct nand_chip *chip)
>> +{
>> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
>> +	struct ma35_nand_chip *nvtnand = to_ma35_nand(chip);
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct device *dev = mtd->dev.parent;
>> +	u32 reg;
>> +
>> +	if (chip->options & NAND_BUSWIDTH_16) {
>> +		dev_err(dev, "16 bits bus width not supported");
>> +		return -EINVAL;
>> +	}
>> +
>> +	nvtnand->nchunks = mtd->writesize / chip->ecc.steps;
>> +	nvtnand->nchunks = (nvtnand->nchunks < 4) ? 1 : nvtnand->nchunks / 4;
> This second division looks broken. Also, you probably don't want to do
> that outside of the ON_HOST situation. Finally, you should probably
> update chip->ecc.steps and chip->ecc.size to your final choice.

Regarding these two lines, I will remove them and instead set them in 
ma35_nand_hwecc_init().

However, since the nchunks is actually used to get the ECC status 
register count,

I will rename nchunks to eccstatus and perform the calculation using 
ecc.steps.


>> +
>> +	reg = readl(nand->regs + MA35_NFI_REG_NANDCTL) & (~PSIZE_MASK);
>> +	if (mtd->writesize == 2048)
>> +		writel(reg | PSIZE_2K, nand->regs + MA35_NFI_REG_NANDCTL);
>> +	else if (mtd->writesize == 4096)
>> +		writel(reg | PSIZE_4K, nand->regs + MA35_NFI_REG_NANDCTL);
>> +	else if (mtd->writesize == 8192)
>> +		writel(reg | PSIZE_8K, nand->regs + MA35_NFI_REG_NANDCTL);
>> +
>> +	switch (chip->ecc.engine_type) {
>> +	case NAND_ECC_ENGINE_TYPE_ON_HOST:
>> +		chip->options |= NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA;
> What is the reason for refusing subpage writes? This is not something
> you can do later, so unless there is a good reason, please do not set
> this flag.

I will remove the NAND_NO_SUBPAGE_WRITE flag.


>> +		chip->ecc.write_page = ma35_nand_write_page_hwecc;
>> +		chip->ecc.read_page  = ma35_nand_read_page_hwecc;
>> +		chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
>> +		return ma35_nand_hwecc_init(chip, nand);
>> +	case NAND_ECC_ENGINE_TYPE_NONE:
>> +	case NAND_ECC_ENGINE_TYPE_SOFT:
>> +	case NAND_ECC_ENGINE_TYPE_ON_DIE:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> ...
>
>> +static int ma35_nand_chip_init(struct device *dev, struct ma35_nand_info *nand,
>> +				 struct device_node *np)
>> +{
>> +	struct ma35_nand_chip *nvtnand;
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	int nsels;
>> +	u32 tmp;
>> +	int ret;
>> +	int i;
>> +
>> +	if (!of_get_property(np, "reg", &nsels))
> Please convert to device_property_ helpers. And remove the of include
> once you no longer need it.

I will use device_property_read_u32 instead.


>> +		return -ENODEV;
>> +
>> +	nsels /= sizeof(u32);
>> +	if (!nsels || nsels > MA35_MAX_NSELS) {
>> +		dev_err(dev, "invalid reg property size %d\n", nsels);
>> +		return -EINVAL;
>> +	}
>> +
>> +	nvtnand = devm_kzalloc(dev, struct_size(nvtnand, sels, nsels),
>> +			      GFP_KERNEL);
>> +	if (!nvtnand)
>> +		return -ENOMEM;
>> +
>> +	nvtnand->nsels = nsels;
>> +	for (i = 0; i < nsels; i++) {
>> +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
>> +		if (ret) {
>> +			dev_err(dev, "reg property failure : %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		if (tmp >= MA35_MAX_NSELS) {
>> +			dev_err(dev, "invalid CS: %u\n", tmp);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (test_and_set_bit(tmp, &nand->assigned_cs)) {
>> +			dev_err(dev, "CS %u already assigned\n", tmp);
>> +			return -EINVAL;
>> +		}
>> +
>> +		nvtnand->sels[i] = tmp;
>> +	}
>> +
> ...
>
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret) {
>> +		dev_err(dev, "MTD parse partition error\n");
> probably useless error message?

I will remove this error message.


>> +		nand_cleanup(chip);
>> +		return ret;
>> +	}
>> +
>> +	list_add_tail(&nvtnand->node, &nand->chips);
>> +
>> +	return 0;
>> +}
> I believe next iteration should be the one, I'm rather happy with the
> overall look.

Hope so, thank you!


> Thanks,
> Miquèl

Best regards,

Hui-Ping Chen



