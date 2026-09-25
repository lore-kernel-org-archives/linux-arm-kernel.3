Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E20C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 03:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gpAHbVztnmaeibXEmaS5rZnQ0hRzh9vSUw3IhTR+Og=; b=V2ejixuw/kx7a9bqhYm2soVba+
	8OUgHgYYCCP6n5tH+jV8/nfYJPwASWSitgaXHcU5HQDa8wkbkqoamM3aPYHYchmhVmYghs4V6VVAk
	E7gUdVgNiUBUVYVCFm32TOTbQYqU6yo5Aq0+udJ/2kmeB4rNUmUtDIo7+0usIUTfhclxTnL6PAdz1
	uibPXozpmN8qfq4tK4nAh7aRJ0Zg8oBMo09QV1potaVZW6fgZyCm2Uuk1Bo3InHY8pWIQwX5lq6M6
	AtjzvKwCXqVdiNwlEll+mkmnA01hkGzEnH+5i2twuWH6c8qxJaOzSpWDjfJIF4OUhcM2s4EE3HOJk
	AjhWNkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vuV-0000000CYYe-2nVT;
	Fri, 25 Sep 2026 02:43:39 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vuS-0000000CYXp-3l1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 02:43:38 +0000
X-QQ-mid: zesmtpgz7t1790304168tdb809021
X-QQ-Originating-IP: w3XVdAtjPMZd2A4bnKpct9MNG2vg7Sbf9tEaRwle0Gc=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 25 Sep 2026 10:42:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 965729528590291737
EX-QQ-RecipientCnt: 9
Message-ID: <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>
Date: Fri, 25 Sep 2026 10:40:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, qinyungao@kylinsec.com.cn
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
 <20260924162404.GN200420@e132581.arm.com>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <20260924162404.GN200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Ns4vsXN8dJBsIxuMhu7o/4WgHbz7725FQkvC/bpT+bpmLQi4VqWqDDC+
	XLlGH0Txezz0QT3XZbMZj0nk+fe2pMsyh5n3oHQPDTQW67zCLAHoaQvE/YphbuLG5FqDSDx
	40vqVO9UxzMjNSesxwc/noP9509r8MDNDPNp2C/FK2OaZP7WIgAWzVT8CmORcGjOq8Wlimq
	7qhWm0Nw4G7mZjHjTAGGl7/VljrWWU8JrvrKMeEKNzb92NgQEMU5ad+WVHtIa2AdGT4gMzZ
	mHf4AeSHVKl6EDP5eI/4Mur4LnMUQzvi/4gkK6E4TxVRLS+yc+tWvacfIWXLe1lxnJWWly6
	HugMNXkEUORIb/VWMifNsB1d3Bo2+pVjgq3LuWkfSMVwa/Mm8mFEnwdK4pf15ZV06XSwxm1
	ECKc8dQWLQnhT4OwYWRTuUEV6jBs0TU2Fb3H/1OMHyGNBWLPUayWtrdxLbmHwygxNGGDS2k
	rn44XyCgXOcoZc3xP38ElerOmHmPpaDS6ryhPmr+mUU2zsrM2aZfkUBonjP2tPwQQRciLon
	RPQ76wLPMV9HLvYtY+Wd5Fwiyx18WCczQVwVYIkzv5jd/eHwv5uuXp6vcmbgKPV9mJ5Vnup
	Qy/jOUIdmHKZbsOwIwww3p3C/Hb121JHdmGef5vBz1yB2pfMNFEftdvS7CCbtQ5dvxsoGLk
	QZ8J88qa+++duD9/kDKXqbS/yuPevzN2d5Nx+V7kLT/CVJ4PG/l9vadQbrluDC9Z/3z/Sob
	/ru68IF+LN2cDRtMg2UuiDsPZJqFDFBRhrhPR2cb0JHMMlIyh0/B9yXKrL8l3QwAFxeKvcm
	BxHixVZZgCWam1HLZbn/5RzZ2PQWamu0moFPoWG6RQrJWx2EZRuzD6X2oDKRH5GPVbiCGCz
	wbYxZ+ZgEpEEtsT/Q2Ue3KlG3OFNZ9IXh5qKtfyam+oO3ZadQBGT2yH458/G83xys54iRQT
	RtMePukVMs0cpbQlXfmOdg4SMx6R008S+2xoCVTjchJyqM2i0zVUXg3J/FLNE3zeTUYmWmA
	G2/PGDt9MhtUTDXFJTuQQNNBDNuTM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_194337_482687_1070AFD2 
X-CRM114-Status: GOOD (  10.97  )
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


On 25/09/2026 00:24, Leo Yan wrote:
> For this patch:
>
> Reviewed-by: Leo Yan<leo.yan@arm.com>
>
> Sashiko reported an issue for null pointer dereference if configfs
> init fails fails [1]. It is good to fix it using a separate patch:
>
> @@ -1299,8 +1299,10 @@ int __init cscfg_init(void)
>
>          /* initialise configfs subsystem */
>          err = cscfg_configfs_init(cscfg_mgr);
> -       if (err)
> -               goto exit_err;
> +       if (err) {
> +               device_unregister(cscfg_device());
> +               return err;
> +       }
>
>          /* preload built-in configurations */
>          err = cscfg_preload(THIS_MODULE);
>
> @Yingchao, do you mind to work out a formal patch for this?
Happy to. I'll send the patch.

Thanks,
Yingchao


