Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C16EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 01:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=; b=gNzVpGbSvIWWa4BSF+Hs1y99ki
	iHYJJ50FHpAfaFQf86zEmAjwcpdpNjQNyohg8JhUtpBQykwKoGRTvad3i2dLYhe/w3NovGQVrTmt9
	FdLPc5yyeRxKuplhKsevojQ3iGKN+36VIE04FTofu6SZFMFP/ZFDo+K59vh7LRMBEnoPfQONBnySH
	pUCf0gnOLRw4XP7OsovUN/Lp/vibuo8FpG35/56+nrRTxlK7nqVc3yba3/9wPVtbqhydvI3K4G8ec
	giFahUkUom9J1maJdor+0tKjtHz1Xsp/07USL8DjsqnqYJ3McchzAe2WpMd45n1B6Q0sJUr66qdhU
	oNwfH1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72cx-00000005X2g-1C4D;
	Tue, 22 Apr 2025 01:40:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72b3-00000005Woe-34m6;
	Tue, 22 Apr 2025 01:38:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22435603572so46870745ad.1;
        Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745285928; x=1745890728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=hUqLqQaZNpDvg09FglxdjCPLmHA1I/ADrHb7M1RSaVDO/yhEWGfj2fzLpANyhFQdpH
         lr8ArvXHfBwIAhl3ycFT4vbKQSfVVqkZOUCevOasK3BfC9xkxLmICPBIuSKqcUN7ofv2
         S+2k8PtD5tJUETrMFToTu2MlaZUmdOV29KCtRa6YG9Dksfgi+Ii9TOt1PEgOKsZy1IJF
         MbGITpvVHtoxrIzd7v11AQ9LUCsxgLb4LVCsc8+R7pGmaMNxefgjTPzyPSAt2IhKZQGp
         0kNyyoHaOwhd3rmldZSoJ67CfcYP30gIA0EwYQTalVMJVV0JUbcbmffpinrZHAEY2nl6
         CuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745285928; x=1745890728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pihn7LwUvtVfN0XhK8Z3OEivWDjRGoVE90mOrmOu+so=;
        b=IfqdPDtI+cPRMZg8GWbdsV6ObFQ6ViaxAqvp8VAw28AtUVMsSnLnGZp6a4K3ceFmYU
         gRQF4Hs/lKf3aTzyB8TG9B4sohnx0O1q/yen5XdE4/HhflcrQO+xhPiFOyNu2fz9sO0y
         sBXuLntSCa9LXuDmAYYqMzbOnzRXF8vYe2mb3PxamRpmJSKQzvPgH7VsVVKqeOSEO31a
         1ZE+//k8RWhkdjc/fOgQwjD4YUsu3ZOm883cHBbn6CztGV3TxkLEkPXKP0Zj0Cn5/nEc
         cqgqRQ5XM7XriTCxrKSADaZRYkydX7kP1Ei5EtiY0gb5etFcBL+Fgb22iqpTyEEfJZef
         JuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsBUgggl+uIrrserPRbPUUgMhR9GHzN6CVthWpuojFG3Czuuy/a6MEpPrpKPEWbD1ZZ7Uahyp63uRGcVMDErlT@lists.infradead.org, AJvYcCWNyJsN8JVe+7PRGcvP832EQcigzDt3zIXfFKywd3qJB8h2NlvOhmuI3Dfa6AF07JhA5560n4jwVT00OrtHCRs=@lists.infradead.org, AJvYcCXSm8hGGRE9GjQYC0awBH3guGkLXeuZzQJ025mQzadXiy+UWe/mXE1AtvlZxYd2+l5OeOoVGpbmjKVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ17LEMGUDQ0G4f347GpuoCVP1QTTZdxvmv2JG63zmYceoy7/H
	elatRERo5tCWupZRCD65YCMnyyaodMCsNyG+DAfPk4jZq+gJkR0G
X-Gm-Gg: ASbGncsbxGb0iPQb+HbV735DjrrMH6RH4x2jF9uxp2IUgeGo4LuwWNTjRDph4OXMorx
	EsZ04HoiFoLSW7l79fMlukTyNYGvEAqtbjSlbGpR8h5vEvHtMHKCC6O5DZc72t2FRb5DnAhlCdS
	TsrWSRyrTs/yzrzWb4P5GwK4PPBqTO8qh+SPfGv1eaD6+zbe08NfsuLbcLEF7811bx20Frq4ycE
	z7P7l7y1EJaqWNioVBPyfqX/R83Pej+23u7zuQGFjBepPbRBwJvPbM/RN3hKFzZBq5PHTEWA5Q0
	dlKHtZ3ChsjMqAPkNeqq/cZFlr+8yf4+wMjWoOcbjWN46qD8nNxwqobz
X-Google-Smtp-Source: AGHT+IFnOJAIOYBHLa4wObdFkR0uD9Ygi2NKzxRE1wPLcAvg5M8KaAp2Fh+vAO/hoWG+KYGbLiD78Q==
X-Received: by 2002:a17:902:f60b:b0:224:826:277f with SMTP id d9443c01a7336-22c536041a9mr197018305ad.33.1745285928302;
        Mon, 21 Apr 2025 18:38:48 -0700 (PDT)
Received: from [192.168.98.254] ([104.28.254.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eceb74sm72112005ad.166.2025.04.21.18.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 18:38:47 -0700 (PDT)
Message-ID: <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
Date: Tue, 22 Apr 2025 09:38:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Daniel Golle <daniel@makrotopia.org>, Chia-Lin Kao
 <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Pratyush Yadav <pratyush@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Content-Language: en-US
In-Reply-To: <871pymtab3.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_183849_794382_1EE948B2 
X-CRM114-Status: GOOD (  20.38  )
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

Hello!
在 2024/12/5 23:32, Miquel Raynal 写道:
> Hello,
> 
> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:
> 
>> From: Sky Huang <skylake.huang@mediatek.com>
>>
>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com>
>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
>> Chuanhong recommmends that we can use the following sequence in
>> spinand_write_to_cache_op():
>>
>> x1 mode:
>> 02H(program data load) -> 84H(random program data load) -> 84H ...
>>
>> x4 mode:
>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H ...
>>
>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
>> data to it. For those SPI controllers which can't finish transmission
>> in single step, 84H or 34H will be triggered for the rest data.
>>
>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G and
>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
>> using 84H or 34H. Or users may encounter program failure issue. This issue
>> is not always reproducible, but it may occur and cause system instability.
>>
>> This sequence should work on all SPI-NANDs nowadays. I also check with
>> Foresee that the sequence can solve the above program failure issue.
>>
>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight SPI
>> controller which can only transmit 1024 bytes.
>>
>> The test step is the following:
>> - mtd erase /dev/mtd2
>> - dd if=/dev/zero bs=2048 count=1 | tr '\0' '\xA5' > output.bin
>> - mtd write output.bin /dev/mtd2
>>
>> Before applying this patch, write operation uses only 34H(update_cache):
>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xa5
>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xa5
>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xa5
>> [78.962966] OP code: 0x10, addr val: 0x300
>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xff
>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xff
>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xff
>> [78.992527] OP code: 0x10, addr val: 0x301
>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st byte: 0xff
>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st byte: 0xff
>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st byte: 0xff
>> [79.019435] OP code: 0x10, addr val: 0x302
> 
> I am sorry but above you said that we should not perform:
> 
>      0x32, 0x32, 0x32...
> 
> because the second time it would clear the cache again. And here
> you tell us that actually the core already handles that by performing
> instead:
> 
>      0x34, 0x34, 0x34...
> 
> So what is the problem?
> 
> Or maybe I misunderstood the issue, but I think Chuanhong raised an
> issue that is already solved? Isn't it?
> 

The issue is that the FORESEE NANDs require the first cache writing 
instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a 
command sequence of:
     0x32, 0x34, 0x34, 0x34...
This patch does exactly that, making the first instruction issued 0x32.
It should be applied to fix the issue above.

---
Regards,
Chuanhong Guo


