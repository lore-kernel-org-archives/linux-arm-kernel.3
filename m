Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCF5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ius48xpF/Q52UbEJhkb3b+cG1v9KO7V1b2R8m4riPc4=; b=VFOcEsQY+czC4OFfB0rIhDf1hR
	spzx2jp+/ZXu0QnlqzLloXhKdoHPaE0IInaQ79agTuSr0oKZg3FhT4rqIqY+V1+ZMAemdAvzXkNIV
	xMBn3dIFHkJacC+vd966EQUFtL45ftfcB+X8vZLl/MN2+2i6rwZ6UXqrYeWY42C4h7Y5oY4aKwH4e
	DF1KEJZck/TaCiK0c9nERgnZicqn1hDBenp3OxVagW6T1+m0pZ4Ly84ks9Yxqjt395lXQdbi8yiq8
	FmkbQqEOmW/AcVWoASouLuTIJDEgU+Hw9tvg/XTcygFSDQoPqfVutR/cp/c4G4L/nw0zay8AkvE6E
	fUVfYgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfrV-0000000C5oS-4A0n;
	Mon, 06 Jul 2026 09:43:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfrT-0000000C5nZ-1cut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:43:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-46ed4f66256so2560121f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331013; x=1783935813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ius48xpF/Q52UbEJhkb3b+cG1v9KO7V1b2R8m4riPc4=;
        b=OevKKbhg9n5QdiK8DAre0WGkl4XAGqMRHR5Q8/oN14hgoOBhlVgAJEWjaMsq68VlXX
         xG/JSSMY7L7Tr/CYcqbXL2UBa3YA2lgX0RMLARJyC1lVSkiWsm0M8wqxs8bHQil5m9hu
         7+1OxTzn3Dz3xcDMRsKR0bjIFiTgOs9mgEO2kazZ6ShDlmD4Zt1N9YomDacmOaLjkOcN
         Pd4BjU79fCzZHjzwK0KLxmlI2b+uBeXMzCzqMTeDIP2h1CKWzScKaiEStBK+MZ/EPD+C
         tpNS8pfWOsacToNLRuKYloTtRrdTHiaVyGe2xd56SMz6fVvYp8N3MKH967Xckvgr8hTm
         ocjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331013; x=1783935813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ius48xpF/Q52UbEJhkb3b+cG1v9KO7V1b2R8m4riPc4=;
        b=XTURhq08zcCAMEqprJR0gjQ7kkEGMOaglYobTELSvwHz+KHQyoFUFLtnhuW/qbtwdX
         cd1n1SHRlcC/yDB1mjWxMlgEl4gDjqi1foQ0+bxTjtG5LVyy2G9XOuIgF4SI7CTRD1BS
         KIxK+DuEI2KWuwm/eo0H8aVOz9TExSjlEq6e861AA0MTrHJIZIo98fubLx//VteOnzlN
         zj46POpxA1QX4cblJZEGnOEK/wslMkWKxJrAzoQSJYMZHxDSRHhQcsHCrL93UCpMcYM1
         DiyjerxXdcPA5mLCKW1JrtRjpLbCfeTPMuxfSG97ZNMZXYI3+8/8/MCnhNb0v8o2r5kX
         Kfdg==
X-Gm-Message-State: AOJu0YzqCV1rxmX+hE4aqCgXt6m1c8SYH0OW/zL+Qex8XO20G9BRYuev
	iHqR4C1+7s4Ckro0lGtcxMPVEwhpz458NSE5oqQXegKN2mTdMddR3EnjpdPl6GwMTTI=
X-Gm-Gg: AfdE7clotkuRJict2al8CBqnr9ANmyT09qCWpyYIOHeSJmk351O4mjefIoRq+2RKj6P
	cTjrkSDu5fK4zrZA4Vs8TUomTX5Q85JrshVruivc7DwI1POUQ+ny3UMPFsW0Wmo+zXN+5m3YLTz
	bZ8HYAmYrYqcai2X1QfxhMp+1IJHdoCflmO+VFLTjcWX7MobKdO/EMfu7WjwE55ZEV8vmU6Z6Db
	Pfj3yHvbyatRJowv8kp8HdvEWKp1pYIECRUXdUvuQOl4veqC3JDMUjVTcVA7TiXRFRud3FOMPy5
	WWeh6lorJmCGmxI4s6vDxS5epUR8amSd4dBoRJrB51NG66/cZteEcXvXTOi4o/RvYKWizy9Mnao
	ZBFNmSCZUEKXJ62fLM7d/Gz9W7oUBJtAF18NjFW+Tv4hv84H4IBnAVw+IVazRsyPJWOuxxbOeYa
	+7wiQptTD+hfiiz4QLaPHnvjwh3YGrymAy0lK0sbGhU/YTZ3apmSEnNdiTTl09
X-Received: by 2002:a05:6000:420d:b0:474:ad57:1720 with SMTP id ffacd0b85a97d-47aae0da45fmr12468300f8f.43.1783331012745;
        Mon, 06 Jul 2026 02:43:32 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm24266171f8f.0.2026.07.06.02.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:43:32 -0700 (PDT)
Message-ID: <67fa35d6-548f-4d52-8164-d31433fd1b1c@suse.com>
Date: Mon, 6 Jul 2026 11:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: s32g: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Chester Lin
 <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 xsFNBFP1zgUBEAC21D6hk7//0kOmsUrE3eZ55kjc9DmFPKIz6l4NggqwQjBNRHIMh04BbCMY
 fL3eT7ZsYV5nur7zctmJ+vbszoOASXUpfq8M+S5hU2w7sBaVk5rpH9yW8CUWz2+ZpQXPJcFa
 OhLZuSKB1F5JcvLbETRjNzNU7B3TdS2+zkgQQdEyt7Ij2HXGLJ2w+yG2GuR9/iyCJRf10Okq
 gTh//XESJZ8S6KlOWbLXRE+yfkKDXQx2Jr1XuVvM3zPqH5FMg8reRVFsQ+vI0b+OlyekT/Xe
 0Hwvqkev95GG6x7yseJwI+2ydDH6M5O7fPKFW5mzAdDE2g/K9B4e2tYK6/rA7Fq4cqiAw1+u
 EgO44+eFgv082xtBez5WNkGn18vtw0LW3ESmKh19u6kEGoi0WZwslCNaGFrS4M7OH+aOJeqK
 fx5dIv2CEbxc6xnHY7dwkcHikTA4QdbdFeUSuj4YhIZ+0QlDVtS1QEXyvZbZky7ur9rHkZvP
 ZqlUsLJ2nOqsmahMTIQ8Mgx9SLEShWqD4kOF4zNfPJsgEMB49KbS2o9jxbGB+JKupjNddfxZ
 HlH1KF8QwCMZEYaTNogrVazuEJzx6JdRpR3sFda/0x5qjTadwIW6Cl9tkqe2h391dOGX1eOA
 1ntn9O/39KqSrWNGvm+1raHK+Ev1yPtn0Wxn+0oy1tl67TxUjQARAQABzSRNYXR0aGlhcyBC
 cnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT7CwXgEEwECACIFAlV6iM0CGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAAAoJENkUC7JWEwLx6isQAIMGBgJnFWovDS7ClZtjz1LgoY8skcMU
 ghUZY4Z/rwwPqmMPbY8KYDdOFA+kMTEiAHOR+IyOVe2+HlMrXv/qYH4pRoxQKm8H9FbdZXgL
 bG8IPlBu80ZSOwWjVH+tG62KHW4RzssVrgXEFR1ZPTdbfN+9Gtf7kKxcGxWnurRJFzBEZi4s
 RfTSulQKqTxJ/sewOb/0kfGOJYPAt/QN5SUaWa6ILa5QFg8bLAj6bZ81CDStswDt/zJmAWp0
 08NOnhrZaTQdRU7mTMddUph5YVNXEXd3ThOl8PetTyoSCt04PPTDDmyeMgB5C3INLo1AXhEp
 NTdu+okvD56MqCxgMfexXiqYOkEWs/wv4LWC8V8EI3Z+DQ0YuoymI5MFPsW39aPmmBhSiacx
 diC+7cQVQRwBR6Oz/k9oLc+0/15mc+XlbvyYfscGWs6CEeidDQyNKE/yX75KjLUSvOXYV4d4
 UdaNrSoEcK/5XlW5IJNM9yae6ZOL8vZrs5u1+/w7pAlCDAAokz/As0vZ7xWiePrI+kTzuOt5
 psfJOdEoMKQWWFGd/9olX5ZAyh9iXk9TQprGUOaX6sFjDrsTRycmmD9i4PdQTawObEEiAfzx
 1m2MwiDs2nppsRr7qwAjyRhCq2TOAh0EDRNgYaSlbIXX/zp38FpK/9DMbtH14vVvG6FXog75
 HBoOzsFNBF3VOUgBEACbvyZOfLjgfB0hg0rhlAfpTmnFwm1TjkssGZKvgMr/t6v1yGm8nmmD
 MIa4jblx41MSDkUKFhyB80wqrAIB6SRX0h6DOLpQrjjxbV46nxB5ANLqwektI57yenr/O+ZS
 +GIuiSTu1kGEbP5ezmpCYk9dxqDsAyJ+4Rx/zxlKkKGZQHdZ+UlXYOnEXexKifkTDaLne6Zc
 up1EgkTDVmzam4MloyrA/fAjIx2t90gfVkEEkMhZX/nc/naYq1hDQqGN778CiWkqX3qimLqj
 1UsZ6qSl6qsozZxvVuOjlmafiVeXo28lEf9lPrzMG04pS3CFKU4HZsTwgOidBkI5ijbDSimI
 CDJ+luKPy6IjuyIETptbHZ9CmyaLgmtkGaENPqf+5iV4ZbQNFxmYTZSN56Q9ZS6Y3XeNpVm6
 FOFXrlKeFTTlyFlPy9TWcBMDCKsxV5eB5kYvDGGxx26Tec1vlVKxX3kQz8o62KWsfr1kvpeu
 fDzx/rFpoY91XJSKAFNZz99xa7DX6eQYkM2qN9K8HuJ7XXhHTxDbxpi3wsIlFdgzVa5iWhNw
 iFFJdSiEaAeaHu6yXjr39FrkIVoyFPfIJVyK4d1mHe77H47WxFw6FoVbcGTEoTL6e3HDwntn
 OGAU6CLYcaQ4aAz1HTcDrLBzSw/BuCSAXscIuKuyE/ZT+rFbLcLwOQARAQABwsF2BBgBCAAg
 FiEE5rmSGMDywyUcLDoX2RQLslYTAvEFAl3VOUgCGwwACgkQ2RQLslYTAvG11w/+Mcn28jxp
 0WLUdChZQoJBtl1nlkkdrIUojNT2RkT8UfPPMwNlgWBwJOzaSZRXIaWhK1elnRa10IwwHfWM
 GhB7nH0u0gIcSKnSKs1ebzRazI8IQdTfDH3VCQ6YMl+2bpPz4XeWqGVzcLAkamg9jsBWV6/N
 c0l8BNlHT5iH02E43lbDgCOxme2pArETyuuJ4tF36F7ntl1Eq1FE0Ypk5LjB602Gh2N+eOGv
 hnbkECywPmr7Hi5o7yh8bFOM52tKdGG+HM8KCY/sEpFRkDTA28XGNugjDyttOI4UZvURuvO6
 quuvdYW4rgLVgAXgLJdQEvpnUu2j/+LjjOJBQr12ICB8T/waFc/QmUzBFQGVc20SsmAi1H9c
 C4XB87oE4jjc/X1jASy7JCr6u5tbZa+tZjYGPZ1cMApTFLhO4tR/a/9v1Fy3fqWPNs3F4Ra3
 5irgg5jpAecT7DjFUCR/CNP5W6nywKn7MUm/19VSmj9uN484vg8w/XL49iung+Y+ZHCiSUGn
 LV6nybxdRG/jp8ZQdQQixPA9azZDzuTu+NjKtzIA5qtfZfmm8xC+kAwAMZ/ZnfCsKwN0bbnD
 YfO3B5Q131ASmu0kbwY03Mw4PhxDzZNrt4a89Y95dq5YkMtVH2Me1ZP063cFCCYCkvEAK/C8
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_024335_456725_A87D4623 
X-CRM114-Status: GOOD (  16.66  )
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



On 04/07/2026 14:20, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/rtc/rtc-s32g.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> index 3a0818e972eb..86716192d10f 100644
> --- a/drivers/rtc/rtc-s32g.c
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -366,6 +366,7 @@ static const struct of_device_id rtc_dt_ids[] = {
>   	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>   	{ /* sentinel */ },
>   };
> +MODULE_DEVICE_TABLE(of, rtc_dt_ids);
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>   			 s32g_rtc_suspend, s32g_rtc_resume);
> 


